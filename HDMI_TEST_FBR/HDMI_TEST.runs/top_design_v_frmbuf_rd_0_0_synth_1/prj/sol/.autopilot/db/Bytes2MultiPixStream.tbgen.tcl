set moduleName Bytes2MultiPixStream
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
set cdfgNum 12
set C_modelName {Bytes2MultiPixStream}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ bytePlanes int 64 regular {fifo 0 volatile }  }
	{ img int 24 regular {fifo 1 volatile }  }
	{ Height_val int 11 regular {ap_stable 0} }
	{ Width_val int 11 regular {ap_stable 0} }
	{ WidthInBytes_val int 14 regular {ap_stable 0} }
	{ VideoFormat_val int 6 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "bytePlanes", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Height_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "Width_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "WidthInBytes_val", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "VideoFormat_val", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} ]}
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
	{ bytePlanes_dout sc_in sc_lv 64 signal 0 } 
	{ bytePlanes_empty_n sc_in sc_logic 1 signal 0 } 
	{ bytePlanes_read sc_out sc_logic 1 signal 0 } 
	{ bytePlanes_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ bytePlanes_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ img_din sc_out sc_lv 24 signal 1 } 
	{ img_full_n sc_in sc_logic 1 signal 1 } 
	{ img_write sc_out sc_logic 1 signal 1 } 
	{ img_num_data_valid sc_in sc_lv 32 signal 1 } 
	{ img_fifo_cap sc_in sc_lv 32 signal 1 } 
	{ Height_val sc_in sc_lv 11 signal 2 } 
	{ Width_val sc_in sc_lv 11 signal 3 } 
	{ WidthInBytes_val sc_in sc_lv 14 signal 4 } 
	{ VideoFormat_val sc_in sc_lv 6 signal 5 } 
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
 	{ "name": "bytePlanes_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytePlanes", "role": "dout" }} , 
 	{ "name": "bytePlanes_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes", "role": "empty_n" }} , 
 	{ "name": "bytePlanes_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes", "role": "read" }} , 
 	{ "name": "bytePlanes_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes", "role": "fifo_cap" }} , 
 	{ "name": "img_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "img", "role": "din" }} , 
 	{ "name": "img_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "full_n" }} , 
 	{ "name": "img_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "write" }} , 
 	{ "name": "img_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "img", "role": "num_data_valid" }} , 
 	{ "name": "img_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "img", "role": "fifo_cap" }} , 
 	{ "name": "Height_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "Height_val", "role": "default" }} , 
 	{ "name": "Width_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "Width_val", "role": "default" }} , 
 	{ "name": "WidthInBytes_val", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "WidthInBytes_val", "role": "default" }} , 
 	{ "name": "VideoFormat_val", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "VideoFormat_val", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	Bytes2MultiPixStream {
		bytePlanes {Type I LastRead 3 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		Height_val {Type I LastRead 0 FirstWrite -1}
		Width_val {Type I LastRead 0 FirstWrite -1}
		WidthInBytes_val {Type I LastRead 0 FirstWrite -1}
		VideoFormat_val {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1240_1 {
		trunc_ln2 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1229 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1271_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1271_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1271_3 {Type I LastRead 0 FirstWrite -1}
		icmp9 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1271_1 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp6 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1250 {Type I LastRead 0 FirstWrite -1}
		bytePlanes {Type I LastRead 3 FirstWrite -1}
		add_ln1247 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1247 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "4152615"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "4152615"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	bytePlanes { ap_fifo {  { bytePlanes_dout fifo_data_out 0 64 }  { bytePlanes_empty_n fifo_status_empty 0 1 }  { bytePlanes_read fifo_data_in 1 1 }  { bytePlanes_num_data_valid fifo_update 0 10 }  { bytePlanes_fifo_cap fifo_data 0 10 } } }
	img { ap_fifo {  { img_din fifo_data_out 1 24 }  { img_full_n fifo_status_empty 0 1 }  { img_write fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 32 }  { img_fifo_cap fifo_data 0 32 } } }
	Height_val { ap_stable {  { Height_val in_data 0 11 } } }
	Width_val { ap_stable {  { Width_val in_data 0 11 } } }
	WidthInBytes_val { ap_stable {  { WidthInBytes_val in_data 0 14 } } }
	VideoFormat_val { ap_stable {  { VideoFormat_val in_data 0 6 } } }
}
