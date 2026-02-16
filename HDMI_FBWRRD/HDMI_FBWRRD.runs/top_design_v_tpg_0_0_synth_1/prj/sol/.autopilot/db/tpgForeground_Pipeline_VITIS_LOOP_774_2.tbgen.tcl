set moduleName tpgForeground_Pipeline_VITIS_LOOP_774_2
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
set C_modelName {tpgForeground_Pipeline_VITIS_LOOP_774_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ shl_ln int 9 regular {ap_stable 0} }
	{ maskId_val int 8 regular {ap_stable 0} }
	{ width_val int 16 regular {ap_stable 0} }
	{ boxColorB_val int 8 regular {ap_stable 0} }
	{ select_ln1977 int 8 regular {ap_stable 0} }
	{ boxColorR_val int 8 regular {ap_stable 0} }
	{ and_ln1989 int 1 regular {ap_stable 0} }
	{ and_ln1991 int 1 regular {ap_stable 0} }
	{ and_ln1993 int 1 regular {ap_stable 0} }
	{ ovrlayYUV int 24 regular {fifo 1 volatile }  }
	{ bckgndYUV int 24 regular {fifo 0 volatile }  }
	{ patternId_val int 8 regular {ap_stable 0} }
	{ boxSize_val int 16 regular {ap_stable 0} }
	{ y int 16 regular  }
	{ vMax int 16 regular {ap_stable 0} }
	{ zext_ln789 int 8 regular {ap_stable 0} }
	{ hMax int 16 regular {ap_stable 0} }
	{ icmp int 1 regular {ap_stable 0} }
	{ boxColorG_val int 8 regular {ap_stable 0} }
	{ crossHairX_val int 16 regular {ap_stable 0} }
	{ icmp_ln1963 int 1 regular  }
	{ colorFormat_val int 8 regular {ap_stable 0} }
	{ boxHCoord_loc_1_out int 16 regular {pointer 2}  }
	{ boxVCoord_loc_1_out int 16 regular {pointer 2}  }
	{ boxVCoord int 16 regular {pointer 1} {global 1}  }
	{ boxHCoord int 16 regular {pointer 1} {global 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "shl_ln", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "maskId_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "width_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "boxColorB_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln1977", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "boxColorR_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "and_ln1989", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "and_ln1991", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "and_ln1993", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "ovrlayYUV", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bckgndYUV", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "patternId_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "boxSize_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "y", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "vMax", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln789", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "hMax", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "icmp", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "boxColorG_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "crossHairX_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1963", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "colorFormat_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "boxHCoord_loc_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "boxVCoord_loc_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "boxVCoord", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "boxHCoord", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 46
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ bckgndYUV_dout sc_in sc_lv 24 signal 10 } 
	{ bckgndYUV_empty_n sc_in sc_logic 1 signal 10 } 
	{ bckgndYUV_read sc_out sc_logic 1 signal 10 } 
	{ bckgndYUV_num_data_valid sc_in sc_lv 5 signal 10 } 
	{ bckgndYUV_fifo_cap sc_in sc_lv 5 signal 10 } 
	{ ovrlayYUV_din sc_out sc_lv 24 signal 9 } 
	{ ovrlayYUV_full_n sc_in sc_logic 1 signal 9 } 
	{ ovrlayYUV_write sc_out sc_logic 1 signal 9 } 
	{ ovrlayYUV_num_data_valid sc_in sc_lv 32 signal 9 } 
	{ ovrlayYUV_fifo_cap sc_in sc_lv 32 signal 9 } 
	{ shl_ln sc_in sc_lv 9 signal 0 } 
	{ maskId_val sc_in sc_lv 8 signal 1 } 
	{ width_val sc_in sc_lv 16 signal 2 } 
	{ boxColorB_val sc_in sc_lv 8 signal 3 } 
	{ select_ln1977 sc_in sc_lv 8 signal 4 } 
	{ boxColorR_val sc_in sc_lv 8 signal 5 } 
	{ and_ln1989 sc_in sc_lv 1 signal 6 } 
	{ and_ln1991 sc_in sc_lv 1 signal 7 } 
	{ and_ln1993 sc_in sc_lv 1 signal 8 } 
	{ patternId_val sc_in sc_lv 8 signal 11 } 
	{ boxSize_val sc_in sc_lv 16 signal 12 } 
	{ y sc_in sc_lv 16 signal 13 } 
	{ vMax sc_in sc_lv 16 signal 14 } 
	{ zext_ln789 sc_in sc_lv 8 signal 15 } 
	{ hMax sc_in sc_lv 16 signal 16 } 
	{ icmp sc_in sc_lv 1 signal 17 } 
	{ boxColorG_val sc_in sc_lv 8 signal 18 } 
	{ crossHairX_val sc_in sc_lv 16 signal 19 } 
	{ icmp_ln1963 sc_in sc_lv 1 signal 20 } 
	{ colorFormat_val sc_in sc_lv 8 signal 21 } 
	{ boxHCoord_loc_1_out_i sc_in sc_lv 16 signal 22 } 
	{ boxHCoord_loc_1_out_o sc_out sc_lv 16 signal 22 } 
	{ boxHCoord_loc_1_out_o_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ boxVCoord_loc_1_out_i sc_in sc_lv 16 signal 23 } 
	{ boxVCoord_loc_1_out_o sc_out sc_lv 16 signal 23 } 
	{ boxVCoord_loc_1_out_o_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ boxVCoord sc_out sc_lv 16 signal 24 } 
	{ boxVCoord_ap_vld sc_out sc_logic 1 outvld 24 } 
	{ boxHCoord sc_out sc_lv 16 signal 25 } 
	{ boxHCoord_ap_vld sc_out sc_logic 1 outvld 25 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "bckgndYUV_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "bckgndYUV", "role": "dout" }} , 
 	{ "name": "bckgndYUV_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bckgndYUV", "role": "empty_n" }} , 
 	{ "name": "bckgndYUV_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bckgndYUV", "role": "read" }} , 
 	{ "name": "bckgndYUV_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bckgndYUV", "role": "num_data_valid" }} , 
 	{ "name": "bckgndYUV_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bckgndYUV", "role": "fifo_cap" }} , 
 	{ "name": "ovrlayYUV_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "ovrlayYUV", "role": "din" }} , 
 	{ "name": "ovrlayYUV_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ovrlayYUV", "role": "full_n" }} , 
 	{ "name": "ovrlayYUV_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ovrlayYUV", "role": "write" }} , 
 	{ "name": "ovrlayYUV_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ovrlayYUV", "role": "num_data_valid" }} , 
 	{ "name": "ovrlayYUV_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ovrlayYUV", "role": "fifo_cap" }} , 
 	{ "name": "shl_ln", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "shl_ln", "role": "default" }} , 
 	{ "name": "maskId_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "maskId_val", "role": "default" }} , 
 	{ "name": "width_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "width_val", "role": "default" }} , 
 	{ "name": "boxColorB_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "boxColorB_val", "role": "default" }} , 
 	{ "name": "select_ln1977", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "select_ln1977", "role": "default" }} , 
 	{ "name": "boxColorR_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "boxColorR_val", "role": "default" }} , 
 	{ "name": "and_ln1989", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "and_ln1989", "role": "default" }} , 
 	{ "name": "and_ln1991", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "and_ln1991", "role": "default" }} , 
 	{ "name": "and_ln1993", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "and_ln1993", "role": "default" }} , 
 	{ "name": "patternId_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "patternId_val", "role": "default" }} , 
 	{ "name": "boxSize_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "boxSize_val", "role": "default" }} , 
 	{ "name": "y", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "y", "role": "default" }} , 
 	{ "name": "vMax", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "vMax", "role": "default" }} , 
 	{ "name": "zext_ln789", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "zext_ln789", "role": "default" }} , 
 	{ "name": "hMax", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "hMax", "role": "default" }} , 
 	{ "name": "icmp", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp", "role": "default" }} , 
 	{ "name": "boxColorG_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "boxColorG_val", "role": "default" }} , 
 	{ "name": "crossHairX_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "crossHairX_val", "role": "default" }} , 
 	{ "name": "icmp_ln1963", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1963", "role": "default" }} , 
 	{ "name": "colorFormat_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "colorFormat_val", "role": "default" }} , 
 	{ "name": "boxHCoord_loc_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "boxHCoord_loc_1_out", "role": "i" }} , 
 	{ "name": "boxHCoord_loc_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "boxHCoord_loc_1_out", "role": "o" }} , 
 	{ "name": "boxHCoord_loc_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "boxHCoord_loc_1_out", "role": "o_ap_vld" }} , 
 	{ "name": "boxVCoord_loc_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "boxVCoord_loc_1_out", "role": "i" }} , 
 	{ "name": "boxVCoord_loc_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "boxVCoord_loc_1_out", "role": "o" }} , 
 	{ "name": "boxVCoord_loc_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "boxVCoord_loc_1_out", "role": "o_ap_vld" }} , 
 	{ "name": "boxVCoord", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "boxVCoord", "role": "default" }} , 
 	{ "name": "boxVCoord_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "boxVCoord", "role": "ap_vld" }} , 
 	{ "name": "boxHCoord", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "boxHCoord", "role": "default" }} , 
 	{ "name": "boxHCoord_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "boxHCoord", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	tpgForeground_Pipeline_VITIS_LOOP_774_2 {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		maskId_val {Type I LastRead 0 FirstWrite -1}
		width_val {Type I LastRead 0 FirstWrite -1}
		boxColorB_val {Type I LastRead 0 FirstWrite -1}
		select_ln1977 {Type I LastRead 0 FirstWrite -1}
		boxColorR_val {Type I LastRead 0 FirstWrite -1}
		and_ln1989 {Type I LastRead 0 FirstWrite -1}
		and_ln1991 {Type I LastRead 0 FirstWrite -1}
		and_ln1993 {Type I LastRead 0 FirstWrite -1}
		ovrlayYUV {Type O LastRead -1 FirstWrite 3}
		bckgndYUV {Type I LastRead 2 FirstWrite -1}
		patternId_val {Type I LastRead 0 FirstWrite -1}
		boxSize_val {Type I LastRead 0 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		vMax {Type I LastRead 0 FirstWrite -1}
		zext_ln789 {Type I LastRead 0 FirstWrite -1}
		hMax {Type I LastRead 0 FirstWrite -1}
		icmp {Type I LastRead 0 FirstWrite -1}
		boxColorG_val {Type I LastRead 0 FirstWrite -1}
		crossHairX_val {Type I LastRead 0 FirstWrite -1}
		icmp_ln1963 {Type I LastRead 0 FirstWrite -1}
		colorFormat_val {Type I LastRead 0 FirstWrite -1}
		boxHCoord_loc_1_out {Type IO LastRead 1 FirstWrite 0}
		boxVCoord_loc_1_out {Type IO LastRead 1 FirstWrite 0}
		boxVCoord {Type O LastRead -1 FirstWrite 1}
		vDir {Type IO LastRead -1 FirstWrite -1}
		boxHCoord {Type O LastRead -1 FirstWrite 1}
		hDir {Type IO LastRead -1 FirstWrite -1}
		whiYuv_2 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "65539"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "65536"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	shl_ln { ap_stable {  { shl_ln in_data 0 9 } } }
	maskId_val { ap_stable {  { maskId_val in_data 0 8 } } }
	width_val { ap_stable {  { width_val in_data 0 16 } } }
	boxColorB_val { ap_stable {  { boxColorB_val in_data 0 8 } } }
	select_ln1977 { ap_stable {  { select_ln1977 in_data 0 8 } } }
	boxColorR_val { ap_stable {  { boxColorR_val in_data 0 8 } } }
	and_ln1989 { ap_stable {  { and_ln1989 in_data 0 1 } } }
	and_ln1991 { ap_stable {  { and_ln1991 in_data 0 1 } } }
	and_ln1993 { ap_stable {  { and_ln1993 in_data 0 1 } } }
	ovrlayYUV { ap_fifo {  { ovrlayYUV_din fifo_data_out 1 24 }  { ovrlayYUV_full_n fifo_status_empty 0 1 }  { ovrlayYUV_write fifo_data_in 1 1 }  { ovrlayYUV_num_data_valid fifo_update 0 32 }  { ovrlayYUV_fifo_cap fifo_data 0 32 } } }
	bckgndYUV { ap_fifo {  { bckgndYUV_dout fifo_data_out 0 24 }  { bckgndYUV_empty_n fifo_status_empty 0 1 }  { bckgndYUV_read fifo_data_in 1 1 }  { bckgndYUV_num_data_valid fifo_update 0 5 }  { bckgndYUV_fifo_cap fifo_data 0 5 } } }
	patternId_val { ap_stable {  { patternId_val in_data 0 8 } } }
	boxSize_val { ap_stable {  { boxSize_val in_data 0 16 } } }
	y { ap_none {  { y in_data 0 16 } } }
	vMax { ap_stable {  { vMax in_data 0 16 } } }
	zext_ln789 { ap_stable {  { zext_ln789 in_data 0 8 } } }
	hMax { ap_stable {  { hMax in_data 0 16 } } }
	icmp { ap_stable {  { icmp in_data 0 1 } } }
	boxColorG_val { ap_stable {  { boxColorG_val in_data 0 8 } } }
	crossHairX_val { ap_stable {  { crossHairX_val in_data 0 16 } } }
	icmp_ln1963 { ap_none {  { icmp_ln1963 in_data 0 1 } } }
	colorFormat_val { ap_stable {  { colorFormat_val in_data 0 8 } } }
	boxHCoord_loc_1_out { ap_ovld {  { boxHCoord_loc_1_out_i in_data 0 16 }  { boxHCoord_loc_1_out_o out_data 1 16 }  { boxHCoord_loc_1_out_o_ap_vld out_vld 1 1 } } }
	boxVCoord_loc_1_out { ap_ovld {  { boxVCoord_loc_1_out_i in_data 0 16 }  { boxVCoord_loc_1_out_o out_data 1 16 }  { boxVCoord_loc_1_out_o_ap_vld out_vld 1 1 } } }
	boxVCoord { ap_vld {  { boxVCoord out_data 1 16 }  { boxVCoord_ap_vld out_vld 1 1 } } }
	boxHCoord { ap_vld {  { boxHCoord out_data 1 16 }  { boxHCoord_ap_vld out_vld 1 1 } } }
}
