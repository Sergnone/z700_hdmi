#include "v_fb_wr.h"

XV_FrmbufWr_l2     frmbufwr;
XV_frmbufwr_Config frmbufwr_cfg;



/*--------------------------------------------------------------------------------*/
void *XVFrameBufferWrCallback(void *data)
{
    xil_printf("\nFrame Buffer Write interrupt received.\r\n");
    XVFrmbufWr_Start(&frmbufwr);
}

/*--------------------------------------------------------------------------------*/
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

/*--------------------------------------------------------------------------------*/
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

/*--------------------------------------------------------------------------------*/
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
    xil_printf("FBWR: Setup Interrupts OK\r\n");
    return(XST_SUCCESS);
#endif
}

/*--------------------------------------------------------------------------------*/
int V_FBWR_SetCallback(void)
{
    XVFrmbufWr_SetCallback(&frmbufwr,
                        XVFRMBUFWR_HANDLER_DONE,
                        XVFrameBufferWrCallback,
		                    (void *)&frmbufwr);
    xil_printf("FBWR: Set Callbacks OK\r\n");
    return(XST_SUCCESS);
}
/*--------------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------*/
uint32_t V_FBWR_CalcStride(XVidC_ColorFormat Cfmt,
                            u16 AXIMMDataWidth,
                            XVidC_VideoStream *StreamPtr)
{
  u32 stride;
  int width = StreamPtr->Timing.HActive;
  u16 MMWidthBytes = AXIMMDataWidth/8;
  u8 bpp_numerator;
  u8 bpp_denominator = 1;

  switch (Cfmt) {
    case XVIDC_CSF_MEM_Y_UV10:
    case XVIDC_CSF_MEM_Y_UV10_420:
    case XVIDC_CSF_MEM_Y10:
      /* 4 bytes per 3 pixels (Y_UV10, Y_UV10_420, Y10) */
      bpp_numerator = 4;
      bpp_denominator = 3;
      break;
    case XVIDC_CSF_MEM_Y_UV8:
    case XVIDC_CSF_MEM_Y_UV8_420:
    case  XVIDC_CSF_MEM_Y8:
    case  XVIDC_CSF_MEM_Y_U_V8:
	case  XVIDC_CSF_MEM_Y_U_V10:
      /* 1 byte per pixel (Y_UV8, Y_UV8_420, Y8, Y_U_V10) */
      bpp_numerator = 1;
      break;
    case XVIDC_CSF_MEM_RGB8:
    case  XVIDC_CSF_MEM_YUV8:
    case XVIDC_CSF_MEM_BGR8:
      /* 3 bytes per pixel (RGB8, YUV8, BGR8) */
      bpp_numerator = 3;
      break;
    case XVIDC_CSF_MEM_RGBX12:
    case  XVIDC_CSF_MEM_YUVX12:
      /* 5 bytes per pixel (RGBX12, YUVX12) */
      bpp_numerator = 5;
      break;
    case XVIDC_CSF_MEM_Y_UV12:
    case  XVIDC_CSF_MEM_Y_UV12_420:
    case XVIDC_CSF_MEM_Y12:
      /* 3 bytes per 2 pixels (Y_UV12, Y_UV12_420, Y12) */
      bpp_numerator = 3;
      bpp_denominator = 2;
      break;
    case XVIDC_CSF_MEM_RGB16:
    case XVIDC_CSF_MEM_YUV16:
      /* 6 bytes per pixel (RGB16, YUV16) */
      bpp_numerator = 6;
      break;
    case XVIDC_CSF_MEM_YUYV8:
    case XVIDC_CSF_MEM_UYVY8:
    case XVIDC_CSF_MEM_Y_UV16:
    case XVIDC_CSF_MEM_Y_UV16_420:
    case XVIDC_CSF_MEM_Y16:
      /* 2 bytes per pixel (YUYV8, UYVY8, Y_UV16, Y_UV16_420, Y16) */
      bpp_numerator = 2;
      break;
    default:
      /* 4 bytes per pixel */
      bpp_numerator = 4;
  }
  stride = ((((width * bpp_numerator) / bpp_denominator) +
    MMWidthBytes - 1) / MMWidthBytes) * MMWidthBytes;

  return(stride);
}


/*--------------------------------------------------------------------------------*/
int V_FBWR_ConfigBuf(u32 StrideInBytes,
                        XVidC_ColorFormat Cfmt,
                        XVidC_VideoStream *StreamPtr)
{
  int Status;
  /* Stop Frame Buffers */
  //XVFrmbufRd_Stop(&frmbufrd);
  //XVFrmbufWr_Stop(&frmbufwr);
  //resetIp();
  XVFrmbufWr_WaitForIdle(&frmbufwr);
  //XVFrmbufRd_WaitForIdle(&frmbufrd);
  Status = XVFrmbufWr_SetMemFormat(&frmbufwr, StrideInBytes, Cfmt, StreamPtr);
  if (Status != XST_SUCCESS) {
    xil_printf("ERROR:: Unable to configure Frame Buffer Write\r\n");
    return(XST_FAILURE);
  }

  Status = XVFrmbufWr_SetBufferAddr(&frmbufwr, XVFRMBUFRD_BUFFER_BASEADDR);
  if (Status != XST_SUCCESS) {
    xil_printf("ERROR:: Unable to configure Frame Buffer Write buffer address\r\n");
    return(XST_FAILURE);
  }
  /* Set Chroma Buffer Address for semi-planar color formats */
  if ((Cfmt == XVIDC_CSF_MEM_Y_UV8) || (Cfmt == XVIDC_CSF_MEM_Y_UV8_420) ||
      (Cfmt == XVIDC_CSF_MEM_Y_UV10) || (Cfmt == XVIDC_CSF_MEM_Y_UV10_420) ||
      (Cfmt == XVIDC_CSF_MEM_Y_UV12) || (Cfmt == XVIDC_CSF_MEM_Y_UV12_420) ||
      (Cfmt == XVIDC_CSF_MEM_Y_UV16) || (Cfmt == XVIDC_CSF_MEM_Y_UV16_420) ||
      (Cfmt == XVIDC_CSF_MEM_Y_U_V8) || (Cfmt == XVIDC_CSF_MEM_Y_U_V10) ||
      (Cfmt == XVIDC_CSF_MEM_Y_U_V8_420)) {
	  Status = XVFrmbufWr_SetChromaBufferAddr(&frmbufwr, XVFRMBUFWR_BUFFER_BASEADDR+CHROMA_ADDR_OFFSET);
	  if (Status != XST_SUCCESS) {
		  xil_printf("ERROR:: Unable to configure Frame Buffer Write chroma buffer address\r\n");
		  return(XST_FAILURE);
	  }
  }

  /* Set V Buffer Address for 3 planar color formats */
  if ((Cfmt == XVIDC_CSF_MEM_Y_U_V8) || (Cfmt == XVIDC_CSF_MEM_Y_U_V10) || (Cfmt == XVIDC_CSF_MEM_Y_U_V8_420)) {
	  Status = XVFrmbufWr_SetVChromaBufferAddr(&frmbufwr, XVFRMBUFWR_BUFFER_BASEADDR+V_CHROMA_ADDR_OFFSET);
	  if (Status != XST_SUCCESS) {
		  xil_printf("ERROR:: Unable to configure Frame Buffer Write V buffer address\r\n");
		  return(XST_FAILURE);
	  }
  }

  /* Enable Interrupt */
  //XVFrmbufRd_InterruptEnable(&frmbufrd, XVFRMBUFRD_IRQ_DONE_MASK);
  //XVFrmbufWr_InterruptEnable(&frmbufwr, XVFRMBUFWR_IRQ_DONE_MASK);

  XV_frmbufwr_EnableAutoRestart(&frmbufwr.FrmbufWr);
  /* Start Frame Buffers */
  XVFrmbufWr_Start(&frmbufwr);
  //XVFrmbufRd_Start(&frmbufrd);
  xil_printf("FBWR: Configured OK\r\n");
  return(Status);
}