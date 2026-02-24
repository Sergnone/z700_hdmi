/******************************************************************************
* Copyright (C) 2008 - 2020 Xilinx, Inc.  All rights reserved.
* Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/


#ifndef XL_VTC_H_
#define XL_VTC_H_

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/

//#include "xvtc_hw.h"
//#include "xil_assert.h"
//#include "xstatus.h"

#include "xl_vtc_hw.h"

/************************** Constant Definitions *****************************/

/** @name Interrupt Types for setting up Callbacks
* @{
*/
#define XVTC_HANDLER_FRAMESYNC	1	/**< A frame sync event
					  * interrupt type */
#define XVTC_HANDLER_LOCK	2	/**< A signal lock event
					  *  interrupt type */
#define XVTC_HANDLER_DETECTOR	3	/**< A detector event
					  *  interrupt type */
#define XVTC_HANDLER_GENERATOR	4	/**< A generator event
					  *  interrupt type */
#define XVTC_HANDLER_ERROR	5	/**< An error condition
					  *  interrupt type */
/*@}*/

/** @name Options for enabling VTC modules
 *  @{
 */
#define XVTC_EN_GENERATOR	1	/**< To enable generator */
#define XVTC_EN_DETECTOR	2	/**< To enable detector */
/*@}*/

/** @name Address gap between two register next to each other
 *  @{
 */
#define XVTC_REG_ADDRGAP	4	/**< Register address gap */


#define XVTC_VMODE_720P		1	/**< Video mode 720P */
#define XVTC_VMODE_1080P	2	/**< Video mode 1080P */
#define XVTC_VMODE_480P		3	/**< Video mode 480P */
#define XVTC_VMODE_576P		4	/**< Video mode 576P */
#define XVTC_VMODE_VGA		5	/**< Video mode VGA */
#define XVTC_VMODE_SVGA		6	/**< Video mode SVGA */
#define XVTC_VMODE_XGA		7	/**< Video mode XGA */
#define XVTC_VMODE_SXGA		8	/**< Video mode SXGA */
#define XVTC_VMODE_WXGAPLUS	9	/**< Video mode WXGAPlus */
#define XVTC_VMODE_WSXGAPLUS	10	/**< Video mode WSXGAPlus */
#define XVTC_VMODE_1080I	100	/**< Video mode 1080I */
#define XVTC_VMODE_NTSC		101	/**< Video mode NTSC */
#define XVTC_VMODE_PAL		102	/**< Video mode PAL */
/*@}*/

/**************************** Type Definitions *******************************/

/**
 * This typedef contains configuration information for a VTC core.
 * Each VTC device should have a configuration structure associated
 */
typedef struct {
#ifndef SDT
	uint16_t DeviceId;		/**< DeviceId is the unique ID of the VTC core */
#else
	char *Name;
#endif
	UINTPTR BaseAddress;	/**< BaseAddress is the physical base address
				  *  of the core's registers */
#ifdef SDT
    uint16_t IntrId; 		    /**< Interrupt ID */
    UINTPTR IntrParent; 	/**< Bit[0] Interrupt parent type Bit[64/32:1] Parent base address */
#endif
} XL_Vtc_Config;

/**
 * This typedef contains Polarity configuration information for a VTC core.
 */
typedef struct {
	uint8_t ActiveChromaPol;	/**< Active Chroma Output Polarity */
	uint8_t ActiveVideoPol;	/**< Active Video Output Polarity */
	uint8_t FieldIdPol;		/**< Field ID Output Polarity */
	uint8_t VBlankPol;		/**< Vertical Blank Output Polarity */
	uint8_t VSyncPol;		/**< Vertical Sync Output Polarity */
	uint8_t HBlankPol;		/**< Horizontal Blank Output
				  *  Polarity */
	uint8_t HSyncPol;		/**< Horizontal Sync Output Polarity */
} XL_Vtc_Polarity;

/**
 * This typedef contains Source Selection configuration information for a
 * VTC core.
 */
typedef struct {
	uint8_t FieldIdPolSrc;	/**< Field ID Output Polarity Source */
	uint8_t ActiveChromaPolSrc;	/**< Active Chroma Output Polarity Source */
	uint8_t ActiveVideoPolSrc;	/**< Active Video Output Polarity Source */
	uint8_t HSyncPolSrc;		/**< Horizontal Sync Output Polarity Source */
	uint8_t VSyncPolSrc;		/**< Vertical Sync Output Polarity Source */
	uint8_t HBlankPolSrc;	/**< Horizontal Blank Output Polarity Source */
	uint8_t VBlankPolSrc;	/**< Vertical Blank Output Polarity Source */

	uint8_t VChromaSrc;		/**< Start of Active Chroma Register
				  *  Source Select */
	uint8_t VActiveSrc;		/**< Vertical Active Video Start Register
				  *  Source Select */
	uint8_t VBackPorchSrc;	/**< Vertical Back Porch Start Register
				  *  Source Select */
	uint8_t VSyncSrc;		/**< Vertical Sync Start Register Source
				  *  Select */
	uint8_t VFrontPorchSrc;	/**< Vertical Front Porch Start Register Source
				  *  Select */
	uint8_t VTotalSrc;		/**< Vertical Total Register Source Select */
	uint8_t HActiveSrc;		/**< Horizontal Active Video Start Register
				  *  Source Select */
	uint8_t HBackPorchSrc;	/**< Horizontal Back Porch Start Register
				  *  Source Select */
	uint8_t HSyncSrc;		/**< Horizontal Sync Start Register
				  *  Source Select */
	uint8_t HFrontPorchSrc;	/**< Horizontal Front Porch Start Register
				  *  Source Select */
	uint8_t HTotalSrc;		/**< Horizontal Total Register Source Select */
	uint8_t InterlacedMode;	/**< Interelaced mode */

} XL_Vtc_SourceSelect;

/**
 * This typedef contains the VTC signal configuration used by the
 * Generator/Detector modules in a VTC device.
 */
typedef struct {
	uint16_t OriginMode;		/**< Origin Mode */
	uint16_t HTotal;		/**< Horizontal total clock cycles per Line */
	uint16_t HFrontPorchStart;	/**< Horizontal Front Porch Start Cycle
				  *  Count */
	uint16_t HSyncStart;		/**< Horizontal Sync Start Cycle Count */
	uint16_t HBackPorchStart;	/**< Horizontal Back Porch Start Cycle Count */
	uint16_t HActiveStart;	/**< Horizontal Active Video Start Cycle
				  *  Count */

	uint16_t V0Total;		/**< Total lines per Frame (Field 0) */
	uint16_t V0FrontPorchStart;	/**< Vertical Front Porch Start Line
				  *  Count * (Field 0) */
	uint16_t V0SyncStart;	/**< Vertical Sync Start Line Count
				  *  (Field 0) */
	uint16_t V0BackPorchStart;	/**< Vertical Back Porch Start Line
				  *  Count *  (Field 0) */
	uint16_t V0ActiveStart;	/**< Vertical Active Video Start Line
				  *  Count *  (Field 0) */
	uint16_t V0ChromaStart;	/**< Active Chroma Start Line Count
				  *  (Field 0) */

	uint16_t V1Total;		/**< Total lines per Frame (Field 1) */
	uint16_t V1FrontPorchStart;	/**< Vertical Front Porch Start Line
				  *  Count *  (Field 1) */
	uint16_t V1SyncStart;	/**< Vertical Sync Start Line Count
				  *  (Field 1) */
	uint16_t V1BackPorchStart;	/**< Vertical Back Porch Start Line Count *
				  *  (Field 1) */
	uint16_t V1ActiveStart;	/**< Vertical Active Video Start Line
				  *  Count (Field 1) */
	uint16_t V1ChromaStart;	/**< Active Chroma Start Line Count
				  *  (Field 1) */
	uint8_t Interlaced;		/**< Interlaced / Progressive video */
} XL_Vtc_Signal;

/**
 * This typedef contains Detector/Generator VBlank/VSync Horizontal Offset
 * configuration information for a VTC device.
 */
typedef struct {
	uint16_t V0BlankHoriStart;	/**< Vertical Blank Hori Offset Start
				  *  (field 0) */
	uint16_t V0BlankHoriEnd;	/**< Vertical Blank Hori Offset End
				  *  (field 0) */
	uint16_t V0SyncHoriStart;	/**< Vertical Sync  Hori Offset Start
				  *  (field 0) */
	uint16_t V0SyncHoriEnd;	/**< Vertical Sync  Hori Offset End
				  *  (field 0) */
	uint16_t V1BlankHoriStart;	/**< Vertical Blank Hori Offset Start
				  *  (field 1) */
	uint16_t V1BlankHoriEnd;	/**< Vertical Blank Hori Offset End
				  *  (field 1) */
	uint16_t V1SyncHoriStart;	/**< Vertical Sync  Hori Offset Start
				  * (field 1) */
	uint16_t V1SyncHoriEnd;	/**< Vertical Sync  Hori Offset End
				  *  (field 1) */
} XL_Vtc_HoriOffsets;

/**
* This typedef contains Timing (typically in Display Timing) format
* configuration information for the VTC core.
*/
typedef struct {
	/* Horizontal Timing */
	uint16_t HActiveVideo;	/**< Horizontal Active Video Size */
	uint16_t HFrontPorch;	/**< Horizontal Front Porch Size */
	uint16_t HSyncWidth;		/**< Horizontal Sync Width */
	uint16_t HBackPorch;		/**< Horizontal Back Porch Size */
	uint16_t HSyncPolarity;	/**< Horizontal Sync Polarity */

	/* Vertical Timing */
	uint16_t VActiveVideo;	/**< Vertical Active Video Size */
	uint16_t V0FrontPorch;	/**< Vertical Front Porch Size */
	uint16_t V0SyncWidth;	/**< Vertical Sync Width */
	uint16_t V0BackPorch;	/**< Horizontal Back Porch Size */

	uint16_t V1FrontPorch;	/**< Vertical Front Porch Size */
	uint16_t V1SyncWidth;	/**< Vertical Sync Width */
	uint16_t V1BackPorch;	/**< Vertical Back Porch Size */

	uint16_t VSyncPolarity;	/**< Vertical Sync Polarity */

	uint8_t Interlaced;		/**< Interlaced / Progressive video */
} XL_Vtc_Timing;

/**
*
* Callback type for all interrupts except error interrupt.
*
* @param	CallBackRef is a callback reference passed in by the upper
*		layer when setting the callback functions, and passed back to
*		the upper layer when the callback is invoked.
* @param	Mask is a bit mask indicating the cause of the event. For
*		current core version, this parameter is "OR" of 0 or more
*		XVTC_IXR_*_MASK constants defined in xvtc_hw.h.
*
* @return	None.
*
* @note		None.
*
 *****************************************************************************/
typedef void (*XL_Vtc_CallBack)(void *CallBackRef, uint32_t Mask);

/**
*
* Callback type for Error interrupt.
*
* @param	CallBackRef is a callback reference passed in by the upper
*		layer when setting the callback functions, and passed back to
*		the upper layer when the callback is invoked.
* @param	ErrorMask is a bit mask indicating the cause of the error. For
*		current core version, this parameter always have value 0 and
*		could be ignored.
*
* @return	None.
*
* @note		None.
*
*****************************************************************************/
typedef void (*XL_Vtc_ErrorCallBack)(void *CallBackRef, uint32_t ErrorMask);

/**
 * The XL_Vtc driver instance data. An instance must be allocated for each
 * VTC core in use.
 */
typedef struct {
	XL_Vtc_Config Config;	/**< Hardware Configuration */
	uint32_t IsReady;		/**< Core and the driver instance are
				  *  initialized */

	/* Interrupt callbacks*/
	XL_Vtc_CallBack FrameSyncCallBack;	/**< Callback for Frame Sync
						  *  interrupt */
	void *FrameSyncRef;		/**< To be passed to the Frame Sync
					  *  interrupt callback */

	XL_Vtc_CallBack LockCallBack;	/**< Callback for Signal Lock
					  *  interrupt */
	void *LockRef;			/**< To be passed to the Signal Lock
					  *  interrupt callback */

	XL_Vtc_CallBack DetectorCallBack;	/**< Callback for Detector interrupt */
	void *DetectorRef;		/**< To be passed to the Detector
					  *  interrupt callback */

	XL_Vtc_CallBack GeneratorCallBack;	/**< Callback for Generator
						  *  interrupt */
	void *GeneratorRef;		/**< To be passed to the Generator
					  *  interrupt callback */

	XL_Vtc_ErrorCallBack ErrCallBack;	/**< Callback for Error interrupt */
	void *ErrRef;			/**< To be passed to the Error
					  *  interrupt callback */
} XL_Vtc;

/***************** Macros (Inline Functions) Definitions *********************/

/*****************************************************************************/
/**
*
* This function macro resets the VTC core.
*
* @param	InstancePtr is a pointer to the VTC instance to be
*		worked on.
*
* @return	None.
*
* @note		C-style signature:
*		void XL_Vtc_Reset(XL_Vtc *InstancePtr)
*
******************************************************************************/
#define XL_Vtc_Reset(InstancePtr) \
	XL_Vtc_WriteReg((InstancePtr)->Config.BaseAddress, (XVTC_CTL_OFFSET), \
			(XVTC_CTL_RESET_MASK))

/*****************************************************************************/
/**
*
* This function macro resets the VTC core after the next input frame is
* complete.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
*
* @return	None.
*
* @note		C-style signature:
*		void XL_Vtc_SyncReset(XL_Vtc *InstancePtr)
*
******************************************************************************/
#define XL_Vtc_SyncReset(InstancePtr) \
	XL_Vtc_WriteReg((InstancePtr)->Config.BaseAddress, (XVTC_CTL_OFFSET), \
		(XVTC_CTL_SRST_MASK))

/*****************************************************************************/
/**
*
* This function macro enables synchronization of the Generator with the
* Detector on the given VTC core.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
*
* @return 	None.
*
* @note		C-style signature:
*		void XL_Vtc_EnableSync(XL_Vtc *InstancePtr)
*
******************************************************************************/
#define XL_Vtc_EnableSync(InstancePtr) \
	XL_Vtc_WriteReg((InstancePtr)->Config.BaseAddress, (XVTC_CTL_OFFSET), \
		XL_Vtc_ReadReg((InstancePtr)->Config.BaseAddress, \
			(XVTC_CTL_OFFSET)) | (XVTC_CTL_SE_MASK))

/*****************************************************************************/
/**
*
* This function macro enables updating timing registers at the end of each
* Generator frame.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
*
* @return	None.
*
* @note		C-style signature:
*		void XL_Vtc_RegUpdateEnable(XL_Vtc *InstancePtr)
*
******************************************************************************/
#define XL_Vtc_RegUpdateEnable(InstancePtr) \
	XL_Vtc_WriteReg((InstancePtr)->Config.BaseAddress, (XVTC_CTL_OFFSET), \
		XL_Vtc_ReadReg((InstancePtr)->Config.BaseAddress, \
			(XVTC_CTL_OFFSET)) | (XVTC_CTL_RU_MASK))

/*****************************************************************************/
/**
*
* This function macro disables updating timing registers at the end of each
* Generator frame.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
*
* @return	None.
*
* @note		C-style signature:
*		void XL_Vtc_RegUpdateDisable(XL_Vtc *InstancePtr)
*
******************************************************************************/
#define XL_Vtc_RegUpdateDisable(InstancePtr) \
	XL_Vtc_WriteReg((InstancePtr)->Config.BaseAddress, (XVTC_CTL_OFFSET), \
		XL_Vtc_ReadReg((InstancePtr)->Config.BaseAddress, \
			(XVTC_CTL_OFFSET)) & (~(XVTC_CTL_RU_MASK)))

/*****************************************************************************/
/**
*
* This function macro disables synchronization of the Generator with the
* Detector on the given VTC core.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
*
* @return	None.
*
* @note		C-style signature:
*		void XL_Vtc_DisableSync(XL_Vtc *InstancePtr)
*
******************************************************************************/
#define XL_Vtc_DisableSync(InstancePtr) \
	XL_Vtc_WriteReg((InstancePtr)->Config.BaseAddress, (XVTC_CTL_OFFSET), \
		(XL_Vtc_ReadReg((InstancePtr)->Config.BaseAddress, \
			(XVTC_CTL_OFFSET)) & ~(XVTC_CTL_SE_MASK)))

/*****************************************************************************/
/**
*
* This function macro gets the status of the Detector in the VTC core.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
*
* @return	The Detector status. Use XVTC_DS_* in xvtc_hw.h to interpret
*		the returned value.
*
* @note		C-style signature:
*		uint32_t XL_Vtc_GetDetectionStatus(XL_Vtc *InstancePtr)
*
******************************************************************************/
#define XL_Vtc_GetDetectionStatus(InstancePtr) \
	XL_Vtc_ReadReg((InstancePtr)->Config.BaseAddress, (XVTC_DTSTAT_OFFSET))

/*****************************************************************************/
/**
*
* This function macro enables individual interrupts of the VTC core by
* updating the IRQ_ENABLE register.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
*
* @param	IntrType is the bit-mask of the interrupts to be enabled.
*		Bit positions of 1 will be enabled. Bit positions of 0 will
*		keep the previous setting. This mask is formed by OR'ing
*		XVTC_IXR_*_MASK bits defined in xvtc_hw.h.
*
* @return	None.
*
* @note		The existing enabled interrupt(s) will remain enabled.
*		C-style signature:
*		void XL_Vtc_IntrEnable(XL_Vtc *InstancePtr, uint32_t IntrType)
*
******************************************************************************/
#define XL_Vtc_IntrEnable(InstancePtr, IntrType) \
	XL_Vtc_WriteReg((InstancePtr)->Config.BaseAddress, (XVTC_IER_OFFSET), \
		(((IntrType) & (XVTC_IXR_ALLINTR_MASK)) | \
			(XL_Vtc_ReadReg((InstancePtr)->Config.BaseAddress, \
				(XVTC_IER_OFFSET)))))

/*****************************************************************************/
/**
*
* This function macro disables individual interrupts of the VTC core by
* updating the IRQ_ENABLE register.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
*
* @param	IntrType is the bit-mask of the interrupts to be disabled.
*		Bit positions of 1 will be disabled. Bit positions of 0 will
*		keep the previous setting. This mask is formed by OR'ing
*		XVTC_IXR_*_MASK bits defined in xvtc_hw.h.
*
* @return	None.
*
* @note		Any other interrupt not covered by parameter IntrType,
*		if enabled before this macro is called, will remain enabled.
*		C-style signature:
*		void XL_Vtc_IntrDisable(XL_Vtc *InstancePtr, uint32_t IntrType)
*
******************************************************************************/
#define XL_Vtc_IntrDisable(InstancePtr, IntrType) \
	XL_Vtc_WriteReg((InstancePtr)->Config.BaseAddress, (XVTC_IER_OFFSET), \
		XL_Vtc_ReadReg((InstancePtr)->Config.BaseAddress, \
		(XVTC_IER_OFFSET)) & ((~(IntrType)) & (XVTC_IXR_ALLINTR_MASK)))

/*****************************************************************************/
/**
*
* This function macro returns the pending interrupt status of the VTC core
* read from the Status register.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
*
* @return	The status of pending interrupts of the VTC core.
* 		Use XVTC_IXR_*_MASK constants defined in xvtc_hw.h to
*		interpret this value.
*
* @note		C-style signature:
*		uint32_t XL_Vtc_StatusGePending(XL_Vtc *InstancePtr)
*
******************************************************************************/
#define XL_Vtc_StatusGetPending(InstancePtr) \
	XL_Vtc_ReadReg((InstancePtr)->Config.BaseAddress, (XVTC_ISR_OFFSET)) & \
		(XVTC_IXR_ALLINTR_MASK)

/*****************************************************************************/
/**
*
* This function macro returns the pending interrupts of the VTC core for
* the interrupts that have been enabled.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
*
* @return	The pending interrupts of the VTC core. Use
*		XVTC_IXR_*_MASK constants defined in xvtc_hw.h to
*		interpret this value. The returned value is a logical AND of
*		the contents of the STATUS Register and the IRQ_ENABLE
*		Register.
*
* @note		C-style signature:
*		uint32_t XL_Vtc_IntrGetPending(XL_Vtc *InstancePtr)
*
******************************************************************************/
#define XL_Vtc_IntrGetPending(InstancePtr) \
	(XL_Vtc_ReadReg((InstancePtr)->Config.BaseAddress, XVTC_IER_OFFSET) & \
	 XL_Vtc_ReadReg((InstancePtr)->Config.BaseAddress, XVTC_ISR_OFFSET) & \
	 XVTC_IXR_ALLINTR_MASK)

/*****************************************************************************/
/**
*
* This function macro clears/acknowledges pending interrupts of the VTC
* core in the Status register. Bit positions of 1 will be cleared.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
* @param	IntrType is the pending interrupts to clear/acknowledge.
*		Use OR'ing of XVTC_IXR_*_MASK constants defined in
*		xvtc_hw.h to create this parameter value.
*
* @return	None.
*
* @note		C-style signature:
*		void XL_Vtc_IntrClear(XL_Vtc *InstancePtr, uint32_t IntrType)
*
******************************************************************************/
#define XL_Vtc_IntrClear(InstancePtr, IntrType) \
	XL_Vtc_WriteReg((InstancePtr)->Config.BaseAddress, (XVTC_ISR_OFFSET), \
		((IntrType) & (XVTC_IXR_ALLINTR_MASK)))

/*****************************************************************************/
/**
*
* This function macro resets the VTC core after the next input frame is
* complete.
*
* @param	InstancePtr is a pointer to the VTC core instance to be
*		worked on.
*
* @return	None.
*
* @note		C-style signature:
*		void XL_Vtc_Sync_Reset(XL_Vtc *InstancePtr)
*
******************************************************************************/
#define XL_Vtc_Sync_Reset		XL_Vtc_SyncReset

/** @name Compatibility Macros
 *  @{
 */
#define XL_Vtc_RegUpdate		XL_Vtc_RegUpdateEnable
/*@}*/
/************************** Function Prototypes ******************************/

/* Initialization and control functions in xvtc.c */

/* Initialization */
int XL_Vtc_CfgInitialize(XL_Vtc *InstancePtr, XL_Vtc_Config *CfgPtr,
			UINTPTR EffectiveAddr);

/* Enabling and Disabling the VTC core */
void XL_Vtc_EnableGenerator(XL_Vtc *InstancePtr);
void XL_Vtc_EnableDetector(XL_Vtc *InstancePtr);
void XL_Vtc_Enable(XL_Vtc *InstancePtr);
void XL_Vtc_DisableGenerator(XL_Vtc *InstancePtr);
void XL_Vtc_DisableDetector(XL_Vtc *InstancePtr);
void XL_Vtc_Disable(XL_Vtc *InstancePtr);

/* Video Mode, Timing and Signal/HoriOffsets/Polarity Conversions */
void XL_Vtc_ConvVideoMode2Timing(XL_Vtc *InstancePtr, uint16_t Mode,
		XL_Vtc_Timing *TimingPtr);
void XL_Vtc_ConvTiming2Signal(XL_Vtc *InstancePtr, XL_Vtc_Timing *TimingPtr,
		XL_Vtc_Signal *SignalCfgPtr, XL_Vtc_HoriOffsets *HOffPtr,
		XL_Vtc_Polarity *PolarityPtr);
void XL_Vtc_ConvSignal2Timing(XL_Vtc *InstancePtr, XL_Vtc_Signal *SignalCfgPtr,
		XL_Vtc_HoriOffsets *HOffPtr, XL_Vtc_Polarity *PolarityPtr,
		XL_Vtc_Timing *TimingPtr);
uint16_t XL_Vtc_ConvTiming2VideoMode(XL_Vtc *InstancePtr, XL_Vtc_Timing *TimingPtr);

/* Timing/Video Mode Setting/Fetching */
void XL_Vtc_SetGeneratorTiming(XL_Vtc *InstancePtr, XL_Vtc_Timing * TimingPtr);
void XL_Vtc_SetGeneratorVideoMode(XL_Vtc *InstancePtr, uint16_t Mode);
void XL_Vtc_GetGeneratorTiming(XL_Vtc *InstancePtr, XL_Vtc_Timing *TimingPtr);
uint16_t  XL_Vtc_GetGeneratorVideoMode(XL_Vtc *InstancePtr);
void XL_Vtc_GetDetectorTiming(XL_Vtc *InstancePtr, XL_Vtc_Timing *TimingPtr);
uint16_t  XL_Vtc_GetDetectorVideoMode(XL_Vtc *InstancePtr);

/* Polarity setting */
void XL_Vtc_SetPolarity(XL_Vtc *InstancePtr, XL_Vtc_Polarity *PolarityPtr);
void XL_Vtc_GetPolarity(XL_Vtc *InstancePtr, XL_Vtc_Polarity *PolarityPtr);
void XL_Vtc_GetDetectorPolarity(XL_Vtc *InstancePtr, XL_Vtc_Polarity *PolarityPtr);

/* Source selection */
void XL_Vtc_SetSource(XL_Vtc *InstancePtr, XL_Vtc_SourceSelect *SourcePtr);
void XL_Vtc_GetSource(XL_Vtc *InstancePtr, XL_Vtc_SourceSelect *SourcePtr);

/* Skipping setting */
void XL_Vtc_SetSkipLine(XL_Vtc *InstancePtr, int GeneratorChromaSkip);
void XL_Vtc_GetSkipLine(XL_Vtc *InstancePtr, int *GeneratorChromaSkipPtr);
void XL_Vtc_SetSkipPixel(XL_Vtc *InstancePtr, int GeneratorChromaSkip);
void XL_Vtc_GetSkipPixel(XL_Vtc *InstancePtr, int *GeneratorChromaSkipPtr);

/* VTC generator/detector setting/fetching */
void XL_Vtc_SetGenerator(XL_Vtc *InstancePtr, XL_Vtc_Signal *SignalCfgPtr);
void XL_Vtc_GetGenerator(XL_Vtc *InstancePtr, XL_Vtc_Signal *SignalCfgPtr);
void XL_Vtc_GetDetector(XL_Vtc *InstancePtr, XL_Vtc_Signal *SignalCfgPtr);

/* Delay setting */
void XL_Vtc_SetDelay(XL_Vtc *InstancePtr, int VertDelay, int HoriDelay);
void XL_Vtc_GetDelay(XL_Vtc *InstancePtr, int *VertDelayPtr, int *HoriDelayPtr);

/* Frame Sync setting */
void XL_Vtc_SetFSync(XL_Vtc *InstancePtr, uint16_t FrameSyncIndex,
			   uint16_t VertStart, uint16_t HoriStart);
void XL_Vtc_GetFSync(XL_Vtc *InstancePtr, uint16_t FrameSyncIndex,
			   uint16_t *VertStartPtr, uint16_t *HoriStartPtr);

/* Horizontal Offset Setting */
void XL_Vtc_SetGeneratorHoriOffset(XL_Vtc *InstancePtr,
			   XL_Vtc_HoriOffsets *HoriOffset);
void XL_Vtc_GetGeneratorHoriOffset(XL_Vtc *InstancePtr,
			   XL_Vtc_HoriOffsets *HoriOffset);
void XL_Vtc_GetDetectorHoriOffset(XL_Vtc *InstancePtr,
			   XL_Vtc_HoriOffsets *HoriOffset);

/* Version function */
uint32_t XL_Vtc_GetVersion(XL_Vtc *InstancePtr);

/* Initialization functions in xvtc_sinit.c */
#ifndef SDT
XL_Vtc_Config *XL_Vtc_LookupConfig(uint16_t DeviceId);
#else
XL_Vtc_Config *XL_Vtc_LookupConfig(UINTPTR BaseAddress);
#endif

/*
 * Interrupt related function(s) in xvtc_intr.c
 */
void XL_Vtc_IntrHandler(void *InstancePtr);
int XL_Vtc_SetCallBack(XL_Vtc *InstancePtr, uint32_t IntrType,
			void *CallBackFunc, void *CallBackRef);

/* SelfTest related function in xvtc_selftest.c */
int XL_Vtc_SelfTest(XL_Vtc *InstancePtr);

/* Adaptive-Sync related functions */
void XL_Vtc_SetAdaptiveSyncMode(XL_Vtc *InstancePtr, XL_Vtc_AdaptiveSyncMode Mode);
void XL_Vtc_DisableAdaptiveSync(XL_Vtc *InstancePtr);
void XL_Vtc_SetVfpStretchLimit(XL_Vtc *InstancePtr, uint32_t StretchLimit);

/************************** Variable Declarations ****************************/


#ifdef __cplusplus
}
#endif

#endif /* end of protection macro */
/** @} */
