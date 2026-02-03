# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
# Tool Version Limit: 2025.11
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
# 
# ==============================================================
proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "XTop_design_v_frmbuf_rd_0_0_v_frmbuf_rd" \
        "NUM_INSTANCES" \
        "DEVICE_ID" \
        "C_S_AXI_TOP_DESIGN_V_FRMBUF_RD_0_0_CTRL_BASEADDR" \
        "C_S_AXI_TOP_DESIGN_V_FRMBUF_RD_0_0_CTRL_HIGHADDR"

    xdefine_config_file $drv_handle "xtop_design_v_frmbuf_rd_0_0_v_frmbuf_rd_g.c" "XTop_design_v_frmbuf_rd_0_0_v_frmbuf_rd" \
        "DEVICE_ID" \
        "C_S_AXI_TOP_DESIGN_V_FRMBUF_RD_0_0_CTRL_BASEADDR"

    xdefine_canonical_xpars $drv_handle "xparameters.h" "XTop_design_v_frmbuf_rd_0_0_v_frmbuf_rd" \
        "DEVICE_ID" \
        "C_S_AXI_TOP_DESIGN_V_FRMBUF_RD_0_0_CTRL_BASEADDR" \
        "C_S_AXI_TOP_DESIGN_V_FRMBUF_RD_0_0_CTRL_HIGHADDR"
}

