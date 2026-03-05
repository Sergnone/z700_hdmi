#ifndef __V_TPG_H_
#define __V_TPG_H_

#include "xparameters.h"
#include "sleep.h"
#include "xv_tpg.h"
#include "xvidc.h"

int V_TPG_Init(void);
uint16_t V_TPG_Start(XVidC_VideoMode videoMode);
uint16_t V_TPG_ConfigStream(XVidC_VideoStream *StreamPtr);
int V_TPG_Clock_Config(XVidC_VideoMode videoMode);

#endif