
#include "v_tpg.h"

XV_tpg_Config		*tpg_Config;
XV_tpg				tpg;

int V_TPG_Init(void)
{
	int status;
	tpg_Config = XV_tpg_LookupConfig(XPAR_V_TPG_0_BASEADDR);
	if(tpg_Config == NULL)
	{
		xil_printf("ERR:: TPG device not found\r\n");
		return(XST_DEVICE_NOT_FOUND);
	}
	status = XV_tpg_CfgInitialize(&tpg, tpg_Config, tpg_Config->BaseAddress);
	if(status != XST_SUCCESS)
	{
		xil_printf("ERR:: TPG Initialization failed %d\r\n", status);
		return(XST_FAILURE);
	}
	return(XST_SUCCESS);
}
