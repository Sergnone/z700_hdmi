set moduleName Bytes2MultiPixStream_13_Pipeline_VITIS_LOOP_1383_2
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
set C_modelName {Bytes2MultiPixStream<13>_Pipeline_VITIS_LOOP_1383_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ Width int 16 regular {ap_stable 0} }
	{ srcLayer1 int 24 regular {fifo 1 volatile }  }
	{ srcLayer1Alpha int 8 regular {fifo 1 volatile }  }
	{ bytesLayer1_plane0 int 64 regular {fifo 0 volatile }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "Width", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "srcLayer1", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "srcLayer1Alpha", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bytesLayer1_plane0", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ bytesLayer1_plane0_dout sc_in sc_lv 64 signal 3 } 
	{ bytesLayer1_plane0_empty_n sc_in sc_logic 1 signal 3 } 
	{ bytesLayer1_plane0_read sc_out sc_logic 1 signal 3 } 
	{ bytesLayer1_plane0_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ bytesLayer1_plane0_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ srcLayer1_din sc_out sc_lv 24 signal 1 } 
	{ srcLayer1_full_n sc_in sc_logic 1 signal 1 } 
	{ srcLayer1_write sc_out sc_logic 1 signal 1 } 
	{ srcLayer1_num_data_valid sc_in sc_lv 32 signal 1 } 
	{ srcLayer1_fifo_cap sc_in sc_lv 32 signal 1 } 
	{ srcLayer1Alpha_din sc_out sc_lv 8 signal 2 } 
	{ srcLayer1Alpha_full_n sc_in sc_logic 1 signal 2 } 
	{ srcLayer1Alpha_write sc_out sc_logic 1 signal 2 } 
	{ srcLayer1Alpha_num_data_valid sc_in sc_lv 32 signal 2 } 
	{ srcLayer1Alpha_fifo_cap sc_in sc_lv 32 signal 2 } 
	{ Width sc_in sc_lv 16 signal 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
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
 	{ "name": "srcLayer1Alpha_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "srcLayer1Alpha", "role": "din" }} , 
 	{ "name": "srcLayer1Alpha_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1Alpha", "role": "full_n" }} , 
 	{ "name": "srcLayer1Alpha_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1Alpha", "role": "write" }} , 
 	{ "name": "srcLayer1Alpha_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "srcLayer1Alpha", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer1Alpha_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "srcLayer1Alpha", "role": "fifo_cap" }} , 
 	{ "name": "Width", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Width", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	Bytes2MultiPixStream_13_Pipeline_VITIS_LOOP_1383_2 {
		Width {Type I LastRead 0 FirstWrite -1}
		srcLayer1 {Type O LastRead -1 FirstWrite 2}
		srcLayer1Alpha {Type O LastRead -1 FirstWrite 2}
		bytesLayer1_plane0 {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "65538"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "65536"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	Width { ap_stable {  { Width in_data 0 16 } } }
	srcLayer1 { ap_fifo {  { srcLayer1_din fifo_data_out 1 24 }  { srcLayer1_full_n fifo_status_empty 0 1 }  { srcLayer1_write fifo_data_in 1 1 }  { srcLayer1_num_data_valid fifo_update 0 32 }  { srcLayer1_fifo_cap fifo_data 0 32 } } }
	srcLayer1Alpha { ap_fifo {  { srcLayer1Alpha_din fifo_data_out 1 8 }  { srcLayer1Alpha_full_n fifo_status_empty 0 1 }  { srcLayer1Alpha_write fifo_data_in 1 1 }  { srcLayer1Alpha_num_data_valid fifo_update 0 32 }  { srcLayer1Alpha_fifo_cap fifo_data 0 32 } } }
	bytesLayer1_plane0 { ap_fifo {  { bytesLayer1_plane0_dout fifo_data_out 0 64 }  { bytesLayer1_plane0_empty_n fifo_status_empty 0 1 }  { bytesLayer1_plane0_read fifo_data_in 1 1 }  { bytesLayer1_plane0_num_data_valid fifo_update 0 3 }  { bytesLayer1_plane0_fifo_cap fifo_data 0 3 } } }
}
