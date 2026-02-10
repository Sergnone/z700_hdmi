#include "v_gpio.h"

/*
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

#ifndef SDT
int GpioPolledExample(u16 DeviceId, u32 *DataRead)
#else
int GpioPolledExample(UINTPTR BaseAddress, u32 *DataRead)
#endif
{
	int Status;
	XGpioPs_Config *ConfigPtr;
	int Type_of_board;

	//Initialize the GPIO driver.
#ifndef SDT
	ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);
#else
	ConfigPtr = XGpioPs_LookupConfig(BaseAddress);
#endif
	Type_of_board = XGetPlatform_Info();
	switch (Type_of_board)
    {
		case XPLAT_ZYNQ_ULTRA_MP:
			Input_Pin = 22;
			Output_Pin = 23;
			break;

		case XPLAT_ZYNQ:
			Input_Pin = 14;
			Output_Pin = 10;
			break;
	}

	Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr,
				       ConfigPtr->BaseAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	//Status = GpioOutputExample();
	//if (Status != XST_SUCCESS) {
	//	return XST_FAILURE;
	//}

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
*/