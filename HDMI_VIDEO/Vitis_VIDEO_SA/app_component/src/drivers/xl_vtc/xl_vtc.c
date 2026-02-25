/******************************************************************************
* Copyright (C) 2008 - 2020 Xilinx, Inc.  All rights reserved.
* Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/


/***************************** Include Files *********************************/

#include "xl_vtc.h"
#include "xl_env.h"

/************************** Constant Definitions *****************************/


/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/

/*
* Each of callback functions to be called on different types of interrupts.
* These stub functions are set during XL_Vtc_CfgInitialize as default
* callback functions. If application is not registered any of the callback
* function, these functions will be called for doing nothing.
*/
static void StubCallBack(void *CallBackRef, uint32_t Mask);
static void StubErrCallBack(void *CallBackRef, uint32_t ErrorMask);

/************************** Variable Definitions *****************************/


/************************** Function Definitions *****************************/

/*****************************************************************************/
/**
*
* This function initializes the VTC core. This function must be called
* prior to using the VTC core. Initialization of the VTC includes setting up
* the instance data, and ensuring the hardware is in a quiescent state.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
* @param	CfgPtr points to the configuration structure associated with
*		the VTC core.
* @param	EffectiveAddr is the base address of the device. If address
*		translation is being used, then this parameter must reflect the
*		virtual base address. Otherwise, the physical address should be
*		used.
*
* @return
*		- XST_SUCCESS if XL_Vtc_CfgInitialize was successful.
*
* @note		None.
*
******************************************************************************/
int XL_Vtc_CfgInitialize(XL_Vtc *InstancePtr, XL_Vtc_Config *CfgPtr,
				UINTPTR EffectiveAddr)
{

	/* Setup the instance */
	memset((void *)InstancePtr, 0, sizeof(XL_Vtc));

	memcpy((void *)&(InstancePtr->Config), (const void *)CfgPtr,
			   sizeof(XL_Vtc_Config));
	InstancePtr->Config.BaseAddress = EffectiveAddr;
#ifdef SDT
    InstancePtr->Config.IntrId = CfgPtr->IntrId;
    InstancePtr->Config.IntrParent = CfgPtr->IntrParent;
#endif

	/* Set all handlers to stub values, let user configure this data later */
	InstancePtr->FrameSyncCallBack = (XL_Vtc_CallBack) StubCallBack;
	InstancePtr->LockCallBack = (XL_Vtc_CallBack) StubCallBack;
	InstancePtr->DetectorCallBack = (XL_Vtc_CallBack) StubCallBack;
	InstancePtr->GeneratorCallBack = (XL_Vtc_CallBack) StubCallBack;
	InstancePtr->ErrCallBack = (XL_Vtc_ErrorCallBack) StubErrCallBack;

	/* Set the flag to indicate the driver is ready */
	InstancePtr->IsReady = (uint32_t)(XIL_COMPONENT_IS_READY);

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function enables the VTC Generator core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_EnableGenerator(XL_Vtc *InstancePtr)
{
	uint32_t CtrlRegValue;

	/* Read Control register value back */
	CtrlRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
					(XVTC_CTL_OFFSET));

	/* Change the value according to the enabling type and write it back */
	CtrlRegValue |= XVTC_CTL_GE_MASK;

	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, (XVTC_CTL_OFFSET),
			CtrlRegValue);
}

/*****************************************************************************/
/**
*
* This function enables the VTC Detector core
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_EnableDetector(XL_Vtc *InstancePtr)
{
	uint32_t CtrlRegValue;

	/* Read Control register value back */
	CtrlRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
					(XVTC_CTL_OFFSET));

	/* Change the value according to the enabling type and write it back */
	CtrlRegValue |= XVTC_CTL_DE_MASK;

	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, (XVTC_CTL_OFFSET),
			CtrlRegValue);
}

/*****************************************************************************/
/**
*
* This function enables the Detector and Generator at same time of the
* VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_Enable(XL_Vtc *InstancePtr)
{
	uint32_t CtrlRegValue;

	/* Read Control register value back */
	CtrlRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
					(XVTC_CTL_OFFSET));

	/* Setup the SW Enable Bit and write it back */
	CtrlRegValue |= XVTC_CTL_SW_MASK;

	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, (XVTC_CTL_OFFSET),
				CtrlRegValue);
}

/*****************************************************************************/
/**
*
* This function disables the VTC Generator core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_DisableGenerator(XL_Vtc *InstancePtr)
{
	uint32_t CtrlRegValue;

	/* Read Control register value back */
	CtrlRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
					(XVTC_CTL_OFFSET));

	/* Change the value according to the disabling type and write it
	 * back
	 */
	CtrlRegValue &= (uint32_t)(~(XVTC_CTL_GE_MASK));

	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, (XVTC_CTL_OFFSET),
			CtrlRegValue);
}

/*****************************************************************************/
/**
*
* This function disables the VTC Detector core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_DisableDetector(XL_Vtc *InstancePtr)
{
	uint32_t CtrlRegValue;

	/* Read Control register value back */
	CtrlRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
					(XVTC_CTL_OFFSET));

	/* Change the value according to the disabling type and write it
	 * back
	 */
	CtrlRegValue &= (uint32_t)(~(XVTC_CTL_DE_MASK));

	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, (XVTC_CTL_OFFSET),
			CtrlRegValue);
}

/*****************************************************************************/
/**
*
* This function disables the Detector and Generator at same time of the VTC
* core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_Disable(XL_Vtc *InstancePtr)
{
	uint32_t CtrlRegValue;

	/* Read Control register value back */
	CtrlRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
					(XVTC_CTL_OFFSET));

	/* Change the value, clearing Core Enable, and write it back*/
	CtrlRegValue &= ~XVTC_CTL_SW_MASK;

	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, (XVTC_CTL_OFFSET),
			CtrlRegValue);
}

/*****************************************************************************/
/**
*
* This function sets up the output polarity of the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	PolarityPtr points to a Polarity configuration structure with
*		the setting to use on the VTC core.
*
* @return	None.
*
* @note		None.
*
*****************************************************************************/
void XL_Vtc_SetPolarity(XL_Vtc *InstancePtr, XL_Vtc_Polarity *PolarityPtr)
{
	uint32_t PolRegValue;

	/* Read Control register value back and clear all polarity
	 * bits first
	 */
	PolRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
					(XVTC_GPOL_OFFSET));
	PolRegValue &= (uint32_t)(~(XVTC_POL_ALLP_MASK));

	/* Change the register value according to the setting in the Polarity
	 * configuration structure
	 */
	if (PolarityPtr->ActiveChromaPol)
		PolRegValue |= XVTC_POL_ACP_MASK;

	if (PolarityPtr->ActiveVideoPol)
		PolRegValue |= XVTC_POL_AVP_MASK;

	if (PolarityPtr->FieldIdPol)
		PolRegValue |= XVTC_POL_FIP_MASK;

	if (PolarityPtr->VBlankPol)
		PolRegValue |= XVTC_POL_VBP_MASK;

	if (PolarityPtr->VSyncPol)
		PolRegValue |= XVTC_POL_VSP_MASK;

	if (PolarityPtr->HBlankPol)
		PolRegValue |= XVTC_POL_HBP_MASK;

	if (PolarityPtr->HSyncPol)
		PolRegValue |= XVTC_POL_HSP_MASK;

	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, (XVTC_GPOL_OFFSET),
			PolRegValue);
}

/*****************************************************************************/
/**
*
* This function gets the output polarity setting used by the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	PolarityPtr points to a Polarity configuration structure that
*		will be populated with the setting used on the VTC core
*		after this function returns.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_GetPolarity(XL_Vtc *InstancePtr, XL_Vtc_Polarity *PolarityPtr)
{
	uint32_t PolRegValue;

	/* Clear the Polarity configuration structure */
	memset((void *)PolarityPtr, 0, sizeof(XL_Vtc_Polarity));

	/* Read Control register value back */
	PolRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
					(XVTC_GPOL_OFFSET));

	/* Populate the Polarity configuration structure w/ the current setting
	 * used in the device
	 */
	if (PolRegValue & XVTC_POL_ACP_MASK)
		PolarityPtr->ActiveChromaPol = 1;

	if (PolRegValue & XVTC_POL_AVP_MASK)
		PolarityPtr->ActiveVideoPol = 1;

	if (PolRegValue & XVTC_POL_FIP_MASK)
		PolarityPtr->FieldIdPol = 1;

	if (PolRegValue & XVTC_POL_VBP_MASK)
		PolarityPtr->VBlankPol = 1;

	if (PolRegValue & XVTC_POL_VSP_MASK)
		PolarityPtr->VSyncPol = 1;

	if (PolRegValue & XVTC_POL_HBP_MASK)
		PolarityPtr->HBlankPol = 1;

	if (PolRegValue & XVTC_POL_HSP_MASK)
		PolarityPtr->HSyncPol = 1;
}

/*****************************************************************************/
/**
*
* This function gets the input polarity setting used by the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	PolarityPtr points to a Polarity configuration structure that
*		will be populated with the setting used on the VTC core after
*		this function returns.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_GetDetectorPolarity(XL_Vtc *InstancePtr, XL_Vtc_Polarity *PolarityPtr)
{
	uint32_t PolRegValue;

	/* Clear the Polarity configuration structure */
	memset((void *)PolarityPtr, 0, sizeof(XL_Vtc_Polarity));

	/* Read Control register value back */
	PolRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
					(XVTC_DPOL_OFFSET));

	/* Populate the Polarity configuration structure w/ the current setting
	 * used in the core.
	 */
	if (PolRegValue & XVTC_POL_ACP_MASK)
		PolarityPtr->ActiveChromaPol = 1;

	if (PolRegValue & XVTC_POL_AVP_MASK)
		PolarityPtr->ActiveVideoPol = 1;

	if (PolRegValue & XVTC_POL_FIP_MASK)
		PolarityPtr->FieldIdPol = 1;

	if (PolRegValue & XVTC_POL_VBP_MASK)
		PolarityPtr->VBlankPol = 1;

	if (PolRegValue & XVTC_POL_VSP_MASK)
		PolarityPtr->VSyncPol = 1;

	if (PolRegValue & XVTC_POL_HBP_MASK)
		PolarityPtr->HBlankPol = 1;

	if (PolRegValue & XVTC_POL_HSP_MASK)
		PolarityPtr->HSyncPol = 1;
}

/*****************************************************************************/
/**
*
* This function sets up the source selecting of the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on
* @param 	SourcePtr points to a Source Selecting configuration structure
*		with the setting to use on the VTC device.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_SetSource(XL_Vtc *InstancePtr, XL_Vtc_SourceSelect *SourcePtr)
{
	uint32_t CtrlRegValue;

	/* Read Control register value back and clear all source selection bits
	 * first
	 */
	CtrlRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
					(XVTC_CTL_OFFSET));
	CtrlRegValue &= ~XVTC_CTL_ALLSS_MASK;

	/* Change the register value according to the setting in the source
	 * selection configuration structure
	 */

	if (SourcePtr->FieldIdPolSrc)
		CtrlRegValue |= XVTC_CTL_FIPSS_MASK;

	if (SourcePtr->ActiveChromaPolSrc)
		CtrlRegValue |= XVTC_CTL_ACPSS_MASK;

	if (SourcePtr->ActiveVideoPolSrc)
		CtrlRegValue |= XVTC_CTL_AVPSS_MASK;

	if (SourcePtr->HSyncPolSrc)
		CtrlRegValue |= XVTC_CTL_HSPSS_MASK;

	if (SourcePtr->VSyncPolSrc)
		CtrlRegValue |= XVTC_CTL_VSPSS_MASK;

	if (SourcePtr->HBlankPolSrc)
		CtrlRegValue |= XVTC_CTL_HBPSS_MASK;

	if (SourcePtr->VBlankPolSrc)
		CtrlRegValue |= XVTC_CTL_VBPSS_MASK;


	if (SourcePtr->VChromaSrc)
		CtrlRegValue |= XVTC_CTL_VCSS_MASK;

	if (SourcePtr->VActiveSrc)
		CtrlRegValue |= XVTC_CTL_VASS_MASK;

	if (SourcePtr->VBackPorchSrc)
		CtrlRegValue |= XVTC_CTL_VBSS_MASK;

	if (SourcePtr->VSyncSrc)
		CtrlRegValue |= XVTC_CTL_VSSS_MASK;

	if (SourcePtr->VFrontPorchSrc)
		CtrlRegValue |= XVTC_CTL_VFSS_MASK;

	if (SourcePtr->VTotalSrc)
		CtrlRegValue |= XVTC_CTL_VTSS_MASK;

	if (SourcePtr->HBackPorchSrc)
		CtrlRegValue |= XVTC_CTL_HBSS_MASK;

	if (SourcePtr->HSyncSrc)
		CtrlRegValue |= XVTC_CTL_HSSS_MASK;

	if (SourcePtr->HFrontPorchSrc)
		CtrlRegValue |= XVTC_CTL_HFSS_MASK;

	if (SourcePtr->HTotalSrc)
		CtrlRegValue |= XVTC_CTL_HTSS_MASK;

	if (SourcePtr->InterlacedMode)
		CtrlRegValue |= XVTC_CTL_INTERLACE_MASK;

	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, (XVTC_CTL_OFFSET),
			CtrlRegValue);
}

/*****************************************************************************/
/**
*
* This function gets the source select setting used by the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param 	SourcePtr points to a source select configuration structure
*		that will be populated with the setting used on the VTC core
*		after this function returns.
*
* @return	None.
*
* @note		None.
*
*****************************************************************************/
void XL_Vtc_GetSource(XL_Vtc *InstancePtr, XL_Vtc_SourceSelect *SourcePtr)
{
	uint32_t CtrlRegValue;

	/* Clear the source selection configuration structure */
	memset((void *)SourcePtr, 0, sizeof(XL_Vtc_SourceSelect));

	/* Read Control register value back */
	CtrlRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
					(XVTC_CTL_OFFSET));

	/* Populate the source select configuration structure with the current
	 * setting used in the core
	 */
	if (CtrlRegValue & XVTC_CTL_FIPSS_MASK)
		SourcePtr->FieldIdPolSrc = 1;
	if (CtrlRegValue & XVTC_CTL_ACPSS_MASK)
		SourcePtr->ActiveChromaPolSrc = 1;
	if (CtrlRegValue & XVTC_CTL_AVPSS_MASK)
		SourcePtr->ActiveVideoPolSrc= 1;
	if (CtrlRegValue & XVTC_CTL_HSPSS_MASK)
		SourcePtr->HSyncPolSrc = 1;
	if (CtrlRegValue & XVTC_CTL_VSPSS_MASK)
		SourcePtr->VSyncPolSrc = 1;
	if (CtrlRegValue & XVTC_CTL_HBPSS_MASK)
		SourcePtr->HBlankPolSrc = 1;
	if (CtrlRegValue & XVTC_CTL_VBPSS_MASK)
		SourcePtr->VBlankPolSrc = 1;

	if (CtrlRegValue & XVTC_CTL_VCSS_MASK)
		SourcePtr->VChromaSrc = 1;
	if (CtrlRegValue & XVTC_CTL_VASS_MASK)
		SourcePtr->VActiveSrc = 1;
	if (CtrlRegValue & XVTC_CTL_VBSS_MASK)
		SourcePtr->VBackPorchSrc = 1;
	if (CtrlRegValue & XVTC_CTL_VSSS_MASK)
		SourcePtr->VSyncSrc = 1;
	if (CtrlRegValue & XVTC_CTL_VFSS_MASK)
		SourcePtr->VFrontPorchSrc = 1;
	if (CtrlRegValue & XVTC_CTL_VTSS_MASK)
		SourcePtr->VTotalSrc = 1;
	if (CtrlRegValue & XVTC_CTL_HBSS_MASK)
		SourcePtr->HBackPorchSrc = 1;
	if (CtrlRegValue & XVTC_CTL_HSSS_MASK)
		SourcePtr->HSyncSrc = 1;
	if (CtrlRegValue & XVTC_CTL_HFSS_MASK)
		SourcePtr->HFrontPorchSrc = 1;
	if (CtrlRegValue & XVTC_CTL_HTSS_MASK)
		SourcePtr->HTotalSrc = 1;
	if (CtrlRegValue & XVTC_CTL_INTERLACE_MASK)
		SourcePtr->InterlacedMode = 1;
}

/*****************************************************************************/
/**
*
* This function sets up the line skip setting of the Generator in the VTC
* core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param 	GeneratorChromaSkip indicates whether to skip 1 line between
*		active chroma for the Generator module. Use Non-0 value for
*		this parameter to skip 1 line, and 0 to not skip lines.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_SetSkipLine(XL_Vtc *InstancePtr, int GeneratorChromaSkip)
{
	uint32_t FrameEncodeRegValue;

	/* Read Control register value back and clear all skip bits first */
	FrameEncodeRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
						(XVTC_GFENC_OFFSET));
	FrameEncodeRegValue &= (uint32_t)(~(XVTC_ENC_GACLS_MASK));

	/* Change the register value according to the skip setting passed
	 * into this function.
	 */
	if (GeneratorChromaSkip)
		FrameEncodeRegValue |= XVTC_ENC_GACLS_MASK;

	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, (XVTC_GFENC_OFFSET),
			FrameEncodeRegValue);
}

/*****************************************************************************/
/**
*
* This function gets the line skip setting used by the Generator in the VTC
* core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	GeneratorChromaSkipPtr will point to the value indicating
*		whether one line is skipped between active chroma for the
*		Generator module after this function returns. Value 1 means
*		that 1 line is skipped and zero means that no lines are
*		skipped.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_GetSkipLine(XL_Vtc *InstancePtr, int *GeneratorChromaSkipPtr)
{
	uint32_t FrameEncodeRegValue;

	/* Read Control register value back */
	FrameEncodeRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
						(XVTC_GFENC_OFFSET));

	/* Populate the skip variable values according to the skip setting
	 * used by the core.
	 */
	if (FrameEncodeRegValue & XVTC_ENC_GACLS_MASK)
		*GeneratorChromaSkipPtr = 1;
	else
		*GeneratorChromaSkipPtr = 0;
}

/*****************************************************************************/
/**
*
* This function sets up the pixel skip setting of the Generator in the VTC
* core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	GeneratorChromaSkip indicates whether to skip 1 pixel between
*		active chroma for the Generator module. Use Non-0 value for
*		this parameter to skip 1 pixel, and 0 to not skip pixels
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_SetSkipPixel(XL_Vtc *InstancePtr, int GeneratorChromaSkip)
{
	uint32_t FrameEncodeRegValue;

	/* Read Control register value back and clear all skip bits first */
	FrameEncodeRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
						(XVTC_GFENC_OFFSET));
	FrameEncodeRegValue &= (uint32_t)(~(XVTC_ENC_GACPS_MASK));

	/* Change the register value according to the skip setting passed
	 * into this function.
	 */
	if (GeneratorChromaSkip)
		FrameEncodeRegValue |= XVTC_ENC_GACPS_MASK;

	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, (XVTC_GFENC_OFFSET),
				FrameEncodeRegValue);
}

/*****************************************************************************/
/**
*
* This function gets the pixel skip setting used by the Generator in the VTC
* core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	GeneratorChromaSkipPtr will point to the value indicating
*		whether one pixel is skipped between active chroma for the
*		Generator module after this function returns. Value 1 means
*		that 1 pixel is skipped and zero means that no pixels are
*		skipped.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_GetSkipPixel(XL_Vtc *InstancePtr, int *GeneratorChromaSkipPtr)
{
	uint32_t FrameEncodeRegValue;

	/* Read Control register value back */
	FrameEncodeRegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
						(XVTC_GFENC_OFFSET));

	/* Populate the skip variable values according to the skip setting
	 * used by the core.
	 */
	if (FrameEncodeRegValue & XVTC_ENC_GACPS_MASK)
		*GeneratorChromaSkipPtr = 1;
	else
		*GeneratorChromaSkipPtr = 0;
}

/*****************************************************************************/
/**
*
* This function sets up the Generator delay setting of the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param 	VertDelay indicates the number of total lines per frame to
*		delay the generator output. The valid range is from 0 to 4095.
* @param	HoriDelay indicates the number of total clock cycles per line
*		to delay the generator output. The valid range is from 0 to
*		4095.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_SetDelay(XL_Vtc *InstancePtr, int VertDelay, int HoriDelay)
{
	uint32_t RegValue;

	/* Calculate the delay value */
	RegValue = HoriDelay & XVTC_GGD_HDELAY_MASK;
	RegValue |= (VertDelay << XVTC_GGD_VDELAY_SHIFT) &
			XVTC_GGD_VDELAY_MASK;

	/* Update the Generator Global Delay register w/ the value */
	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, (XVTC_GGD_OFFSET),
			RegValue);
}

/*****************************************************************************/
/**
*
* This function gets the Generator delay setting used by the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	VertDelayPtr will point to a value indicating the number of
*		total lines per frame to delay the generator output after
*		this function returns.
* @param	HoriDelayPtr will point to a value indicating the number of
*		total clock cycles per line to delay the generator output
*		after this function returns.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_GetDelay(XL_Vtc *InstancePtr, int *VertDelayPtr, int *HoriDelayPtr)
{
	uint32_t RegValue;

	/* Read the Generator Global Delay register value */
	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
				(XVTC_GGD_OFFSET));

	/* Calculate the delay values */
	*HoriDelayPtr = RegValue & XVTC_GGD_HDELAY_MASK;
	*VertDelayPtr = (RegValue & XVTC_GGD_VDELAY_MASK) >>
				XVTC_GGD_VDELAY_SHIFT;
}

/*****************************************************************************/
/**
*
* This function sets up the SYNC setting of a frame sync used by the VTC
* core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	FrameSyncIndex indicates the index number of the frame sync.
*		The valid range is from 0 to 15.
* @param	VertStart indicates the vertical line count during which the
*		frame sync is active. The valid range is from 0 to 4095.
* @param	HoriStart indicates the horizontal cycle count during which the
*		frame sync is active. The valid range is from 0 to 4095.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_SetFSync(XL_Vtc *InstancePtr, uint16_t FrameSyncIndex, uint16_t VertStart,
			uint16_t HoriStart)
{
	uint32_t RegValue;
	uint32_t RegAddress;

	/* Calculate the sync value */
	RegValue = HoriStart & XVTC_FSXX_HSTART_MASK;
	RegValue |= (VertStart << XVTC_FSXX_VSTART_SHIFT) &
			XVTC_FSXX_VSTART_MASK;

	/* Calculate the frame sync register address to write to */
	RegAddress = XVTC_FS00_OFFSET + FrameSyncIndex * XVTC_REG_ADDRGAP;

	/* Update the Generator Global Delay register w/ the value */
	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, RegAddress, RegValue);
}

/*****************************************************************************/
/**
*
* This function gets the SYNC setting of a frame sync used by the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	FrameSyncIndex indicates the index number of the frame sync.
* 		The valid range is from 0 to 15.
* @param	VertStartPtr will point to the value that indicates the
* 		vertical line count during which the frame sync is active once
*		this function returns.
* @param	HoriStartPtr will point to the value that indicates the
*		horizontal cycle count during which the frame sync is active
*		once this function returns.
*
* @return	None.
*
******************************************************************************/
void XL_Vtc_GetFSync(XL_Vtc *InstancePtr, uint16_t FrameSyncIndex,
			uint16_t *VertStartPtr, uint16_t *HoriStartPtr)
{
	uint32_t RegValue;
	uint32_t RegAddress;

	/* Calculate the frame sync register address to read from */
	RegAddress = XVTC_FS00_OFFSET + FrameSyncIndex * XVTC_REG_ADDRGAP;

	/* Read the frame sync register value */
	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress, RegAddress);

	/* Calculate the frame sync values */
	*HoriStartPtr = RegValue & XVTC_FSXX_HSTART_MASK;
	*VertStartPtr = (RegValue & XVTC_FSXX_VSTART_MASK) >>
				XVTC_FSXX_VSTART_SHIFT;
}

/*****************************************************************************/
/**
 * This function sets the VBlank/VSync Horizontal Offsets for the Generator
 * in a VTC device.
 *
 * @param  InstancePtr is a pointer to the VTC device instance to be worked on.
 * @param  HoriOffsets points to a VBlank/VSync Horizontal Offset configuration
 *	   with the setting to use on the VTC device.
 * @return NONE.
 *
 *****************************************************************************/
void XL_Vtc_SetGeneratorHoriOffset(XL_Vtc *InstancePtr,
				XL_Vtc_HoriOffsets *HoriOffsets)
{
	uint32_t RegValue;

	/* Calculate and update Generator VBlank Hori. Offset 0 register value
	 */
	RegValue = (HoriOffsets->V0BlankHoriStart) & XVTC_XVXHOX_HSTART_MASK;
	RegValue |= (HoriOffsets->V0BlankHoriEnd << XVTC_XVXHOX_HEND_SHIFT) &
					XVTC_XVXHOX_HEND_MASK;
	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, XVTC_GVBHOFF_OFFSET,
								RegValue);

	/* Calculate and update Generator VSync Hori. Offset 0 register
	 * value
	 */
	RegValue = (HoriOffsets->V0SyncHoriStart) & XVTC_XVXHOX_HSTART_MASK;
	RegValue |= (HoriOffsets->V0SyncHoriEnd << XVTC_XVXHOX_HEND_SHIFT) &
					XVTC_XVXHOX_HEND_MASK;
	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, XVTC_GVSHOFF_OFFSET,
								RegValue);

	/* Calculate and update Generator VBlank Hori. Offset 1 register
	 * value
	 */
	RegValue = (HoriOffsets->V1BlankHoriStart) & XVTC_XVXHOX_HSTART_MASK;
	RegValue |= (HoriOffsets->V1BlankHoriEnd << XVTC_XVXHOX_HEND_SHIFT) &
					XVTC_XVXHOX_HEND_MASK;
	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, XVTC_GVBHOFF_F1_OFFSET,
								RegValue);

	/* Calculate and update Generator VSync Hori. Offset 1 register
	 * value
	 */
	RegValue = (HoriOffsets->V1SyncHoriStart) & XVTC_XVXHOX_HSTART_MASK;
	RegValue |= (HoriOffsets->V1SyncHoriEnd << XVTC_XVXHOX_HEND_SHIFT) &
					XVTC_XVXHOX_HEND_MASK;
	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
						XVTC_GVSHOFF_F1_OFFSET,
								RegValue);
}

/*****************************************************************************/
/**
*
* This function gets the VBlank/VSync Horizontal Offsets currently used by
* the Generator in the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	HoriOffsets points to a VBlank/VSync Horizontal Offset
*		configuration structure that will be populated with the setting
*		currently used on the Generator in the given VTC device after
*		this function returns.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_GetGeneratorHoriOffset(XL_Vtc *InstancePtr,
					XL_Vtc_HoriOffsets *HoriOffsets)
{
	uint32_t RegValue;

	/* Parse Generator VBlank Hori. Offset 0 register value */
	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_GVBHOFF_OFFSET);
	HoriOffsets->V0BlankHoriStart = RegValue & XVTC_XVXHOX_HSTART_MASK;
	HoriOffsets->V0BlankHoriEnd = (RegValue & XVTC_XVXHOX_HEND_MASK)
					>> XVTC_XVXHOX_HEND_SHIFT;

	/* Parse Generator VSync Hori. Offset 0 register value */
	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
						XVTC_GVSHOFF_OFFSET);
	HoriOffsets->V0SyncHoriStart = RegValue & XVTC_XVXHOX_HSTART_MASK;
	HoriOffsets->V0SyncHoriEnd = (RegValue & XVTC_XVXHOX_HEND_MASK)
					>> XVTC_XVXHOX_HEND_SHIFT;

	/* Parse Generator VBlank Hori. Offset 1 register value */
	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
						XVTC_GVBHOFF_F1_OFFSET);
	HoriOffsets->V1BlankHoriStart = RegValue & XVTC_XVXHOX_HSTART_MASK;
	HoriOffsets->V1BlankHoriEnd = (RegValue & XVTC_XVXHOX_HEND_MASK)
					>> XVTC_XVXHOX_HEND_SHIFT;

	/* Parse Generator VSync Hori. Offset 1 register value */
	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
					 XVTC_GVSHOFF_F1_OFFSET);
	HoriOffsets->V1SyncHoriStart = RegValue & XVTC_XVXHOX_HSTART_MASK;
	HoriOffsets->V1SyncHoriEnd = (RegValue & XVTC_XVXHOX_HEND_MASK)
					>> XVTC_XVXHOX_HEND_SHIFT;
}

/*****************************************************************************/
/**
*
* This function gets the VBlank/VSync Horizontal Offsets detected by
* the Detector in the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	HoriOffsets points to a VBlank/VSync Horizontal Offset
*		configuration structure that will be populated with the setting
*		detected on the Detector in the given VTC device after this
*		function returns.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_GetDetectorHoriOffset(XL_Vtc *InstancePtr,
				XL_Vtc_HoriOffsets *HoriOffsets)
{
	uint32_t RegValue;

	/* Parse Detector VBlank Hori. Offset 0 register value */
	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_DVBHOFF_OFFSET);
	HoriOffsets->V0BlankHoriStart = RegValue & XVTC_XVXHOX_HSTART_MASK;
	HoriOffsets->V0BlankHoriEnd = (RegValue & XVTC_XVXHOX_HEND_MASK)
					>> XVTC_XVXHOX_HEND_SHIFT;

	/* Parse Detector VSync Hori. Offset 0 register value */
	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
						XVTC_DVSHOFF_OFFSET);
	HoriOffsets->V0SyncHoriStart = RegValue & XVTC_XVXHOX_HSTART_MASK;
	HoriOffsets->V0SyncHoriEnd = (RegValue & XVTC_XVXHOX_HEND_MASK)
					>> XVTC_XVXHOX_HEND_SHIFT;

	/* Parse Detector VBlank Hori. Offset 1 register value */
	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
						XVTC_DVBHOFF_F1_OFFSET);
	HoriOffsets->V1BlankHoriStart = RegValue & XVTC_XVXHOX_HSTART_MASK;
	HoriOffsets->V1BlankHoriEnd = (RegValue & XVTC_XVXHOX_HEND_MASK)
					>> XVTC_XVXHOX_HEND_SHIFT;

	/* Parse Detector VSync Hori. Offset 1 register value */
	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
						XVTC_DVSHOFF_F1_OFFSET);
	HoriOffsets->V1SyncHoriStart = RegValue & XVTC_XVXHOX_HSTART_MASK;
	HoriOffsets->V1SyncHoriEnd = (RegValue & XVTC_XVXHOX_HEND_MASK)
					>> XVTC_XVXHOX_HEND_SHIFT;
}

/*****************************************************************************/
/**
*
* This function sets up VTC signal to be used by the Generator module
* in the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	SignalCfgPtr is a pointer to the VTC signal configuration
*		to be used by the Generator module in the VTC core.
*
* @return	None.
*
* @note		None.
*
*****************************************************************************/
void XL_Vtc_SetGenerator(XL_Vtc *InstancePtr, XL_Vtc_Signal *SignalCfgPtr)
{
	uint32_t RegValue;
	uint32_t r_htotal, r_vtotal, r_hactive, r_vactive;
	XL_Vtc_Signal *SCPtr;
	XL_Vtc_HoriOffsets horiOffsets;

	SCPtr = SignalCfgPtr;
	if(SCPtr->OriginMode == 0)
	{
		r_htotal = SCPtr->HTotal+1;
		r_vtotal = SCPtr->V0Total+1;

		r_hactive = r_htotal - SCPtr->HActiveStart;
		r_vactive = r_vtotal - SCPtr->V0ActiveStart;

		RegValue = (r_htotal) & XVTC_SB_START_MASK;
		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
					XVTC_GHSIZE_OFFSET, RegValue);

		RegValue = (r_vtotal) & XVTC_VSIZE_F0_MASK;
		RegValue |= ((SCPtr->V1Total+1) << XVTC_VSIZE_F1_SHIFT) &
							XVTC_VSIZE_F1_MASK;
		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
					XVTC_GVSIZE_OFFSET, RegValue);


		RegValue = (r_hactive) & XVTC_ASIZE_HORI_MASK;
		RegValue |= ((r_vactive) << XVTC_ASIZE_VERT_SHIFT ) &
							XVTC_ASIZE_VERT_MASK;
		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
						XVTC_GASIZE_OFFSET, RegValue);
		/* For some resolutions, the FIELD1 vactive size is different
		 * from FIELD0, e.g. XVIDC_VM_720x486_60_I (SDI NTSC),
		 * As there is no vactive FIELD1 entry in the video common
		 * library, program it separately. For resolutions where
		 * vactive values are different, it should be taken care in
		 * corrosponding driver. Otherwise program same values in
		 * FIELD0 and FIELD1 registers */
		RegValue = ((r_vactive) << XVTC_ASIZE_VERT_SHIFT) &
				XVTC_ASIZE_VERT_MASK;

		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
						XVTC_GASIZE_F1_OFFSET, RegValue);

		/* Update the Generator Horizontal 1 Register */
		RegValue = (SCPtr->HSyncStart + r_hactive) &
						XVTC_SB_START_MASK;
		RegValue |= ((SCPtr->HBackPorchStart + r_hactive) <<
				XVTC_SB_END_SHIFT) & XVTC_SB_END_MASK;
		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
					XVTC_GHSYNC_OFFSET, RegValue);

		/* Update the Generator Vertical 1 Register (field 0) */
		RegValue = (SCPtr->V0SyncStart + r_vactive -1) &
						XVTC_SB_START_MASK;
		RegValue |= ((SCPtr->V0BackPorchStart + r_vactive -1) <<
				XVTC_SB_END_SHIFT) & XVTC_SB_END_MASK;
		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
					XVTC_GVSYNC_OFFSET, RegValue);

		/* Update the Generator Vertical Sync Register (field 1) */
		RegValue = (SCPtr->V1SyncStart + r_vactive -1) &
						XVTC_SB_START_MASK;
		RegValue |= ((SCPtr->V1BackPorchStart + r_vactive -1) <<
					XVTC_SB_END_SHIFT) & XVTC_SB_END_MASK;
		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
					XVTC_GVSYNC_F1_OFFSET, RegValue);

		/* Chroma Start */
		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_GFENC_OFFSET);
		RegValue &= ~XVTC_ENC_CPARITY_MASK;
		RegValue = (((SCPtr->V0ChromaStart - SCPtr->V0ActiveStart) <<
						XVTC_ENC_CPARITY_SHIFT) &
					XVTC_ENC_CPARITY_MASK) | RegValue;

		RegValue &= ~XVTC_ENC_PROG_MASK;
		RegValue |= (SCPtr->Interlaced << XVTC_ENC_PROG_SHIFT) &
				XVTC_ENC_PROG_MASK;

		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
						XVTC_GFENC_OFFSET, RegValue);

		/* Setup default Horizontal Offsets - can override later with
		 * XL_Vtc_SetGeneratorHoriOffset()
		 */
		horiOffsets.V0BlankHoriStart = r_hactive;
		horiOffsets.V0BlankHoriEnd = r_hactive;
		horiOffsets.V0SyncHoriStart = SCPtr->HSyncStart + r_hactive;
		horiOffsets.V0SyncHoriEnd = SCPtr->HSyncStart + r_hactive;

		horiOffsets.V1BlankHoriStart = r_hactive;
		horiOffsets.V1BlankHoriEnd = r_hactive;
		horiOffsets.V1SyncHoriStart = SCPtr->HSyncStart + r_hactive;
		horiOffsets.V1SyncHoriEnd = SCPtr->HSyncStart + r_hactive;

	}
	else
	{
		/* Total in mode=1 is the line width */
		r_htotal = SCPtr->HTotal;
		/* Total in mode=1 is the frame height */
		r_vtotal = SCPtr->V0Total;
		r_hactive = SCPtr->HFrontPorchStart;
		r_vactive = SCPtr->V0FrontPorchStart;

		RegValue = (r_htotal) & XVTC_SB_START_MASK;
		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
					XVTC_GHSIZE_OFFSET, RegValue);

		RegValue = (r_vtotal) & XVTC_VSIZE_F0_MASK;
		RegValue |= ((SCPtr->V1Total) << XVTC_VSIZE_F1_SHIFT) &
							XVTC_VSIZE_F1_MASK;
		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
						XVTC_GVSIZE_OFFSET, RegValue);


		RegValue = (r_hactive) & XVTC_ASIZE_HORI_MASK;
		RegValue |= ((r_vactive) << XVTC_ASIZE_VERT_SHIFT) &
							XVTC_ASIZE_VERT_MASK;
		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
						XVTC_GASIZE_OFFSET, RegValue);
		/* For some resolutions, the FIELD1 vactive size is different
		 * from FIELD0, e.g. XVIDC_VM_720x486_60_I (SDI NTSC),
		 * As there is no vactive FIELD1 entry in the video common
		 * library, program it separately. For resolutions where
		 * vactive values are different, it should be taken care in
		 * corrosponding driver. Otherwise program same values in
		 * FIELD0 and FIELD1 registers */
		RegValue = ((r_vactive) << XVTC_ASIZE_VERT_SHIFT) &
				XVTC_ASIZE_VERT_MASK;

		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
						XVTC_GASIZE_F1_OFFSET, RegValue);

		/* Update the Generator Horizontal 1 Register */
		RegValue = (SCPtr->HSyncStart) & XVTC_SB_START_MASK;
		RegValue |= ((SCPtr->HBackPorchStart) << XVTC_SB_END_SHIFT) &
						XVTC_SB_END_MASK;
		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
					XVTC_GHSYNC_OFFSET, RegValue);


		/* Update the Generator Vertical Sync Register (field 0) */
		RegValue = (SCPtr->V0SyncStart) & XVTC_SB_START_MASK;
		RegValue |= ((SCPtr->V0BackPorchStart) << XVTC_SB_END_SHIFT) &
						XVTC_SB_END_MASK;
		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
						XVTC_GVSYNC_OFFSET, RegValue);

		/* Update the Generator Vertical Sync Register (field 1) */
		RegValue = (SCPtr->V1SyncStart) & XVTC_SB_START_MASK;
		RegValue |= ((SCPtr->V1BackPorchStart) << XVTC_SB_END_SHIFT) &
						XVTC_SB_END_MASK;
		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
					XVTC_GVSYNC_F1_OFFSET, RegValue);

		/* Chroma Start */
		  RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_GFENC_OFFSET);
		RegValue &= ~XVTC_ENC_CPARITY_MASK;
		RegValue = (((SCPtr->V0ChromaStart - SCPtr->V0ActiveStart) <<
							XVTC_ENC_CPARITY_SHIFT)
					& XVTC_ENC_CPARITY_MASK) | RegValue;

		RegValue &= ~XVTC_ENC_PROG_MASK;
		RegValue |= (SCPtr->Interlaced << XVTC_ENC_PROG_SHIFT) &
						XVTC_ENC_PROG_MASK;

		XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
					XVTC_GFENC_OFFSET, RegValue);

		/* Setup default Horizontal Offsets - can override later with
		 * XL_Vtc_SetGeneratorHoriOffset()
		 */
		horiOffsets.V0BlankHoriStart = r_hactive;
		horiOffsets.V0BlankHoriEnd = r_hactive;
		horiOffsets.V0SyncHoriStart = SCPtr->HSyncStart;
		horiOffsets.V0SyncHoriEnd = SCPtr->HSyncStart;
		horiOffsets.V1BlankHoriStart = r_hactive;
		horiOffsets.V1BlankHoriEnd = r_hactive;
		horiOffsets.V1SyncHoriStart = SCPtr->HSyncStart;
		horiOffsets.V1SyncHoriEnd = SCPtr->HSyncStart;

	}
	XL_Vtc_SetGeneratorHoriOffset(InstancePtr, &horiOffsets);

}

/*****************************************************************************/
/**
*
* This function gets the VTC signal setting used by the Generator module
* in the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	SignalCfgPtr is a pointer to a VTC signal configuration
*		which will be populated with the setting used by the Generator
*		module in the VTC core once this function returns.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_GetGenerator(XL_Vtc *InstancePtr, XL_Vtc_Signal *SignalCfgPtr)
{
	uint32_t RegValue;
    uint32_t r_htotal, r_vtotal, r_hactive, r_vactive;
	XL_Vtc_Signal *SCPtr;

	SCPtr = SignalCfgPtr;
  if(SCPtr->OriginMode == 0)
  {

	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress, XVTC_GHSIZE_OFFSET);
	r_htotal = (RegValue) & XVTC_SB_START_MASK;
	SCPtr->HTotal = (r_htotal-1) & XVTC_SB_START_MASK;

	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress, XVTC_GVSIZE_OFFSET);
	r_vtotal = (RegValue) & XVTC_VSIZE_F0_MASK;
	SCPtr->V0Total = (r_vtotal-1) & XVTC_VSIZE_F0_MASK;
	SCPtr->V1Total = (RegValue & XVTC_VSIZE_F1_MASK) >> XVTC_VSIZE_F1_SHIFT;
    if(SCPtr->V1Total != 0)
    {
      SCPtr->V1Total = SCPtr->V1Total - 1;
    }

	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress, XVTC_GASIZE_OFFSET);
	r_hactive = (RegValue) & XVTC_ASIZE_HORI_MASK;
	SCPtr->HActiveStart = (r_htotal - r_hactive) & XVTC_ASIZE_HORI_MASK;
	r_vactive = (RegValue & XVTC_ASIZE_VERT_MASK) >> XVTC_ASIZE_VERT_SHIFT;

	SCPtr->V0ActiveStart = (r_vtotal - r_vactive) & XVTC_VSIZE_F0_MASK;
	SCPtr->V1ActiveStart = (SCPtr->V1Total - r_vactive - 1) & XVTC_VSIZE_F0_MASK;

	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress, XVTC_GHSYNC_OFFSET);
    SCPtr->HSyncStart = ((RegValue - r_hactive) & XVTC_SB_START_MASK);
    SCPtr->HBackPorchStart = (((RegValue>>16) - r_hactive) & XVTC_SB_START_MASK);

	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress, XVTC_GVSYNC_OFFSET);
    SCPtr->V0SyncStart = ((RegValue-r_vactive+1) & XVTC_SB_START_MASK);
    SCPtr->V0BackPorchStart = (((RegValue>>16) - r_vactive+1) & XVTC_SB_START_MASK);

	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress, XVTC_GVSYNC_F1_OFFSET);
    SCPtr->V1SyncStart = ((RegValue-r_vactive+1) & XVTC_SB_START_MASK);
    SCPtr->V1BackPorchStart = (((RegValue>>16) - r_vactive+1) & XVTC_SB_START_MASK);


	/* Get signal values from the Generator Vertical 2 Register (field 0)*/
	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress, XVTC_GFENC_OFFSET);
	SCPtr->V0ChromaStart = (((RegValue & XVTC_ENC_CPARITY_MASK) >>
					XVTC_ENC_CPARITY_SHIFT) + (r_vtotal - r_vactive)) & XVTC_SB_START_MASK;

	SCPtr->V1ChromaStart = (((RegValue & XVTC_ENC_CPARITY_MASK) >>
					XVTC_ENC_CPARITY_SHIFT) + (SCPtr->V1Total - r_vactive - 1)) & XVTC_SB_START_MASK;

	SCPtr->Interlaced = (RegValue & XVTC_ENC_PROG_MASK) >> XVTC_ENC_PROG_SHIFT;
    SCPtr->HFrontPorchStart = 0;
    SCPtr->V0FrontPorchStart = 0;
  }
	else
	{
		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_GHSIZE_OFFSET);
		r_htotal = (RegValue) & XVTC_SB_START_MASK;
		SCPtr->HTotal = (r_htotal) & XVTC_SB_START_MASK;

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_GVSIZE_OFFSET);
		r_vtotal = (RegValue) & XVTC_SB_START_MASK;
		SCPtr->V0Total = (r_vtotal) & XVTC_SB_START_MASK;
		SCPtr->V1Total = (RegValue>>XVTC_SB_END_SHIFT) &
							XVTC_SB_START_MASK;

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_GASIZE_OFFSET);
		r_hactive = (RegValue) & XVTC_SB_START_MASK;
		SCPtr->HFrontPorchStart = (r_hactive) & XVTC_SB_START_MASK;
		r_vactive = (RegValue>>XVTC_SB_END_SHIFT) & XVTC_SB_START_MASK;
		SCPtr->V0FrontPorchStart = (r_vactive) & XVTC_SB_START_MASK;
		SCPtr->V1FrontPorchStart = SCPtr->V0FrontPorchStart;

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_GHSYNC_OFFSET);
		SCPtr->HSyncStart = ((RegValue) & XVTC_SB_START_MASK);
		SCPtr->HBackPorchStart = (((RegValue>>XVTC_SB_END_SHIFT)) &
							XVTC_SB_START_MASK);

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_GVSYNC_OFFSET);
		SCPtr->V0SyncStart = ((RegValue) & XVTC_SB_START_MASK);
		SCPtr->V0BackPorchStart = (((RegValue>>XVTC_SB_END_SHIFT)) &
							XVTC_SB_START_MASK);

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_GVSYNC_F1_OFFSET);
		SCPtr->V1SyncStart = ((RegValue) & XVTC_SB_START_MASK);
		SCPtr->V1BackPorchStart = (((RegValue>>XVTC_SB_END_SHIFT)) &
							XVTC_SB_START_MASK);

		/* Get signal values from the Generator Vertical 2 Register (field 0)*/
		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_GFENC_OFFSET);
		SCPtr->V0ChromaStart = (((RegValue & XVTC_ENC_CPARITY_MASK) >>
				XVTC_ENC_CPARITY_SHIFT)) & XVTC_SB_START_MASK;
		SCPtr->V1ChromaStart = (((RegValue & XVTC_ENC_CPARITY_MASK) >>
				XVTC_ENC_CPARITY_SHIFT)) & XVTC_SB_START_MASK;
		SCPtr->Interlaced = (RegValue & XVTC_ENC_PROG_MASK) >> XVTC_ENC_PROG_SHIFT;

		SCPtr->HActiveStart = 0;
		SCPtr->V0ActiveStart = 0;
		SCPtr->V1ActiveStart = 0;
	}
}

/*****************************************************************************/
/**
*
* This function gets the VTC signal setting used by the Detector module
* in the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	SignalCfgPtr is a pointer to a VTC signal configuration
*		which will be populated with the setting used by the Detector
*		module in the VTC core once this function returns.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_GetDetector(XL_Vtc *InstancePtr, XL_Vtc_Signal *SignalCfgPtr)
{
	uint32_t RegValue;
	uint32_t r_htotal, r_vtotal, r_hactive, r_vactive;
	XL_Vtc_Signal *SCPtr;

	SCPtr = SignalCfgPtr;

	if(SCPtr->OriginMode == 0)
	{
		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
						XVTC_DHSIZE_OFFSET);
		r_htotal = (RegValue) & XVTC_SB_START_MASK;
		SCPtr->HTotal = (r_htotal-1) & XVTC_SB_START_MASK;

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
						XVTC_DVSIZE_OFFSET);
		r_vtotal = (RegValue) & XVTC_SB_START_MASK;
		SCPtr->V0Total = (r_vtotal-1) & XVTC_SB_START_MASK;
		SCPtr->V1Total = (RegValue>>XVTC_SB_END_SHIFT) &
							XVTC_SB_START_MASK;
		if(SCPtr->V1Total != 0) {
			SCPtr->V1Total = SCPtr->V1Total - 1;
		}

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_DASIZE_OFFSET);
		r_hactive = (RegValue) & XVTC_SB_START_MASK;
		SCPtr->HActiveStart = (r_htotal - r_hactive) &
						XVTC_SB_START_MASK;
		r_vactive = (RegValue>>XVTC_SB_END_SHIFT) &
						XVTC_SB_START_MASK;
		SCPtr->V0ActiveStart = (r_vtotal - r_vactive) &
						XVTC_SB_START_MASK;
		SCPtr->V1ActiveStart = (SCPtr->V1Total - r_vactive - 1) &
							XVTC_SB_START_MASK;

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_DHSYNC_OFFSET);
		SCPtr->HSyncStart = ((RegValue - r_hactive) &
						XVTC_SB_START_MASK);
		SCPtr->HBackPorchStart = (((RegValue>>XVTC_SB_END_SHIFT) -
							r_hactive)
						& XVTC_SB_START_MASK);

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_DVSYNC_OFFSET);
		SCPtr->V0SyncStart = ((RegValue-r_vactive+1) &
							XVTC_SB_START_MASK);
		SCPtr->V0BackPorchStart = (((RegValue>>XVTC_SB_END_SHIFT) -
					r_vactive+1) & XVTC_SB_START_MASK);

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
						XVTC_GVSYNC_F1_OFFSET);
		SCPtr->V1SyncStart = ((RegValue-r_vactive+1) &
						XVTC_SB_START_MASK);
		SCPtr->V1BackPorchStart = (((RegValue>>XVTC_SB_END_SHIFT) -
								r_vactive+1)
							& XVTC_SB_START_MASK);

		/* Get signal values from the Generator Vertical 2 Register
		 * (field 0)
		 */
		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_DFENC_OFFSET);
		SCPtr->V0ChromaStart = (((RegValue & XVTC_ENC_CPARITY_MASK) >>
					XVTC_ENC_CPARITY_SHIFT) +
				(r_vtotal - r_vactive)) & XVTC_SB_START_MASK;

		SCPtr->V1ChromaStart = (((RegValue & XVTC_ENC_CPARITY_MASK) >>
						XVTC_ENC_CPARITY_SHIFT) +
			(SCPtr->V1Total - r_vactive - 1)) & XVTC_SB_START_MASK;
		SCPtr->Interlaced = (RegValue & XVTC_ENC_PROG_MASK) >> XVTC_ENC_PROG_SHIFT;

		SCPtr->HFrontPorchStart = 0;
		SCPtr->V0FrontPorchStart = 0;
	}
	else
	{
		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_DHSIZE_OFFSET);
		r_htotal = (RegValue) & XVTC_SB_START_MASK;
		SCPtr->HTotal = (r_htotal) & XVTC_SB_START_MASK;

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_DVSIZE_OFFSET);
		r_vtotal = (RegValue) & XVTC_SB_START_MASK;
		SCPtr->V0Total = (r_vtotal) & XVTC_SB_START_MASK;
		SCPtr->V1Total = (RegValue>>XVTC_SB_END_SHIFT) &
							XVTC_SB_START_MASK;

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_DASIZE_OFFSET);
		r_hactive = (RegValue) & XVTC_SB_START_MASK;
		SCPtr->HFrontPorchStart = (r_hactive) & XVTC_SB_START_MASK;
		r_vactive = (RegValue>>XVTC_SB_END_SHIFT) & XVTC_SB_START_MASK;
		SCPtr->V0FrontPorchStart = (r_vactive) & XVTC_SB_START_MASK;
		SCPtr->V1FrontPorchStart = SCPtr->V0FrontPorchStart;

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_DHSYNC_OFFSET);
		SCPtr->HSyncStart = ((RegValue) & XVTC_SB_START_MASK);
		SCPtr->HBackPorchStart = (((RegValue>>XVTC_SB_END_SHIFT)) &
							XVTC_SB_START_MASK);

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_DVSYNC_OFFSET);
		SCPtr->V0SyncStart = ((RegValue) & XVTC_SB_START_MASK);
		SCPtr->V0BackPorchStart = (((RegValue>>XVTC_SB_END_SHIFT)) &
							XVTC_SB_START_MASK);

		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_DVSYNC_F1_OFFSET);
		SCPtr->V1SyncStart = ((RegValue) & XVTC_SB_START_MASK);
		SCPtr->V1BackPorchStart = (((RegValue>>XVTC_SB_END_SHIFT)) &
							XVTC_SB_START_MASK);


		/* Get signal values from the Generator Vertical 2 Register
		 * (field 0)
		 */
		RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
							XVTC_DFENC_OFFSET);
		SCPtr->V0ChromaStart = (((RegValue & XVTC_ENC_CPARITY_MASK) >>
				XVTC_ENC_CPARITY_SHIFT)) & XVTC_SB_START_MASK;

		SCPtr->V1ChromaStart = (((RegValue & XVTC_ENC_CPARITY_MASK) >>
				XVTC_ENC_CPARITY_SHIFT)) & XVTC_SB_START_MASK;
		SCPtr->Interlaced = (RegValue & XVTC_ENC_PROG_MASK) >> XVTC_ENC_PROG_SHIFT;

		SCPtr->HActiveStart = 0;
		SCPtr->V0ActiveStart = 0;
		SCPtr->V1ActiveStart = 0;
	}


}

/*****************************************************************************/
/**
*
* This function facilitates software identification of exact version of the
* VTC hardware (h/w).
*
* @param	InstancePtr is a pointer to the XL_Vtc instance.
*
* @return	Version, contents of a Version register.
*
* @note		None.
*
******************************************************************************/
uint32_t XL_Vtc_GetVersion(XL_Vtc *InstancePtr)
{
	uint32_t Version;

	/* Read Version register */
	Version = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
				XVTC_VER_OFFSET);

	return Version;
}

/*****************************************************************************/
/**
*
* This function converts the video mode integer into the video timing
* information stored within the XL_Vtc_Timing pointer.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	Mode is a uint16_t int defined as macro to one of the predefined
*		Video Modes.
* @param	TimingPtr is a pointer to a VTC Video Timing Structure.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_ConvVideoMode2Timing(XL_Vtc *InstancePtr, uint16_t Mode,
					XL_Vtc_Timing *TimingPtr)
{

	/* clear timing structure. Set Interlaced to 0 by default */
	memset((void *)TimingPtr, 0, sizeof(XL_Vtc_Timing));

	switch(Mode)
	{
	case XVTC_VMODE_720P: // 720p@60 (1280x720 HD 720)
	{

		// Horizontal Timing
		TimingPtr->HActiveVideo  = 1280;
		TimingPtr->HFrontPorch   = 110;
		TimingPtr->HSyncWidth    = 40;
		TimingPtr->HBackPorch    = 220;
		TimingPtr->HSyncPolarity = 1;

		// Vertical Timing
		TimingPtr->VActiveVideo  = 720;
		TimingPtr->V0FrontPorch   = 5;
		TimingPtr->V0SyncWidth    = 5;
		TimingPtr->V0BackPorch    = 20;
		TimingPtr->VSyncPolarity = 1;

		break;
	}
	case XVTC_VMODE_1080P: // 1080p@60 (1920x1080 HD 1080)
	{
		// Horizontal Timing
		TimingPtr->HActiveVideo  = 1920;
		TimingPtr->HFrontPorch   = 88;
		TimingPtr->HSyncWidth    = 44;
		TimingPtr->HBackPorch    = 148;
		TimingPtr->HSyncPolarity = 1;

		 // Vertical Timing
		TimingPtr->VActiveVideo  = 1080;
		TimingPtr->V0FrontPorch   = 4;
		TimingPtr->V0SyncWidth    = 5;
		TimingPtr->V0BackPorch    = 36;
		TimingPtr->VSyncPolarity = 1;

		break;
	}
	case XVTC_VMODE_480P: // 480p@60
	{
		// Horizontal Timing
		TimingPtr->HActiveVideo  = 720;
		TimingPtr->HFrontPorch   = 16;
		TimingPtr->HSyncWidth    = 62;
		TimingPtr->HBackPorch    = 60;
		TimingPtr->HSyncPolarity = 0;

		 // Vertical Timing
		TimingPtr->VActiveVideo  = 480;
		TimingPtr->V0FrontPorch   = 9;
		TimingPtr->V0SyncWidth    = 6;
		TimingPtr->V0BackPorch    = 30;
		TimingPtr->VSyncPolarity = 0;

		break;
	}
	case XVTC_VMODE_576P: // 576p@50
	{
		// Horizontal Timing
		TimingPtr->HActiveVideo  = 720;
		TimingPtr->HFrontPorch   = 12;
		TimingPtr->HSyncWidth    = 64;
		TimingPtr->HBackPorch    = 68;
		TimingPtr->HSyncPolarity = 0;

		 // Vertical Timing
		TimingPtr->VActiveVideo  = 576;
		TimingPtr->V0FrontPorch   = 5;
		TimingPtr->V0SyncWidth    = 5;
		TimingPtr->V0BackPorch    = 39;
		TimingPtr->VSyncPolarity = 0;

		break;
	}
	case XVTC_VMODE_VGA: // 640x480 (VGA)
	{
		// Horizontal Timing
		TimingPtr->HActiveVideo  = 640;
		TimingPtr->HFrontPorch   = 16;
		TimingPtr->HSyncWidth    = 96;
		TimingPtr->HBackPorch    = 48;
		TimingPtr->HSyncPolarity = 0;

		 // Vertical Timing
		TimingPtr->VActiveVideo  = 480;
		TimingPtr->V0FrontPorch   = 10;
		TimingPtr->V0SyncWidth    = 2;
		TimingPtr->V0BackPorch    = 33;
		TimingPtr->VSyncPolarity = 0;

		break;
	}
	case XVTC_VMODE_SVGA: // 800x600@60 (SVGA)
	{
		// Horizontal Timing
		TimingPtr->HActiveVideo  = 800;
		TimingPtr->HFrontPorch   = 40;
		TimingPtr->HSyncWidth    = 128;
		TimingPtr->HBackPorch    = 88;
		TimingPtr->HSyncPolarity = 1;

		 // Vertical Timing
		TimingPtr->VActiveVideo  = 600;
		TimingPtr->V0FrontPorch   = 1;
		TimingPtr->V0SyncWidth    = 4;
		TimingPtr->V0BackPorch    = 23;
		TimingPtr->VSyncPolarity = 1;

		break;
	}
	case XVTC_VMODE_XGA: // 1024x768@60 (XGA)
	{
		// Horizontal Timing
		TimingPtr->HActiveVideo  = 1024;
		TimingPtr->HFrontPorch   = 24;
		TimingPtr->HSyncWidth    = 136;
		TimingPtr->HBackPorch    = 160;
		TimingPtr->HSyncPolarity = 0;

		 // Vertical Timing
		TimingPtr->VActiveVideo  = 768;
		TimingPtr->V0FrontPorch   = 3;
		TimingPtr->V0SyncWidth    = 6;
		TimingPtr->V0BackPorch    = 29;
		TimingPtr->VSyncPolarity = 0;

		break;
	}
	case XVTC_VMODE_SXGA: // 1280x1024@60 (SXGA)
	{
		// Horizontal Timing
		TimingPtr->HActiveVideo  = 1280;
		TimingPtr->HFrontPorch   = 48;
		TimingPtr->HSyncWidth    = 112;
		TimingPtr->HBackPorch    = 248;
		TimingPtr->HSyncPolarity = 1;

		 // Vertical Timing
		TimingPtr->VActiveVideo  = 1024;
		TimingPtr->V0FrontPorch   = 1;
		TimingPtr->V0SyncWidth    = 3;
		TimingPtr->V0BackPorch    = 38;
		TimingPtr->VSyncPolarity = 1;

		break;
	}

	case XVTC_VMODE_WXGAPLUS: // 1440x900@60 (WXGA+)
	{
		// Horizontal Timing
		TimingPtr->HActiveVideo  = 1440;
		TimingPtr->HFrontPorch   = 80;
		TimingPtr->HSyncWidth    = 152;
		TimingPtr->HBackPorch    = 232;
		TimingPtr->HSyncPolarity = 0;

		 // Vertical Timing
		TimingPtr->VActiveVideo  = 900;
		TimingPtr->V0FrontPorch   = 3;
		TimingPtr->V0SyncWidth    = 6;
		TimingPtr->V0BackPorch    = 25;
		TimingPtr->VSyncPolarity = 1;

		break;
	}
	case XVTC_VMODE_WSXGAPLUS: // 1680x1050@60 (WSXGA+)
	{
		// Horizontal Timing
		TimingPtr->HActiveVideo  = 1680;
		TimingPtr->HFrontPorch   = 104;
		TimingPtr->HSyncWidth    = 176;
		TimingPtr->HBackPorch    = 280;
		TimingPtr->HSyncPolarity = 0;

		 // Vertical Timing
		TimingPtr->VActiveVideo  = 1050;
		TimingPtr->V0FrontPorch   = 3;
		TimingPtr->V0SyncWidth    = 6;
		TimingPtr->V0BackPorch    = 30;
		TimingPtr->VSyncPolarity = 1;

		break;
	}
	case XVTC_VMODE_1080I: // 1080i@60
	{
		TimingPtr->Interlaced = 1;

		// Horizontal Timing
		TimingPtr->HActiveVideo  = 1920;
		TimingPtr->HFrontPorch   = 88;
		TimingPtr->HSyncWidth    = 44;
		TimingPtr->HBackPorch    = 148;
		TimingPtr->HSyncPolarity = 1;

		 // Vertical Timing
		TimingPtr->VActiveVideo  = 540;
		TimingPtr->V0FrontPorch   = 2;
		TimingPtr->V0SyncWidth    = 5;
		TimingPtr->V0BackPorch    = 15;

		TimingPtr->V1FrontPorch   = 2;
		TimingPtr->V1SyncWidth    = 5;
		TimingPtr->V1BackPorch    = 16;

		TimingPtr->VSyncPolarity = 1;

		break;
	}
	case XVTC_VMODE_NTSC: //480i@60
	{
		TimingPtr->Interlaced = 1;
		// Horizontal Timing
		TimingPtr->HActiveVideo  = 720;
		TimingPtr->HFrontPorch   = 19;
		TimingPtr->HSyncWidth    = 62;
		TimingPtr->HBackPorch    = 57;
		TimingPtr->HSyncPolarity = 0;

		 // Vertical Timing
		TimingPtr->VActiveVideo  = 240;
		TimingPtr->V0FrontPorch   = 4;
		TimingPtr->V0SyncWidth    = 3;
		TimingPtr->V0BackPorch    = 15;

		TimingPtr->V1FrontPorch   = 4;
		TimingPtr->V1SyncWidth    = 3;
		TimingPtr->V1BackPorch    = 16;

		TimingPtr->VSyncPolarity = 0;

		break;
	}
	case XVTC_VMODE_PAL: //576i@50
	{
		TimingPtr->Interlaced = 1;
		// Horizontal Timing
		TimingPtr->HActiveVideo  = 720;
		TimingPtr->HFrontPorch   = 12;
		TimingPtr->HSyncWidth    = 63;
		TimingPtr->HBackPorch    = 69;
		TimingPtr->HSyncPolarity = 0;

		 // Vertical Timing
		TimingPtr->VActiveVideo  = 288;
		TimingPtr->V0FrontPorch   = 2;
		TimingPtr->V0SyncWidth    = 3;
		TimingPtr->V0BackPorch    = 19;

		TimingPtr->V1FrontPorch   = 2;
		TimingPtr->V1SyncWidth    = 3;
		TimingPtr->V1BackPorch    = 20;

		TimingPtr->VSyncPolarity = 0;

		break;
	}

	// add other video formats here
	}
}

/*****************************************************************************/
/**
*
* This function converts the video timing structure into the VTC signal
* configuration structure, horizontal offsets structure and the
* polarity structure.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	TimingPtr is a pointer to a Video Timing structure to be read.
* @param	SignalCfgPtr is a pointer to a VTC signal configuration to be
*		set.
* @param	HOffPtr is a pointer to a VTC horizontal offsets structure to
*		be set.
* @param	PolarityPtr is a pointer to a VTC polarity structure to be set.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_ConvTiming2Signal(XL_Vtc *InstancePtr, XL_Vtc_Timing *TimingPtr,
			XL_Vtc_Signal *SignalCfgPtr, XL_Vtc_HoriOffsets *HOffPtr,
			XL_Vtc_Polarity *PolarityPtr)
{


	/* Setting up VTC Polarity.  */
	memset((void *)PolarityPtr, 0, sizeof(XL_Vtc_Polarity));
	PolarityPtr->ActiveChromaPol = 1;
	PolarityPtr->ActiveVideoPol  = 1;
	PolarityPtr->FieldIdPol      = 1;
	/* Vblank matches Vsync Polarity */
	PolarityPtr->VBlankPol       = TimingPtr->VSyncPolarity;
	PolarityPtr->VSyncPol        = TimingPtr->VSyncPolarity;
	/* hblank matches hsync Polarity */
	PolarityPtr->HBlankPol       = TimingPtr->HSyncPolarity;
	PolarityPtr->HSyncPol        = TimingPtr->HSyncPolarity;


	memset((void *)SignalCfgPtr, 0, sizeof(XL_Vtc_Signal));
	memset((void *)HOffPtr, 0, sizeof(XL_Vtc_HoriOffsets));

	/* Populate the VTC Signal config structure. */
	/* Active Video starts at 0 */
	SignalCfgPtr->OriginMode = 1;
	SignalCfgPtr->HActiveStart      = 0;
	SignalCfgPtr->HFrontPorchStart  = TimingPtr->HActiveVideo;
	SignalCfgPtr->HSyncStart        = SignalCfgPtr->HFrontPorchStart +
							TimingPtr->HFrontPorch;
	SignalCfgPtr->HBackPorchStart   = SignalCfgPtr->HSyncStart +
							TimingPtr->HSyncWidth;
	SignalCfgPtr->HTotal            = SignalCfgPtr->HBackPorchStart +
							TimingPtr->HBackPorch;

	SignalCfgPtr->V0ChromaStart     = 0;
	SignalCfgPtr->V0ActiveStart     = 0;
	SignalCfgPtr->V0FrontPorchStart = TimingPtr->VActiveVideo;
	SignalCfgPtr->V0SyncStart       = SignalCfgPtr->V0FrontPorchStart +
						TimingPtr->V0FrontPorch - 1;
	SignalCfgPtr->V0BackPorchStart  = SignalCfgPtr->V0SyncStart +
						TimingPtr->V0SyncWidth;
	SignalCfgPtr->V0Total           = SignalCfgPtr->V0BackPorchStart +
						TimingPtr->V0BackPorch + 1;

	HOffPtr->V0BlankHoriStart = SignalCfgPtr->HFrontPorchStart;
	HOffPtr->V0BlankHoriEnd   = SignalCfgPtr->HFrontPorchStart;
	HOffPtr->V0SyncHoriStart  = SignalCfgPtr->HSyncStart;
	HOffPtr->V0SyncHoriEnd    = SignalCfgPtr->HSyncStart;

	if(TimingPtr->Interlaced == 1) {
		SignalCfgPtr->V1ChromaStart     = 0;
		SignalCfgPtr->V1ActiveStart     = 0;
		SignalCfgPtr->V1FrontPorchStart = TimingPtr->VActiveVideo;
		SignalCfgPtr->V1SyncStart       =
					SignalCfgPtr->V1FrontPorchStart +
					TimingPtr->V1FrontPorch - 1;
		SignalCfgPtr->V1BackPorchStart  =
						SignalCfgPtr->V1SyncStart +
							TimingPtr->V1SyncWidth;
		SignalCfgPtr->V1Total           =
					SignalCfgPtr->V1BackPorchStart +
						TimingPtr->V1BackPorch + 1;
		SignalCfgPtr->Interlaced 		= 1;

		/* Align to H blank */
		HOffPtr->V1BlankHoriStart = SignalCfgPtr->HFrontPorchStart;
		/* Align to H Blank */
		HOffPtr->V1BlankHoriEnd   = SignalCfgPtr->HFrontPorchStart;

		/* Align to half line */
		HOffPtr->V1SyncHoriStart  = SignalCfgPtr->HSyncStart -
						(SignalCfgPtr->HTotal / 2);
		HOffPtr->V1SyncHoriEnd    = SignalCfgPtr->HSyncStart -
						(SignalCfgPtr->HTotal / 2);
	}
	/* Progressive formats */
	else {
	/* Set Field 1 same as Field 0 */
		SignalCfgPtr->V1ChromaStart     = SignalCfgPtr->V0ChromaStart;
		SignalCfgPtr->V1ActiveStart     = SignalCfgPtr->V0ActiveStart;
		SignalCfgPtr->V1FrontPorchStart =
					SignalCfgPtr->V0FrontPorchStart;
		SignalCfgPtr->V1SyncStart       = SignalCfgPtr->V0SyncStart;
		SignalCfgPtr->V1BackPorchStart  =
					SignalCfgPtr->V0BackPorchStart;
		SignalCfgPtr->V1Total           = SignalCfgPtr->V0Total;
		SignalCfgPtr->Interlaced		= 0;

		HOffPtr->V1BlankHoriStart = HOffPtr->V0BlankHoriStart;
		HOffPtr->V1BlankHoriEnd   = HOffPtr->V0BlankHoriEnd;
		HOffPtr->V1SyncHoriStart  = HOffPtr->V0SyncHoriStart;
		HOffPtr->V1SyncHoriEnd    = HOffPtr->V0SyncHoriEnd;
	}

}

/*****************************************************************************/
/**
*
* This function converts the VTC signal structure, horizontal offsets
* structure and the polarity structure into the Video Timing structure.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	SignalCfgPtr is a pointer to a VTC signal configuration to
*		be read
* @param	HOffPtr is a pointer to a VTC horizontal offsets structure
*		to be read
* @param	PolarityPtr is a pointer to a VTC polarity structure to be
*		read.
* @param	TimingPtr is a pointer to a Video Timing structure to be set.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_ConvSignal2Timing(XL_Vtc *InstancePtr, XL_Vtc_Signal *SignalCfgPtr,
				XL_Vtc_HoriOffsets *HOffPtr,
				XL_Vtc_Polarity *PolarityPtr,
				XL_Vtc_Timing *TimingPtr)
{

	memset((void *)TimingPtr, 0, sizeof(XL_Vtc_Timing));

	/* Set Polarity */
	TimingPtr->VSyncPolarity = PolarityPtr->VSyncPol;
	TimingPtr->HSyncPolarity = PolarityPtr->HSyncPol;

	/* Horizontal Timing */
	TimingPtr->HActiveVideo = SignalCfgPtr->HFrontPorchStart;


	TimingPtr->HFrontPorch  = SignalCfgPtr->HSyncStart -
					SignalCfgPtr->HFrontPorchStart;
	TimingPtr->HSyncWidth   = SignalCfgPtr->HBackPorchStart -
				        SignalCfgPtr->HSyncStart;
	TimingPtr->HBackPorch   = SignalCfgPtr->HTotal -
					SignalCfgPtr->HBackPorchStart;

	/* Vertical Timing */
	TimingPtr->VActiveVideo  = SignalCfgPtr->V0FrontPorchStart;


	TimingPtr->V0FrontPorch  = SignalCfgPtr->V0SyncStart -
					  SignalCfgPtr->V0FrontPorchStart + 1;
	TimingPtr->V0SyncWidth   = SignalCfgPtr->V0BackPorchStart -
						SignalCfgPtr->V0SyncStart + 1;
	TimingPtr->V0BackPorch   = SignalCfgPtr->V0Total -
					SignalCfgPtr->V0BackPorchStart;

	TimingPtr->V1FrontPorch  = SignalCfgPtr->V1SyncStart -
					SignalCfgPtr->V1FrontPorchStart + 1;
	TimingPtr->V1SyncWidth   = SignalCfgPtr->V1BackPorchStart -
						SignalCfgPtr->V1SyncStart + 1;
	TimingPtr->V1BackPorch   = SignalCfgPtr->V1Total -
					SignalCfgPtr->V1BackPorchStart;

	/* Interlaced */
	TimingPtr->Interlaced  = SignalCfgPtr->Interlaced;

}

/*****************************************************************************/
/**
*
* This function converts the video timing structure into predefined video
* mode values returned as a short integer.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	TimingPtr is a pointer to a Video Timing structure to be read.
*
* @return	VideoMode is the video mode of the VTC core.
*
* @note		None.
*
******************************************************************************/
uint16_t XL_Vtc_ConvTiming2VideoMode(XL_Vtc *InstancePtr, XL_Vtc_Timing *TimingPtr)
{

	/* Checking for Interlaced value */
	if(TimingPtr->Interlaced == 0) {
		if(TimingPtr->HActiveVideo == 1280) {
			if (TimingPtr->VActiveVideo == 720) {
				return XVTC_VMODE_720P;
			}
			else if (TimingPtr->VActiveVideo == 1024) {
				return XVTC_VMODE_SXGA;
			}

		}
		else if((TimingPtr->HActiveVideo == 1920) &&
				(TimingPtr->VActiveVideo == 1080)) {
			return XVTC_VMODE_1080P;
		}
		else if(TimingPtr->HActiveVideo == 720) {
			if (TimingPtr->VActiveVideo == 480) {
				return XVTC_VMODE_480P;
			}
			else if (TimingPtr->VActiveVideo == 576) {
				return XVTC_VMODE_576P;
			}
		}
		else if((TimingPtr->HActiveVideo == 640) &&
				(TimingPtr->VActiveVideo == 480)) {
			return XVTC_VMODE_VGA;
		}
		else if((TimingPtr->HActiveVideo == 800) &&
				(TimingPtr->VActiveVideo == 600)) {
			return XVTC_VMODE_SVGA;
		}
		else if((TimingPtr->HActiveVideo == 1024) &&
			(TimingPtr->VActiveVideo == 768)) {
			return XVTC_VMODE_XGA;
		}
		else if((TimingPtr->HActiveVideo == 1440) &&
				(TimingPtr->VActiveVideo == 900)) {
			return XVTC_VMODE_WXGAPLUS;
		}
		else if((TimingPtr->HActiveVideo == 1680) &&
				(TimingPtr->VActiveVideo == 1050)) {
			return XVTC_VMODE_WSXGAPLUS;
		}

	}
	/* Interlaced */
	else {
		if((TimingPtr->HActiveVideo == 720) &&
			(TimingPtr->VActiveVideo == 240)) {
			return XVTC_VMODE_NTSC;
		}
		else if((TimingPtr->HActiveVideo == 1920) &&
			(TimingPtr->VActiveVideo == 540)) {
			return XVTC_VMODE_1080I;
		}
		else if((TimingPtr->HActiveVideo == 720) &&
				(TimingPtr->VActiveVideo == 288)) {
			return XVTC_VMODE_PAL;
		}

	}

	/* Not found - read from Timing to discover format */
	return 0;
}

/*****************************************************************************/
/**
*
* This function sets up the generator (Polarity, H/V values and horizontal
* offsets) by reading the configuration from a video timing structure.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	TimingPtr is a pointer to a Video Timing Structure to be read.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_SetGeneratorTiming(XL_Vtc *InstancePtr, XL_Vtc_Timing * TimingPtr)
{
	XL_Vtc_Polarity Polarity;
	XL_Vtc_Signal Signal;
	XL_Vtc_HoriOffsets Hoff;

	XL_Vtc_ConvTiming2Signal(InstancePtr, TimingPtr, &Signal, &Hoff,
				&Polarity);
	XL_Vtc_SetPolarity(InstancePtr, &Polarity);
	XL_Vtc_SetGenerator(InstancePtr, &Signal);
	XL_Vtc_SetGeneratorHoriOffset(InstancePtr, &Hoff);
}

/*****************************************************************************/
/**
*
* This function sets up the generator (Polarity, H/V values and horizontal
* offsets) by reading the configuration from a video mode short integer.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	Mode is a short integer predefined video mode.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_SetGeneratorVideoMode(XL_Vtc *InstancePtr, uint16_t Mode)
{
	XL_Vtc_Timing Timing;

	XL_Vtc_ConvVideoMode2Timing(InstancePtr, Mode, &Timing);

	XL_Vtc_SetGeneratorTiming(InstancePtr, &Timing);

}

/*****************************************************************************/
/**
*
* This function gets the video timing structure settings currently used by
* generator in the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	TimingPtr is a pointer to a Video Timing Structure to be set.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_GetGeneratorTiming(XL_Vtc *InstancePtr, XL_Vtc_Timing *TimingPtr)
{
	XL_Vtc_Polarity Polarity;
	XL_Vtc_Signal Signal;
	XL_Vtc_HoriOffsets Hoff;

	Signal.OriginMode = 1;
	XL_Vtc_GetPolarity(InstancePtr, &Polarity);
	XL_Vtc_GetGeneratorHoriOffset(InstancePtr, &Hoff);
	XL_Vtc_GetGenerator(InstancePtr, &Signal);

	XL_Vtc_ConvSignal2Timing(InstancePtr, &Signal, &Hoff, &Polarity,
					TimingPtr);
}

/*****************************************************************************/
/**
*
* This function gets the video mode currently used by the generator
* in the VTC core. If the video mode is unknown or not recognized, then 0
* will be returned.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
*
* @return	VideoMode is the video mode of the VTC core.
*
* @note		Note.
*
******************************************************************************/
uint16_t XL_Vtc_GetGeneratorVideoMode(XL_Vtc *InstancePtr)
{
	uint16_t mode;
	XL_Vtc_Timing Timing;


	XL_Vtc_GetGeneratorTiming(InstancePtr, &Timing);
	mode = XL_Vtc_ConvTiming2VideoMode(InstancePtr, &Timing);

	return mode;
}

/*****************************************************************************/
/**
*
* This function gets the video timing structure settings currently reported by
* the detector in the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
* @param	TimingPtr is a pointer to a Video Timing structure to be set.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void XL_Vtc_GetDetectorTiming(XL_Vtc *InstancePtr, XL_Vtc_Timing *TimingPtr)
{
	XL_Vtc_Polarity Polarity;
	XL_Vtc_Signal Signal;
	XL_Vtc_HoriOffsets Hoff;

	Signal.OriginMode = 1;
	XL_Vtc_GetDetector(InstancePtr, &Signal);
	XL_Vtc_GetDetectorPolarity(InstancePtr, &Polarity);
	XL_Vtc_GetDetectorHoriOffset(InstancePtr, &Hoff);

	XL_Vtc_ConvSignal2Timing(InstancePtr, &Signal, &Hoff, &Polarity,
					TimingPtr);
}

/*****************************************************************************/
/**
*
* This function gets the video mode currently reported by the detector
* in the VTC core. If the video mode is unknown or not recognized, then 0
* will be returned.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
*
* @return 	VideoMode is the video mode of the VTC core.
*
* @note		None.
*
******************************************************************************/
uint16_t XL_Vtc_GetDetectorVideoMode(XL_Vtc *InstancePtr)
{
	uint16_t mode;
	XL_Vtc_Timing Timing;

	XL_Vtc_GetDetectorTiming(InstancePtr, &Timing);
	mode = XL_Vtc_ConvTiming2VideoMode(InstancePtr, &Timing);

	return mode;
}

/*****************************************************************************/
/**
 *
 * This function sets the vertical front porch stretch mechanism in VTC core
 * to support Adaptive-Sync feature. VTC core supports two types of stretch
 * mechanisms. 1.Fixed stretch mode 2. Auto adjust mode
 *
 * @param InstancePtr is a pointer to the VTC instance
 * @param mode is the type of mode that is being set.
 *
 * @return
 *		None.
 *
 * @note	Modification of this register is fine irrespective of whether
 * 		VTC has started or not.
 *
 ******************************************************************************/
void XL_Vtc_SetAdaptiveSyncMode(XL_Vtc *InstancePtr, XL_Vtc_AdaptiveSyncMode Mode)
{
	uint32_t RegValue;

	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
				XVTC_ADAPTIVE_CTL_OFFSET);
	/* Enable Adaptive-Sync and set mode */
	if (Mode > XVTC_FIXED_MODE)
		RegValue |= XVTC_ADAPTIVE_MODE_MASK;
	else
		RegValue &= ~XVTC_ADAPTIVE_MODE_MASK;
	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress, XVTC_ADAPTIVE_CTL_OFFSET,
		      RegValue | XVTC_ADAPTIVE_ENABLE_MASK);
}

/*****************************************************************************/
/**
 *
 * This function disable Adaptive-Sync in VTC core.
 *
 * @param InstancePtr is a pointer to the VTC instance to be worked on.
 *
 * @return
 *		None.
 *
 * @note	None.
 *
 ******************************************************************************/
void XL_Vtc_DisableAdaptiveSync(XL_Vtc *InstancePtr)
{
	uint32_t RegValue;

	RegValue = XL_Vtc_ReadReg(InstancePtr->Config.BaseAddress,
				XVTC_ADAPTIVE_CTL_OFFSET);
	RegValue &= (~XVTC_ADAPTIVE_ENABLE_MASK);
	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
		      XVTC_ADAPTIVE_CTL_OFFSET, RegValue);
}

/*****************************************************************************/
/**
 *
 * This function sets vertical front porch stretch limit.
 *
 * @param InstancePtr is a pointer to the VTC instance to be worked on.
 * @param StretchLimit is the  vertical front porch stretch limit to be set.
 *
 * @return
 *		None.
 *
 * @note	None.
 *
 ******************************************************************************/
void XL_Vtc_SetVfpStretchLimit(XL_Vtc *InstancePtr, uint32_t StretchLimit)
{
	XL_Vtc_WriteReg(InstancePtr->Config.BaseAddress,
		      XVTC_VFP_STRETCH_OFFSET, StretchLimit);
}

/*****************************************************************************/
/**
*
* This routine is a stub for the asynchronous callbacks. The stub is here in
* case the upper layer forgot to set the handlers. On initialization, all
* handlers except error handler are set to this callback. It is considered an
* error for this handler to be invoked.
*
* @param	CallBackRef is a callback reference passed in by the upper
*		layer when setting the callback functions, and passed back
*		to the upper layer when the callback is invoked.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void StubCallBack(void *CallBackRef, uint32_t Mask)
{
	(void)CallBackRef;
	(void)Mask;
}

/*****************************************************************************/
/**
*
* This routine is a stub for the asynchronous error interrupt callback. The
* stub is here in case the upper layer forgot to set the handler. On
* initialization, Error interrupt handler is set to this callback. It is
* considered an error for this handler to be invoked.
*
* @param	CallBackRef is a callback reference passed in by the upper
*		layer when setting the callback functions, and passed back to
*		the upper layer when the callback is invoked.
* @param 	ErrorMask is a bit mask indicating the cause of the error. Its
*		value equals 'OR'ing one or more XVTC_IXR_*_MASK values defined
*		in xvtc_hw.h.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void StubErrCallBack(void *CallBackRef, uint32_t ErrorMask)
{
	(void)CallBackRef;
	(void)ErrorMask;
}
/** @} */
