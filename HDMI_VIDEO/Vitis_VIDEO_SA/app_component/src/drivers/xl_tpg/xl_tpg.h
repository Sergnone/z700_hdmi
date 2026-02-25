// ==============================================================
// Copyright (c) 2015 - 2021 Xilinx Inc. All rights reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// SPDX-License-Identifier: MIT
// ==============================================================

#ifndef XL_TPG_H
#define XL_TPG_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#include "xl_status.h"
#include "xl_io.h"
#include "xl_tpg_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t uint8_t;
typedef uint16_t uint16_t;
typedef uint32_t uint32_t;
#else

/**
 * This typedef enumerates the different patterns supported by TPG
 */
typedef enum
{
  XTPG_BKGND_H_RAMP = 1,
  XTPG_BKGND_V_RAMP,
  XTPG_BKGND_TEMPORAL_RAMP,
  XTPG_BKGND_SOLID_RED,
  XTPG_BKGND_SOLID_GREEN,
  XTPG_BKGND_SOLID_BLUE,
  XTPG_BKGND_SOLID_BLACK,
  XTPG_BKGND_SOLID_WHITE,
  XTPG_BKGND_COLOR_BARS,
  XTPG_BKGND_ZONE_PLATE,
  XTPG_BKGND_TARTAN_COLOR_BARS,
  XTPG_BKGND_CROSS_HATCH,
  XTPG_BKGND_RAINBOW_COLOR,
  XTPG_BKGND_HV_RAMP,
  XTPG_BKGND_CHECKER_BOARD,
  XTPG_BKGND_PBRS,
  XTPG_BKGND_DP_COLOR_RAMP,
  XTPG_BKGND_DP_BW_VERTICAL_LINE,
  XTPG_BKGND_DP_COLOR_SQUARE,
  XTPG_BKGND_LAST
}XL_Tpg_PatternId;

typedef void (*XL_Tpg_Callback)(void *InstancePtr);

/************************** Constant Definitions *****************************/
#define XVTPG_IRQ_DONE_MASK            (0x01)
#define XVTPG_IRQ_READY_MASK           (0x02)

typedef enum {
  XVTPG_HANDLER_DONE = 1,  /**< Handler for ap_done */
  XVTPG_HANDLER_READY      /**< Handler for ap_ready */
} XL_VTPG_HandlerType;

/**
* This typedef contains configuration information for the tpg core
* Each core instance should have a configuration structure associated.
*/
typedef struct {
#ifndef SDT
    uint16_t DeviceId;          /**< Unique ID  of device */
#else
    char *Name;
#endif
    UINTPTR BaseAddress;   /**< The base address of the core instance. */
    uint16_t HasAxi4sSlave;     /**< Axi4s Slave capability indicator */
    uint16_t PixPerClk;         /**< Samples Per Clock supported by core instance */
    uint16_t NumVidComponents;  /**< Number of Video Components */
    uint16_t MaxWidth;          /**< Maximum columns supported by core instance */
    uint16_t MaxHeight;         /**< Maximum rows supported by core instance */
    uint16_t MaxDataWidth;      /**< Maximum Data width of each channel */
	uint16_t SolidColorEnable;  /**< Axi4s Slave capability indicator */
	uint16_t RampEnable;        /**< Axi4s Slave capability indicator */
	uint16_t ColorBarEnable;    /**< Axi4s Slave capability indicator */
	uint16_t DisplayPortEnable; /**< Axi4s Slave capability indicator */
	uint16_t ColorSweepEnable;  /**< Axi4s Slave capability indicator */
	uint16_t ZoneplateEnable;   /**< Axi4s Slave capability indicator */
	uint16_t ForegroundEnable;  /**< Axi4s Slave capability indicator */
#ifdef SDT
    uint16_t IntrId; 		    /**< Interrupt ID */
    UINTPTR IntrParent; 	/**< Bit[0] Interrupt parent type Bit[64/32:1] Parent base address */
#endif
} XL_tpg_Config;
#endif

/**
* Driver instance data. An instance must be allocated for each core in use.
*/
typedef struct {
    XL_tpg_Config Config;  /**< Hardware Configuration */
    uint32_t IsReady;           /**< Device is initialized and ready */
    XL_Tpg_Callback FrameDoneCallback;
    void *CallbackDoneRef;     /**< To be passed to the connect interrupt
                                callback */
    XL_Tpg_Callback FrameReadyCallback;
    void *CallbackReadyRef;     /**< To be passed to the connect interrupt
                                callback */
} XL_tpg;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XL_tpg_WriteReg(BaseAddress, RegOffset, Data) \
    Xl_Out32((BaseAddress) + (RegOffset), (uint32_t)(Data))
#define XL_tpg_ReadReg(BaseAddress, RegOffset) \
    Xl_In32((BaseAddress) + (RegOffset))
#else
#define XL_tpg_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile uint32_t*)((BaseAddress) + (RegOffset)) = (uint32_t)(Data)
#define XL_tpg_ReadReg(BaseAddress, RegOffset) \
    *(volatile uint32_t*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifndef SDT
int XL_tpg_Initialize(XL_tpg *InstancePtr, uint16_t DeviceId);
XL_tpg_Config* XL_tpg_LookupConfig(uint16_t DeviceId);
#else
int XL_tpg_Initialize(XL_tpg *InstancePtr, UINTPTR BaseAddress);
XL_tpg_Config* XL_tpg_LookupConfig(UINTPTR BaseAddress);
#endif
int XL_tpg_CfgInitialize(XL_tpg *InstancePtr,
                         XL_tpg_Config *ConfigPtr,
                         UINTPTR EffectiveAddr);
#else
int XL_tpg_Initialize(XL_tpg *InstancePtr, const char* InstanceName);
int XL_tpg_Release(XL_tpg *InstancePtr);
#endif

void XL_tpg_Start(XL_tpg *InstancePtr);
uint32_t XL_tpg_IsDone(XL_tpg *InstancePtr);
uint32_t XL_tpg_IsIdle(XL_tpg *InstancePtr);
uint32_t XL_tpg_IsReady(XL_tpg *InstancePtr);
void XL_tpg_EnableAutoRestart(XL_tpg *InstancePtr);
void XL_tpg_DisableAutoRestart(XL_tpg *InstancePtr);

void XL_tpg_Set_height(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_height(XL_tpg *InstancePtr);
void XL_tpg_Set_width(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_width(XL_tpg *InstancePtr);
void XL_tpg_Set_bckgndId(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_bckgndId(XL_tpg *InstancePtr);
void XL_tpg_Set_motionEn(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_motionEnStatus(XL_tpg *InstancePtr);
void XL_tpg_Set_ovrlayId(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_ovrlayId(XL_tpg *InstancePtr);
void XL_tpg_Set_maskId(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_maskId(XL_tpg *InstancePtr);
void XL_tpg_Set_motionSpeed(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_motionSpeed(XL_tpg *InstancePtr);
void XL_tpg_Set_colorFormat(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_colorFormat(XL_tpg *InstancePtr);
void XL_tpg_Set_crossHairX(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_crossHairX(XL_tpg *InstancePtr);
void XL_tpg_Set_crossHairY(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_crossHairY(XL_tpg *InstancePtr);
void XL_tpg_Set_ZplateHorContStart(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_ZplateHorContStart(XL_tpg *InstancePtr);
void XL_tpg_Set_ZplateHorContDelta(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_ZplateHorContDelta(XL_tpg *InstancePtr);
void XL_tpg_Set_ZplateVerContStart(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_ZplateVerContStart(XL_tpg *InstancePtr);
void XL_tpg_Set_ZplateVerContDelta(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_ZplateVerContDelta(XL_tpg *InstancePtr);
void XL_tpg_Set_boxSize(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_boxSize(XL_tpg *InstancePtr);
void XL_tpg_Set_boxColorR(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_boxColorR(XL_tpg *InstancePtr);
void XL_tpg_Set_boxColorG(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_boxColorG(XL_tpg *InstancePtr);
void XL_tpg_Set_boxColorB(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_boxColorB(XL_tpg *InstancePtr);
void XL_tpg_Set_enableInput(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_enableInput(XL_tpg *InstancePtr);
void XL_tpg_Set_passthruStartX(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_passthruStartX(XL_tpg *InstancePtr);
void XL_tpg_Set_passthruStartY(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_passthruStartY(XL_tpg *InstancePtr);
void XL_tpg_Set_passthruEndX(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_passthruEndX(XL_tpg *InstancePtr);
void XL_tpg_Set_passthruEndY(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_passthruEndY(XL_tpg *InstancePtr);
void XL_tpg_Set_dpDynamicRange(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_dpDynamicRange(XL_tpg *InstancePtr);
void XL_tpg_Set_dpYUVCoef(XL_tpg *InstancePtr, uint32_t Data);
uint32_t XL_tpg_Get_dpYUVCoef(XL_tpg *InstancePtr);
void XL_tpg_Set_Interlaced(XL_tpg *InstancePtr, _Bool Data);
void XL_tpg_Set_Polarity(XL_tpg *InstancePtr, _Bool Data);
uint32_t XL_tpg_Get_fieldId(XL_tpg *InstancePtr);

void XL_tpg_InterruptGlobalEnable(XL_tpg *InstancePtr);
void XL_tpg_InterruptGlobalDisable(XL_tpg *InstancePtr);
void XL_tpg_InterruptEnable(XL_tpg *InstancePtr, uint32_t Mask);
void XL_tpg_InterruptDisable(XL_tpg *InstancePtr, uint32_t Mask);
void XL_tpg_InterruptClear(XL_tpg *InstancePtr, uint32_t Mask);
uint32_t XL_tpg_InterruptGetEnabled(XL_tpg *InstancePtr);
uint32_t XL_tpg_InterruptGetStatus(XL_tpg *InstancePtr);

void XVTpg_SetCallback(XL_tpg *InstancePtr, uint32_t HandlerType,
		void *CallbackFunc, void *CallbackRef);
void XVTpg_InterruptHandler(XL_tpg *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
