#include "xl_vtc.h"

XL_Vtc_Config XL_Vtc_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,v-tc-6.2", /* compatible */
		0x43c20000, /* reg */
		0xffff, /* interrupts */
		0xffff /* interrupt-parent */
	},
	 {
		 NULL
	}
};
