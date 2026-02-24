/******************************************************************************
* Copyright (C) 2014 - 2021 Xilinx, Inc.  All rights reserved.
* Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

#ifndef XL_IO_H           /**< prevent circular inclusions */
#define XL_IO_H           /**< by using protection macros */

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/

//#include "xil_types.h"
//#include "xil_printf.h"
#include "xl_status.h"
#include "xl_pseudo_asm.h"

/************************** Function Prototypes ******************************/
#ifdef ENABLE_SAFETY
extern u32 XStl_RegUpdate(u32 RegAddr, u32 RegVal);
#endif

/***************** Macros (Inline Functions) Definitions *********************/
#if defined __GNUC__
#if defined (__MICROBLAZE__)
#  define INST_SYNC		mbar(0) /**< Instruction Synchronization Barrier */
#  define DATA_SYNC		mbar(1) /**<  Data Synchronization Barrier  */
# else
#  define SYNCHRONIZE_IO	dmb() /**< Data Memory Barrier */
#  define INST_SYNC		isb() /**< Instruction Synchronization Barrier */
#  define DATA_SYNC		dsb() /**<  Data Synchronization Barrier  */
# endif
#else
# define SYNCHRONIZE_IO /**< Data Memory Barrier */
# define INST_SYNC /**< Instruction Synchronization Barrier */
# define DATA_SYNC /**<  Data Synchronization Barrier  */
# define INST_SYNC /**< Instruction Synchronization Barrier */
# define DATA_SYNC /**<  Data Synchronization Barrier  */
#endif

#if defined (__GNUC__) || defined (__ICCARM__) || defined (__MICROBLAZE__)
#define INLINE inline /**< static inline keyword */
#else
#define INLINE __inline /**<static inline keyword */
#endif

/*****************************************************************************/
/**
*
* @brief    Performs an input operation for a memory location by reading
*           from the specified address and returning the 8 bit Value read from
*            that address.
*
* @param	Addr contains the address to perform the input operation
*
* @return	The 8 bit Value read from the specified input address.

*
******************************************************************************/
static INLINE u8 Xl_In8(UINTPTR Addr)
{
	return *(volatile u8 *) Addr;
}

/*****************************************************************************/
/**
*
* @brief    Performs an input operation for a memory location by reading from
*           the specified address and returning the 16 bit Value read from that
*           address.
*
* @param	Addr contains the address to perform the input operation
*
* @return	The 16 bit Value read from the specified input address.
*
******************************************************************************/
static INLINE u16 Xl_In16(UINTPTR Addr)
{
	return *(volatile u16 *) Addr;
}

/*****************************************************************************/
/**
*
* @brief    Performs an input operation for a memory location by
*           reading from the specified address and returning the 32 bit Value
*           read  from that address.
*
* @param	Addr contains the address to perform the input operation
*
* @return	The 32 bit Value read from the specified input address.
*
******************************************************************************/
static INLINE u32 Xl_In32(UINTPTR Addr)
{
	return *(volatile u32 *) Addr;
}

/*****************************************************************************/
/**
*
* @brief     Performs an input operation for a memory location by reading the
*            64 bit Value read  from that address.
*
*
* @param	Addr contains the address to perform the input operation
*
* @return	The 64 bit Value read from the specified input address.
*
******************************************************************************/
static INLINE u64 Xl_In64(UINTPTR Addr)
{
	return *(volatile u64 *) Addr;
}

/*****************************************************************************/
/**
*
* @brief    Performs an output operation for an memory location by
*           writing the 8 bit Value to the the specified address.
*
* @param	Addr contains the address to perform the output operation
* @param	Value contains the 8 bit Value to be written at the specified
*           address.
*
* @return	None.
*
******************************************************************************/
static INLINE void Xl_Out8(UINTPTR Addr, u8 Value)
{
	/* write 8 bit value to specified address */
	volatile u8 *LocalAddr = (volatile u8 *)Addr;
	*LocalAddr = Value;
}

/*****************************************************************************/
/**
*
* @brief    Performs an output operation for a memory location by writing the
*            16 bit Value to the the specified address.
*
* @param	Addr contains the address to perform the output operation
* @param	Value contains the Value to be written at the specified address.
*
* @return	None.
*
******************************************************************************/
static INLINE void Xl_Out16(UINTPTR Addr, u16 Value)
{
	/* write 16 bit value to specified address */
	volatile u16 *LocalAddr = (volatile u16 *)Addr;
	*LocalAddr = Value;
}

/*****************************************************************************/
/**
*
* @brief    Performs an output operation for a memory location by writing the
*           32 bit Value to the the specified address.
*
* @param	Addr contains the address to perform the output operation
* @param	Value contains the 32 bit Value to be written at the specified
*           address.
*
* @return	None.
*
******************************************************************************/
static INLINE void Xl_Out32(UINTPTR Addr, u32 Value)
{
	/* write 32 bit value to specified address */
#ifndef ENABLE_SAFETY
	volatile u32 *LocalAddr = (volatile u32 *)Addr;
	*LocalAddr = Value;
#else
	XStl_RegUpdate(Addr, Value);
#endif
}

/*****************************************************************************/
/**
*
* @brief    Performs an output operation for a memory location by writing the
*           64 bit Value to the the specified address.
*
* @param	Addr contains the address to perform the output operation
* @param	Value contains 64 bit Value to be written at the specified address.
*
* @return	None.
*
******************************************************************************/
static INLINE void Xl_Out64(UINTPTR Addr, u64 Value)
{
	/* write 64 bit value to specified address */
	volatile u64 *LocalAddr = (volatile u64 *)Addr;
	*LocalAddr = Value;
}

/*****************************************************************************/
/**
 *
 * @brief	Performs an output operation for a memory location by writing the
 *       	32 bit Value to the the specified address and then reading it
 *       	back to verify the value written in the register.
 *
 * @param	Addr contains the address to perform the output operation
 * @param	Value contains 32 bit Value to be written at the specified address
 *
 * @return	Returns Status
 *        	- XST_SUCCESS on success
 *        	- XST_FAILURE on failure
 *
 *****************************************************************************/
static INLINE int Xl_SecureOut32(UINTPTR Addr, u32 Value)
{
	int Status = XST_FAILURE;
	u32 ReadReg;
	u32 ReadRegTemp;

	/* writing 32 bit value to specified address */
	Xl_Out32(Addr, Value);

	/* verify value written to specified address with multiple reads */
	ReadReg = Xl_In32(Addr);
	ReadRegTemp = Xl_In32(Addr);

	if( (ReadReg == Value) && (ReadRegTemp == Value) ) {
		Status = XST_SUCCESS;
	}

	return Status;
}

/*****************************************************************************/
/**
*
* @brief    Perform a 16-bit endian conversion.
*
* @param	Data 16 bit value to be converted
*
* @return	16 bit Data with converted endianness
*
******************************************************************************/
static INLINE __attribute__((always_inline)) u16 Xl_EndianSwap16(u16 Data)
{
	return (u16) (((Data & 0xFF00U) >> 8U) | ((Data & 0x00FFU) << 8U));
}

/*****************************************************************************/
/**
*
* @brief    Perform a 32-bit endian conversion.
*
* @param	Data : 32 bit value to be converted
*
* @return	32 bit data with converted endianness
*
******************************************************************************/
static INLINE __attribute__((always_inline)) u32 Xl_EndianSwap32(u32 Data)
{
	u16 LoWord;
	u16 HiWord;

	/* get each of the half words from the 32 bit word */

	LoWord = (u16) (Data & 0x0000FFFFU);
	HiWord = (u16) ((Data & 0xFFFF0000U) >> 16U);

	/* byte swap each of the 16 bit half words */

	LoWord = (u16)(((LoWord & 0xFF00U) >> 8U) | ((LoWord & 0x00FFU) << 8U));
	HiWord = (u16)(((HiWord & 0xFF00U) >> 8U) | ((HiWord & 0x00FFU) << 8U));

	/* swap the half words before returning the value */

	return ((((u32)LoWord) << (u32)16U) | (u32)HiWord);
}

#if defined (__MICROBLAZE__)
#ifdef __LITTLE_ENDIAN__
# define Xl_In16LE	Xl_In16 /**< Register Read of 16 Bits in Little Endian */
# define Xl_In32LE	Xl_In32 /**< Register Read of 32 Bits in Little Endian */
# define Xl_Out16LE	Xl_Out16 /**< Register Write of 16 Bits in Little Endian */
# define Xl_Out32LE	Xl_Out32 /**< Register Write of 32 Bits in Little Endian */
# define Xl_Htons	Xl_EndianSwap16 /**< Endian swap of 16 bits */
# define Xl_Htonl	Xl_EndianSwap32 /**< Endian swap of 32 bits */
# define Xl_Ntohs	Xl_EndianSwap16 /**< Endian swap of 16 bits */
# define Xl_Ntohl	Xl_EndianSwap32 /**< Endian swap of 32 bits */
# else
# define Xl_In16BE	Xl_In16 /**< Register Read of 16 Bits in Big Endian */
# define Xl_In32BE	Xl_In32 /**< Register Read of 32 Bits in Big Endian */
# define Xl_Out16BE	Xl_Out16 /**< Register Write of 16 Bits in Big Endian */
# define Xl_Out32BE	Xl_Out32 /**< Register Write of 32 Bits in Big Endian */
# define Xl_Htons(Data) (Data) /**< Endian swap of 16 bits */
# define Xl_Htonl(Data) (Data) /**< Endian swap of 32 bits */
# define Xl_Ntohs(Data) (Data) /**< Endian swap of 16 bits */
# define Xl_Ntohl(Data) (Data) /**< Endian swap of 32 bits */
#endif
#else
# define Xl_In16LE	Xl_In16 /**< Register Read of 16 Bits in Little Endian */
# define Xl_In32LE	Xl_In32 /**< Register Read of 32 Bits in Little Endian */
# define Xl_Out16LE	Xl_Out16 /**< Register Write of 16 Bits in Little Endian */
# define Xl_Out32LE	Xl_Out32 /**< Register Write of 32 Bits in Little Endian */
# define Xl_Htons	Xl_EndianSwap16 /**< Endian swap of 16 bits */
# define Xl_Htonl	Xl_EndianSwap32 /**< Endian swap of 32 bits */
# define Xl_Ntohs	Xl_EndianSwap16 /**< Endian swap of 16 bits */
# define Xl_Ntohl	Xl_EndianSwap32 /**< Endian swap of 32 bits */
#endif

#if defined (__MICROBLAZE__)
#ifdef __LITTLE_ENDIAN__
static INLINE u16 Xl_In16BE(UINTPTR Addr) /**< Static inline function to Read
                                                Register of 16 Bits in Big Endian */
#else
static INLINE u16 Xl_In16LE(UINTPTR Addr) /**< Static inline function to Read
                                                Register of 16 Bits in Little Endian */
#endif
#else
/**
* Static inline function to Read Register of 16 Bits in Big Endian.
**********************************************************************************/
static INLINE u16 Xl_In16BE(UINTPTR Addr)
#endif
{
	u16 value = Xl_In16(Addr);
	return Xl_EndianSwap16(value);
}

#if defined (__MICROBLAZE__)
#ifdef __LITTLE_ENDIAN__
static INLINE u32 Xl_In32BE(UINTPTR Addr) /**< Static inline function to Read
                                                Register of 32 Bits in Big Endian */
#else
static INLINE u32 Xl_In32LE(UINTPTR Addr) /**< Static inline function to Read
                                                Register of 32 Bits in Little Endian */
#endif
#else
/**
* Static inline function to Read Register of 32 Bits in Big Endian.
**********************************************************************************/
static INLINE u32 Xl_In32BE(UINTPTR Addr)
#endif
{
	u32 value = Xl_In32(Addr);
	return Xl_EndianSwap32(value);
}

#if defined (__MICROBLAZE__)
#ifdef __LITTLE_ENDIAN__
static INLINE void Xl_Out16BE(UINTPTR Addr, u16 Value) /**< Static inline function to write
                                                Register of 16 Bits in Big Endian */
#else
static INLINE void Xl_Out16LE(UINTPTR Addr, u16 Value) /**< Static inline function to write
                                                Register of 16 Bits in Little Endian */
#endif
#else
/**
* Static inline function to write Register of 16 Bits in Big Endian.
**********************************************************************************/
static INLINE void Xl_Out16BE(UINTPTR Addr, u16 Value)
#endif
{
	Value = Xl_EndianSwap16(Value);
	Xl_Out16(Addr, Value);
}

#if defined (__MICROBLAZE__)
#ifdef __LITTLE_ENDIAN__
static INLINE void Xl_Out32BE(UINTPTR Addr, u32 Value) /**< Static inline function to write
                                                Register of 32 Bits in Big Endian */
#else
static INLINE void Xl_Out32LE(UINTPTR Addr, u32 Value) /**< Static inline function to write
                                                Register of 32 Bits in Little Endian */
#endif
#else
/**
* Static inline function to Read Register of 16 Bits in Big Endian.
**********************************************************************************/
static INLINE void Xl_Out32BE(UINTPTR Addr, u32 Value)
#endif
{
	Value = Xl_EndianSwap32(Value);
	Xl_Out32(Addr, Value);
}

#ifdef __cplusplus
}
#endif

#endif /* end of protection macro */
/**
* @} End of "addtogroup common_io_interfacing_apis".
*/
