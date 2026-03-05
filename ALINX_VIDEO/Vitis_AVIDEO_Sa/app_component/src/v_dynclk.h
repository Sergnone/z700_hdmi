#ifndef __V_DDYNCLK_H_
#define __V_DDYNCLK_H_

#include "ddynclk.h"

#define DYNCLK_BASEADDR XPAR_DYNCLK_0_S_AXI_LITE_BASEADDR 

int V_DDYNCLK_Init(void);
int V_DDYNCLK_Start(uint32_t pixelrate);

#endif /* DYNCLK_H_ */
