set moduleName Bytes2MultiPixStream_Pipeline_VITIS_LOOP_755_1
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
set C_modelName {Bytes2MultiPixStream_Pipeline_VITIS_LOOP_755_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ trunc_ln745_1 int 11 regular {ap_stable 0} }
	{ icmp_ln748 int 1 regular {ap_stable 0} }
	{ icmp_ln773_5 int 1 regular {ap_stable 0} }
	{ icmp_ln773_4 int 1 regular {ap_stable 0} }
	{ icmp_ln773_3 int 1 regular {ap_stable 0} }
	{ icmp11 int 1 regular {ap_stable 0} }
	{ icmp_ln773_1 int 1 regular {ap_stable 0} }
	{ bytePlanes_plane0 int 64 regular {fifo 0 volatile }  }
	{ bytePlanes_plane1 int 64 regular {fifo 0 volatile }  }
	{ bytePlanes_plane2 int 64 regular {fifo 0 volatile }  }
	{ add_ln773 int 12 regular {ap_stable 0} }
	{ img int 24 regular {fifo 1 volatile }  }
	{ icmp8 int 1 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "trunc_ln745_1", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln748", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln773_5", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln773_4", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln773_3", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp11", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln773_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane0", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane1", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane2", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln773", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "icmp8", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 35
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ img_din sc_out sc_lv 24 signal 11 } 
	{ img_full_n sc_in sc_logic 1 signal 11 } 
	{ img_write sc_out sc_logic 1 signal 11 } 
	{ img_num_data_valid sc_in sc_lv 32 signal 11 } 
	{ img_fifo_cap sc_in sc_lv 32 signal 11 } 
	{ bytePlanes_plane0_dout sc_in sc_lv 64 signal 7 } 
	{ bytePlanes_plane0_empty_n sc_in sc_logic 1 signal 7 } 
	{ bytePlanes_plane0_read sc_out sc_logic 1 signal 7 } 
	{ bytePlanes_plane0_num_data_valid sc_in sc_lv 10 signal 7 } 
	{ bytePlanes_plane0_fifo_cap sc_in sc_lv 10 signal 7 } 
	{ bytePlanes_plane1_dout sc_in sc_lv 64 signal 8 } 
	{ bytePlanes_plane1_empty_n sc_in sc_logic 1 signal 8 } 
	{ bytePlanes_plane1_read sc_out sc_logic 1 signal 8 } 
	{ bytePlanes_plane1_num_data_valid sc_in sc_lv 10 signal 8 } 
	{ bytePlanes_plane1_fifo_cap sc_in sc_lv 10 signal 8 } 
	{ bytePlanes_plane2_dout sc_in sc_lv 64 signal 9 } 
	{ bytePlanes_plane2_empty_n sc_in sc_logic 1 signal 9 } 
	{ bytePlanes_plane2_read sc_out sc_logic 1 signal 9 } 
	{ bytePlanes_plane2_num_data_valid sc_in sc_lv 10 signal 9 } 
	{ bytePlanes_plane2_fifo_cap sc_in sc_lv 10 signal 9 } 
	{ trunc_ln745_1 sc_in sc_lv 11 signal 0 } 
	{ icmp_ln748 sc_in sc_lv 1 signal 1 } 
	{ icmp_ln773_5 sc_in sc_lv 1 signal 2 } 
	{ icmp_ln773_4 sc_in sc_lv 1 signal 3 } 
	{ icmp_ln773_3 sc_in sc_lv 1 signal 4 } 
	{ icmp11 sc_in sc_lv 1 signal 5 } 
	{ icmp_ln773_1 sc_in sc_lv 1 signal 6 } 
	{ add_ln773 sc_in sc_lv 12 signal 10 } 
	{ icmp8 sc_in sc_lv 1 signal 12 } 
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
 	{ "name": "bytePlanes_plane1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "dout" }} , 
 	{ "name": "bytePlanes_plane1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "empty_n" }} , 
 	{ "name": "bytePlanes_plane1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "read" }} , 
 	{ "name": "bytePlanes_plane1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "fifo_cap" }} , 
 	{ "name": "bytePlanes_plane2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytePlanes_plane2", "role": "dout" }} , 
 	{ "name": "bytePlanes_plane2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane2", "role": "empty_n" }} , 
 	{ "name": "bytePlanes_plane2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane2", "role": "read" }} , 
 	{ "name": "bytePlanes_plane2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes_plane2", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes_plane2", "role": "fifo_cap" }} , 
 	{ "name": "trunc_ln745_1", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "trunc_ln745_1", "role": "default" }} , 
 	{ "name": "icmp_ln748", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln748", "role": "default" }} , 
 	{ "name": "icmp_ln773_5", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln773_5", "role": "default" }} , 
 	{ "name": "icmp_ln773_4", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln773_4", "role": "default" }} , 
 	{ "name": "icmp_ln773_3", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln773_3", "role": "default" }} , 
 	{ "name": "icmp11", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp11", "role": "default" }} , 
 	{ "name": "icmp_ln773_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln773_1", "role": "default" }} , 
 	{ "name": "add_ln773", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "add_ln773", "role": "default" }} , 
 	{ "name": "icmp8", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp8", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_755_1 {
		trunc_ln745_1 {Type I LastRead 0 FirstWrite -1}
		icmp_ln748 {Type I LastRead 0 FirstWrite -1}
		icmp_ln773_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln773_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln773_3 {Type I LastRead 0 FirstWrite -1}
		icmp11 {Type I LastRead 0 FirstWrite -1}
		icmp_ln773_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		bytePlanes_plane1 {Type I LastRead 1 FirstWrite -1}
		bytePlanes_plane2 {Type I LastRead 1 FirstWrite -1}
		add_ln773 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp8 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "11522"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "11521"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	trunc_ln745_1 { ap_stable {  { trunc_ln745_1 in_data 0 11 } } }
	icmp_ln748 { ap_stable {  { icmp_ln748 in_data 0 1 } } }
	icmp_ln773_5 { ap_stable {  { icmp_ln773_5 in_data 0 1 } } }
	icmp_ln773_4 { ap_stable {  { icmp_ln773_4 in_data 0 1 } } }
	icmp_ln773_3 { ap_stable {  { icmp_ln773_3 in_data 0 1 } } }
	icmp11 { ap_stable {  { icmp11 in_data 0 1 } } }
	icmp_ln773_1 { ap_stable {  { icmp_ln773_1 in_data 0 1 } } }
	bytePlanes_plane0 { ap_fifo {  { bytePlanes_plane0_dout fifo_data_out 0 64 }  { bytePlanes_plane0_empty_n fifo_status_empty 0 1 }  { bytePlanes_plane0_read fifo_data_in 1 1 }  { bytePlanes_plane0_num_data_valid fifo_update 0 10 }  { bytePlanes_plane0_fifo_cap fifo_data 0 10 } } }
	bytePlanes_plane1 { ap_fifo {  { bytePlanes_plane1_dout fifo_data_out 0 64 }  { bytePlanes_plane1_empty_n fifo_status_empty 0 1 }  { bytePlanes_plane1_read fifo_data_in 1 1 }  { bytePlanes_plane1_num_data_valid fifo_update 0 10 }  { bytePlanes_plane1_fifo_cap fifo_data 0 10 } } }
	bytePlanes_plane2 { ap_fifo {  { bytePlanes_plane2_dout fifo_data_out 0 64 }  { bytePlanes_plane2_empty_n fifo_status_empty 0 1 }  { bytePlanes_plane2_read fifo_data_in 1 1 }  { bytePlanes_plane2_num_data_valid fifo_update 0 10 }  { bytePlanes_plane2_fifo_cap fifo_data 0 10 } } }
	add_ln773 { ap_stable {  { add_ln773 in_data 0 12 } } }
	img { ap_fifo {  { img_din fifo_data_out 1 24 }  { img_full_n fifo_status_empty 0 1 }  { img_write fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 32 }  { img_fifo_cap fifo_data 0 32 } } }
	icmp8 { ap_stable {  { icmp8 in_data 0 1 } } }
}
