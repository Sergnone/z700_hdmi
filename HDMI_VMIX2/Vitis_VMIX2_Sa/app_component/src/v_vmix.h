#ifndef __V_VMIX_H_
#define __V_VMIX_H_

#include "xparameters.h"
#include "xstatus.h"
#include "xv_mix_l2.h"
#include "xvidc.h"
#include "xv_mix.h"
#include "_pl_addresses.h"

int V_VMIX_Init(XV_Mix_l2 *vmixer, uint32_t bAddress);
void V_VMIX_ConfigStream(XVidC_VideoStream *StreamPtr);

#endif