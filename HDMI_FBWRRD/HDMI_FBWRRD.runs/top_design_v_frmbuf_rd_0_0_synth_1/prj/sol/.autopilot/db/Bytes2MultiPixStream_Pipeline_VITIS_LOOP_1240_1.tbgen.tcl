set moduleName Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1240_1
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
set C_modelName {Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1240_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ tmp_3 int 9 regular {ap_stable 0} }
	{ icmp_ln1229 int 1 regular {ap_stable 0} }
	{ icmp_ln1271_5 int 1 regular {ap_stable 0} }
	{ icmp_ln1271_4 int 1 regular {ap_stable 0} }
	{ icmp_ln1271_3 int 1 regular {ap_stable 0} }
	{ icmp9 int 1 regular {ap_stable 0} }
	{ icmp_ln1271_1 int 1 regular {ap_stable 0} }
	{ img int 24 regular {fifo 1 volatile }  }
	{ icmp6 int 1 regular {ap_stable 0} }
	{ icmp_ln1250 int 1 regular {ap_stable 0} }
	{ bytePlanes int 64 regular {fifo 0 volatile }  }
	{ add_ln1247 int 10 regular {ap_stable 0} }
	{ icmp_ln1247 int 1 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "tmp_3", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1229", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1271_5", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1271_4", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1271_3", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp9", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1271_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "icmp6", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1250", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln1247", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1247", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ img_din sc_out sc_lv 24 signal 7 } 
	{ img_full_n sc_in sc_logic 1 signal 7 } 
	{ img_write sc_out sc_logic 1 signal 7 } 
	{ img_num_data_valid sc_in sc_lv 32 signal 7 } 
	{ img_fifo_cap sc_in sc_lv 32 signal 7 } 
	{ bytePlanes_dout sc_in sc_lv 64 signal 10 } 
	{ bytePlanes_empty_n sc_in sc_logic 1 signal 10 } 
	{ bytePlanes_read sc_out sc_logic 1 signal 10 } 
	{ bytePlanes_num_data_valid sc_in sc_lv 10 signal 10 } 
	{ bytePlanes_fifo_cap sc_in sc_lv 10 signal 10 } 
	{ tmp_3 sc_in sc_lv 9 signal 0 } 
	{ icmp_ln1229 sc_in sc_lv 1 signal 1 } 
	{ icmp_ln1271_5 sc_in sc_lv 1 signal 2 } 
	{ icmp_ln1271_4 sc_in sc_lv 1 signal 3 } 
	{ icmp_ln1271_3 sc_in sc_lv 1 signal 4 } 
	{ icmp9 sc_in sc_lv 1 signal 5 } 
	{ icmp_ln1271_1 sc_in sc_lv 1 signal 6 } 
	{ icmp6 sc_in sc_lv 1 signal 8 } 
	{ icmp_ln1250 sc_in sc_lv 1 signal 9 } 
	{ add_ln1247 sc_in sc_lv 10 signal 11 } 
	{ icmp_ln1247 sc_in sc_lv 1 signal 12 } 
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
 	{ "name": "tmp_3", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "tmp_3", "role": "default" }} , 
 	{ "name": "icmp_ln1229", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1229", "role": "default" }} , 
 	{ "name": "icmp_ln1271_5", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1271_5", "role": "default" }} , 
 	{ "name": "icmp_ln1271_4", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1271_4", "role": "default" }} , 
 	{ "name": "icmp_ln1271_3", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1271_3", "role": "default" }} , 
 	{ "name": "icmp9", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp9", "role": "default" }} , 
 	{ "name": "icmp_ln1271_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1271_1", "role": "default" }} , 
 	{ "name": "icmp6", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp6", "role": "default" }} , 
 	{ "name": "icmp_ln1250", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1250", "role": "default" }} , 
 	{ "name": "add_ln1247", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "add_ln1247", "role": "default" }} , 
 	{ "name": "icmp_ln1247", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1247", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1240_1 {
		tmp_3 {Type I LastRead 0 FirstWrite -1}
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
	{"Name" : "Latency", "Min" : "2", "Max" : "2562"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "2561"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tmp_3 { ap_stable {  { tmp_3 in_data 0 9 } } }
	icmp_ln1229 { ap_stable {  { icmp_ln1229 in_data 0 1 } } }
	icmp_ln1271_5 { ap_stable {  { icmp_ln1271_5 in_data 0 1 } } }
	icmp_ln1271_4 { ap_stable {  { icmp_ln1271_4 in_data 0 1 } } }
	icmp_ln1271_3 { ap_stable {  { icmp_ln1271_3 in_data 0 1 } } }
	icmp9 { ap_stable {  { icmp9 in_data 0 1 } } }
	icmp_ln1271_1 { ap_stable {  { icmp_ln1271_1 in_data 0 1 } } }
	img { ap_fifo {  { img_din fifo_data_out 1 24 }  { img_full_n fifo_status_empty 0 1 }  { img_write fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 32 }  { img_fifo_cap fifo_data 0 32 } } }
	icmp6 { ap_stable {  { icmp6 in_data 0 1 } } }
	icmp_ln1250 { ap_stable {  { icmp_ln1250 in_data 0 1 } } }
	bytePlanes { ap_fifo {  { bytePlanes_dout fifo_data_out 0 64 }  { bytePlanes_empty_n fifo_status_empty 0 1 }  { bytePlanes_read fifo_data_in 1 1 }  { bytePlanes_num_data_valid fifo_update 0 10 }  { bytePlanes_fifo_cap fifo_data 0 10 } } }
	add_ln1247 { ap_stable {  { add_ln1247 in_data 0 10 } } }
	icmp_ln1247 { ap_stable {  { icmp_ln1247 in_data 0 1 } } }
}
