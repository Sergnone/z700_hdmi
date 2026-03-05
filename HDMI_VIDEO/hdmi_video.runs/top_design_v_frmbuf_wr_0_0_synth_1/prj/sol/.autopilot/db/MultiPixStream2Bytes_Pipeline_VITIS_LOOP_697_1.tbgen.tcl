set moduleName MultiPixStream2Bytes_Pipeline_VITIS_LOOP_697_1
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
set cdfgNum 13
set C_modelName {MultiPixStream2Bytes_Pipeline_VITIS_LOOP_697_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ trunc_ln681_1 int 11 regular {ap_stable 0} }
	{ bytePlanes int 64 regular {fifo 1 volatile }  }
	{ add_ln702 int 12 regular {ap_stable 0} }
	{ img int 24 regular {fifo 0 volatile }  }
	{ rev int 1 regular {ap_stable 0} }
	{ out_pix_1_out int 64 regular {pointer 2}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "trunc_ln681_1", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "add_ln702", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "rev", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "out_pix_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ bytePlanes_din sc_out sc_lv 64 signal 1 } 
	{ bytePlanes_full_n sc_in sc_logic 1 signal 1 } 
	{ bytePlanes_write sc_out sc_logic 1 signal 1 } 
	{ bytePlanes_num_data_valid sc_in sc_lv 32 signal 1 } 
	{ bytePlanes_fifo_cap sc_in sc_lv 32 signal 1 } 
	{ img_dout sc_in sc_lv 24 signal 3 } 
	{ img_empty_n sc_in sc_logic 1 signal 3 } 
	{ img_read sc_out sc_logic 1 signal 3 } 
	{ img_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ img_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ trunc_ln681_1 sc_in sc_lv 11 signal 0 } 
	{ add_ln702 sc_in sc_lv 12 signal 2 } 
	{ rev sc_in sc_lv 1 signal 4 } 
	{ out_pix_1_out_i sc_in sc_lv 64 signal 5 } 
	{ out_pix_1_out_o sc_out sc_lv 64 signal 5 } 
	{ out_pix_1_out_o_ap_vld sc_out sc_logic 1 outvld 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "bytePlanes_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytePlanes", "role": "din" }} , 
 	{ "name": "bytePlanes_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes", "role": "full_n" }} , 
 	{ "name": "bytePlanes_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes", "role": "write" }} , 
 	{ "name": "bytePlanes_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bytePlanes", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bytePlanes", "role": "fifo_cap" }} , 
 	{ "name": "img_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "img", "role": "dout" }} , 
 	{ "name": "img_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "empty_n" }} , 
 	{ "name": "img_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "read" }} , 
 	{ "name": "img_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "img", "role": "num_data_valid" }} , 
 	{ "name": "img_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "img", "role": "fifo_cap" }} , 
 	{ "name": "trunc_ln681_1", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "trunc_ln681_1", "role": "default" }} , 
 	{ "name": "add_ln702", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "add_ln702", "role": "default" }} , 
 	{ "name": "rev", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rev", "role": "default" }} , 
 	{ "name": "out_pix_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_pix_1_out", "role": "i" }} , 
 	{ "name": "out_pix_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_pix_1_out", "role": "o" }} , 
 	{ "name": "out_pix_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_pix_1_out", "role": "o_ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_697_1 {
		trunc_ln681_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes {Type O LastRead -1 FirstWrite 3}
		add_ln702 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 2 FirstWrite -1}
		rev {Type I LastRead 0 FirstWrite -1}
		out_pix_1_out {Type IO LastRead 3 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "4322"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "4321"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	trunc_ln681_1 { ap_stable {  { trunc_ln681_1 in_data 0 11 } } }
	bytePlanes { ap_fifo {  { bytePlanes_din fifo_data_out 1 64 }  { bytePlanes_full_n fifo_status_empty 0 1 }  { bytePlanes_write fifo_data_in 1 1 }  { bytePlanes_num_data_valid fifo_update 0 32 }  { bytePlanes_fifo_cap fifo_data 0 32 } } }
	add_ln702 { ap_stable {  { add_ln702 in_data 0 12 } } }
	img { ap_fifo {  { img_dout fifo_data_out 0 24 }  { img_empty_n fifo_status_empty 0 1 }  { img_read fifo_data_in 1 1 }  { img_num_data_valid fifo_update 0 3 }  { img_fifo_cap fifo_data 0 3 } } }
	rev { ap_stable {  { rev in_data 0 1 } } }
	out_pix_1_out { ap_ovld {  { out_pix_1_out_i in_data 0 64 }  { out_pix_1_out_o out_data 1 64 }  { out_pix_1_out_o_ap_vld out_vld 1 1 } } }
}
