#include "v_vmix.h"
#include <stdio.h>

XV_Mix_l2  mix;

//XVMix_GetLayerColorFormat(&mix, XVMIX_LAYER_MASTER, &Cfmt);

/*--------------------------------------------------------------------*/
void V_VMIX_ConfigStream(XVidC_VideoStream *StreamPtr)
{
  XV_Mix_l2 *MixerPtr = &mix;
  int index = 0;
  int NumLayers = 0;
  int Status = -1;
  uint32_t MemAddr = 0;
  XVidC_ColorFormat Cfmt;
  /* Setup default config after reset */
  XVMix_LayerDisable(MixerPtr, XVMIX_LAYER_MASTER);
  XVMix_SetVidStream(MixerPtr, StreamPtr);
  /* Set Memory Layer Addresses */
  NumLayers = XVMix_GetNumLayers(MixerPtr);
  MemAddr = XVMIX_LAYER1_BASEADDR;
  XVMix_GetLayerColorFormat(MixerPtr, index, &Cfmt);
  xil_printf("INFO: Logo Layer Disabled in HW \r\n");
  XVMix_SetBackgndColor(MixerPtr, XVMIX_BKGND_BLUE, StreamPtr->ColorDepth);
  XVMix_LayerEnable(MixerPtr, XVMIX_LAYER_MASTER);
  XVMix_InterruptDisable(MixerPtr);
  XVMix_Start(MixerPtr);
  xil_printf("INFO: Mixer configured\r\n");
}
/*--------------------------------------------------------------------*/
/*--------------------------------------------------------------------*/
int V_VMIX_Init(void)
{
  int Status = -1;
	Status  = XVMix_Initialize(&mix, XPAR_XV_MIX_0_BASEADDR);
	if(Status != XST_SUCCESS)
	{
		printf("ERROR:: Mixer device not found\r\n");
		return(XST_FAILURE);
	}
	printf("TPG: Initialized OK\r\n");
    return(XST_SUCCESS);
}
/*--------------------------------------------------------------------*/