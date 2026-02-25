#include "v_vtc.h"
#include <stdio.h>


XL_Vtc					vtc;
XL_Vtc_Config			*vtc_Config;
XL_Vtc_Timing			vtc_timing;


//XVidC_VideoStream VidStream;


int V_VTC_Init(void)
{
    int Status = -1;
	vtc_Config = XL_Vtc_LookupConfig(XPAR_V_TC_0_BASEADDR);
	if(vtc_Config == NULL)
	{
		printf("ERR:: VTC device not found\r\n");
		return(XST_DEVICE_NOT_FOUND);
	}
	Status = XL_Vtc_CfgInitialize(&vtc, vtc_Config, vtc_Config->BaseAddress);
	if(Status != XST_SUCCESS)
	{
		printf("ERR:: VTC Initialization failed %d\r\n", Status);
		return(XST_FAILURE);
	}
    return(XST_SUCCESS);
}


void V_VTC_Config(XL_VidC_VideoMode videoMode, uint16_t pixClock)
{
	XL_VidC_VideoTiming const *timing =XL_VidC_GetTimingInfo(videoMode);
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
	XL_Vtc_SetGeneratorTiming(&vtc, &vtc_timing);
	XL_Vtc_Enable(&vtc);
	XL_Vtc_EnableGenerator(&vtc);
	XL_Vtc_RegUpdateEnable(&vtc);
}



void V_VTC_ConfigStream(XL_VidC_VideoStream *StreamPtr)
{
  XL_Vtc_Timing vtc_timing = {0};
  uint16_t PixelsPerClock = StreamPtr->PixPerClk;
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
  XL_Vtc_SetGeneratorTiming(&vtc, &vtc_timing);
  XL_Vtc_Enable(&vtc);
  XL_Vtc_EnableGenerator(&vtc);
  XL_Vtc_RegUpdateEnable(&vtc);
  printf("INFO: VTC configured\r\n");
}