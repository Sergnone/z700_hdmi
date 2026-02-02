
#ifndef __MAIN_H_
#define __MAIN_H_

#define     V_TPG_ENABLE
#define     V_FB_RD_ENABLE
#define     V_FB_WR_ENABLE

#ifdef V_FB_RD_ENABLE
#include "xv_frmbufrd_l2.h"
#endif
#ifdef V_FB_WR_ENABLE
#include "xv_frmbufwr_l2.h"
#endif
#ifdef V_TPG_ENABLE
#include "xv_tpg.h"
#endif

#include "xvidc.h"
#include "xvtc.h"
#include "xgpio.h"

#endif