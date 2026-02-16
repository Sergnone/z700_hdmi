#include "v_vtc.h"

XVtc				vtc;
XVtc_Config			*vtc_Config;
XVtc_Timing			vtc_timing;


//XVidC_VideoStream VidStream;


int V_VTC_Init(void)
{
    int Status = -1;
#ifndef SDT
	vtc_Config = XVtc_LookupConfig(XPAR_V_TC_0_DEVICE_ID);
#else
	vtc_Config = XVtc_LookupConfig(XPAR_V_TC_0_BASEADDR);
#endif
	if(vtc_Config == NULL)
	{
		xil_printf("ERR:: VTC device not found\r\n");
		return(XST_DEVICE_NOT_FOUND);
	}
	Status = XVtc_CfgInitialize(&vtc, vtc_Config, vtc_Config->BaseAddress);
	if(Status != XST_SUCCESS)
	{
		xil_printf("ERR:: VTC Initialization failed %d\r\n", Status);
		return(XST_FAILURE);
	}
	xil_printf("VTC: Initialized OK\r\n");
    return(XST_SUCCESS);
}


void V_VTC_Config(XVidC_VideoMode videoMode, uint32_t pixClock)
{
	XVidC_VideoTiming const *timing = XVidC_GetTimingInfo(videoMode);
	vtc_timing.HActiveVideo  = timing->HActive/pixClock;
	vtc_timing.HFrontPorch   = timing->HFrontPorch/pixClock;
	vtc_timing.HSyncWidth    = timing->HSyncWidth/pixClock;
	vtc_timing.HBackPorch    = timing->HBackPorch/pixClock;
	vtc_timing.HSyncPolarity = timing->HSyncPolarity;
	vtc_timing.VActiveVideo  = timing->VActive;
	vtc_timing.V0FrontPorch  = timing->F0PVFrontPorch;
	vtc_timing.V0SyncWidth   = timing->F0PVSyncWidth;
	vtc_timing.V0BackPorch   = timing->F0PVBackPorch;
	vtc_timing.VSyncPolarity = timing->VSyncPolarity;

	xil_printf("vtc---------------------------------------:\r\n");
	xil_printf("vtc.HActiveVideo: %d\r\n", vtc_timing.HActiveVideo);
	xil_printf("vtc.HFrontPorch: %d\r\n", vtc_timing.HFrontPorch);
	xil_printf("vtc.HSyncWidth: %d\r\n", vtc_timing.HSyncWidth);
	xil_printf("vtc.HBackPorch: %d\r\n", vtc_timing.HBackPorch);
	xil_printf("vtc.HSyncPolarity: %d\r\n", vtc_timing.HSyncPolarity);
	xil_printf("vtc.VActiveVideo: %d\r\n", vtc_timing.VActiveVideo);
	xil_printf("vtc.V0FrontPorch: %d\r\n", vtc_timing.V0FrontPorch);
	xil_printf("vtc.V0SyncWidth: %d\r\n", vtc_timing.V0SyncWidth);
	xil_printf("vtc.V0BackPorch: %d\r\n", vtc_timing.V0BackPorch);
	xil_printf("vtc.V1FrontPorch: %d\r\n", vtc_timing.V1FrontPorch);
	xil_printf("vtc.V1SyncWidth: %d\r\n", vtc_timing.V1SyncWidth);
	xil_printf("vtc.V1BackPorch: %d\r\n", vtc_timing.V1BackPorch);
	xil_printf("vtc.VSyncPolarity: %d\r\n", vtc_timing.VSyncPolarity);

	XVtc_SetGeneratorTiming(&vtc, &vtc_timing);
	XVtc_Enable(&vtc);
	XVtc_EnableGenerator(&vtc);
	XVtc_RegUpdateEnable(&vtc);
}



void V_VTC_ConfigStream(XVidC_VideoStream *StreamPtr)
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

	xil_printf("vtc---------------------------------------:\r\n");
	xil_printf("vtc.HActiveVideo: %d\r\n", vtc_timing.HActiveVideo);
	xil_printf("vtc.HFrontPorch: %d\r\n", vtc_timing.HFrontPorch);
	xil_printf("vtc.HSyncWidth: %d\r\n", vtc_timing.HSyncWidth);
	xil_printf("vtc.HBackPorch: %d\r\n", vtc_timing.HBackPorch);
	xil_printf("vtc.HSyncPolarity: %d\r\n", vtc_timing.HSyncPolarity);
	xil_printf("vtc.VActiveVideo: %d\r\n", vtc_timing.VActiveVideo);
	xil_printf("vtc.V0FrontPorch: %d\r\n", vtc_timing.V0FrontPorch);
	xil_printf("vtc.V0SyncWidth: %d\r\n", vtc_timing.V0SyncWidth);
	xil_printf("vtc.V0BackPorch: %d\r\n", vtc_timing.V0BackPorch);
	xil_printf("vtc.V1FrontPorch: %d\r\n", vtc_timing.V1FrontPorch);
	xil_printf("vtc.V1SyncWidth: %d\r\n", vtc_timing.V1SyncWidth);
	xil_printf("vtc.V1BackPorch: %d\r\n", vtc_timing.V1BackPorch);
	xil_printf("vtc.VSyncPolarity: %d\r\n", vtc_timing.VSyncPolarity);
  
  XVtc_SetGeneratorTiming(&vtc, &vtc_timing);
  XVtc_Enable(&vtc);
  XVtc_EnableGenerator(&vtc);
  XVtc_RegUpdateEnable(&vtc);
  xil_printf("INFO: VTC configured\r\n");
}