// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xtop_design_v_mix_0_0_v_mix.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XTop_design_v_mix_0_0_v_mix_CfgInitialize(XTop_design_v_mix_0_0_v_mix *InstancePtr, XTop_design_v_mix_0_0_v_mix_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress = ConfigPtr->Top_design_v_mix_0_0_ctrl_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XTop_design_v_mix_0_0_v_mix_Start(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_AP_CTRL) & 0x80;
    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XTop_design_v_mix_0_0_v_mix_IsDone(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XTop_design_v_mix_0_0_v_mix_IsIdle(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XTop_design_v_mix_0_0_v_mix_IsReady(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XTop_design_v_mix_0_0_v_mix_EnableAutoRestart(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_AP_CTRL, 0x80);
}

void XTop_design_v_mix_0_0_v_mix_DisableAutoRestart(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_AP_CTRL, 0);
}

void XTop_design_v_mix_0_0_v_mix_Set_width(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_WIDTH_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_width(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_WIDTH_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_height(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_HEIGHT_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_height(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_HEIGHT_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_video_format(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_VIDEO_FORMAT_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_video_format(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_VIDEO_FORMAT_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_background_Y_R(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_BACKGROUND_Y_R_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_background_Y_R(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_BACKGROUND_Y_R_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_background_U_G(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_BACKGROUND_U_G_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_background_U_G(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_BACKGROUND_U_G_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_background_V_B(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_BACKGROUND_V_B_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_background_V_B(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_BACKGROUND_V_B_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_layerEnable(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERENABLE_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_layerEnable(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERENABLE_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_layerAlpha_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERALPHA_1_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_layerAlpha_1(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERALPHA_1_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_layerStartX_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERSTARTX_1_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_layerStartX_1(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERSTARTX_1_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_layerStartY_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERSTARTY_1_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_layerStartY_1(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERSTARTY_1_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_layerWidth_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERWIDTH_1_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_layerWidth_1(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERWIDTH_1_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_layerStride_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERSTRIDE_1_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_layerStride_1(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERSTRIDE_1_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_layerHeight_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERHEIGHT_1_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_layerHeight_1(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERHEIGHT_1_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_layerScaleFactor_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERSCALEFACTOR_1_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_layerScaleFactor_1(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_LAYERSCALEFACTOR_1_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_Set_reserve(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_RESERVE_DATA, Data);
}

u32 XTop_design_v_mix_0_0_v_mix_Get_reserve(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_RESERVE_DATA);
    return Data;
}

void XTop_design_v_mix_0_0_v_mix_InterruptGlobalEnable(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_GIE, 1);
}

void XTop_design_v_mix_0_0_v_mix_InterruptGlobalDisable(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_GIE, 0);
}

void XTop_design_v_mix_0_0_v_mix_InterruptEnable(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_IER);
    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_IER, Register | Mask);
}

void XTop_design_v_mix_0_0_v_mix_InterruptDisable(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_IER);
    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_IER, Register & (~Mask));
}

void XTop_design_v_mix_0_0_v_mix_InterruptClear(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_mix_0_0_v_mix_WriteReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_ISR, Mask);
}

u32 XTop_design_v_mix_0_0_v_mix_InterruptGetEnabled(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_IER);
}

u32 XTop_design_v_mix_0_0_v_mix_InterruptGetStatus(XTop_design_v_mix_0_0_v_mix *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTop_design_v_mix_0_0_v_mix_ReadReg(InstancePtr->Top_design_v_mix_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_MIX_0_0_V_MIX_TOP_DESIGN_V_MIX_0_0_CTRL_ADDR_ISR);
}

