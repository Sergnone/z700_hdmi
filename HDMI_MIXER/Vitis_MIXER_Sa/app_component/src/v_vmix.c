#include "v_vmix.h"
#include <stdio.h>
#include <xv_mix_l2.h>
#include <stdio.h>   
#include <stdlib.h>

#include "argus_sz.h"


typedef struct dctrl {
		u8 *framePtr; /* Array of pointers to the framebuffers */
		u32 stride; /* The line stride of the framebuffers, in bytes */
		u32 Height;
		u32 Width;
		u32 MaxFrame;
		u8 BytesPerPixel;
} DispCtrl;

XV_Mix_l2         mix;
DispCtrl          displayCtrl;

//XVMix_GetLayerColorFormat(&mix, XVMIX_LAYER_MASTER, &Cfmt);

XVidC_VideoWindow Win;

const XVidC_VideoWindow MixLayerConfig[1] =
{// X   Y   W    	H
		{0, 	0,  1920,	1080} //Layer 1
};



/*-----------------------------------------------------------------------------------*/
void V_VMIX_DrawImage(XV_Mix_l2 *MixerPtr, uintptr_t mAddr)
{
    char *dst;
    int x,y;
    u8 wRed, wBlue, wGreen,transparency = 128;
    u32 iPixelAddr = 0, pix;
    int layerIndex=XVMIX_LAYER_1;
    uint32_t Stride = 1920*4;
    dst = (char *)mAddr;
    displayCtrl.framePtr = (u8 *)mAddr;
    displayCtrl.Height = Win.Height;
	  displayCtrl.Width = Win.Width;
	  displayCtrl.MaxFrame = Win.Height * Stride;
    if (!(XVMix_IsLayerInterfaceStream(MixerPtr, layerIndex)))
    {
	    memset((void *)mAddr-(displayCtrl.stride*140), 0x00, displayCtrl.MaxFrame+displayCtrl.stride*164);//164
    }
    //draw ARGUS LOGO
    for(y=0, pix=0; y < ARGUS_SZ_HEIGHT; y++)
    {
 	   for(x=0; x<ARGUS_SZ_WIDTH*4; x+=4, pix++)
     {
			dst[x + iPixelAddr + 0] = argus_sz[pix];//wBlue;
			dst[x + iPixelAddr + 1] = argus_sz[pix]>>8;//wGreen;
			dst[x + iPixelAddr + 2] = argus_sz[pix]>>16;//wRed;
			dst[x + iPixelAddr + 3] = transparency;//argus_sz[pix]>>24; //wAlfa;
 	   }
 	  iPixelAddr += Stride;
    } 
    //memcpy(dst, argus_sz, ARGUS_SZ_SIZE);
  //draw checkmate board
	for(y = 0; y < Win.Height; y++)	{
		for(x = 0; x < (Win.Width * 4); x+=4) {
			if (((x/3)&0x20)^(y&0x20)) {
				wRed = wGreen = wBlue = 255;
			}
			else{
				wRed = wGreen =	wBlue = 0;
			}
			dst[x + iPixelAddr + 0] = wRed;
			dst[x + iPixelAddr + 1] = wGreen;
			dst[x + iPixelAddr + 2] = wBlue;
			dst[x + iPixelAddr + 3] = transparency;
		}
		iPixelAddr += Stride;
	}
}
/*-----------------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------------*/
int V_VMIX_SetupMixerLayer(XV_Mix_l2 *mixptr)
{
    int Status = -1;
    XVMix_LayerId lIndex = XVMIX_LAYER_1;
    uintptr_t mAddr = 0;
    uint32_t Stride = 0;
    Win = MixLayerConfig[0];
    mAddr = XVMix_GetLayerBufferAddr(mixptr, lIndex);
    xil_printf("VMIX:: Layer Address: %x\r\n", mAddr);
    Status = XVMix_LayerDisable(mixptr, lIndex);
    if(Status != XST_SUCCESS)
    {
      xil_printf("VMIX ERR:: Disable Layer failed %d\r\n", Status);
		  return XST_FAILURE;
    }
    Stride = Win.Width * 4;
    Status = XVMix_SetLayerWindow(mixptr, lIndex, &Win, Stride);
    if(Status != XST_SUCCESS)
    {
      xil_printf("VMIX ERR:: Set Window failed %d\r\n", Status);
		  return XST_FAILURE;
    }
    Status = XVMix_SetLayerAlpha(mixptr, lIndex, XVMIX_ALPHA_MAX);
    if(Status != XST_SUCCESS)
    {
      xil_printf("VMIX ERR:: Set Alpha failed %d\r\n", Status);
		  return XST_FAILURE;
    }

    V_VMIX_DrawImage(mixptr, mAddr);
    //if(XVMix_IsLayerEnabled(mixptr, 1)==0) 
    //{
    //    usleep(1000);
    //    xil_printf("VMIX:: Layer disabled\r\n");
    //}
    usleep(1000000);
    Status = XVMix_LayerEnable(mixptr, lIndex);
    if(Status != XST_SUCCESS)
    {
      xil_printf("VMIX ERR:: Enable Layer failed %d\r\n", Status);
		  return XST_FAILURE;
    }
    if (!(XVMix_IsLayerInterfaceStream(mixptr, lIndex)))
    {
        Xil_DCacheFlushRange(mAddr, displayCtrl.MaxFrame);
    }
    xil_printf("VMIX OK:: Layer Ready %d\r\n", Status);

}
/*-----------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------*/
int V_VMIX_ConfigStream(XV_Mix_l2 *mixer, XVidC_VideoStream *StreamPtr)
{
    int index = 0;
    uint32_t MemAddr = 0;
    XVMix_LayerDisable(mixer, XVMIX_LAYER_MASTER);
    XVMix_SetVidStream(mixer, StreamPtr);
    MemAddr = XVMIX_LAYER1_BASEADDR;
    index = XVMIX_LAYER_1;
    XVMix_SetLayerBufferAddr(mixer, index, MemAddr);
    XVMix_SetBackgndColor(mixer, XVMIX_BKGND_BLUE, StreamPtr->ColorDepth);
    XVMix_LayerEnable(mixer, XVMIX_LAYER_MASTER);
    XVMix_InterruptDisable(mixer);
    XVMix_Start(mixer);
    xil_printf("INFO: Mixer configured\r\n");
    return XST_SUCCESS;
}
/*-----------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------*/
int V_VMIX_Init(XV_Mix_l2 *vmixer, uint32_t bAddress)
{
  int Status = -1;
	Status = XVMix_Initialize(vmixer, bAddress);
	if(Status != XST_SUCCESS)
	{
		xil_printf("ERR:: VMIX Initialization failed %d\r\n", Status);
		return(XST_FAILURE);
	}
	xil_printf("VMIX: Initialized OK\r\n");
  return(XST_SUCCESS);
}
/*-----------------------------------------------------------------------------------*/

