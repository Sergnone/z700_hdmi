#ifndef __V_VTC_H_
#define __V_VTC_H_

#include "xl_params.h"
#include "xl_status.h"
#include "xl_vidc.h"
#include "xl_vtc.h"


int V_VTC_Init(void);
void V_VTC_Config(XL_VidC_VideoMode videoMode, uint16_t pixClock);
void V_VTC_ConfigStream(XL_VidC_VideoStream *StreamPtr);

#endif