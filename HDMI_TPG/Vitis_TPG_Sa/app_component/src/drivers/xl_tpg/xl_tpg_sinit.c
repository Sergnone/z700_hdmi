// ==============================================================
// Copyright (c) 2015 - 2021 Xilinx Inc. All rights reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// SPDX-License-Identifier: MIT
// ==============================================================


#include "xl_status.h"
#include "xl_tpg.h"

#ifndef XPAR_XV_TPG_NUM_INSTANCES
#define XPAR_XV_TPG_NUM_INSTANCES   0
#endif

extern XL_tpg_Config XL_tpg_ConfigTable[];

XL_tpg_Config *XL_tpg_LookupConfig(UINTPTR BaseAddress) {
	XL_tpg_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0U; XL_tpg_ConfigTable[Index].Name != NULL; Index++) {
		if ((XL_tpg_ConfigTable[Index].BaseAddress == BaseAddress) ||
			!BaseAddress) {
			ConfigPtr = &XL_tpg_ConfigTable[Index];
		break;
		}
	}

	return ConfigPtr;
}

int XL_tpg_Initialize(XL_tpg *InstancePtr, UINTPTR BaseAddress)
{
	XL_tpg_Config *ConfigPtr;

	ConfigPtr = XL_tpg_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XL_tpg_CfgInitialize(InstancePtr,
                                ConfigPtr,
                                ConfigPtr->BaseAddress);
}


