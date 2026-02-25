/******************************************************************************
* Copyright (c) 2021 Xilinx, Inc.  All rights reserved.
* Copyright (c) 2022 - 2025 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*****************************************************************************/
/**
*
* @file xinterrupt_wrap.c
*
* The xinterrupt_wrap.c file contains interrupt related functions and macros.
* Contains wrapper functions for the scugic/axi intc Interrupt controller
* drivers.
*
* @{
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who    Date   Changes
* ----- ---- -------- -------------------------------------------------------
* 7.2   mus  22/11/21 First release of xil interrupt support
* 9.0   adk  17/04/23 Added support for system device-tree flow
* 9.0   adk  27/04/23 Use XL_ScuGic_LookupConfigBaseAddr() API for xsct flow
* 9.1   mus  16/04/24 Add support for software generated interrupts.
* 9.2   ml   05/08/24 Add Support for connecting fast interrupt for intc.
* 9.2   adk  11/09/24 Update XGetPriorityTriggerType() with IntrId to IntrNum
* 		      transformation.
* 9.2   ml   19/09/24 Fix compilation warnings by typecasting and adding
*                     conditional compilation checks.
* 9.4   ml   24/07/24 Fixed GCC warnings
* </pre>
*
******************************************************************************/

#include "xl_interrupt_wrap.h"

#ifdef XIL_INTERRUPT

#if defined (XPAR_SCUGIC) /* available in xscugic.h */
static XScuGic XScuGicInstance;
static int ScuGicInitialized;
#endif

#if defined (XPAR_AXI_INTC) /* available in xintc.h */
static XIntc XIntcInstance ;
#endif

/*****************************************************************************/
/**
*
* @brief    Initializes the interrupt controller.
*
* @param    IntcParent: Interrupt controller baseaddress and type.
*
* @return   XST_SUCCESS if initialization was successful
* 	    XST_FAILURE in case of failure
*
* @note     None.
*
******************************************************************************/
int XL_ConfigInterruptCntrl(UINTPTR IntcParent)
{
#if defined (XPAR_AXI_INTC) || defined (XPAR_SCUGIC)
	int Status = XST_FAILURE;
	UINTPTR BaseAddr = XL_Get_BaseAddr(IntcParent);
#endif

	if (XL_Get_IntcType(IntcParent) == XINTC_TYPE_IS_SCUGIC) {
#if defined (XPAR_SCUGIC)
		XL_ScuGic_Config *CfgPtr = NULL;
		if (XScuGicInstance.IsReady != XIL_COMPONENT_IS_READY) {
#if defined(SDT)
			CfgPtr = XL_ScuGic_LookupConfig(BaseAddr);
#else
			CfgPtr = XL_ScuGic_LookupConfigBaseAddr(BaseAddr);
#endif
			if (!ScuGicInitialized) {
				Status = XL_ScuGic_CfgInitialize(&XScuGicInstance, CfgPtr, 0);
			} else {
				Status = XST_SUCCESS;
			}
		} else {
			Status = XST_SUCCESS;
		}
		return Status;
#else
		return XST_FAILURE;
#endif
	} else {
#if defined (XPAR_AXI_INTC)
		if (XIntcInstance.IsStarted != XIL_COMPONENT_IS_STARTED) {
			Status = XL_Intc_Initialize(&XIntcInstance, BaseAddr);
		} else {
			Status = XST_SUCCESS;
		}
		return Status;
#else
		return XST_FAILURE;
#endif
	}
}

/*****************************************************************************/
/**
*
* @brief    connects to the interrupt controller.
*
* @param    IntrId: Interrupt Id.
* @param    IntrHandler: Interrupt handler.
* @param    CallBackRef: Callback reference for handler.
* @param    IntcParent: Interrupt controller baseaddress and type.
*
* @return   XST_SUCCESS if initialization was successful
* 	    XST_FAILURE in case of failure
*
* @note     None.
*
******************************************************************************/
int XL_ConnectToInterruptCntrl(u32 IntrId, void *IntrHandler, void *CallBackRef, UINTPTR IntcParent)
{
	int Status = XST_FAILURE;
#if !defined (XPAR_AXI_INTC) && !defined (XPAR_SCUGIC)
	(void)IntrId;
	(void)IntrHandler;
	(void)CallBackRef;
#endif
#if defined (XPAR_SCUGIC)
	int Doconnect = FALSE;
#endif

	if (XL_Get_IntcType(IntcParent) == XINTC_TYPE_IS_SCUGIC) {
#if defined (XPAR_SCUGIC)
		if (ScuGicInitialized) {
			Doconnect = 1;
		}
		if (Doconnect) {
			u16 IntrNum = XL_Get_IntrId(IntrId);
			u16 Offset = XL_Get_IntrOffset(IntrId);

			IntrNum += Offset;
			Status = XL_ScuGic_Connect(&XScuGicInstance, IntrNum,  \
						 (Xil_ExceptionHandler) IntrHandler, CallBackRef);
			return Status;
		} else {
			return XST_SUCCESS;
		}
#else
		return Status;
#endif
	} else {
#if defined (XPAR_AXI_INTC)
		u16 IntrNum = XL_Get_IntrId(IntrId);
		Status = XL_Intc_Connect(&XIntcInstance, IntrNum, \
				       (XInterruptHandler)IntrHandler, CallBackRef);
		return Status;
#else
		return Status;
#endif

	}
}

/*****************************************************************************/
/**
*
* @brief    connects to the Fast interrupt controller.
*
* @param    IntrId: Interrupt Id.
* @param    IntrHandler: Interrupt handler.
* @param    IntcParent: Interrupt controller baseaddress and type.
*
* @return   XST_SUCCESS if initialization was successful
* 	    XST_FAILURE in case of failure
*
* @note     None.
*
******************************************************************************/
#if defined (__MICROBLAZE__) || defined(__riscv)
int XL_ConnectToFastInterruptCntrl(u32 IntrId, void *IntrHandler, UINTPTR IntcParent)
{
	int Status = XST_FAILURE;
#if !defined (XPAR_AXI_INTC)
	(void)IntrId;
	(void)IntrHandler;
#endif

	if (XL_Get_IntcType(IntcParent) == XINTC_TYPE_IS_INTC) {
#if defined (XPAR_AXI_INTC)
		u16 IntrNum = XL_Get_IntrId(IntrId);
		Status = XL_Intc_ConnectFastHandler(&XIntcInstance, IntrNum, \
						  (XFastInterruptHandler)IntrHandler);
		return Status;
#else
		return XST_FAILURE;
#endif
	}
	return Status;
}
#endif
/*****************************************************************************/
/**
*
* @brief    disconnects the interrupt controller.
*
* @param    IntrId: Interrupt Id.
* @param    IntcParent: Interrupt controller baseaddress and type.
*
* @return   XST_SUCCESS if initialization was successful
* 	    XST_FAILURE in case of failure
*
* @note     None.
*
******************************************************************************/
int XDisconnectInterruptCntrl(u32 IntrId, UINTPTR IntcParent)
{
#if !defined (XPAR_SCUGIC) && !defined (XPAR_AXI_INTC)
	(void)IntrId;
#endif
	if (XL_Get_IntcType(IntcParent) == XINTC_TYPE_IS_SCUGIC) {
#if defined (XPAR_SCUGIC)
		u16 IntrNum = XL_Get_IntrId(IntrId);
		u16 Offset = XL_Get_IntrOffset(IntrId);

		IntrNum += Offset;
		XL_ScuGic_Disconnect(&XScuGicInstance, IntrNum);
#else
		return XST_FAILURE;
#endif
	} else {
#if defined (XPAR_AXI_INTC)
		u16 IntrNum = XL_Get_IntrId(IntrId);
		XL_Intc_Disconnect(&XIntcInstance, IntrNum);
#else
		return XST_FAILURE;
#endif
	}
	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* @brief    Starts the interrupt controller.
*
* @param    Mode: Interrupt controller mode type.
* @param    IntcParent: Interrupt controller baseaddress and type.
*
* @return   XST_SUCCESS if initialization was successful
* 	    XST_FAILURE in case of failure
*
* @note     None.
*
******************************************************************************/
int XL_StartInterruptCntrl(u32 Mode, UINTPTR IntcParent)
{
#if defined (XPAR_AXI_INTC)
	int Status = XST_FAILURE;
#else
	(void) Mode;
#endif
	if (XL_Get_IntcType(IntcParent) == XINTC_TYPE_IS_SCUGIC) {
		/*
		 * For XPAR_SCUGIC, XL_ConfigInterruptCntrl starts controller
		 * hence returning without doing anything
		 */
		return 0;
	} else  {
#if defined (XPAR_AXI_INTC)
		if (XIntcInstance.IsStarted != XIL_COMPONENT_IS_STARTED) {
			Status = XL_Intc_Start(&XIntcInstance, Mode);
		} else {
			Status = XST_SUCCESS;
		}
		return Status;
#else
		return XST_FAILURE;
#endif

	}

}

/*****************************************************************************/
/**
*
* @brief    Enable the interrupt id.
*
* @param    IntrId: Interrupt Id.
* @param    IntcParent: Interrupt controller baseaddress and type.
*
* @return   None.
*
* @note     None.
*
******************************************************************************/
void XL_EnableIntrId( u32 IntrId, UINTPTR IntcParent)
{
#if !defined (XPAR_SCUGIC) && !defined (XPAR_AXI_INTC)
        (void)IntrId;
#endif

	if (XL_Get_IntcType(IntcParent) == XINTC_TYPE_IS_SCUGIC) {
#if defined (XPAR_SCUGIC)
		u16 IntrNum = XL_Get_IntrId(IntrId);
		u16 Offset = XL_Get_IntrOffset(IntrId);
		IntrNum += Offset;
		XL_ScuGic_Enable(&XScuGicInstance, IntrNum);
#endif

	} else {
#if defined (XPAR_AXI_INTC)
		u16 IntrNum = XL_Get_IntrId(IntrId);
		XL_Intc_Enable(&XIntcInstance, IntrNum);
#endif
	}

}

/*****************************************************************************/
/**
*
* @brief    disable the interrupt id.
*
* @param    IntrId: Interrupt Id.
* @param    IntcParent: Interrupt controller baseaddress and type.
*
* @return   None.
*
* @note     None.
*
******************************************************************************/
void XL_DisableIntrId( u32 IntrId, UINTPTR IntcParent)
{
#if !defined (XPAR_SCUGIC) && !defined (XPAR_AXI_INTC)
        (void)IntrId;
#endif

	if (XL_Get_IntcType(IntcParent) == XINTC_TYPE_IS_SCUGIC) {
#if defined (XPAR_SCUGIC)
		u16 IntrNum = XL_Get_IntrId(IntrId);
		u16 Offset = XL_Get_IntrOffset(IntrId);

		IntrNum += Offset;
		XL_ScuGic_Disable(&XScuGicInstance, IntrNum);
#endif
	} else {
#if defined (XPAR_AXI_INTC)
		XL_Intc_Disable(&XIntcInstance, IntrId);
#endif
	}
}

#if defined (XPAR_SCUGIC)
/*****************************************************************************/
/**
*
* @brief    Configures the priority and trigger type.
*
* @param    IntrId: Interrupt Id.
* @param    Priority: Priority of the interrupt
* @param    IntcParent: Interrupt controller baseaddress and type.
*
* @return   None.
*
* @note     None.
*
******************************************************************************/
void XL_SetPriorityTriggerType( u32 IntrId, u8 Priority, UINTPTR IntcParent)
{
	u8 Trigger = (((XL_Get_TriggerType(IntrId) == 1) ||
		       (XL_Get_TriggerType(IntrId) == 2)) ? XINTR_IS_EDGE_TRIGGERED
		      : XINTR_IS_LEVEL_TRIGGERED);
	u16 IntrNum = XL_Get_IntrId(IntrId);
	u16 Offset = XL_Get_IntrOffset(IntrId);

	IntrNum += Offset;
	if (XL_Get_IntcType(IntcParent) == XINTC_TYPE_IS_SCUGIC) {
		XL_ScuGic_SetPriorityTriggerType(&XScuGicInstance, IntrNum, Priority, Trigger);
	}
}

/*****************************************************************************/
/**
*
* @brief    Gets the priority of the interrupt controller.
*
* @param    IntrId: Interrupt Id.
* @param    Priority: Priority of the interrupt
* @param    Trigger: Trigger type of the interrupt
* @param    IntcParent: Interrupt controller baseaddress and type.
*
* @return   None.
*
* @note     None.
*
******************************************************************************/
void XGetPriorityTriggerType( u32 IntrId, u8 *Priority, u8 *Trigger,  UINTPTR IntcParent)
{
	if (XL_Get_IntcType(IntcParent) == XINTC_TYPE_IS_SCUGIC) {
		u16 IntrNum = XL_Get_IntrId(IntrId);
		u16 Offset = XL_Get_IntrOffset(IntrId);

		IntrNum += Offset;
		XL_ScuGic_GetPriorityTriggerType(&XScuGicInstance, IntrNum, Priority, Trigger);
	}
}
#endif

/*****************************************************************************/
/**
*
* @brief    stops the interrupt controller.
*
* @param    IntcParent: Interrupt controller baseaddress and type.
*
* @return   None.
*
* @note     None.
*
******************************************************************************/
void XStopInterruptCntrl( UINTPTR IntcParent)
{
	if (XL_Get_IntcType(IntcParent) == XINTC_TYPE_IS_SCUGIC) {
#if defined (XPAR_SCUGIC)
		XL_ScuGic_Stop(&XScuGicInstance);
#endif
	} else {
#if defined (XPAR_AXI_INTC)
		XL_Intc_Stop(&XIntcInstance);
#endif
	}

}

/*****************************************************************************/
/**
*
* @brief    Registers the interrupt handler.
*
* @param    IntrHandler: Interrupt handler.
* @param    IntcParent: Interrupt controller baseaddress and type.
*
* @return   None.
*
* @note     None.
*
******************************************************************************/
void XRegisterInterruptHandler(void *IntrHandler,  UINTPTR IntcParent)
{
#if !defined (XPAR_SCUGIC) && !defined (XPAR_AXI_INTC)
	(void)IntrHandler;
#endif
	if (XL_Get_IntcType(IntcParent) == XINTC_TYPE_IS_SCUGIC) {
#if defined (XPAR_SCUGIC)
		if (IntrHandler == NULL) {
			Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, \
						     (Xil_ExceptionHandler) XL_ScuGic_InterruptHandler,
						     &XScuGicInstance);
		} else {
			Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, \
						     (Xil_ExceptionHandler) IntrHandler,
						     &XScuGicInstance);

		}
#endif
	} else {
#if defined (XPAR_AXI_INTC)
		if (IntrHandler == NULL) {
			Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, \
						     (Xil_ExceptionHandler) XL_Intc_InterruptHandler,
						     &XIntcInstance);
		} else {
			Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, \
						     (Xil_ExceptionHandler) IntrHandler,
						     &XIntcInstance);
		}
#endif
	}
}

/*****************************************************************************/
/**
*
* @brief    Setup the interrupt system.
*
* @param    DriverInstance: Driver instance pointer.
* @param    IntrHandler: Interrupt handler function pointer.
* @param    IntrId: Interrupt Id.
* @param    IntcParent: Interrupt controller baseaddress and type.
* @param    Priority: Interrupt priority.
*
* @return   XST_SUCCESS if initialization was successful
* 	    XST_FAILURE in case of failure
*
* @note     None.
*
******************************************************************************/
int XL_SetupInterruptSystem(void *DriverInstance, void *IntrHandler, u32 IntrId,  UINTPTR IntcParent,
			  u16 Priority)
{
	int Status;

	Status = XL_ConfigInterruptCntrl(IntcParent);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
#if defined (XPAR_SCUGIC)
	ScuGicInitialized = TRUE;
	XL_SetPriorityTriggerType( IntrId, Priority, IntcParent);
#else
	(void)Priority;
#endif
	Status = XL_ConnectToInterruptCntrl( IntrId, IntrHandler, \
					   DriverInstance, IntcParent);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
#if defined (XPAR_AXI_INTC)
	XL_StartInterruptCntrl(XIN_REAL_MODE, IntcParent);
#endif
	XRegisterInterruptHandler(NULL, IntcParent);
	XL_EnableIntrId(IntrId, IntcParent);
	Xil_ExceptionInit();
	Xil_ExceptionEnable();
	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* @brief    Convert legacy interrupt id to encoded interrupt ID needed by
*           interrupt wrapper layer.
*
* @param    LegacyIntrId Interrupt ID of specific peripheral/PL-PS interrupt
*           port documented in TRM of targeted SoC.
* @param  : TriggerType Trigger type for targted interrupt ID (documented in
*           TRM of targeted SoC)
* 		1 = low-to-high edge triggered
*	        2 = high-to-low edge triggered
*	        4 = active high level-sensitive
*	        8 = active low level-sensitive
*
* @param    IntrType Interrupt type of targeted interrupt ID.
* 		0 = SPI
* 		1 = PPI (not applicable for AXI INTC)
* 		2 = SGI
* @param    IntcType Parent interrupt controller of targeted interrupt ID
* 		1 = AXI INTC
* 		0 = GIC
*
* @param    IntrId Interrupt ID in encoded format compliant with interrupt
*           wrapper layer. It is output parameter.
* @return   XST_SUCCESS if LegacyIntrId is encoded successfully and copied to
*                       IntrId
*           XST_FAILURE in case of incorrect input parameter
*
* @note     None.
*
******************************************************************************/
s32 XGetEncodedIntrId(u32 LegacyIntrId, u32 TriggerType, u8 IntrType, u8 IntcType, u32 *IntrId )
{
	s32 Status = XST_FAILURE;

	if (IntcType != XINTC_TYPE_IS_SCUGIC && IntcType != XINTC_TYPE_IS_INTC) {
		return Status;
	}
	*IntrId = LegacyIntrId;

	if (IntcType == XINTC_TYPE_IS_SCUGIC) {
		if (IntrType == XSPI) {
			*IntrId -= 32;
		} else if (IntrType == XPPI) {
			*IntrId -= 16;
			*IntrId |= XINTC_INTR_TYPE_SHIFT;
		} else if (IntrType == XSGI) {
			*IntrId |= (1 << XINTC_IS_SGI_INTR_SHIFT);
		} else {
			return Status;
		}
	}

	Status = XST_SUCCESS;

	*IntrId |= ((TriggerType << XINTC_TRIGGER_SHIFT) & XINTC_TRIGGER_MASK);

	return Status;

}
/*****************************************************************************/
/**
*
* @brief    Trigger software interrupt
*
* @param    IntrId Targeted interrupt ID
* @param    IntcType Parent interrupt controller base address in encoded format
* @param    Cpu_Id List of CPUs to send the interrupt. NA for AXI INTC.
*           For VERSAL_NET bits 0-7 specifies core ID to send the interrupt.
*           bits 8-15 specifies the cluster id.

* @return   XST_SUCCESS - Successful generation of software interrupt
*           XST_FAILURE - in case of failure
*
* @note     None.
*
******************************************************************************/
s32 XTriggerSoftwareIntr(u32 IntrId, UINTPTR IntcParent, u32 Cpu_Id)
{
	s32 Status = XST_SUCCESS;
	u16 IntrNum = XL_Get_IntrId(IntrId);
#if !defined (XPAR_SCUGIC) && !defined (XPAR_AXI_INTC)
	(void) IntrNum;
	(void) Cpu_Id;
#endif

	if (XL_Get_IntcType(IntcParent) == XINTC_TYPE_IS_SCUGIC) {
#if defined (XPAR_SCUGIC)
		Status = XL_ScuGic_SoftwareIntr(&XScuGicInstance, IntrNum, Cpu_Id);
#endif
	} else {
#if defined (XPAR_AXI_INTC)
		(void) Cpu_Id;
		Status = XL_Intc_TriggerSwIntr(&XIntcInstance, IntrNum);
#endif
	}

	return Status;

}

#endif
