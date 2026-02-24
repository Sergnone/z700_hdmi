/******************************************************************************
* Copyright (C) 2008 - 2020 Xilinx, Inc.  All rights reserved.
* Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/


/***************************** Include Files *********************************/

#include "xl_vtc.h"

/************************** Constant Definitions *****************************/

#ifndef XPAR_XVTC_NUM_INSTANCES
#define XPAR_XVTC_NUM_INSTANCES 0
#endif

/***************** Macros (Inline Functions) Definitions *********************/


/**************************** Type Definitions *******************************/


/************************** Function Prototypes ******************************/


/************************** Variable Definitions *****************************/


/************************** Function Definitions *****************************/

/*****************************************************************************/
/**
*
* This function returns a reference to an XL_Vtc_Config structure based on the
* core id, <i>DeviceId</i>. The return value will refer to an entry in
* the device configuration table defined in the xvtc_g.c file.
*
* @param	DeviceId is the unique core ID of the VTC core for the lookup
*		operation.
*
* @return	XL_Vtc_LookupConfig returns a reference to a config record in
*		the configuration table (in xvtc_g.c) corresponding to
*		<i>DeviceId</i>, or NULL if no match is found.
*
* @note		None.
*
******************************************************************************/
#ifndef SDT
XL_Vtc_Config *XL_Vtc_LookupConfig(uint16_t DeviceId)
{
	extern XL_Vtc_Config XL_Vtc_ConfigTable[];
	XL_Vtc_Config *CfgPtr = NULL;
	int i;

	/* Checking for device id for which instance it is matching */
	for (i = 0; i < XPAR_XVTC_NUM_INSTANCES; i++) {
		/* Assigning address of config table if both device ids
		 * are matched
		 */
		if (XL_Vtc_ConfigTable[i].DeviceId == DeviceId) {
			CfgPtr = &XL_Vtc_ConfigTable[i];
			break;
		}
	}

	return CfgPtr;
}
#else
XL_Vtc_Config *XL_Vtc_LookupConfig(UINTPTR BaseAddress)
{
	extern XL_Vtc_Config XL_Vtc_ConfigTable[];
	XL_Vtc_Config *CfgPtr = NULL;
	uint32_t Index;

	for (Index = 0U; XL_Vtc_ConfigTable[Index].Name != NULL; Index++) {
            if ((XL_Vtc_ConfigTable[Index].BaseAddress == BaseAddress) ||
                             !BaseAddress) {

                      CfgPtr = &XL_Vtc_ConfigTable[Index];
                break;
           }
        }

	return CfgPtr;
}
#endif
/** @} */
