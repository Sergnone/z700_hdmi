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


int Driver_Init()
{
	V_VTC_Init();
	V_TPG_Init();
	return(XST_SUCCESS);
}

void videoStreamConf(XVidC_VideoStream VidStream)
{
	V_TPG_ConfigStream(&VidStream);
	V_VTC_ConfigStream(&VidStream);
}

int main()
{
	int status;
	XVidC_VideoStream VidStream;

	xil_printf("=========================================================\r\n");
	xil_printf("Start Drivers\r\n");
	status = Driver_Init();
	if(status != XST_SUCCESS)
	{
		return(XST_FAILURE);
	}
	VidStream.VmId = XVIDC_VM_720_60_P;

    xil_printf("DynClk: Initializing ...\r\n");
	DynClkSetClk(DYNCLK_BASEADDR, (double)(XVidC_GetPixelClockHzByVmId(VidStream.VmId)/1000000));

	xil_printf("\r\nTest: %s\r\n", XVidC_GetVideoModeStr(VidStream.VmId));
	status = V_TPG_Clock_Config(VidStream.VmId);
	if(status != XST_SUCCESS)
	{
		return(XST_FAILURE);
	}
	videoStreamConf(VidStream);
	usleep(300000);
	xil_printf("Successfully ran Example\r\n");
	return 0;
}
