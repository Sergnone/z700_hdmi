#ifndef __V_VMIX_H_
#define __V_VMIX_H_

#include "xparameters.h"
#include "xstatus.h"
#include "xv_mix_l2.h"
#include "xvidc.h"
#include "xv_mix.h"
#include "_pl_addresses.h"

int V_VMIX_Init(XV_Mix_l2 *vmixer, uint32_t bAddress);
int V_VMIX_ConfigStream(XV_Mix_l2 *mixer, XVidC_VideoStream *StreamPtr);
int V_VMIX_SetupMixerLayer(XV_Mix_l2 *mixptr);
int setupMixer(XVidC_VideoStream *StreamPtr);
void V_VMIX_FillMemory(uintptr_t mAddr);
void V_VMIX_DrawImage(XV_Mix_l2 *MixerPtr, uintptr_t mAddr);

#endif