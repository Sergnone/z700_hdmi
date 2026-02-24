/******************************************************************************/
/**
* Copyright (C) 2019 - 2022  Xilinx, Inc.  All rights reserved.
* Copyright (C) 2022 - 2024 Advanced Micro Devices, Inc.  All rights reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

#ifndef XL_UTIL_H_
#define XL_UTIL_H_

#ifdef __cplusplus
extern "C" {
#endif

/******************************* Include Files ********************************/
#include "xl_io.h"
#include "xl_status.h"
#include "xl_sutil.h"

/*************************** Constant Definitions *****************************/
#define XIL_SIZE_OF_NIBBLE_IN_BITS	4U /**< size of nibble in bits */
#define XIL_SIZE_OF_BYTE_IN_BITS	8U /**< size of byte in bits */

#define XIL_MAX_HEX_STR_LEN	512U /**< Maximum string length handled by
                                          Xil_ValidateHexStr function */

/****************** Macros (Inline Functions) Definitions *********************/

/*************************** Function Prototypes ******************************/

/**< Ceils the provided float value */
s32 Xil_Ceil(float Value);

/**< Validate input hex character */
uint32_t Xil_IsValidHexChar(const char *Ch);

/**< Validate the input string contains only hexadecimal characters */
uint32_t Xil_ValidateHexStr(const char *HexStr);

/**< Convert string to hex numbers in little enidian format */
uint32_t Xil_ConvertStringToHexLE(const char *Str, uint8_t *Buf, uint32_t Len);

/**< Returns length of the input string */
uint32_t Xil_Strnlen(const char *Str, uint32_t MaxLen);

/**< Convert string to hex numbers in big endian format */
uint32_t Xil_ConvertStringToHexBE(const char *Str, uint8_t *Buf, uint32_t Len);

/**< Copies source string to destination string */
s32 Xil_Strcpy(char *DestPtr, const char *SrcPtr, const uint32_t Size);

/**< Copies specified range from source string to destination string */
s32 Xil_StrCpyRange(const uint8_t *Src, uint8_t *Dest, uint32_t From, uint32_t To, uint32_t MaxSrcLen,
		    uint32_t MaxDstLen);

/**< Appends string2 to string1 */
s32 Xil_Strcat(char *Str1Ptr, const char *Str2Ptr, const uint32_t Size);

/**< Compares Len bytes from memory1 and memory2 */
s32 Xil_MemCmp(const void *Buf1Ptr, const void *Buf2Ptr, uint32_t Len);

#ifdef __cplusplus
}
#endif

#endif	/* XIL_UTIL_H_ */
/**
* @} End of "addtogroup common_utilities".
*/
