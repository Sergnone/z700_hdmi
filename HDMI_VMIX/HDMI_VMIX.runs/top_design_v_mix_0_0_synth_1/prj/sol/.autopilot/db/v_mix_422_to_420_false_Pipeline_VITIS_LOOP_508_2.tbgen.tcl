set moduleName v_mix_422_to_420_false_Pipeline_VITIS_LOOP_508_2
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
set C_modelName {v_mix_422_to_420<false>_Pipeline_VITIS_LOOP_508_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ width_val int 11 regular {ap_stable 0} }
	{ out422 int 24 regular {fifo 0 volatile }  }
	{ out420 int 24 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "width_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "out422", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "out420", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ out422_dout sc_in sc_lv 24 signal 1 } 
	{ out422_empty_n sc_in sc_logic 1 signal 1 } 
	{ out422_read sc_out sc_logic 1 signal 1 } 
	{ out422_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ out422_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ out420_din sc_out sc_lv 24 signal 2 } 
	{ out420_full_n sc_in sc_logic 1 signal 2 } 
	{ out420_write sc_out sc_logic 1 signal 2 } 
	{ out420_num_data_valid sc_in sc_lv 32 signal 2 } 
	{ out420_fifo_cap sc_in sc_lv 32 signal 2 } 
	{ width_val sc_in sc_lv 11 signal 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "out422_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "out422", "role": "dout" }} , 
 	{ "name": "out422_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out422", "role": "empty_n" }} , 
 	{ "name": "out422_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out422", "role": "read" }} , 
 	{ "name": "out422_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out422", "role": "num_data_valid" }} , 
 	{ "name": "out422_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out422", "role": "fifo_cap" }} , 
 	{ "name": "out420_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "out420", "role": "din" }} , 
 	{ "name": "out420_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out420", "role": "full_n" }} , 
 	{ "name": "out420_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out420", "role": "write" }} , 
 	{ "name": "out420_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out420", "role": "num_data_valid" }} , 
 	{ "name": "out420_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out420", "role": "fifo_cap" }} , 
 	{ "name": "width_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "width_val", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	v_mix_422_to_420_false_Pipeline_VITIS_LOOP_508_2 {
		width_val {Type I LastRead 0 FirstWrite -1}
		out422 {Type I LastRead 1 FirstWrite -1}
		out420 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "66", "Max" : "1922"}
	, {"Name" : "Interval", "Min" : "65", "Max" : "1921"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	width_val { ap_stable {  { width_val in_data 0 11 } } }
	out422 { ap_fifo {  { out422_dout fifo_data_out 0 24 }  { out422_empty_n fifo_status_empty 0 1 }  { out422_read fifo_data_in 1 1 }  { out422_num_data_valid fifo_update 0 3 }  { out422_fifo_cap fifo_data 0 3 } } }
	out420 { ap_fifo {  { out420_din fifo_data_out 1 24 }  { out420_full_n fifo_status_empty 0 1 }  { out420_write fifo_data_in 1 1 }  { out420_num_data_valid fifo_update 0 32 }  { out420_fifo_cap fifo_data 0 32 } } }
}
