set moduleName Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1450_1
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
set cdfgNum 12
set C_modelName {Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1450_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ trunc_ln1437_1 int 11 regular {ap_stable 0} }
	{ bytePlanes int 64 regular {fifo 0 volatile }  }
	{ add_ln1467 int 12 regular {ap_stable 0} }
	{ img int 24 regular {fifo 1 volatile }  }
	{ rev int 1 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "trunc_ln1437_1", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln1467", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rev", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ img_din sc_out sc_lv 24 signal 3 } 
	{ img_full_n sc_in sc_logic 1 signal 3 } 
	{ img_write sc_out sc_logic 1 signal 3 } 
	{ img_num_data_valid sc_in sc_lv 32 signal 3 } 
	{ img_fifo_cap sc_in sc_lv 32 signal 3 } 
	{ bytePlanes_dout sc_in sc_lv 64 signal 1 } 
	{ bytePlanes_empty_n sc_in sc_logic 1 signal 1 } 
	{ bytePlanes_read sc_out sc_logic 1 signal 1 } 
	{ bytePlanes_num_data_valid sc_in sc_lv 10 signal 1 } 
	{ bytePlanes_fifo_cap sc_in sc_lv 10 signal 1 } 
	{ trunc_ln1437_1 sc_in sc_lv 11 signal 0 } 
	{ add_ln1467 sc_in sc_lv 12 signal 2 } 
	{ rev sc_in sc_lv 1 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "img_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "img", "role": "din" }} , 
 	{ "name": "img_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "full_n" }} , 
 	{ "name": "img_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "write" }} , 
 	{ "name": "img_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "img", "role": "num_data_valid" }} , 
 	{ "name": "img_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "img", "role": "fifo_cap" }} , 
 	{ "name": "bytePlanes_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytePlanes", "role": "dout" }} , 
 	{ "name": "bytePlanes_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes", "role": "empty_n" }} , 
 	{ "name": "bytePlanes_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes", "role": "read" }} , 
 	{ "name": "bytePlanes_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes", "role": "fifo_cap" }} , 
 	{ "name": "trunc_ln1437_1", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "trunc_ln1437_1", "role": "default" }} , 
 	{ "name": "add_ln1467", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "add_ln1467", "role": "default" }} , 
 	{ "name": "rev", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rev", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1450_1 {
		trunc_ln1437_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes {Type I LastRead 1 FirstWrite -1}
		add_ln1467 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		rev {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2882"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "2881"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	trunc_ln1437_1 { ap_stable {  { trunc_ln1437_1 in_data 0 11 } } }
	bytePlanes { ap_fifo {  { bytePlanes_dout fifo_data_out 0 64 }  { bytePlanes_empty_n fifo_status_empty 0 1 }  { bytePlanes_read fifo_data_in 1 1 }  { bytePlanes_num_data_valid fifo_update 0 10 }  { bytePlanes_fifo_cap fifo_data 0 10 } } }
	add_ln1467 { ap_stable {  { add_ln1467 in_data 0 12 } } }
	img { ap_fifo {  { img_din fifo_data_out 1 24 }  { img_full_n fifo_status_empty 0 1 }  { img_write fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 32 }  { img_fifo_cap fifo_data 0 32 } } }
	rev { ap_stable {  { rev in_data 0 1 } } }
}
