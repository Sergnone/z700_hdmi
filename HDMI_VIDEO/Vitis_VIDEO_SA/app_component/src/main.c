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
#include <stdio.h>   
#include <stdlib.h>
#include "v_vtc.h"
#include "v_tpg.h"
#include "v_dynclk.h"
#include "v_fb_wr.h"
#include "v_fb_rd.h"

#include "v_gpio.h"


extern XV_FrmbufWr_l2     frmbufwr;
extern XV_frmbufwr_Config frmbufwr_cfg;

extern XV_FrmbufRd_l2     frmbufrd;
extern XV_frmbufrd_Config frmbufrd_cfg;

XL_VidC_VideoStream VidStream;

void Display_Screen(uint32_t stride);


int main()
{
	uint32_t pix_freq = 0;
	int stride = 0;
	XL_VidC_ColorFormat Cfmt;
	XL_VidC_VideoTiming const *TimingPtr;
	xil_printf("=========================================================\r\n");
	xil_printf("Start Drivers\r\n");
	V_VTC_Init();
	V_TPG_Init();
	V_GPIO_Init();
	V_FBWR_Init();
	V_FBRD_Init();
	V_DDYNCLK_Init();
	VidStream.VmId = XLVIDCVM_1080_60_P;
	TimingPtr = XL_VidC_GetTimingInfo(VidStream.VmId);
	VidStream.Timing = *TimingPtr;
	VidStream.FrameRate = XL_VidC_GetFrameRate(VidStream.VmId);
	pix_freq = (uint32_t)(XL_VidC_GetPixelClockHzByVmId(VidStream.VmId));
	printf("Pix Freq: %d\r\n", pix_freq);
	VidStream.PixPerClk = pix_freq;
	printf("\r\nTest: %s\r\n", XL_VidC_GetVideoModeStr(VidStream.VmId));
	V_DDYNCLK_Start(pix_freq);
	printf("\r\nTest: %s\r\n", XL_VidC_GetVideoModeStr(VidStream.VmId));
	V_TPG_Clock_Config(VidStream.VmId);
  	VidStream.PixPerClk  = frmbufwr.FrmbufWr.Config.PixPerClk;
  	VidStream.ColorDepth = frmbufwr.FrmbufWr.Config.MaxDataWidth;
	Cfmt = XLVIDCCSF_MEM_RGB8;
	VidStream.ColorFormatId = XLVIDCCSF_RGB;
	printf("\r\n********************************************\r\n");
	printf("Test Input Stream: %s (%s)\r\n",
				XL_VidC_GetVideoModeStr(VidStream.VmId),
				XL_VidC_GetColorFormatStr(Cfmt));
	printf("********************************************\r\n");
	// Configure VTC
	V_TPG_ConfigStream(&VidStream);
	V_VTC_ConfigStream(&VidStream);

	// Configure Frame Buffer
	stride = V_FBWR_CalcStride(Cfmt,
						frmbufwr.FrmbufWr.Config.AXIMMDataWidth,
						&VidStream);
	printf("Stride is: %d\r\n", stride);
	V_FBRD_ConfigBuf(stride, Cfmt, &VidStream);
	V_FBWR_ConfigBuf(stride, Cfmt, &VidStream);	
	printf("Successfully ran Example\r\n");
	return 0;
}


void Display_Screen(uint32_t stride)
{
	int x = 0;
	int y = 0;
	uint32_t iPixelAddr = 0;
	uint32_t *fadd = (uint32_t*)0x10000000;
	//fadd = (uint32_t*)malloc(192000);
	//memset(fadd,0xff,192000);
	
	for(y = 0; y < 600; y++)
	{
		for(x = 0; x < (900*1); x+=3)
		{
			//frame[xcoi + iPixelAddr + 0] = gImage_pic_800_600[pic_number++];
			//frame[xcoi + iPixelAddr + 1] = gImage_pic_800_600[pic_number++];
			//frame[xcoi + iPixelAddr + 2] = gImage_pic_800_600[pic_number++];
			*(fadd + (x + iPixelAddr + 0)) = 0xffffffff;
			*(fadd + (x + iPixelAddr + 1)) = 0xffffffff;
			*(fadd + (x + iPixelAddr + 2)) = 0xffffffff;
		}
		iPixelAddr += 900;
	}
}
