set_property SRC_FILE_INFO {cfile:/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/HDMI_TEST.gen/sources_1/bd/top_design/ip/top_design_axi_smc_1/smartconnect.xdc rfile:../../../../HDMI_TEST_TPG/HDMI_TEST.gen/sources_1/bd/top_design/ip/top_design_axi_smc_1/smartconnect.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl rfile:../../../../../../../../../tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl id:2 order:LATE scoped_inst:{inst/m02_nodes/m02_ar_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake} unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl rfile:../../../../../../../../../tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl id:3 order:LATE scoped_inst:{inst/m02_nodes/m02_aw_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake} unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl rfile:../../../../../../../../../tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl id:4 order:LATE scoped_inst:{inst/m02_nodes/m02_b_node/inst/inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake} unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl rfile:../../../../../../../../../tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl id:5 order:LATE scoped_inst:{inst/m02_nodes/m02_r_node/inst/inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake} unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl rfile:../../../../../../../../../tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl id:6 order:LATE scoped_inst:{inst/m02_nodes/m02_b_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake} unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl rfile:../../../../../../../../../tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl id:7 order:LATE scoped_inst:{inst/m02_nodes/m02_r_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake} unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl rfile:../../../../../../../../../tools/xilinx/2025.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl id:8 order:LATE scoped_inst:{inst/m02_nodes/m02_w_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake} unmanaged:yes} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id CDC-11 -user "smartconnect" -desc "Timing uncritical paths" -tags "1171415" -scope -internal -to [get_pins -hier -filter {NAME =~ */clk_map/psr*/*/EXT_LPF/ACTIVE_LOW_AUX.ACT_LO_AUX/*syncstages_ff_reg*/D}]
set_property src_info {type:SCOPED_XDC file:1 line:3 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id CDC-1 -user "smartconnect" -desc "Timing uncritical paths" -tags "1165895" -scope -internal -to [get_pins -quiet -filter {REF_PIN_NAME=~*D || REF_PIN_NAME=~*CE} -of_objects [get_cells -hierarchical -filter {NAME =~ */s*_entry_pipeline/s*_si_converter/inst/gen_axilite_conv.axilite_conv_inst/*_reg*}]]
set_property src_info {type:SCOPED_XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-1} -user "smartconnect" -desc "Waiver CDC path" -tags "1165895" -scope -internal -to [get_pins -quiet -filter {REF_PIN_NAME=~*D || REF_PIN_NAME=~*CE} -of_objects [get_cells -hierarchical -filter {NAME =~ */*_node/inst/inst_mi_handler/*}]]
set_property src_info {type:SCOPED_XDC file:1 line:5 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-1} -user "smartconnect" -desc "Waiver CDC path" -tags "1165895" -scope -internal -from [get_pins -quiet -filter {REF_PIN_NAME=~*C} -of_objects [get_cells -hierarchical -filter {NAME =~ */*_node/inst/inst_mi_handler/*}]]
set_property src_info {type:SCOPED_XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-2} -user "smartconnect" -desc "Waiver CDC path" -tags "1165895" -scope -internal -to [get_pins -quiet -filter {REF_PIN_NAME=~*D || REF_PIN_NAME=~*CE} -of_objects [get_cells -hierarchical -filter {NAME =~ */*_node/inst/inst_mi_handler/*}]]
set_property src_info {type:SCOPED_XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-2} -user "smartconnect" -desc "Waiver CDC path" -tags "1165895" -scope -internal -from [get_pins -quiet -filter {REF_PIN_NAME=~*C} -of_objects [get_cells -hierarchical -filter {NAME =~ */*_node/inst/inst_mi_handler/*}]]
set_property src_info {type:SCOPED_XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-4} -user "smartconnect" -desc "Waiver CDC path" -tags "1165895" -scope -internal -to [get_pins -quiet -filter {REF_PIN_NAME=~*D || REF_PIN_NAME=~*CE} -of_objects [get_cells -hierarchical -filter {NAME =~ */*_node/inst/inst_mi_handler/*}]]
set_property src_info {type:SCOPED_XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-4} -user "smartconnect" -desc "Waiver CDC path" -tags "1165895" -scope -internal -from [get_pins -quiet -filter {REF_PIN_NAME=~*C} -of_objects [get_cells -hierarchical -filter {NAME =~ */*_node/inst/inst_mi_handler/*}]]
set_property src_info {type:SCOPED_XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-10} -user "smartconnect" -desc "Waiver CDC path" -tags "1165895" -scope -internal -to [get_pins -quiet -filter {REF_PIN_NAME=~*D || REF_PIN_NAME=~*CE} -of_objects [get_cells -hierarchical -filter {NAME =~ */*_node/inst/inst_mi_handler/*}]]
set_property src_info {type:SCOPED_XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-10} -user "smartconnect" -desc "Waiver CDC path" -tags "1165895" -scope -internal -from [get_pins -quiet -filter {REF_PIN_NAME=~*C} -of_objects [get_cells -hierarchical -filter {NAME =~ */*_node/inst/inst_mi_handler/*}]]
set_property src_info {type:SCOPED_XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-11} -user "smartconnect" -desc "Waiver CDC path" -tags "1165895" -scope -internal -to [get_pins -quiet -filter {REF_PIN_NAME=~*D || REF_PIN_NAME=~*CE} -of_objects [get_cells -hierarchical -filter {NAME =~ */*_node/inst/inst_mi_handler/*}]]
set_property src_info {type:SCOPED_XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-11} -user "smartconnect" -desc "Waiver CDC path" -tags "1165895" -scope -internal -from [get_pins -quiet -filter {REF_PIN_NAME=~*C} -of_objects [get_cells -hierarchical -filter {NAME =~ */*_node/inst/inst_mi_handler/*}]]
set_property src_info {type:SCOPED_XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-13} -user "smartconnect" -desc "Waiver CDC path" -tags "1165895" -scope -internal -to [get_pins -quiet -filter {REF_PIN_NAME=~*D || REF_PIN_NAME=~*CE} -of_objects [get_cells -hierarchical -filter {NAME =~ */*_node/inst/inst_mi_handler/*}]]
set_property src_info {type:SCOPED_XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-13} -user "smartconnect" -desc "Waiver CDC path" -tags "1165895" -scope -internal -from [get_pins -quiet -filter {REF_PIN_NAME=~*C} -of_objects [get_cells -hierarchical -filter {NAME =~ */*_node/inst/inst_mi_handler/*}]]
current_instance
current_instance {inst/m02_nodes/m02_ar_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake}
set_property src_info {type:SCOPED_XDC file:2 line:30 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-15} -user "xpm_cdc" -tags "1009444" -desc "The CDC-15 warning is waived as it is safe in the context of XPM_CDC_HANDSHAKE." -from [get_pins -quiet {src_hsdata_ff_reg*/C}] -to [get_pins -quiet {dest_hsdata_ff_reg*/D}]
current_instance
current_instance {inst/m02_nodes/m02_aw_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake}
set_property src_info {type:SCOPED_XDC file:3 line:30 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-15} -user "xpm_cdc" -tags "1009444" -desc "The CDC-15 warning is waived as it is safe in the context of XPM_CDC_HANDSHAKE." -from [get_pins -quiet {src_hsdata_ff_reg*/C}] -to [get_pins -quiet {dest_hsdata_ff_reg*/D}]
current_instance
current_instance {inst/m02_nodes/m02_b_node/inst/inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake}
set_property src_info {type:SCOPED_XDC file:4 line:30 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-15} -user "xpm_cdc" -tags "1009444" -desc "The CDC-15 warning is waived as it is safe in the context of XPM_CDC_HANDSHAKE." -from [get_pins -quiet {src_hsdata_ff_reg*/C}] -to [get_pins -quiet {dest_hsdata_ff_reg*/D}]
current_instance
current_instance {inst/m02_nodes/m02_r_node/inst/inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake}
set_property src_info {type:SCOPED_XDC file:5 line:30 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-15} -user "xpm_cdc" -tags "1009444" -desc "The CDC-15 warning is waived as it is safe in the context of XPM_CDC_HANDSHAKE." -from [get_pins -quiet {src_hsdata_ff_reg*/C}] -to [get_pins -quiet {dest_hsdata_ff_reg*/D}]
current_instance
current_instance {inst/m02_nodes/m02_b_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake}
set_property src_info {type:SCOPED_XDC file:6 line:30 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-15} -user "xpm_cdc" -tags "1009444" -desc "The CDC-15 warning is waived as it is safe in the context of XPM_CDC_HANDSHAKE." -from [get_pins -quiet {src_hsdata_ff_reg*/C}] -to [get_pins -quiet {dest_hsdata_ff_reg*/D}]
current_instance
current_instance {inst/m02_nodes/m02_r_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake}
set_property src_info {type:SCOPED_XDC file:7 line:30 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-15} -user "xpm_cdc" -tags "1009444" -desc "The CDC-15 warning is waived as it is safe in the context of XPM_CDC_HANDSHAKE." -from [get_pins -quiet {src_hsdata_ff_reg*/C}] -to [get_pins -quiet {dest_hsdata_ff_reg*/D}]
current_instance
current_instance {inst/m02_nodes/m02_w_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_reg_fifo_async.inst_reg_fifo_async/gen_xpm_cdc_handshake_array[0].inst_cdc_handshake}
set_property src_info {type:SCOPED_XDC file:8 line:30 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-15} -user "xpm_cdc" -tags "1009444" -desc "The CDC-15 warning is waived as it is safe in the context of XPM_CDC_HANDSHAKE." -from [get_pins -quiet {src_hsdata_ff_reg*/C}] -to [get_pins -quiet {dest_hsdata_ff_reg*/D}]
