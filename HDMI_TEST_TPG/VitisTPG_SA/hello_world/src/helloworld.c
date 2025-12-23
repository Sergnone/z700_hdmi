#include "stdint.h"
#include "stdbool.h"
#include "xv_tpg.h"
#include "sleep.h"
#include "xparameters.h"


#include "xvtc.h"
#include "xv_frmbufrd_l2.h"

#define BYTES_PIXEL 3

#define DISPLAY_WIDTH           1920
#define DISPLAY_HEIGHT          1080

#define DEMO_MAX_FRAME (DISPLAY_WIDTH*DISPLAY_HEIGHT*BYTES_PIXEL)
#define DEMO_STRIDE (DISPLAY_WIDTH * BYTES_PIXEL)

#define DYNCLK_BASEADDR XPAR_AXI_DYNCLK_0_BASEADDR
#define VGA_VDMA_ID 0
#define DISP_VTC_ID 0

#define XPAR_V_TC_0_DEVICE_ID				0
#define XPAR_V_FRMBUF_RD_0_DEVICE_ID		0

typedef struct {
	char label[64]; /* Label describing the resolution */
	u32 width; /*Width of the active video frame*/
	u32 height; /*Height of the active video frame*/
	u32 hps; /*Start time of Horizontal sync pulse, in pixel clocks (active width + H. front porch)*/
	u32 hpe; /*End time of Horizontal sync pulse, in pixel clocks (active width + H. front porch + H. sync width)*/
	u32 hmax; /*Total number of pixel clocks per line (active width + H. front porch + H. sync width + H. back porch) */
	u32 hpol; /*hsync pulse polarity*/
	u32 vps; /*Start time of Vertical sync pulse, in lines (active height + V. front porch)*/
	u32 vpe; /*End time of Vertical sync pulse, in lines (active height + V. front porch + V. sync width)*/
	u32 vmax; /*Total number of lines per frame (active height + V. front porch + V. sync width + V. back porch) */
	u32 vpol; /*vsync pulse polarity*/
	double freq; /*Pixel Clock frequency*/
} VideoMode;


static const VideoMode VMODE_1080P = {
	.label = "1920x1080@60Hz",
	.width = 1920,
	.height = 1080,
	.hps = 2008,
	.hpe = 2052,
	.hmax = 2199,
	.hpol = 1,
	.vps = 1084,
	.vpe = 1089,
	.vmax = 1124,
	.vpol = 1,
	.freq = 148.5 //148.57 is close enough
};

XVtc vtc;
XVtc_Timing vtcTiming;
XV_tpg tpg;
VideoMode vMode;
XVtc_SourceSelect SourceSelect;
XV_FrmbufRd_l2     frmbufrd;
XV_frmbufrd_Config frmbufrd_cfg;
VideoMode vMode;



int VTC_Init(void)
{
	int Status;
	XVtc_Config *vtcConfig;
	vMode = VMODE_1080P;
	vtcConfig = XVtc_LookupConfig(DISP_VTC_ID);
	if (NULL == vtcConfig)
    {
		return (XST_FAILURE);
	}
	Status = XVtc_CfgInitialize(&vtc, vtcConfig, vtcConfig->BaseAddress);
	if (Status != (XST_SUCCESS))
    {
		return (XST_FAILURE);
	}
	vtcTiming.HActiveVideo = vMode.width;
	vtcTiming.HFrontPorch = vMode.hps - vMode.width;
	vtcTiming.HSyncWidth = vMode.hpe - vMode.hps;
	vtcTiming.HBackPorch = vMode.hmax - vMode.hpe + 1;
	vtcTiming.HSyncPolarity = vMode.hpol;
	vtcTiming.VActiveVideo = vMode.height;
	vtcTiming.V0FrontPorch = vMode.vps - vMode.height;
	vtcTiming.V0SyncWidth = vMode.vpe - vMode.vps;
	vtcTiming.V0BackPorch = vMode.vmax - vMode.vpe + 1;
	vtcTiming.V1FrontPorch = vMode.vps - vMode.height;
	vtcTiming.V1SyncWidth = vMode.vpe - vMode.vps;
	vtcTiming.V1BackPorch = vMode.vmax - vMode.vpe + 1;
	vtcTiming.VSyncPolarity = vMode.vpol;
	vtcTiming.Interlaced = 0;

	memset((void *)&SourceSelect, 0, sizeof(SourceSelect));
	SourceSelect.VBlankPolSrc = 1;
	SourceSelect.VSyncPolSrc = 1;
	SourceSelect.HBlankPolSrc = 1;
	SourceSelect.HSyncPolSrc = 1;
	SourceSelect.ActiveVideoPolSrc = 1;
	SourceSelect.ActiveChromaPolSrc= 1;
	SourceSelect.VChromaSrc = 1;
	SourceSelect.VActiveSrc = 1;
	SourceSelect.VBackPorchSrc = 1;
	SourceSelect.VSyncSrc = 1;
	SourceSelect.VFrontPorchSrc = 1;
	SourceSelect.VTotalSrc = 1;
	SourceSelect.HActiveSrc = 1;
	SourceSelect.HBackPorchSrc = 1;
	SourceSelect.HSyncSrc = 1;
	SourceSelect.HFrontPorchSrc = 1;
	SourceSelect.HTotalSrc = 1;

	XVtc_SelfTest(&vtc);
	XVtc_RegUpdateEnable(&vtc);
	XVtc_SetGeneratorTiming(&vtc, &vtcTiming);
	XVtc_SetSource(&vtc, &SourceSelect);
	XVtc_EnableGenerator(&vtc);
	return XST_SUCCESS;
}

int TPG_Init(void)
{
	XV_tpg_Initialize(&tpg, 0);
    XV_tpg_Set_width(&tpg, 1920);
    XV_tpg_Set_height(&tpg, 1080);
    XV_tpg_Set_ZplateHorContDelta(&tpg, 2);
    XV_tpg_Set_ZplateHorContStart(&tpg, 2);
    XV_tpg_Set_ZplateVerContDelta(&tpg, 2);
    XV_tpg_Set_ZplateVerContStart(&tpg, 2);
    XV_tpg_Set_motionSpeed(&tpg, 2);
    XV_tpg_Set_motionEn(&tpg, 1);
    XV_tpg_EnableAutoRestart(&tpg);
	return 0;
}


int FRB_Init(void)
{
  int Status;
  Status = XVFrmbufRd_Initialize(&frmbufrd, XPAR_V_FRMBUF_RD_0_DEVICE_ID);
  if (Status != XST_SUCCESS)
  {
    xil_printf("ERROR:: Frame Buffer Read initialization failed\r\n");
    return(XST_FAILURE);
  }
  return(XST_SUCCESS);
}



int DriverInit(void)
{
	VTC_Init();
	TPG_Init();
  	return(XST_SUCCESS);
}

int main()
{
    int pattern = 9;
    print("--------------------------\r\n");
	DriverInit();
    XV_tpg_Start(&tpg);
    print("Successfully ran TPG application\r\n");
    XV_tpg_Set_bckgndId(&tpg, pattern);
    return 0;
}
