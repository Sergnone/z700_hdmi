#include "xparameters.h"
#include "platform.h"
#include "sleep.h"
#include "xv_frmbufrd_l2.h"
#include "xv_frmbufwr_l2.h"
#include "xvidc.h"
#include "xgpiops.h"
//#include "dynclk.h"
#include "periph.h"
#include "xuartps.h"
#include "xv_mix_l2.h"
#include "xil_cache.h"
#include "argus_sz.h"
#include "v_dynclk.h"
#include "v_tpg.h"
#include "v_vtc.h"
#include "v_vmix.h"
//#include "v_switch.h"
#include "v_fb_rd.h"
#include "v_fb_wr.h"
#include "v_gpio.h"
#include "_pl_addresses.h"

extern DDynClk					    dClk;
extern XVtc				          vtc;
//extern XAxis_Switch         switcher;
extern XV_FrmbufRd_l2       frmbufrd;
extern XV_frmbufrd_Config   frmbufrd_cfg;
extern XV_FrmbufWr_l2       frmbufwr;
extern XV_frmbufwr_Config   frmbufwr_cfg;
XGpioPs 			              PsGpio;
XVidC_VideoStream 	        VidStream;
XVtc				                Vtc;
extern XV_Mix_l2            mix;
extern XV_tpg				        tpg0;

/*****************************************************************************/
int main()
{
	int stride;
  uint32_t pix_freq = 0;
	XVidC_ColorFormat Cfmt;
	XVidC_VideoTiming const *TimingPtr;
	init_platform();
  xil_printf("=========================================================================\n\r");
	sleep(1);
  V_GPIO_Init(&PsGpio, XPAR_XGPIOPS_0_BASEADDR);
  V_GPIO_SetupIp(&PsGpio);
  V_DDYNCLK_Init();
  V_VTC_Init();
  //V_SWITCH_Init(&switcher, XPAR_XAXIS_SWITCH_0_BASEADDR);
  V_TPG_Init(&tpg0, XPAR_XV_TPG_0_BASEADDR);
  V_VMIX_Init(&mix, XPAR_XV_MIX_0_BASEADDR);
  V_FBRD_Init();
  V_FBWR_Init();
  //V_SWITCH_Channel(&switcher, 0);
	VidStream.PixPerClk = frmbufwr.FrmbufWr.Config.PixPerClk;
	VidStream.ColorDepth = frmbufwr.FrmbufWr.Config.MaxDataWidth;
  XVFrmbufWr_Stop(&frmbufwr);
  XVFrmbufRd_Stop(&frmbufrd);
  V_GPIO_ResetIp(&PsGpio);
  Cfmt = XVIDC_CSF_MEM_RGB8;
  VidStream.ColorFormatId = XVIDC_CSF_RGB;
  VidStream.VmId = XVIDC_VM_1080_60_P;
  TimingPtr = XVidC_GetTimingInfo(VidStream.VmId);
  VidStream.Timing = *TimingPtr;
  VidStream.FrameRate = XVidC_GetFrameRate(VidStream.VmId);
  xil_printf("\r\n******************************************\r\n");
  xil_printf("Test Input Stream: %s (%s)\r\n",
              XVidC_GetVideoModeStr(VidStream.VmId),
              XVidC_GetColorFormatStr(Cfmt));
  xil_printf("********************************************\r\n");
  xil_printf("Setup DynClk\r\n");
  pix_freq = (uint32_t)(XVidC_GetPixelClockHzByVmId(VidStream.VmId));
  xil_printf("Pix Freq: %d\r\n", pix_freq);
  DDynClk_SetRate(&dClk, pix_freq);
  DDynClk_Enable(&dClk);
  xil_printf("\n\rStart VTC.\r\n");
  V_VTC_ConfigStream(&VidStream);
  V_TPG_ConfigStream(&tpg0, &VidStream);
  stride = V_FBWR_CalcStride(Cfmt,
            frmbufwr.FrmbufWr.Config.AXIMMDataWidth,
            &VidStream);
  XVFrmbufRd_Stop(&frmbufrd);
  XVFrmbufWr_Stop(&frmbufwr);
  V_GPIO_ResetIp(&PsGpio);
  XVFrmbufWr_WaitForIdle(&frmbufwr);
  XVFrmbufRd_WaitForIdle(&frmbufrd);
  xil_printf("Stride : %d\r\n", stride);
  V_FBRD_ConfigBuf(stride, Cfmt, &VidStream);
  V_FBWR_ConfigBuf(stride, Cfmt, &VidStream);
  V_VMIX_ConfigStream(&mix, &VidStream);
  V_VMIX_SetupMixerLayer(&mix);
  cleanup_platform();
  return(0);
}
/*****************************************************************************/
