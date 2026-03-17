#include "v_gpio.h"
#include <xgpiops.h>


/*--------------------------------------------------------------------------------*/
static int GpioInputExample(u32 *DataRead)
{
	/* Set the direction for the specified pin to be input. */
	//XGpioPs_SetDirectionPin(&Gpio, Input_Pin, 0x0);
	/* Read the state of the data so that it can be  verified. */
	//*DataRead = XGpioPs_ReadPin(&Gpio, Input_Pin);
	return XST_SUCCESS;
}
/*--------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------*/
static int GpioOutputExample(void)
{
	//XGpioPs_SetDirectionPin(&Gpio, Output_Pin, 1);
	//XGpioPs_SetOutputEnablePin(&Gpio, Output_Pin, 1);
	/* Set the GPIO output to be low. */
	//XGpioPs_WritePin(&Gpio, Output_Pin, 0x1);
	return XST_SUCCESS;
}
/*--------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------*/
void V_GPIO_SetupIp(XGpioPs *xGpio)
{
	V_GPIO_Set(xGpio, 54+0, 0x1);
	V_GPIO_Set(xGpio, 54+1, 0x1);
	V_GPIO_Set(xGpio, 54+2, 0x1);
	V_GPIO_Set(xGpio, 54+3, 0x1);
	//V_GPIO_Set(xGpio, 54+4, 0x1);
}
/*--------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------*/
void V_GPIO_ResetIp(XGpioPs *xGpio)
{
  xil_printf("\r\nReset HLS IPs \r\n");
  XGpioPs_WritePin(xGpio, 54+0, 0x0);
  XGpioPs_WritePin(xGpio, 54+1, 0x0);
  usleep(1000000);
  XGpioPs_WritePin(xGpio, 54+0, 0x1);
  XGpioPs_WritePin(xGpio, 54+1, 0x1);
  usleep(1000000);
}
/*--------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------*/
void V_GPIO_Set(XGpioPs *xGpio, uint32_t oPin, uint32_t oLev)
{
	XGpioPs_SetDirectionPin(xGpio, oPin, 1);
	XGpioPs_SetOutputEnablePin(xGpio, oPin, 1);
	XGpioPs_WritePin(xGpio, oPin, oLev);
}
/*--------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------*/
int V_GPIO_Init(XGpioPs *xGpio, uint32_t bAddress)
{
	int Status;
	XGpioPs_Config *gpio_Config;
	gpio_Config = XGpioPs_LookupConfig(bAddress);
	if(gpio_Config == NULL)
	{
		xil_printf("ERR:: GPIOS device not found\r\n");
		return(XST_DEVICE_NOT_FOUND);
	}
	Status = XGpioPs_CfgInitialize(xGpio,
									gpio_Config,
				      				 gpio_Config->BaseAddr);
	if (Status != XST_SUCCESS)
	{
		xil_printf("ERR:: GPIOS Initialization failed %d\r\n", Status);
		return XST_FAILURE;
	}
	xil_printf("GPIO: Initialized OK\r\n");
	return XST_SUCCESS;
}
/*--------------------------------------------------------------------------------*/