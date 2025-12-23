#include "stdint.h"
#include "stdbool.h"
#include "xv_tpg.h"
#include "sleep.h"
#include "xparameters.h"


#include "xvtc.h"
#include "xvidc.h"

#define DYNCLK_BASEADDR XPAR_AXI_DYNCLK_0_BASEADDR
#define DISP_VTC_ID 0


XVtc vtc;
XV_tpg tpg;
XVidC_VideoStream VidStream;
XVidC_VideoTiming const *TimingPtr;


//--------------------------------------------------------------------------------
#define NUM_TEST_MODES                1
#define NUM_TEST_FORMATS              1
//mapping between memory and streaming video formats
typedef struct {
  XVidC_ColorFormat MemFormat;
  XVidC_ColorFormat StreamFormat;
  u16 FormatBits;
} VideoFormats;

VideoFormats ColorFormats=
{
  .MemFormat = XVIDC_CSF_MEM_RGB8,
  .StreamFormat = XVIDC_CSF_RGB,
  .FormatBits = 8
};

XVidC_VideoMode TestModes = XVIDC_VM_1080_60_P;

//--------------------------------------------------------------------------------
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

int VTC_Config(XVidC_VideoStream *StreamPtr)
{
    XVtc_Timing vtc_timing = {0};
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


void DriverInit(void)
{
	VTC_Init();
	TPG_Init();
}
 
int main()
{
    int pattern = 9;
    XVidC_ColorFormat Cfmt;

	  print("-------------------------------------\r\n");
    DriverInit();

    VidStream.PixPerClk     = 1;
    VidStream.ColorDepth    = 8;
    Cfmt = ColorFormats.MemFormat;
    VidStream.ColorFormatId = ColorFormats.StreamFormat;
    VidStream.VmId = TestModes;
    TimingPtr = XVidC_GetTimingInfo(VidStream.VmId);
    VidStream.Timing = *TimingPtr;
    VidStream.FrameRate = XVidC_GetFrameRate(VidStream.VmId);
  
    VTC_Config(&VidStream);
    XV_tpg_Start(&tpg);
	  print("Successfully ran TPG application\r\n");
    XV_tpg_Set_bckgndId(&tpg, pattern);

    return 0;
}
