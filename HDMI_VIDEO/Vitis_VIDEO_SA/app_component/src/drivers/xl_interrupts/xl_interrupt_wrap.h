/******************************************************************************
* Copyright (C) 2021 - 2022 Xilinx, Inc.  All rights reserved.
* Copyright (C) 2023 - 2024 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*****************************************************************************/
/**
*
* @file xinterrupt_wrap.h
*
* The xinterrupt_wrap.h file contains interrupt related functions and macros.
*
* @{
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who    Date   Changes
* ----- ---- -------- -------------------------------------------------------
* 7.2   mus  22/11/21 First release of xil interrupt support
* 8.0	sk   03/17/22 Update XINTC_BASEADDR_MASK macro to unsigned to
* 		      fix misra_c_2012_rule_7_2 violation.
* 9.0   ml   03/03/23 Add description to fix doxygen warnings.
* 9.1   mus  16/04/24 Add support for software generated interrupts.
* 9.2   ml   05/08/24 Add Support for connecting fast interrupt for intc.
* 9.2   ml   09/20/24 Added conditional compilation checks to avoid unused
* 		      declarations.
* </pre>
*
******************************************************************************/

#ifndef XL_INTERRUPT_WRAP_H		/**< prevent circular inclusions */
#define XL_INTERRUPT_WRAP_H		/**< by using protection macros */

#ifdef __cplusplus
extern "C" {
#endif

#include "xl_status.h"

#ifdef XIL_INTERRUPT

#include "xl_exception.h"

enum XIntrType {
	XSPI,
	XPPI,
	XSGI
};

#define XINTERRUPT_DEFAULT_PRIORITY     0xA0U 
#define XINTC_TYPE_IS_SCUGIC			0U
#define XINTC_TYPE_IS_INTC				1U
#define XINTR_IS_EDGE_TRIGGERED			3U
#define XINTR_IS_LEVEL_TRIGGERED		1U
#define XINTR_IS_SPI					0U
#define XINTR_IS_PPI					1U
#define XINTR_IS_SGI					2U

#define XINTC_TYPE_MASK					0x1
#define XINTC_INTR_TYPE_MASK			0x100000
#define XINTC_BASEADDR_MASK				0xFFFFFFFFFFFFFFFEU
#define XINTC_INTRID_MASK				0xFFF
#define XINTC_TRIGGER_MASK				0xF000
#define XINTC_IS_SGI_INTR_MASK			0x400000
#define XINTC_TRIGGER_SHIFT				12
#define XINTC_INTR_TYPE_SHIFT			20U
#define XINTC_IS_SGI_INTR_SHIFT			22U
#define XGet_IntcType(IntParent)		(IntParent & XINTC_TYPE_MASK)
#define XGet_IntrType(IntId)			((IntId & XINTC_INTR_TYPE_MASK) >> XINTC_INTR_TYPE_SHIFT)
#define XGet_BaseAddr(IntParent)		(IntParent & XINTC_BASEADDR_MASK)
#define XGet_IntrId(IntId)				(IntId & XINTC_INTRID_MASK)
#define XGet_TriggerType(IntId)			((IntId & XINTC_TRIGGER_MASK) >> XINTC_TRIGGER_SHIFT)
#define XGet_IntrOffset(IntId)			((XIsIntrTypeSGI(IntId) == 1) ? 0 : (( XGet_IntrType(IntId) == 1) ? 16 : 32)) /* For PPI offset is 16 and for SPI it is 32 */
#define XIsIntrTypeSGI(IntId)			((IntId & XINTC_IS_SGI_INTR_MASK) >> XINTC_IS_SGI_INTR_SHIFT)

/*****************************************************************************/
/**
*
* @brief    Get base address of parent interrupt controller in encoded format
*           needed by interrupt wrapper layer
*
* @param    IntcBaseAddr Physical base address of parent interrupt controller.
* @param    IntcType Parent interrupt controller type of targeted interrupt ID
*               1 = AXI INTC
*               0 = GIC

* @return   base address of parent interrupt controller in encoded format
*           needed by interrupt wrapper layer.
*
* @note     None.
*
******************************************************************************/

#define XGetEncodedIntcBaseAddr(IntParent, IntcType)	(IntParent | IntcType)

extern int XL_ConfigInterruptCntrl(UINTPTR IntcParent);
extern int XL_ConnectToInterruptCntrl(uint32_t IntrId, void *IntrHandler, void *CallBackRef,
				    UINTPTR IntcParent);
#if defined (__MICROBLAZE__) || defined(__riscv)
extern int XL_ConnectToFastInterruptCntrl(uint32_t IntrId, void *IntrHandler, UINTPTR IntcParent);
#endif
extern int XL_DisconnectInterruptCntrl(uint32_t IntrId, UINTPTR IntcParent);
extern int XL_StartInterruptCntrl(uint32_t Mode, UINTPTR IntcParent);
extern void XL_EnableIntrId( uint32_t IntrId, UINTPTR IntcParent);
extern void XL_DisableIntrId( uint32_t IntrId, UINTPTR IntcParent);
#if defined (XPAR_SCUGIC)
extern void XL_SetPriorityTriggerType( uint32_t IntrId, uint8_t Priority, UINTPTR IntcParent);
extern void XL_GetPriorityTriggerType( uint32_t IntrId, uint8_t *Priority, uint8_t *Trigger, UINTPTR IntcParent);
#endif
extern void XL_StopInterruptCntrl( UINTPTR IntcParent);
extern void XL_RegisterInterruptHandler( void *IntrHandler, UINTPTR IntcParent);
extern int XL_SetupInterruptSystem(void *DriverInstance, void *IntrHandler, uint32_t IntrId,
				 UINTPTR IntcParent,
				 uint16_t Priority);
extern s32 XL_GetEncodedIntrId(uint32_t LegacyIntrId, uint32_t TriggerType, uint8_t IntrType, uint8_t IntcType,
			     uint32_t *IntrId);
extern s32 XL_TriggerSoftwareIntr(uint32_t IntrId, UINTPTR IntcParent, uint32_t Cpu_Id);
#endif

#ifdef __cplusplus
}
#endif

#endif  /* end of protection macro */
