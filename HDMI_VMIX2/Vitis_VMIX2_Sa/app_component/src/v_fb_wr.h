#ifndef __V_FBWR_H_
#define __V_FBWR_H_

#include "xparameters.h"
#include "platform.h"
#include "sleep.h"
#ifndef SDT
#if defined(__MICROBLAZE__) || defined(__riscv)
#include "xintc.h"
#else
#include "xscugic.h"
#endif
#else
#include "xinterrupt_wrap.h"
#endif
#include "xv_frmbufwr_l2.h"
#include "xvidc.h"
#include "_pl_addresses.h"


int V_FBWR_Init(void);
int V_FBWR_SetupInterrupts(void);
int V_FBWR_SetCallback(void);
uint32_t V_FBWR_CalcStride(XVidC_ColorFormat Cfmt,
                            u16 AXIMMDataWidth,
                            XVidC_VideoStream *StreamPtr);
int V_FBWR_ConfigBuf(u32 StrideInBytes,
                       XVidC_ColorFormat Cfmt,
                       XVidC_VideoStream *StreamPtr);

#endif