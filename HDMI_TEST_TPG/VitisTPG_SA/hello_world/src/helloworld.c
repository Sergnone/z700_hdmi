#include "stdint.h"
#include "stdbool.h"
#include "xv_tpg.h"
#include "sleep.h"
#include "xparameters.h"


#include "xvtc.h"
#include "xv_frmbufrd_l2.h"
#include <stdint.h>

#define BYTES_PIXEL 3

#define DISPLAY_WIDTH           1920
#define DISPLAY_HEIGHT          1080

#define DEMO_MAX_FRAME (DISPLAY_WIDTH*DISPLAY_HEIGHT*BYTES_PIXEL)
#define DEMO_STRIDE (DISPLAY_WIDTH * BYTES_PIXEL)

#define DYNCLK_BASEADDR XPAR_AXI_DYNCLK_0_BASEADDR
#define VGA_VDMA_ID 0
#define DISP_VTC_ID 0

#define XPAR_V_TC_0_DEVICE_ID				0
#define XPAR_V_FRMBUF_RD_0_DEVICE_ID		0

typedef struct {
	char label[64]; /* Label describing the resolution */
	u32 width; /*Width of the active video frame*/
	u32 height; /*Height of the active video frame*/
	u32 hps; /*Start time of Horizontal sync pulse, in pixel clocks (active width + H. front porch)*/
	u32 hpe; /*End time of Horizontal sync pulse, in pixel clocks (active width + H. front porch + H. sync width)*/
	u32 hmax; /*Total number of pixel clocks per line (active width + H. front porch + H. sync width + H. back porch) */
	u32 hpol; /*hsync pulse polarity*/
	u32 vps; /*Start time of Vertical sync pulse, in lines (active height + V. front porch)*/
	u32 vpe; /*End time of Vertical sync pulse, in lines (active height + V. front porch + V. sync width)*/
	u32 vmax; /*Total number of lines per frame (active height + V. front porch + V. sync width + V. back porch) */
	u32 vpol; /*vsync pulse polarity*/
	double freq; /*Pixel Clock frequency*/
} VideoMode;


static const VideoMode VMODE_1080P = {
	.label = "1920x1080@60Hz",
	.width = 1920,
	.height = 1080,
	.hps = 2008,
	.hpe = 2052,
	.hmax = 2199,
	.hpol = 1,
	.vps = 1084,
	.vpe = 1089,
	.vmax = 1124,
	.vpol = 1,
	.freq = 148.5 //148.57 is close enough
};

#define NUM_TEST_FORMATS        1
#define NUM_TEST_MODES          1
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

XVtc vtc;
XVtc_Timing vtcTiming;
XV_tpg tpg;
VideoMode vMode;
XV_FrmbufRd_l2     frmbufrd;
XV_frmbufrd_Config frmbufrd_cfg;
VideoMode vMode;
XVidC_VideoStream VidStream;


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


int VTC_Init(void)
{
	int Status;
	XVtc_Config *vtcConfig;
	vMode = VMODE_1080P;
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
	vtcTiming.HActiveVideo = vMode.width;
	vtcTiming.HFrontPorch = vMode.hps - vMode.width;
	vtcTiming.HSyncWidth = vMode.hpe - vMode.hps;
	vtcTiming.HBackPorch = vMode.hmax - vMode.hpe + 1;
	vtcTiming.HSyncPolarity = vMode.hpol;
	vtcTiming.VActiveVideo = vMode.height;
	vtcTiming.V0FrontPorch = vMode.vps - vMode.height;
	vtcTiming.V0SyncWidth = vMode.vpe - vMode.vps;
	vtcTiming.V0BackPorch = vMode.vmax - vMode.vpe + 1;
	vtcTiming.V1FrontPorch = vMode.vps - vMode.height;
	vtcTiming.V1SyncWidth = vMode.vpe - vMode.vps;
	vtcTiming.V1BackPorch = vMode.vmax - vMode.vpe + 1;
	vtcTiming.VSyncPolarity = vMode.vpol;
	vtcTiming.Interlaced = 0;

	XVtc_SelfTest(&vtc);
	XVtc_RegUpdateEnable(&vtc);
	XVtc_SetGeneratorTiming(&vtc, &vtcTiming);
	XVtc_EnableGenerator(&vtc);
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
  return(XST_SUCCESS);
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
    int pattern = 9;
    print("--------------------------\r\n");
	  DriverInit();
    XVFrmbufRd_DbgReportStatus(&frmbufrd);

    VidStream.PixPerClk     = frmbufrd.FrmbufRd.Config.PixPerClk;
    VidStream.ColorDepth    = frmbufrd.FrmbufRd.Config.MaxDataWidth;

    
    XV_tpg_Start(&tpg);
    print("Successfully ran TPG application\r\n");
    XV_tpg_Set_bckgndId(&tpg, pattern);
    return 0;
}
