# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "/home/serg/Documents/Xilinx/z700_hdmi/ALINX_VIDEO/Vitis_AVIDEO_Sa/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/include/sleep.h"
  "/home/serg/Documents/Xilinx/z700_hdmi/ALINX_VIDEO/Vitis_AVIDEO_Sa/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/include/xiltimer.h"
  "/home/serg/Documents/Xilinx/z700_hdmi/ALINX_VIDEO/Vitis_AVIDEO_Sa/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/include/xtimer_config.h"
  "/home/serg/Documents/Xilinx/z700_hdmi/ALINX_VIDEO/Vitis_AVIDEO_Sa/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/lib/libxiltimer.a"
  )
endif()
