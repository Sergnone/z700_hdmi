#ifndef __V_TPG_H_
#define __V_TPG_H_

#include "xl_params.h"
#include "xl_status.h"
#include "xl_tpg.h"
#include "xl_vidc.h"

int V_TPG_Init(void);
uint16_t V_TPG_Start(XL_VidC_VideoMode videoMode);
uint16_t V_TPG_ConfigStream(XL_VidC_VideoStream *StreamPtr);
int V_TPG_Clock_Config(XL_VidC_VideoMode videoMode);

#endif