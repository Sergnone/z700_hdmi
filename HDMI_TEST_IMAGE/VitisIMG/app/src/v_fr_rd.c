#include "v_fr_rd.h"


XV_FrmbufRd_l2     frmbufrd;
XV_frmbufrd_Config frmbufrd_cfg;

int V_FR_RD_Init(void)
{
    int Status = -1;
#ifndef SDT
    Status = XVFrmbufRd_Initialize(&frmbufrd, XPAR_V_FRMBUF_RD_0_DEVICE_ID);
#else
    Status = XVFrmbufRd_Initialize(&frmbufrd, XPAR_V_FRMBUF_RD_0_BASEADDR);
#endif
    if (Status != XST_SUCCESS) {
        xil_printf("ERROR:: Frame Buffer Read initialization failed\r\n");
        return(XST_FAILURE);
    }
    return(XST_SUCCESS);
}


int V_FR_RD_InitInterrupts(void)
{
    int Status = -1;
#ifndef SDT
    Status = SetupInterrupts();
    if (Status == XST_FAILURE) {
        xil_printf("ERROR:: Interrupt Setup Failed\r\n");
        xil_printf("ERROR:: Test could not be completed\r\n");
        return(1);
    }
#else
    Status = XSetupInterruptSystem(&frmbufrd,&XVFrmbufRd_InterruptHandler,
				       frmbufrd.FrmbufRd.Config.IntrId,
				       frmbufrd.FrmbufRd.Config.IntrParent,
				       XINTERRUPT_DEFAULT_PRIORITY);
    if (Status == XST_FAILURE) {
        xil_printf("ERROR:: frmbufrd Interrupt Setup Failed\r\n");
        xil_printf("ERROR:: Test could not be completed\r\n");
        return(1);
    }
#endif
    return(XST_SUCCESS);
}

