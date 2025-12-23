#include "stdint.h"
#include "stdbool.h"
#include "xv_tpg.h"
#include "sleep.h"
#include "xparameters.h"


#include "xvtc.h"
#include <stdint.h>

#include "xv_frmbufrd_l2.h"
#include "xv_frmbufwr_l2.h"


#if defined(__MICROBLAZE__) || defined(__riscv)
#ifndef  SDT
#define DDR_BASEADDR XPAR_MIG7SERIES_0_BASEADDR
#else
#define DDR_BASEADDR XPAR_MIG_0_BASEADDRESS
#endif
#else
#define DDR_BASEADDR XPAR_DDR_MEM_BASEADDR
#endif

#define XVFRMBUFRD_BUFFER_BASEADDR (DDR_BASEADDR + (0x20000000))
#define XVFRMBUFWR_BUFFER_BASEADDR (DDR_BASEADDR + (0x21000000))
#define CHROMA_ADDR_OFFSET   (0x01000000U)
#define V_CHROMA_ADDR_OFFSET (0x03000000U)


#define XPAR_V_FRMBUF_RD_0_DEVICE_ID                  0
#define XPAR_V_FRMBUF_WR_0_DEVICE_ID                  0
#define DYNCLK_BASEADDR XPAR_AXI_DYNCLK_0_BASEADDR
#define DISP_VTC_ID 0





XVtc vtc;
XV_tpg tpg;
XVidC_VideoStream VidStream;
XVidC_VideoTiming const *TimingPtr;
XV_FrmbufRd_l2     frmbufrd;
XV_frmbufrd_Config frmbufrd_cfg;
XV_FrmbufWr_l2     frmbufwr;
XV_frmbufwr_Config frmbufwr_cfg;
XVtc_Timing vtc_timing = {0};


//--------------------------------------------------------------------------------
#define NUM_TEST_MODES                1
#define NUM_TEST_FORMATS              1
//mapping between memory and streaming video formats
typedef struct {
  XVidC_ColorFormat MemFormat;
  XVidC_ColorFormat StreamFormat;
  u16 FormatBits;
} VideoFormats;

VideoFormats ColorFormats[NUM_TEST_FORMATS] =
{
  //memory format            stream format        bits per component
  {XVIDC_CSF_MEM_RGB8,       XVIDC_CSF_RGB,       8},
};

XVidC_VideoMode TestModes[NUM_TEST_MODES] =
{
  XVIDC_VM_1080_60_P,
};

//--------------------------------------------------------------------------------


static uint32_t CalcStride(XVidC_ColorFormat Cfmt,
                      u16 AXIMMDataWidth,
                      XVidC_VideoStream *StreamPtr)
{
  u32 stride;
  int width = StreamPtr->Timing.HActive;
  u16 MMWidthBytes = AXIMMDataWidth/8;
  u8 bpp_numerator;
  u8 bpp_denominator = 1;

  switch (Cfmt) {
    case XVIDC_CSF_MEM_Y_UV10:
    case XVIDC_CSF_MEM_Y_UV10_420:
    case XVIDC_CSF_MEM_Y10:
	case XVIDC_CSF_MEM_Y_U_V10:
      /* 4 bytes per 3 pixels (Y_UV10, Y_UV10_420, Y10, Y_U_V10) */
      bpp_numerator = 4;
      bpp_denominator = 3;
      break;
    case XVIDC_CSF_MEM_Y_UV8:
    case XVIDC_CSF_MEM_Y_UV8_420:
    case XVIDC_CSF_MEM_Y8:
    case XVIDC_CSF_MEM_Y_U_V8:
      /* 1 byte per pixel (Y_UV8, Y_UV8_420, Y8, Y_U_V8) */
      bpp_numerator = 1;
      break;
    case XVIDC_CSF_MEM_RGB8:
    case XVIDC_CSF_MEM_YUV8:
    case XVIDC_CSF_MEM_BGR8:
      /* 3 bytes per pixel (RGB8, YUV8, BGR8) */
      bpp_numerator = 3;
      break;
    case XVIDC_CSF_MEM_RGBX12:
    case XVIDC_CSF_MEM_YUVX12:
      /* 5 bytes per pixel (RGBX12, YUVX12) */
      bpp_numerator = 5;
      break;
    case XVIDC_CSF_MEM_Y_UV12:
    case XVIDC_CSF_MEM_Y_UV12_420:
    case XVIDC_CSF_MEM_Y12:
      /* 3 bytes per 2 pixels (Y_UV12, Y_UV12_420, Y12) */
      bpp_numerator = 3;
      bpp_denominator = 2;
      break;
    case XVIDC_CSF_MEM_RGB16:
    case XVIDC_CSF_MEM_YUV16:
      /* 6 bytes per pixel (RGB16, YUV16) */
      bpp_numerator = 6;
      break;
    case XVIDC_CSF_MEM_YUYV8:
    case XVIDC_CSF_MEM_UYVY8:
    case XVIDC_CSF_MEM_Y_UV16:
    case XVIDC_CSF_MEM_Y_UV16_420:
    case XVIDC_CSF_MEM_Y16:
      /* 2 bytes per pixel (YUYV8, UYVY8, Y_UV16, Y_UV16_420, Y16) */
      bpp_numerator = 2;
      break;
    default:
      /* 4 bytes per pixel */
      bpp_numerator = 4;
  }
  stride = ((((width * bpp_numerator) / bpp_denominator) +
    MMWidthBytes - 1) / MMWidthBytes) * MMWidthBytes;

  return(stride);
}


static int ConfigFrmbufRd(u32 StrideInBytes,
                        XVidC_ColorFormat Cfmt,
                        XVidC_VideoStream *StreamPtr)
{
  int Status;

  /* Stop Frame Buffers */
  XVFrmbufRd_Stop(&frmbufrd);
  //resetIp();
  XVFrmbufRd_WaitForIdle(&frmbufrd);

  /* Configure  Frame Buffers */
  Status = XVFrmbufRd_SetMemFormat(&frmbufrd, StrideInBytes, Cfmt, StreamPtr);
  if (Status != XST_SUCCESS) {
    xil_printf("ERROR:: Unable to configure Frame Buffer Read\r\n");
    return(XST_FAILURE);
  }

  Status = XVFrmbufRd_SetBufferAddr(&frmbufrd, XVFRMBUFRD_BUFFER_BASEADDR);
  if (Status != XST_SUCCESS) {
    xil_printf("ERROR:: Unable to configure Frame Buffer Read buffer address\r\n");
    return(XST_FAILURE);
  }

  /* Set Chroma Buffer Address for semi-planar color formats */
  if ((Cfmt == XVIDC_CSF_MEM_Y_UV8) || (Cfmt == XVIDC_CSF_MEM_Y_UV8_420) ||
      (Cfmt == XVIDC_CSF_MEM_Y_UV10) || (Cfmt == XVIDC_CSF_MEM_Y_UV10_420) ||
      (Cfmt == XVIDC_CSF_MEM_Y_U_V8) || (Cfmt == XVIDC_CSF_MEM_Y_U_V10) ||
      (Cfmt == XVIDC_CSF_MEM_Y_U_V8_420)) {
	  Status = XVFrmbufRd_SetChromaBufferAddr(&frmbufrd, XVFRMBUFRD_BUFFER_BASEADDR+CHROMA_ADDR_OFFSET);
	  if (Status != XST_SUCCESS) {
		  xil_printf("ERROR:: Unable to configure Frame Buffer Read buffer address\r\n");
		  return(XST_FAILURE);
	  }
  }

  if ((Cfmt == XVIDC_CSF_MEM_Y_U_V8) || (Cfmt == XVIDC_CSF_MEM_Y_U_V10) || (Cfmt == XVIDC_CSF_MEM_Y_U_V8_420)) {
	  Status = XVFrmbufRd_SetVChromaBufferAddr(&frmbufrd, XVFRMBUFRD_BUFFER_BASEADDR+V_CHROMA_ADDR_OFFSET);
	  if (Status != XST_SUCCESS) {
		  xil_printf("ERROR:: Unable to configure Frame Buffer Read buffer V address\r\n");
		  return(XST_FAILURE);
	  }
  }

  /* Enable Interrupt */
  XVFrmbufRd_InterruptEnable(&frmbufrd, XVFRMBUFRD_IRQ_DONE_MASK);

  /* Start Frame Buffers */
  XVFrmbufRd_Start(&frmbufrd);
  xil_printf("INFO: FRMBUF RD configured\r\n");
  return(Status);
}


static int ConfigFrmbufWr(u32 StrideInBytes,
                        XVidC_ColorFormat Cfmt,
                        XVidC_VideoStream *StreamPtr)
{
  int Status;

  XVFrmbufWr_Stop(&frmbufwr);
  XVFrmbufWr_WaitForIdle(&frmbufwr);
  Status = XVFrmbufWr_SetMemFormat(&frmbufwr, StrideInBytes, Cfmt, StreamPtr);
  if (Status != XST_SUCCESS) {
    xil_printf("ERROR:: Unable to configure Frame Buffer Write\r\n");
    return(XST_FAILURE);
  }

  Status = XVFrmbufWr_SetBufferAddr(&frmbufwr, XVFRMBUFWR_BUFFER_BASEADDR);
  if (Status != XST_SUCCESS) {
    xil_printf("ERROR:: Unable to configure Frame Buffer Write buffer address\r\n");
    return(XST_FAILURE);
  }

  /* Set Chroma Buffer Address for semi-planar color formats */
  if ((Cfmt == XVIDC_CSF_MEM_Y_UV8) || (Cfmt == XVIDC_CSF_MEM_Y_UV8_420) ||
      (Cfmt == XVIDC_CSF_MEM_Y_UV10) || (Cfmt == XVIDC_CSF_MEM_Y_UV10_420) ||
      (Cfmt == XVIDC_CSF_MEM_Y_UV12) || (Cfmt == XVIDC_CSF_MEM_Y_UV12_420) ||
      (Cfmt == XVIDC_CSF_MEM_Y_UV16) || (Cfmt == XVIDC_CSF_MEM_Y_UV16_420) ||
      (Cfmt == XVIDC_CSF_MEM_Y_U_V8) || (Cfmt == XVIDC_CSF_MEM_Y_U_V10) ||
      (Cfmt == XVIDC_CSF_MEM_Y_U_V8_420)) {
	  Status = XVFrmbufWr_SetChromaBufferAddr(&frmbufwr, XVFRMBUFWR_BUFFER_BASEADDR+CHROMA_ADDR_OFFSET);
	  if (Status != XST_SUCCESS) {
		  xil_printf("ERROR:: Unable to configure Frame Buffer Write chroma buffer address\r\n");
		  return(XST_FAILURE);
	  }
  }

  if ((Cfmt == XVIDC_CSF_MEM_Y_U_V8) || (Cfmt == XVIDC_CSF_MEM_Y_U_V10) || (Cfmt == XVIDC_CSF_MEM_Y_U_V8_420)) {
	  Status = XVFrmbufWr_SetVChromaBufferAddr(&frmbufwr, XVFRMBUFWR_BUFFER_BASEADDR+V_CHROMA_ADDR_OFFSET);
	  if (Status != XST_SUCCESS) {
		  xil_printf("ERROR:: Unable to configure Frame Buffer Write V buffer address\r\n");
		  return(XST_FAILURE);
	  }
  }

  XVFrmbufWr_InterruptEnable(&frmbufwr, XVFRMBUFRD_IRQ_DONE_MASK);

  XVFrmbufWr_Start(&frmbufwr);

  xil_printf("INFO: FRMBUF WR configured\r\n");
  return(Status);
}



int VTC_Init(void)
{
	int Status;
	XVtc_Config *vtcConfig;
	vtcConfig = XVtc_LookupConfig(DISP_VTC_ID);
	if (NULL == vtcConfig)
  {
		return (XST_FAILURE);
	}
	Status = XVtc_CfgInitialize(&vtc, vtcConfig, vtcConfig->BaseAddress);
	if (Status != (XST_SUCCESS))
  {
		return (XST_FAILURE);
	}
	return XST_SUCCESS;
}

int TPG_Init(void)
{
	XV_tpg_Initialize(&tpg, 0);
    XV_tpg_Set_width(&tpg, 1920);
    XV_tpg_Set_height(&tpg, 1080);
    XV_tpg_Set_ZplateHorContDelta(&tpg, 2);
    XV_tpg_Set_ZplateHorContStart(&tpg, 2);
    XV_tpg_Set_ZplateVerContDelta(&tpg, 2);
    XV_tpg_Set_ZplateVerContStart(&tpg, 2);
    XV_tpg_Set_motionSpeed(&tpg, 2);
    XV_tpg_Set_motionEn(&tpg, 1);
    XV_tpg_EnableAutoRestart(&tpg);
	return 0;
}


int FRB_Init(void)
{
  int Status;
  Status = XVFrmbufRd_Initialize(&frmbufrd, XPAR_V_FRMBUF_RD_0_DEVICE_ID);
  if (Status != XST_SUCCESS)
  {
    xil_printf("ERROR:: Frame Buffer Read initialization failed\r\n");
    return(XST_FAILURE);
  }
  Status = XVFrmbufWr_Initialize(&frmbufwr, XPAR_V_FRMBUF_WR_0_DEVICE_ID);
  if (Status != XST_SUCCESS) {
    xil_printf("ERROR:: Frame Buffer Write initialization failed\r\n");
    return(XST_FAILURE);
  }
  return(XST_SUCCESS);
}


int VTC_Config(XVidC_VideoStream *StreamPtr)
{
    u16 PixelsPerClock = StreamPtr->PixPerClk;
    vtc_timing.HActiveVideo  = StreamPtr->Timing.HActive/PixelsPerClock;
    vtc_timing.HFrontPorch   = StreamPtr->Timing.HFrontPorch/PixelsPerClock;
    vtc_timing.HSyncWidth    = StreamPtr->Timing.HSyncWidth/PixelsPerClock;
    vtc_timing.HBackPorch    = StreamPtr->Timing.HBackPorch/PixelsPerClock;
    vtc_timing.HSyncPolarity = StreamPtr->Timing.HSyncPolarity;
    vtc_timing.VActiveVideo  = StreamPtr->Timing.VActive;
    vtc_timing.V0FrontPorch  = StreamPtr->Timing.F0PVFrontPorch;
    vtc_timing.V0SyncWidth   = StreamPtr->Timing.F0PVSyncWidth;
    vtc_timing.V0BackPorch   = StreamPtr->Timing.F0PVBackPorch;
    vtc_timing.VSyncPolarity = StreamPtr->Timing.VSyncPolarity;
    XVtc_SetGeneratorTiming(&vtc, &vtc_timing);
    XVtc_Enable(&vtc);
    XVtc_EnableGenerator(&vtc);
    XVtc_RegUpdateEnable(&vtc);
    xil_printf("INFO: VTC configured\r\n");
    return 0;
}

void PrintDebug_VTC(XVtc_Timing *vtc_tim)
{
    printf("-HActiveVideo %d\r\n", vtc_tim->HActiveVideo);
    printf("-HFrontPorch %d\r\n", vtc_tim->HFrontPorch);
    printf("-HSyncWidth %d\r\n", vtc_tim->HSyncWidth);
    printf("-HBackPorch %d\r\n", vtc_tim->HBackPorch);
    printf("-HSyncPolarity %d\r\n", vtc_tim->HSyncPolarity);
    printf("-VActiveVideo %d\r\n", vtc_tim->VActiveVideo);
    printf("-V0FrontPorch %d\r\n", vtc_tim->V0FrontPorch);
    printf("-V0SyncWidth %d\r\n", vtc_tim->V0SyncWidth);
    printf("-V0BackPorch %d\r\n", vtc_tim->V0BackPorch);
    printf("-VSyncPolarity %d\r\n", vtc_tim->VSyncPolarity);
}



int DriverInit(void)
{
    VTC_Init();
    TPG_Init();
    FRB_Init();
    return(XST_SUCCESS);
}

int main()
{
    int format = 0;
    int index = 0;
    int pattern = 9;
    int stride = 0;
    XVidC_ColorFormat Cfmt;

	  print("-------------------------------------\r\n");
    DriverInit();
    //XVFrmbufRd_DbgReportStatus(&frmbufrd);

    //VidStream.PixPerClk     = 1;
    //VidStream.ColorDepth    = 8;
    VidStream.PixPerClk     = frmbufrd.FrmbufRd.Config.PixPerClk;
    VidStream.ColorDepth    = frmbufrd.FrmbufRd.Config.MaxDataWidth;
    printf("PixPerClk %d\r\n", VidStream.PixPerClk);
    printf("ColorDepth %d\r\n", VidStream.ColorDepth);
    format = 0;
    index = 0;
    Cfmt = ColorFormats[format].MemFormat;
    VidStream.ColorFormatId = ColorFormats[format].StreamFormat;
    VidStream.VmId = TestModes[index];
    TimingPtr = XVidC_GetTimingInfo(VidStream.VmId);
    VidStream.Timing = *TimingPtr;
    VidStream.FrameRate = XVidC_GetFrameRate(VidStream.VmId);
  
    VTC_Config(&VidStream);
    PrintDebug_VTC(&vtc_timing);

    stride = CalcStride(Cfmt,
                        frmbufrd.FrmbufRd.Config.AXIMMDataWidth,
                        &VidStream);
    printf("Stride %d\r\n", stride);
    ConfigFrmbufRd(stride, Cfmt, &VidStream);
    ConfigFrmbufWr(stride, Cfmt, &VidStream);
    XV_tpg_Start(&tpg);
	  print("Successfully ran TPG application...\r\n");
    XV_tpg_Set_bckgndId(&tpg, pattern);

    return 0;
}
