#ifndef __V_FBRD_H_
#define __V_FBRD_H_

#include "xl_params.h"
#include "xl_interrupt_wrap.h"
#include "xv_frmbufrd_l2.h"
#include "xl_vidc.h"
#include "_pl_addresses.h"

#define XINTERRUPT_DEFAULT_PRIORITY     0xA0

int V_FBRD_Init(void);
int V_FBRD_SetupInterrupts(void);
int V_FBRD_SetCallback(void);
uint32_t V_FBRD_CalcStride(XL_VidC_ColorFormat Cfmt,
                            uint16_t AXIMMDataWidth,
                            XL_VidC_VideoStream *StreamPtr);
int V_FBRD_ConfigBuf(uint32_t StrideInBytes,
                       XL_VidC_ColorFormat Cfmt,
                       XL_VidC_VideoStream *StreamPtr);
#endif
