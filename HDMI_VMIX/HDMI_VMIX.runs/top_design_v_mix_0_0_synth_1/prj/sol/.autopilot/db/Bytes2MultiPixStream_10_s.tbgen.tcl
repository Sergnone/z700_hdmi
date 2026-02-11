set moduleName Bytes2MultiPixStream_10_s
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
set cdfgNum 37
set C_modelName {Bytes2MultiPixStream<10>}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ bytesLayer1_plane0 int 64 regular {fifo 0 volatile }  }
	{ srcLayer1 int 24 regular {fifo 1 volatile }  }
	{ Height uint 16 regular {ap_stable 0} }
	{ Width uint 16 regular {ap_stable 0} }
	{ enable uint 1 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "bytesLayer1_plane0", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "srcLayer1", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Height", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "Width", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "enable", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
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
	{ bytesLayer1_plane0_dout sc_in sc_lv 64 signal 0 } 
	{ bytesLayer1_plane0_empty_n sc_in sc_logic 1 signal 0 } 
	{ bytesLayer1_plane0_read sc_out sc_logic 1 signal 0 } 
	{ bytesLayer1_plane0_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ bytesLayer1_plane0_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ srcLayer1_din sc_out sc_lv 24 signal 1 } 
	{ srcLayer1_full_n sc_in sc_logic 1 signal 1 } 
	{ srcLayer1_write sc_out sc_logic 1 signal 1 } 
	{ srcLayer1_num_data_valid sc_in sc_lv 32 signal 1 } 
	{ srcLayer1_fifo_cap sc_in sc_lv 32 signal 1 } 
	{ Height sc_in sc_lv 16 signal 2 } 
	{ Width sc_in sc_lv 16 signal 3 } 
	{ enable sc_in sc_lv 1 signal 4 } 
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
 	{ "name": "bytesLayer1_plane0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytesLayer1_plane0", "role": "dout" }} , 
 	{ "name": "bytesLayer1_plane0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytesLayer1_plane0", "role": "empty_n" }} , 
 	{ "name": "bytesLayer1_plane0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytesLayer1_plane0", "role": "read" }} , 
 	{ "name": "bytesLayer1_plane0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bytesLayer1_plane0", "role": "num_data_valid" }} , 
 	{ "name": "bytesLayer1_plane0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bytesLayer1_plane0", "role": "fifo_cap" }} , 
 	{ "name": "srcLayer1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "srcLayer1", "role": "din" }} , 
 	{ "name": "srcLayer1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1", "role": "full_n" }} , 
 	{ "name": "srcLayer1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1", "role": "write" }} , 
 	{ "name": "srcLayer1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "srcLayer1", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "srcLayer1", "role": "fifo_cap" }} , 
 	{ "name": "Height", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Height", "role": "default" }} , 
 	{ "name": "Width", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Width", "role": "default" }} , 
 	{ "name": "enable", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "enable", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	Bytes2MultiPixStream_10_s {
		bytesLayer1_plane0 {Type I LastRead 1 FirstWrite -1}
		srcLayer1 {Type O LastRead -1 FirstWrite 2}
		Height {Type I LastRead 0 FirstWrite -1}
		Width {Type I LastRead 0 FirstWrite -1}
		enable {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_10_Pipeline_VITIS_LOOP_1104_2 {
		Width {Type I LastRead 0 FirstWrite -1}
		srcLayer1 {Type O LastRead -1 FirstWrite 2}
		bytesLayer1_plane0 {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "141566401"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "141566401"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	bytesLayer1_plane0 { ap_fifo {  { bytesLayer1_plane0_dout fifo_data_out 0 64 }  { bytesLayer1_plane0_empty_n fifo_status_empty 0 1 }  { bytesLayer1_plane0_read fifo_data_in 1 1 }  { bytesLayer1_plane0_num_data_valid fifo_update 0 3 }  { bytesLayer1_plane0_fifo_cap fifo_data 0 3 } } }
	srcLayer1 { ap_fifo {  { srcLayer1_din fifo_data_out 1 24 }  { srcLayer1_full_n fifo_status_empty 0 1 }  { srcLayer1_write fifo_data_in 1 1 }  { srcLayer1_num_data_valid fifo_update 0 32 }  { srcLayer1_fifo_cap fifo_data 0 32 } } }
	Height { ap_stable {  { Height in_data 0 16 } } }
	Width { ap_stable {  { Width in_data 0 16 } } }
	enable { ap_stable {  { enable in_data 0 1 } } }
}
