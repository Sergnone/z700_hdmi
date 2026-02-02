
#ifndef DISPLAY_DEMO_H_
#define DISPLAY_DEMO_H_

#include "xil_types.h"

/* ------------------------------------------------------------ */
/*					Miscellaneous Declarations					*/
/* ------------------------------------------------------------ */

#define DEMO_PATTERN_0 0
#define DEMO_PATTERN_1 1
#define DEMO_PATTERN_2 2
#define DEMO_PATTERN_3 3

#define BYTES_PIXEL 3

#define DISPLAY_WIDTH           1920
#define DISPLAY_HEIGHT          1080

#define DISPLAY_MAX_FRAME (DISPLAY_WIDTH*DISPLAY_HEIGHT*BYTES_PIXEL)
#define DISPLAY_STRIDE (DISPLAY_WIDTH * BYTES_PIXEL)

/* ------------------------------------------------------------ */
/*					Procedure Declarations						*/
/* ------------------------------------------------------------ */

void DemoInitialize();
void DemoPrintTest(u8 *frame, u32 width, u32 height, u32 stride, int pattern);

/* ------------------------------------------------------------ */

/************************************************************************/

#endif /* DISPLAY_DEMO_H_ */