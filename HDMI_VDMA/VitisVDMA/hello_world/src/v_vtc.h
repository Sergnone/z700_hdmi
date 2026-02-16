#ifndef __V_VTC_H_
#define __V_VTC_H_

#include "xparameters.h"
#include "sleep.h"
#include "xvidc.h"
#include "xvtc.h"

int V_VTC_Init(void);
void V_VTC_Config(XVidC_VideoMode videoMode, uint32_t pixClock);
void V_VTC_ConfigStream(XVidC_VideoStream *StreamPtr);

#endif