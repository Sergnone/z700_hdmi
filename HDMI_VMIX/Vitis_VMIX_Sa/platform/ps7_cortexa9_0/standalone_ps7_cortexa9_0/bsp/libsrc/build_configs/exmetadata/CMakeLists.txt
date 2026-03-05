
cmake_minimum_required(VERSION 3.15)
project(bsp)

# Use CMAKE_LIBRARY_PATH in link_directories
link_directories(${CMAKE_LIBRARY_PATH})
        
set(DRIVER_TARGETS coresightps_dcc;devcfg;dmaps;gpiops;scugic;scutimer;scuwdt;sdps;uartps;xadcps;v_frmbuf_rd;v_frmbuf_wr;v_mix;vtc;v_tpg)
set(DRIVER_LOCATIONS /tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/coresightps_dcc_v1_13;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/devcfg_v3_9;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/dmaps_v2_11;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/gpiops_v3_14;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/scugic_v5_6;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/scutimer_v2_7;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/scuwdt_v2_6;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/sdps_v4_5;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/uartps_v3_17;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/xadcps_v2_7;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/v_frmbuf_rd_v5_1;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/v_frmbuf_wr_v5_1;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/v_mix_v7_0;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/vtc_v8_7;/tools/xilinx/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/v_tpg_v8_6)

list(LENGTH DRIVER_TARGETS no_of_drivers)
set(index 0)

while(${index} LESS ${no_of_drivers})
    list(GET DRIVER_TARGETS ${index} drv)
    list(GET DRIVER_LOCATIONS ${index} drv_dir)
    set(exp_dir "${drv_dir}/examples")
    add_custom_target(
        ${drv}_example ALL
        COMMAND lopper -f -O /home/serg/Documents/Xilinx/z7000_hdmi/HDMI_VMIX/Vitis_VMIX_Sa/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/${drv} /home/serg/Documents/Xilinx/z7000_hdmi/HDMI_VMIX/Vitis_VMIX_Sa/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/hw_artifacts/ps7_cortexa9_0_baremetal.dts -- bmcmake_metadata_xlnx ps7_cortexa9_0 ${exp_dir} drvcmake_metadata
        BYPRODUCTS x${drv}_exlist.yaml)
    MATH(EXPR index "${index}+1")
endwhile()
