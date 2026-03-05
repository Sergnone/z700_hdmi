set moduleName v_mix_420_to_422_false_1
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
set C_modelName {v_mix_420_to_422<false>.1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ srcLayer0 int 24 regular {fifo 0 volatile }  }
	{ height uint 11 regular {ap_stable 0} }
	{ width uint 11 regular {ap_stable 0} }
	{ layerEnableFlag uint 1 regular {ap_stable 0} }
	{ srcLayer0Yuv422 int 24 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "srcLayer0", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "height", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "width", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "layerEnableFlag", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "srcLayer0Yuv422", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 23
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
	{ srcLayer0_dout sc_in sc_lv 24 signal 0 } 
	{ srcLayer0_empty_n sc_in sc_logic 1 signal 0 } 
	{ srcLayer0_read sc_out sc_logic 1 signal 0 } 
	{ srcLayer0_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ srcLayer0_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ height sc_in sc_lv 11 signal 1 } 
	{ width sc_in sc_lv 11 signal 2 } 
	{ layerEnableFlag sc_in sc_lv 1 signal 3 } 
	{ srcLayer0Yuv422_din sc_out sc_lv 24 signal 4 } 
	{ srcLayer0Yuv422_full_n sc_in sc_logic 1 signal 4 } 
	{ srcLayer0Yuv422_write sc_out sc_logic 1 signal 4 } 
	{ srcLayer0Yuv422_num_data_valid sc_in sc_lv 32 signal 4 } 
	{ srcLayer0Yuv422_fifo_cap sc_in sc_lv 32 signal 4 } 
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
 	{ "name": "srcLayer0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "srcLayer0", "role": "dout" }} , 
 	{ "name": "srcLayer0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer0", "role": "empty_n" }} , 
 	{ "name": "srcLayer0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer0", "role": "read" }} , 
 	{ "name": "srcLayer0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer0", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer0", "role": "fifo_cap" }} , 
 	{ "name": "height", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "height", "role": "default" }} , 
 	{ "name": "width", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "width", "role": "default" }} , 
 	{ "name": "layerEnableFlag", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "layerEnableFlag", "role": "default" }} , 
 	{ "name": "srcLayer0Yuv422_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "srcLayer0Yuv422", "role": "din" }} , 
 	{ "name": "srcLayer0Yuv422_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer0Yuv422", "role": "full_n" }} , 
 	{ "name": "srcLayer0Yuv422_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer0Yuv422", "role": "write" }} , 
 	{ "name": "srcLayer0Yuv422_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "srcLayer0Yuv422", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer0Yuv422_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "srcLayer0Yuv422", "role": "fifo_cap" }}  ]}

set ArgLastReadFirstWriteLatency {
	v_mix_420_to_422_false_1 {
		srcLayer0 {Type I LastRead 1 FirstWrite -1}
		height {Type I LastRead 0 FirstWrite -1}
		width {Type I LastRead 0 FirstWrite -1}
		layerEnableFlag {Type I LastRead 0 FirstWrite -1}
		srcLayer0Yuv422 {Type O LastRead -1 FirstWrite 1}}
	v_mix_420_to_422_false_1_Pipeline_VITIS_LOOP_76_2 {
		width {Type I LastRead 0 FirstWrite -1}
		srcLayer0 {Type I LastRead 1 FirstWrite -1}
		srcLayer0Yuv422 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "2079001"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "2079001"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	srcLayer0 { ap_fifo {  { srcLayer0_dout fifo_data_out 0 24 }  { srcLayer0_empty_n fifo_status_empty 0 1 }  { srcLayer0_read fifo_data_in 1 1 }  { srcLayer0_num_data_valid fifo_update 0 3 }  { srcLayer0_fifo_cap fifo_data 0 3 } } }
	height { ap_stable {  { height in_data 0 11 } } }
	width { ap_stable {  { width in_data 0 11 } } }
	layerEnableFlag { ap_stable {  { layerEnableFlag in_data 0 1 } } }
	srcLayer0Yuv422 { ap_fifo {  { srcLayer0Yuv422_din fifo_data_out 1 24 }  { srcLayer0Yuv422_full_n fifo_status_empty 0 1 }  { srcLayer0Yuv422_write fifo_data_in 1 1 }  { srcLayer0Yuv422_num_data_valid fifo_update 0 32 }  { srcLayer0Yuv422_fifo_cap fifo_data 0 32 } } }
}
