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

XV_tpg_Config		*tpg_Config;
XV_tpg				tpg;

XVtc				vtc;
XVtc_Config			*vtc_Config;
XVtc_Timing			vtc_timing;

u32 volatile		*gpio_hlsIpReset;
u32 volatile		*gpio_videoLockMonitor;

#define XPAR_VIDEO_CLK_WIZ_BASEADDR 0
#define VideoClockGen_WriteReg(RegOffset, Data) \
    Xil_Out32((XPAR_VIDEO_CLK_WIZ_BASEADDR) + (RegOffset), (u32)(Data))
#define VideoClockGen_ReadReg(RegOffset) \
    Xil_In32((XPAR_VIDEO_CLK_WIZ_BASEADDR) + (RegOffset))

int driverInit()
{
	int status;

	vtc_Config = XVtc_LookupConfig(0);
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

	tpg_Config = XV_tpg_LookupConfig(0);
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

	return(XST_SUCCESS);
}

void videoIpConfig(XVidC_VideoMode videoMode)
{
	XVidC_VideoTiming const *timing = XVidC_GetTimingInfo(videoMode);
	u16 PixelsPerClk;

	XV_tpg_Set_height(&tpg, timing->VActive);
	XV_tpg_Set_width(&tpg, timing->HActive);
	XV_tpg_Set_colorFormat(&tpg, 0);
	XV_tpg_Set_bckgndId(&tpg, XTPG_BKGND_COLOR_BARS);
	XV_tpg_Set_ovrlayId(&tpg, 0);
	XV_tpg_WriteReg(tpg_Config->BaseAddress, XV_TPG_CTRL_ADDR_AP_CTRL, 0x81);

	PixelsPerClk = tpg.Config.PixPerClk;

	vtc_timing.HActiveVideo  = timing->HActive/PixelsPerClk;
	vtc_timing.HFrontPorch   = timing->HFrontPorch/PixelsPerClk;
	vtc_timing.HSyncWidth    = timing->HSyncWidth/PixelsPerClk;
	vtc_timing.HBackPorch    = timing->HBackPorch/PixelsPerClk;
	vtc_timing.HSyncPolarity = timing->HSyncPolarity;
	vtc_timing.VActiveVideo  = timing->VActive;
	vtc_timing.V0FrontPorch  = timing->F0PVFrontPorch;
	vtc_timing.V0SyncWidth   = timing->F0PVSyncWidth;
	vtc_timing.V0BackPorch   = timing->F0PVBackPorch;
	vtc_timing.VSyncPolarity = timing->VSyncPolarity;
	XVtc_SetGeneratorTiming(&vtc, &vtc_timing);
	XVtc_Enable(&vtc);
	XVtc_EnableGenerator(&vtc);
	XVtc_RegUpdateEnable(&vtc);
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
	u32 lock;

    CLKOUT0_FRAC   =  250;
    CLKOUT0_DIVIDE =  6;

	clock_config_reg_0 = (1<<26) | (CLKFBOUT_FRAC<<16) | (CLKFBOUT_MULT<<8) | DIVCLK_DIVIDE;
	clock_config_reg_2 = (1<<18) | (CLKOUT0_FRAC<<8) | CLKOUT0_DIVIDE;

	VideoClockGen_WriteReg(0x200, clock_config_reg_0);
	VideoClockGen_WriteReg(0x208, clock_config_reg_2);

	usleep(300000);

	lock = VideoClockGen_ReadReg(0x4) & 0x1;
	xil_printf("Video Clock Generator locked %d\r\n", lock);

	return(XST_SUCCESS);

}

int main()
{
	int status;
	XVidC_VideoMode videoMode;
	xil_printf("Start test\r\n");
	status = driverInit();
	if(status != XST_SUCCESS) {
		return(XST_FAILURE);
	}
	videoMode = XVIDC_VM_1080_60_P;
	xil_printf("\r\nTest: %s\r\n", XVidC_GetVideoModeStr(videoMode));
	status = videoClockConfig(videoMode);
	if(status != XST_SUCCESS) {
		return(XST_FAILURE);
	}
	videoIpConfig(videoMode);
	xil_printf("Successfully ran Example\r\n");

	return 0;
}
