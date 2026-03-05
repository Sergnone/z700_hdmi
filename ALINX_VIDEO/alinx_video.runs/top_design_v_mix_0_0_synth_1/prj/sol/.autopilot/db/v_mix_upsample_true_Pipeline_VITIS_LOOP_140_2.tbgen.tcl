set moduleName v_mix_upsample_true_Pipeline_VITIS_LOOP_140_2
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
set cdfgNum 39
set C_modelName {v_mix_upsample<true>_Pipeline_VITIS_LOOP_140_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ shl_ln140_i int 13 regular {ap_stable 0} }
	{ srcLayer1x int 24 regular {fifo 1 volatile }  }
	{ srcLayer1Rgb int 24 regular {fifo 0 volatile }  }
	{ zext_ln126_i int 2 regular {ap_stable 0} }
	{ add_ln138_i int 2 regular {ap_stable 0} }
	{ bReadLine_i int 1 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "shl_ln140_i", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "srcLayer1x", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "srcLayer1Rgb", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln126_i", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln138_i", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "bReadLine_i", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ srcLayer1Rgb_dout sc_in sc_lv 24 signal 2 } 
	{ srcLayer1Rgb_empty_n sc_in sc_logic 1 signal 2 } 
	{ srcLayer1Rgb_read sc_out sc_logic 1 signal 2 } 
	{ srcLayer1Rgb_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ srcLayer1Rgb_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ srcLayer1x_din sc_out sc_lv 24 signal 1 } 
	{ srcLayer1x_full_n sc_in sc_logic 1 signal 1 } 
	{ srcLayer1x_write sc_out sc_logic 1 signal 1 } 
	{ srcLayer1x_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ srcLayer1x_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ shl_ln140_i sc_in sc_lv 13 signal 0 } 
	{ zext_ln126_i sc_in sc_lv 2 signal 3 } 
	{ add_ln138_i sc_in sc_lv 2 signal 4 } 
	{ bReadLine_i sc_in sc_lv 1 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "srcLayer1Rgb_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "srcLayer1Rgb", "role": "dout" }} , 
 	{ "name": "srcLayer1Rgb_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1Rgb", "role": "empty_n" }} , 
 	{ "name": "srcLayer1Rgb_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1Rgb", "role": "read" }} , 
 	{ "name": "srcLayer1Rgb_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer1Rgb", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer1Rgb_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer1Rgb", "role": "fifo_cap" }} , 
 	{ "name": "srcLayer1x_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "din" }} , 
 	{ "name": "srcLayer1x_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "full_n" }} , 
 	{ "name": "srcLayer1x_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "write" }} , 
 	{ "name": "srcLayer1x_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer1x_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer1x", "role": "fifo_cap" }} , 
 	{ "name": "shl_ln140_i", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "shl_ln140_i", "role": "default" }} , 
 	{ "name": "zext_ln126_i", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "zext_ln126_i", "role": "default" }} , 
 	{ "name": "add_ln138_i", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "add_ln138_i", "role": "default" }} , 
 	{ "name": "bReadLine_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bReadLine_i", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	v_mix_upsample_true_Pipeline_VITIS_LOOP_140_2 {
		shl_ln140_i {Type I LastRead 0 FirstWrite -1}
		srcLayer1x {Type O LastRead -1 FirstWrite 3}
		srcLayer1Rgb {Type I LastRead 1 FirstWrite -1}
		zext_ln126_i {Type I LastRead 0 FirstWrite -1}
		add_ln138_i {Type I LastRead 0 FirstWrite -1}
		bReadLine_i {Type I LastRead 0 FirstWrite -1}}
	reg_ap_uint_8_s {
		d {Type I LastRead 0 FirstWrite -1}}
	reg_ap_uint_8_s {
		d {Type I LastRead 0 FirstWrite -1}}
	reg_ap_uint_8_s {
		d {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "7684"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "7681"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	shl_ln140_i { ap_stable {  { shl_ln140_i in_data 0 13 } } }
	srcLayer1x { ap_fifo {  { srcLayer1x_din fifo_data_out 1 24 }  { srcLayer1x_full_n fifo_status_empty 0 1 }  { srcLayer1x_write fifo_data_in 1 1 }  { srcLayer1x_num_data_valid fifo_update 0 3 }  { srcLayer1x_fifo_cap fifo_data 0 3 } } }
	srcLayer1Rgb { ap_fifo {  { srcLayer1Rgb_dout fifo_data_out 0 24 }  { srcLayer1Rgb_empty_n fifo_status_empty 0 1 }  { srcLayer1Rgb_read fifo_data_in 1 1 }  { srcLayer1Rgb_num_data_valid fifo_update 0 3 }  { srcLayer1Rgb_fifo_cap fifo_data 0 3 } } }
	zext_ln126_i { ap_stable {  { zext_ln126_i in_data 0 2 } } }
	add_ln138_i { ap_stable {  { add_ln138_i in_data 0 2 } } }
	bReadLine_i { ap_none {  { bReadLine_i in_data 0 1 } } }
}
