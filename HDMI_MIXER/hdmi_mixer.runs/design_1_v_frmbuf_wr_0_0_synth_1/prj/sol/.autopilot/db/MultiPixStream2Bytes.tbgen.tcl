set moduleName MultiPixStream2Bytes
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
set cdfgNum 29
set C_modelName {MultiPixStream2Bytes}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ img int 24 regular {fifo 0 volatile }  }
	{ bytePlanes_plane0 int 64 regular {fifo 1 volatile }  }
	{ bytePlanes_plane1 int 64 regular {fifo 1 volatile }  }
	{ bytePlanes_plane2 int 64 regular {fifo 1 volatile }  }
	{ Height_val int 11 regular {ap_stable 0} }
	{ WidthInPix_val int 11 regular {ap_stable 0} }
	{ WidthInBytes_val int 14 regular {ap_stable 0} }
	{ VideoFormat_val int 6 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane0", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bytePlanes_plane1", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bytePlanes_plane2", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Height_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "WidthInPix_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
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
	{ img_dout sc_in sc_lv 24 signal 0 } 
	{ img_empty_n sc_in sc_logic 1 signal 0 } 
	{ img_read sc_out sc_logic 1 signal 0 } 
	{ img_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ img_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ bytePlanes_plane0_din sc_out sc_lv 64 signal 1 } 
	{ bytePlanes_plane0_full_n sc_in sc_logic 1 signal 1 } 
	{ bytePlanes_plane0_write sc_out sc_logic 1 signal 1 } 
	{ bytePlanes_plane0_num_data_valid sc_in sc_lv 32 signal 1 } 
	{ bytePlanes_plane0_fifo_cap sc_in sc_lv 32 signal 1 } 
	{ bytePlanes_plane1_din sc_out sc_lv 64 signal 2 } 
	{ bytePlanes_plane1_full_n sc_in sc_logic 1 signal 2 } 
	{ bytePlanes_plane1_write sc_out sc_logic 1 signal 2 } 
	{ bytePlanes_plane1_num_data_valid sc_in sc_lv 10 signal 2 } 
	{ bytePlanes_plane1_fifo_cap sc_in sc_lv 10 signal 2 } 
	{ bytePlanes_plane2_din sc_out sc_lv 64 signal 3 } 
	{ bytePlanes_plane2_full_n sc_in sc_logic 1 signal 3 } 
	{ bytePlanes_plane2_write sc_out sc_logic 1 signal 3 } 
	{ bytePlanes_plane2_num_data_valid sc_in sc_lv 10 signal 3 } 
	{ bytePlanes_plane2_fifo_cap sc_in sc_lv 10 signal 3 } 
	{ Height_val sc_in sc_lv 11 signal 4 } 
	{ WidthInPix_val sc_in sc_lv 11 signal 5 } 
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
 	{ "name": "img_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "img", "role": "dout" }} , 
 	{ "name": "img_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "empty_n" }} , 
 	{ "name": "img_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "read" }} , 
 	{ "name": "img_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "img", "role": "num_data_valid" }} , 
 	{ "name": "img_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "img", "role": "fifo_cap" }} , 
 	{ "name": "bytePlanes_plane0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "din" }} , 
 	{ "name": "bytePlanes_plane0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "full_n" }} , 
 	{ "name": "bytePlanes_plane0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "write" }} , 
 	{ "name": "bytePlanes_plane0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "fifo_cap" }} , 
 	{ "name": "bytePlanes_plane1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "din" }} , 
 	{ "name": "bytePlanes_plane1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "full_n" }} , 
 	{ "name": "bytePlanes_plane1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "write" }} , 
 	{ "name": "bytePlanes_plane1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes_plane1", "role": "fifo_cap" }} , 
 	{ "name": "bytePlanes_plane2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytePlanes_plane2", "role": "din" }} , 
 	{ "name": "bytePlanes_plane2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane2", "role": "full_n" }} , 
 	{ "name": "bytePlanes_plane2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane2", "role": "write" }} , 
 	{ "name": "bytePlanes_plane2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes_plane2", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes_plane2", "role": "fifo_cap" }} , 
 	{ "name": "Height_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "Height_val", "role": "default" }} , 
 	{ "name": "WidthInPix_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "WidthInPix_val", "role": "default" }} , 
 	{ "name": "WidthInBytes_val", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "WidthInBytes_val", "role": "default" }} , 
 	{ "name": "VideoFormat_val", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "VideoFormat_val", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	MultiPixStream2Bytes {
		img {Type I LastRead 8 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 3}
		bytePlanes_plane1 {Type O LastRead -1 FirstWrite 9}
		bytePlanes_plane2 {Type O LastRead -1 FirstWrite 9}
		Height_val {Type I LastRead 0 FirstWrite -1}
		WidthInPix_val {Type I LastRead 0 FirstWrite -1}
		WidthInBytes_val {Type I LastRead 0 FirstWrite -1}
		VideoFormat_val {Type I LastRead 0 FirstWrite -1}}
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_1380_34 {
		loopWidth_9 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 9}
		icmp_ln1368 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1385_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1385_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1385_3 {Type I LastRead 0 FirstWrite -1}
		icmp55 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1385_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln1385 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 8 FirstWrite -1}
		icmp52 {Type I LastRead 0 FirstWrite -1}}
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_1333_29 {
		trunc_ln6 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1353_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 4}
		empty {Type I LastRead 0 FirstWrite -1}
		icmp_ln1319 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1338_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1338_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1338_3 {Type I LastRead 0 FirstWrite -1}
		icmp47 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1338_1 {Type I LastRead 0 FirstWrite -1}
		add_ln1338 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 8 FirstWrite -1}
		icmp44 {Type I LastRead 0 FirstWrite -1}}
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_1090_24 {
		trunc_ln3 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1110_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 4}
		empty {Type I LastRead 0 FirstWrite -1}
		icmp_ln1077 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1095_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1095_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1095_3 {Type I LastRead 0 FirstWrite -1}
		icmp39 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1095_1 {Type I LastRead 0 FirstWrite -1}
		add_ln1095 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 8 FirstWrite -1}
		icmp36 {Type I LastRead 0 FirstWrite -1}}
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_904_21 {
		loopWidth_6 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane1 {Type O LastRead -1 FirstWrite 9}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 9}
		VideoFormat_val {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		icmp_ln892 {Type I LastRead 0 FirstWrite -1}
		icmp_ln909_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln909_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln909_3 {Type I LastRead 0 FirstWrite -1}
		icmp33 {Type I LastRead 0 FirstWrite -1}
		icmp_ln909_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln909 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 8 FirstWrite -1}
		icmp30 {Type I LastRead 0 FirstWrite -1}}
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_863_18 {
		loopWidth_5 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 5}
		icmp_ln851 {Type I LastRead 0 FirstWrite -1}
		icmp_ln868_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln868 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 4 FirstWrite -1}
		icmp27 {Type I LastRead 0 FirstWrite -1}}
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_821_14 {
		loopWidth_4 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 5}
		icmp_ln809 {Type I LastRead 0 FirstWrite -1}
		icmp_ln826_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln826 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 4 FirstWrite -1}
		icmp24 {Type I LastRead 0 FirstWrite -1}}
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_739_11 {
		loopWidth_3 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 3}
		sext_ln735 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 2 FirstWrite -1}
		rev21 {Type I LastRead 0 FirstWrite -1}
		out_pix_4_out {Type IO LastRead 3 FirstWrite 3}}
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_697_7 {
		loopWidth_2 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 3}
		sext_ln693 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 2 FirstWrite -1}
		rev {Type I LastRead 0 FirstWrite -1}
		out_pix_2_out {Type IO LastRead 3 FirstWrite 3}}
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_605_4 {
		loopWidth_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln610 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 9}
		empty {Type I LastRead 0 FirstWrite -1}
		icmp_ln594 {Type I LastRead 0 FirstWrite -1}
		icmp_ln610_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln610_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln610_3 {Type I LastRead 0 FirstWrite -1}
		icmp17 {Type I LastRead 0 FirstWrite -1}
		icmp_ln610_1 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 8 FirstWrite -1}
		icmp14 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane1 {Type O LastRead -1 FirstWrite 9}
		bytePlanes_plane2 {Type O LastRead -1 FirstWrite 9}
		pixV_1_out {Type IO LastRead 8 FirstWrite 9}
		pixU_1_out {Type IO LastRead 8 FirstWrite 9}}
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_511_1 {
		trunc_ln499_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 9}
		bytePlanes_plane1 {Type O LastRead -1 FirstWrite 9}
		bytePlanes_plane2 {Type O LastRead -1 FirstWrite 9}
		icmp_ln502 {Type I LastRead 0 FirstWrite -1}
		icmp_ln516_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln516_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln516_3 {Type I LastRead 0 FirstWrite -1}
		icmp11 {Type I LastRead 0 FirstWrite -1}
		icmp_ln516_1 {Type I LastRead 0 FirstWrite -1}
		add_ln516 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 8 FirstWrite -1}
		icmp8 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "12447005"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "12447005"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	img { ap_fifo {  { img_dout fifo_data_out 0 24 }  { img_empty_n fifo_status_empty 0 1 }  { img_read fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 3 }  { img_fifo_cap fifo_data 0 3 } } }
	bytePlanes_plane0 { ap_fifo {  { bytePlanes_plane0_din fifo_data_out 1 64 }  { bytePlanes_plane0_full_n fifo_status_empty 0 1 }  { bytePlanes_plane0_write fifo_data_in 1 1 }  { bytePlanes_plane0_num_data_valid fifo_update 0 32 }  { bytePlanes_plane0_fifo_cap fifo_data 0 32 } } }
	bytePlanes_plane1 { ap_fifo {  { bytePlanes_plane1_din fifo_data_out 1 64 }  { bytePlanes_plane1_full_n fifo_status_empty 0 1 }  { bytePlanes_plane1_write fifo_data_in 1 1 }  { bytePlanes_plane1_num_data_valid fifo_update 0 10 }  { bytePlanes_plane1_fifo_cap fifo_data 0 10 } } }
	bytePlanes_plane2 { ap_fifo {  { bytePlanes_plane2_din fifo_data_out 1 64 }  { bytePlanes_plane2_full_n fifo_status_empty 0 1 }  { bytePlanes_plane2_write fifo_data_in 1 1 }  { bytePlanes_plane2_num_data_valid fifo_update 0 10 }  { bytePlanes_plane2_fifo_cap fifo_data 0 10 } } }
	Height_val { ap_stable {  { Height_val in_data 0 11 } } }
	WidthInPix_val { ap_stable {  { WidthInPix_val in_data 0 11 } } }
	WidthInBytes_val { ap_stable {  { WidthInBytes_val in_data 0 14 } } }
	VideoFormat_val { ap_stable {  { VideoFormat_val in_data 0 6 } } }
}
