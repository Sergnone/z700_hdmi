/******************************************************************************
* Copyright (c) 2002 - 2021 Xilinx, Inc.  All rights reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

/**
 *@cond nocomments
 */

#ifndef XL_ENV_H /* prevent circular inclusions */
#define XL_ENV_H /* by using protection macros */

#ifdef __cplusplus
extern "C" {
#endif


#include "xl_env_standalone.h"



/*
 * The following comments specify the types and macro wrappers that are
 * expected to be defined by the target specific header files
 */

/**************************** Type Definitions *******************************/

/*****************************************************************************/
/**
 *
 * XENV_TIME_STAMP
 *
 * A structure that contains a time stamp used by other time stamp macros
 * defined below. This structure is processor dependent.
 */


/***************** Macros (Inline Functions) Definitions *********************/

/*****************************************************************************/
/**
 *
 * XENV_MEM_COPY(void *DestPtr, void *SrcPtr, unsigned Bytes)
 *
 * Copies a non-overlapping block of memory.
 *
 * @param   DestPtr is the destination address to copy data to.
 * @param   SrcPtr is the source address to copy data from.
 * @param   Bytes is the number of bytes to copy.
 *
 * @return  None
 */

/*****************************************************************************/
/**
 *
 * XENV_MEM_FILL(void *DestPtr, char Data, unsigned Bytes)
 *
 * Fills an area of memory with constant data.
 *
 * @param   DestPtr is the destination address to set.
 * @param   Data contains the value to set.
 * @param   Bytes is the number of bytes to set.
 *
 * @return  None
 */
/*****************************************************************************/
/**
 *
 * XENV_TIME_STAMP_GET(XTIME_STAMP *StampPtr)
 *
 * Samples the processor's or external timer's time base counter.
 *
 * @param   StampPtr is the storage for the retrieved time stamp.
 *
 * @return  None
 */

/*****************************************************************************/
/**
 *
 * XENV_TIME_STAMP_DELTA_US(XTIME_STAMP *Stamp1Ptr, XTIME_STAMP* Stamp2Ptr)
 *
 * Computes the delta between the two time stamps.
 *
 * @param   Stamp1Ptr - First sampled time stamp.
 * @param   Stamp1Ptr - Sedond sampled time stamp.
 *
 * @return  An unsigned int value with units of microseconds.
 */

/*****************************************************************************/
/**
 *
 * XENV_TIME_STAMP_DELTA_MS(XTIME_STAMP *Stamp1Ptr, XTIME_STAMP* Stamp2Ptr)
 *
 * Computes the delta between the two time stamps.
 *
 * @param   Stamp1Ptr - First sampled time stamp.
 * @param   Stamp1Ptr - Sedond sampled time stamp.
 *
 * @return  An unsigned int value with units of milliseconds.
 */

/*****************************************************************************//**
 *
 * XENV_USLEEP(unsigned delay)
 *
 * Delay the specified number of microseconds.
 *
 * @param   delay is the number of microseconds to delay.
 *
 * @return  None
 */

#ifdef __cplusplus
}
#endif

#endif            /* end of protection macro */

/**
 *@endcond
 */
