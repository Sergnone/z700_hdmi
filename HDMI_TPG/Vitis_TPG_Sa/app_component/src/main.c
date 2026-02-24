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
#include "v_vtc.h"
#include "v_tpg.h"
#include "v_dynclk.h"
#include <stdio.h>

extern XL_Vtc					vtc;
XL_VidC_VideoStream 			VidStream;

extern DDynClk					dClk;


int main()
{
	uint32_t pix_freq = 0;
	XL_VidC_VideoTiming const *TimingPtr;
	printf("=========================================================\r\n");
	printf("Start Drivers\r\n");
	V_VTC_Init();
	V_TPG_Init();
	V_DDYNCLK_Init();
	VidStream.VmId = XVIDC_VM_1080_60_P;
	TimingPtr = XL_VidC_GetTimingInfo(VidStream.VmId);
	VidStream.Timing = *TimingPtr;
	VidStream.FrameRate = XL_VidC_GetFrameRate(VidStream.VmId);
	pix_freq = (uint32_t)(XL_VidC_GetPixelClockHzByVmId(VidStream.VmId));
	printf("Pix Freq: %d\r\n", pix_freq);
	VidStream.PixPerClk = pix_freq;
	printf("\r\nTest: %s\r\n", XL_VidC_GetVideoModeStr(VidStream.VmId));
	DDynClk_SetRate(&dClk, pix_freq);
    DDynClk_Enable(&dClk);
	V_TPG_Clock_Config(VidStream.VmId);
	V_TPG_ConfigStream(&VidStream);
	V_VTC_ConfigStream(&VidStream);
	printf("Successfully ran Example\r\n");
	return 0;
}
