#ifndef __V_GPIO_H_
#define __V_GPIO_H_

#include "xparameters.h"
#include "platform.h"
#include "sleep.h"
#include "xgpiops.h"

#define   GPIO_FB_RD            54;
#define   GPIO_FB_WR            55;
#define   GPIO_TPG              56;

int V_GPIO_Init(void);

#endif