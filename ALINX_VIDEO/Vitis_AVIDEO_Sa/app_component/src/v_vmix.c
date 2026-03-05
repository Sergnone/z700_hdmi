#include "v_vmix.h"
#include <stdio.h>
#include <xv_mix_l2.h>

XV_Mix_l2         mix;

XVidC_ColorFormat StreamFmt, MemFmt;

/*--------------------------------------------------------------------*/
void V_VMIX_ConfigStream(XVidC_VideoStream *StreamPtr)
{
  int Status = -1;
  XV_Mix_l2 *MixerPtr = &mix;
  uint32_t MemAddr;
  int NumLayers = 0;
  int index = 0;
  XVidC_ColorFormat Cfmt;

  XVMix_LayerDisable(MixerPtr, XVMIX_LAYER_MASTER);
  XVMix_SetVidStream(MixerPtr, StreamPtr);

  MemAddr = XVMIX_LAYER1_BASEADDR;
  NumLayers = XVMix_GetNumLayers(MixerPtr);

  for(index = XVMIX_LAYER_1; index < NumLayers; ++index)
  {
      XVMix_GetLayerColorFormat(MixerPtr, index, &Cfmt);
      Status = XVMix_SetLayerBufferAddr(MixerPtr, index, MemAddr);
      if(Status != XST_SUCCESS)
      {
          xil_printf("MIXER ERROR:: Unable to set layer %d buffer addr to 0x%X\r\n",
                      index, MemAddr);
      }
      else
      {
          if ((Cfmt == XVIDC_CSF_MEM_Y_UV8) || (Cfmt == XVIDC_CSF_MEM_Y_UV8_420) ||
              (Cfmt == XVIDC_CSF_MEM_Y_UV10) || (Cfmt == XVIDC_CSF_MEM_Y_UV10_420))
          {
              MemAddr += XVMIX_CHROMA_ADDR_OFFSET;
              Status = XVMix_SetLayerChromaBufferAddr(MixerPtr, index, MemAddr);
              if (Status != XST_SUCCESS)
              {
                  xil_printf("MIXER ERROR:: Unable to set layer %d chroma buffer2 addr to 0x%X\r\n",
                              index, MemAddr);
              }
          }
          MemAddr += XVMIX_LAYER_ADDR_OFFSET;
      }
      
      /*
      XVMix_GetLayerColorFormat(MixerPtr, index, &Cfmt);
      XVMix_LayerDisable(MixerPtr, XVMIX_LAYER_1);
      XV_mix_Set_HwReg_layerStartX_1(&MixerPtr->Mix, 0);
      XV_mix_Set_HwReg_layerStartY_1(&MixerPtr->Mix, 0);
      XV_mix_Set_HwReg_layerWidth_1(&MixerPtr->Mix, 1920);
      XV_mix_Set_HwReg_layerHeight_1(&MixerPtr->Mix, 1080);
      XV_mix_Set_HwReg_layerAlpha_1(&MixerPtr->Mix, 0);
      XVMix_LayerEnable(MixerPtr, XVMIX_LAYER_1);
      */
  }
  XVMix_SetBackgndColor(MixerPtr, XVMIX_BKGND_WHITE, StreamPtr->ColorDepth);
  XVMix_LayerEnable(MixerPtr, XVMIX_LAYER_MASTER);
  XVMix_InterruptDisable(MixerPtr);
  XVMix_Start(MixerPtr);
  xil_printf("INFO: Mixer configured\r\n");
}
/*--------------------------------------------------------------------*/
/*--------------------------------------------------------------------*/
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
/*--------------------------------------------------------------------*/

