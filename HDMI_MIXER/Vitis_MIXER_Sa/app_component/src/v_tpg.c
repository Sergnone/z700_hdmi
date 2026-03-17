#include "v_tpg.h"
#include <xv_tpg.h>


XV_tpg_Config		*tpg_Config0;
XV_tpg				tpg0;
XV_tpg_Config		*tpg_Config1;
XV_tpg				tpg1;


/*--------------------------------------------------------------------*/
int V_TPG_Init(XV_tpg *tpg, uint32_t bAddress)
{
    int Status = -1;
	XV_tpg_Config		*tpg_Config;
	tpg_Config = XV_tpg_LookupConfig(bAddress);
	if(tpg_Config == NULL)
	{
		xil_printf("ERR:: TPG device not found\r\n");
		return(XST_DEVICE_NOT_FOUND);
	}
	Status = XV_tpg_CfgInitialize(tpg, tpg_Config, tpg_Config->BaseAddress);
	if(Status != XST_SUCCESS)
	{
		xil_printf("ERR:: TPG Initialization failed %d\r\n", Status);
		return(XST_FAILURE);
	}
	xil_printf("TPG: Initialized OK\r\n");
    return(XST_SUCCESS);
}
/*--------------------------------------------------------------------*/
/*--------------------------------------------------------------------*/
uint16_t V_TPG_Start(XV_tpg *tpg,
					XVidC_VideoMode videoMode)
{
    XVidC_VideoTiming const *timing = XVidC_GetTimingInfo(videoMode);
	uint16_t PixelsPerClk;
	XV_tpg_Set_height(tpg, timing->VActive);
	XV_tpg_Set_width(tpg, timing->HActive);
	XV_tpg_Set_colorFormat(tpg, 0);
	XV_tpg_Set_bckgndId(tpg, XTPG_BKGND_COLOR_BARS);
	XV_tpg_Set_ovrlayId(tpg, 0);
	XV_tpg_EnableAutoRestart(tpg);
	XV_tpg_Start(tpg);
	PixelsPerClk = tpg->Config.PixPerClk;
    return PixelsPerClk;
}
/*--------------------------------------------------------------------*/
/*--------------------------------------------------------------------*/
uint16_t V_TPG_ConfigStream(XV_tpg *tpg,
							XVidC_VideoStream *StreamPtr)
{
    XVidC_VideoTiming const *timing = XVidC_GetTimingInfo(StreamPtr->VmId);
    StreamPtr->Timing = *timing;
	XV_tpg_Set_height(tpg, timing->VActive);
	XV_tpg_Set_width(tpg, timing->HActive);
	XV_tpg_Set_colorFormat(tpg, StreamPtr->ColorFormatId);
	XV_tpg_Set_bckgndId(tpg, XTPG_BKGND_COLOR_BARS); //XTPG_BKGND_SOLID_RED
	//XV_tpg_Set_ovrlayId(tpg, 0);
	
	XV_tpg_Set_boxSize(tpg, 50);
	XV_tpg_Set_motionSpeed(tpg, 3);
	XV_tpg_Set_ovrlayId(tpg, 1);

	XV_tpg_EnableAutoRestart(tpg);
	XV_tpg_Start(tpg);
    StreamPtr->PixPerClk = tpg->Config.PixPerClk;
	xil_printf("TPG: Stream Configured OK\r\n");
    return StreamPtr->PixPerClk;
}
/*--------------------------------------------------------------------*/

int V_TPG_Clock_Config(XVidC_VideoMode videoMode)
{
	u32 DIVCLK_DIVIDE = 4;
	u32 CLKFBOUT_MULT = 37;
	u32 CLKFBOUT_FRAC = 125;
	u32 CLKOUT0_DIVIDE;
	u32 CLKOUT0_FRAC;
	u32 clock_config_reg_0;
	u32 clock_config_reg_2;
	u16 PixelsPerClk, mode_index;

    const int ClkOut_Frac[3][XVIDC_PPC_NUM_SUPPORTED] =
    { {250, 500, 0  , 0}, //1080p
      {125, 250, 500, 0}, //4K30
      {0,   125, 250, 500}  //4K60
    };
    const int ClkOut_Div[3][XVIDC_PPC_NUM_SUPPORTED] =
    { {6, 12, 25, 50}, //1080p
      {3, 6 , 12, 25}, //4K30
      {0, 3 , 6 , 12}  //4K60
    };

    /* Validate TPG Parameters */
	/*
    Xil_AssertNonvoid((tpg.Config.PixPerClk == XVIDC_PPC_1) ||
                      (tpg.Config.PixPerClk == XVIDC_PPC_2) ||
					  (tpg.Config.PixPerClk == XVIDC_PPC_4) ||
                      (tpg.Config.PixPerClk == XVIDC_PPC_8));


    mode_index = (	(videoMode ==  XVIDC_VM_720_60_P) ? 0 :
					(videoMode ==  XVIDC_VM_1080_60_P) ? 0 :
                  	(videoMode ==  XVIDC_VM_UHD_30_P)  ? 1 :
                  	(videoMode ==  XVIDC_VM_UHD_60_P)  ? 2 : 3);

    if(mode_index > 3)
    {
      xil_printf("ERR:: Video Mode %s not supported\r\n", XVidC_GetVideoModeStr(videoMode));
      return(XST_FAILURE);
    }

    //map PPC to array index
    PixelsPerClk = ((tpg.Config.PixPerClk == XVIDC_PPC_8)? 3 : tpg.Config.PixPerClk>>1);
    CLKOUT0_FRAC   =  ClkOut_Frac[mode_index][PixelsPerClk];
    CLKOUT0_DIVIDE =  ClkOut_Div[mode_index][PixelsPerClk];

	//clock_config_reg_0 = (1<<26) | (CLKFBOUT_FRAC<<16) | (CLKFBOUT_MULT<<8) | DIVCLK_DIVIDE;
	//clock_config_reg_2 = (1<<18) | (CLKOUT0_FRAC<<8) | CLKOUT0_DIVIDE;

	//VideoClockGen_WriteReg(0x200, clock_config_reg_0);
	//VideoClockGen_WriteReg(0x208, clock_config_reg_2);

	usleep(300000);

	xil_printf("TPG: Clock Configured OK\r\n");
	*/
	return(XST_SUCCESS);
}