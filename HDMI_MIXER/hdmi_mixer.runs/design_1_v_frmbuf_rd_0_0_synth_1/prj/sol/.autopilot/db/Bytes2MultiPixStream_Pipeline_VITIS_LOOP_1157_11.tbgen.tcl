set moduleName Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1157_11
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
set cdfgNum 28
set C_modelName {Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1157_11}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ loopWidth_3 int 11 regular {ap_stable 0} }
	{ icmp_ln1147 int 1 regular {ap_stable 0} }
	{ icmp_ln1173_1 int 1 regular {ap_stable 0} }
	{ bytePlanes_plane0 int 64 regular {fifo 0 volatile }  }
	{ sext_ln1173 int 12 regular {ap_stable 0} }
	{ img int 24 regular {fifo 1 volatile }  }
	{ icmp26 int 1 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "loopWidth_3", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1147", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1173_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane0", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1173", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "icmp26", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ img_din sc_out sc_lv 24 signal 5 } 
	{ img_full_n sc_in sc_logic 1 signal 5 } 
	{ img_write sc_out sc_logic 1 signal 5 } 
	{ img_num_data_valid sc_in sc_lv 32 signal 5 } 
	{ img_fifo_cap sc_in sc_lv 32 signal 5 } 
	{ bytePlanes_plane0_dout sc_in sc_lv 64 signal 3 } 
	{ bytePlanes_plane0_empty_n sc_in sc_logic 1 signal 3 } 
	{ bytePlanes_plane0_read sc_out sc_logic 1 signal 3 } 
	{ bytePlanes_plane0_num_data_valid sc_in sc_lv 10 signal 3 } 
	{ bytePlanes_plane0_fifo_cap sc_in sc_lv 10 signal 3 } 
	{ loopWidth_3 sc_in sc_lv 11 signal 0 } 
	{ icmp_ln1147 sc_in sc_lv 1 signal 1 } 
	{ icmp_ln1173_1 sc_in sc_lv 1 signal 2 } 
	{ sext_ln1173 sc_in sc_lv 12 signal 4 } 
	{ icmp26 sc_in sc_lv 1 signal 6 } 
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
 	{ "name": "bytePlanes_plane0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "dout" }} , 
 	{ "name": "bytePlanes_plane0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "empty_n" }} , 
 	{ "name": "bytePlanes_plane0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "read" }} , 
 	{ "name": "bytePlanes_plane0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "fifo_cap" }} , 
 	{ "name": "loopWidth_3", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "loopWidth_3", "role": "default" }} , 
 	{ "name": "icmp_ln1147", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1147", "role": "default" }} , 
 	{ "name": "icmp_ln1173_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1173_1", "role": "default" }} , 
 	{ "name": "sext_ln1173", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "sext_ln1173", "role": "default" }} , 
 	{ "name": "icmp26", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp26", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1157_11 {
		loopWidth_3 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1147 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1173_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		sext_ln1173 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp26 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "5762"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "5761"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	loopWidth_3 { ap_stable {  { loopWidth_3 in_data 0 11 } } }
	icmp_ln1147 { ap_stable {  { icmp_ln1147 in_data 0 1 } } }
	icmp_ln1173_1 { ap_stable {  { icmp_ln1173_1 in_data 0 1 } } }
	bytePlanes_plane0 { ap_fifo {  { bytePlanes_plane0_dout fifo_data_out 0 64 }  { bytePlanes_plane0_empty_n fifo_status_empty 0 1 }  { bytePlanes_plane0_read fifo_data_in 1 1 }  { bytePlanes_plane0_num_data_valid fifo_update 0 10 }  { bytePlanes_plane0_fifo_cap fifo_data 0 10 } } }
	sext_ln1173 { ap_stable {  { sext_ln1173 in_data 0 12 } } }
	img { ap_fifo {  { img_din fifo_data_out 1 24 }  { img_full_n fifo_status_empty 0 1 }  { img_write fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 32 }  { img_fifo_cap fifo_data 0 32 } } }
	icmp26 { ap_stable {  { icmp26 in_data 0 1 } } }
}
