#ifndef __V_FBWR_H_
#define __V_FBWR_H_

#include "xl_params.h"
#include "xl_interrupt_wrap.h"
#include "xv_frmbufwr_l2.h"
#include "xl_vidc.h"
#include "_pl_addresses.h"

#define XINTERRUPT_DEFAULT_PRIORITY 0xA0U
int V_FBWR_Init(void);
int V_FBWR_SetupInterrupts(void);
int V_FBWR_SetCallback(void);
uint32_t V_FBWR_CalcStride(XL_VidC_ColorFormat Cfmt,
                            uint16_t AXIMMDataWidth,
                            XL_VidC_VideoStream *StreamPtr);
int V_FBWR_ConfigBuf(uint32_t StrideInBytes,
                       XL_VidC_ColorFormat Cfmt,
                       XL_VidC_VideoStream *StreamPtr);

#endif