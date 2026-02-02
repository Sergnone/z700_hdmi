// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xtop_design_v_tpg_0_1_v_tpg.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XTop_design_v_tpg_0_1_v_tpg_CfgInitialize(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, XTop_design_v_tpg_0_1_v_tpg_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress = ConfigPtr->Top_design_v_tpg_0_1_ctrl_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XTop_design_v_tpg_0_1_v_tpg_Start(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_AP_CTRL) & 0x80;
    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XTop_design_v_tpg_0_1_v_tpg_IsDone(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XTop_design_v_tpg_0_1_v_tpg_IsIdle(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XTop_design_v_tpg_0_1_v_tpg_IsReady(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XTop_design_v_tpg_0_1_v_tpg_EnableAutoRestart(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_AP_CTRL, 0x80);
}

void XTop_design_v_tpg_0_1_v_tpg_DisableAutoRestart(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_AP_CTRL, 0);
}

void XTop_design_v_tpg_0_1_v_tpg_Set_height(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_HEIGHT_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_height(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_HEIGHT_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_width(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_WIDTH_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_width(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_WIDTH_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_bckgndId(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_BCKGNDID_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_bckgndId(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_BCKGNDID_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_ovrlayId(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_OVRLAYID_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_ovrlayId(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_OVRLAYID_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_maskId(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_MASKID_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_maskId(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_MASKID_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_motionSpeed(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_MOTIONSPEED_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_motionSpeed(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_MOTIONSPEED_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_colorFormat(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_COLORFORMAT_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_colorFormat(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_COLORFORMAT_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_crossHairX(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_CROSSHAIRX_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_crossHairX(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_CROSSHAIRX_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_crossHairY(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_CROSSHAIRY_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_crossHairY(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_CROSSHAIRY_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_ZplateHorContStart(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_ZPLATEHORCONTSTART_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_ZplateHorContStart(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_ZPLATEHORCONTSTART_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_ZplateHorContDelta(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_ZPLATEHORCONTDELTA_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_ZplateHorContDelta(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_ZPLATEHORCONTDELTA_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_ZplateVerContStart(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_ZPLATEVERCONTSTART_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_ZplateVerContStart(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_ZPLATEVERCONTSTART_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_ZplateVerContDelta(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_ZPLATEVERCONTDELTA_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_ZplateVerContDelta(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_ZPLATEVERCONTDELTA_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_boxSize(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_BOXSIZE_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_boxSize(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_BOXSIZE_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_boxColorR(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_BOXCOLORR_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_boxColorR(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_BOXCOLORR_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_boxColorG(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_BOXCOLORG_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_boxColorG(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_BOXCOLORG_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_boxColorB(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_BOXCOLORB_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_boxColorB(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_BOXCOLORB_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_dpDynamicRange(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_DPDYNAMICRANGE_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_dpDynamicRange(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_DPDYNAMICRANGE_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_dpYUVCoef(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_DPYUVCOEF_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_dpYUVCoef(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_DPYUVCOEF_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_field_id(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_FIELD_ID_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_field_id(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_FIELD_ID_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_Set_bck_motion_en(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_BCK_MOTION_EN_DATA, Data);
}

u32 XTop_design_v_tpg_0_1_v_tpg_Get_bck_motion_en(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_BCK_MOTION_EN_DATA);
    return Data;
}

void XTop_design_v_tpg_0_1_v_tpg_InterruptGlobalEnable(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_GIE, 1);
}

void XTop_design_v_tpg_0_1_v_tpg_InterruptGlobalDisable(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_GIE, 0);
}

void XTop_design_v_tpg_0_1_v_tpg_InterruptEnable(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_IER);
    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_IER, Register | Mask);
}

void XTop_design_v_tpg_0_1_v_tpg_InterruptDisable(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_IER);
    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_IER, Register & (~Mask));
}

void XTop_design_v_tpg_0_1_v_tpg_InterruptClear(XTop_design_v_tpg_0_1_v_tpg *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_tpg_0_1_v_tpg_WriteReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_ISR, Mask);
}

u32 XTop_design_v_tpg_0_1_v_tpg_InterruptGetEnabled(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_IER);
}

u32 XTop_design_v_tpg_0_1_v_tpg_InterruptGetStatus(XTop_design_v_tpg_0_1_v_tpg *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTop_design_v_tpg_0_1_v_tpg_ReadReg(InstancePtr->Top_design_v_tpg_0_1_ctrl_BaseAddress, XTOP_DESIGN_V_TPG_0_1_V_TPG_TOP_DESIGN_V_TPG_0_1_CTRL_ADDR_ISR);
}

