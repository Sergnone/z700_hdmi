// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_H
#define XTOP_DESIGN_V_FRMBUF_WR_0_0_V_FRMBUF_WR_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xtop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u32 Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress;
} XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Config;
#endif

typedef struct {
    u32 Top_design_v_frmbuf_wr_0_0_ctrl_BaseAddress;
    u32 IsReady;
} XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Initialize(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, UINTPTR BaseAddress);
XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Config* XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_LookupConfig(UINTPTR BaseAddress);
#else
int XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Initialize(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u16 DeviceId);
XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Config* XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_LookupConfig(u16 DeviceId);
#endif
int XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_CfgInitialize(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Config *ConfigPtr);
#else
int XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Initialize(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, const char* InstanceName);
int XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Release(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
#endif

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Start(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_IsDone(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_IsIdle(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_IsReady(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_EnableAutoRestart(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_DisableAutoRestart(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_width(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data);
u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_width(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_height(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data);
u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_height(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_stride(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data);
u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_stride(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_video_format(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data);
u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_video_format(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_frm_buffer(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data);
u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_frm_buffer(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_frm_buffer2(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data);
u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_frm_buffer2(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Set_frm_buffer3(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Data);
u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_Get_frm_buffer3(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);

void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptGlobalEnable(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptGlobalDisable(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptEnable(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Mask);
void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptDisable(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Mask);
void XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptClear(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr, u32 Mask);
u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptGetEnabled(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);
u32 XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr_InterruptGetStatus(XTop_design_v_frmbuf_wr_0_0_v_frmbuf_wr *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
