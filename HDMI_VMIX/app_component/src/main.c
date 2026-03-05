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
#include "v_dynclk.h"
#include "v_vtc.h"
#include "v_tpg.h"
#include "v_vmix.h"
#include "v_fb_wr.h"
#include "v_fb_rd.h"
#include "v_gpio.h"

extern DDynClk				dClk;
extern XVtc					vtc;
extern XV_tpg				tpg0;
extern XV_tpg				tpg1;
extern XV_Mix_l2  			mix;

extern XV_FrmbufWr_l2     	frmbufwr;
extern XV_frmbufwr_Config 	frmbufwr_cfg;
extern XV_FrmbufRd_l2     	frmbufrd;
extern XV_frmbufrd_Config 	frmbufrd_cfg;


static const XVidC_VideoWindow MixLayerConfig[8] =
{// X   Y     W    H
  {16,  10,  128, 128},//Layer 1
  {200, 0,  128, 128}, //Layer 2
  {400, 10,  128, 128}, //Layer 3
  {600, 10,  128, 128}, //Layer 4
  {800, 100, 128, 128}, //Layer 5
  {1000,  100, 128, 128}, //Layer 6
  {200, 400, 128, 128}, //Layer 7
  {200, 600, 128, 128}  //Layer 8
};


void Display_Screen(uint32_t stride);




int main()
{
	uint32_t pix_freq = 0;
	int stride = 0;
	XVidC_VideoStream VidStream;
	XV_Mix_l2 *MixerPtr = &mix;
	XVidC_VideoStream LayerStream;
	XVidC_ColorFormat Sfmt = 0;
	XVidC_ColorFormat Mfmt = 0;
	XVidC_ColorFormat Cfmt = 0;
  	XVidC_VideoTiming const *TimingPtr;
	int layerIndex = 1;

	xil_printf("=========================================================\r\n");
	xil_printf("Start Drivers\r\n");
	V_VTC_Init();
	V_TPG_Init(&tpg0);
	V_TPG_Init(&tpg1);
	V_GPIO_Init();
	V_FBWR_Init();
	V_FBRD_Init();
	V_DDYNCLK_Init();
	V_VMIX_Init();

	VidStream.VmId = XVIDC_VM_1080_60_P;
	pix_freq = (uint32_t)(XVidC_GetPixelClockHzByVmId(VidStream.VmId));
	printf("Pix Freq: %d\r\n", pix_freq);
	VidStream.PixPerClk = pix_freq;
	DDynClk_SetRate(&dClk, pix_freq);
    DDynClk_Enable(&dClk);

	xil_printf("\r\nTest: %s\r\n", XVidC_GetVideoModeStr(VidStream.VmId));
	XVMix_GetLayerColorFormat(&mix, XVMIX_LAYER_MASTER, &Cfmt);
	Mfmt = XVIDC_CSF_MEM_RGB8;
	VidStream.PixPerClk     = tpg1.Config.PixPerClk;
	VidStream.ColorFormatId = Cfmt;
	VidStream.ColorDepth    = tpg1.Config.MaxDataWidth;
	

	TimingPtr = XVidC_GetTimingInfo(VidStream.VmId);
	VidStream.Timing = *TimingPtr;
	VidStream.FrameRate = XVidC_GetFrameRate(VidStream.VmId);
    xil_printf("\r\n********************************************\r\n");
    xil_printf("Test Input Stream: %s (%s)\r\n",
            XVidC_GetVideoModeStr(VidStream.VmId),
            XVidC_GetColorFormatStr(VidStream.ColorFormatId));
    xil_printf("********************************************\r\n");
	// Configure VTC
	V_VTC_ConfigStream(&VidStream);


	XVMix_GetLayerColorFormat(MixerPtr,layerIndex,&Sfmt);
	LayerStream.ColorFormatId = Sfmt;
	LayerStream.Timing.HActive = MixLayerConfig[layerIndex-1].Width;
	LayerStream.Timing.VActive = MixLayerConfig[layerIndex-1].Height;
	stride = V_FBRD_CalcStride(Mfmt,
                            frmbufrd.FrmbufRd.Config.AXIMMDataWidth,
                            &LayerStream);
	xil_printf("Stride is: %d\r\n", stride);
	// Configure Frame Buffer
	V_FBRD_ConfigBuf(stride, Mfmt, &LayerStream);
	V_FBWR_ConfigBuf(stride, Mfmt, &VidStream);
	//Configure Mixer
	V_VMIX_ConfigStream(&VidStream);
	//Configure Tpg
	V_TPG_ConfigStream(&tpg1, &VidStream);
	printf("Successfully ran Example\r\n");
	return 0;
}

/*--------------------------------------------------------------------*/
/*
int main(void)
{
	uint32_t pix_freq = 0;
	int stride = 0;
	XVidC_ColorFormat Mfmt = 0;
	XVidC_ColorFormat Sfmt = 0;
	XVidC_VideoTiming const *TimingPtr;
	XVidC_VideoStream VidStream;

	xil_printf("=========================================================\r\n");
	xil_printf("Start Drivers\r\n");
	V_VTC_Init();
	V_TPG_Init();
	V_GPIO_Init();
	V_FBWR_Init();
	V_FBRD_Init();
	V_DDYNCLK_Init();
	
	VidStream.VmId = XVIDC_VM_1080_60_P;
	pix_freq = (uint32_t)(XVidC_GetPixelClockHzByVmId(VidStream.VmId));
	printf("Pix Freq: %d\r\n", pix_freq);
	VidStream.PixPerClk = pix_freq;
	DDynClk_SetRate(&dClk, pix_freq);
    DDynClk_Enable(&dClk);
	
	xil_printf("\r\nTest: %s\r\n", XVidC_GetVideoModeStr(VidStream.VmId));
	V_TPG_Clock_Config(VidStream.VmId);
	Mfmt = XVIDC_CSF_MEM_RGB8;
	Sfmt = XVIDC_CSF_RGB;
	VidStream.PixPerClk     = tpg.Config.PixPerClk;
	VidStream.ColorDepth    = tpg.Config.MaxDataWidth;
	VidStream.ColorFormatId = Sfmt;
	TimingPtr = XVidC_GetTimingInfo(VidStream.VmId);
	VidStream.Timing = *TimingPtr;
	VidStream.FrameRate = XVidC_GetFrameRate(VidStream.VmId);
	// Configure VTC
	V_VTC_ConfigStream(&VidStream);
	// Configure Frame Buffer
	stride = V_FBWR_CalcStride(Mfmt,
						frmbufwr.FrmbufWr.Config.AXIMMDataWidth,
						&VidStream);
	xil_printf("Stride is: %d\r\n", stride);
	V_FBRD_ConfigBuf(stride, Mfmt, &VidStream);
	V_FBWR_ConfigBuf(stride, Mfmt, &VidStream);
	// Configure TPG
	V_TPG_ConfigStream(&VidStream);
	printf("Successfully ran Example\r\n");
	return 0;
}
*/
/*--------------------------------------------------------------------*/
/*--------------------------------------------------------------------*/
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
/*--------------------------------------------------------------------*/
