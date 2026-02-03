#ifndef __V_FR_RD_H_
#define __V_FR_RD_H_

#include "xparameters.h"
#include "platform.h"
#include "sleep.h"
#ifndef SDT
#if defined(__MICROBLAZE__) || defined(__riscv)
#include "xintc.h"
#else
#include "xscugic.h"
#endif
#else
#include "xinterrupt_wrap.h"
#endif
#include "xv_frmbufrd_l2.h"
#include "xvidc.h"
#include "xvtc.h"
#include "xgpio.h"


int V_FR_RD_Init(void);
int V_FR_RD_InitInterrupts(void);

#endif