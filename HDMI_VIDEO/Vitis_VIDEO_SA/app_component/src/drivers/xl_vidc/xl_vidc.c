/*******************************************************************************
* Copyright (C) 2021 Xilinx, Inc.  All rights reserved.
* Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
*******************************************************************************/

/******************************************************************************/
/**
 *
 * @file xvidc.c
 * @addtogroup video_common Overview
 * @{
 *
 * Contains common utility functions that are typically used by video-related
 * drivers and applications.
 *
 * @note	None.
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who  Date     Changes
 * ----- ---- -------- -----------------------------------------------
 * 1.0   rc,  01/10/15 Initial release.
 *       als
 * 2.2   als  02/01/16 Functions with pointer arguments that don't modify
 *                     contents now const.
 *                     Added ability to insert a custom video timing table.
 *       yh            Added 3D support.
 * 3.0   aad  05/13/16 Added API to search for RB video modes.
 * 3.1   rco  07/26/16 Added extern definition for timing table array
 *                     Added video-in-memory color formats
 *                     Updated XL_VidC_RegisterCustomTimingModes API signature
 * 4.1   rco  11/23/16 Added new memory formats
 *                     Added new API to get video mode id that matches exactly
 *                     with provided timing information
 *                     Fix c++ warnings
 * 4.2	 jsr  07/22/17 Added new framerates and color formats to support SDI
 *                     Reordered YCBCR422 colorforamt and removed other formats
 *                     that are not needed for SDI which were added earlier.
 *       vyc  10/04/17 Added new streaming alpha formats and new memory formats
 * 4.3   eb   26/01/18 Added API XL_VidC_GetVideoModeIdExtensive
 *       jsr  02/22/18 Added XL_VidC_CSF_YCBCR_420 color space format
 *       vyc  04/04/18 Added BGR8 memory format
 * </pre>
 *
*******************************************************************************/

/******************************* Include Files ********************************/
#include "xl_status.h"
#include "xl_vidc.h"

/*************************** Variable Declarations ****************************/
extern const XL_VidC_VideoTimingMode XL_VidC_VideoTimingModes[XLVIDCVM_NUM_SUPPORTED];

const XL_VidC_VideoTimingMode *XL_VidC_CustomTimingModes = NULL;
int XL_VidC_NumCustomModes = 0;

/**************************** Function Prototypes *****************************/

static const XL_VidC_VideoTimingMode *XL_VidC_GetCustomVideoModeData(
		XL_VidC_VideoMode VmId);
static uint8_t XL_VidC_IsVtmRb(const char *VideoModeStr, uint8_t RbN);

/*************************** Function Definitions *****************************/

/******************************************************************************/
/**
 * This function registers a user-defined custom video mode timing table with
 * video_common. Functions which search the available video modes, or take VmId
 * as an input, will operate on or check the custom video mode timing table in
 * addition to the pre-defined video mode timing table (XL_VidC_VideoTimingModes).
 *
 * @param	CustomTable is a pointer to the user-defined custom vide mode
 *		timing table to register.
 * @param	NumElems is the number of video modes supported by CustomTable.
 *
 * @return
 *		- XST_SUCCESS if the custom table was successfully registered.
 *		- XST_FAILURE if an existing custom table is already present.
 *
 * @note	IDs in the custom table may not conflict with IDs reserved by
 *		the XL_VidC_VideoMode enum.
 *
*******************************************************************************/
uint32_t XL_VidC_RegisterCustomTimingModes(const XL_VidC_VideoTimingMode *CustomTable,
		                            uint16_t NumElems)
{
	uint16_t Index;

	/* Fail if a custom table is currently already registered. */
	if (XL_VidC_CustomTimingModes) {
		return XST_FAILURE;
	}

	XL_VidC_CustomTimingModes = CustomTable;
	XL_VidC_NumCustomModes    = NumElems;

	return XST_SUCCESS;
}

/******************************************************************************/
/**
 * This function unregisters the user-defined custom video mode timing table
 * previously registered by XL_VidC_RegisterCustomTimingModes().
 *
 * @return	None.
 *
 * @note	None.
 *
*******************************************************************************/
void XL_VidC_UnregisterCustomTimingModes(void)
{
	XL_VidC_CustomTimingModes = NULL;
	XL_VidC_NumCustomModes    = 0;
}

/******************************************************************************/
/**
 * This function calculates pixel clock based on the inputs.
 *
 * @param	HTotal specifies horizontal total.
 * @param	VTotal specifies vertical total.
 * @param	FrameRate specifies rate at which frames are generated.
 *
 * @return	Pixel clock in Hz.
 *
 * @note	None.
 *
*******************************************************************************/
uint64_t XL_VidC_GetPixelClockHzByHVFr(uint32_t HTotal, uint32_t VTotal, uint8_t FrameRate)
{
	return (HTotal * VTotal * FrameRate);
}

/******************************************************************************/
/**
 * This function calculates pixel clock from video mode.
 *
 * @param	VmId specifies the resolution id.
 *
 * @return	Pixel clock in Hz.
 *
 * @note	None.
 *
*******************************************************************************/
uint64_t XL_VidC_GetPixelClockHzByVmId(XL_VidC_VideoMode VmId)
{
	uint64_t ClkHz;
	const XL_VidC_VideoTimingMode *VmPtr;

	VmPtr = XL_VidC_GetVideoModeData(VmId);
	if (!VmPtr) {
		return 0;
	}

	if (XL_VidC_IsInterlaced(VmId)) {
		/* For interlaced mode, use both frame 0 and frame 1 vertical
		 * totals. */
		ClkHz = VmPtr->Timing.F0PVTotal + VmPtr->Timing.F1VTotal;

		/* Multiply the number of pixels by the frame rate of each
		 * individual frame (half of the total frame rate). */
		ClkHz *= VmPtr->FrameRate / 2;
	}
	else {
		/* For progressive mode, use only frame 0 vertical total. */
		ClkHz = VmPtr->Timing.F0PVTotal;

		/* Multiply the number of pixels by the frame rate. */
		ClkHz *= VmPtr->FrameRate;
	}

	/* Multiply the vertical total by the horizontal total for number of
	 * pixels. */
	ClkHz *= VmPtr->Timing.HTotal;

	return ClkHz;
}

/******************************************************************************/
/**
 * This function checks if the input video mode is interlaced/progressive based
 * on its ID from the video timings table.
 *
 * @param	VmId specifies the resolution ID from the video timings table.
 *
 * @return	Video format.
 *		- XL_VidC_VF_PROGRESSIVE
 *		- XL_VidC_VF_INTERLACED
 *
 * @note	None.
 *
*******************************************************************************/
XL_VidC_VideoFormat XL_VidC_GetVideoFormat(XL_VidC_VideoMode VmId)
{
	const XL_VidC_VideoTimingMode *VmPtr;

	VmPtr = XL_VidC_GetVideoModeData(VmId);
	if (!VmPtr) {
		return XLVIDCVF_UNKNOWN;
	}

	if (VmPtr->Timing.F1VTotal == 0) {
		return (XLVIDCVF_PROGRESSIVE);
	}

	return (XLVIDCVF_INTERLACED);
}

/******************************************************************************/
/**
 * This function checks if the input video mode is interlaced based on its ID
 * from the video timings table.
 *
 * @param	VmId specifies the resolution ID from the video timings table.
 *
 * @return
 *		- 1 if the video timing with the supplied table ID is
 *		  interlaced.
 *		- 0 if the video timing is progressive.
 *
 * @note	None.
 *
*******************************************************************************/
uint8_t XL_VidC_IsInterlaced(XL_VidC_VideoMode VmId)
{
	if (XL_VidC_GetVideoFormat(VmId) == XLVIDCVF_INTERLACED) {
		return 1;
	}

	return 0;
}

/******************************************************************************/
/**
 * This function returns the Video Mode ID that matches the detected input
 * timing, frame rate and I/P flag
 *
 * @param	Timing is the pointer to timing parameters to match
 * @param	FrameRate specifies refresh rate in HZ
 * @param	IsInterlaced is flag.
 *		      - 0 = Progressive
 *			  - 1 = Interlaced.
 *
 * @return	Id of a supported video mode.
 *
 * @note	This is an extension of XL_VidC_GetVideoModeId API to include
 *          blanking information in match process. No attempt is made to
 *          search for reduced blanking entries, if any.
 *
*******************************************************************************/
XL_VidC_VideoMode XL_VidC_GetVideoModeIdWBlanking(const XL_VidC_VideoTiming *Timing,
		uint32_t FrameRate, uint8_t IsInterlaced)
{
	XL_VidC_VideoMode VmId;
	XL_VidC_VideoTiming const *StdTiming = NULL;

	/* First search for ID with matching Width & Height */
	VmId = XL_VidC_GetVideoModeId(Timing->HActive, Timing->VActive, FrameRate,
			IsInterlaced);

	if (VmId == XLVIDCVM_NOT_SUPPORTED) {
		return(VmId);
	} else {

		/* Get standard timing info from default timing table */
		StdTiming = XL_VidC_GetTimingInfo(VmId);
		if (!StdTiming) {
			return(XLVIDCVM_NOT_SUPPORTED);
		}

		/* Match against detected timing parameters */
		if ((Timing->HActive        == StdTiming->HActive) &&
				(Timing->VActive        == StdTiming->VActive) &&
				(Timing->HTotal         == StdTiming->HTotal) &&
				(Timing->F0PVTotal      == StdTiming->F0PVTotal) &&
				(Timing->HFrontPorch    == StdTiming->HFrontPorch) &&
				(Timing->HSyncWidth     == StdTiming->HSyncWidth) &&
				(Timing->HBackPorch     == StdTiming->HBackPorch) &&
				(Timing->F0PVFrontPorch == StdTiming->F0PVFrontPorch) &&
				(Timing->F0PVSyncWidth  == StdTiming->F0PVSyncWidth) &&
				(Timing->F0PVBackPorch  == StdTiming->F0PVBackPorch)) {
			return(VmId);
		} else {
			return(XLVIDCVM_NOT_SUPPORTED);
		}
	}
}

/******************************************************************************/
/**
 * This function returns the Video Mode ID that matches the detected input
 * width, height, frame rate and I/P flag
 *
 * @param	Width specifies the number pixels per scanline.
 * @param	Height specifies the number of scanline's.
 * @param	FrameRate specifies refresh rate in HZ
 * @param	IsInterlaced is flag.
 *		- 0 = Progressive
 *		- 1 = Interlaced.
 *
 * @return	Id of a supported video mode.
 *
 * @note	None.
 *
*******************************************************************************/
XL_VidC_VideoMode XL_VidC_GetVideoModeId(uint32_t Width, uint32_t Height, uint32_t FrameRate,
					uint8_t IsInterlaced)
{
	uint32_t Low;
	uint32_t High;
	uint32_t Mid;
	uint32_t HActive;
	uint32_t VActive;
	uint32_t Rate;
	uint32_t ResFound = (FALSE);
	XL_VidC_VideoMode Mode;
	uint16_t Index;

	/* First, attempt a linear search on the custom video timing table. */
	if(XL_VidC_CustomTimingModes) {
	  for (Index = 0; Index < XL_VidC_NumCustomModes; Index++) {
		HActive = XL_VidC_CustomTimingModes[Index].Timing.HActive;
		VActive = XL_VidC_CustomTimingModes[Index].Timing.VActive;
		Rate = XL_VidC_CustomTimingModes[Index].FrameRate;
		if ((Width  == HActive) &&
			(Height == VActive) &&
			(FrameRate == Rate)) {
			   return XL_VidC_CustomTimingModes[Index].VmId;
		}
	  }
	}

	if (IsInterlaced) {
		Low = (XLVIDCVM_INTL_START);
		High = (XLVIDCVM_INTL_END);
	}
	else {
		Low = (XLVIDCVM_PROG_START);
		High = (XLVIDCVM_PROG_END);
	}

	HActive = VActive = Rate = 0;

	/* Binary search finds item in sorted array.
	 * And returns index (zero based) of item
	 * If item is not found returns flag remains
	 * FALSE. Search key is "width or HActive"
	 */
	while (Low <= High) {
		Mid = (Low + High) / 2;
		HActive = XL_VidC_VideoTimingModes[Mid].Timing.HActive;
		if (Width == HActive) {
			ResFound = (TRUE);
			break;
		}
		else if (Width < HActive) {
			if (Mid == 0) {
				break;
			}
			else {
				High = Mid - 1;
			}
		}
		else {
			Low = Mid + 1;
		}
	}

	 /* HActive matched at middle */
	if (ResFound) {
		/* Rewind to start index of mode with matching width */
		while ((Mid > 0) &&
			(XL_VidC_VideoTimingModes[Mid - 1].Timing.HActive ==
								Width)) {
			--Mid;
		}

		ResFound = (FALSE);
		VActive = XL_VidC_VideoTimingModes[Mid].Timing.VActive;
		Rate = XL_VidC_VideoTimingModes[Mid].FrameRate;

		/* Now do a linear search for matching VActive and Frame
		 * Rate
		 */
		while (HActive == Width) {
			/* check current entry */
			if ((VActive == Height) && (Rate == FrameRate)) {
				ResFound = (TRUE);
				break;
			}
			/* Check next entry */
			else {
				Mid = Mid + 1;
				HActive =
				XL_VidC_VideoTimingModes[Mid].Timing.HActive;
				VActive =
				XL_VidC_VideoTimingModes[Mid].Timing.VActive;
				Rate = XL_VidC_VideoTimingModes[Mid].FrameRate;
			}
		}
		Mode =
		(ResFound) ? (XL_VidC_VideoMode)Mid : (XLVIDCVM_NOT_SUPPORTED);
	}
	else {
		Mode = (XLVIDCVM_NOT_SUPPORTED);
	}

	return (Mode);
}

/******************************************************************************/
/**
 * This function returns the Video Mode ID that matches the detected input
 * timing, frame rate and I/P flag
 *
 * @param	Timing is the pointer to timing parameters to match
 * @param	FrameRate specifies refresh rate in HZ
 * @param	IsInterlaced is flag.
 *		      - 0 = Progressive
 *			  - 1 = Interlaced.
 * @param	IsExtensive is flag.
 *		      - 0 = Basic matching of timing parameters
 *			  - 1 = Extensive matching of timing parameters
 *
 * @return	Id of a supported video mode.
 *
 * @note	This function attempts to search for reduced blanking entries, if
 *          any.
 *
*******************************************************************************/
XL_VidC_VideoMode XL_VidC_GetVideoModeIdExtensive(XL_VidC_VideoTiming *Timing,
											  uint32_t FrameRate,
											  uint8_t IsInterlaced,
											  uint8_t IsExtensive)
{
	uint32_t Low;
	uint32_t High;
	uint32_t Mid;
	uint32_t HActive;
	uint32_t VActive;
	uint32_t Rate;
	uint32_t ResFound = (FALSE);
	XL_VidC_VideoMode Mode;
	uint16_t Index;

	/* First, attempt a linear search on the custom video timing table. */
	if(XL_VidC_CustomTimingModes) {
	  for (Index = 0; Index < XL_VidC_NumCustomModes; Index++) {
		HActive = XL_VidC_CustomTimingModes[Index].Timing.HActive;
		VActive = XL_VidC_CustomTimingModes[Index].Timing.VActive;
		Rate = XL_VidC_CustomTimingModes[Index].FrameRate;
		if ((HActive == Timing->HActive) && (VActive == Timing->VActive) &&
				(Rate == FrameRate) && (IsExtensive == 0 || (
			XL_VidC_CustomTimingModes[Index].Timing.HTotal == Timing->HTotal &&
			XL_VidC_CustomTimingModes[Index].Timing.F0PVTotal ==
					Timing->F0PVTotal &&
			XL_VidC_CustomTimingModes[Index].Timing.HFrontPorch ==
					Timing->HFrontPorch &&
			XL_VidC_CustomTimingModes[Index].Timing.F0PVFrontPorch ==
					Timing->F0PVFrontPorch &&
			XL_VidC_CustomTimingModes[Index].Timing.HSyncWidth ==
					Timing->HSyncWidth &&
			XL_VidC_CustomTimingModes[Index].Timing.F0PVSyncWidth ==
					Timing->F0PVSyncWidth &&
			XL_VidC_CustomTimingModes[Index].Timing.VSyncPolarity ==
					Timing->VSyncPolarity))) {
				if (!IsInterlaced || IsExtensive == 0 || (
						XL_VidC_CustomTimingModes[Index].Timing.F1VTotal ==
						Timing->F1VTotal &&
						XL_VidC_CustomTimingModes[Index].Timing.F1VFrontPorch ==
								Timing->F1VFrontPorch &&
						XL_VidC_CustomTimingModes[Index].Timing.F1VSyncWidth ==
								Timing->F1VSyncWidth)) {
					return XL_VidC_CustomTimingModes[Index].VmId;
				}
		}
	  }
	}

	if (IsInterlaced) {
		Low = (XLVIDCVM_INTL_START);
		High = (XLVIDCVM_INTL_END);
	}
	else {
		Low = (XLVIDCVM_PROG_START);
		High = (XLVIDCVM_PROG_END);
	}

	HActive = VActive = Rate = 0;

	/* Binary search finds item in sorted array.
	 * And returns index (zero based) of item
	 * If item is not found returns flag remains
	 * FALSE. Search key is "Timing->HActive or HActive"
	 */
	while (Low <= High) {
		Mid = (Low + High) / 2;
		HActive = XL_VidC_VideoTimingModes[Mid].Timing.HActive;
		if (Timing->HActive == HActive) {
			ResFound = (TRUE);
			break;
		}
		else if (Timing->HActive < HActive) {
			if (Mid == 0) {
				break;
			}
			else {
				High = Mid - 1;
			}
		}
		else {
			Low = Mid + 1;
		}
	}

	 /* HActive matched at middle */
	if (ResFound) {
		/* Rewind to start index of mode with matching Timing->HActive */
		while ((Mid > 0) &&
			(XL_VidC_VideoTimingModes[Mid - 1].Timing.HActive ==
								Timing->HActive)) {
			--Mid;
		}

		ResFound = (FALSE);
		VActive = XL_VidC_VideoTimingModes[Mid].Timing.VActive;
		Rate = XL_VidC_VideoTimingModes[Mid].FrameRate;

		/* Now do a linear search for matching VActive and Frame
		 * Rate
		 */
		while (HActive == Timing->HActive) {
			/* check current entry */
			if ((VActive == Timing->VActive) && (Rate == FrameRate) &&
					(IsExtensive == 0 ||
					(XL_VidC_VideoTimingModes[Mid].Timing.HTotal ==
							Timing->HTotal &&
					XL_VidC_VideoTimingModes[Mid].Timing.F0PVTotal ==
							Timing->F0PVTotal &&
					XL_VidC_VideoTimingModes[Mid].Timing.HFrontPorch ==
							Timing->HFrontPorch &&
					XL_VidC_VideoTimingModes[Mid].Timing.F0PVFrontPorch ==
							Timing->F0PVFrontPorch &&
					XL_VidC_VideoTimingModes[Mid].Timing.HSyncWidth ==
							Timing->HSyncWidth &&
					XL_VidC_VideoTimingModes[Mid].Timing.F0PVSyncWidth ==
							Timing->F0PVSyncWidth &&
					XL_VidC_VideoTimingModes[Mid].Timing.VSyncPolarity ==
							Timing->VSyncPolarity))) {
				if (!IsInterlaced || IsExtensive == 0 || (
						XL_VidC_VideoTimingModes[Mid].Timing.F1VTotal ==
								Timing->F1VTotal &&
						XL_VidC_VideoTimingModes[Mid].Timing.F1VFrontPorch ==
								Timing->F1VFrontPorch &&
						XL_VidC_VideoTimingModes[Mid].Timing.F1VSyncWidth ==
								Timing->F1VSyncWidth)) {
					ResFound = (TRUE);
					break;
				} else {
					Mid = Mid + 1;
					HActive =
					XL_VidC_VideoTimingModes[Mid].Timing.HActive;
					VActive =
					XL_VidC_VideoTimingModes[Mid].Timing.VActive;
					Rate = XL_VidC_VideoTimingModes[Mid].FrameRate;
				}
			}
			/* Check next entry */
			else {
				Mid = Mid + 1;
				HActive =
				XL_VidC_VideoTimingModes[Mid].Timing.HActive;
				VActive =
				XL_VidC_VideoTimingModes[Mid].Timing.VActive;
				Rate = XL_VidC_VideoTimingModes[Mid].FrameRate;
			}
		}
		Mode =
		(ResFound) ? (XL_VidC_VideoMode)Mid : (XLVIDCVM_NOT_SUPPORTED);
	}
	else {
		Mode = (XLVIDCVM_NOT_SUPPORTED);
	}

	return (Mode);
}

/******************************************************************************/
/**
 * This function returns the video mode ID that matches the detected input
 * width, height, frame rate, interlaced or progressive, and reduced blanking.
 *
 * @param	Width specifies the number pixels per scanline.
 * @param	Height specifies the number of scanline's.
 * @param	FrameRate specifies refresh rate in HZ
 * @param	IsInterlaced specifies interlaced or progressive mode:
 *		- 0 = Progressive
 *		- 1 = Interlaced.
 * @param	RbN specifies the type of reduced blanking:
 *		- 0 = No reduced blanking
 *		- 1 = RB
 *		- 2 = RB2
 *
 * @return	ID of a supported video mode.
 *
 * @note	None.
 *
*******************************************************************************/
XL_VidC_VideoMode XL_VidC_GetVideoModeIdRb(uint32_t Width, uint32_t Height,
		uint32_t FrameRate, uint8_t IsInterlaced, uint8_t RbN)
{
	XL_VidC_VideoMode VmId;
	const XL_VidC_VideoTimingMode *VtmPtr;
	uint8_t Found = 0;

	VmId = XL_VidC_GetVideoModeId(Width, Height, FrameRate,
				IsInterlaced);

	VtmPtr = XL_VidC_GetVideoModeData(VmId);
	if (!VtmPtr) {
		return XLVIDCVM_NOT_SUPPORTED;
	}

	while (!Found) {
		VtmPtr = XL_VidC_GetVideoModeData(VmId);
		if ((Height != VtmPtr->Timing.VActive) ||
		    (Width != VtmPtr->Timing.HActive) ||
		    (FrameRate != VtmPtr->FrameRate) ||
		    (IsInterlaced && !XL_VidC_IsInterlaced(VmId))) {
			VmId = XLVIDCVM_NOT_SUPPORTED;
			break;
		}
		Found = XL_VidC_IsVtmRb(XL_VidC_GetVideoModeStr(VmId), RbN);
		if (Found) {
			break;
		}
		VmId = (XL_VidC_VideoMode)((int)VmId + 1);
	}

	return VmId;
}

/******************************************************************************/
/**
 * This function returns the pointer to video mode data at index provided.
 *
 * @param	VmId specifies the resolution id.
 *
 * @return	Pointer to XL_VidC_VideoTimingMode structure based on the given
 *		video mode.
 *
 * @note	None.
 *
*******************************************************************************/
const XL_VidC_VideoTimingMode *XL_VidC_GetVideoModeData(XL_VidC_VideoMode VmId)
{
	if (VmId < XLVIDCVM_NUM_SUPPORTED) {
		return &XL_VidC_VideoTimingModes[VmId];
	}

	return XL_VidC_GetCustomVideoModeData(VmId);
}

/******************************************************************************/
/**
 *
 * This function returns the resolution name for index specified.
 *
 * @param	VmId specifies the resolution id.
 *
 * @return	Pointer to a resolution name string.
 *
 * @note	None.
 *
*******************************************************************************/
const char *XL_VidC_GetVideoModeStr(XL_VidC_VideoMode VmId)
{
	const XL_VidC_VideoTimingMode *VmPtr;

	if (VmId == XLVIDCVM_CUSTOM) {
		return ("Custom video mode");
	}

	VmPtr = XL_VidC_GetVideoModeData(VmId);
	if (!VmPtr) {
		return ("Video mode not supported");
	}

	return VmPtr->Name;
}

/******************************************************************************/
/**
 * This function returns the frame rate name for index specified.
 *
 * @param	VmId specifies the resolution id.
 *
 * @return	Pointer to a frame rate name string.
 *
 * @note	None.
 *
*******************************************************************************/
const char *XL_VidC_GetFrameRateStr(XL_VidC_VideoMode VmId)
{
	const XL_VidC_VideoTimingMode *VmPtr;

	VmPtr = XL_VidC_GetVideoModeData(VmId);
	if (!VmPtr) {
		return ("Video mode not supported");
	}

	switch (VmPtr->FrameRate) {
		case (XLVIDCFR_24HZ):   return ("24Hz");
		case (XLVIDCFR_25HZ):   return ("25Hz");
		case (XLVIDCFR_30HZ):   return ("30Hz");
		case (XLVIDCFR_48HZ):   return ("48Hz");
		case (XLVIDCFR_50HZ):   return ("50Hz");
		case (XLVIDCFR_56HZ):   return ("56Hz");
		case (XLVIDCFR_60HZ):   return ("60Hz");
		case (XLVIDCFR_65HZ):   return ("65Hz");
		case (XLVIDCFR_67HZ):   return ("67Hz");
		case (XLVIDCFR_70HZ):   return ("70Hz");
		case (XLVIDCFR_72HZ):   return ("72Hz");
		case (XLVIDCFR_75HZ):   return ("75Hz");
		case (XLVIDCFR_85HZ):   return ("85Hz");
		case (XLVIDCFR_87HZ):   return ("87Hz");
		case (XLVIDCFR_88HZ):   return ("88Hz");
		case (XLVIDCFR_96HZ):   return ("96Hz");
		case (XLVIDCFR_100HZ):  return ("100Hz");
		case (XLVIDCFR_120HZ):  return ("120Hz");
		case (XLVIDCFR_144HZ):  return ("144Hz");
		case (XLVIDCFR_200HZ):  return ("200Hz");
		case (XLVIDCFR_240HZ):  return ("240Hz");

		default:
		     return ("Frame rate not supported");
	}
}

/******************************************************************************/
/**
 * This function returns a string representation of the enumerated type,
 * XL_VidC_3DFormat.
 *
 * @param	Format specifies the value to convert.
 *
 * @return	Pointer to the converted string.
 *
 * @note	None.
 *
*******************************************************************************/
const char *XL_VidC_Get3DFormatStr(XL_VidC_3DFormat Format)
{
	switch (Format) {
		case XLVIDC3D_FRAME_PACKING:
			return ("Frame Packing");

		case XLVIDC3D_FIELD_ALTERNATIVE:
			return ("Field Alternative");

		case XLVIDC3D_LINE_ALTERNATIVE:
			return ("Line Alternative");

		case XLVIDC3D_SIDE_BY_SIDE_FULL:
			return ("Side-by-Side(full)");

		case XLVIDC3D_TOP_AND_BOTTOM_HALF:
			return ("Top-and-Bottom(half)");

		case XLVIDC3D_SIDE_BY_SIDE_HALF:
			return ("Side-by-Side(half)");

		default:
			return ("Unknown");
	}
}

/******************************************************************************/
/**
 * This function returns the color format name for index specified.
 *
 * @param	ColorFormatId specifies the index of color format space.
 *
 * @return	Pointer to a color space name string.
 *
 * @note	None.
 *
*******************************************************************************/
const char *XL_VidC_GetColorFormatStr(XL_VidC_ColorFormat ColorFormatId)
{
	switch (ColorFormatId) {
		case XLVIDCCSF_RGB:            return ("RGB");
		case XLVIDCCSF_YCRCB_444:      return ("YUV_444");
		case XLVIDCCSF_YCRCB_422:      return ("YUV_422");
		case XLVIDCCSF_YCRCB_420:      return ("YUV_420");
		case XLVIDCCSF_YONLY:          return ("Y_ONLY");
		case XLVIDCCSF_RGBA:           return ("RGBA");
		case XLVIDCCSF_YCRCBA_444:     return ("YUVA_444");
		case XLVIDCCSF_MEM_RGBX8:      return ("RGBX8");
		case XLVIDCCSF_MEM_YUVX8:      return ("YUVX8");
		case XLVIDCCSF_MEM_YUYV8:      return ("YUYV8");
		case XLVIDCCSF_MEM_RGBA8:      return ("RGBA8");
		case XLVIDCCSF_MEM_YUVA8:      return ("YUVA8");
		case XLVIDCCSF_MEM_RGBX10:     return ("RGBX10");
		case XLVIDCCSF_MEM_YUVX10:     return ("YUVX10");
		case XLVIDCCSF_MEM_RGB565:     return ("RGB565");
		case XLVIDCCSF_MEM_Y_UV8:      return ("Y_UV8");
		case XLVIDCCSF_MEM_Y_UV8_420:  return ("Y_UV8_420");
		case XLVIDCCSF_MEM_RGB8:       return ("RGB8");
		case XLVIDCCSF_MEM_YUV8:       return ("YUV8");
		case XLVIDCCSF_MEM_Y_UV10:     return ("Y_UV10");
		case XLVIDCCSF_MEM_Y_UV10_420: return ("Y_UV10_420");
		case XLVIDCCSF_MEM_Y8:         return ("Y8");
		case XLVIDCCSF_MEM_Y10:        return ("Y10");
		case XLVIDCCSF_MEM_BGRA8:      return ("BGRA8");
		case XLVIDCCSF_MEM_BGRX8:      return ("BGRX8");
		case XLVIDCCSF_MEM_UYVY8:      return ("UYVY8");
		case XLVIDCCSF_MEM_BGR8:       return ("BGR8");
		case XLVIDCCSF_YCBCR_422:      return ("YCBCR_422");
		case XLVIDCCSF_YCBCR_420:      return ("YCBCR_420");
		case XLVIDCCSF_YCBCR_444:      return ("YCBCR_444");
		case XLVIDCCSF_MEM_RGBX12:     return ("RGBX12");
		case XLVIDCCSF_MEM_RGB16:      return ("RGB16");
		case XLVIDCCSF_MEM_YUVX12:     return ("YUVX12");
		case XLVIDCCSF_MEM_YUV16:      return ("YUV16");
		case XLVIDCCSF_MEM_Y_UV12:     return ("Y_UV12");
		case XLVIDCCSF_MEM_Y_UV16:     return ("Y_UV16");
		case XLVIDCCSF_MEM_Y_UV12_420: return ("Y_UV12_420");
		case XLVIDCCSF_MEM_Y_UV16_420: return ("Y_UV16_420");
		case XLVIDCCSF_MEM_Y12:        return ("Y12");
		case XLVIDCCSF_MEM_Y16:        return ("Y16");
		case XLVIDCCSF_MEM_R_G_B8:     return ("R_G_B8");
		case XLVIDCCSF_MEM_Y_U_V8_420: return ("Y_U_V8_420");
		case XLVIDCCSF_MEM_Y_U_V8:     return ("Y_U_V8");
		case XLVIDCCSF_MEM_Y_U_V10:     return ("Y_U_V10");
		case XLVIDCCSF_MEM_Y_U_V12:     return ("Y_U_V12");
		default:
			return ("Color space format not supported");
	}
}

/******************************************************************************/
/**
 * This function returns the frame rate for index specified.
 *
 * @param	VmId specifies the resolution id.
 *
 * @return	Frame rate in Hz.
 *
 * @note	None.
 *
*******************************************************************************/
XL_VidC_FrameRate XL_VidC_GetFrameRate(XL_VidC_VideoMode VmId)
{
	const XL_VidC_VideoTimingMode *VmPtr;

	VmPtr = XL_VidC_GetVideoModeData(VmId);
	if (!VmPtr) {
		return XLVIDCFR_NUM_SUPPORTED;
	}

	return VmPtr->FrameRate;
}

/******************************************************************************/
/**
 * This function returns the timing parameters for specified resolution.
 *
 * @param	VmId specifies the resolution id.
 *
 * @return	Pointer to a XL_VidC_VideoTiming structure.
 *
 * @note	None.
 *
*******************************************************************************/
const XL_VidC_VideoTiming *XL_VidC_GetTimingInfo(XL_VidC_VideoMode VmId)
{
	const XL_VidC_VideoTimingMode *VmPtr;

	VmPtr = XL_VidC_GetVideoModeData(VmId);
	if (!VmPtr) {
		return NULL;
	}

	return &VmPtr->Timing;
}

/******************************************************************************/
/**
 * This function sets the VideoStream structure for the specified video format.
 *
 * @param	VidStrmPtr is a pointer to the XL_VidC_VideoStream structure to be
 *		set.
 * @param	VmId specifies the resolution ID.
 * @param	ColorFormat specifies the color format type.
 * @param	Bpc specifies the color depth/bits per color component.
 * @param	Ppc specifies the pixels per clock.
 *
 * @return
 *		- XST_SUCCESS if the timing for the supplied ID was found.
 *		- XST_FAILURE, otherwise.
 *
 * @note	None.
 *
*******************************************************************************/
uint32_t XL_VidC_SetVideoStream(XL_VidC_VideoStream *VidStrmPtr, XL_VidC_VideoMode VmId,
			 XL_VidC_ColorFormat ColorFormat, XL_VidC_ColorDepth Bpc,
			 XL_VidC_PixelsPerClock Ppc)
{
	const XL_VidC_VideoTiming *TimingPtr;

	/* Get the timing from the video timing table. */
	TimingPtr = XL_VidC_GetTimingInfo(VmId);
	if (!TimingPtr) {
		return XST_FAILURE;
	}
	VidStrmPtr->VmId		= VmId;
	VidStrmPtr->Timing		= *TimingPtr;
	VidStrmPtr->FrameRate		= XL_VidC_GetFrameRate(VmId);
	VidStrmPtr->IsInterlaced	= XL_VidC_IsInterlaced(VmId);
	VidStrmPtr->ColorFormatId	= ColorFormat;
	VidStrmPtr->ColorDepth		= Bpc;
	VidStrmPtr->PixPerClk		= Ppc;

	/* Set stream to 2D. */
	VidStrmPtr->Is3D			= FALSE;
	VidStrmPtr->Info_3D.Format		= XLVIDC3D_UNKNOWN;
	VidStrmPtr->Info_3D.Sampling.Method	= XLVIDC3D_SAMPLING_UNKNOWN;
	VidStrmPtr->Info_3D.Sampling.Position	= XLVIDC3D_SAMPPOS_UNKNOWN;

	return XST_SUCCESS;
}

/******************************************************************************/
/**
 * This function sets the VideoStream structure for the specified 3D video
 * format.
 *
 * @param	VidStrmPtr is a pointer to the XL_VidC_VideoStream structure to be
 *		set.
 * @param	VmId specifies the resolution ID.
 * @param	ColorFormat specifies the color format type.
 * @param	Bpc specifies the color depth/bits per color component.
 * @param	Ppc specifies the pixels per clock.
 * @param	Info3DPtr is a pointer to a XL_VidC_3DInfo structure.
 *
 * @return
 *		- XST_SUCCESS if the timing for the supplied ID was found.
 *		- XST_FAILURE, otherwise.
 *
 * @return
 *		- XST_SUCCESS
 *		- XST_FAILURE
 *
 * @note	None.
 *
*******************************************************************************/
uint32_t XL_VidC_Set3DVideoStream(XL_VidC_VideoStream *VidStrmPtr, XL_VidC_VideoMode VmId,
			   XL_VidC_ColorFormat ColorFormat, XL_VidC_ColorDepth Bpc,
			   XL_VidC_PixelsPerClock Ppc, XL_VidC_3DInfo *Info3DPtr)
{
	uint32_t Status;
	uint16_t Vblank0;
	uint16_t Vblank1;

	/* Initialize with info for 2D frame. */
	Status = XL_VidC_SetVideoStream(VidStrmPtr, VmId, ColorFormat, Bpc, Ppc);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Set stream to 3D. */
	VidStrmPtr->Is3D	= TRUE;
	VidStrmPtr->Info_3D	= *Info3DPtr;

	/* Only 3D format supported is frame packing. */
	if (Info3DPtr->Format != XLVIDC3D_FRAME_PACKING) {
		return XST_FAILURE;
	}

	/* Update the timing based on the 3D format. */

	/* An interlaced format is converted to a progressive frame: */
	/*	3D VActive = (2D VActive * 4) + (2D VBlank field0) +
						(2D Vblank field1 * 2) */
	if (VidStrmPtr->IsInterlaced) {
		Vblank0 = VidStrmPtr->Timing.F0PVTotal -
						VidStrmPtr->Timing.VActive;
		Vblank1 = VidStrmPtr->Timing.F1VTotal -
						VidStrmPtr->Timing.VActive;
		VidStrmPtr->Timing.VActive = (VidStrmPtr->Timing.VActive * 4) +
						Vblank0 + (Vblank1 * 2);

		/* Set VTotal */
		VidStrmPtr->Timing.F0PVTotal *= 2;
		VidStrmPtr->Timing.F0PVTotal += VidStrmPtr->Timing.F1VTotal * 2;

		/* Clear field 1 values. */
		VidStrmPtr->Timing.F1VFrontPorch = 0;
		VidStrmPtr->Timing.F1VSyncWidth  = 0;
		VidStrmPtr->Timing.F1VBackPorch  = 0;
		VidStrmPtr->Timing.F1VTotal      = 0;

		/* Set format to progressive */
		VidStrmPtr->IsInterlaced = FALSE;
	}
	/* Progressive */
	else {
		/* 3D Vactive = (2D VActive * 2) + (2D VBlank) */
		Vblank0 = VidStrmPtr->Timing.F0PVTotal -
						VidStrmPtr->Timing.VActive;
		VidStrmPtr->Timing.VActive = (VidStrmPtr->Timing.VActive * 2) +
						Vblank0;

		/* Set VTotal. */
		VidStrmPtr->Timing.F0PVTotal = VidStrmPtr->Timing.F0PVTotal * 2;
	}

	return XST_SUCCESS;
}

/******************************************************************************/
/**
 * This function prints the stream information on STDIO/UART console.
 *
 * @param	Stream is a pointer to video stream.
 *
 * @return	None.
 *
 * @note	None.
 *
*******************************************************************************/
void XL_VidC_ReportStreamInfo(const XL_VidC_VideoStream *Stream)
{
	if (!XL_VidC_GetVideoModeData(Stream->VmId) &&
			(Stream->VmId != XLVIDCVM_CUSTOM)) {
		xil_printf("\tThe stream ID (%d) is not supported.\r\n",
				Stream->VmId);
		return;
	}

	xil_printf("\tColor Format:             %s\r\n",
			XL_VidC_GetColorFormatStr(Stream->ColorFormatId));
	xil_printf("\tColor Depth:              %d\r\n", Stream->ColorDepth);
	xil_printf("\tPixels Per Clock:         %d\r\n", Stream->PixPerClk);
	xil_printf("\tMode:                     %s\r\n",
			Stream->IsInterlaced ? "Interlaced" : "Progressive");
	xil_printf("\tDSC Status:               %s\r\n",
			Stream->IsDSCompressed? "Compressed" : "Uncompressed");

	if (Stream->Is3D) {
		xil_printf("\t3D Format:                %s\r\n",
		XL_VidC_Get3DFormatStr(Stream->Info_3D.Format));
	}

	if (Stream->VmId == XLVIDCVM_CUSTOM) {
		xil_printf("\tFrame Rate:               %dHz\r\n",
				Stream->FrameRate);
		if (Stream->IsDSCompressed) {
			xil_printf("\tResolution[Compressed]:   %dx%d [Custom Mode]\r\n",
				   Stream->Timing.HActive,
				   Stream->Timing.VActive);
			xil_printf("\tResolution[Uncompressed]: %dx%d\r\n",
				   Stream->UncompressedTiming.HActive,
				   Stream->UncompressedTiming.VActive);
			xil_printf("\tPixel Clock[Compressed]:  %u KHz\r\n",
				   (uint32_t)XL_VidC_GetPixelClockHzByHVFr(Stream->Timing.HTotal,
								    Stream->Timing.F0PVTotal,
								    Stream->FrameRate) / 1000);
		} else {
			xil_printf("\tResolution:               %dx%d [Custom Mode]\r\n",
				   Stream->Timing.HActive, Stream->Timing.VActive);
			xil_printf("\tPixel Clock:              %d kHz\r\n",
				   (uint32_t)XL_VidC_GetPixelClockHzByHVFr(
								    Stream->Timing.HTotal,
								    Stream->Timing.F0PVTotal,
								    Stream->FrameRate)/1000);
		}
	}
	else {
		xil_printf("\tFrame Rate:               %s\r\n",
				XL_VidC_GetFrameRateStr(Stream->VmId));
		xil_printf("\tResolution:               %s\r\n",
				XL_VidC_GetVideoModeStr(Stream->VmId));
		xil_printf("\tPixel Clock:              %d kHz\r\n",
				(uint32_t)XL_VidC_GetPixelClockHzByVmId(Stream->VmId)/1000);
	}
}

/******************************************************************************/
/**
 * This function prints timing information on STDIO/Uart console.
 *
 * @param	Timing is a pointer to Video Timing structure of the stream.
 * @param	IsInterlaced is a TRUE/FALSE flag that denotes the timing
 *		parameter is for interlaced/progressive stream.
 *
 * @return	None.
 *
 * @note	None.
 *
*******************************************************************************/
void XL_VidC_ReportTiming(const XL_VidC_VideoTiming *Timing, uint8_t IsInterlaced)
{
	xil_printf("\r\n\tHSYNC Timing: hav=%04d, hfp=%02d, hsw=%02d(hsp=%d), "
			"hbp=%03d, htot=%04d \r\n", Timing->HActive,
			Timing->HFrontPorch, Timing->HSyncWidth,
			Timing->HSyncPolarity,
			Timing->HBackPorch, Timing->HTotal);

	/* Interlaced */
	if (IsInterlaced) {
		xil_printf("\tVSYNC Timing (Field 0): vav=%04d, vfp=%02d, "
			"vsw=%02d(vsp=%d), vbp=%03d, vtot=%04d\r\n",
			Timing->VActive, Timing->F0PVFrontPorch,
			Timing->F0PVSyncWidth, Timing->VSyncPolarity,
			Timing->F0PVBackPorch, Timing->F0PVTotal);
	xil_printf("\tVSYNC Timing (Field 1): vav=%04d, vfp=%02d, "
			"vsw=%02d(vsp=%d), vbp=%03d, vtot=%04d\r\n",
			Timing->VActive, Timing->F1VFrontPorch,
			Timing->F1VSyncWidth, Timing->VSyncPolarity,
			Timing->F1VBackPorch, Timing->F1VTotal);
	}
	/* Progressive */
	else {
		xil_printf("\tVSYNC Timing: vav=%04d, vfp=%02d, "
			"vsw=%02d(vsp=%d), vbp=%03d, vtot=%04d\r\n",
			Timing->VActive, Timing->F0PVFrontPorch,
			Timing->F0PVSyncWidth, Timing->VSyncPolarity,
			Timing->F0PVBackPorch, Timing->F0PVTotal);
	}
}

/******************************************************************************/
/**
 * This function returns the pointer to video mode data at the provided index
 * of the custom video mode table.
 *
 * @param	VmId specifies the resolution ID.
 *
 * @return	Pointer to XL_VidC_VideoTimingMode structure based on the given
 *		video mode.
 *
 * @note	None.
 *
*******************************************************************************/
static const XL_VidC_VideoTimingMode *XL_VidC_GetCustomVideoModeData(
		XL_VidC_VideoMode VmId)
{
	uint16_t Index;

	for (Index = 0; Index < XL_VidC_NumCustomModes; Index++) {
		if (VmId == (XL_VidC_CustomTimingModes[Index].VmId)) {
			return &(XL_VidC_CustomTimingModes[Index]);
		}
	}

	/* ID not found within the custom video mode table. */
	return NULL;
}

/******************************************************************************/
/**
 * This function returns whether or not the video timing mode is a reduced
 * blanking mode or not.
 *
 * @param	VideoModeStr specifies the resolution name string.
 * @param	RbN specifies the type of reduced blanking:
 *		- 0 = No Reduced Blanking
 *		- 1 = RB
 *		- 2 = RB2
 *
 * @return	If the reduced blanking type is compatible with the video mode:
 *		- 0 = Not supported
 *		- 1 = Video mode supports the RB type
 *
 * @note	None.
 *
*******************************************************************************/
static uint8_t XL_VidC_IsVtmRb(const char *VideoModeStr, uint8_t RbN)
{
	while ((*VideoModeStr !='\0') && (*VideoModeStr != 'R')) {
		VideoModeStr++;
	}

	if (*(VideoModeStr + 2) == ')') {
		return RbN == 1;
	}
	if (*(VideoModeStr + 2) == '2') {
		return RbN == 2;
	}
	return 0;
}
/** @} */
