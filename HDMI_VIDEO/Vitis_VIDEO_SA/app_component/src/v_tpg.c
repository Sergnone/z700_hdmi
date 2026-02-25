#include "v_tpg.h"
#include <stdio.h>

XL_tpg_Config		*tpg_Config;
XL_tpg				tpg;

#define XPAR_VIDEO_CLK_WIZ_BASEADDR		0
#define VideoClockGen_WriteReg(RegOffset, Data) \
    Xl_Out32((XPAR_VIDEO_CLK_WIZ_BASEADDR) + (RegOffset), (uint32_t)(Data))
#define VideoClockGen_ReadReg(RegOffset) \
    Xl_In32((XPAR_VIDEO_CLK_WIZ_BASEADDR) + (RegOffset))


int V_TPG_Init(void)
{
    int Status = -1;
	tpg_Config = XL_tpg_LookupConfig(XPAR_V_TPG_0_BASEADDR);
	if(tpg_Config == NULL)
	{
		printf("ERR:: TPG device not found\r\n");
		return(XST_DEVICE_NOT_FOUND);
	}
	Status = XL_tpg_CfgInitialize(&tpg, tpg_Config, tpg_Config->BaseAddress);
	if(Status != XST_SUCCESS)
	{
		printf("ERR:: TPG Initialization failed %d\r\n", Status);
		return(XST_FAILURE);
	}
	printf("TPG: Initialized OK\r\n");
    return(XST_SUCCESS);
}


uint16_t V_TPG_Start(XL_VidC_VideoMode videoMode)
{
    XL_VidC_VideoTiming const *timing = XL_VidC_GetTimingInfo(videoMode);
	uint16_t PixelsPerClk;
	XL_tpg_Set_height(&tpg, timing->VActive);
	XL_tpg_Set_width(&tpg, timing->HActive);
	XL_tpg_Set_colorFormat(&tpg, 0);
	XL_tpg_Set_bckgndId(&tpg, XTPG_BKGND_COLOR_BARS);
	XL_tpg_Set_ovrlayId(&tpg, 0);
	XL_tpg_WriteReg(tpg_Config->BaseAddress, XV_TPG_CTRL_ADDR_AP_CTRL, 0x81);
	PixelsPerClk = tpg.Config.PixPerClk;
    return PixelsPerClk;
}

uint16_t V_TPG_ConfigStream(XL_VidC_VideoStream *StreamPtr)
{
    XL_VidC_VideoTiming const *timing = XL_VidC_GetTimingInfo(StreamPtr->VmId);
    StreamPtr->Timing = *timing;
	XL_tpg_Set_height(&tpg, timing->VActive);
	XL_tpg_Set_width(&tpg, timing->HActive);
	XL_tpg_Set_colorFormat(&tpg, 0);
	XL_tpg_Set_bckgndId(&tpg, XTPG_BKGND_COLOR_BARS);
	XL_tpg_Set_ovrlayId(&tpg, 0);
	XL_tpg_WriteReg(tpg_Config->BaseAddress, XV_TPG_CTRL_ADDR_AP_CTRL, 0x81);
    StreamPtr->PixPerClk = tpg.Config.PixPerClk;
	printf("TPG: Stream Configured OK\r\n");
    return StreamPtr->PixPerClk;
}


int V_TPG_Clock_Config(XL_VidC_VideoMode videoMode)
{
	uint32_t DIVCLK_DIVIDE = 4;
	uint32_t CLKFBOUT_MULT = 37;
	uint32_t CLKFBOUT_FRAC = 125;
	uint32_t CLKOUT0_DIVIDE;
	uint32_t CLKOUT0_FRAC;
	uint32_t clock_config_reg_0;
	uint32_t clock_config_reg_2;
	uint16_t PixelsPerClk, mode_index;

    const int ClkOut_Frac[3][XLVIDCPPC_NUM_SUPPORTED] =
    { {250, 500, 0  , 0}, //1080p
      {125, 250, 500, 0}, //4K30
      {0,   125, 250, 500}  //4K60
    };
    const int ClkOut_Div[3][XLVIDCPPC_NUM_SUPPORTED] =
    { {6, 12, 25, 50}, //1080p
      {3, 6 , 12, 25}, //4K30
      {0, 3 , 6 , 12}  //4K60
    };



    mode_index = ((videoMode ==  XLVIDCVM_1080_60_P) ? 0 :
                  (videoMode ==  XLVIDCVM_UHD_30_P)  ? 1 :
                  (videoMode ==  XLVIDCVM_UHD_60_P)  ? 2 : 3);

    if(mode_index > 2)
    {
      printf("ERR:: Video Mode %s not supported\r\n", XVidC_GetVideoModeStr(videoMode));
      return(XST_FAILURE);
    }

    //map PPC to array index
    PixelsPerClk = ((tpg.Config.PixPerClk == XLVIDCPPC_8)? 3 : tpg.Config.PixPerClk>>1);
    CLKOUT0_FRAC   =  ClkOut_Frac[mode_index][PixelsPerClk];
    CLKOUT0_DIVIDE =  ClkOut_Div[mode_index][PixelsPerClk];

	clock_config_reg_0 = (1<<26) | (CLKFBOUT_FRAC<<16) | (CLKFBOUT_MULT<<8) | DIVCLK_DIVIDE;
	clock_config_reg_2 = (1<<18) | (CLKOUT0_FRAC<<8) | CLKOUT0_DIVIDE;

	VideoClockGen_WriteReg(0x200, clock_config_reg_0);
	VideoClockGen_WriteReg(0x208, clock_config_reg_2);

	printf("TPG: Clock Configured OK\r\n");

	return(XST_SUCCESS);
}
