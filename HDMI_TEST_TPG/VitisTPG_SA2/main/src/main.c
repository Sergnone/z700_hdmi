/*******************************************************************************
* Copyright (C) 2015 - 2021 Xilinx, Inc.  All rights reserved.
* Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
*******************************************************************************/

/*****************************************************************************/
/**
*
* @file main.c
*
* This file demonstrates the example usage of TPG IP available in catalogue
* Please refer v_tpg example design guide for details on HW setup
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who    Date     Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00  vyc   09/11/15   Initial Release
* 1.10  rco   10/05/15   Update to support multiple PPC configurations
* 8.0   ms    01/23/17   Modified xil_printf statement in main function to
*                        ensure that "Successfully ran" and "Failed" strings
*                        are available in all examples. This is a fix for
*                        CR-965028.
* </pre>
*
******************************************************************************/

#include "xparameters.h"
#include "sleep.h"
#include "xv_tpg.h"
#include "xvtc.h"
#include "xvidc.h"

#include "xv_frmbufrd_l2.h"
#include "xv_frmbufwr_l2.h"


#define NUM_TEST_FORMATS 29

//mapping between memory and streaming video formats
typedef struct {
  XVidC_ColorFormat MemFormat;
  XVidC_ColorFormat StreamFormat;
  u16 FormatBits;
} VideoFormats;

VideoFormats ColorFormats[NUM_TEST_FORMATS] =
{
  //memory format            stream format        bits per component
  {XVIDC_CSF_MEM_RGBX8,      XVIDC_CSF_RGB,       8},
  {XVIDC_CSF_MEM_YUVX8,      XVIDC_CSF_YCRCB_444, 8},
  {XVIDC_CSF_MEM_YUYV8,      XVIDC_CSF_YCRCB_422, 8},
  {XVIDC_CSF_MEM_RGBX10,     XVIDC_CSF_RGB,       10},
  {XVIDC_CSF_MEM_YUVX10,     XVIDC_CSF_YCRCB_444, 10},
  {XVIDC_CSF_MEM_Y_UV8,      XVIDC_CSF_YCRCB_422, 8},
  {XVIDC_CSF_MEM_Y_UV8_420,  XVIDC_CSF_YCRCB_420, 8},
  {XVIDC_CSF_MEM_RGB8,       XVIDC_CSF_RGB,       8},
  {XVIDC_CSF_MEM_YUV8,       XVIDC_CSF_YCRCB_444, 8},
  {XVIDC_CSF_MEM_Y_UV10,     XVIDC_CSF_YCRCB_422, 10},
  {XVIDC_CSF_MEM_Y_UV10_420, XVIDC_CSF_YCRCB_420, 10},
  {XVIDC_CSF_MEM_Y8,         XVIDC_CSF_YONLY, 8},
  {XVIDC_CSF_MEM_Y10,        XVIDC_CSF_YONLY, 10},
  {XVIDC_CSF_MEM_BGRX8,      XVIDC_CSF_RGB,       8},
  {XVIDC_CSF_MEM_UYVY8,      XVIDC_CSF_YCRCB_422, 8},
  {XVIDC_CSF_MEM_BGR8,       XVIDC_CSF_RGB,       8},
  {XVIDC_CSF_MEM_RGBX12,     XVIDC_CSF_RGB,       12},
  {XVIDC_CSF_MEM_RGB16,      XVIDC_CSF_RGB,       16},
  {XVIDC_CSF_MEM_YUVX12,     XVIDC_CSF_YCRCB_444, 12},
  {XVIDC_CSF_MEM_YUV16,      XVIDC_CSF_YCRCB_444, 16},
  {XVIDC_CSF_MEM_Y_UV12,     XVIDC_CSF_YCRCB_422, 12},
  {XVIDC_CSF_MEM_Y_UV16,     XVIDC_CSF_YCRCB_422, 16},
  {XVIDC_CSF_MEM_Y_UV12_420, XVIDC_CSF_YCRCB_420, 12},
  {XVIDC_CSF_MEM_Y_UV16_420, XVIDC_CSF_YCRCB_420, 16},
  {XVIDC_CSF_MEM_Y12,        XVIDC_CSF_YONLY, 12},
  {XVIDC_CSF_MEM_Y16,        XVIDC_CSF_YONLY, 16},
  {XVIDC_CSF_MEM_Y_U_V8,     XVIDC_CSF_YCRCB_444, 8},
  {XVIDC_CSF_MEM_Y_U_V10,    XVIDC_CSF_YCRCB_444, 10},
  {XVIDC_CSF_MEM_Y_U_V8_420, XVIDC_CSF_YCRCB_420, 8}
};


XV_tpg_Config		*tpg_Config;
XV_tpg				tpg;


XVtc				vtc;
XVtc_Config			*vtc_Config;
XVtc_Timing			vtc_timing;

XVidC_VideoStream 	VidStream;

u32 volatile		*gpio_hlsIpReset;
u32 volatile		*gpio_videoLockMonitor;

XV_FrmbufWr_l2     frmbufwr;
XV_frmbufwr_Config frmbufwr_cfg;


#define XPAR_VIDEO_CLK_WIZ_BASEADDR			0
#define VideoClockGen_WriteReg(RegOffset, Data) \
    Xil_Out32((XPAR_VIDEO_CLK_WIZ_BASEADDR) + (RegOffset), (u32)(Data))
#define VideoClockGen_ReadReg(RegOffset) \
    Xil_In32((XPAR_VIDEO_CLK_WIZ_BASEADDR) + (RegOffset))

int driverInit()
{
	int status;

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
	status = XVtc_CfgInitialize(&vtc, vtc_Config, vtc_Config->BaseAddress);
	if(status != XST_SUCCESS)
	{
		xil_printf("ERR:: VTC Initialization failed %d\r\n", status);
		return(XST_FAILURE);
	}

#ifndef SDT
	tpg_Config = XV_tpg_LookupConfig(XPAR_V_TPG_0_DEVICE_ID);
#else
	tpg_Config = XV_tpg_LookupConfig(XPAR_V_TPG_0_BASEADDR);
#endif
	if(tpg_Config == NULL)
	{
		xil_printf("ERR:: TPG device not found\r\n");
		return(XST_DEVICE_NOT_FOUND);
	}
	status = XV_tpg_CfgInitialize(&tpg, tpg_Config, tpg_Config->BaseAddress);
	if(status != XST_SUCCESS)
	{
		xil_printf("ERR:: TPG Initialization failed %d\r\n", status);
		return(XST_FAILURE);
	}

#ifndef SDT
  status = XVFrmbufWr_Initialize(&frmbufwr, XPAR_V_FRMBUF_WR_0_DEVICE_ID);
#else
  status = XVFrmbufWr_Initialize(&frmbufwr, XPAR_V_FRMBUF_WR_0_BASEADDR);
#endif
  if (status != XST_SUCCESS) {
    xil_printf("ERROR:: Frame Buffer Write initialization failed\r\n");
    return(XST_FAILURE);
  }

	return(XST_SUCCESS);
}

void videoIpConfig(XVidC_VideoStream *StreamPtr)
{
	XVtc_Timing vtc_timing = {0};
	u16 PixelsPerClock = StreamPtr->PixPerClk;

	XV_tpg_Set_height(&tpg, StreamPtr->Timing.VActive);
	XV_tpg_Set_width(&tpg, StreamPtr->Timing.HActive);
	XV_tpg_Set_colorFormat(&tpg, 0);
	XV_tpg_Set_bckgndId(&tpg, XTPG_BKGND_COLOR_BARS);
	XV_tpg_Set_ovrlayId(&tpg, 0);
	XV_tpg_WriteReg(tpg_Config->BaseAddress, XV_TPG_CTRL_ADDR_AP_CTRL, 0x81);
	
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
}

int videoClockConfig(XVidC_VideoMode videoMode)
{
	u32 DIVCLK_DIVIDE = 4;
	u32 CLKFBOUT_MULT = 37;
	u32 CLKFBOUT_FRAC = 125;
	u32 CLKOUT0_DIVIDE;
	u32 CLKOUT0_FRAC;
	u32 clock_config_reg_0;
	u32 clock_config_reg_2;
	//u32 timeout;
	//u32 lock;
	u16 PixelsPerClk, mode_index;

    const int ClkOut_Frac[3][XVIDC_PPC_NUM_SUPPORTED] =
    { {250, 500, 0  , 0}, //1080p
      {125, 250, 500, 0}, //4K30
      {0,   125, 250, 500}  //4K60
    };
    const int ClkOut_Div[3][XVIDC_PPC_NUM_SUPPORTED] =
    { {6, 12, 25, 50}, //1080p
      {3, 6 , 12, 25}, //4K30
      {0, 3 , 6 , 12}  //4K60
    };

    mode_index = 0;

    //map PPC to array index
    PixelsPerClk = ((tpg.Config.PixPerClk == XVIDC_PPC_8)? 3 : tpg.Config.PixPerClk>>1);
    CLKOUT0_FRAC   =  ClkOut_Frac[mode_index][PixelsPerClk];
    CLKOUT0_DIVIDE =  ClkOut_Div[mode_index][PixelsPerClk];

	clock_config_reg_0 = (1<<26) | (CLKFBOUT_FRAC<<16) | (CLKFBOUT_MULT<<8) | DIVCLK_DIVIDE;
	clock_config_reg_2 = (1<<18) | (CLKOUT0_FRAC<<8) | CLKOUT0_DIVIDE;

	VideoClockGen_WriteReg(0x200, clock_config_reg_0);
	VideoClockGen_WriteReg(0x208, clock_config_reg_2);

	usleep(300000);

	/*
	lock = VideoClockGen_ReadReg(0x4) & 0x1;
	if(!lock) //check for lock
	{
		//Video Clock Generator not locked
		VideoClockGen_WriteReg(0x25C, 0x7);
		VideoClockGen_WriteReg(0x25C, 0x2);
		timeout = 100000;
		while(!lock)
		{
			lock = VideoClockGen_ReadReg(0x4) & 0x1;
			--timeout;
			if(!timeout)
			{
				xil_printf("ERR:: Video Clock Generator failed lock\r\n");
				return(XST_FAILURE);
			}
		}
	}
	xil_printf("Video Clock Generator locked\r\n");
	*/

	return(XST_SUCCESS);

}

void resetIp(void)
{
	*gpio_hlsIpReset = 0; //reset IPs

	usleep(300000);

	*gpio_hlsIpReset = 1; // release reset

	usleep(300000);

}

int main()
{
	int status;
	XVidC_ColorFormat Cfmt;
	XVidC_VideoTiming const *TimingPtr;

	xil_printf("----Start test------\r\n");

	gpio_hlsIpReset = (u32*)XPAR_HLS_IP_RESET_BASEADDR;
	gpio_videoLockMonitor = (u32*)XPAR_VIDEO_LOCK_MONITOR_BASEADDR;
	*gpio_hlsIpReset = 1;

	status = driverInit();
	if(status != XST_SUCCESS)
	{
		return(XST_FAILURE);
	}

	resetIp();

	if(*gpio_videoLockMonitor)
	{
		xil_printf("ERR:: Video should not be locked\r\n");
		return(XST_FAILURE);
	}

    Cfmt = ColorFormats[7].MemFormat;
    VidStream.ColorFormatId = ColorFormats[7].StreamFormat;

	VidStream.VmId = XVIDC_VM_1080_60_P;
	VidStream.PixPerClk  = frmbufwr.FrmbufWr.Config.PixPerClk;
	VidStream.ColorDepth = frmbufwr.FrmbufWr.Config.MaxDataWidth;
	
	TimingPtr = XVidC_GetTimingInfo(VidStream.VmId);
	VidStream.Timing = *TimingPtr;

	xil_printf("\r\nTest: %s\r\n", XVidC_GetVideoModeStr(VidStream.VmId));
	status = videoClockConfig(VidStream.VmId);
	if(status != XST_SUCCESS)
	{
		return(XST_FAILURE);
	}
	videoIpConfig(&VidStream);

	usleep(300000);

	if(!(*gpio_videoLockMonitor))
	{
		xil_printf("ERR:: Video Lock failed for 1080P60\r\n");
		return(XST_FAILURE);
	}
	else
	{
		xil_printf("1080P60 passed\r\n");
	}

	xil_printf("Successfully ran Example\r\n");

	return 0;
}
