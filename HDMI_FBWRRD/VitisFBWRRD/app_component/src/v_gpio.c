#include "v_gpio.h"


#ifndef SDT
#ifndef GPIO_DEVICE_ID
#define GPIO_DEVICE_ID		XPAR_XGPIOPS_0_DEVICE_ID
#endif
#else
#define	XGPIOPS_BASEADDR	XPAR_XGPIOPS_0_BASEADDR
#endif


static u32 Input_Pin;
static u32 Output_Pin;

XGpioPs Gpio;

/****************************************************************************/
static int GpioInputExample(u32 *DataRead)
{

	/* Set the direction for the specified pin to be input. */
	XGpioPs_SetDirectionPin(&Gpio, Input_Pin, 0x0);
	/* Read the state of the data so that it can be  verified. */
	*DataRead = XGpioPs_ReadPin(&Gpio, Input_Pin);

	return XST_SUCCESS;
}
/****************************************************************************/
static int GpioOutputExample(void)
{
	XGpioPs_SetDirectionPin(&Gpio, Output_Pin, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, Output_Pin, 1);
	/* Set the GPIO output to be low. */
	XGpioPs_WritePin(&Gpio, Output_Pin, 0x1);
	return XST_SUCCESS;
}

/****************************************************************************/
#ifndef SDT
int GpioPolledExample(u16 DeviceId, u32 *DataRead)
#else
int GpioPolledExample(UINTPTR BaseAddress, u32 *DataRead)
#endif
{
	int Status;
	XGpioPs_Config *ConfigPtr;

	//Initialize the GPIO driver.
#ifndef SDT
	ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);
#else
	ConfigPtr = XGpioPs_LookupConfig(BaseAddress);
#endif
	//Input_Pin = 14;

	Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr,
				       ConfigPtr->BaseAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Output_Pin = GPIO_FB_RD;
	Status = GpioOutputExample();
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	Output_Pin = GPIO_FB_WR;
	Status = GpioOutputExample();
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	Output_Pin = GPIO_TPG;
	Status = GpioOutputExample();
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	//Status = GpioInputExample(DataRead);
	//if (Status != XST_SUCCESS) {
	//	return XST_FAILURE;
	//}
	return XST_SUCCESS;
}


int V_GPIO_Init(void)
{
	int Status = -1;
	u32 InputData;

	xil_printf("GPIO Polled Mode Example Test \r\n");
#ifndef SDT
	Status = GpioPolledExample(GPIO_DEVICE_ID, &InputData);
#else
	Status = GpioPolledExample(XGPIOPS_BASEADDR, &InputData);
#endif
	if (Status != XST_SUCCESS) {
		xil_printf("GPIO Polled Mode Example Test Failed\r\n");
		return XST_FAILURE;
	}

	xil_printf("Data read from GPIO Input is  0x%x \n\r", (int)InputData);
	xil_printf("Successfully ran GPIO Polled Mode Example Test\r\n");
	return XST_SUCCESS;
}
