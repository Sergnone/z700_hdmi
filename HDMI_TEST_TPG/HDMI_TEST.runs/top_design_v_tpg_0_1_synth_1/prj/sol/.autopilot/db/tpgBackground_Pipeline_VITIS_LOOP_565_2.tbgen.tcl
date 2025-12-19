set moduleName tpgBackground_Pipeline_VITIS_LOOP_565_2
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
set C_modelName {tpgBackground_Pipeline_VITIS_LOOP_565_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ rampVal_3_flag_0 int 1 regular  }
	{ hdata_flag_0 int 1 regular  }
	{ rampVal_2_flag_0 int 1 regular  }
	{ dpYUVCoef_val int 8 regular {ap_stable 0} }
	{ colorFormat_val int 8 regular {ap_stable 0} }
	{ dpDynamicRange_val int 8 regular {ap_stable 0} }
	{ Sel int 2 regular  }
	{ y int 16 regular  }
	{ barWidth int 11 regular {ap_stable 0} }
	{ width_val int 16 regular {ap_stable 0} }
	{ select_ln1230 int 8 regular {ap_stable 0} }
	{ select_ln1209 int 8 regular {ap_stable 0} }
	{ select_ln1188 int 8 regular {ap_stable 0} }
	{ select_ln1188_1 int 5 regular {ap_stable 0} }
	{ sext_ln1162 int 1 regular {ap_stable 0} }
	{ select_ln1122 int 8 regular  }
	{ select_ln1188_2 int 3 regular {ap_stable 0} }
	{ select_ln1162 int 8 regular {ap_stable 0} }
	{ select_ln1141 int 8 regular {ap_stable 0} }
	{ rampStart_1 int 8 regular  }
	{ bckgndYUV int 24 regular {fifo 1 volatile }  }
	{ ZplateHorContStart_val int 16 regular {ap_stable 0} }
	{ patternId_val int 8 regular {ap_stable 0} }
	{ zext_ln1120 int 8 regular  }
	{ empty int 8 regular  }
	{ shl_ln int 16 regular  }
	{ ZplateHorContDelta_val int 16 regular {ap_stable 0} }
	{ ZplateVerContStart_val int 16 regular {ap_stable 0} }
	{ icmp_ln1337 int 1 regular  }
	{ ZplateVerContDelta_val int 16 regular {ap_stable 0} }
	{ add_ln1386 int 11 regular {ap_stable 0} }
	{ barWidthMinSamples int 10 regular {ap_stable 0} }
	{ icmp_ln1449_1 int 1 regular  }
	{ add_ln1473 int 17 regular {ap_stable 0} }
	{ add_ln1533 int 8 regular  }
	{ icmp int 1 regular {ap_stable 0} }
	{ icmp_ln1801 int 1 regular {ap_stable 0} }
	{ rampVal_3_flag_1_out int 1 regular {pointer 1}  }
	{ rampVal_3_new_1_out int 16 regular {pointer 1}  }
	{ rampVal_3_loc_1_out int 16 regular {pointer 2}  }
	{ rampVal_loc_1_out int 16 regular {pointer 2}  }
	{ tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out int 8 regular {pointer 2}  }
	{ zonePlateVAddr_loc_1_out int 16 regular {pointer 2}  }
	{ vBarSel_loc_1_out int 8 regular {pointer 2}  }
	{ tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out int 8 regular {pointer 2}  }
	{ hdata_flag_1_out int 1 regular {pointer 1}  }
	{ hdata_new_1_out int 16 regular {pointer 1}  }
	{ hdata_loc_1_out int 16 regular {pointer 2}  }
	{ vBarSel_2_loc_1_out int 8 regular {pointer 2}  }
	{ tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out int 8 regular {pointer 2}  }
	{ rampVal_2_flag_1_out int 1 regular {pointer 1}  }
	{ rampVal_2_new_1_out int 16 regular {pointer 1}  }
	{ rampVal_2_loc_1_out int 16 regular {pointer 2}  }
	{ vBarSel_3_loc_1_out int 8 regular {pointer 2}  }
	{ tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out int 8 regular {pointer 2}  }
	{ outpix_0_2_0_0_0_load216_out int 8 regular {pointer 2}  }
	{ outpix_0_1_0_0_0_load214_out int 8 regular {pointer 2}  }
	{ outpix_0_0_0_0_0_load212_out int 8 regular {pointer 2}  }
	{ rampVal int 8 regular {pointer 1} {global 1}  }
	{ tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel int 8 regular {pointer 1} {global 1}  }
	{ zonePlateVAddr int 16 regular {pointer 1} {global 1}  }
	{ tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_1 int 3 regular {pointer 1} {global 1}  }
	{ vBarSel int 3 regular {pointer 1} {global 1}  }
	{ tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_1 int 3 regular {pointer 1} {global 1}  }
	{ vBarSel_2 int 8 regular {pointer 1} {global 1}  }
	{ tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_1 int 3 regular {pointer 1} {global 1}  }
	{ vBarSel_1 int 1 regular {pointer 1} {global 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "rampVal_3_flag_0", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "hdata_flag_0", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "rampVal_2_flag_0", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "dpYUVCoef_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "colorFormat_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "dpDynamicRange_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "Sel", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "y", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "barWidth", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "width_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln1230", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln1209", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln1188", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln1188_1", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1162", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln1122", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln1188_2", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln1162", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln1141", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "rampStart_1", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "bckgndYUV", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ZplateHorContStart_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "patternId_val", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln1120", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "shl_ln", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ZplateHorContDelta_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ZplateVerContStart_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1337", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "ZplateVerContDelta_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln1386", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "barWidthMinSamples", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1449_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln1473", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln1533", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "icmp", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln1801", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "rampVal_3_flag_1_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rampVal_3_new_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rampVal_3_loc_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "rampVal_loc_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "zonePlateVAddr_loc_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "vBarSel_loc_1_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "hdata_flag_1_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "hdata_new_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "hdata_loc_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "vBarSel_2_loc_1_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "rampVal_2_flag_1_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rampVal_2_new_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rampVal_2_loc_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "vBarSel_3_loc_1_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "outpix_0_2_0_0_0_load216_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "outpix_0_1_0_0_0_load214_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "outpix_0_0_0_0_0_load212_out", "interface" : "wire", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "rampVal", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "zonePlateVAddr", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_1", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "vBarSel", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_1", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "vBarSel_2", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_1", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "vBarSel_1", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 122
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ bckgndYUV_din sc_out sc_lv 24 signal 20 } 
	{ bckgndYUV_full_n sc_in sc_logic 1 signal 20 } 
	{ bckgndYUV_write sc_out sc_logic 1 signal 20 } 
	{ bckgndYUV_num_data_valid sc_in sc_lv 5 signal 20 } 
	{ bckgndYUV_fifo_cap sc_in sc_lv 5 signal 20 } 
	{ rampVal_3_flag_0 sc_in sc_lv 1 signal 0 } 
	{ hdata_flag_0 sc_in sc_lv 1 signal 1 } 
	{ rampVal_2_flag_0 sc_in sc_lv 1 signal 2 } 
	{ dpYUVCoef_val sc_in sc_lv 8 signal 3 } 
	{ colorFormat_val sc_in sc_lv 8 signal 4 } 
	{ dpDynamicRange_val sc_in sc_lv 8 signal 5 } 
	{ Sel sc_in sc_lv 2 signal 6 } 
	{ y sc_in sc_lv 16 signal 7 } 
	{ barWidth sc_in sc_lv 11 signal 8 } 
	{ width_val sc_in sc_lv 16 signal 9 } 
	{ select_ln1230 sc_in sc_lv 8 signal 10 } 
	{ select_ln1209 sc_in sc_lv 8 signal 11 } 
	{ select_ln1188 sc_in sc_lv 8 signal 12 } 
	{ select_ln1188_1 sc_in sc_lv 5 signal 13 } 
	{ sext_ln1162 sc_in sc_lv 1 signal 14 } 
	{ select_ln1122 sc_in sc_lv 8 signal 15 } 
	{ select_ln1188_2 sc_in sc_lv 3 signal 16 } 
	{ select_ln1162 sc_in sc_lv 8 signal 17 } 
	{ select_ln1141 sc_in sc_lv 8 signal 18 } 
	{ rampStart_1 sc_in sc_lv 8 signal 19 } 
	{ ZplateHorContStart_val sc_in sc_lv 16 signal 21 } 
	{ patternId_val sc_in sc_lv 8 signal 22 } 
	{ zext_ln1120 sc_in sc_lv 8 signal 23 } 
	{ empty sc_in sc_lv 8 signal 24 } 
	{ shl_ln sc_in sc_lv 16 signal 25 } 
	{ ZplateHorContDelta_val sc_in sc_lv 16 signal 26 } 
	{ ZplateVerContStart_val sc_in sc_lv 16 signal 27 } 
	{ icmp_ln1337 sc_in sc_lv 1 signal 28 } 
	{ ZplateVerContDelta_val sc_in sc_lv 16 signal 29 } 
	{ add_ln1386 sc_in sc_lv 11 signal 30 } 
	{ barWidthMinSamples sc_in sc_lv 10 signal 31 } 
	{ icmp_ln1449_1 sc_in sc_lv 1 signal 32 } 
	{ add_ln1473 sc_in sc_lv 17 signal 33 } 
	{ add_ln1533 sc_in sc_lv 8 signal 34 } 
	{ icmp sc_in sc_lv 1 signal 35 } 
	{ icmp_ln1801 sc_in sc_lv 1 signal 36 } 
	{ rampVal_3_flag_1_out sc_out sc_lv 1 signal 37 } 
	{ rampVal_3_flag_1_out_ap_vld sc_out sc_logic 1 outvld 37 } 
	{ rampVal_3_new_1_out sc_out sc_lv 16 signal 38 } 
	{ rampVal_3_new_1_out_ap_vld sc_out sc_logic 1 outvld 38 } 
	{ rampVal_3_loc_1_out_i sc_in sc_lv 16 signal 39 } 
	{ rampVal_3_loc_1_out_o sc_out sc_lv 16 signal 39 } 
	{ rampVal_3_loc_1_out_o_ap_vld sc_out sc_logic 1 outvld 39 } 
	{ rampVal_loc_1_out_i sc_in sc_lv 16 signal 40 } 
	{ rampVal_loc_1_out_o sc_out sc_lv 16 signal 40 } 
	{ rampVal_loc_1_out_o_ap_vld sc_out sc_logic 1 outvld 40 } 
	{ tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out_i sc_in sc_lv 8 signal 41 } 
	{ tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out_o sc_out sc_lv 8 signal 41 } 
	{ tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out_o_ap_vld sc_out sc_logic 1 outvld 41 } 
	{ zonePlateVAddr_loc_1_out_i sc_in sc_lv 16 signal 42 } 
	{ zonePlateVAddr_loc_1_out_o sc_out sc_lv 16 signal 42 } 
	{ zonePlateVAddr_loc_1_out_o_ap_vld sc_out sc_logic 1 outvld 42 } 
	{ vBarSel_loc_1_out_i sc_in sc_lv 8 signal 43 } 
	{ vBarSel_loc_1_out_o sc_out sc_lv 8 signal 43 } 
	{ vBarSel_loc_1_out_o_ap_vld sc_out sc_logic 1 outvld 43 } 
	{ tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out_i sc_in sc_lv 8 signal 44 } 
	{ tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out_o sc_out sc_lv 8 signal 44 } 
	{ tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out_o_ap_vld sc_out sc_logic 1 outvld 44 } 
	{ hdata_flag_1_out sc_out sc_lv 1 signal 45 } 
	{ hdata_flag_1_out_ap_vld sc_out sc_logic 1 outvld 45 } 
	{ hdata_new_1_out sc_out sc_lv 16 signal 46 } 
	{ hdata_new_1_out_ap_vld sc_out sc_logic 1 outvld 46 } 
	{ hdata_loc_1_out_i sc_in sc_lv 16 signal 47 } 
	{ hdata_loc_1_out_o sc_out sc_lv 16 signal 47 } 
	{ hdata_loc_1_out_o_ap_vld sc_out sc_logic 1 outvld 47 } 
	{ vBarSel_2_loc_1_out_i sc_in sc_lv 8 signal 48 } 
	{ vBarSel_2_loc_1_out_o sc_out sc_lv 8 signal 48 } 
	{ vBarSel_2_loc_1_out_o_ap_vld sc_out sc_logic 1 outvld 48 } 
	{ tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out_i sc_in sc_lv 8 signal 49 } 
	{ tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out_o sc_out sc_lv 8 signal 49 } 
	{ tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out_o_ap_vld sc_out sc_logic 1 outvld 49 } 
	{ rampVal_2_flag_1_out sc_out sc_lv 1 signal 50 } 
	{ rampVal_2_flag_1_out_ap_vld sc_out sc_logic 1 outvld 50 } 
	{ rampVal_2_new_1_out sc_out sc_lv 16 signal 51 } 
	{ rampVal_2_new_1_out_ap_vld sc_out sc_logic 1 outvld 51 } 
	{ rampVal_2_loc_1_out_i sc_in sc_lv 16 signal 52 } 
	{ rampVal_2_loc_1_out_o sc_out sc_lv 16 signal 52 } 
	{ rampVal_2_loc_1_out_o_ap_vld sc_out sc_logic 1 outvld 52 } 
	{ vBarSel_3_loc_1_out_i sc_in sc_lv 8 signal 53 } 
	{ vBarSel_3_loc_1_out_o sc_out sc_lv 8 signal 53 } 
	{ vBarSel_3_loc_1_out_o_ap_vld sc_out sc_logic 1 outvld 53 } 
	{ tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out_i sc_in sc_lv 8 signal 54 } 
	{ tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out_o sc_out sc_lv 8 signal 54 } 
	{ tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out_o_ap_vld sc_out sc_logic 1 outvld 54 } 
	{ outpix_0_2_0_0_0_load216_out_i sc_in sc_lv 8 signal 55 } 
	{ outpix_0_2_0_0_0_load216_out_o sc_out sc_lv 8 signal 55 } 
	{ outpix_0_2_0_0_0_load216_out_o_ap_vld sc_out sc_logic 1 outvld 55 } 
	{ outpix_0_1_0_0_0_load214_out_i sc_in sc_lv 8 signal 56 } 
	{ outpix_0_1_0_0_0_load214_out_o sc_out sc_lv 8 signal 56 } 
	{ outpix_0_1_0_0_0_load214_out_o_ap_vld sc_out sc_logic 1 outvld 56 } 
	{ outpix_0_0_0_0_0_load212_out_i sc_in sc_lv 8 signal 57 } 
	{ outpix_0_0_0_0_0_load212_out_o sc_out sc_lv 8 signal 57 } 
	{ outpix_0_0_0_0_0_load212_out_o_ap_vld sc_out sc_logic 1 outvld 57 } 
	{ rampVal sc_out sc_lv 8 signal 58 } 
	{ rampVal_ap_vld sc_out sc_logic 1 outvld 58 } 
	{ tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel sc_out sc_lv 8 signal 59 } 
	{ tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_ap_vld sc_out sc_logic 1 outvld 59 } 
	{ zonePlateVAddr sc_out sc_lv 16 signal 60 } 
	{ zonePlateVAddr_ap_vld sc_out sc_logic 1 outvld 60 } 
	{ tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_1 sc_out sc_lv 3 signal 61 } 
	{ tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_1_ap_vld sc_out sc_logic 1 outvld 61 } 
	{ vBarSel sc_out sc_lv 3 signal 62 } 
	{ vBarSel_ap_vld sc_out sc_logic 1 outvld 62 } 
	{ tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_1 sc_out sc_lv 3 signal 63 } 
	{ tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_1_ap_vld sc_out sc_logic 1 outvld 63 } 
	{ vBarSel_2 sc_out sc_lv 8 signal 64 } 
	{ vBarSel_2_ap_vld sc_out sc_logic 1 outvld 64 } 
	{ tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_1 sc_out sc_lv 3 signal 65 } 
	{ tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_1_ap_vld sc_out sc_logic 1 outvld 65 } 
	{ vBarSel_1 sc_out sc_lv 1 signal 66 } 
	{ vBarSel_1_ap_vld sc_out sc_logic 1 outvld 66 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "bckgndYUV_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "bckgndYUV", "role": "din" }} , 
 	{ "name": "bckgndYUV_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bckgndYUV", "role": "full_n" }} , 
 	{ "name": "bckgndYUV_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bckgndYUV", "role": "write" }} , 
 	{ "name": "bckgndYUV_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bckgndYUV", "role": "num_data_valid" }} , 
 	{ "name": "bckgndYUV_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bckgndYUV", "role": "fifo_cap" }} , 
 	{ "name": "rampVal_3_flag_0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rampVal_3_flag_0", "role": "default" }} , 
 	{ "name": "hdata_flag_0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "hdata_flag_0", "role": "default" }} , 
 	{ "name": "rampVal_2_flag_0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rampVal_2_flag_0", "role": "default" }} , 
 	{ "name": "dpYUVCoef_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dpYUVCoef_val", "role": "default" }} , 
 	{ "name": "colorFormat_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "colorFormat_val", "role": "default" }} , 
 	{ "name": "dpDynamicRange_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dpDynamicRange_val", "role": "default" }} , 
 	{ "name": "Sel", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "Sel", "role": "default" }} , 
 	{ "name": "y", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "y", "role": "default" }} , 
 	{ "name": "barWidth", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "barWidth", "role": "default" }} , 
 	{ "name": "width_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "width_val", "role": "default" }} , 
 	{ "name": "select_ln1230", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "select_ln1230", "role": "default" }} , 
 	{ "name": "select_ln1209", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "select_ln1209", "role": "default" }} , 
 	{ "name": "select_ln1188", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "select_ln1188", "role": "default" }} , 
 	{ "name": "select_ln1188_1", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "select_ln1188_1", "role": "default" }} , 
 	{ "name": "sext_ln1162", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "sext_ln1162", "role": "default" }} , 
 	{ "name": "select_ln1122", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "select_ln1122", "role": "default" }} , 
 	{ "name": "select_ln1188_2", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "select_ln1188_2", "role": "default" }} , 
 	{ "name": "select_ln1162", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "select_ln1162", "role": "default" }} , 
 	{ "name": "select_ln1141", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "select_ln1141", "role": "default" }} , 
 	{ "name": "rampStart_1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "rampStart_1", "role": "default" }} , 
 	{ "name": "ZplateHorContStart_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ZplateHorContStart_val", "role": "default" }} , 
 	{ "name": "patternId_val", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "patternId_val", "role": "default" }} , 
 	{ "name": "zext_ln1120", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "zext_ln1120", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "shl_ln", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "shl_ln", "role": "default" }} , 
 	{ "name": "ZplateHorContDelta_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ZplateHorContDelta_val", "role": "default" }} , 
 	{ "name": "ZplateVerContStart_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ZplateVerContStart_val", "role": "default" }} , 
 	{ "name": "icmp_ln1337", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1337", "role": "default" }} , 
 	{ "name": "ZplateVerContDelta_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ZplateVerContDelta_val", "role": "default" }} , 
 	{ "name": "add_ln1386", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "add_ln1386", "role": "default" }} , 
 	{ "name": "barWidthMinSamples", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "barWidthMinSamples", "role": "default" }} , 
 	{ "name": "icmp_ln1449_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1449_1", "role": "default" }} , 
 	{ "name": "add_ln1473", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "add_ln1473", "role": "default" }} , 
 	{ "name": "add_ln1533", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "add_ln1533", "role": "default" }} , 
 	{ "name": "icmp", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp", "role": "default" }} , 
 	{ "name": "icmp_ln1801", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1801", "role": "default" }} , 
 	{ "name": "rampVal_3_flag_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rampVal_3_flag_1_out", "role": "default" }} , 
 	{ "name": "rampVal_3_flag_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rampVal_3_flag_1_out", "role": "ap_vld" }} , 
 	{ "name": "rampVal_3_new_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rampVal_3_new_1_out", "role": "default" }} , 
 	{ "name": "rampVal_3_new_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rampVal_3_new_1_out", "role": "ap_vld" }} , 
 	{ "name": "rampVal_3_loc_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rampVal_3_loc_1_out", "role": "i" }} , 
 	{ "name": "rampVal_3_loc_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rampVal_3_loc_1_out", "role": "o" }} , 
 	{ "name": "rampVal_3_loc_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rampVal_3_loc_1_out", "role": "o_ap_vld" }} , 
 	{ "name": "rampVal_loc_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rampVal_loc_1_out", "role": "i" }} , 
 	{ "name": "rampVal_loc_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rampVal_loc_1_out", "role": "o" }} , 
 	{ "name": "rampVal_loc_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rampVal_loc_1_out", "role": "o_ap_vld" }} , 
 	{ "name": "tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out", "role": "i" }} , 
 	{ "name": "tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out", "role": "o" }} , 
 	{ "name": "tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out", "role": "o_ap_vld" }} , 
 	{ "name": "zonePlateVAddr_loc_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "zonePlateVAddr_loc_1_out", "role": "i" }} , 
 	{ "name": "zonePlateVAddr_loc_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "zonePlateVAddr_loc_1_out", "role": "o" }} , 
 	{ "name": "zonePlateVAddr_loc_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "zonePlateVAddr_loc_1_out", "role": "o_ap_vld" }} , 
 	{ "name": "vBarSel_loc_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vBarSel_loc_1_out", "role": "i" }} , 
 	{ "name": "vBarSel_loc_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vBarSel_loc_1_out", "role": "o" }} , 
 	{ "name": "vBarSel_loc_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "vBarSel_loc_1_out", "role": "o_ap_vld" }} , 
 	{ "name": "tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out", "role": "i" }} , 
 	{ "name": "tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out", "role": "o" }} , 
 	{ "name": "tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out", "role": "o_ap_vld" }} , 
 	{ "name": "hdata_flag_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "hdata_flag_1_out", "role": "default" }} , 
 	{ "name": "hdata_flag_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "hdata_flag_1_out", "role": "ap_vld" }} , 
 	{ "name": "hdata_new_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "hdata_new_1_out", "role": "default" }} , 
 	{ "name": "hdata_new_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "hdata_new_1_out", "role": "ap_vld" }} , 
 	{ "name": "hdata_loc_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "hdata_loc_1_out", "role": "i" }} , 
 	{ "name": "hdata_loc_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "hdata_loc_1_out", "role": "o" }} , 
 	{ "name": "hdata_loc_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "hdata_loc_1_out", "role": "o_ap_vld" }} , 
 	{ "name": "vBarSel_2_loc_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vBarSel_2_loc_1_out", "role": "i" }} , 
 	{ "name": "vBarSel_2_loc_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vBarSel_2_loc_1_out", "role": "o" }} , 
 	{ "name": "vBarSel_2_loc_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "vBarSel_2_loc_1_out", "role": "o_ap_vld" }} , 
 	{ "name": "tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out", "role": "i" }} , 
 	{ "name": "tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out", "role": "o" }} , 
 	{ "name": "tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out", "role": "o_ap_vld" }} , 
 	{ "name": "rampVal_2_flag_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rampVal_2_flag_1_out", "role": "default" }} , 
 	{ "name": "rampVal_2_flag_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rampVal_2_flag_1_out", "role": "ap_vld" }} , 
 	{ "name": "rampVal_2_new_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rampVal_2_new_1_out", "role": "default" }} , 
 	{ "name": "rampVal_2_new_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rampVal_2_new_1_out", "role": "ap_vld" }} , 
 	{ "name": "rampVal_2_loc_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rampVal_2_loc_1_out", "role": "i" }} , 
 	{ "name": "rampVal_2_loc_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rampVal_2_loc_1_out", "role": "o" }} , 
 	{ "name": "rampVal_2_loc_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rampVal_2_loc_1_out", "role": "o_ap_vld" }} , 
 	{ "name": "vBarSel_3_loc_1_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vBarSel_3_loc_1_out", "role": "i" }} , 
 	{ "name": "vBarSel_3_loc_1_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vBarSel_3_loc_1_out", "role": "o" }} , 
 	{ "name": "vBarSel_3_loc_1_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "vBarSel_3_loc_1_out", "role": "o_ap_vld" }} , 
 	{ "name": "tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out", "role": "i" }} , 
 	{ "name": "tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out", "role": "o" }} , 
 	{ "name": "tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out", "role": "o_ap_vld" }} , 
 	{ "name": "outpix_0_2_0_0_0_load216_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outpix_0_2_0_0_0_load216_out", "role": "i" }} , 
 	{ "name": "outpix_0_2_0_0_0_load216_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outpix_0_2_0_0_0_load216_out", "role": "o" }} , 
 	{ "name": "outpix_0_2_0_0_0_load216_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "outpix_0_2_0_0_0_load216_out", "role": "o_ap_vld" }} , 
 	{ "name": "outpix_0_1_0_0_0_load214_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outpix_0_1_0_0_0_load214_out", "role": "i" }} , 
 	{ "name": "outpix_0_1_0_0_0_load214_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outpix_0_1_0_0_0_load214_out", "role": "o" }} , 
 	{ "name": "outpix_0_1_0_0_0_load214_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "outpix_0_1_0_0_0_load214_out", "role": "o_ap_vld" }} , 
 	{ "name": "outpix_0_0_0_0_0_load212_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outpix_0_0_0_0_0_load212_out", "role": "i" }} , 
 	{ "name": "outpix_0_0_0_0_0_load212_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outpix_0_0_0_0_0_load212_out", "role": "o" }} , 
 	{ "name": "outpix_0_0_0_0_0_load212_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "outpix_0_0_0_0_0_load212_out", "role": "o_ap_vld" }} , 
 	{ "name": "rampVal", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "rampVal", "role": "default" }} , 
 	{ "name": "rampVal_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rampVal", "role": "ap_vld" }} , 
 	{ "name": "tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel", "role": "default" }} , 
 	{ "name": "tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel", "role": "ap_vld" }} , 
 	{ "name": "zonePlateVAddr", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "zonePlateVAddr", "role": "default" }} , 
 	{ "name": "zonePlateVAddr_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "zonePlateVAddr", "role": "ap_vld" }} , 
 	{ "name": "tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_1", "role": "default" }} , 
 	{ "name": "tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_1", "role": "ap_vld" }} , 
 	{ "name": "vBarSel", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "vBarSel", "role": "default" }} , 
 	{ "name": "vBarSel_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "vBarSel", "role": "ap_vld" }} , 
 	{ "name": "tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_1", "role": "default" }} , 
 	{ "name": "tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_1", "role": "ap_vld" }} , 
 	{ "name": "vBarSel_2", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vBarSel_2", "role": "default" }} , 
 	{ "name": "vBarSel_2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "vBarSel_2", "role": "ap_vld" }} , 
 	{ "name": "tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_1", "role": "default" }} , 
 	{ "name": "tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_1", "role": "ap_vld" }} , 
 	{ "name": "vBarSel_1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "vBarSel_1", "role": "default" }} , 
 	{ "name": "vBarSel_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "vBarSel_1", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	tpgBackground_Pipeline_VITIS_LOOP_565_2 {
		rampVal_3_flag_0 {Type I LastRead 0 FirstWrite -1}
		hdata_flag_0 {Type I LastRead 0 FirstWrite -1}
		rampVal_2_flag_0 {Type I LastRead 0 FirstWrite -1}
		dpYUVCoef_val {Type I LastRead 0 FirstWrite -1}
		colorFormat_val {Type I LastRead 0 FirstWrite -1}
		dpDynamicRange_val {Type I LastRead 0 FirstWrite -1}
		Sel {Type I LastRead 0 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		barWidth {Type I LastRead 0 FirstWrite -1}
		width_val {Type I LastRead 0 FirstWrite -1}
		select_ln1230 {Type I LastRead 0 FirstWrite -1}
		select_ln1209 {Type I LastRead 0 FirstWrite -1}
		select_ln1188 {Type I LastRead 0 FirstWrite -1}
		select_ln1188_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln1162 {Type I LastRead 0 FirstWrite -1}
		select_ln1122 {Type I LastRead 0 FirstWrite -1}
		select_ln1188_2 {Type I LastRead 0 FirstWrite -1}
		select_ln1162 {Type I LastRead 0 FirstWrite -1}
		select_ln1141 {Type I LastRead 0 FirstWrite -1}
		rampStart_1 {Type I LastRead 0 FirstWrite -1}
		bckgndYUV {Type O LastRead -1 FirstWrite 20}
		ZplateHorContStart_val {Type I LastRead 0 FirstWrite -1}
		patternId_val {Type I LastRead 0 FirstWrite -1}
		zext_ln1120 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		shl_ln {Type I LastRead 0 FirstWrite -1}
		ZplateHorContDelta_val {Type I LastRead 0 FirstWrite -1}
		ZplateVerContStart_val {Type I LastRead 0 FirstWrite -1}
		icmp_ln1337 {Type I LastRead 0 FirstWrite -1}
		ZplateVerContDelta_val {Type I LastRead 0 FirstWrite -1}
		add_ln1386 {Type I LastRead 0 FirstWrite -1}
		barWidthMinSamples {Type I LastRead 0 FirstWrite -1}
		icmp_ln1449_1 {Type I LastRead 0 FirstWrite -1}
		add_ln1473 {Type I LastRead 0 FirstWrite -1}
		add_ln1533 {Type I LastRead 0 FirstWrite -1}
		icmp {Type I LastRead 0 FirstWrite -1}
		icmp_ln1801 {Type I LastRead 0 FirstWrite -1}
		rampVal_3_flag_1_out {Type O LastRead -1 FirstWrite 19}
		rampVal_3_new_1_out {Type O LastRead -1 FirstWrite 19}
		rampVal_3_loc_1_out {Type IO LastRead 19 FirstWrite 19}
		rampVal_loc_1_out {Type IO LastRead 19 FirstWrite 18}
		tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out {Type IO LastRead 18 FirstWrite 17}
		zonePlateVAddr_loc_1_out {Type IO LastRead 6 FirstWrite 5}
		vBarSel_loc_1_out {Type IO LastRead 17 FirstWrite 16}
		tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out {Type IO LastRead 17 FirstWrite 16}
		hdata_flag_1_out {Type O LastRead -1 FirstWrite 19}
		hdata_new_1_out {Type O LastRead -1 FirstWrite 19}
		hdata_loc_1_out {Type IO LastRead 19 FirstWrite 19}
		vBarSel_2_loc_1_out {Type IO LastRead 17 FirstWrite 16}
		tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out {Type IO LastRead 17 FirstWrite 16}
		rampVal_2_flag_1_out {Type O LastRead -1 FirstWrite 19}
		rampVal_2_new_1_out {Type O LastRead -1 FirstWrite 19}
		rampVal_2_loc_1_out {Type IO LastRead 19 FirstWrite 19}
		vBarSel_3_loc_1_out {Type IO LastRead 17 FirstWrite 16}
		tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out {Type IO LastRead 17 FirstWrite 16}
		outpix_0_2_0_0_0_load216_out {Type IO LastRead 20 FirstWrite 0}
		outpix_0_1_0_0_0_load214_out {Type IO LastRead 20 FirstWrite 19}
		outpix_0_0_0_0_0_load212_out {Type IO LastRead 20 FirstWrite 0}
		rampVal {Type O LastRead -1 FirstWrite 18}
		redYuv {Type I LastRead -1 FirstWrite -1}
		grnYuv {Type I LastRead -1 FirstWrite -1}
		bluYuv {Type I LastRead -1 FirstWrite -1}
		blkYuv {Type I LastRead -1 FirstWrite -1}
		whiYuv {Type I LastRead -1 FirstWrite -1}
		tpgBarSelRgb_r {Type I LastRead -1 FirstWrite -1}
		tpgBarSelYuv_y {Type I LastRead -1 FirstWrite -1}
		tpgBarSelRgb_g {Type I LastRead -1 FirstWrite -1}
		tpgBarSelYuv_u {Type I LastRead -1 FirstWrite -1}
		tpgBarSelYuv_v {Type I LastRead -1 FirstWrite -1}
		tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel {Type O LastRead -1 FirstWrite 17}
		tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_xBar {Type IO LastRead -1 FirstWrite -1}
		tpgBarSelRgb_b {Type I LastRead -1 FirstWrite -1}
		tpgSinTableArray {Type I LastRead -1 FirstWrite -1}
		zonePlateVAddr {Type O LastRead -1 FirstWrite 5}
		zonePlateVDelta {Type IO LastRead -1 FirstWrite -1}
		tpgTartanBarArray {Type I LastRead -1 FirstWrite -1}
		tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_1 {Type O LastRead -1 FirstWrite 16}
		tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign {Type IO LastRead -1 FirstWrite -1}
		yCount {Type IO LastRead -1 FirstWrite -1}
		vBarSel {Type O LastRead -1 FirstWrite 16}
		tpgPatternCrossHatch_unsigned_short_unsigned_short_unsigned_short_unsigned_sh {Type IO LastRead -1 FirstWrite -1}
		vHatch {Type IO LastRead -1 FirstWrite -1}
		yCount_2 {Type IO LastRead -1 FirstWrite -1}
		whiYuv_1 {Type I LastRead -1 FirstWrite -1}
		blkYuv_1 {Type I LastRead -1 FirstWrite -1}
		tpgSinTableArray_9bit_0 {Type I LastRead -1 FirstWrite -1}
		tpgSinTableArray_9bit_1 {Type I LastRead -1 FirstWrite -1}
		tpgSinTableArray_9bit_2 {Type I LastRead -1 FirstWrite -1}
		tpgCheckerBoardArray {Type I LastRead -1 FirstWrite -1}
		tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_1 {Type O LastRead -1 FirstWrite 16}
		tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_s {Type IO LastRead -1 FirstWrite -1}
		yCount_3 {Type IO LastRead -1 FirstWrite -1}
		vBarSel_2 {Type O LastRead -1 FirstWrite 16}
		rSerie {Type IO LastRead -1 FirstWrite -1}
		gSerie {Type IO LastRead -1 FirstWrite -1}
		bSerie {Type IO LastRead -1 FirstWrite -1}
		DPtpgBarSelRgb_VESA_r {Type I LastRead -1 FirstWrite -1}
		DPtpgBarSelRgb_VESA_g {Type I LastRead -1 FirstWrite -1}
		DPtpgBarSelRgb_VESA_b {Type I LastRead -1 FirstWrite -1}
		DPtpgBarArray {Type I LastRead -1 FirstWrite -1}
		tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_1 {Type O LastRead -1 FirstWrite 16}
		tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_s {Type IO LastRead -1 FirstWrite -1}
		yCount_1 {Type IO LastRead -1 FirstWrite -1}
		vBarSel_1 {Type O LastRead -1 FirstWrite 16}
		DPtpgBarSelRgb_CEA_r {Type I LastRead -1 FirstWrite -1}
		DPtpgBarSelRgb_CEA_g {Type I LastRead -1 FirstWrite -1}
		DPtpgBarSelRgb_CEA_b {Type I LastRead -1 FirstWrite -1}
		DPtpgBarSelYuv_601_y {Type I LastRead -1 FirstWrite -1}
		DPtpgBarSelYuv_601_v {Type I LastRead -1 FirstWrite -1}
		DPtpgBarSelYuv_601_u {Type I LastRead -1 FirstWrite -1}
		DPtpgBarSelYuv_709_y {Type I LastRead -1 FirstWrite -1}
		DPtpgBarSelYuv_709_v {Type I LastRead -1 FirstWrite -1}
		DPtpgBarSelYuv_709_u {Type I LastRead -1 FirstWrite -1}}
	reg_ap_uint_10_s {
		d {Type I LastRead 1 FirstWrite -1}}
	reg_int_s {
		d {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "65556"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "65536"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rampVal_3_flag_0 { ap_none {  { rampVal_3_flag_0 in_data 0 1 } } }
	hdata_flag_0 { ap_none {  { hdata_flag_0 in_data 0 1 } } }
	rampVal_2_flag_0 { ap_none {  { rampVal_2_flag_0 in_data 0 1 } } }
	dpYUVCoef_val { ap_stable {  { dpYUVCoef_val in_data 0 8 } } }
	colorFormat_val { ap_stable {  { colorFormat_val in_data 0 8 } } }
	dpDynamicRange_val { ap_stable {  { dpDynamicRange_val in_data 0 8 } } }
	Sel { ap_none {  { Sel in_data 0 2 } } }
	y { ap_none {  { y in_data 0 16 } } }
	barWidth { ap_stable {  { barWidth in_data 0 11 } } }
	width_val { ap_stable {  { width_val in_data 0 16 } } }
	select_ln1230 { ap_stable {  { select_ln1230 in_data 0 8 } } }
	select_ln1209 { ap_stable {  { select_ln1209 in_data 0 8 } } }
	select_ln1188 { ap_stable {  { select_ln1188 in_data 0 8 } } }
	select_ln1188_1 { ap_stable {  { select_ln1188_1 in_data 0 5 } } }
	sext_ln1162 { ap_stable {  { sext_ln1162 in_data 0 1 } } }
	select_ln1122 { ap_none {  { select_ln1122 in_data 0 8 } } }
	select_ln1188_2 { ap_stable {  { select_ln1188_2 in_data 0 3 } } }
	select_ln1162 { ap_stable {  { select_ln1162 in_data 0 8 } } }
	select_ln1141 { ap_stable {  { select_ln1141 in_data 0 8 } } }
	rampStart_1 { ap_none {  { rampStart_1 in_data 0 8 } } }
	bckgndYUV { ap_fifo {  { bckgndYUV_din fifo_data_out 1 24 }  { bckgndYUV_full_n fifo_status_empty 0 1 }  { bckgndYUV_write fifo_data_in 1 1 }  { bckgndYUV_num_data_valid fifo_update 0 5 }  { bckgndYUV_fifo_cap fifo_data 0 5 } } }
	ZplateHorContStart_val { ap_stable {  { ZplateHorContStart_val in_data 0 16 } } }
	patternId_val { ap_stable {  { patternId_val in_data 0 8 } } }
	zext_ln1120 { ap_none {  { zext_ln1120 in_data 0 8 } } }
	empty { ap_none {  { empty in_data 0 8 } } }
	shl_ln { ap_none {  { shl_ln in_data 0 16 } } }
	ZplateHorContDelta_val { ap_stable {  { ZplateHorContDelta_val in_data 0 16 } } }
	ZplateVerContStart_val { ap_stable {  { ZplateVerContStart_val in_data 0 16 } } }
	icmp_ln1337 { ap_none {  { icmp_ln1337 in_data 0 1 } } }
	ZplateVerContDelta_val { ap_stable {  { ZplateVerContDelta_val in_data 0 16 } } }
	add_ln1386 { ap_stable {  { add_ln1386 in_data 0 11 } } }
	barWidthMinSamples { ap_stable {  { barWidthMinSamples in_data 0 10 } } }
	icmp_ln1449_1 { ap_none {  { icmp_ln1449_1 in_data 0 1 } } }
	add_ln1473 { ap_stable {  { add_ln1473 in_data 0 17 } } }
	add_ln1533 { ap_none {  { add_ln1533 in_data 0 8 } } }
	icmp { ap_stable {  { icmp in_data 0 1 } } }
	icmp_ln1801 { ap_stable {  { icmp_ln1801 in_data 0 1 } } }
	rampVal_3_flag_1_out { ap_vld {  { rampVal_3_flag_1_out out_data 1 1 }  { rampVal_3_flag_1_out_ap_vld out_vld 1 1 } } }
	rampVal_3_new_1_out { ap_vld {  { rampVal_3_new_1_out out_data 1 16 }  { rampVal_3_new_1_out_ap_vld out_vld 1 1 } } }
	rampVal_3_loc_1_out { ap_ovld {  { rampVal_3_loc_1_out_i in_data 0 16 }  { rampVal_3_loc_1_out_o out_data 1 16 }  { rampVal_3_loc_1_out_o_ap_vld out_vld 1 1 } } }
	rampVal_loc_1_out { ap_ovld {  { rampVal_loc_1_out_i in_data 0 16 }  { rampVal_loc_1_out_o out_data 1 16 }  { rampVal_loc_1_out_o_ap_vld out_vld 1 1 } } }
	tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out { ap_ovld {  { tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out_i in_data 0 8 }  { tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out_o out_data 1 8 }  { tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_l_2_out_o_ap_vld out_vld 1 1 } } }
	zonePlateVAddr_loc_1_out { ap_ovld {  { zonePlateVAddr_loc_1_out_i in_data 0 16 }  { zonePlateVAddr_loc_1_out_o out_data 1 16 }  { zonePlateVAddr_loc_1_out_o_ap_vld out_vld 1 1 } } }
	vBarSel_loc_1_out { ap_ovld {  { vBarSel_loc_1_out_i in_data 0 8 }  { vBarSel_loc_1_out_o out_data 1 8 }  { vBarSel_loc_1_out_o_ap_vld out_vld 1 1 } } }
	tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out { ap_ovld {  { tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out_i in_data 0 8 }  { tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out_o out_data 1 8 }  { tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_4_out_o_ap_vld out_vld 1 1 } } }
	hdata_flag_1_out { ap_vld {  { hdata_flag_1_out out_data 1 1 }  { hdata_flag_1_out_ap_vld out_vld 1 1 } } }
	hdata_new_1_out { ap_vld {  { hdata_new_1_out out_data 1 16 }  { hdata_new_1_out_ap_vld out_vld 1 1 } } }
	hdata_loc_1_out { ap_ovld {  { hdata_loc_1_out_i in_data 0 16 }  { hdata_loc_1_out_o out_data 1 16 }  { hdata_loc_1_out_o_ap_vld out_vld 1 1 } } }
	vBarSel_2_loc_1_out { ap_ovld {  { vBarSel_2_loc_1_out_i in_data 0 8 }  { vBarSel_2_loc_1_out_o out_data 1 8 }  { vBarSel_2_loc_1_out_o_ap_vld out_vld 1 1 } } }
	tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out { ap_ovld {  { tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out_i in_data 0 8 }  { tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out_o out_data 1 8 }  { tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_4_out_o_ap_vld out_vld 1 1 } } }
	rampVal_2_flag_1_out { ap_vld {  { rampVal_2_flag_1_out out_data 1 1 }  { rampVal_2_flag_1_out_ap_vld out_vld 1 1 } } }
	rampVal_2_new_1_out { ap_vld {  { rampVal_2_new_1_out out_data 1 16 }  { rampVal_2_new_1_out_ap_vld out_vld 1 1 } } }
	rampVal_2_loc_1_out { ap_ovld {  { rampVal_2_loc_1_out_i in_data 0 16 }  { rampVal_2_loc_1_out_o out_data 1 16 }  { rampVal_2_loc_1_out_o_ap_vld out_vld 1 1 } } }
	vBarSel_3_loc_1_out { ap_ovld {  { vBarSel_3_loc_1_out_i in_data 0 8 }  { vBarSel_3_loc_1_out_o out_data 1 8 }  { vBarSel_3_loc_1_out_o_ap_vld out_vld 1 1 } } }
	tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out { ap_ovld {  { tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out_i in_data 0 8 }  { tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out_o out_data 1 8 }  { tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_4_out_o_ap_vld out_vld 1 1 } } }
	outpix_0_2_0_0_0_load216_out { ap_ovld {  { outpix_0_2_0_0_0_load216_out_i in_data 0 8 }  { outpix_0_2_0_0_0_load216_out_o out_data 1 8 }  { outpix_0_2_0_0_0_load216_out_o_ap_vld out_vld 1 1 } } }
	outpix_0_1_0_0_0_load214_out { ap_ovld {  { outpix_0_1_0_0_0_load214_out_i in_data 0 8 }  { outpix_0_1_0_0_0_load214_out_o out_data 1 8 }  { outpix_0_1_0_0_0_load214_out_o_ap_vld out_vld 1 1 } } }
	outpix_0_0_0_0_0_load212_out { ap_ovld {  { outpix_0_0_0_0_0_load212_out_i in_data 0 8 }  { outpix_0_0_0_0_0_load212_out_o out_data 1 8 }  { outpix_0_0_0_0_0_load212_out_o_ap_vld out_vld 1 1 } } }
	rampVal { ap_vld {  { rampVal out_data 1 8 }  { rampVal_ap_vld out_vld 1 1 } } }
	tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel { ap_vld {  { tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel out_data 1 8 }  { tpgPatternColorBars_unsigned_short_unsigned_short_unsigned_char_int_hBarSel_ap_vld out_vld 1 1 } } }
	zonePlateVAddr { ap_vld {  { zonePlateVAddr out_data 1 16 }  { zonePlateVAddr_ap_vld out_vld 1 1 } } }
	tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_1 { ap_vld {  { tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_1 out_data 1 3 }  { tpgPatternTartanColorBars_unsigned_short_unsigned_short_unsigned_short_unsign_1_ap_vld out_vld 1 1 } } }
	vBarSel { ap_vld {  { vBarSel out_data 1 3 }  { vBarSel_ap_vld out_vld 1 1 } } }
	tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_1 { ap_vld {  { tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_1 out_data 1 3 }  { tpgPatternCheckerBoard_unsigned_short_unsigned_short_unsigned_short_unsigned_1_ap_vld out_vld 1 1 } } }
	vBarSel_2 { ap_vld {  { vBarSel_2 out_data 1 8 }  { vBarSel_2_ap_vld out_vld 1 1 } } }
	tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_1 { ap_vld {  { tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_1 out_data 1 3 }  { tpgPatternDPColorSquare_unsigned_short_unsigned_short_unsigned_char_unsigned_1_ap_vld out_vld 1 1 } } }
	vBarSel_1 { ap_vld {  { vBarSel_1 out_data 1 1 }  { vBarSel_1_ap_vld out_vld 1 1 } } }
}
