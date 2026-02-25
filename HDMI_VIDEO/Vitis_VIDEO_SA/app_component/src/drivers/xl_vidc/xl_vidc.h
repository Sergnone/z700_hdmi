/*******************************************************************************
* Copyright (C) 2021 Xilinx, Inc.  All rights reserved
* Copyright 2023-2024 Advanced Micro Devices, Inc. All Rights Reserved..
* SPDX-License-Identifier: MIT
*******************************************************************************/

#ifndef XL_VIDC_H_ 
#define XL_VIDC_H_

#ifdef __cplusplus
extern "C" {
#endif

/******************************* Include Files ********************************/

#include <stdint.h>
//#include "xil_types.h"
//#include "xil_printf.h"

/************************** Constant Definitions ******************************/

/**
 * This typedef enumerates the list of available standard display monitor
 * timings as specified in the xvidc_timings_table.c file. The naming format is:
 *
 * XLVIDCVM_<RESOLUTION>_<REFRESH RATE (HZ)>_<P|I>(_RB)
 *
 * Where RB stands for reduced blanking.
 */
typedef enum {
	/* Interlaced modes. */
	XLVIDCVM_720x480_60_I = 0,
	XLVIDCVM_720x486_60_I,
	XLVIDCVM_720x576_50_I,
	XLVIDCVM_1440x480_60_I,
	XLVIDCVM_1440x480_120_I,
	XLVIDCVM_1440x480_240_I,
	XLVIDCVM_1440x576_50_I,
	XLVIDCVM_1440x576_100_I,
	XLVIDCVM_1440x576_200_I,
	XLVIDCVM_1920x1080_48_I,
	XLVIDCVM_1920x1080_50_I,
	XLVIDCVM_1920x1080_50_I_VT1250,
	XLVIDCVM_1920x1080_60_I,
	XLVIDCVM_1920x1080_96_I,
	XLVIDCVM_1920x1080_100_I,
	XLVIDCVM_1920x1080_120_I,
	XLVIDCVM_2048x1080_48_I,
	XLVIDCVM_2048x1080_50_I,
	XLVIDCVM_2048x1080_60_I,
	XLVIDCVM_2048x1080_96_I,
	XLVIDCVM_2048x1080_100_I,
	XLVIDCVM_2048x1080_120_I,
	XLVIDCVM_2880x480_60_I,
	XLVIDCVM_2880x576_50_I,


	/* Progressive modes. */
	XLVIDCVM_640x350_85_P,
	XLVIDCVM_640x480_60_P,
	XLVIDCVM_640x480_72_P,
	XLVIDCVM_640x480_75_P,
	XLVIDCVM_640x480_85_P,
	XLVIDCVM_720x400_85_P,
	XLVIDCVM_720x480_60_P,
	XLVIDCVM_720x480_120_P,
	XLVIDCVM_720x480_240_P,
	XLVIDCVM_720x576_50_P,
	XLVIDCVM_720x576_100_P,
	XLVIDCVM_720x576_200_P,
	XLVIDCVM_800x600_56_P,
	XLVIDCVM_800x600_60_P,
	XLVIDCVM_800x600_72_P,
	XLVIDCVM_800x600_75_P,
	XLVIDCVM_800x600_85_P,
	XLVIDCVM_800x600_120_P_RB,
	XLVIDCVM_848x480_60_P,
	XLVIDCVM_1024x768_60_P,
	XLVIDCVM_1024x768_70_P,
	XLVIDCVM_1024x768_75_P,
	XLVIDCVM_1024x768_85_P,
	XLVIDCVM_1024x768_120_P_RB,
	XLVIDCVM_1152x864_75_P,
	XLVIDCVM_1280x720_24_P,
	XLVIDCVM_1280x720_25_P,
	XLVIDCVM_1280x720_30_P,
	XLVIDCVM_1280x720_48_P,
	XLVIDCVM_1280x720_50_P,
	XLVIDCVM_1280x720_60_P,
	XLVIDCVM_1280x720_100_P,
	XLVIDCVM_1280x720_120_P,
	XLVIDCVM_1280x768_60_P,
	XLVIDCVM_1280x768_60_P_RB,
	XLVIDCVM_1280x768_75_P,
	XLVIDCVM_1280x768_85_P,
	XLVIDCVM_1280x768_120_P_RB,
	XLVIDCVM_1280x800_60_P,
	XLVIDCVM_1280x800_60_P_RB,
	XLVIDCVM_1280x800_75_P,
	XLVIDCVM_1280x800_85_P,
	XLVIDCVM_1280x800_120_P_RB,
	XLVIDCVM_1280x960_60_P,
	XLVIDCVM_1280x960_85_P,
	XLVIDCVM_1280x960_120_P_RB,
	XLVIDCVM_1280x1024_60_P,
	XLVIDCVM_1280x1024_75_P,
	XLVIDCVM_1280x1024_85_P,
	XLVIDCVM_1280x1024_120_P_RB,
	XLVIDCVM_1360x768_60_P,
	XLVIDCVM_1360x768_120_P_RB,
	XLVIDCVM_1366x768_60_P,
	XLVIDCVM_1366x768_60_P_RB,
	XLVIDCVM_1400x1050_60_P,
	XLVIDCVM_1400x1050_60_P_RB,
	XLVIDCVM_1400x1050_75_P,
	XLVIDCVM_1400x1050_85_P,
	XLVIDCVM_1400x1050_120_P_RB,
	XLVIDCVM_1440x240_60_P,
	XLVIDCVM_1440x240_60_P_VT263,
	XLVIDCVM_1440x288_50_P,
	XLVIDCVM_1440x288_50_P_VT314,
	XLVIDCVM_1440x288_50_P_VT312,
	XLVIDCVM_1440x480_60_P,
	XLVIDCVM_1440x576_50_P,
	XLVIDCVM_1440x900_60_P,
	XLVIDCVM_1440x900_60_P_RB,
	XLVIDCVM_1440x900_75_P,
	XLVIDCVM_1440x900_85_P,
	XLVIDCVM_1440x900_120_P_RB,
	XLVIDCVM_1600x1200_60_P,
	XLVIDCVM_1600x1200_65_P,
	XLVIDCVM_1600x1200_70_P,
	XLVIDCVM_1600x1200_75_P,
	XLVIDCVM_1600x1200_85_P,
	XLVIDCVM_1600x1200_120_P_RB,
	XLVIDCVM_1680x720_24_P,
	XLVIDCVM_1680x720_25_P,
	XLVIDCVM_1680x720_30_P,
	XLVIDCVM_1680x720_48_P,
	XLVIDCVM_1680x720_50_P,
	XLVIDCVM_1680x720_60_P,
	XLVIDCVM_1680x720_100_P,
	XLVIDCVM_1680x720_120_P,
	XLVIDCVM_1680x1050_50_P,
	XLVIDCVM_1680x1050_60_P,
	XLVIDCVM_1680x1050_60_P_RB,
	XLVIDCVM_1680x1050_75_P,
	XLVIDCVM_1680x1050_85_P,
	XLVIDCVM_1680x1050_120_P_RB,
	XLVIDCVM_1792x1344_60_P,
	XLVIDCVM_1792x1344_75_P,
	XLVIDCVM_1792x1344_120_P_RB,
	XLVIDCVM_1856x1392_60_P,
	XLVIDCVM_1856x1392_75_P,
	XLVIDCVM_1856x1392_120_P_RB,
	XLVIDCVM_1920x1080_24_P,
	XLVIDCVM_1920x1080_25_P,
	XLVIDCVM_1920x1080_30_P,
	XLVIDCVM_1920x1080_48_P,
	XLVIDCVM_1920x1080_50_P,
	XLVIDCVM_1920x1080_60_P,
	XLVIDCVM_1920x1080_100_P,
	XLVIDCVM_1920x1080_120_P,
	XLVIDCVM_1920x1200_60_P,
	XLVIDCVM_1920x1200_60_P_RB,
	XLVIDCVM_1920x1200_75_P,
	XLVIDCVM_1920x1200_85_P,
	XLVIDCVM_1920x1200_120_P_RB,
	XLVIDCVM_1920x1440_60_P,
	XLVIDCVM_1920x1440_75_P,
	XLVIDCVM_1920x1440_120_P_RB,
	XLVIDCVM_1920x2160_60_P,
	XLVIDCVM_2048x1080_24_P,
	XLVIDCVM_2048x1080_25_P,
	XLVIDCVM_2048x1080_30_P,
	XLVIDCVM_2048x1080_48_P,
	XLVIDCVM_2048x1080_50_P,
	XLVIDCVM_2048x1080_60_P,
	XLVIDCVM_2048x1080_100_P,
	XLVIDCVM_2048x1080_120_P,
	XLVIDCVM_2560x1080_24_P,
	XLVIDCVM_2560x1080_25_P,
	XLVIDCVM_2560x1080_30_P,
	XLVIDCVM_2560x1080_48_P,
	XLVIDCVM_2560x1080_50_P,
	XLVIDCVM_2560x1080_60_P,
	XLVIDCVM_2560x1080_100_P,
	XLVIDCVM_2560x1080_120_P,
	XLVIDCVM_2560x1600_60_P,
	XLVIDCVM_2560x1600_60_P_RB,
	XLVIDCVM_2560x1600_75_P,
	XLVIDCVM_2560x1600_85_P,
	XLVIDCVM_2560x1600_120_P_RB,
	XLVIDCVM_2880x240_60_P,
	XLVIDCVM_2880x240_60_P_VT263,
	XLVIDCVM_2880x288_50_P,
	XLVIDCVM_2880x288_50_P_VT314,
	XLVIDCVM_2880x288_50_P_VT312,
	XLVIDCVM_2880x480_60_P,
	XLVIDCVM_2880x576_50_P,
	XLVIDCVM_3840x2160_24_P,
	XLVIDCVM_3840x2160_25_P,
	XLVIDCVM_3840x2160_30_P,
	XLVIDCVM_3840x2160_48_P,
	XLVIDCVM_3840x2160_50_P,
	XLVIDCVM_3840x2160_60_P,
	XLVIDCVM_3840x2160_60_P_RB,
	XLVIDCVM_3840x2160_100_P,
	XLVIDCVM_3840x2160_120_P,
	XLVIDCVM_4096x2160_24_P,
	XLVIDCVM_4096x2160_25_P,
	XLVIDCVM_4096x2160_30_P,
	XLVIDCVM_4096x2160_48_P,
	XLVIDCVM_4096x2160_50_P,
	XLVIDCVM_4096x2160_60_P,
	XLVIDCVM_4096x2160_60_P_RB,
	XLVIDCVM_4096x2160_100_P,
	XLVIDCVM_4096x2160_120_P,
	XLVIDCVM_5120x2160_24_P,
	XLVIDCVM_5120x2160_25_P,
	XLVIDCVM_5120x2160_30_P,
	XLVIDCVM_5120x2160_48_P,
	XLVIDCVM_5120x2160_50_P,
	XLVIDCVM_5120x2160_60_P,
	XLVIDCVM_5120x2160_100_P,
	XLVIDCVM_5120x2160_120_P,
	XLVIDCVM_7680x4320_24_P,
	XLVIDCVM_7680x4320_25_P,
	XLVIDCVM_7680x4320_30_P,
	XLVIDCVM_7680x4320_48_P,
	XLVIDCVM_7680x4320_50_P,
	XLVIDCVM_7680x4320_60_P,
	XLVIDCVM_7680x4320_120_P,
	XLVIDCVM_7680x4320_100_P,
	XLVIDCVM_10240x4320_24_P,
	XLVIDCVM_10240x4320_25_P,
	XLVIDCVM_10240x4320_30_P,
	XLVIDCVM_10240x4320_48_P,
	XLVIDCVM_10240x4320_50_P,
	XLVIDCVM_10240x4320_60_P,
	XLVIDCVM_10240x4320_100_P,
	XLVIDCVM_10240x4320_120_P,

	XLVIDCVM_NUM_SUPPORTED,
	XLVIDCVM_USE_EDID_PREFERRED,
	XLVIDCVM_NO_INPUT,
	XLVIDCVM_NOT_SUPPORTED,
	XLVIDCVM_CUSTOM,

	/* Marks beginning/end of interlaced/progressive modes in the table. */
	XLVIDCVM_INTL_START = XLVIDCVM_720x480_60_I,
	XLVIDCVM_PROG_START = XLVIDCVM_640x350_85_P,
	XLVIDCVM_INTL_END = (XLVIDCVM_PROG_START - 1),
	XLVIDCVM_PROG_END = (XLVIDCVM_NUM_SUPPORTED - 1),

	/* Common naming. */
	XLVIDCVM_480_60_I = XLVIDCVM_720x480_60_I,
	XLVIDCVM_486_60_I = XLVIDCVM_720x486_60_I,
	XLVIDCVM_576_50_I = XLVIDCVM_720x576_50_I,
	XLVIDCVM_1080_50_I = XLVIDCVM_1920x1080_50_I,
	XLVIDCVM_1080_60_I = XLVIDCVM_1920x1080_60_I,
	XLVIDCVM_VGA_60_P = XLVIDCVM_640x480_60_P,
	XLVIDCVM_480_60_P = XLVIDCVM_720x480_60_P,
	XLVIDCVM_SVGA_60_P = XLVIDCVM_800x600_60_P,
	XLVIDCVM_XGA_60_P = XLVIDCVM_1024x768_60_P,
	XLVIDCVM_720_50_P = XLVIDCVM_1280x720_50_P,
	XLVIDCVM_720_60_P = XLVIDCVM_1280x720_60_P,
	XLVIDCVM_WXGA_60_P = XLVIDCVM_1366x768_60_P,
	XLVIDCVM_UXGA_60_P = XLVIDCVM_1600x1200_60_P,
	XLVIDCVM_WSXGA_60_P = XLVIDCVM_1680x1050_60_P,
	XLVIDCVM_1080_24_P = XLVIDCVM_1920x1080_24_P,
	XLVIDCVM_1080_25_P = XLVIDCVM_1920x1080_25_P,
	XLVIDCVM_1080_30_P = XLVIDCVM_1920x1080_30_P,
	XLVIDCVM_1080_50_P = XLVIDCVM_1920x1080_50_P,
	XLVIDCVM_1080_60_P = XLVIDCVM_1920x1080_60_P,
	XLVIDCVM_WUXGA_60_P = XLVIDCVM_1920x1200_60_P,
	XLVIDCVM_UHD2_60_P = XLVIDCVM_1920x2160_60_P,
	XLVIDCVM_UHD_24_P = XLVIDCVM_3840x2160_24_P,
	XLVIDCVM_UHD_25_P = XLVIDCVM_3840x2160_25_P,
	XLVIDCVM_UHD_30_P = XLVIDCVM_3840x2160_30_P,
	XLVIDCVM_UHD_60_P = XLVIDCVM_3840x2160_60_P,
	XLVIDCVM_4K2K_60_P = XLVIDCVM_4096x2160_60_P,
	XLVIDCVM_4K2K_60_P_RB = XLVIDCVM_4096x2160_60_P_RB,
} XL_VidC_VideoMode;

/**
 * Progressive/interlaced video format.
 */
typedef enum {
	XLVIDCVF_PROGRESSIVE = 0,
	XLVIDCVF_INTERLACED,
	XLVIDCVF_UNKNOWN
} XL_VidC_VideoFormat;

/**
 * Frame rate.
 */
typedef enum {
	XLVIDCFR_24HZ = 24,
	XLVIDCFR_25HZ = 25,
	XLVIDCFR_30HZ = 30,
	XLVIDCFR_48HZ = 48,
	XLVIDCFR_50HZ = 50,
	XLVIDCFR_56HZ = 56,
	XLVIDCFR_60HZ = 60,
	XLVIDCFR_65HZ = 65,
	XLVIDCFR_67HZ = 67,
	XLVIDCFR_70HZ = 70,
	XLVIDCFR_72HZ = 72,
	XLVIDCFR_75HZ = 75,
	XLVIDCFR_85HZ = 85,
	XLVIDCFR_87HZ = 87,
	XLVIDCFR_88HZ = 88,
	XLVIDCFR_96HZ = 96,
	XLVIDCFR_100HZ = 100,
	XLVIDCFR_120HZ = 120,
	XLVIDCFR_144HZ = 144,
	XLVIDCFR_200HZ = 200,
	XLVIDCFR_240HZ = 240,
	XLVIDCFR_NUM_SUPPORTED = 21,
	XLVIDCFR_UNKNOWN
} XL_VidC_FrameRate;

/**
 * Color depth - bits per color component.
 */
typedef enum {
	XLVIDCBPC_6 = 6,
	XLVIDCBPC_8 = 8,
	XLVIDCBPC_10 = 10,
	XLVIDCBPC_12 = 12,
	XLVIDCBPC_14 = 14,
	XLVIDCBPC_16 = 16,
	XLVIDCBPC_NUM_SUPPORTED = 6,
	XLVIDCBPC_UNKNOWN
} XL_VidC_ColorDepth;

/**
 * Pixels per clock.
 */
typedef enum {
	XLVIDCPPC_1 = 1,
	XLVIDCPPC_2 = 2,
	XLVIDCPPC_4 = 4,
	XLVIDCPPC_8 = 8,
	XLVIDCPPC_NUM_SUPPORTED = 4
} XL_VidC_PixelsPerClock;

/**
 * Color space format.
 */
typedef enum {
	/* Streaming video formats */
	XLVIDCCSF_RGB = 0,
	XLVIDCCSF_YCRCB_444,
	XLVIDCCSF_YCRCB_422,
	XLVIDCCSF_YCRCB_420,
	XLVIDCCSF_YONLY,
	XLVIDCCSF_RGBA,
	XLVIDCCSF_YCRCBA_444,

	/* 6 empty slots reserved for video formats for future
	 * extension
	 */

	/* Video in memory formats */
	XLVIDCCSF_MEM_RGBX8 = 10,   // [31:0] x:B:G:R 8:8:8:8
	XLVIDCCSF_MEM_YUVX8,        // [31:0] x:V:U:Y 8:8:8:8
	XLVIDCCSF_MEM_YUYV8,        // [31:0] V:Y:U:Y 8:8:8:8
	XLVIDCCSF_MEM_RGBA8,        // [31:0] A:B:G:R 8:8:8:8
	XLVIDCCSF_MEM_YUVA8,        // [31:0] A:V:U:Y 8:8:8:8
	XLVIDCCSF_MEM_RGBX10,       // [31:0] x:B:G:R 2:10:10:10
	XLVIDCCSF_MEM_YUVX10,       // [31:0] x:V:U:Y 2:10:10:10
	XLVIDCCSF_MEM_RGB565,       // [15:0] B:G:R 5:6:5
	XLVIDCCSF_MEM_Y_UV8,        // [15:0] Y:Y 8:8, [15:0] V:U 8:8
	XLVIDCCSF_MEM_Y_UV8_420,    // [15:0] Y:Y 8:8, [15:0] V:U 8:8
	XLVIDCCSF_MEM_RGB8,         // [23:0] B:G:R 8:8:8
	XLVIDCCSF_MEM_YUV8,         // [24:0] V:U:Y 8:8:8
	XLVIDCCSF_MEM_Y_UV10,       // [31:0] x:Y:Y:Y 2:10:10:10 [31:0] x:U:V:U 2:10:10:10
	XLVIDCCSF_MEM_Y_UV10_420,   // [31:0] x:Y:Y:Y 2:10:10:10 [31:0] x:U:V:U 2:10:10:10
	XLVIDCCSF_MEM_Y8,           // [31:0] Y:Y:Y:Y 8:8:8:8
	XLVIDCCSF_MEM_Y10,          // [31:0] x:Y:Y:Y 2:10:10:10
	XLVIDCCSF_MEM_BGRA8,        // [31:0] A:R:G:B 8:8:8:8
	XLVIDCCSF_MEM_BGRX8,        // [31:0] X:R:G:B 8:8:8:8
	XLVIDCCSF_MEM_UYVY8,        // [31:0] Y:V:Y:U 8:8:8:8
	XLVIDCCSF_MEM_BGR8,         // [23:0] R:G:B 8:8:8
	XLVIDCCSF_MEM_RGBX12,       // [39:0] x:R:G:B 4:12:12:12
	XLVIDCCSF_MEM_YUVX12,       // [39:0] x:V:U:Y 4:12:12:12
	XLVIDCCSF_MEM_Y_UV12,       // [23:0] Y:Y 12:12, [23:0] V:U 12:12
	XLVIDCCSF_MEM_Y_UV12_420,   // [23:0] Y:Y 12:12, [23:0] V:U 12:12
	XLVIDCCSF_MEM_Y12,          // [39:0] x:Y2:Y1:Y0 4:12:12:12
	XLVIDCCSF_MEM_RGB16,        // [47:0] R:G:B 16:16:16
	XLVIDCCSF_MEM_YUV16,        // [47:0] V:U:Y 16:16:16
	XLVIDCCSF_MEM_Y_UV16,       // [31:0] Y:Y 16:16, [31:0] V:U 16:16
	XLVIDCCSF_MEM_Y_UV16_420,   // [31:0] Y:Y 16:16, [31:0] V:U 16:16
	XLVIDCCSF_MEM_Y16,          // [47:0] Y2:Y1:Y0 16:16:16
	XLVIDCCSF_MEM_R_G_B8,       // [7:0] R:8, [7:0] G:8, [7:0] B:8
	XLVIDCCSF_MEM_Y_U_V8_420,   // [15:0] Y:Y 8:8, [7:0] U:8, [7:0] V:8
	XLVIDCCSF_MEM_Y_U_V8,       // [7:0] Y:8, [7:0] U:8, [7:0] V:8
	XLVIDCCSF_MEM_Y_U_V10,      // [9:0] Y:10, [9:0] U:10, [9:0] V:10
	XLVIDCCSF_MEM_Y_U_V12,      // [11:0] Y:12, [11:0] U:12, [11:0] V:12
	XLVIDCCSF_MEM_END,          // End of memory formats

	/* Streaming formats with components re-ordered */
	XLVIDCCSF_YCBCR_422 = 64,
	XLVIDCCSF_YCBCR_420,
	XLVIDCCSF_YCBCR_444,

	XLVIDCCSF_NUM_SUPPORTED,    // includes the reserved slots
	XLVIDCCSF_UNKNOWN,
	XLVIDCCSF_STRM_START = XLVIDCCSF_RGB,
	XLVIDCCSF_STRM_END   = XLVIDCCSF_YONLY,
	XLVIDCCSF_MEM_START  = XLVIDCCSF_MEM_RGBX8,
	XLVIDCCSF_NUM_STRM   = (XLVIDCCSF_STRM_END - XLVIDCCSF_STRM_START + 1),
	XLVIDCCSF_NUM_MEM    = (XLVIDCCSF_MEM_END - XLVIDCCSF_MEM_START)
} XL_VidC_ColorFormat;

/**
 * Tile Size in Tile format.
 */
typedef enum {
	XLVIDCTILE_32 = 32,
	XLVIDCTILE_64 = 64,
	XLVIDCTILE_NUM_SUPPORTED = 2
} XL_VidC_TileSize;

/**
 * Image Aspect Ratio.
 */
typedef enum {
	XLVIDCAR_4_3 = 0,
	XLVIDCAR_16_9 = 1
} XL_VidC_AspectRatio;

/**
 * Color space conversion standard.
 */
typedef enum {
	XLVIDCBT_2020 = 0,
	XLVIDCBT_709,
	XLVIDCBT_601,
	XLVIDCBT_NUM_SUPPORTED,
	XLVIDCBT_UNKNOWN
} XL_VidC_ColorStd;

/**
 * Color conversion output range.
 */
typedef enum {
	XLVIDCCR_16_235 = 0,
	XLVIDCCR_16_240,
	XLVIDCCR_0_255,
	XLVIDCCR_NUM_SUPPORTED,
	XLVIDCCR_UNKNOWN_RANGE
} XL_VidC_ColorRange;

/**
 * 3D formats.
 */
typedef enum {
	XLVIDC3D_FRAME_PACKING = 0,	/**< Frame packing.         */
	XLVIDC3D_FIELD_ALTERNATIVE,	/**< Field alternative.     */
	XLVIDC3D_LINE_ALTERNATIVE,	/**< Line alternative.      */
	XLVIDC3D_SIDE_BY_SIDE_FULL,	/**< Side-by-side (full).   */
	XLVIDC3D_TOP_AND_BOTTOM_HALF,	/**< Top-and-bottom (half). */
	XLVIDC3D_SIDE_BY_SIDE_HALF,	/**< Side-by-side (half).   */
	XLVIDC3D_UNKNOWN
} XL_VidC_3DFormat;

/**
 * 3D Sub-sampling methods.
 */
typedef enum {
	XLVIDC3D_SAMPLING_HORIZONTAL = 0, /**< Horizontal sub-sampling. */
	XLVIDC3D_SAMPLING_QUINCUNX,	  /**< Quincunx matrix.         */
	XLVIDC3D_SAMPLING_UNKNOWN
} XL_VidC_3DSamplingMethod;

/**
 * 3D Sub-sampling positions.
 */
typedef enum {
	XLVIDC3D_SAMPPOS_OLOR = 0,	/**< Odd/Left,  Odd/Right.  */
	XLVIDC3D_SAMPPOS_OLER,		/**< Odd/Left,  Even/Right. */
	XLVIDC3D_SAMPPOS_ELOR,		/**< Even/Left, Odd/Right.  */
	XLVIDC3D_SAMPPOS_ELER,		/**< Even/Left, Even/Right. */
	XLVIDC3D_SAMPPOS_UNKNOWN
} XL_VidC_3DSamplingPosition;

/****************************** Type Definitions ******************************/

/**
 * Video timing structure.
 */
typedef struct {
	uint16_t HActive;
	uint16_t HFrontPorch;
	uint16_t HSyncWidth;
	uint16_t HBackPorch;
	uint16_t HTotal;
	uint8_t HSyncPolarity;
	uint16_t VActive;
	uint16_t F0PVFrontPorch;
	uint16_t F0PVSyncWidth;
	uint16_t F0PVBackPorch;
	uint16_t F0PVTotal;
	uint16_t F1VFrontPorch;
	uint16_t F1VSyncWidth;
	uint16_t F1VBackPorch;
	uint16_t F1VTotal;
	uint8_t VSyncPolarity;
} XL_VidC_VideoTiming;

/**
 * 3D Sampling info structure.
 */
typedef struct {
	XL_VidC_3DSamplingMethod   Method;
	XL_VidC_3DSamplingPosition Position;
} XL_VidC_3DSamplingInfo;

/**
 * 3D info structure.
 */
typedef struct {
	XL_VidC_3DFormat		  Format;
	XL_VidC_3DSamplingInfo  Sampling;
} XL_VidC_3DInfo;

/**
 * Electro Optical Transfer Function
 *
 * Based on CTA861-G
 */
typedef enum {
	/* TG - Traditional Gamma */
	XLVIDCEOTF_TG_SDR = 0,
	XLVIDCEOTF_TG_HDR,
	XLVIDCEOTF_SMPTE2084,
	XLVIDCEOTF_HLG,
	XLVIDCEOTF_NUM_SUPPORTED,
	XLVIDCEOTF_UNKNOWN,
} XL_VidC_Eotf;

/**
 * Video stream structure.
 */
typedef struct {
	XL_VidC_ColorFormat	ColorFormatId;
	XL_VidC_ColorDepth	ColorDepth;
	XL_VidC_PixelsPerClock	PixPerClk;
	XL_VidC_FrameRate		FrameRate;
	XL_VidC_AspectRatio	AspectRatio;
	uint8_t			IsInterlaced;
	uint8_t			Is3D;
	XL_VidC_3DInfo		Info_3D;
	XL_VidC_VideoMode		VmId;
	XL_VidC_VideoTiming	Timing;
	XL_VidC_Eotf		Eotf;
	XL_VidC_ColorStd		ColorStd;
	XL_VidC_FrameRate		BaseFrameRate;
	XL_VidC_VideoTiming	BaseTiming;
	/* For DSC streams */
	uint8_t			IsDSCompressed;
	uint8_t			DynamicRange;
	XL_VidC_VideoTiming	UncompressedTiming;
} XL_VidC_VideoStream;

/**
 * Video window structure.
 */
typedef struct {
	uint32_t StartX;
	uint32_t StartY;
	uint32_t Width;
	uint32_t Height;
} XL_VidC_VideoWindow;

/**
 * Video timing mode from the video timing table.
 */
typedef struct {
	XL_VidC_VideoMode		VmId;
	char			Name[21];
	XL_VidC_FrameRate		FrameRate;
	XL_VidC_VideoTiming	Timing;
} XL_VidC_VideoTimingMode;

/**
 * Callback type which represents a custom timer wait handler. This is only
 * used for Microblaze since it doesn't have a native sleep function. To avoid
 * dependency on a hardware timer, the default wait functionality is implemented
 * using loop iterations; this isn't too accurate. Therefore a custom timer
 * handler is used, the user may implement their own wait implementation.
 *
 * @param	TimerPtr is a pointer to the timer instance.
 * @param	Delay is the duration (msec/usec) to be passed to the timer
 *		function.
 *
*******************************************************************************/
typedef void (*XVidC_DelayHandler)(void *TimerPtr, uint32_t Delay);

/**************************** Function Prototypes *****************************/

uint32_t XL_VidC_RegisterCustomTimingModes(const XL_VidC_VideoTimingMode *CustomTable,
		                            uint16_t NumElems);
void XL_VidC_UnregisterCustomTimingModes(void);
uint64_t XL_VidC_GetPixelClockHzByHVFr(uint32_t HTotal, uint32_t VTotal, uint8_t FrameRate);
uint64_t XL_VidC_GetPixelClockHzByVmId(XL_VidC_VideoMode VmId);
XL_VidC_VideoFormat XL_VidC_GetVideoFormat(XL_VidC_VideoMode VmId);
uint8_t XL_VidC_IsInterlaced(XL_VidC_VideoMode VmId);
const XL_VidC_VideoTimingMode* XL_VidC_GetVideoModeData(XL_VidC_VideoMode VmId);
const char *XL_VidC_GetVideoModeStr(XL_VidC_VideoMode VmId);
const char *XL_VidC_GetFrameRateStr(XL_VidC_VideoMode VmId);
const char *XL_VidC_GetColorFormatStr(XL_VidC_ColorFormat ColorFormatId);
XL_VidC_FrameRate XL_VidC_GetFrameRate(XL_VidC_VideoMode VmId);
const XL_VidC_VideoTiming* XL_VidC_GetTimingInfo(XL_VidC_VideoMode VmId);
void XL_VidC_ReportStreamInfo(const XL_VidC_VideoStream *Stream);
void XL_VidC_ReportTiming(const XL_VidC_VideoTiming *Timing, uint8_t IsInterlaced);
const char *XL_VidC_Get3DFormatStr(XL_VidC_3DFormat Format);
uint32_t XL_VidC_SetVideoStream(XL_VidC_VideoStream *VidStrmPtr, XL_VidC_VideoMode VmId,
			             XL_VidC_ColorFormat ColorFormat, XL_VidC_ColorDepth Bpc,
			             XL_VidC_PixelsPerClock Ppc);
uint32_t XL_VidC_Set3DVideoStream(XL_VidC_VideoStream *VidStrmPtr, XL_VidC_VideoMode VmId,
			               XL_VidC_ColorFormat ColorFormat, XL_VidC_ColorDepth Bpc,
			               XL_VidC_PixelsPerClock Ppc, XL_VidC_3DInfo *Info3DPtr);
XL_VidC_VideoMode XL_VidC_GetVideoModeId(uint32_t Width, uint32_t Height, uint32_t FrameRate,
		                             uint8_t IsInterlaced);
XL_VidC_VideoMode XL_VidC_GetVideoModeIdExtensive(XL_VidC_VideoTiming *Timing,
											  uint32_t FrameRate,
											  uint8_t IsInterlaced,
											  uint8_t IsExtensive);
XL_VidC_VideoMode XL_VidC_GetVideoModeIdRb(uint32_t Width, uint32_t Height, uint32_t FrameRate,
		                               uint8_t IsInterlaced, uint8_t RbN);
XL_VidC_VideoMode XL_VidC_GetVideoModeIdWBlanking(const XL_VidC_VideoTiming *Timing,
		                                      uint32_t FrameRate, uint8_t IsInterlaced);

/******************* Macros (Inline Functions) Definitions ********************/

/*****************************************************************************/
/**
 * This macro check if video stream is 3D or 2D.
 *
 * @param	VidStreamPtr is a pointer to the XVidC_VideoStream structure.
 *
 * @return	3D(1)/2D(0)
 *
 * @note	C-style signature:
 *		uint8_t XDp_IsStream3D(XVidC_VideoStream *VidStreamPtr)
 *
 *****************************************************************************/
#define XVidC_IsStream3D(VidStreamPtr)       ((VidStreamPtr)->Is3D)

/*************************** Variable Declarations ****************************/

#ifdef __cplusplus
}
#endif

#endif /* XLVIDCH_ */
/** @} */
