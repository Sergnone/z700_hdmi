set moduleName AXIvideo2MultiPixStream
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
set cdfgNum 39
set C_modelName {AXIvideo2MultiPixStream}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ s_axis_video1_V_data_V int 24 regular {axi_s 0 volatile  { s_axis_video1 Data } }  }
	{ s_axis_video1_V_keep_V int 3 regular {axi_s 0 volatile  { s_axis_video1 Keep } }  }
	{ s_axis_video1_V_strb_V int 3 regular {axi_s 0 volatile  { s_axis_video1 Strb } }  }
	{ s_axis_video1_V_user_V int 1 regular {axi_s 0 volatile  { s_axis_video1 User } }  }
	{ s_axis_video1_V_last_V int 1 regular {axi_s 0 volatile  { s_axis_video1 Last } }  }
	{ s_axis_video1_V_id_V int 1 regular {axi_s 0 volatile  { s_axis_video1 ID } }  }
	{ s_axis_video1_V_dest_V int 1 regular {axi_s 0 volatile  { s_axis_video1 Dest } }  }
	{ srcLayer1 int 24 regular {fifo 1 volatile }  }
	{ HwReg_layerHeight_1_val int 11 regular {ap_stable 0} }
	{ HwReg_layerWidth_1_val int 11 regular {ap_stable 0} }
	{ HwReg_layerEnableFlag_1_val int 1 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_video1_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video1_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video1_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video1_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video1_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video1_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video1_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "srcLayer1", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "HwReg_layerHeight_1_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerWidth_1_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerEnableFlag_1_val", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 27
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
	{ s_axis_video1_TDATA sc_in sc_lv 24 signal 0 } 
	{ s_axis_video1_TVALID sc_in sc_logic 1 invld 6 } 
	{ s_axis_video1_TREADY sc_out sc_logic 1 inacc 6 } 
	{ s_axis_video1_TKEEP sc_in sc_lv 3 signal 1 } 
	{ s_axis_video1_TSTRB sc_in sc_lv 3 signal 2 } 
	{ s_axis_video1_TUSER sc_in sc_lv 1 signal 3 } 
	{ s_axis_video1_TLAST sc_in sc_lv 1 signal 4 } 
	{ s_axis_video1_TID sc_in sc_lv 1 signal 5 } 
	{ s_axis_video1_TDEST sc_in sc_lv 1 signal 6 } 
	{ srcLayer1_din sc_out sc_lv 24 signal 7 } 
	{ srcLayer1_full_n sc_in sc_logic 1 signal 7 } 
	{ srcLayer1_write sc_out sc_logic 1 signal 7 } 
	{ srcLayer1_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ srcLayer1_fifo_cap sc_in sc_lv 3 signal 7 } 
	{ HwReg_layerHeight_1_val sc_in sc_lv 11 signal 8 } 
	{ HwReg_layerWidth_1_val sc_in sc_lv 11 signal 9 } 
	{ HwReg_layerEnableFlag_1_val sc_in sc_lv 1 signal 10 } 
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
 	{ "name": "s_axis_video1_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "s_axis_video1_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_video1_V_dest_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_video1_V_dest_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "s_axis_video1_V_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "s_axis_video1_V_strb_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video1_V_user_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video1_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video1_V_id_V", "role": "default" }} , 
 	{ "name": "s_axis_video1_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video1_V_dest_V", "role": "default" }} , 
 	{ "name": "srcLayer1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "srcLayer1", "role": "din" }} , 
 	{ "name": "srcLayer1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1", "role": "full_n" }} , 
 	{ "name": "srcLayer1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "srcLayer1", "role": "write" }} , 
 	{ "name": "srcLayer1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer1", "role": "num_data_valid" }} , 
 	{ "name": "srcLayer1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "srcLayer1", "role": "fifo_cap" }} , 
 	{ "name": "HwReg_layerHeight_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "HwReg_layerHeight_1_val", "role": "default" }} , 
 	{ "name": "HwReg_layerWidth_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "HwReg_layerWidth_1_val", "role": "default" }} , 
 	{ "name": "HwReg_layerEnableFlag_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "HwReg_layerEnableFlag_1_val", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	AXIvideo2MultiPixStream {
		s_axis_video1_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video1_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video1_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video1_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video1_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video1_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video1_V_dest_V {Type I LastRead 1 FirstWrite -1}
		srcLayer1 {Type O LastRead -1 FirstWrite 2}
		HwReg_layerHeight_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerWidth_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerEnableFlag_1_val {Type I LastRead 1 FirstWrite -1}}
	AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start {
		s_axis_video1_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_dest_V {Type I LastRead 0 FirstWrite -1}
		axi_last_i_out {Type O LastRead -1 FirstWrite 0}
		axi_data_promoted324_i_i_out {Type O LastRead -1 FirstWrite 0}}
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
		p_0_0_0_0144310_i_i_out {Type O LastRead -1 FirstWrite 1}}
	AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol {
		p_4_0_0_0152319_i_i_reload {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0144310_i_i_reload {Type I LastRead 0 FirstWrite -1}
		and_ln3820_i {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video1_V_dest_V {Type I LastRead 0 FirstWrite -1}
		p_4_0_0_0152318_lcssa341_i_i_out {Type O LastRead -1 FirstWrite 0}
		p_0_0_0_0144311_lcssa325_i_i_out {Type O LastRead -1 FirstWrite 0}}
	reg_unsigned_short_s {
		d {Type I LastRead 1 FirstWrite -1}}
	reg_unsigned_short_s {
		d {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2084406"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2084406"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_video1_V_data_V { axis {  { s_axis_video1_TDATA in_data 0 24 } } }
	s_axis_video1_V_keep_V { axis {  { s_axis_video1_TKEEP in_data 0 3 } } }
	s_axis_video1_V_strb_V { axis {  { s_axis_video1_TSTRB in_data 0 3 } } }
	s_axis_video1_V_user_V { axis {  { s_axis_video1_TUSER in_data 0 1 } } }
	s_axis_video1_V_last_V { axis {  { s_axis_video1_TLAST in_data 0 1 } } }
	s_axis_video1_V_id_V { axis {  { s_axis_video1_TID in_data 0 1 } } }
	s_axis_video1_V_dest_V { axis {  { s_axis_video1_TVALID in_vld 0 1 }  { s_axis_video1_TREADY in_acc 1 1 }  { s_axis_video1_TDEST in_data 0 1 } } }
	srcLayer1 { ap_fifo {  { srcLayer1_din fifo_data_out 1 24 }  { srcLayer1_full_n fifo_status_empty 0 1 }  { srcLayer1_write fifo_data_in 1 1 }  { srcLayer1_num_data_valid fifo_update 0 3 }  { srcLayer1_fifo_cap fifo_data 0 3 } } }
	HwReg_layerHeight_1_val { ap_stable {  { HwReg_layerHeight_1_val in_data 0 11 } } }
	HwReg_layerWidth_1_val { ap_stable {  { HwReg_layerWidth_1_val in_data 0 11 } } }
	HwReg_layerEnableFlag_1_val { ap_stable {  { HwReg_layerEnableFlag_1_val in_data 0 1 } } }
}
