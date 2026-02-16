// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xtop_design_v_frmbuf_wr_0_0_v_frmbuf_wr.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_CfgInitialize(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress = ConfigPtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Start(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_AP_CTRL) & 0x80;
    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_IsDone(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_IsIdle(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_IsReady(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_EnableAutoRestart(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_AP_CTRL, 0x80);
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_DisableAutoRestart(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_AP_CTRL, 0);
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_width(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_WIDTH_DATA, Data);
}

u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_width(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_WIDTH_DATA);
    return Data;
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_height(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_HEIGHT_DATA, Data);
}

u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_height(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_HEIGHT_DATA);
    return Data;
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_stride(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_STRIDE_DATA, Data);
}

u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_stride(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_STRIDE_DATA);
    return Data;
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_video_format(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_VIDEO_FORMAT_DATA, Data);
}

u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_video_format(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_VIDEO_FORMAT_DATA);
    return Data;
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_frm_buffer(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_FRM_BUFFER_DATA, Data);
}

u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_frm_buffer(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_FRM_BUFFER_DATA);
    return Data;
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_frm_buffer2(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_FRM_BUFFER2_DATA, Data);
}

u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_frm_buffer2(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_FRM_BUFFER2_DATA);
    return Data;
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_frm_buffer3(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_FRM_BUFFER3_DATA, Data);
}

u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_frm_buffer3(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_FRM_BUFFER3_DATA);
    return Data;
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptGlobalEnable(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_GIE, 1);
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptGlobalDisable(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_GIE, 0);
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptEnable(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_IER);
    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_IER, Register | Mask);
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptDisable(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_IER);
    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_IER, Register & (~Mask));
}

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptClear(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_ISR, Mask);
}

u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptGetEnabled(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_IER);
}

u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptGetStatus(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(InstancePtr->Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress, XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_TOP_DESIGN_V_FRMBUF_WR_0_0_CTRL_ADDR_ISR);
}

