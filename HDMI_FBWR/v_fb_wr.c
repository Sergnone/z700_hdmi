#include "v_fb_wr.h"

XV_FrmbufWr_l2     frmbufwr;
XV_frmbufwr_Config frmbufwr_cfg;


void *XVFrameBufferWrCallback(void *data)
{
	xil_printf("\nFrame Buffer Write interrupt received.\r\n");
    XVFrmbufWr_Start(&frmbufwr);
}




#ifndef SDT
static int SetupInterrupts(void)
{
#if defined(__MICROBLAZE__) || defined(__riscv)
    int Status = -1;
    XIntc *IntcPtr = &intc;

    /* Initialize the Interrupt controller */
    Status = XIntc_Initialize(IntcPtr,
                            XPAR_PROCESSOR_SS_PROCESSOR_AXI_INTC_DEVICE_ID);
    if (Status != XST_SUCCESS) {
        xil_printf("ERROR:: Interrupt controller device not found\r\n");
        return(XST_FAILURE);
    }
    Status = XIntc_Connect(IntcPtr,
                            XPAR_PROCESSOR_SS_PROCESSOR_AXI_INTC_V_FRMBUF_WR_0_INTERRUPT_INTR,
                            (XInterruptHandler)XVFrmbufWr_InterruptHandler,
                            &frmbufwr);
    if (Status != XST_SUCCESS) {
        xil_printf("ERROR:: FRMBUF WR interrupt connect failed!\r\n");
        return XST_FAILURE;
    }

    /* Enable the interrupt vector at the interrupt controller */
    XIntc_Enable(IntcPtr,
                XPAR_PROCESSOR_SS_PROCESSOR_AXI_INTC_V_FRMBUF_WR_0_INTERRUPT_INTR);

    /*
    * Start the interrupt controller such that interrupts are recognized
    * and handled by the processor
    */
    Status = XIntc_Start(IntcPtr, XIN_REAL_MODE);
    if (Status != XST_SUCCESS) {
        xil_printf("ERROR:: Failed to start interrupt controller\r\n");
        return XST_FAILURE;
    }

#else
    int Status = -1;
    XScuGic *IntcPtr = &intc;

    /* Initialize the Interrupt controller */
    XScuGic_Config *IntcCfgPtr;
    IntcCfgPtr = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);
    if (IntcCfgPtr == NULL)
    {
    print("ERR:: Interrupt Controller not found");
        return (XST_DEVICE_NOT_FOUND);
    }
    Status = XScuGic_CfgInitialize(IntcPtr,
                                    IntcCfgPtr,
                                    IntcCfgPtr->CpuBaseAddress);
    if (Status != XST_SUCCESS) {
        xil_printf("Intc initialization failed!\r\n");
        return XST_FAILURE;
    }

    /* Enable the interrupt vector at the interrupt controller */
    XScuGic_Enable(IntcPtr, XPAR_FABRIC_V_FRMBUF_RD_0_INTERRUPT_INTR);

    /* Connect interrupt service routine */
    Status |= XScuGic_Connect(IntcPtr,
                            XPAR_FABRIC_V_FRMBUF_WR_0_INTERRUPT_INTR,
                            (XInterruptHandler)XVFrmbufWr_InterruptHandler,
                            (void *)&frmbufwr);
    if (Status != XST_SUCCESS) {
        xil_printf("ERR:: Frame Buffer Write interrupt connect failed!\r\n");
        return XST_FAILURE;
    }

    /* Enable the interrupt vector at the interrupt controller */
    XScuGic_Enable(IntcPtr, XPAR_FABRIC_V_FRMBUF_WR_0_INTERRUPT_INTR);
#endif
  return(XST_SUCCESS);
}
#endif


int V_FBWR_Init(void)
{
    int Status = -1;
#ifndef SDT
    Status = XVFrmbufWr_Initialize(&frmbufwr, XPAR_V_FRMBUF_WR_0_DEVICE_ID);
#else
    Status = XVFrmbufWr_Initialize(&frmbufwr, XPAR_V_FRMBUF_WR_0_BASEADDR);
#endif
    if (Status != XST_SUCCESS) {
        xil_printf("ERROR:: Frame Buffer Write initialization failed\r\n");
        return(XST_FAILURE);
    }
	xil_printf("FBWR: Initialized OK\r\n");
    return(XST_SUCCESS);
}


int V_FBWR_SetupInterrupts(void)
{
    int Status = -1;
#ifndef SDT
    Status = SetupInterrupts();
    if (Status == XST_FAILURE) {
        xil_printf("ERROR:: Interrupt Setup Failed\r\n");
        xil_printf("ERROR:: Test could not be completed\r\n");
        return(1);
    }
    return(XST_SUCCESS);
#else
    Status = XSetupInterruptSystem(&frmbufwr,&XVFrmbufWr_InterruptHandler,
                        frmbufwr.FrmbufWr.Config.IntrId,
                        frmbufwr.FrmbufWr.Config.IntrParent,
                        XINTERRUPT_DEFAULT_PRIORITY);
    if (Status == XST_FAILURE) {
        xil_printf("ERROR:: frmbufwr Interrupt Setup Failed\r\n");
        xil_printf("ERROR:: Test could not be completed\r\n");
        return(1);
    }
    return(XST_SUCCESS);
#endif
}


int V_FBWR_SetCallnack(void)
{
    XVFrmbufWr_SetCallback(&frmbufwr,
                        XVFRMBUFWR_HANDLER_DONE,
                        XVFrameBufferWrCallback,
		                (void *)&frmbufwr);
    return(XST_SUCCESS);
}
