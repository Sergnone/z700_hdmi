/******************************************************************************
* Copyright (C) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include "display_demo.h"
#include <stdio.h>
#include "math.h"
#include <ctype.h>
#include <stdlib.h>
#include "xil_types.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "krimea_720p.h"
#include "sleep.h"
#include "v_vtc.h"
#include "v_vdma.h"
#include "v_ddynclk.h"

/*
 * XPAR redefines
 */
//#define DYNCLK_BASEADDR XPAR_AXI_DYNCLK_0_BASEADDR
#define VGA_VDMA_ID 0
#define DISP_VTC_ID 0

/* ------------------------------------------------------------ */
/*				Global Variables								*/
/* ------------------------------------------------------------ */
extern XAxiVdma 				vdma;
extern XAxiVdma_DmaSetup 		*vdma_DmaSetup;
extern XVtc						vtc;
XVidC_VideoStream 				VidStream;

/*
 * Framebuffers for video data
 */
u8 frameBuf[DISPLAY_NUM_FRAMES][DISPLAY_MAX_FRAME] __attribute__ ((aligned(64)));
u8 *pFrames[DISPLAY_NUM_FRAMES]; //array of pointers to the frame buffers

/* ------------------------------------------------------------ */
/*				Procedure Definitions							*/
/* ------------------------------------------------------------ */

void DisplayTest(uint8_t *frame, uint32_t stride)
{
	uint32_t xcoi = 0;
	uint32_t ycoi = 0;
	uint32_t iPixelAddr = 0;
	uint32_t pic_number = 0;
	for(ycoi = 0; ycoi < DISPLAY_HEIGHT; ycoi++)
	{
		for(xcoi = 0; xcoi < (DISPLAY_WIDTH * BYTES_PIXEL); xcoi+=BYTES_PIXEL)
		{
			frame[xcoi + iPixelAddr + 1] = gImage_pic[pic_number];
			pic_number+=1;
			frame[xcoi + iPixelAddr + 0] = gImage_pic[pic_number];
			pic_number+=1;
			frame[xcoi + iPixelAddr + 2] = gImage_pic[pic_number];
			pic_number+=1;
		}
		iPixelAddr += stride;
	}
	Xil_DCacheFlushRange((INTPTR) frame, DISPLAY_MAX_FRAME);
}


int main(void)
{
	int i = 0;
	uint32_t pix_freq = 0;
	XVidC_VideoTiming const *TimingPtr;

	for (i = 0; i < DISPLAY_NUM_FRAMES; i++)
	{
		pFrames[i] = frameBuf[i];
	}

	xil_printf("=========================================================\r\n");
	xil_printf("Start Drivers\r\n");
	V_VTC_Init();
	V_VDMA_Init();
	V_DDYNCLK_Init();
	VidStream.VmId = XVIDC_VM_720_60_P;
	TimingPtr = XVidC_GetTimingInfo(VidStream.VmId);
	VidStream.Timing = *TimingPtr;
	VidStream.FrameRate = XVidC_GetFrameRate(VidStream.VmId);
	pix_freq = (uint32_t)(XVidC_GetPixelClockHzByVmId(VidStream.VmId));
	vdma_DmaSetup->FrameDelay = 0;
	vdma_DmaSetup->EnableCircularBuf = 1;
	vdma_DmaSetup->EnableSync = 0;
	vdma_DmaSetup->PointNum = 0;
	vdma_DmaSetup->EnableFrameCounter = 0;
	V_DDYNCLK_Start(pix_freq);
	VidStream.PixPerClk = pix_freq;
	V_VTC_Config(VidStream.VmId, 1);
	V_DMA_ConfigStream(vdma_DmaSetup,
						&VidStream,
						(uint32_t*)pFrames[0]);
	DisplayTest(pFrames[0], 3840);
	return 0;
}




