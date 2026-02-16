#include "v_vdma.h"

XAxiVdma 			vdma;
XAxiVdma_Config 	*vdmaConfig;
XAxiVdma_DmaSetup 	*vdma_DmaSetup;

#define VGA_VDMA_ID 		0
#define DISPLAY_NUM_FRAMES	1


int V_VDMA_Init(void)
{
    int Status = -1;
#ifndef SDT
	vdmaConfig = XAxiVdma_LookupConfig(VGA_VDMA_ID);
#else
	vdmaConfig = XAxiVdma_LookupConfig(XPAR_AXI_VDMA_0_BASEADDR);
#endif
	vdmaConfig = XAxiVdma_LookupConfig(VGA_VDMA_ID);
	if(vdmaConfig == NULL)
	{
		xil_printf("ERR:: VDMA device not found\r\n");
		return(XST_DEVICE_NOT_FOUND);
	}
	Status = XAxiVdma_CfgInitialize(&vdma, vdmaConfig, vdmaConfig->BaseAddress);
	if(Status != XST_SUCCESS)
	{
		xil_printf("ERR:: VDMA Initialization failed %d\r\n", Status);
		return(XST_FAILURE);
	}
	xil_printf("VDMA: Initialized OK\r\n");
    return(XST_SUCCESS);
}


int V_DMA_ConfigStream(XAxiVdma_DmaSetup *vDmaSetup,
						XVidC_VideoStream *vidStream,
						uint32_t *framePtr)
{
	int Status = -1;
	int i = 0;
	const XVidC_VideoTimingMode *VmPtr;
	VmPtr = XVidC_GetVideoModeData(vidStream->VmId);
	vDmaSetup->VertSizeInput = VmPtr->Timing.VActive;
	vDmaSetup->HoriSizeInput = VmPtr->Timing.HActive * 3;
	vDmaSetup->FixedFrameStoreAddr = 0;
	vDmaSetup->Stride = vDmaSetup->HoriSizeInput;
	xil_printf("VertSizeInput: %d\r\n",vDmaSetup->VertSizeInput);
	xil_printf("HoriSizeInput: %d\r\n",vDmaSetup->HoriSizeInput);
	xil_printf("Stride: %d\r\n",vDmaSetup->Stride);
	for (i = 0; i < DISPLAY_NUM_FRAMES; i++)
	{
		vDmaSetup->FrameStoreStartAddr[i] = (UINTPTR)(framePtr+i);
	}
	Status = XAxiVdma_DmaConfig(&vdma, XAXIVDMA_READ, vDmaSetup);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Read channel config failed %d\r\n", Status);
		return XST_FAILURE;
	}
	Status = XAxiVdma_DmaSetBufferAddr(&vdma, XAXIVDMA_READ, vDmaSetup->FrameStoreStartAddr);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Read channel set buffer address failed %d\r\n", Status);
		return XST_FAILURE;
	}
	Status = XAxiVdma_DmaStart(&vdma, XAXIVDMA_READ);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Start read transfer failed %d\r\n", Status);
		return XST_FAILURE;
	}
	Status = XAxiVdma_StartParking(&vdma, 0, XAXIVDMA_READ);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Unable to park the channel %d\r\n", Status);
		return XST_FAILURE;
	}

	return XST_SUCCESS;	
}
