/******************************************************************************
* Copyright (C) 2010 - 2021 Xilinx, Inc.  All rights reserved.
* Copyright (c) 2022 - 2025 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

#ifndef XGPIOPS_H		/* prevent circular inclusions */
#define XGPIOPS_H		/**< by using protection macros */

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/

#include "xl_status.h"
#include "xl_gpios_hw.h"
#include "xl_platform_info.h"

/************************** Constant Definitions *****************************/

/** @name Interrupt types
 *  @{
 * The following constants define the interrupt types that can be set for each
 * GPIO pin.
 */
#define XGPIOPS_IRQ_TYPE_EDGE_RISING	0x00U  /**< Interrupt on Rising edge */
#define XGPIOPS_IRQ_TYPE_EDGE_FALLING	0x01U  /**< Interrupt Falling edge */
#define XGPIOPS_IRQ_TYPE_EDGE_BOTH	0x02U  /**< Interrupt on both edges */
#define XGPIOPS_IRQ_TYPE_LEVEL_HIGH	0x03U  /**< Interrupt on high level */
#define XGPIOPS_IRQ_TYPE_LEVEL_LOW	0x04U  /**< Interrupt on low level */
/** @}*/

#define XGPIOPS_BANK_MAX_PINS		(u32)32 /**< Max pins in a GPIO bank */
#define XGPIOPS_BANK0			0x00U  /**< GPIO Bank 0 */
#define XGPIOPS_BANK1			0x01U  /**< GPIO Bank 1 */
#define XGPIOPS_BANK2			0x02U  /**< GPIO Bank 2 */
#define XGPIOPS_BANK3			0x03U  /**< GPIO Bank 3 */
#define XGPIOPS_BANK4			0x04U  /**< GPIO Bank 4 */
#define XGPIOPS_BANK5			0x05U  /**< GPIO Bank 5 */

#define XGPIOPS_MAX_BANKS_ZYNQMP		0x06U  /**< Max banks in a
										*	Zynq Ultrascale+ MP GPIO device
										*/
#define XGPIOPS_MAX_BANKS		0x04U  /**< Max banks in a Zynq GPIO device */
#define XGPIOPS_MAX_BANKS_CNT		0x06U  /**< Max banks number of all platforms */

#define XGPIOPS_DEVICE_MAX_PIN_NUM_ZYNQMP	(u32)174 /**< Max pins in the
						  *	Zynq Ultrascale+ MP GPIO device
					      * 0 - 25,  Bank 0
					      * 26 - 51, Bank 1
					      *	52 - 77, Bank 2
					      *	78 - 109, Bank 3
					      *	110 - 141, Bank 4
					      *	142 - 173, Bank 5
					      */
#define XGPIOPS_DEVICE_MAX_PIN_NUM	(u32)118 /**< Max pins in the Zynq GPIO device
					      * 0 - 31,  Bank 0
					      * 32 - 53, Bank 1
					      *	54 - 85, Bank 2
					      *	86 - 117, Bank 3
					      */

/**************************** Type Definitions *******************************/

/****************************************************************************/
/**
 * This handler data type allows the user to define a callback function to
 * handle the interrupts for the GPIO device. The application using this
 * driver is expected to define a handler of this type, to support interrupt
 * driven mode. The handler executes in an interrupt context such that minimal
 * processing should be performed.
 *
 * @param	CallBackRef is a callback reference passed in by the upper layer
 *		when setting the callback functions for a GPIO bank. It is
 *		passed back to the upper layer when the callback is invoked. Its
 *		type is not important to the driver component, so it is a void
 *		pointer.
 * @param	Bank is the bank for which the interrupt status has changed.
 * @param	Status is the Interrupt status of the GPIO bank.
 *
 *****************************************************************************/
typedef void (*XL_GpioPs_Handler) (void *CallBackRef, u32 Bank, u32 Status);

/**
 * This typedef contains configuration information for a device.
 */
typedef struct {
#ifndef SDT
	u16 DeviceId;		/**< Unique ID of device */
#else
	char *Name;
#endif
	UINTPTR BaseAddr;		/**< Register base address */
#ifdef SDT
	u16 IntrId;		/** Bits[11:0] Interrupt-id Bits[15:12]
				 * trigger type and level flags */
	UINTPTR IntrParent; 	/** Bit[0] Interrupt parent type Bit[64/32:1]
				 * Parent base address */
#endif
} XL_GpioPs_Config;

/**
 * The XL_GpioPs driver instance data. The user is required to allocate a
 * variable of this type for the GPIO device in the system. A pointer
 * to a variable of this type is then passed to the driver API functions.
 */
typedef struct {
	XL_GpioPs_Config GpioConfig;	/**< Device configuration */
	u32 IsReady;			/**< Device is initialized and ready */
	XL_GpioPs_Handler Handler;	/**< Status handlers for all banks */
	void *CallBackRef; 		/**< Callback ref for bank handlers */
	u32 Platform;			/**< Platform data */
	u32 MaxPinNum;			/**< Max pins in the GPIO device */
	u8 MaxBanks;			/**< Max banks in a GPIO device */
        u32 PmcGpio;                    /**< Flag for accessing PS GPIO for versal*/
	u32 CoreIntrMask[XGPIOPS_MAX_BANKS_CNT]; /**< Interrupt mask per core */
} XL_GpioPs;

/************************** Variable Definitions *****************************/
extern XL_GpioPs_Config XL_GpioPs_ConfigTable[];

/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

/* Functions in xgpiops.c */
s32 XL_GpioPs_CfgInitialize(XL_GpioPs *InstancePtr, const XL_GpioPs_Config *ConfigPtr,
			   UINTPTR EffectiveAddr);

/* Bank APIs in xgpiops.c */
u32 XL_GpioPs_Read(const XL_GpioPs *InstancePtr, u8 Bank);
void XL_GpioPs_Write(const XL_GpioPs *InstancePtr, u8 Bank, u32 Data);
void XL_GpioPs_SetDirection(const XL_GpioPs *InstancePtr, u8 Bank, u32 Direction);
u32 XL_GpioPs_GetDirection(const XL_GpioPs *InstancePtr, u8 Bank);
void XL_GpioPs_SetOutputEnable(const XL_GpioPs *InstancePtr, u8 Bank, u32 OpEnable);
u32 XL_GpioPs_GetOutputEnable(const XL_GpioPs *InstancePtr, u8 Bank);
#ifdef versal
void XL_GpioPs_GetBankPin(const XL_GpioPs *InstancePtr,u8 PinNumber,u8 *BankNumber, u8 *PinNumberInBank);
#else
void XL_GpioPs_GetBankPin(u8 PinNumber,u8 *BankNumber, u8 *PinNumberInBank);
#endif

/* Pin APIs in xgpiops.c */
u32 XL_GpioPs_ReadPin(const XL_GpioPs *InstancePtr, u32 Pin);
void XL_GpioPs_WritePin(const XL_GpioPs *InstancePtr, u32 Pin, u32 Data);
void XL_GpioPs_SetDirectionPin(const XL_GpioPs *InstancePtr, u32 Pin, u32 Direction);
u32 XL_GpioPs_GetDirectionPin(const XL_GpioPs *InstancePtr, u32 Pin);
void XL_GpioPs_SetOutputEnablePin(const XL_GpioPs *InstancePtr, u32 Pin, u32 OpEnable);
u32 XL_GpioPs_GetOutputEnablePin(const XL_GpioPs *InstancePtr, u32 Pin);

/* Diagnostic functions in xgpiops_selftest.c */
s32 XL_GpioPs_SelfTest(XL_GpioPs *InstancePtr);

/* Functions in xgpiops_intr.c */
/* Bank APIs in xgpiops_intr.c */
void XL_GpioPs_IntrEnable(XL_GpioPs *InstancePtr, u8 Bank, u32 Mask);
void XL_GpioPs_IntrDisable(XL_GpioPs *InstancePtr, u8 Bank, u32 Mask);
u32 XL_GpioPs_IntrGetEnabled(const XL_GpioPs *InstancePtr, u8 Bank);
u32 XL_GpioPs_IntrGetStatus(const XL_GpioPs *InstancePtr, u8 Bank);
void XL_GpioPs_IntrClear(const XL_GpioPs *InstancePtr, u8 Bank, u32 Mask);
void XL_GpioPs_SetIntrType(const XL_GpioPs *InstancePtr, u8 Bank, u32 IntrType,
			  u32 IntrPolarity, u32 IntrOnAny);
void XL_GpioPs_GetIntrType(const XL_GpioPs *InstancePtr, u8 Bank, u32 *IntrType,
			  u32 *IntrPolarity, u32 *IntrOnAny);
void XL_GpioPs_SetCallbackHandler(XL_GpioPs *InstancePtr, void *CallBackRef,
			     XL_GpioPs_Handler FuncPointer);
void XL_GpioPs_IntrHandler(const XL_GpioPs *InstancePtr);

/* Pin APIs in xgpiops_intr.c */
void XL_GpioPs_SetIntrTypePin(const XL_GpioPs *InstancePtr, u32 Pin, u8 IrqType);
u8 XL_GpioPs_GetIntrTypePin(const XL_GpioPs *InstancePtr, u32 Pin);

void XL_GpioPs_IntrEnablePin(XL_GpioPs *InstancePtr, u32 Pin);
void XL_GpioPs_IntrDisablePin(XL_GpioPs *InstancePtr, u32 Pin);
u32 XL_GpioPs_IntrGetEnabledPin(const XL_GpioPs *InstancePtr, u32 Pin);
u32 XL_GpioPs_IntrGetStatusPin(const XL_GpioPs *InstancePtr, u32 Pin);
void XL_GpioPs_IntrClearPin(const XL_GpioPs *InstancePtr, u32 Pin);

/* Functions in xgpiops_sinit.c */
#ifndef SDT
XL_GpioPs_Config *XL_GpioPs_LookupConfig(u16 DeviceId);
#else
XL_GpioPs_Config *XL_GpioPs_LookupConfig(u32 BaseAddress);
#endif
#ifdef __cplusplus
}
#endif

#endif /* end of protection macro */
/** @} */
