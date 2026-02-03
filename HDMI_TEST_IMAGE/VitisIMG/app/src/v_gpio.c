#include "v_gpio.h"

u32 volatile		*gpio_hlsIpReset;
u32 volatile		*gpio_videoLockMonitor;

void V_GPIO_Reset(void)
{
	*gpio_hlsIpReset = 0; //reset IPs
	usleep(300000);
	*gpio_hlsIpReset = 1; // release reset
	usleep(300000);
}


void V_GPIO_Init(void)
{
    gpio_hlsIpReset = (u32*)XPAR_HLS_IP_RESET_BASEADDR;
	*gpio_hlsIpReset = 1;
}
