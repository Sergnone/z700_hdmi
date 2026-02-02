// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XTOP_DESIGN_V_TPG_0_0_V_TPG_H
#define XTOP_DESIGN_V_TPG_0_0_V_TPG_H

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
#include "xtop_design_v_tpg_0_0_v_tpg_hw.h"

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
    u64 Top_design_v_tpg_0_0_ctrl_BaseAddress;
} XTop_design_v_tpg_0_0_v_tpg_Config;
#endif

typedef struct {
    u64 Top_design_v_tpg_0_0_ctrl_BaseAddress;
    u32 IsReady;
} XTop_design_v_tpg_0_0_v_tpg;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XTop_design_v_tpg_0_0_v_tpg_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XTop_design_v_tpg_0_0_v_tpg_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XTop_design_v_tpg_0_0_v_tpg_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XTop_design_v_tpg_0_0_v_tpg_ReadReg(BaseAddress, RegOffset) \
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
int XTop_design_v_tpg_0_0_v_tpg_Initialize(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, UINTPTR BaseAddress);
XTop_design_v_tpg_0_0_v_tpg_Config* XTop_design_v_tpg_0_0_v_tpg_LookupConfig(UINTPTR BaseAddress);
#else
int XTop_design_v_tpg_0_0_v_tpg_Initialize(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u16 DeviceId);
XTop_design_v_tpg_0_0_v_tpg_Config* XTop_design_v_tpg_0_0_v_tpg_LookupConfig(u16 DeviceId);
#endif
int XTop_design_v_tpg_0_0_v_tpg_CfgInitialize(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, XTop_design_v_tpg_0_0_v_tpg_Config *ConfigPtr);
#else
int XTop_design_v_tpg_0_0_v_tpg_Initialize(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, const char* InstanceName);
int XTop_design_v_tpg_0_0_v_tpg_Release(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
#endif

void XTop_design_v_tpg_0_0_v_tpg_Start(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
u32 XTop_design_v_tpg_0_0_v_tpg_IsDone(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
u32 XTop_design_v_tpg_0_0_v_tpg_IsIdle(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
u32 XTop_design_v_tpg_0_0_v_tpg_IsReady(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_EnableAutoRestart(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_DisableAutoRestart(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);

void XTop_design_v_tpg_0_0_v_tpg_Set_height(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_height(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_width(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_width(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_bckgndId(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_bckgndId(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_ovrlayId(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_ovrlayId(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_maskId(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_maskId(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_motionSpeed(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_motionSpeed(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_colorFormat(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_colorFormat(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_crossHairX(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_crossHairX(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_crossHairY(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_crossHairY(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_ZplateHorContStart(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_ZplateHorContStart(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_ZplateHorContDelta(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_ZplateHorContDelta(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_ZplateVerContStart(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_ZplateVerContStart(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_ZplateVerContDelta(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_ZplateVerContDelta(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_boxSize(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_boxSize(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_boxColorR(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_boxColorR(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_boxColorG(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_boxColorG(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_boxColorB(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_boxColorB(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_dpDynamicRange(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_dpDynamicRange(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_dpYUVCoef(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_dpYUVCoef(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_field_id(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_field_id(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_Set_bck_motion_en(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Data);
u32 XTop_design_v_tpg_0_0_v_tpg_Get_bck_motion_en(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);

void XTop_design_v_tpg_0_0_v_tpg_InterruptGlobalEnable(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_InterruptGlobalDisable(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
void XTop_design_v_tpg_0_0_v_tpg_InterruptEnable(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Mask);
void XTop_design_v_tpg_0_0_v_tpg_InterruptDisable(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Mask);
void XTop_design_v_tpg_0_0_v_tpg_InterruptClear(XTop_design_v_tpg_0_0_v_tpg *InstancePtr, u32 Mask);
u32 XTop_design_v_tpg_0_0_v_tpg_InterruptGetEnabled(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);
u32 XTop_design_v_tpg_0_0_v_tpg_InterruptGetStatus(XTop_design_v_tpg_0_0_v_tpg *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
