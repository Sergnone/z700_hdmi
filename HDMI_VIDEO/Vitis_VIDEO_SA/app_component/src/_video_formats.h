#ifndef __V_VIDEO_FORMATS_H_
#define __V_VIDEO_FORMATS_H_

#include "xparameters.h"
#include "platform.h"
#include "sleep.h"
#include "xvidc.h"

#define NUM_TEST_MODES 4
#define NUM_TEST_FORMATS 29

//mapping between memory and streaming video formats
typedef struct {
  XVidC_ColorFormat MemFormat;
  XVidC_ColorFormat StreamFormat;
  u16 FormatBits;
} VideoFormats;


#endif
