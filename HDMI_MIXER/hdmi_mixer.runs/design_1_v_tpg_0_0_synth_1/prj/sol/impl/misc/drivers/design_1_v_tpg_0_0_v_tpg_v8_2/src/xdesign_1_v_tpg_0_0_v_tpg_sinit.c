// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xdesign_1_v_tpg_0_0_v_tpg.h"

extern XDesign_1_v_tpg_0_0_v_tpg_Config XDesign_1_v_tpg_0_0_v_tpg_ConfigTable[];

#ifdef SDT
XDesign_1_v_tpg_0_0_v_tpg_Config *XDesign_1_v_tpg_0_0_v_tpg_LookupConfig(UINTPTR BaseAddress) {
	XDesign_1_v_tpg_0_0_v_tpg_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XDesign_1_v_tpg_0_0_v_tpg_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XDesign_1_v_tpg_0_0_v_tpg_ConfigTable[Index].Design_1_v_tpg_0_0_ctrl_BaseAddress == BaseAddress) {
			ConfigPtr = &XDesign_1_v_tpg_0_0_v_tpg_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDesign_1_v_tpg_0_0_v_tpg_Initialize(XDesign_1_v_tpg_0_0_v_tpg *InstancePtr, UINTPTR BaseAddress) {
	XDesign_1_v_tpg_0_0_v_tpg_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDesign_1_v_tpg_0_0_v_tpg_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDesign_1_v_tpg_0_0_v_tpg_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XDesign_1_v_tpg_0_0_v_tpg_Config *XDesign_1_v_tpg_0_0_v_tpg_LookupConfig(u16 DeviceId) {
	XDesign_1_v_tpg_0_0_v_tpg_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDESIGN_1_V_TPG_0_0_V_TPG_NUM_INSTANCES; Index++) {
		if (XDesign_1_v_tpg_0_0_v_tpg_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDesign_1_v_tpg_0_0_v_tpg_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDesign_1_v_tpg_0_0_v_tpg_Initialize(XDesign_1_v_tpg_0_0_v_tpg *InstancePtr, u16 DeviceId) {
	XDesign_1_v_tpg_0_0_v_tpg_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDesign_1_v_tpg_0_0_v_tpg_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDesign_1_v_tpg_0_0_v_tpg_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

