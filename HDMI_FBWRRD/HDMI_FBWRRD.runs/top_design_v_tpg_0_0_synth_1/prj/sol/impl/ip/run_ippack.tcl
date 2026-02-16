# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
# Tool Version Limit: 2025.11
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
# 
# ==============================================================
source -notrace "C:/AMDDesignTools/2025.2/Vitis/common/scripts/ipxhls.tcl"
set ip_out_dir "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_FBWRRD/HDMI_FBWRRD.runs/top_design_v_tpg_0_0_synth_1/prj/sol/impl/ip"
set data_file "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_FBWRRD/HDMI_FBWRRD.runs/top_design_v_tpg_0_0_synth_1/prj/sol/sol_data.json"
set src_dir [file dir $data_file]
set ip_types {vitis sysgen}
set ippack_opts_dict {subcore_use_xci_files false}
if { [catch {::ipx::utils::package_hls_ip $ip_out_dir $data_file $ip_types $src_dir $ippack_opts_dict} res] } {
  puts "Caught error:\n$::errorInfo"
  error $res
}
