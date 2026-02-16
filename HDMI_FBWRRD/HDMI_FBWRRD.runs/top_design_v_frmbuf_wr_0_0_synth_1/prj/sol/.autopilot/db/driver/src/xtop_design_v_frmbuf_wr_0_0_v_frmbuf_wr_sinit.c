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
#include "xtop_design_v_frmbuf_wr_0_0_v_frmbuf_wr.h"

extern XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Config XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ConfigTable[];

#ifdef SDT
XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Config *XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_LookupConfig(UINTPTR BaseAddress) {
	XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ConfigTable[Index].Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress == BaseAddress) {
			ConfigPtr = &XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Initialize(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, UINTPTR BaseAddress) {
	XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Config *XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_LookupConfig(u16 DeviceId) {
	XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_NUM_INSTANCES; Index++) {
		if (XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Initialize(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u16 DeviceId) {
	XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

