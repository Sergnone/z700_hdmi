set moduleName v_mix_core_alpha_true_false_s
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
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
set cdfgNum 39
set C_modelName {v_mix_core_alpha<true, false>}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ outLayer0 int 24 regular {fifo 0 volatile }  }
	{ srcLayer1x int 24 regular {fifo 0 volatile }  }
	{ hwReg_width_val int 11 regular {ap_stable 0} }
	{ hwReg_height_val int 11 regular {ap_stable 0} }
	{ hwReg_background_Y_R_val int 8 regular {ap_stable 0} }
	{ hwReg_background_U_G_val int 8 regular {ap_stable 0} }
	{ hwReg_background_V_B_val int 8 regular {ap_stable 0} }
	{ hwReg_layerEnable_val int 2 regular {ap_stable 0} }
	{ hwReg_layerAlpha_1_val int 9 regular {ap_stable 0} }
	{ hwReg_layerStartX_1_val int 16 regular {ap_stable 0} }
	{ hwReg_layerStartY_1_val int 16 regular {ap_stable 0} }
	{ hwReg_layerWidth_1_val int 16 regular {ap_stable 0} }
	{ hwReg_layerHeight_1_val int 16 regular {ap_stable 0} }
	{ hwReg_layerScaleFactor_1_val int 8 regular {ap_stable 0} }
	{ outLayer1 int 24 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "outLayer0", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "srcLayer1x", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_width_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_height_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_background_Y_R_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_background_U_G_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_background_V_B_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_layerEnable_val", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_layerAlpha_1_val", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_layerStartX_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_layerStartY_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_layerWidth_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_layerHeight_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "hwReg_layerScaleFactor_1_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "outLayer1", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ outLayer0_dout sc_in sc_lv 24 signal 0 } 
	{ outLayer0_empty_n sc_in sc_logic 1 signal 0 } 
	{ outLayer0_read sc_out sc_logic 1 signal 0 } 
	{ outLayer0_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ outLayer0_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ srcLayer1x_dout sc_in sc_lv 24 signal 1 } 
	{ srcLayer1x_empty_n sc_in sc_logic 1 signal 1 } 
	{ srcLayer1x_read sc_out sc_logic 1 signal 1 } 
	{ srcLayer1x_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ srcLayer1x_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ hwReg_width_val sc_in sc_lv 11 signal 2 } 
	{ hwReg_height_val sc_in sc_lv 11 signal 3 } 
	{ hwReg_background_Y_R_val sc_in sc_lv 8 signal 4 } 
	{ hwReg_background_U_G_val sc_in sc_lv 8 signal 5 } 
	{ hwReg_background_V_B_val sc_in sc_lv 8 signal 6 } 
	{ hwReg_layerEnable_val sc_in sc_lv 2 signal 7 } 
	{ hwReg_layerAlpha_1_val sc_in sc_lv 9 signal 8 } 
	{ hwReg_layerStartX_1_val sc_in sc_lv 16 signal 9 } 
	{ hwReg_layerStartY_1_val sc_in sc_lv 16 signal 10 } 
	{ hwReg_layerWidth_1_val sc_in sc_lv 16 signal 11 } 
	{ hwReg_layerHeight_1_val sc_in sc_lv 16 signal 12 } 
	{ hwReg_layerScaleFactor_1_val sc_in sc_lv 8 signal 13 } 
	{ outLayer1_din sc_out sc_lv 24 signal 14 } 
	{ outLayer1_full_n sc_in sc_logic 1 signal 14 } 
	{ outLayer1_write sc_out sc_logic 1 signal 14 } 
	{ outLayer1_num_data_valid sc_in sc_lv 32 signal 14 } 
	{ outLayer1_fifo_cap sc_in sc_lv 32 signal 14 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "outLayer0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "outLayer0", "role": "dout" }} , 
 	{ "name": "outLayer0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outLayer0", "role": "empty_n" }} , 
 	{ "name": "outLayer0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outLayer0", "role": "read" }} , 
 	{ "name": "outLayer0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "outLayer0", "role": "num_data_valid" }} , 
 	{ "name": "outLayer0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "outLayer0", "role": "fifo_cap" }} , 
 	{ "name": "srcLayer1x_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "dout" }} , 
 	{ "name": "srcLayer1x_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "empty_n" }} , 
 	{ "name": "srcLayer1x_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "read" }} , 
 	{ "name": "srcLayer1x_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer1x_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "fifo_cap" }} , 
 	{ "name": "hwReg_width_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "hwReg_width_val", "role": "default" }} , 
 	{ "name": "hwReg_height_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "hwReg_height_val", "role": "default" }} , 
 	{ "name": "hwReg_background_Y_R_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "hwReg_background_Y_R_val", "role": "default" }} , 
 	{ "name": "hwReg_background_U_G_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "hwReg_background_U_G_val", "role": "default" }} , 
 	{ "name": "hwReg_background_V_B_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "hwReg_background_V_B_val", "role": "default" }} , 
 	{ "name": "hwReg_layerEnable_val", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "hwReg_layerEnable_val", "role": "default" }} , 
 	{ "name": "hwReg_layerAlpha_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "hwReg_layerAlpha_1_val", "role": "default" }} , 
 	{ "name": "hwReg_layerStartX_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "hwReg_layerStartX_1_val", "role": "default" }} , 
 	{ "name": "hwReg_layerStartY_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "hwReg_layerStartY_1_val", "role": "default" }} , 
 	{ "name": "hwReg_layerWidth_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "hwReg_layerWidth_1_val", "role": "default" }} , 
 	{ "name": "hwReg_layerHeight_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "hwReg_layerHeight_1_val", "role": "default" }} , 
 	{ "name": "hwReg_layerScaleFactor_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "hwReg_layerScaleFactor_1_val", "role": "default" }} , 
 	{ "name": "outLayer1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "outLayer1", "role": "din" }} , 
 	{ "name": "outLayer1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outLayer1", "role": "full_n" }} , 
 	{ "name": "outLayer1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outLayer1", "role": "write" }} , 
 	{ "name": "outLayer1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outLayer1", "role": "num_data_valid" }} , 
 	{ "name": "outLayer1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outLayer1", "role": "fifo_cap" }}  ]}

set ArgLastReadFirstWriteLatency {
	v_mix_core_alpha_true_false_s {
		outLayer0 {Type I LastRead 1 FirstWrite -1}
		srcLayer1x {Type I LastRead 1 FirstWrite -1}
		hwReg_width_val {Type I LastRead 1 FirstWrite -1}
		hwReg_height_val {Type I LastRead 1 FirstWrite -1}
		hwReg_background_Y_R_val {Type I LastRead 1 FirstWrite -1}
		hwReg_background_U_G_val {Type I LastRead 1 FirstWrite -1}
		hwReg_background_V_B_val {Type I LastRead 1 FirstWrite -1}
		hwReg_layerEnable_val {Type I LastRead 1 FirstWrite -1}
		hwReg_layerAlpha_1_val {Type I LastRead 0 FirstWrite -1}
		hwReg_layerStartX_1_val {Type I LastRead 1 FirstWrite -1}
		hwReg_layerStartY_1_val {Type I LastRead 1 FirstWrite -1}
		hwReg_layerWidth_1_val {Type I LastRead 1 FirstWrite -1}
		hwReg_layerHeight_1_val {Type I LastRead 1 FirstWrite -1}
		hwReg_layerScaleFactor_1_val {Type I LastRead 1 FirstWrite -1}
		outLayer1 {Type O LastRead -1 FirstWrite 5}}
	v_mix_core_alpha_true_false_Pipeline_VITIS_LOOP_395_3 {
		hwReg_width_val {Type I LastRead 0 FirstWrite -1}
		alpha {Type I LastRead 0 FirstWrite -1}
		outLayer1 {Type O LastRead -1 FirstWrite 5}
		srcLayer1x {Type I LastRead 1 FirstWrite -1}
		hwReg_background_Y_R_val {Type I LastRead 0 FirstWrite -1}
		hwReg_background_U_G_val {Type I LastRead 0 FirstWrite -1}
		hwReg_background_V_B_val {Type I LastRead 0 FirstWrite -1}
		hwReg_layerStartX_1_val {Type I LastRead 0 FirstWrite -1}
		add_ln409 {Type I LastRead 0 FirstWrite -1}
		icmp_ln407_1 {Type I LastRead 0 FirstWrite -1}
		rev7 {Type I LastRead 0 FirstWrite -1}
		empty_50 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		outLayer0 {Type I LastRead 1 FirstWrite -1}
		p_out {Type IO LastRead 2 FirstWrite 1}
		p_out1 {Type IO LastRead 2 FirstWrite 1}
		p_out2 {Type IO LastRead 2 FirstWrite 1}}
	reg_unsigned_short_7 {
		d {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4674", "Max" : "2083322"}
	, {"Name" : "Interval", "Min" : "4674", "Max" : "2083322"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	outLayer0 { ap_fifo {  { outLayer0_dout fifo_data_out 0 24 }  { outLayer0_empty_n fifo_status_empty 0 1 }  { outLayer0_read fifo_data_in 1 1 }  { outLayer0_num_data_valid fifo_update 0 3 }  { outLayer0_fifo_cap fifo_data 0 3 } } }
	srcLayer1x { ap_fifo {  { srcLayer1x_dout fifo_data_out 0 24 }  { srcLayer1x_empty_n fifo_status_empty 0 1 }  { srcLayer1x_read fifo_data_in 1 1 }  { srcLayer1x_num_data_valid fifo_update 0 3 }  { srcLayer1x_fifo_cap fifo_data 0 3 } } }
	hwReg_width_val { ap_stable {  { hwReg_width_val in_data 0 11 } } }
	hwReg_height_val { ap_stable {  { hwReg_height_val in_data 0 11 } } }
	hwReg_background_Y_R_val { ap_stable {  { hwReg_background_Y_R_val in_data 0 8 } } }
	hwReg_background_U_G_val { ap_stable {  { hwReg_background_U_G_val in_data 0 8 } } }
	hwReg_background_V_B_val { ap_stable {  { hwReg_background_V_B_val in_data 0 8 } } }
	hwReg_layerEnable_val { ap_stable {  { hwReg_layerEnable_val in_data 0 2 } } }
	hwReg_layerAlpha_1_val { ap_stable {  { hwReg_layerAlpha_1_val in_data 0 9 } } }
	hwReg_layerStartX_1_val { ap_stable {  { hwReg_layerStartX_1_val in_data 0 16 } } }
	hwReg_layerStartY_1_val { ap_stable {  { hwReg_layerStartY_1_val in_data 0 16 } } }
	hwReg_layerWidth_1_val { ap_stable {  { hwReg_layerWidth_1_val in_data 0 16 } } }
	hwReg_layerHeight_1_val { ap_stable {  { hwReg_layerHeight_1_val in_data 0 16 } } }
	hwReg_layerScaleFactor_1_val { ap_stable {  { hwReg_layerScaleFactor_1_val in_data 0 8 } } }
	outLayer1 { ap_fifo {  { outLayer1_din fifo_data_out 1 24 }  { outLayer1_full_n fifo_status_empty 0 1 }  { outLayer1_write fifo_data_in 1 1 }  { outLayer1_num_data_valid fifo_update 0 32 }  { outLayer1_fifo_cap fifo_data 0 32 } } }
}
