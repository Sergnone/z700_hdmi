set moduleName AXIvideo2MultiPixStream_Pipeline_loop_width
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
set cdfgNum 38
set C_modelName {AXIvideo2MultiPixStream_Pipeline_loop_width}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ p_4_0_0_0152318_lcssa343_i_i int 1 regular  }
	{ p_0_0_0_0144311_lcssa327_i_i int 24 regular  }
	{ sof_6_i int 1 regular  }
	{ cols_i int 11 regular  }
	{ srcLayer1 int 24 regular {fifo 1 volatile }  }
	{ s_axis_video1_V_data_V int 24 regular {axi_s 0 volatile  { s_axis_video1 Data } }  }
	{ s_axis_video1_V_keep_V int 3 regular {axi_s 0 volatile  { s_axis_video1 Keep } }  }
	{ s_axis_video1_V_strb_V int 3 regular {axi_s 0 volatile  { s_axis_video1 Strb } }  }
	{ s_axis_video1_V_user_V int 1 regular {axi_s 0 volatile  { s_axis_video1 User } }  }
	{ s_axis_video1_V_last_V int 1 regular {axi_s 0 volatile  { s_axis_video1 Last } }  }
	{ s_axis_video1_V_id_V int 1 regular {axi_s 0 volatile  { s_axis_video1 ID } }  }
	{ s_axis_video1_V_dest_V int 1 regular {axi_s 0 volatile  { s_axis_video1 Dest } }  }
	{ p_4_0_0_0152319_i_i_out int 1 regular {pointer 1}  }
	{ p_0_0_0_0144310_i_i_out int 24 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "p_4_0_0_0152318_lcssa343_i_i", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0_0144311_lcssa327_i_i", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "sof_6_i", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cols_i", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "srcLayer1", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_axis_video1_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video1_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video1_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video1_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video1_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video1_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video1_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "p_4_0_0_0152319_i_i_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0_0144310_i_i_out", "interface" : "wire", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_video1_TVALID sc_in sc_logic 1 invld 5 } 
	{ srcLayer1_din sc_out sc_lv 24 signal 4 } 
	{ srcLayer1_full_n sc_in sc_logic 1 signal 4 } 
	{ srcLayer1_write sc_out sc_logic 1 signal 4 } 
	{ srcLayer1_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ srcLayer1_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ p_4_0_0_0152318_lcssa343_i_i sc_in sc_lv 1 signal 0 } 
	{ p_0_0_0_0144311_lcssa327_i_i sc_in sc_lv 24 signal 1 } 
	{ sof_6_i sc_in sc_lv 1 signal 2 } 
	{ cols_i sc_in sc_lv 11 signal 3 } 
	{ s_axis_video1_TDATA sc_in sc_lv 24 signal 5 } 
	{ s_axis_video1_TREADY sc_out sc_logic 1 inacc 11 } 
	{ s_axis_video1_TKEEP sc_in sc_lv 3 signal 6 } 
	{ s_axis_video1_TSTRB sc_in sc_lv 3 signal 7 } 
	{ s_axis_video1_TUSER sc_in sc_lv 1 signal 8 } 
	{ s_axis_video1_TLAST sc_in sc_lv 1 signal 9 } 
	{ s_axis_video1_TID sc_in sc_lv 1 signal 10 } 
	{ s_axis_video1_TDEST sc_in sc_lv 1 signal 11 } 
	{ p_4_0_0_0152319_i_i_out sc_out sc_lv 1 signal 12 } 
	{ p_4_0_0_0152319_i_i_out_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ p_0_0_0_0144310_i_i_out sc_out sc_lv 24 signal 13 } 
	{ p_0_0_0_0144310_i_i_out_ap_vld sc_out sc_logic 1 outvld 13 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_video1_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_video1_V_data_V", "role": "default" }} , 
 	{ "name": "srcLayer1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "srcLayer1", "role": "din" }} , 
 	{ "name": "srcLayer1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1", "role": "full_n" }} , 
 	{ "name": "srcLayer1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1", "role": "write" }} , 
 	{ "name": "srcLayer1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer1", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer1", "role": "fifo_cap" }} , 
 	{ "name": "p_4_0_0_0152318_lcssa343_i_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_4_0_0_0152318_lcssa343_i_i", "role": "default" }} , 
 	{ "name": "p_0_0_0_0144311_lcssa327_i_i", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "p_0_0_0_0144311_lcssa327_i_i", "role": "default" }} , 
 	{ "name": "sof_6_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "sof_6_i", "role": "default" }} , 
 	{ "name": "cols_i", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "cols_i", "role": "default" }} , 
 	{ "name": "s_axis_video1_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "s_axis_video1_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_video1_V_dest_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "s_axis_video1_V_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "s_axis_video1_V_strb_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video1_V_user_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video1_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video1_V_id_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video1_V_dest_V", "role": "default" }} , 
 	{ "name": "p_4_0_0_0152319_i_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_4_0_0_0152319_i_i_out", "role": "default" }} , 
 	{ "name": "p_4_0_0_0152319_i_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_4_0_0_0152319_i_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0_0144310_i_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "p_0_0_0_0144310_i_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0_0144310_i_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0_0144310_i_i_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	AXIvideo2MultiPixStream_Pipeline_loop_width {
		p_4_0_0_0152318_lcssa343_i_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0144311_lcssa327_i_i {Type I LastRead 0 FirstWrite -1}
		sof_6_i {Type I LastRead 0 FirstWrite -1}
		cols_i {Type I LastRead 0 FirstWrite -1}
		srcLayer1 {Type O LastRead -1 FirstWrite 2}
		s_axis_video1_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video1_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video1_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video1_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video1_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video1_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video1_V_dest_V {Type I LastRead 1 FirstWrite -1}
		p_4_0_0_0152319_i_i_out {Type O LastRead -1 FirstWrite 1}
		p_0_0_0_0144310_i_i_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "1923"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1921"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p_4_0_0_0152318_lcssa343_i_i { ap_none {  { p_4_0_0_0152318_lcssa343_i_i in_data 0 1 } } }
	p_0_0_0_0144311_lcssa327_i_i { ap_none {  { p_0_0_0_0144311_lcssa327_i_i in_data 0 24 } } }
	sof_6_i { ap_none {  { sof_6_i in_data 0 1 } } }
	cols_i { ap_none {  { cols_i in_data 0 11 } } }
	srcLayer1 { ap_fifo {  { srcLayer1_din fifo_data_out 1 24 }  { srcLayer1_full_n fifo_status_empty 0 1 }  { srcLayer1_write fifo_data_in 1 1 }  { srcLayer1_num_data_valid fifo_update 0 3 }  { srcLayer1_fifo_cap fifo_data 0 3 } } }
	s_axis_video1_V_data_V { axis {  { s_axis_video1_TVALID in_vld 0 1 }  { s_axis_video1_TDATA in_data 0 24 } } }
	s_axis_video1_V_keep_V { axis {  { s_axis_video1_TKEEP in_data 0 3 } } }
	s_axis_video1_V_strb_V { axis {  { s_axis_video1_TSTRB in_data 0 3 } } }
	s_axis_video1_V_user_V { axis {  { s_axis_video1_TUSER in_data 0 1 } } }
	s_axis_video1_V_last_V { axis {  { s_axis_video1_TLAST in_data 0 1 } } }
	s_axis_video1_V_id_V { axis {  { s_axis_video1_TID in_data 0 1 } } }
	s_axis_video1_V_dest_V { axis {  { s_axis_video1_TREADY in_acc 1 1 }  { s_axis_video1_TDEST in_data 0 1 } } }
	p_4_0_0_0152319_i_i_out { ap_vld {  { p_4_0_0_0152319_i_i_out out_data 1 1 }  { p_4_0_0_0152319_i_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_0_0144310_i_i_out { ap_vld {  { p_0_0_0_0144310_i_i_out out_data 1 24 }  { p_0_0_0_0144310_i_i_out_ap_vld out_vld 1 1 } } }
}
