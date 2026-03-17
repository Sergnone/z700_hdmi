set moduleName MultiPixStream2Bytes_Pipeline_VITIS_LOOP_605_4
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
set cdfgNum 29
set C_modelName {MultiPixStream2Bytes_Pipeline_VITIS_LOOP_605_4}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ loopWidth_1 int 11 regular {ap_stable 0} }
	{ sext_ln610 int 12 regular {ap_stable 0} }
	{ bytePlanes_plane0 int 64 regular {fifo 1 volatile }  }
	{ empty int 1 regular  }
	{ icmp_ln594 int 1 regular {ap_stable 0} }
	{ icmp_ln610_5 int 1 regular {ap_stable 0} }
	{ icmp_ln610_4 int 1 regular {ap_stable 0} }
	{ icmp_ln610_3 int 1 regular {ap_stable 0} }
	{ icmp17 int 1 regular {ap_stable 0} }
	{ icmp_ln610_1 int 1 regular {ap_stable 0} }
	{ img int 24 regular {fifo 0 volatile }  }
	{ icmp14 int 1 regular {ap_stable 0} }
	{ bytePlanes_plane1 int 64 regular {fifo 1 volatile }  }
	{ bytePlanes_plane2 int 64 regular {fifo 1 volatile }  }
	{ pixV_1_out int 64 regular {pointer 2}  }
	{ pixU_1_out int 64 regular {pointer 2}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "loopWidth_1", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln610", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane0", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln594", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln610_5", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln610_4", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln610_3", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp17", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln610_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "icmp14", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane1", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bytePlanes_plane2", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pixV_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "pixU_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 42
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ img_dout sc_in sc_lv 24 signal 10 } 
	{ img_empty_n sc_in sc_logic 1 signal 10 } 
	{ img_read sc_out sc_logic 1 signal 10 } 
	{ img_num_data_valid sc_in sc_lv 3 signal 10 } 
	{ img_fifo_cap sc_in sc_lv 3 signal 10 } 
	{ bytePlanes_plane0_din sc_out sc_lv 64 signal 2 } 
	{ bytePlanes_plane0_full_n sc_in sc_logic 1 signal 2 } 
	{ bytePlanes_plane0_write sc_out sc_logic 1 signal 2 } 
	{ bytePlanes_plane0_num_data_valid sc_in sc_lv 10 signal 2 } 
	{ bytePlanes_plane0_fifo_cap sc_in sc_lv 10 signal 2 } 
	{ bytePlanes_plane1_din sc_out sc_lv 64 signal 12 } 
	{ bytePlanes_plane1_full_n sc_in sc_logic 1 signal 12 } 
	{ bytePlanes_plane1_write sc_out sc_logic 1 signal 12 } 
	{ bytePlanes_plane1_num_data_valid sc_in sc_lv 10 signal 12 } 
	{ bytePlanes_plane1_fifo_cap sc_in sc_lv 10 signal 12 } 
	{ bytePlanes_plane2_din sc_out sc_lv 64 signal 13 } 
	{ bytePlanes_plane2_full_n sc_in sc_logic 1 signal 13 } 
	{ bytePlanes_plane2_write sc_out sc_logic 1 signal 13 } 
	{ bytePlanes_plane2_num_data_valid sc_in sc_lv 10 signal 13 } 
	{ bytePlanes_plane2_fifo_cap sc_in sc_lv 10 signal 13 } 
	{ loopWidth_1 sc_in sc_lv 11 signal 0 } 
	{ sext_ln610 sc_in sc_lv 12 signal 1 } 
	{ empty sc_in sc_lv 1 signal 3 } 
	{ icmp_ln594 sc_in sc_lv 1 signal 4 } 
	{ icmp_ln610_5 sc_in sc_lv 1 signal 5 } 
	{ icmp_ln610_4 sc_in sc_lv 1 signal 6 } 
	{ icmp_ln610_3 sc_in sc_lv 1 signal 7 } 
	{ icmp17 sc_in sc_lv 1 signal 8 } 
	{ icmp_ln610_1 sc_in sc_lv 1 signal 9 } 
	{ icmp14 sc_in sc_lv 1 signal 11 } 
	{ pixV_1_out_i sc_in sc_lv 64 signal 14 } 
	{ pixV_1_out_o sc_out sc_lv 64 signal 14 } 
	{ pixV_1_out_o_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ pixU_1_out_i sc_in sc_lv 64 signal 15 } 
	{ pixU_1_out_o sc_out sc_lv 64 signal 15 } 
	{ pixU_1_out_o_ap_vld sc_out sc_logic 1 outvld 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "img_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "img", "role": "dout" }} , 
 	{ "name": "img_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "empty_n" }} , 
 	{ "name": "img_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "read" }} , 
 	{ "name": "img_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "img", "role": "num_data_valid" }} , 
 	{ "name": "img_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "img", "role": "fifo_cap" }} , 
 	{ "name": "bytePlanes_plane0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "din" }} , 
 	{ "name": "bytePlanes_plane0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "full_n" }} , 
 	{ "name": "bytePlanes_plane0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "write" }} , 
 	{ "name": "bytePlanes_plane0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bytePlanes_plane0", "role": "fifo_cap" }} , 
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
 	{ "name": "loopWidth_1", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "loopWidth_1", "role": "default" }} , 
 	{ "name": "sext_ln610", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "sext_ln610", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "icmp_ln594", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln594", "role": "default" }} , 
 	{ "name": "icmp_ln610_5", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln610_5", "role": "default" }} , 
 	{ "name": "icmp_ln610_4", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln610_4", "role": "default" }} , 
 	{ "name": "icmp_ln610_3", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln610_3", "role": "default" }} , 
 	{ "name": "icmp17", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp17", "role": "default" }} , 
 	{ "name": "icmp_ln610_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln610_1", "role": "default" }} , 
 	{ "name": "icmp14", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp14", "role": "default" }} , 
 	{ "name": "pixV_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "pixV_1_out", "role": "i" }} , 
 	{ "name": "pixV_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "pixV_1_out", "role": "o" }} , 
 	{ "name": "pixV_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixV_1_out", "role": "o_ap_vld" }} , 
 	{ "name": "pixU_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "pixU_1_out", "role": "i" }} , 
 	{ "name": "pixU_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "pixU_1_out", "role": "o" }} , 
 	{ "name": "pixU_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pixU_1_out", "role": "o_ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
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
		pixU_1_out {Type IO LastRead 8 FirstWrite 9}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "11523"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "11522"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	loopWidth_1 { ap_stable {  { loopWidth_1 in_data 0 11 } } }
	sext_ln610 { ap_stable {  { sext_ln610 in_data 0 12 } } }
	bytePlanes_plane0 { ap_fifo {  { bytePlanes_plane0_din fifo_data_out 1 64 }  { bytePlanes_plane0_full_n fifo_status_empty 0 1 }  { bytePlanes_plane0_write fifo_data_in 1 1 }  { bytePlanes_plane0_num_data_valid fifo_update 0 10 }  { bytePlanes_plane0_fifo_cap fifo_data 0 10 } } }
	empty { ap_none {  { empty in_data 0 1 } } }
	icmp_ln594 { ap_stable {  { icmp_ln594 in_data 0 1 } } }
	icmp_ln610_5 { ap_stable {  { icmp_ln610_5 in_data 0 1 } } }
	icmp_ln610_4 { ap_stable {  { icmp_ln610_4 in_data 0 1 } } }
	icmp_ln610_3 { ap_stable {  { icmp_ln610_3 in_data 0 1 } } }
	icmp17 { ap_stable {  { icmp17 in_data 0 1 } } }
	icmp_ln610_1 { ap_stable {  { icmp_ln610_1 in_data 0 1 } } }
	img { ap_fifo {  { img_dout fifo_data_out 0 24 }  { img_empty_n fifo_status_empty 0 1 }  { img_read fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 3 }  { img_fifo_cap fifo_data 0 3 } } }
	icmp14 { ap_stable {  { icmp14 in_data 0 1 } } }
	bytePlanes_plane1 { ap_fifo {  { bytePlanes_plane1_din fifo_data_out 1 64 }  { bytePlanes_plane1_full_n fifo_status_empty 0 1 }  { bytePlanes_plane1_write fifo_data_in 1 1 }  { bytePlanes_plane1_num_data_valid fifo_update 0 10 }  { bytePlanes_plane1_fifo_cap fifo_data 0 10 } } }
	bytePlanes_plane2 { ap_fifo {  { bytePlanes_plane2_din fifo_data_out 1 64 }  { bytePlanes_plane2_full_n fifo_status_empty 0 1 }  { bytePlanes_plane2_write fifo_data_in 1 1 }  { bytePlanes_plane2_num_data_valid fifo_update 0 10 }  { bytePlanes_plane2_fifo_cap fifo_data 0 10 } } }
	pixV_1_out { ap_ovld {  { pixV_1_out_i in_data 0 64 }  { pixV_1_out_o out_data 1 64 }  { pixV_1_out_o_ap_vld out_vld 1 1 } } }
	pixU_1_out { ap_ovld {  { pixU_1_out_i in_data 0 64 }  { pixU_1_out_o out_data 1 64 }  { pixU_1_out_o_ap_vld out_vld 1 1 } } }
}
