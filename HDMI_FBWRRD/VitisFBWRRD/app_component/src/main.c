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


//#include "_video_formats.h"

extern XV_FrmbufWr_l2     frmbufwr;
extern XV_frmbufwr_Config frmbufwr_cfg;

extern XV_FrmbufRd_l2     frmbufrd;
extern XV_frmbufrd_Config frmbufrd_cfg;

void Display_Screen(uint32_t stride);

int Driver_Init()
{
	V_VTC_Init();
	//V_TPG_Init();
	V_FBWR_Init();
	V_FBRD_Init();
	return(XST_SUCCESS);
}

void videoStreamConf(XVidC_VideoStream VidStream)
{
	//V_TPG_ConfigStream(&VidStream);
	V_VTC_ConfigStream(&VidStream);
}


int main()
{
	int format = 7;
	int index = 1;
	int valid = 0;
	int stride = 0;
	XVidC_ColorFormat Cfmt;
	XVidC_VideoTiming const *TimingPtr;
	
	int Status = -1;
	XVidC_VideoStream VidStream;
	

	XVidC_VideoMode TestModes[NUM_TEST_MODES] =
	{
		XVIDC_VM_720_60_P,
		XVIDC_VM_1080_60_P,
		XVIDC_VM_UHD_30_P,
		XVIDC_VM_UHD_60_P
	};

	xil_printf("=========================================================\r\n");
	xil_printf("Start Drivers\r\n");
	Status = Driver_Init();
	if(Status != XST_SUCCESS)
	{
		return(XST_FAILURE);
	}

	V_FBRD_SetupInterrupts();
	V_FBRD_SetCallback();
	V_FBWR_SetupInterrupts();
	V_FBWR_SetCallback();

	VidStream.VmId = XVIDC_VM_1080_60_P;
	
    xil_printf("DynClk: Initializing ...\r\n");
	DynClkSetClk(DYNCLK_BASEADDR, (double)(XVidC_GetPixelClockHzByVmId(VidStream.VmId)/1000000));
	
	//xil_printf("\r\nTest: %s\r\n", XVidC_GetVideoModeStr(VidStream.VmId));
	//Status = V_TPG_Clock_Config(VidStream.VmId);
	//if(Status != XST_SUCCESS)
	//{
	//	return(XST_FAILURE);
	//}	

  	VidStream.PixPerClk  = frmbufwr.FrmbufWr.Config.PixPerClk;
  	VidStream.ColorDepth = frmbufwr.FrmbufWr.Config.MaxDataWidth;
	Cfmt = ColorFormats[format].MemFormat;
    VidStream.ColorFormatId = ColorFormats[format].StreamFormat;
    valid = V_FBWR_ValidateCase(frmbufwr.FrmbufWr.Config.PixPerClk,
                               TestModes[index],
                               frmbufwr.FrmbufWr.Config.MaxDataWidth,
                               ColorFormats[format]);

	if (valid)
	{
		// Get mode timing parameters
		TimingPtr = XVidC_GetTimingInfo(VidStream.VmId);
		VidStream.Timing = *TimingPtr;
		VidStream.FrameRate = XVidC_GetFrameRate(VidStream.VmId);

		xil_printf("\r\n********************************************\r\n");
		xil_printf("Test Input Stream: %s (%s)\r\n",
					XVidC_GetVideoModeStr(VidStream.VmId),
					XVidC_GetColorFormatStr(Cfmt));
		xil_printf("********************************************\r\n");

		// Configure VTC
		videoStreamConf(VidStream);

		// Configure Frame Buffer
		stride = V_FBWR_CalcStride(Cfmt,
							frmbufwr.FrmbufWr.Config.AXIMMDataWidth,
							&VidStream);

		V_FBRD_ConfigBuf(stride, Cfmt, &VidStream);
		V_FBWR_ConfigBuf(stride, Cfmt, &VidStream);	
	}
	  
	//videoStreamConf(VidStream);
	usleep(500000);
	Display_Screen(stride);
	xil_printf("Successfully ran Example\r\n");
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
	
	for(y = 0; y < 1080; y++)
	{
		for(x = 0; x < (1920*2); x+=3)
		{
			//frame[xcoi + iPixelAddr + 0] = gImage_pic_800_600[pic_number++];
			//frame[xcoi + iPixelAddr + 1] = gImage_pic_800_600[pic_number++];
			//frame[xcoi + iPixelAddr + 2] = gImage_pic_800_600[pic_number++];
			*(fadd + (x + iPixelAddr + 0)) = 0x00000000;
			*(fadd + (x + iPixelAddr + 1)) = 0x00000000;
			*(fadd + (x + iPixelAddr + 2)) = 0x00000000;
		}
		iPixelAddr += stride;
	}
}
/*
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
	VidStream.VmId = XVIDC_VM_1080_60_P;

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
*/