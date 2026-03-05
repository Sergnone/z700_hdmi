// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XTOP_DESIGN_V_MIX_0_0_V_MIX_H
#define XTOP_DESIGN_V_MIX_0_0_V_MIX_H

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
#include "xtop_design_v_mix_0_0_v_mix_hw.h"

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
    u32 Top_design_v_mix_0_0_ctrl_BaseAddress;
} XTop_design_v_mix_0_0_v_mix_Config;
#endif

typedef struct {
    u32 Top_design_v_mix_0_0_ctrl_BaseAddress;
    u32 IsReady;
} XTop_design_v_mix_0_0_v_mix;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XTop_design_v_mix_0_0_v_mix_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XTop_design_v_mix_0_0_v_mix_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XTop_design_v_mix_0_0_v_mix_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XTop_design_v_mix_0_0_v_mix_ReadReg(BaseAddress, RegOffset) \
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
int XTop_design_v_mix_0_0_v_mix_Initialize(XTop_design_v_mix_0_0_v_mix *InstancePtr, UINTPTR BaseAddress);
XTop_design_v_mix_0_0_v_mix_Config* XTop_design_v_mix_0_0_v_mix_LookupConfig(UINTPTR BaseAddress);
#else
int XTop_design_v_mix_0_0_v_mix_Initialize(XTop_design_v_mix_0_0_v_mix *InstancePtr, u16 DeviceId);
XTop_design_v_mix_0_0_v_mix_Config* XTop_design_v_mix_0_0_v_mix_LookupConfig(u16 DeviceId);
#endif
int XTop_design_v_mix_0_0_v_mix_CfgInitialize(XTop_design_v_mix_0_0_v_mix *InstancePtr, XTop_design_v_mix_0_0_v_mix_Config *ConfigPtr);
#else
int XTop_design_v_mix_0_0_v_mix_Initialize(XTop_design_v_mix_0_0_v_mix *InstancePtr, const char* InstanceName);
int XTop_design_v_mix_0_0_v_mix_Release(XTop_design_v_mix_0_0_v_mix *InstancePtr);
#endif

void XTop_design_v_mix_0_0_v_mix_Start(XTop_design_v_mix_0_0_v_mix *InstancePtr);
u32 XTop_design_v_mix_0_0_v_mix_IsDone(XTop_design_v_mix_0_0_v_mix *InstancePtr);
u32 XTop_design_v_mix_0_0_v_mix_IsIdle(XTop_design_v_mix_0_0_v_mix *InstancePtr);
u32 XTop_design_v_mix_0_0_v_mix_IsReady(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_EnableAutoRestart(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_DisableAutoRestart(XTop_design_v_mix_0_0_v_mix *InstancePtr);

void XTop_design_v_mix_0_0_v_mix_Set_width(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_width(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_height(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_height(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_video_format(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_video_format(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_background_Y_R(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_background_Y_R(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_background_U_G(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_background_U_G(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_background_V_B(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_background_V_B(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_layerEnable(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_layerEnable(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_layerAlpha_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_layerAlpha_1(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_layerStartX_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_layerStartX_1(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_layerStartY_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_layerStartY_1(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_layerWidth_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_layerWidth_1(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_layerStride_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_layerStride_1(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_layerHeight_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_layerHeight_1(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_layerScaleFactor_1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_layerScaleFactor_1(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_layer1_buf1(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_layer1_buf1(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_layer1_buf2(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_layer1_buf2(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_layer1_buf3(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_layer1_buf3(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_Set_reserve(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Data);
u32 XTop_design_v_mix_0_0_v_mix_Get_reserve(XTop_design_v_mix_0_0_v_mix *InstancePtr);

void XTop_design_v_mix_0_0_v_mix_InterruptGlobalEnable(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_InterruptGlobalDisable(XTop_design_v_mix_0_0_v_mix *InstancePtr);
void XTop_design_v_mix_0_0_v_mix_InterruptEnable(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Mask);
void XTop_design_v_mix_0_0_v_mix_InterruptDisable(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Mask);
void XTop_design_v_mix_0_0_v_mix_InterruptClear(XTop_design_v_mix_0_0_v_mix *InstancePtr, u32 Mask);
u32 XTop_design_v_mix_0_0_v_mix_InterruptGetEnabled(XTop_design_v_mix_0_0_v_mix *InstancePtr);
u32 XTop_design_v_mix_0_0_v_mix_InterruptGetStatus(XTop_design_v_mix_0_0_v_mix *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
