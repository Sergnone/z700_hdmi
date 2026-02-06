transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_22
vlib riviera/processing_system7_vip_v1_0_24
vlib riviera/xil_defaultlib
vlib riviera/proc_sys_reset_v5_0_17
vlib riviera/smartconnect_v1_0
vlib riviera/axi_register_slice_v2_1_36
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/v_tc_v6_1_14
vlib riviera/v_vid_in_axi4s_v4_0_11
vlib riviera/v_axi4s_vid_out_v4_0_20
vlib riviera/v_tc_v6_2_11
vlib riviera/fifo_generator_v13_2_14
vlib riviera/axi_datamover_v5_1_37
vlib riviera/axi_vdma_v6_3_24

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_22 riviera/axi_vip_v1_1_22
vmap processing_system7_vip_v1_0_24 riviera/processing_system7_vip_v1_0_24
vmap xil_defaultlib riviera/xil_defaultlib
vmap proc_sys_reset_v5_0_17 riviera/proc_sys_reset_v5_0_17
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_register_slice_v2_1_36 riviera/axi_register_slice_v2_1_36
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap v_tc_v6_1_14 riviera/v_tc_v6_1_14
vmap v_vid_in_axi4s_v4_0_11 riviera/v_vid_in_axi4s_v4_0_11
vmap v_axi4s_vid_out_v4_0_20 riviera/v_axi4s_vid_out_v4_0_20
vmap v_tc_v6_2_11 riviera/v_tc_v6_2_11
vmap fifo_generator_v13_2_14 riviera/fifo_generator_v13_2_14
vmap axi_datamover_v5_1_37 riviera/axi_datamover_v5_1_37
vmap axi_vdma_v6_3_24 riviera/axi_vdma_v6_3_24

vlog -work xilinx_vip  -incr "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"/tools/xilinx/2025.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/tools/xilinx/2025.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/tools/xilinx/2025.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/tools/xilinx/2025.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/tools/xilinx/2025.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/tools/xilinx/2025.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/tools/xilinx/2025.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/tools/xilinx/2025.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/tools/xilinx/2025.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"/tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/xilinx/2025.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/tools/xilinx/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/tools/xilinx/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_22  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/b16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_24  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_processing_system7_0_0/sim/top_design_processing_system7_0_0.v" \

vcom -work proc_sys_reset_v5_0_17 -93  -incr \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/top_design/ip/top_design_axi_smc_1/bd_0/ip/ip_1/sim/bd_b6ca_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_axi_smc_1/bd_0/ip/ip_2/sim/bd_b6ca_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_axi_smc_1/bd_0/ip/ip_3/sim/bd_b6ca_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_axi_smc_1/bd_0/ip/ip_4/sim/bd_b6ca_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_axi_smc_1/bd_0/ip/ip_5/sim/bd_b6ca_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_axi_smc_1/bd_0/ip/ip_6/sim/bd_b6ca_sarn_0.sv" \
"../../../bd/top_design/ip/top_design_axi_smc_1/bd_0/ip/ip_7/sim/bd_b6ca_srn_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_axi_smc_1/bd_0/ip/ip_8/sim/bd_b6ca_m00s2a_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/e44a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_axi_smc_1/bd_0/ip/ip_9/sim/bd_b6ca_m00e_0.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_axi_smc_1/bd_0/sim/bd_b6ca.v" \

vcom -work smartconnect_v1_0 -93  -incr \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.sv" \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work axi_register_slice_v2_1_36  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/bc4b/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_axi_smc_1/sim/top_design_axi_smc_1.sv" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/top_design/ip/top_design_rst_ps7_0_148M_1/sim/top_design_rst_ps7_0_148M_1.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93  -incr \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work v_tc_v6_1_14 -93  -incr \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/fd54/hdl/v_tc_v6_1_vh_rfs.vhd" \

vlog -work v_vid_in_axi4s_v4_0_11  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/4705/hdl/v_vid_in_axi4s_v4_0_vl_rfs.v" \

vlog -work v_axi4s_vid_out_v4_0_20  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/d1ca/hdl/v_axi4s_vid_out_v4_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_v_axi4s_vid_out_0_1/sim/top_design_v_axi4s_vid_out_0_1.v" \

vcom -work v_tc_v6_2_11 -93  -incr \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/c219/hdl/v_tc_v6_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/top_design/ip/top_design_v_tc_0_1/sim/top_design_v_tc_0_1.vhd" \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/d57c/src/ClockGen.vhd" \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/d57c/src/SyncAsync.vhd" \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/d57c/src/SyncAsyncReset.vhd" \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/d57c/src/DVI_Constants.vhd" \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/d57c/src/OutputSERDES.vhd" \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/d57c/src/TMDS_Encoder.vhd" \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/d57c/src/rgb2dvi.vhd" \
"../../../bd/top_design/ip/top_design_rgb2dvi_0_0/sim/top_design_rgb2dvi_0_0.vhd" \
"../../../bd/top_design/ip/top_design_proc_sys_reset_0_0/sim/top_design_proc_sys_reset_0_0.vhd" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_8df6_psr_aclk_0.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_8df6_arinsw_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_8df6_rinsw_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_8df6_awinsw_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_8df6_winsw_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_8df6_binsw_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_8df6_aroutsw_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_8df6_routsw_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_8df6_awoutsw_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_8df6_woutsw_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_8df6_boutsw_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_8df6_arni_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_8df6_rni_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_8df6_awni_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_8df6_wni_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_8df6_bni_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_8df6_s00mmu_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_8df6_s00tr_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_8df6_s00sic_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_8df6_s00a2s_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_8df6_sarn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_8df6_srn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_8df6_sawn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_8df6_swn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_8df6_sbn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_8df6_m00s2a_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_27/sim/bd_8df6_m00arn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_28/sim/bd_8df6_m00rn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_29/sim/bd_8df6_m00awn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_30/sim/bd_8df6_m00wn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_31/sim/bd_8df6_m00bn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_32/sim/bd_8df6_m00e_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_33/sim/bd_8df6_m01s2a_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_34/sim/bd_8df6_m01arn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_35/sim/bd_8df6_m01rn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_36/sim/bd_8df6_m01awn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_37/sim/bd_8df6_m01wn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_38/sim/bd_8df6_m01bn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_39/sim/bd_8df6_m01e_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_40/sim/bd_8df6_m02s2a_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_41/sim/bd_8df6_m02arn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_42/sim/bd_8df6_m02rn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_43/sim/bd_8df6_m02awn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_44/sim/bd_8df6_m02wn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_45/sim/bd_8df6_m02bn_0.sv" \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/ip/ip_46/sim/bd_8df6_m02e_0.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/bd_0/sim/bd_8df6.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/ip/top_design_smartconnect_0_0/sim/top_design_smartconnect_0_0.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/2a7c/src/mmcme2_drp.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/top_design/ipshared/2a7c/src/SyncAsync.vhd" \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/2a7c/src/axi_dynclk_S00_AXI.vhd" \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/2a7c/src/axi_dynclk.vhd" \
"../../../bd/top_design/ip/top_design_axi_dynclk_0_0/sim/top_design_axi_dynclk_0_0.vhd" \

vlog -work fifo_generator_v13_2_14  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/d654/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_14 -93  -incr \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/d654/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_14  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/d654/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work axi_datamover_v5_1_37 -93  -incr \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/d44a/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vlog -work axi_vdma_v6_3_24  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl/axi_vdma_v6_3_rfs.v" \

vcom -work axi_vdma_v6_3_24 -93  -incr \
"../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl/axi_vdma_v6_3_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/top_design/ip/top_design_axi_vdma_0_0/sim/top_design_axi_vdma_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/ec67/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/9a25/hdl" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../HDMI_VDMA.gen/sources_1/bd/top_design/ipshared/7e8c/hdl" "+incdir+../../../../../../../../../../tools/xilinx/2025.2/data/rsb/busdef" "+incdir+/tools/xilinx/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 -l axi_lite_ipif_v3_0_4 -l v_tc_v6_1_14 -l v_vid_in_axi4s_v4_0_11 -l v_axi4s_vid_out_v4_0_20 -l v_tc_v6_2_11 -l fifo_generator_v13_2_14 -l axi_datamover_v5_1_37 -l axi_vdma_v6_3_24 \
"../../../bd/top_design/sim/top_design.v" \

vlog -work xil_defaultlib \
"glbl.v"

