#include "stdint.h"
#include "stdbool.h"
#include "xv_tpg.h"
#include "sleep.h"
#include "xparameters.h"

#include "ddynclk.h"
#include "display_ctrl.h"


#define BYTES_PIXEL 3

#define DISPLAY_WIDTH           1920
#define DISPLAY_HEIGHT          1080

#define DEMO_MAX_FRAME (DISPLAY_WIDTH*DISPLAY_HEIGHT*BYTES_PIXEL)
#define DEMO_STRIDE (DISPLAY_WIDTH * BYTES_PIXEL)

#define DYNCLK_BASEADDR XPAR_AXI_DYNCLK_0_BASEADDR
#define VGA_VDMA_ID 0
#define DISP_VTC_ID 0

XV_tpg tpg;

DisplayCtrl dispCtrl;

/*
 * Framebuffers for video data
 */
u8 frameBuf[DISPLAY_NUM_FRAMES][DEMO_MAX_FRAME] __attribute__ ((aligned(64)));
u8 *pFrames[DISPLAY_NUM_FRAMES]; //array of pointers to the frame buffers

 
int main()
{
    int Status = 0;
    int i = 0;
    int pattern = 9;

	for (i = 0; i < DISPLAY_NUM_FRAMES; i++)
	{
		pFrames[i] = frameBuf[i];
	}
    
	Status = DisplayInitialize(&dispCtrl, DISP_VTC_ID, DYNCLK_BASEADDR, pFrames, DEMO_STRIDE);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Display Ctrl initialization failed during demo initialization%d\r\n", Status);

	}
	Status = DisplayStart(&dispCtrl);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Couldn't start display during demo initialization%d\r\n", Status);
	}

    printf("------Display Started--------------\r\n");
    XV_tpg_Initialize(&tpg, 0);
 
    XV_tpg_Set_width(&tpg, 1920);
    XV_tpg_Set_height(&tpg, 1080);
 
    XV_tpg_Set_ZplateHorContDelta(&tpg, 2);
    XV_tpg_Set_ZplateHorContStart(&tpg, 2);
    XV_tpg_Set_ZplateVerContDelta(&tpg, 2);
    XV_tpg_Set_ZplateVerContStart(&tpg, 2);
 
    XV_tpg_Set_motionSpeed(&tpg, 2);
    XV_tpg_Set_motionEn(&tpg, 1);
 
    XV_tpg_EnableAutoRestart(&tpg);
    XV_tpg_Start(&tpg);

    
    print("Successfully ran TPG application\r\n");


    XV_tpg_Set_bckgndId(&tpg, pattern);
    
    /*
    while(true)
    {
        XV_tpg_Set_bckgndId(&tpg, pattern);
 
        if(++pattern > 19)
        {
            pattern = 1;
        }

        usleep(5000000);

        print("Change pattern\r\n");
    }
    */

    return 0;
}
