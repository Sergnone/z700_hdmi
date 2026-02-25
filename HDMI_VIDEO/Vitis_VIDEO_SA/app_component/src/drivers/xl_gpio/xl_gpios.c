/******************************************************************************
* Copyright (C) 2010 - 2021 Xilinx, Inc.  All rights reserved.
* Copyright (c) 2022 - 2025 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

/*****************************************************************************/
/**
*
* @file xgpiops.c
* @addtogroup gpiops Overview
* @{
*
* The XL_GpioPs driver. Functions in this file are the minimum required functions
* for this driver. See xgpiops.h for a detailed description of the driver.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- -----------------------------------------------
* 1.00a sv   01/15/10 First Release
* 1.01a sv   04/15/12 Removed the APIs XL_GpioPs_SetMode, XL_GpioPs_SetModePin
*                     XL_GpioPs_GetMode, XL_GpioPs_GetModePin as they are not
*		      relevant to Zynq device. The interrupts are disabled
*		      for output pins on all banks during initialization.
* 2.1   hk   04/29/14 Use Input data register DATA_RO for read. CR# 771667.
* 3.00  kvn  02/13/15 Modified code for MISRA-C:2012 compliance.
* 3.1	kvn  04/13/15 Add support for Zynq Ultrascale+ MP. CR# 856980.
* 3.1   aru  07/13/18 Resolved doxygen reported warnings. CR# 1006331.
* 3.4   aru  08/17/18 Resolved MISRA-C mandatory violations. CR# 1007751
* 3.5   sne  03/01/19 Fixes violations according to MISRAC-2012
*                     in safety mode and modified the code such as
*                     Use of mixed mode arithmetic,Declared the pointer param
*                     as Pointer to const,Casting operation to a pointer,
*                     Literal value requires a U suffix.
* 3.5   sne  03/13/19 Added Versal support.
* 3.12  gm   07/11/23 Added SDT support.
* 3.13  gm   03/15/24 Added multi-core interrupt support.
* 3.14  bkv  02/20/25 Changed data type of effective address from u32 to
*                     UINTPTR to support both 32-bit and 64-bit platforms.
*
* </pre>
*
******************************************************************************/

/***************************** Include Files *********************************/

#include "xl_gpios.h"

/************************** Constant Definitions *****************************/
/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/

/************************** Variable Definitions *****************************/


/************************** Function Prototypes ******************************/

void XL_StubHandler(void *CallBackRef, u32 Bank, u32 Status); /**< Stub handler */

/*****************************************************************************/
/**
*
* This function initializes a XL_GpioPs instance/driver.
* All members of the XL_GpioPs instance structure are initialized and
* StubHandlers are assigned to the Bank Status Handlers.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	ConfigPtr points to the XL_GpioPs device configuration structure.
* @param	EffectiveAddr is the device base address in the virtual memory
*		address space. If the address translation is not used then the
*		physical address should be passed.
*		Unexpected errors may occur if the address mapping is changed
*		after this function is invoked.
*
* @return	XST_SUCCESS always.
*
* @note		None.
*
******************************************************************************/
s32 XL_GpioPs_CfgInitialize(XL_GpioPs *InstancePtr, const XL_GpioPs_Config *ConfigPtr,
				UINTPTR EffectiveAddr)
{
	s32 Status = (s32)0;
	u8 i;

	/*
	 * Set some default values for instance data, don't indicate the device
	 * is ready to use until everything has been initialized successfully.
	 */
	InstancePtr->IsReady = 0U;
	InstancePtr->GpioConfig.BaseAddr = EffectiveAddr;
#ifndef SDT
	InstancePtr->GpioConfig.DeviceId = ConfigPtr->DeviceId;
#endif
	InstancePtr->Handler = (XL_GpioPs_Handler)XL_StubHandler;
	InstancePtr->Platform = XGetPlatform_Info();

	/* Initialize the Bank data based on platform */
	if (InstancePtr->Platform == (u32)XPLAT_ZYNQ_ULTRA_MP) {
		/*
		 *	Max pins in the ZynqMP GPIO device
		 *	0 - 25,  Bank 0
		 *	26 - 51, Bank 1
		 *	52 - 77, Bank 2
		 *	78 - 109, Bank 3
		 *	110 - 141, Bank 4
		 *	142 - 173, Bank 5
		 */
		InstancePtr->MaxPinNum = (u32)174;
		InstancePtr->MaxBanks = (u8)6;
	}
        else if (InstancePtr->Platform == (u32)XPLAT_VERSAL)
        {
                if(InstancePtr->PmcGpio == (u32)FALSE)
                {
                        /* Max pins in the PS_GPIO devices
                         *  0 -25, Bank 0
                         *  26-57, Bank 3
                         */
                        InstancePtr->MaxPinNum = (u32)58;
                        InstancePtr->MaxBanks = (u8)4;
                }
                else
                {
                        /* Max pins in the PMC_GPIO devices
                         * 0  - 25,Bank 0
                         * 26 - 51,Bank 1
                         * 52 - 83,Bank 3
                         * 84 - 115, Bank 4
                         */
                        InstancePtr->MaxPinNum = (u32)116;
                        InstancePtr->MaxBanks = (u8)5;
                }
        }
        else {
		/*
		 *	Max pins in the GPIO device
		 *	0 - 31,  Bank 0
		 *	32 - 53, Bank 1
		 *	54 - 85, Bank 2
		 *	86 - 117, Bank 3
		 */
		InstancePtr->MaxPinNum = (u32)118;
		InstancePtr->MaxBanks = (u8)4;
	}

	/*
	 * By default, interrupts are not masked in GPIO. Disable
	 * interrupts for all pins in all the 4 banks.
	 */
	for (i=(u8)0U;i<InstancePtr->MaxBanks;i++) {
                if (InstancePtr->Platform == XPLAT_VERSAL){
                        if(InstancePtr->PmcGpio == (u32)FALSE)
                        {
                                if((i== (u8)XGPIOPS_ONE)||(i== (u8)XGPIOPS_TWO))
                                {
                                        continue;
                                }
                                XL_GpioPs_WriteReg(InstancePtr->GpioConfig.BaseAddr,
                                                ((u32)(i) * XGPIOPS_REG_MASK_OFFSET) +
                                                XGPIOPS_INTDIS_OFFSET, 0xFFFFFFFFU);
                        }
                        else
                        {
                                if(i==(u32)XGPIOPS_TWO)
                                {
                                        continue;
                                }
                                XL_GpioPs_WriteReg(InstancePtr->GpioConfig.BaseAddr,
                                                ((u32)(i) * XGPIOPS_REG_MASK_OFFSET) +
                                                XGPIOPS_INTDIS_OFFSET, 0xFFFFFFFFU);

                       }
                }
                else
                {
		XL_GpioPs_WriteReg(InstancePtr->GpioConfig.BaseAddr,
					  ((u32)(i) * XGPIOPS_REG_MASK_OFFSET) +
					  XGPIOPS_INTDIS_OFFSET, 0xFFFFFFFFU);
                }
		InstancePtr->CoreIntrMask[i] = 0;
	}

	/* Indicate the component is now ready to use. */
	InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

	return Status;
}

/****************************************************************************/
/**
*
* Read the Data register of the specified GPIO bank.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	Bank is the bank number of the GPIO to operate on.
*
* @return	Current value of the Data register.
*
* @note		This function is used for reading the state of all the GPIO pins
*		of specified bank.
*
*****************************************************************************/
u32 XL_GpioPs_Read(const XL_GpioPs *InstancePtr, u8 Bank)
{

	return XL_GpioPs_ReadReg(InstancePtr->GpioConfig.BaseAddr,
				 ((u32)(Bank) * XGPIOPS_DATA_BANK_OFFSET) +
				 XGPIOPS_DATA_RO_OFFSET);
}

/****************************************************************************/
/**
*
* Read Data from the specified pin.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	Pin is the pin number for which the data has to be read.
*
* @return	Current value of the Pin (0 or 1).
*
* @note		This function is used for reading the state of the specified
*		GPIO pin.
*
*****************************************************************************/
u32 XL_GpioPs_ReadPin(const XL_GpioPs *InstancePtr, u32 Pin)
{
	u8 Bank;
	u8 PinNumber;

	/* Get the Bank number and Pin number within the bank. */
#ifdef versal
	XL_GpioPs_GetBankPin(InstancePtr,(u8)Pin, &Bank, &PinNumber);
#else
	XL_GpioPs_GetBankPin((u8)Pin, &Bank, &PinNumber);
#endif
	return (XL_GpioPs_ReadReg(InstancePtr->GpioConfig.BaseAddr,
				 ((u32)(Bank) * XGPIOPS_DATA_BANK_OFFSET) +
				 XGPIOPS_DATA_RO_OFFSET) >> (u32)PinNumber) & (u32)1;

}

/****************************************************************************/
/**
*
* Write to the Data register of the specified GPIO bank.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	Bank is the bank number of the GPIO to operate on.
* @param	Data is the value to be written to the Data register.
*
* @return	None.
*
* @note		This function is used for writing to all the GPIO pins of
*		the bank. The previous state of the pins is not maintained.
*
*****************************************************************************/
void XL_GpioPs_Write(const XL_GpioPs *InstancePtr, u8 Bank, u32 Data)
{
	XL_GpioPs_WriteReg(InstancePtr->GpioConfig.BaseAddr,
			  ((u32)(Bank) * XGPIOPS_DATA_BANK_OFFSET) +
			  XGPIOPS_DATA_OFFSET, Data);
}

/****************************************************************************/
/**
*
* Write data to the specified pin.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	Pin is the pin number to which the Data is to be written.
* @param	Data is the data to be written to the specified pin (0 or 1).
*
* @return	None.
*
* @note		This function does a masked write to the specified pin of
*		the specified GPIO bank. The previous state of other pins
*		is maintained.
*
*****************************************************************************/
void XL_GpioPs_WritePin(const XL_GpioPs *InstancePtr, u32 Pin, u32 Data)
{
	u32 RegOffset;
	u32 Value;
	u8 Bank;
	u8 PinNumber;
	u32 DataVar = Data;

	/* Get the Bank number and Pin number within the bank. */
#ifdef versal
	XL_GpioPs_GetBankPin(InstancePtr,(u8)Pin, &Bank, &PinNumber);
#else
	XL_GpioPs_GetBankPin((u8)Pin, &Bank, &PinNumber);
#endif

	if (PinNumber > 15U) {
		/* There are only 16 data bits in bit maskable register. */
		PinNumber -= (u8)16;
		RegOffset = XGPIOPS_DATA_MSW_OFFSET;
	} else {
		RegOffset = XGPIOPS_DATA_LSW_OFFSET;
	}

	/*
	 * Get the 32 bit value to be written to the Mask/Data register where
	 * the upper 16 bits is the mask and lower 16 bits is the data.
	 */
	DataVar &= (u32)0x01;
	Value = ~((u32)1 << (PinNumber + 16U)) & ((DataVar << PinNumber) | 0xFFFF0000U);
	XL_GpioPs_WriteReg(InstancePtr->GpioConfig.BaseAddr,
			  ((u32)(Bank) * XGPIOPS_DATA_MASK_OFFSET) +
			  RegOffset, Value);

}



/****************************************************************************/
/**
*
* Set the Direction of the pins of the specified GPIO Bank.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	Bank is the bank number of the GPIO to operate on.
* @param	Direction is the 32 bit mask of the Pin direction to be set for
*		all the pins in the Bank. Bits with 0 are set to Input mode,
*		bits with 1 are	set to Output Mode.
*
* @return	None.
*
* @note		This function is used for setting the direction of all the pins
*		in the specified bank. The previous state of the pins is
*		not maintained.
*
*****************************************************************************/
void XL_GpioPs_SetDirection(const XL_GpioPs *InstancePtr, u8 Bank, u32 Direction)
{

	XL_GpioPs_WriteReg(InstancePtr->GpioConfig.BaseAddr,
			  ((u32)(Bank) * XGPIOPS_REG_MASK_OFFSET) +
			  XGPIOPS_DIRM_OFFSET, Direction);
}

/****************************************************************************/
/**
*
* Set the Direction of the specified pin.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	Pin is the pin number to which the Data is to be written.
* @param	Direction is the direction to be set for the specified pin.
*		Valid values are 0 for Input Direction, 1 for Output Direction.
*
* @return	None.
*
*****************************************************************************/
void XL_GpioPs_SetDirectionPin(const XL_GpioPs *InstancePtr, u32 Pin, u32 Direction)
{
	u8 Bank;
	u8 PinNumber;
	u32 DirModeReg;

	/* Get the Bank number and Pin number within the bank. */
#ifdef versal
	XL_GpioPs_GetBankPin(InstancePtr,(u8)Pin, &Bank, &PinNumber);
#else
	XL_GpioPs_GetBankPin((u8)Pin, &Bank, &PinNumber);
#endif
	DirModeReg = XL_GpioPs_ReadReg(InstancePtr->GpioConfig.BaseAddr,
				      ((u32)(Bank) * XGPIOPS_REG_MASK_OFFSET) +
				      XGPIOPS_DIRM_OFFSET);

	if (Direction!=(u32)0) { /*  Output Direction */
		DirModeReg |= ((u32)1 << (u32)PinNumber);
	} else { /* Input Direction */
		DirModeReg &= ~ ((u32)1 << (u32)PinNumber);
	}

	XL_GpioPs_WriteReg(InstancePtr->GpioConfig.BaseAddr,
			 ((u32)(Bank) * XGPIOPS_REG_MASK_OFFSET) +
			 XGPIOPS_DIRM_OFFSET, DirModeReg);
}

/****************************************************************************/
/**
*
* Get the Direction of the pins of the specified GPIO Bank.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	Bank is the bank number of the GPIO to operate on.
*
* @return	Returns a 32 bit mask of the Direction register. Bits with 0 are
* 		in Input mode, bits with 1 are in Output Mode.
*
* @note		None.
*
*****************************************************************************/
u32 XL_GpioPs_GetDirection(const XL_GpioPs *InstancePtr, u8 Bank)
{

	return XL_GpioPs_ReadReg(InstancePtr->GpioConfig.BaseAddr,
				((u32)(Bank) * XGPIOPS_REG_MASK_OFFSET) +
				XGPIOPS_DIRM_OFFSET);
}

/****************************************************************************/
/**
*
* Get the Direction of the specified pin.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	Pin is the pin number for which the Direction is to be
*		retrieved.
*
* @return	Direction of the specified pin.
*		- 0 for Input Direction
*		- 1 for Output Direction
*
* @note		None.
*
*****************************************************************************/
u32 XL_GpioPs_GetDirectionPin(const XL_GpioPs *InstancePtr, u32 Pin)
{
	u8 Bank;
	u8 PinNumber;

	/* Get the Bank number and Pin number within the bank. */
#ifdef versal
	XL_GpioPs_GetBankPin(InstancePtr,(u8)Pin, &Bank, &PinNumber);
#else
	XL_GpioPs_GetBankPin((u8)Pin, &Bank, &PinNumber);
#endif

	return (XL_GpioPs_ReadReg(InstancePtr->GpioConfig.BaseAddr,
				 ((u32)(Bank) * XGPIOPS_REG_MASK_OFFSET) +
				 XGPIOPS_DIRM_OFFSET) >> (u32)PinNumber) & (u32)1;
}

/****************************************************************************/
/**
*
* Set the Output Enable of the pins of the specified GPIO Bank.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	Bank is the bank number of the GPIO to operate on.
* @param	OpEnable is the 32 bit mask of the Output Enables to be set for
*		all the pins in the Bank. The Output Enable of bits with 0 are
*		disabled, the Output Enable of bits with 1 are enabled.
*
* @return	None.
*
* @note		This function is used for setting the Output Enables of all the
*		pins in the specified bank. The previous state of the Output
*		Enables is not maintained.
*
*****************************************************************************/
void XL_GpioPs_SetOutputEnable(const XL_GpioPs *InstancePtr, u8 Bank, u32 OpEnable)
{

	XL_GpioPs_WriteReg(InstancePtr->GpioConfig.BaseAddr,
			  ((u32)(Bank) * XGPIOPS_REG_MASK_OFFSET) +
			  XGPIOPS_OUTEN_OFFSET, OpEnable);
}

/****************************************************************************/
/**
*
* Set the Output Enable of the specified pin.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	Pin is the pin number to which the Data is to be written.
* @param	OpEnable specifies whether the Output Enable for the specified
*		pin should be enabled.
*		Valid values are 0 for Disabling Output Enable,
*		1 for Enabling Output Enable.
*
* @return	None.
*
* @note		None.
*
*****************************************************************************/
void XL_GpioPs_SetOutputEnablePin(const XL_GpioPs *InstancePtr, u32 Pin, u32 OpEnable)
{
	u8 Bank;
	u8 PinNumber;
	u32 OpEnableReg;

	/* Get the Bank number and Pin number within the bank. */
#ifdef versal
	XL_GpioPs_GetBankPin(InstancePtr,(u8)Pin, &Bank, &PinNumber);
#else
	XL_GpioPs_GetBankPin((u8)Pin, &Bank, &PinNumber);
#endif

	OpEnableReg = XL_GpioPs_ReadReg(InstancePtr->GpioConfig.BaseAddr,
				       ((u32)(Bank) * XGPIOPS_REG_MASK_OFFSET) +
				       XGPIOPS_OUTEN_OFFSET);

	if (OpEnable != (u32)0) { /*  Enable Output Enable */
		OpEnableReg |= ((u32)1 << (u32)PinNumber);
	} else { /* Disable Output Enable */
		OpEnableReg &= ~ ((u32)1 << (u32)PinNumber);
	}

	XL_GpioPs_WriteReg(InstancePtr->GpioConfig.BaseAddr,
			  ((u32)(Bank) * XGPIOPS_REG_MASK_OFFSET) +
			  XGPIOPS_OUTEN_OFFSET, OpEnableReg);
}
/****************************************************************************/
/**
*
* Get the Output Enable status of the pins of the specified GPIO Bank.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	Bank is the bank number of the GPIO to operate on.
*
* @return	Returns a a 32 bit mask of the Output Enable register.
*		Bits with 0 are in Disabled state, bits with 1 are in
*		Enabled State.
*
* @note		None.
*
*****************************************************************************/
u32 XL_GpioPs_GetOutputEnable(const XL_GpioPs *InstancePtr, u8 Bank)
{

	return XL_GpioPs_ReadReg(InstancePtr->GpioConfig.BaseAddr,
				((u32)(Bank) * XGPIOPS_REG_MASK_OFFSET) +
				XGPIOPS_OUTEN_OFFSET);
}

/****************************************************************************/
/**
*
* Get the Output Enable status of the specified pin.
*
* @param	InstancePtr is a pointer to the XL_GpioPs instance.
* @param	Pin is the pin number for which the Output Enable status is to
*		be retrieved.
*
* @return	Output Enable of the specified pin.
*		- 0 if Output Enable is disabled for this pin
*		- 1 if Output Enable is enabled for this pin
*
* @note		None.
*
*****************************************************************************/
u32 XL_GpioPs_GetOutputEnablePin(const XL_GpioPs *InstancePtr, u32 Pin)
{
	u8 Bank;
	u8 PinNumber;

	/* Get the Bank number and Pin number within the bank. */
#ifdef versal
	XL_GpioPs_GetBankPin(InstancePtr,(u8)Pin, &Bank, &PinNumber);
#else
	XL_GpioPs_GetBankPin((u8)Pin, &Bank, &PinNumber);
#endif

	return (XL_GpioPs_ReadReg(InstancePtr->GpioConfig.BaseAddr,
				 ((u32)(Bank) * XGPIOPS_REG_MASK_OFFSET) +
				 XGPIOPS_OUTEN_OFFSET) >> (u32)PinNumber) & (u32)1;
}

/****************************************************************************/
/**
*
* Get the Bank number and the Pin number in the Bank, for the given PinNumber
* in the GPIO device.
*
* @param	PinNumber is the Pin number in the GPIO device.
* @param	BankNumber returns the Bank in which this GPIO pin is present.
*		Valid values are 0 to XGPIOPS_MAX_BANKS - 1.
* @param	PinNumberInBank returns the Pin Number within the Bank.
*
* @return	None.
*
* @note		None.
*
*****************************************************************************/
#ifdef versal
void XL_GpioPs_GetBankPin(const XL_GpioPs *InstancePtr,u8 PinNumber, u8 *BankNumber, u8 *PinNumberInBank)
#else
void XL_GpioPs_GetBankPin(u8 PinNumber, u8 *BankNumber, u8 *PinNumberInBank)
#endif
{
	u32 XL_GpioPsPinTable[6] = {0};
#ifdef versal
        u8 i=(u8)0;
#endif
	u32 Platform = XGetPlatform_Info();

	if (Platform == (u32)XPLAT_ZYNQ_ULTRA_MP) {
		/*
		 * This structure defines the mapping of the pin numbers to the banks when
		 * the driver APIs are used for working on the individual pins.
		 */

		XL_GpioPsPinTable[0] = (u32)25; /* 0 - 25, Bank 0 */
		XL_GpioPsPinTable[1] = (u32)51; /* 26 - 51, Bank 1 */
		XL_GpioPsPinTable[2] = (u32)77; /* 52 - 77, Bank 2 */
		XL_GpioPsPinTable[3] = (u32)109; /* 78 - 109, Bank 3 */
		XL_GpioPsPinTable[4] = (u32)141; /* 110 - 141, Bank 4 */
		XL_GpioPsPinTable[5] = (u32)173; /* 142 - 173 Bank 5 */

		*BankNumber = 0U;
		while (*BankNumber < XGPIOPS_SIX) {
			if (PinNumber <= XL_GpioPsPinTable[*BankNumber]) {
				break;
			}
			(*BankNumber)++;
		}
	}
#ifdef versal
        else if(Platform == XPLAT_VERSAL)
        {
                if(InstancePtr->PmcGpio == (u32)(FALSE))
                {
                        XL_GpioPsPinTable[0] = (u32)25; /* 0 - 25, Bank 0 */
                        XL_GpioPsPinTable[1] = (u32)57; /* 26 - 57, Bank 3 */
                        *BankNumber =0U;
                        if(PinNumber <= XL_GpioPsPinTable[*BankNumber])
                        {
                                *BankNumber = (u8)XGPIOPS_ZERO;
                        }
                        else
                        {
                                *BankNumber = (u8)XGPIOPS_THREE;
                        }

                }
                else
                {
                        XL_GpioPsPinTable[0] = (u32)25; /* 0 - 25, Bank 0 */
                        XL_GpioPsPinTable[1] = (u32)51; /* 26 - 51, Bank 1 */
                        XL_GpioPsPinTable[2] = (u32)83; /* 52 - 83, Bank 3 */
                        XL_GpioPsPinTable[3] = (u32)115; /*84 - 115, Bank 4 */

                        *BankNumber =0U;
                        while(i < XGPIOPS_FOUR)
                        {
                                if(i <= (u8)XGPIOPS_ONE)
                                {
                                        if (PinNumber <= XL_GpioPsPinTable[i])
                                        {
                                                *BankNumber = (u8)i;
                                                break;
                                        }
                                        i++;
                                }
                                else
                                {
                                        if (PinNumber <= XL_GpioPsPinTable[i])
                                        {
                                                *BankNumber = (u8)i+1U;
                                                break;
                                        }
                                        i++;
                                }

                        }
                }

        }
#endif
        else {
		XL_GpioPsPinTable[0] = (u32)31; /* 0 - 31, Bank 0 */
		XL_GpioPsPinTable[1] = (u32)53; /* 32 - 53, Bank 1 */
		XL_GpioPsPinTable[2] = (u32)85; /* 54 - 85, Bank 2 */
		XL_GpioPsPinTable[3] = (u32)117; /* 86 - 117 Bank 3 */

		*BankNumber = 0U;
		while (*BankNumber < XGPIOPS_FOUR) {
			if (PinNumber <= XL_GpioPsPinTable[*BankNumber]) {
				break;
			}
			(*BankNumber)++;
		}
	}
	if (*BankNumber == (u8)0) {
		*PinNumberInBank = PinNumber;
	}

#ifdef versal
        else if(Platform == XPLAT_VERSAL)
        {
                if(InstancePtr->PmcGpio == (u32)(FALSE))
                {
                        *PinNumberInBank = (u8)((u32)PinNumber - (XL_GpioPsPinTable[0] + (u32)1));
                }
                else {
                        if((*BankNumber ==(u8)XGPIOPS_THREE) || (*BankNumber ==(u8)XGPIOPS_FOUR))
                        {
                                *PinNumberInBank = (u8)((u32)PinNumber %
                                                (XL_GpioPsPinTable[*BankNumber - (u8)XGPIOPS_TWO] + (u32)1));
                        }
                        else
                        {
                                *PinNumberInBank = (u8)((u32)PinNumber %
                                                (XL_GpioPsPinTable[*BankNumber - (u8)1] + (u32)1));
                        }
               }

        }
#endif

        else {
		*PinNumberInBank = (u8)((u32)PinNumber %
					(XL_GpioPsPinTable[*BankNumber - (u8)1] + (u32)1));
        }
}

/*****************************************************************************/
/**
*
* This is a stub for the status callback. The stub is here in case the upper
* layers do not set the handler.
*
* @param	CallBackRef is a pointer to the upper layer callback reference
* @param	Bank is the GPIO Bank in which an interrupt occurred.
* @param	Status is the Interrupt status of the GPIO bank.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_StubHandler(void *CallBackRef, u32 Bank, u32 Status)
{
	(void) CallBackRef;
	(void) Bank;
	(void) Status;
}
/** @} */
