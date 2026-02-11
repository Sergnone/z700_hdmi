set moduleName v_mix_422_to_444_false_2_Pipeline_VITIS_LOOP_105_2
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
set cdfgNum 37
set C_modelName {v_mix_422_to_444<false>.2_Pipeline_VITIS_LOOP_105_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ width int 11 regular {ap_stable 0} }
	{ srcLayer0Yuv422 int 24 regular {fifo 0 volatile }  }
	{ srcLayer0Yuv int 24 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "width", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "srcLayer0Yuv422", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "srcLayer0Yuv", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ srcLayer0Yuv422_dout sc_in sc_lv 24 signal 1 } 
	{ srcLayer0Yuv422_empty_n sc_in sc_logic 1 signal 1 } 
	{ srcLayer0Yuv422_read sc_out sc_logic 1 signal 1 } 
	{ srcLayer0Yuv422_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ srcLayer0Yuv422_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ srcLayer0Yuv_din sc_out sc_lv 24 signal 2 } 
	{ srcLayer0Yuv_full_n sc_in sc_logic 1 signal 2 } 
	{ srcLayer0Yuv_write sc_out sc_logic 1 signal 2 } 
	{ srcLayer0Yuv_num_data_valid sc_in sc_lv 32 signal 2 } 
	{ srcLayer0Yuv_fifo_cap sc_in sc_lv 32 signal 2 } 
	{ width sc_in sc_lv 11 signal 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "srcLayer0Yuv422_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "srcLayer0Yuv422", "role": "dout" }} , 
 	{ "name": "srcLayer0Yuv422_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer0Yuv422", "role": "empty_n" }} , 
 	{ "name": "srcLayer0Yuv422_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer0Yuv422", "role": "read" }} , 
 	{ "name": "srcLayer0Yuv422_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer0Yuv422", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer0Yuv422_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer0Yuv422", "role": "fifo_cap" }} , 
 	{ "name": "srcLayer0Yuv_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "srcLayer0Yuv", "role": "din" }} , 
 	{ "name": "srcLayer0Yuv_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer0Yuv", "role": "full_n" }} , 
 	{ "name": "srcLayer0Yuv_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer0Yuv", "role": "write" }} , 
 	{ "name": "srcLayer0Yuv_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "srcLayer0Yuv", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer0Yuv_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "srcLayer0Yuv", "role": "fifo_cap" }} , 
 	{ "name": "width", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "width", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	v_mix_422_to_444_false_2_Pipeline_VITIS_LOOP_105_2 {
		width {Type I LastRead 0 FirstWrite -1}
		srcLayer0Yuv422 {Type I LastRead 1 FirstWrite -1}
		srcLayer0Yuv {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "66", "Max" : "1922"}
	, {"Name" : "Interval", "Min" : "65", "Max" : "1921"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	width { ap_stable {  { width in_data 0 11 } } }
	srcLayer0Yuv422 { ap_fifo {  { srcLayer0Yuv422_dout fifo_data_out 0 24 }  { srcLayer0Yuv422_empty_n fifo_status_empty 0 1 }  { srcLayer0Yuv422_read fifo_data_in 1 1 }  { srcLayer0Yuv422_num_data_valid fifo_update 0 3 }  { srcLayer0Yuv422_fifo_cap fifo_data 0 3 } } }
	srcLayer0Yuv { ap_fifo {  { srcLayer0Yuv_din fifo_data_out 1 24 }  { srcLayer0Yuv_full_n fifo_status_empty 0 1 }  { srcLayer0Yuv_write fifo_data_in 1 1 }  { srcLayer0Yuv_num_data_valid fifo_update 0 32 }  { srcLayer0Yuv_fifo_cap fifo_data 0 32 } } }
}
