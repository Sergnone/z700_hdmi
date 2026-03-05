#ifndef __V_VMIX_H_
#define __V_VMIX_H_

#include "xparameters.h"
#include "xstatus.h"
#include "xv_mix_l2.h"
#include "xvidc.h"
#include "_pl_addresses.h"

int V_VMIX_Init(void);
void V_VMIX_ConfigStream(XVidC_VideoStream *StreamPtr);
//uint16_t V_TPG_Start(XVidC_VideoMode videoMode);
//uint16_t V_TPG_ConfigStream(XVidC_VideoStream *StreamPtr);
//int V_TPG_Clock_Config(XVidC_VideoMode videoMode);

#endif