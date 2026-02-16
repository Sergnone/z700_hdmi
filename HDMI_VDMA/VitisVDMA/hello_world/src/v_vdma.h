#ifndef __V_TPG_H_
#define __V_TPG_H_

#include "xparameters.h"
#include "sleep.h"
#include "xaxivdma.h"
#include "xvidc.h"

int V_VDMA_Init(void);
int V_DMA_ConfigStream(XAxiVdma_DmaSetup *vDmaSetup,
						XVidC_VideoStream *vidStream,
						uint32_t *framePtr);
#endif