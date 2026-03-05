set moduleName v_mix_core_alpha_true_true_Pipeline_VITIS_LOOP_316_3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 42
set C_modelName {v_mix_core_alpha<true, true>_Pipeline_VITIS_LOOP_316_3}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ hwReg_width_val int 11 regular {ap_stable 0} }
	{ zext_ln346 int 9 regular  }
	{ outLayer1 int 24 regular {fifo 1 volatile }  }
	{ srcLayer1x int 24 regular {fifo 0 volatile }  }
	{ srcLayer1Alphax int 8 regular {fifo 0 volatile }  }
	{ hwReg_background_Y_R_val int 8 regular {ap_stable 0} }
	{ hwReg_background_U_G_val int 8 regular {ap_stable 0} }
	{ hwReg_background_V_B_val int 8 regular {ap_stable 0} }
	{ hwReg_layerStartX_1_val int 16 regular {ap_stable 0} }
	{ add_ln332 int 17 regular {ap_stable 0} }
	{ icmp_ln330_1 int 1 regular  }
	{ rev7 int 1 regular  }
	{ empty_62 int 1 regular {ap_stable 0} }
	{ empty int 1 regular {ap_stable 0} }
	{ outLayer0 int 24 regular {fifo 0 volatile }  }
	{ p_out int 8 regular {pointer 2}  }
	{ p_out1 int 8 regular {pointer 2}  }
	{ p_out2 int 8 regular {pointer 2}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "hwReg_width_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln346", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "outLayer1", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "srcLayer1x", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "srcLayer1Alphax", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_background_Y_R_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_background_U_G_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_background_V_B_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_layerStartX_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln332", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln330_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "rev7", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "empty_62", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "outLayer0", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "p_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "p_out1", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "p_out2", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 46
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ srcLayer1x_dout sc_in sc_lv 24 signal 3 } 
	{ srcLayer1x_empty_n sc_in sc_logic 1 signal 3 } 
	{ srcLayer1x_read sc_out sc_logic 1 signal 3 } 
	{ srcLayer1x_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ srcLayer1x_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ srcLayer1Alphax_dout sc_in sc_lv 8 signal 4 } 
	{ srcLayer1Alphax_empty_n sc_in sc_logic 1 signal 4 } 
	{ srcLayer1Alphax_read sc_out sc_logic 1 signal 4 } 
	{ srcLayer1Alphax_num_data_valid sc_in sc_lv 5 signal 4 } 
	{ srcLayer1Alphax_fifo_cap sc_in sc_lv 5 signal 4 } 
	{ outLayer0_dout sc_in sc_lv 24 signal 14 } 
	{ outLayer0_empty_n sc_in sc_logic 1 signal 14 } 
	{ outLayer0_read sc_out sc_logic 1 signal 14 } 
	{ outLayer0_num_data_valid sc_in sc_lv 3 signal 14 } 
	{ outLayer0_fifo_cap sc_in sc_lv 3 signal 14 } 
	{ outLayer1_din sc_out sc_lv 24 signal 2 } 
	{ outLayer1_full_n sc_in sc_logic 1 signal 2 } 
	{ outLayer1_write sc_out sc_logic 1 signal 2 } 
	{ outLayer1_num_data_valid sc_in sc_lv 32 signal 2 } 
	{ outLayer1_fifo_cap sc_in sc_lv 32 signal 2 } 
	{ hwReg_width_val sc_in sc_lv 11 signal 0 } 
	{ zext_ln346 sc_in sc_lv 9 signal 1 } 
	{ hwReg_background_Y_R_val sc_in sc_lv 8 signal 5 } 
	{ hwReg_background_U_G_val sc_in sc_lv 8 signal 6 } 
	{ hwReg_background_V_B_val sc_in sc_lv 8 signal 7 } 
	{ hwReg_layerStartX_1_val sc_in sc_lv 16 signal 8 } 
	{ add_ln332 sc_in sc_lv 17 signal 9 } 
	{ icmp_ln330_1 sc_in sc_lv 1 signal 10 } 
	{ rev7 sc_in sc_lv 1 signal 11 } 
	{ empty_62 sc_in sc_lv 1 signal 12 } 
	{ empty sc_in sc_lv 1 signal 13 } 
	{ p_out_i sc_in sc_lv 8 signal 15 } 
	{ p_out_o sc_out sc_lv 8 signal 15 } 
	{ p_out_o_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ p_out1_i sc_in sc_lv 8 signal 16 } 
	{ p_out1_o sc_out sc_lv 8 signal 16 } 
	{ p_out1_o_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ p_out2_i sc_in sc_lv 8 signal 17 } 
	{ p_out2_o sc_out sc_lv 8 signal 17 } 
	{ p_out2_o_ap_vld sc_out sc_logic 1 outvld 17 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "srcLayer1x_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "dout" }} , 
 	{ "name": "srcLayer1x_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "empty_n" }} , 
 	{ "name": "srcLayer1x_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "read" }} , 
 	{ "name": "srcLayer1x_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer1x_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "fifo_cap" }} , 
 	{ "name": "srcLayer1Alphax_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "srcLayer1Alphax", "role": "dout" }} , 
 	{ "name": "srcLayer1Alphax_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1Alphax", "role": "empty_n" }} , 
 	{ "name": "srcLayer1Alphax_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1Alphax", "role": "read" }} , 
 	{ "name": "srcLayer1Alphax_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "srcLayer1Alphax", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer1Alphax_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "srcLayer1Alphax", "role": "fifo_cap" }} , 
 	{ "name": "outLayer0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "outLayer0", "role": "dout" }} , 
 	{ "name": "outLayer0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outLayer0", "role": "empty_n" }} , 
 	{ "name": "outLayer0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outLayer0", "role": "read" }} , 
 	{ "name": "outLayer0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "outLayer0", "role": "num_data_valid" }} , 
 	{ "name": "outLayer0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "outLayer0", "role": "fifo_cap" }} , 
 	{ "name": "outLayer1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "outLayer1", "role": "din" }} , 
 	{ "name": "outLayer1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outLayer1", "role": "full_n" }} , 
 	{ "name": "outLayer1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outLayer1", "role": "write" }} , 
 	{ "name": "outLayer1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outLayer1", "role": "num_data_valid" }} , 
 	{ "name": "outLayer1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outLayer1", "role": "fifo_cap" }} , 
 	{ "name": "hwReg_width_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "hwReg_width_val", "role": "default" }} , 
 	{ "name": "zext_ln346", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zext_ln346", "role": "default" }} , 
 	{ "name": "hwReg_background_Y_R_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "hwReg_background_Y_R_val", "role": "default" }} , 
 	{ "name": "hwReg_background_U_G_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "hwReg_background_U_G_val", "role": "default" }} , 
 	{ "name": "hwReg_background_V_B_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "hwReg_background_V_B_val", "role": "default" }} , 
 	{ "name": "hwReg_layerStartX_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "hwReg_layerStartX_1_val", "role": "default" }} , 
 	{ "name": "add_ln332", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "add_ln332", "role": "default" }} , 
 	{ "name": "icmp_ln330_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln330_1", "role": "default" }} , 
 	{ "name": "rev7", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rev7", "role": "default" }} , 
 	{ "name": "empty_62", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "empty_62", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "p_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_out", "role": "i" }} , 
 	{ "name": "p_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_out", "role": "o" }} , 
 	{ "name": "p_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out", "role": "o_ap_vld" }} , 
 	{ "name": "p_out1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_out1", "role": "i" }} , 
 	{ "name": "p_out1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_out1", "role": "o" }} , 
 	{ "name": "p_out1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out1", "role": "o_ap_vld" }} , 
 	{ "name": "p_out2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_out2", "role": "i" }} , 
 	{ "name": "p_out2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_out2", "role": "o" }} , 
 	{ "name": "p_out2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out2", "role": "o_ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	v_mix_core_alpha_true_true_Pipeline_VITIS_LOOP_316_3 {
		hwReg_width_val {Type I LastRead 0 FirstWrite -1}
		zext_ln346 {Type I LastRead 0 FirstWrite -1}
		outLayer1 {Type O LastRead -1 FirstWrite 6}
		srcLayer1x {Type I LastRead 1 FirstWrite -1}
		srcLayer1Alphax {Type I LastRead 1 FirstWrite -1}
		hwReg_background_Y_R_val {Type I LastRead 0 FirstWrite -1}
		hwReg_background_U_G_val {Type I LastRead 0 FirstWrite -1}
		hwReg_background_V_B_val {Type I LastRead 0 FirstWrite -1}
		hwReg_layerStartX_1_val {Type I LastRead 0 FirstWrite -1}
		add_ln332 {Type I LastRead 0 FirstWrite -1}
		icmp_ln330_1 {Type I LastRead 0 FirstWrite -1}
		rev7 {Type I LastRead 0 FirstWrite -1}
		empty_62 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		outLayer0 {Type I LastRead 2 FirstWrite -1}
		p_out {Type IO LastRead 2 FirstWrite 1}
		p_out1 {Type IO LastRead 2 FirstWrite 1}
		p_out2 {Type IO LastRead 2 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "71", "Max" : "1927"}
	, {"Name" : "Interval", "Min" : "65", "Max" : "1921"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	hwReg_width_val { ap_stable {  { hwReg_width_val in_data 0 11 } } }
	zext_ln346 { ap_none {  { zext_ln346 in_data 0 9 } } }
	outLayer1 { ap_fifo {  { outLayer1_din fifo_data_out 1 24 }  { outLayer1_full_n fifo_status_empty 0 1 }  { outLayer1_write fifo_data_in 1 1 }  { outLayer1_num_data_valid fifo_update 0 32 }  { outLayer1_fifo_cap fifo_data 0 32 } } }
	srcLayer1x { ap_fifo {  { srcLayer1x_dout fifo_data_out 0 24 }  { srcLayer1x_empty_n fifo_status_empty 0 1 }  { srcLayer1x_read fifo_data_in 1 1 }  { srcLayer1x_num_data_valid fifo_update 0 3 }  { srcLayer1x_fifo_cap fifo_data 0 3 } } }
	srcLayer1Alphax { ap_fifo {  { srcLayer1Alphax_dout fifo_data_out 0 8 }  { srcLayer1Alphax_empty_n fifo_status_empty 0 1 }  { srcLayer1Alphax_read fifo_data_in 1 1 }  { srcLayer1Alphax_num_data_valid fifo_update 0 5 }  { srcLayer1Alphax_fifo_cap fifo_data 0 5 } } }
	hwReg_background_Y_R_val { ap_stable {  { hwReg_background_Y_R_val in_data 0 8 } } }
	hwReg_background_U_G_val { ap_stable {  { hwReg_background_U_G_val in_data 0 8 } } }
	hwReg_background_V_B_val { ap_stable {  { hwReg_background_V_B_val in_data 0 8 } } }
	hwReg_layerStartX_1_val { ap_stable {  { hwReg_layerStartX_1_val in_data 0 16 } } }
	add_ln332 { ap_stable {  { add_ln332 in_data 0 17 } } }
	icmp_ln330_1 { ap_none {  { icmp_ln330_1 in_data 0 1 } } }
	rev7 { ap_none {  { rev7 in_data 0 1 } } }
	empty_62 { ap_stable {  { empty_62 in_data 0 1 } } }
	empty { ap_stable {  { empty in_data 0 1 } } }
	outLayer0 { ap_fifo {  { outLayer0_dout fifo_data_out 0 24 }  { outLayer0_empty_n fifo_status_empty 0 1 }  { outLayer0_read fifo_data_in 1 1 }  { outLayer0_num_data_valid fifo_update 0 3 }  { outLayer0_fifo_cap fifo_data 0 3 } } }
	p_out { ap_ovld {  { p_out_i in_data 0 8 }  { p_out_o out_data 1 8 }  { p_out_o_ap_vld out_vld 1 1 } } }
	p_out1 { ap_ovld {  { p_out1_i in_data 0 8 }  { p_out1_o out_data 1 8 }  { p_out1_o_ap_vld out_vld 1 1 } } }
	p_out2 { ap_ovld {  { p_out2_i in_data 0 8 }  { p_out2_o out_data 1 8 }  { p_out2_o_ap_vld out_vld 1 1 } } }
}
