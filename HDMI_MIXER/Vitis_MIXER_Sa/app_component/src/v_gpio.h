#ifndef __V_GPIO_H_
#define __V_GPIO_H_

#include "xparameters.h"
#include "platform.h"
#include "sleep.h"
#include "xgpiops.h"

#define   GPIO_FB_RD            54;
#define   GPIO_FB_WR            55;
#define   GPIO_TPG_0            56;
#define   GPIO_TPG_1            57;

int V_GPIO_Init(XGpioPs *xGpio, uint32_t bAddress);
void V_GPIO_Set(XGpioPs *xGpio, uint32_t oPin, uint32_t oLev);
void V_GPIO_SetupIp(XGpioPs *xGpio);
void V_GPIO_ResetIp(XGpioPs *xGpio);

#endif
