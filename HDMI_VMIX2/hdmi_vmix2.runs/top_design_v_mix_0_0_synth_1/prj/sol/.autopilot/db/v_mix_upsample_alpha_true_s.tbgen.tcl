set moduleName v_mix_upsample_alpha_true_s
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
set cdfgNum 42
set C_modelName {v_mix_upsample_alpha<true>}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ srcLayer1Alpha int 8 regular {fifo 0 volatile }  }
	{ HwReg_layerHeight_1_val int 16 regular {ap_stable 0} }
	{ HwReg_layerWidth_1_val int 16 regular {ap_stable 0} }
	{ HwReg_layerEnableFlag_1_val int 1 regular {ap_stable 0} }
	{ HwReg_layerScaleFactor_1_val21 int 2 regular {ap_stable 0} }
	{ srcLayer1Alphax int 8 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "srcLayer1Alpha", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerHeight_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerWidth_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerEnableFlag_1_val", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerScaleFactor_1_val21", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "srcLayer1Alphax", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
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
	{ srcLayer1Alpha_dout sc_in sc_lv 8 signal 0 } 
	{ srcLayer1Alpha_empty_n sc_in sc_logic 1 signal 0 } 
	{ srcLayer1Alpha_read sc_out sc_logic 1 signal 0 } 
	{ srcLayer1Alpha_num_data_valid sc_in sc_lv 5 signal 0 } 
	{ srcLayer1Alpha_fifo_cap sc_in sc_lv 5 signal 0 } 
	{ HwReg_layerHeight_1_val sc_in sc_lv 16 signal 1 } 
	{ HwReg_layerWidth_1_val sc_in sc_lv 16 signal 2 } 
	{ HwReg_layerEnableFlag_1_val sc_in sc_lv 1 signal 3 } 
	{ HwReg_layerScaleFactor_1_val21 sc_in sc_lv 2 signal 4 } 
	{ srcLayer1Alphax_din sc_out sc_lv 8 signal 5 } 
	{ srcLayer1Alphax_full_n sc_in sc_logic 1 signal 5 } 
	{ srcLayer1Alphax_write sc_out sc_logic 1 signal 5 } 
	{ srcLayer1Alphax_num_data_valid sc_in sc_lv 5 signal 5 } 
	{ srcLayer1Alphax_fifo_cap sc_in sc_lv 5 signal 5 } 
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
 	{ "name": "srcLayer1Alpha_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "srcLayer1Alpha", "role": "dout" }} , 
 	{ "name": "srcLayer1Alpha_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1Alpha", "role": "empty_n" }} , 
 	{ "name": "srcLayer1Alpha_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1Alpha", "role": "read" }} , 
 	{ "name": "srcLayer1Alpha_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "srcLayer1Alpha", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer1Alpha_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "srcLayer1Alpha", "role": "fifo_cap" }} , 
 	{ "name": "HwReg_layerHeight_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "HwReg_layerHeight_1_val", "role": "default" }} , 
 	{ "name": "HwReg_layerWidth_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "HwReg_layerWidth_1_val", "role": "default" }} , 
 	{ "name": "HwReg_layerEnableFlag_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "HwReg_layerEnableFlag_1_val", "role": "default" }} , 
 	{ "name": "HwReg_layerScaleFactor_1_val21", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "HwReg_layerScaleFactor_1_val21", "role": "default" }} , 
 	{ "name": "srcLayer1Alphax_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "srcLayer1Alphax", "role": "din" }} , 
 	{ "name": "srcLayer1Alphax_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1Alphax", "role": "full_n" }} , 
 	{ "name": "srcLayer1Alphax_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1Alphax", "role": "write" }} , 
 	{ "name": "srcLayer1Alphax_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "srcLayer1Alphax", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer1Alphax_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "srcLayer1Alphax", "role": "fifo_cap" }}  ]}

set ArgLastReadFirstWriteLatency {
	v_mix_upsample_alpha_true_s {
		srcLayer1Alpha {Type I LastRead 1 FirstWrite -1}
		HwReg_layerHeight_1_val {Type I LastRead 1 FirstWrite -1}
		HwReg_layerWidth_1_val {Type I LastRead 1 FirstWrite -1}
		HwReg_layerEnableFlag_1_val {Type I LastRead 1 FirstWrite -1}
		HwReg_layerScaleFactor_1_val21 {Type I LastRead 0 FirstWrite -1}
		srcLayer1Alphax {Type O LastRead -1 FirstWrite 3}}
	v_mix_upsample_alpha_true_Pipeline_VITIS_LOOP_236_2 {
		shl_ln236_i {Type I LastRead 0 FirstWrite -1}
		srcLayer1Alphax {Type O LastRead -1 FirstWrite 3}
		srcLayer1Alpha {Type I LastRead 1 FirstWrite -1}
		zext_ln223_i {Type I LastRead 0 FirstWrite -1}
		add_ln234_i {Type I LastRead 0 FirstWrite -1}
		bReadLine_i {Type I LastRead 0 FirstWrite -1}}
	reg_unsigned_char_s {
		d {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "68718952442"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "68718952442"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	srcLayer1Alpha { ap_fifo {  { srcLayer1Alpha_dout fifo_data_out 0 8 }  { srcLayer1Alpha_empty_n fifo_status_empty 0 1 }  { srcLayer1Alpha_read fifo_data_in 1 1 }  { srcLayer1Alpha_num_data_valid fifo_update 0 5 }  { srcLayer1Alpha_fifo_cap fifo_data 0 5 } } }
	HwReg_layerHeight_1_val { ap_stable {  { HwReg_layerHeight_1_val in_data 0 16 } } }
	HwReg_layerWidth_1_val { ap_stable {  { HwReg_layerWidth_1_val in_data 0 16 } } }
	HwReg_layerEnableFlag_1_val { ap_stable {  { HwReg_layerEnableFlag_1_val in_data 0 1 } } }
	HwReg_layerScaleFactor_1_val21 { ap_stable {  { HwReg_layerScaleFactor_1_val21 in_data 0 2 } } }
	srcLayer1Alphax { ap_fifo {  { srcLayer1Alphax_din fifo_data_out 1 8 }  { srcLayer1Alphax_full_n fifo_status_empty 0 1 }  { srcLayer1Alphax_write fifo_data_in 1 1 }  { srcLayer1Alphax_num_data_valid fifo_update 0 5 }  { srcLayer1Alphax_fifo_cap fifo_data 0 5 } } }
}
