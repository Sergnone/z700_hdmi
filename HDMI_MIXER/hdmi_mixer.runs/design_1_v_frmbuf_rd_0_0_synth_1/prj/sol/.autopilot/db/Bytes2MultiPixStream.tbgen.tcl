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
set cdfgNum 28
set C_modelName {Bytes2MultiPixStream}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ bytePlanes_plane0 int 64 regular {fifo 0 volatile }  }
	{ bytePlanes_plane1 int 64 regular {fifo 0 volatile }  }
	{ bytePlanes_plane2 int 64 regular {fifo 0 volatile }  }
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
	{ "Name" : "bytePlanes_plane0", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane1", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane2", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Height_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "Width_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "WidthInBytes_val", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "VideoFormat_val", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 34
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
	{ bytePlanes_plane0_dout sc_in sc_lv 64 signal 0 } 
	{ bytePlanes_plane0_empty_n sc_in sc_logic 1 signal 0 } 
	{ bytePlanes_plane0_read sc_out sc_logic 1 signal 0 } 
	{ bytePlanes_plane0_num_data_valid sc_in sc_lv 10 signal 0 } 
	{ bytePlanes_plane0_fifo_cap sc_in sc_lv 10 signal 0 } 
	{ bytePlanes_plane1_dout sc_in sc_lv 64 signal 1 } 
	{ bytePlanes_plane1_empty_n sc_in sc_logic 1 signal 1 } 
	{ bytePlanes_plane1_read sc_out sc_logic 1 signal 1 } 
	{ bytePlanes_plane1_num_data_valid sc_in sc_lv 10 signal 1 } 
	{ bytePlanes_plane1_fifo_cap sc_in sc_lv 10 signal 1 } 
	{ bytePlanes_plane2_dout sc_in sc_lv 64 signal 2 } 
	{ bytePlanes_plane2_empty_n sc_in sc_logic 1 signal 2 } 
	{ bytePlanes_plane2_read sc_out sc_logic 1 signal 2 } 
	{ bytePlanes_plane2_num_data_valid sc_in sc_lv 10 signal 2 } 
	{ bytePlanes_plane2_fifo_cap sc_in sc_lv 10 signal 2 } 
	{ img_din sc_out sc_lv 24 signal 3 } 
	{ img_full_n sc_in sc_logic 1 signal 3 } 
	{ img_write sc_out sc_logic 1 signal 3 } 
	{ img_num_data_valid sc_in sc_lv 32 signal 3 } 
	{ img_fifo_cap sc_in sc_lv 32 signal 3 } 
	{ Height_val sc_in sc_lv 11 signal 4 } 
	{ Width_val sc_in sc_lv 11 signal 5 } 
	{ WidthInBytes_val sc_in sc_lv 14 signal 6 } 
	{ VideoFormat_val sc_in sc_lv 6 signal 7 } 
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
		bytePlanes_plane0 {Type I LastRead 3 FirstWrite -1}
		bytePlanes_plane1 {Type I LastRead 1 FirstWrite -1}
		bytePlanes_plane2 {Type I LastRead 1 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		Height_val {Type I LastRead 0 FirstWrite -1}
		Width_val {Type I LastRead 0 FirstWrite -1}
		WidthInBytes_val {Type I LastRead 0 FirstWrite -1}
		VideoFormat_val {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1772_29 {
		loopWidth_9 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		sext_ln1765 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		rev51 {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1532_26 {
		loopWidth_8 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1522 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1548_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1548_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1548_3 {Type I LastRead 0 FirstWrite -1}
		icmp48 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1548_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		sext_ln1548 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp45 {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1450_23 {
		loopWidth_7 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		sext_ln1443 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		rev {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1398_20 {
		trunc_ln5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1387 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1426_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1426_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1426_3 {Type I LastRead 0 FirstWrite -1}
		icmp41 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1426_1 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp38 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1408 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 3 FirstWrite -1}
		add_ln1405 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1405 {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1240_17 {
		trunc_ln2 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1229 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1271_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1271_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1271_3 {Type I LastRead 0 FirstWrite -1}
		icmp35 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1271_1 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp32 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1250 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 3 FirstWrite -1}
		add_ln1247 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1247 {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1197_14 {
		loopWidth_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1187 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1213_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		sext_ln1213 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp29 {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1157_11 {
		loopWidth_3 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1147 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1173_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		sext_ln1173 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp26 {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_954_8 {
		loopWidth_2 {Type I LastRead 0 FirstWrite -1}
		icmp_ln944 {Type I LastRead 0 FirstWrite -1}
		icmp_ln975_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln975_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln975_3 {Type I LastRead 0 FirstWrite -1}
		icmp23 {Type I LastRead 0 FirstWrite -1}
		icmp_ln975_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln975 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp20 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		VideoFormat_val {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane1 {Type I LastRead 1 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_862_5 {
		loopWidth_1 {Type I LastRead 0 FirstWrite -1}
		icmp_ln849 {Type I LastRead 0 FirstWrite -1}
		icmp_ln928_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln928_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln928_3 {Type I LastRead 0 FirstWrite -1}
		icmp17 {Type I LastRead 0 FirstWrite -1}
		icmp_ln928_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln928 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 2}
		icmp14 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane1 {Type I LastRead 1 FirstWrite -1}
		bytePlanes_plane2 {Type I LastRead 1 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 2 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		pixV_1_out {Type IO LastRead 3 FirstWrite 1}
		pixU_1_out {Type IO LastRead 2 FirstWrite 1}}
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
	{"Name" : "Latency", "Min" : "1", "Max" : "12447005"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "12447005"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	bytePlanes_plane0 { ap_fifo {  { bytePlanes_plane0_dout fifo_data_out 0 64 }  { bytePlanes_plane0_empty_n fifo_status_empty 0 1 }  { bytePlanes_plane0_read fifo_data_in 1 1 }  { bytePlanes_plane0_num_data_valid fifo_update 0 10 }  { bytePlanes_plane0_fifo_cap fifo_data 0 10 } } }
	bytePlanes_plane1 { ap_fifo {  { bytePlanes_plane1_dout fifo_data_out 0 64 }  { bytePlanes_plane1_empty_n fifo_status_empty 0 1 }  { bytePlanes_plane1_read fifo_data_in 1 1 }  { bytePlanes_plane1_num_data_valid fifo_update 0 10 }  { bytePlanes_plane1_fifo_cap fifo_data 0 10 } } }
	bytePlanes_plane2 { ap_fifo {  { bytePlanes_plane2_dout fifo_data_out 0 64 }  { bytePlanes_plane2_empty_n fifo_status_empty 0 1 }  { bytePlanes_plane2_read fifo_data_in 1 1 }  { bytePlanes_plane2_num_data_valid fifo_update 0 10 }  { bytePlanes_plane2_fifo_cap fifo_data 0 10 } } }
	img { ap_fifo {  { img_din fifo_data_out 1 24 }  { img_full_n fifo_status_empty 0 1 }  { img_write fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 32 }  { img_fifo_cap fifo_data 0 32 } } }
	Height_val { ap_stable {  { Height_val in_data 0 11 } } }
	Width_val { ap_stable {  { Width_val in_data 0 11 } } }
	WidthInBytes_val { ap_stable {  { WidthInBytes_val in_data 0 14 } } }
	VideoFormat_val { ap_stable {  { VideoFormat_val in_data 0 6 } } }
}
