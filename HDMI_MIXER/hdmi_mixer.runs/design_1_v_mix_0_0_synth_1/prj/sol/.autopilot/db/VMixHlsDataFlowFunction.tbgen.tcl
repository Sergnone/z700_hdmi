set moduleName VMixHlsDataFlowFunction
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type dataflow
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
set cdfgNum 40
set C_modelName {VMixHlsDataFlowFunction}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ HwReg_width_val int 11 regular {ap_stable 0} }
	{ HwReg_height_val int 11 regular {ap_stable 0} }
	{ HwReg_background_Y_R_val10 int 8 regular {ap_stable 0} }
	{ HwReg_background_U_G_val11 int 8 regular {ap_stable 0} }
	{ HwReg_background_V_B_val12 int 8 regular {ap_stable 0} }
	{ HwReg_layerEnable_val13 int 2 regular {ap_stable 0} }
	{ mm_video1 int 64 regular {axi_master 0 stable }  }
	{ HwReg_layer1_buf1 int 32 regular {ap_stable 0} }
	{ HwReg_layerEnableFlag_0_val int 1 regular {ap_stable 0} }
	{ HwReg_layerEnableFlag_1_val int 1 regular {ap_stable 0} }
	{ HwReg_layerAlpha_1_val14 int 9 regular {ap_stable 0} }
	{ HwReg_layerStartX_1_val15 int 16 regular {ap_stable 0} }
	{ HwReg_layerStartY_1_val16 int 16 regular {ap_stable 0} }
	{ HwReg_layerWidth_1_val int 16 regular {ap_stable 0} }
	{ HwReg_layerHeight_1_val int 16 regular {ap_stable 0} }
	{ HwReg_layerScaleFactor_1_val19 int 8 regular {ap_stable 0} }
	{ HwReg_layerStride_1_val int 16 regular {ap_stable 0} }
	{ s_axis_video_V_data_V int 24 regular {axi_s 0 volatile  { s_axis_video Data } }  }
	{ s_axis_video_V_keep_V int 3 regular {axi_s 0 volatile  { s_axis_video Keep } }  }
	{ s_axis_video_V_strb_V int 3 regular {axi_s 0 volatile  { s_axis_video Strb } }  }
	{ s_axis_video_V_user_V int 1 regular {axi_s 0 volatile  { s_axis_video User } }  }
	{ s_axis_video_V_last_V int 1 regular {axi_s 0 volatile  { s_axis_video Last } }  }
	{ s_axis_video_V_id_V int 1 regular {axi_s 0 volatile  { s_axis_video ID } }  }
	{ s_axis_video_V_dest_V int 1 regular {axi_s 0 volatile  { s_axis_video Dest } }  }
	{ m_axis_video_V_data_V int 24 regular {axi_s 1 volatile  { m_axis_video Data } }  }
	{ m_axis_video_V_keep_V int 3 regular {axi_s 1 volatile  { m_axis_video Keep } }  }
	{ m_axis_video_V_strb_V int 3 regular {axi_s 1 volatile  { m_axis_video Strb } }  }
	{ m_axis_video_V_user_V int 1 regular {axi_s 1 volatile  { m_axis_video User } }  }
	{ m_axis_video_V_last_V int 1 regular {axi_s 1 volatile  { m_axis_video Last } }  }
	{ m_axis_video_V_id_V int 1 regular {axi_s 1 volatile  { m_axis_video ID } }  }
	{ m_axis_video_V_dest_V int 1 regular {axi_s 1 volatile  { m_axis_video Dest } }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "HwReg_width_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_height_val", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_background_Y_R_val10", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_background_U_G_val11", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_background_V_B_val12", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerEnable_val13", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "mm_video1", "interface" : "axi_master", "bitwidth" : 64, "direction" : "READONLY", "id_num" : 0, "bitSlice":[ {"cElement": [{"cName": "layer1_buf1","offset": { "type": "dynamic","port_name": "layer1_buf1","bundle": "CTRL"},"direction": "READONLY"},{"cName": "layer1_buf2","offset": { "type": "dynamic","port_name": "layer1_buf2","bundle": "CTRL"}},{"cName": "layer1_buf3","offset": { "type": "dynamic","port_name": "layer1_buf3","bundle": "CTRL"}}]}]} , 
 	{ "Name" : "HwReg_layer1_buf1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerEnableFlag_0_val", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerEnableFlag_1_val", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerAlpha_1_val14", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerStartX_1_val15", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerStartY_1_val16", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerWidth_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerHeight_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerScaleFactor_1_val19", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerStride_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_video_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 103
set portList { 
	{ HwReg_width_val sc_in sc_lv 11 signal 0 } 
	{ HwReg_height_val sc_in sc_lv 11 signal 1 } 
	{ HwReg_background_Y_R_val10 sc_in sc_lv 8 signal 2 } 
	{ HwReg_background_U_G_val11 sc_in sc_lv 8 signal 3 } 
	{ HwReg_background_V_B_val12 sc_in sc_lv 8 signal 4 } 
	{ HwReg_layerEnable_val13 sc_in sc_lv 2 signal 5 } 
	{ m_axi_mm_video1_0_AWVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_mm_video1_0_AWREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_mm_video1_0_AWADDR sc_out sc_lv 32 signal 6 } 
	{ m_axi_mm_video1_0_AWID sc_out sc_lv 1 signal 6 } 
	{ m_axi_mm_video1_0_AWLEN sc_out sc_lv 32 signal 6 } 
	{ m_axi_mm_video1_0_AWSIZE sc_out sc_lv 3 signal 6 } 
	{ m_axi_mm_video1_0_AWBURST sc_out sc_lv 2 signal 6 } 
	{ m_axi_mm_video1_0_AWLOCK sc_out sc_lv 2 signal 6 } 
	{ m_axi_mm_video1_0_AWCACHE sc_out sc_lv 4 signal 6 } 
	{ m_axi_mm_video1_0_AWPROT sc_out sc_lv 3 signal 6 } 
	{ m_axi_mm_video1_0_AWQOS sc_out sc_lv 4 signal 6 } 
	{ m_axi_mm_video1_0_AWREGION sc_out sc_lv 4 signal 6 } 
	{ m_axi_mm_video1_0_AWUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_mm_video1_0_WVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_mm_video1_0_WREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_mm_video1_0_WDATA sc_out sc_lv 64 signal 6 } 
	{ m_axi_mm_video1_0_WSTRB sc_out sc_lv 8 signal 6 } 
	{ m_axi_mm_video1_0_WLAST sc_out sc_logic 1 signal 6 } 
	{ m_axi_mm_video1_0_WID sc_out sc_lv 1 signal 6 } 
	{ m_axi_mm_video1_0_WUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_mm_video1_0_ARVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_mm_video1_0_ARREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_mm_video1_0_ARADDR sc_out sc_lv 32 signal 6 } 
	{ m_axi_mm_video1_0_ARID sc_out sc_lv 1 signal 6 } 
	{ m_axi_mm_video1_0_ARLEN sc_out sc_lv 32 signal 6 } 
	{ m_axi_mm_video1_0_ARSIZE sc_out sc_lv 3 signal 6 } 
	{ m_axi_mm_video1_0_ARBURST sc_out sc_lv 2 signal 6 } 
	{ m_axi_mm_video1_0_ARLOCK sc_out sc_lv 2 signal 6 } 
	{ m_axi_mm_video1_0_ARCACHE sc_out sc_lv 4 signal 6 } 
	{ m_axi_mm_video1_0_ARPROT sc_out sc_lv 3 signal 6 } 
	{ m_axi_mm_video1_0_ARQOS sc_out sc_lv 4 signal 6 } 
	{ m_axi_mm_video1_0_ARREGION sc_out sc_lv 4 signal 6 } 
	{ m_axi_mm_video1_0_ARUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_mm_video1_0_RVALID sc_in sc_logic 1 signal 6 } 
	{ m_axi_mm_video1_0_RREADY sc_out sc_logic 1 signal 6 } 
	{ m_axi_mm_video1_0_RDATA sc_in sc_lv 64 signal 6 } 
	{ m_axi_mm_video1_0_RLAST sc_in sc_logic 1 signal 6 } 
	{ m_axi_mm_video1_0_RID sc_in sc_lv 1 signal 6 } 
	{ m_axi_mm_video1_0_RFIFONUM sc_in sc_lv 7 signal 6 } 
	{ m_axi_mm_video1_0_RUSER sc_in sc_lv 1 signal 6 } 
	{ m_axi_mm_video1_0_RRESP sc_in sc_lv 2 signal 6 } 
	{ m_axi_mm_video1_0_BVALID sc_in sc_logic 1 signal 6 } 
	{ m_axi_mm_video1_0_BREADY sc_out sc_logic 1 signal 6 } 
	{ m_axi_mm_video1_0_BRESP sc_in sc_lv 2 signal 6 } 
	{ m_axi_mm_video1_0_BID sc_in sc_lv 1 signal 6 } 
	{ m_axi_mm_video1_0_BUSER sc_in sc_lv 1 signal 6 } 
	{ HwReg_layer1_buf1 sc_in sc_lv 32 signal 7 } 
	{ HwReg_layerEnableFlag_0_val sc_in sc_lv 1 signal 8 } 
	{ HwReg_layerEnableFlag_1_val sc_in sc_lv 1 signal 9 } 
	{ HwReg_layerAlpha_1_val14 sc_in sc_lv 9 signal 10 } 
	{ HwReg_layerStartX_1_val15 sc_in sc_lv 16 signal 11 } 
	{ HwReg_layerStartY_1_val16 sc_in sc_lv 16 signal 12 } 
	{ HwReg_layerWidth_1_val sc_in sc_lv 16 signal 13 } 
	{ HwReg_layerHeight_1_val sc_in sc_lv 16 signal 14 } 
	{ HwReg_layerScaleFactor_1_val19 sc_in sc_lv 8 signal 15 } 
	{ HwReg_layerStride_1_val sc_in sc_lv 16 signal 16 } 
	{ s_axis_video_TDATA sc_in sc_lv 24 signal 17 } 
	{ s_axis_video_TKEEP sc_in sc_lv 3 signal 18 } 
	{ s_axis_video_TSTRB sc_in sc_lv 3 signal 19 } 
	{ s_axis_video_TUSER sc_in sc_lv 1 signal 20 } 
	{ s_axis_video_TLAST sc_in sc_lv 1 signal 21 } 
	{ s_axis_video_TID sc_in sc_lv 1 signal 22 } 
	{ s_axis_video_TDEST sc_in sc_lv 1 signal 23 } 
	{ m_axis_video_TDATA sc_out sc_lv 24 signal 24 } 
	{ m_axis_video_TKEEP sc_out sc_lv 3 signal 25 } 
	{ m_axis_video_TSTRB sc_out sc_lv 3 signal 26 } 
	{ m_axis_video_TUSER sc_out sc_lv 1 signal 27 } 
	{ m_axis_video_TLAST sc_out sc_lv 1 signal 28 } 
	{ m_axis_video_TID sc_out sc_lv 1 signal 29 } 
	{ m_axis_video_TDEST sc_out sc_lv 1 signal 30 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ s_axis_video_TVALID sc_in sc_logic 1 invld 23 } 
	{ s_axis_video_TREADY sc_out sc_logic 1 inacc 23 } 
	{ HwReg_height_val_ap_vld sc_in sc_logic 1 invld 1 } 
	{ HwReg_width_val_ap_vld sc_in sc_logic 1 invld 0 } 
	{ HwReg_layerEnableFlag_0_val_ap_vld sc_in sc_logic 1 invld 8 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ HwReg_layerWidth_1_val_ap_vld sc_in sc_logic 1 invld 13 } 
	{ HwReg_layer1_buf1_ap_vld sc_in sc_logic 1 invld 7 } 
	{ HwReg_layerHeight_1_val_ap_vld sc_in sc_logic 1 invld 14 } 
	{ HwReg_layerStride_1_val_ap_vld sc_in sc_logic 1 invld 16 } 
	{ HwReg_layerEnableFlag_1_val_ap_vld sc_in sc_logic 1 invld 9 } 
	{ HwReg_background_Y_R_val10_ap_vld sc_in sc_logic 1 invld 2 } 
	{ HwReg_background_U_G_val11_ap_vld sc_in sc_logic 1 invld 3 } 
	{ HwReg_background_V_B_val12_ap_vld sc_in sc_logic 1 invld 4 } 
	{ HwReg_layerEnable_val13_ap_vld sc_in sc_logic 1 invld 5 } 
	{ HwReg_layerAlpha_1_val14_ap_vld sc_in sc_logic 1 invld 10 } 
	{ HwReg_layerStartX_1_val15_ap_vld sc_in sc_logic 1 invld 11 } 
	{ HwReg_layerStartY_1_val16_ap_vld sc_in sc_logic 1 invld 12 } 
	{ HwReg_layerScaleFactor_1_val19_ap_vld sc_in sc_logic 1 invld 15 } 
	{ m_axis_video_TVALID sc_out sc_logic 1 outvld 30 } 
	{ m_axis_video_TREADY sc_in sc_logic 1 outacc 30 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "HwReg_width_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "HwReg_width_val", "role": "default" }} , 
 	{ "name": "HwReg_height_val", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "HwReg_height_val", "role": "default" }} , 
 	{ "name": "HwReg_background_Y_R_val10", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "HwReg_background_Y_R_val10", "role": "default" }} , 
 	{ "name": "HwReg_background_U_G_val11", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "HwReg_background_U_G_val11", "role": "default" }} , 
 	{ "name": "HwReg_background_V_B_val12", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "HwReg_background_V_B_val12", "role": "default" }} , 
 	{ "name": "HwReg_layerEnable_val13", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "HwReg_layerEnable_val13", "role": "default" }} , 
 	{ "name": "m_axi_mm_video1_0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWVALID" }} , 
 	{ "name": "m_axi_mm_video1_0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWREADY" }} , 
 	{ "name": "m_axi_mm_video1_0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWADDR" }} , 
 	{ "name": "m_axi_mm_video1_0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWID" }} , 
 	{ "name": "m_axi_mm_video1_0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWLEN" }} , 
 	{ "name": "m_axi_mm_video1_0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWSIZE" }} , 
 	{ "name": "m_axi_mm_video1_0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWBURST" }} , 
 	{ "name": "m_axi_mm_video1_0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWLOCK" }} , 
 	{ "name": "m_axi_mm_video1_0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWCACHE" }} , 
 	{ "name": "m_axi_mm_video1_0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWPROT" }} , 
 	{ "name": "m_axi_mm_video1_0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWQOS" }} , 
 	{ "name": "m_axi_mm_video1_0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWREGION" }} , 
 	{ "name": "m_axi_mm_video1_0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_AWUSER" }} , 
 	{ "name": "m_axi_mm_video1_0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_WVALID" }} , 
 	{ "name": "m_axi_mm_video1_0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_WREADY" }} , 
 	{ "name": "m_axi_mm_video1_0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_WDATA" }} , 
 	{ "name": "m_axi_mm_video1_0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_WSTRB" }} , 
 	{ "name": "m_axi_mm_video1_0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_WLAST" }} , 
 	{ "name": "m_axi_mm_video1_0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_WID" }} , 
 	{ "name": "m_axi_mm_video1_0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_WUSER" }} , 
 	{ "name": "m_axi_mm_video1_0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARVALID" }} , 
 	{ "name": "m_axi_mm_video1_0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARREADY" }} , 
 	{ "name": "m_axi_mm_video1_0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARADDR" }} , 
 	{ "name": "m_axi_mm_video1_0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARID" }} , 
 	{ "name": "m_axi_mm_video1_0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARLEN" }} , 
 	{ "name": "m_axi_mm_video1_0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARSIZE" }} , 
 	{ "name": "m_axi_mm_video1_0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARBURST" }} , 
 	{ "name": "m_axi_mm_video1_0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARLOCK" }} , 
 	{ "name": "m_axi_mm_video1_0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARCACHE" }} , 
 	{ "name": "m_axi_mm_video1_0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARPROT" }} , 
 	{ "name": "m_axi_mm_video1_0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARQOS" }} , 
 	{ "name": "m_axi_mm_video1_0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARREGION" }} , 
 	{ "name": "m_axi_mm_video1_0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_ARUSER" }} , 
 	{ "name": "m_axi_mm_video1_0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_RVALID" }} , 
 	{ "name": "m_axi_mm_video1_0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_RREADY" }} , 
 	{ "name": "m_axi_mm_video1_0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_RDATA" }} , 
 	{ "name": "m_axi_mm_video1_0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_RLAST" }} , 
 	{ "name": "m_axi_mm_video1_0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_RID" }} , 
 	{ "name": "m_axi_mm_video1_0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_RFIFONUM" }} , 
 	{ "name": "m_axi_mm_video1_0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_RUSER" }} , 
 	{ "name": "m_axi_mm_video1_0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_RRESP" }} , 
 	{ "name": "m_axi_mm_video1_0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_BVALID" }} , 
 	{ "name": "m_axi_mm_video1_0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_BREADY" }} , 
 	{ "name": "m_axi_mm_video1_0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_BRESP" }} , 
 	{ "name": "m_axi_mm_video1_0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_BID" }} , 
 	{ "name": "m_axi_mm_video1_0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "0_BUSER" }} , 
 	{ "name": "HwReg_layer1_buf1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "HwReg_layer1_buf1", "role": "default" }} , 
 	{ "name": "HwReg_layerEnableFlag_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "HwReg_layerEnableFlag_0_val", "role": "default" }} , 
 	{ "name": "HwReg_layerEnableFlag_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "HwReg_layerEnableFlag_1_val", "role": "default" }} , 
 	{ "name": "HwReg_layerAlpha_1_val14", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "HwReg_layerAlpha_1_val14", "role": "default" }} , 
 	{ "name": "HwReg_layerStartX_1_val15", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "HwReg_layerStartX_1_val15", "role": "default" }} , 
 	{ "name": "HwReg_layerStartY_1_val16", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "HwReg_layerStartY_1_val16", "role": "default" }} , 
 	{ "name": "HwReg_layerWidth_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "HwReg_layerWidth_1_val", "role": "default" }} , 
 	{ "name": "HwReg_layerHeight_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "HwReg_layerHeight_1_val", "role": "default" }} , 
 	{ "name": "HwReg_layerScaleFactor_1_val19", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "HwReg_layerScaleFactor_1_val19", "role": "default" }} , 
 	{ "name": "HwReg_layerStride_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "HwReg_layerStride_1_val", "role": "default" }} , 
 	{ "name": "s_axis_video_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "s_axis_video_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "s_axis_video_V_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "s_axis_video_V_strb_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_user_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_id_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "m_axis_video_V_data_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_axis_video_V_keep_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_axis_video_V_strb_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_video_V_user_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_video_V_last_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_video_V_id_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "s_axis_video_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "HwReg_height_val_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_height_val", "role": "ap_vld" }} , 
 	{ "name": "HwReg_width_val_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_width_val", "role": "ap_vld" }} , 
 	{ "name": "HwReg_layerEnableFlag_0_val_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_layerEnableFlag_0_val", "role": "ap_vld" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "HwReg_layerWidth_1_val_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_layerWidth_1_val", "role": "ap_vld" }} , 
 	{ "name": "HwReg_layer1_buf1_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_layer1_buf1", "role": "ap_vld" }} , 
 	{ "name": "HwReg_layerHeight_1_val_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_layerHeight_1_val", "role": "ap_vld" }} , 
 	{ "name": "HwReg_layerStride_1_val_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_layerStride_1_val", "role": "ap_vld" }} , 
 	{ "name": "HwReg_layerEnableFlag_1_val_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_layerEnableFlag_1_val", "role": "ap_vld" }} , 
 	{ "name": "HwReg_background_Y_R_val10_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_background_Y_R_val10", "role": "ap_vld" }} , 
 	{ "name": "HwReg_background_U_G_val11_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_background_U_G_val11", "role": "ap_vld" }} , 
 	{ "name": "HwReg_background_V_B_val12_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_background_V_B_val12", "role": "ap_vld" }} , 
 	{ "name": "HwReg_layerEnable_val13_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_layerEnable_val13", "role": "ap_vld" }} , 
 	{ "name": "HwReg_layerAlpha_1_val14_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_layerAlpha_1_val14", "role": "ap_vld" }} , 
 	{ "name": "HwReg_layerStartX_1_val15_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_layerStartX_1_val15", "role": "ap_vld" }} , 
 	{ "name": "HwReg_layerStartY_1_val16_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_layerStartY_1_val16", "role": "ap_vld" }} , 
 	{ "name": "HwReg_layerScaleFactor_1_val19_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "HwReg_layerScaleFactor_1_val19", "role": "ap_vld" }} , 
 	{ "name": "m_axis_video_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	VMixHlsDataFlowFunction {
		HwReg_width_val {Type I LastRead 0 FirstWrite -1}
		HwReg_height_val {Type I LastRead 0 FirstWrite -1}
		HwReg_background_Y_R_val10 {Type I LastRead 12 FirstWrite -1}
		HwReg_background_U_G_val11 {Type I LastRead 12 FirstWrite -1}
		HwReg_background_V_B_val12 {Type I LastRead 12 FirstWrite -1}
		HwReg_layerEnable_val13 {Type I LastRead 12 FirstWrite -1}
		mm_video1 {Type I LastRead 2 FirstWrite -1}
		HwReg_layer1_buf1 {Type I LastRead 0 FirstWrite -1}
		HwReg_layerEnableFlag_0_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerEnableFlag_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerAlpha_1_val14 {Type I LastRead 12 FirstWrite -1}
		HwReg_layerStartX_1_val15 {Type I LastRead 12 FirstWrite -1}
		HwReg_layerStartY_1_val16 {Type I LastRead 12 FirstWrite -1}
		HwReg_layerWidth_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerHeight_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerScaleFactor_1_val19 {Type I LastRead 12 FirstWrite -1}
		HwReg_layerStride_1_val {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_dest_V {Type I LastRead 1 FirstWrite -1}
		m_axis_video_V_data_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_keep_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_strb_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_user_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_last_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_id_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_dest_V {Type O LastRead -1 FirstWrite 1}}
	AXIvideo2MultiPixStream {
		s_axis_video_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_dest_V {Type I LastRead 1 FirstWrite -1}
		srcLayer0 {Type O LastRead -1 FirstWrite 2}
		Height {Type I LastRead 0 FirstWrite -1}
		WidthIn {Type I LastRead 0 FirstWrite -1}
		layerEnableFlag {Type I LastRead 1 FirstWrite -1}}
	AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start {
		s_axis_video_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_dest_V {Type I LastRead 0 FirstWrite -1}
		axi_last_out {Type O LastRead -1 FirstWrite 0}
		axi_data_promoted324_out {Type O LastRead -1 FirstWrite 0}}
	AXIvideo2MultiPixStream_Pipeline_loop_width {
		p_4_0_0_0152318_lcssa343 {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0144311_lcssa327 {Type I LastRead 0 FirstWrite -1}
		sof_3 {Type I LastRead 0 FirstWrite -1}
		cols {Type I LastRead 0 FirstWrite -1}
		srcLayer0 {Type O LastRead -1 FirstWrite 2}
		s_axis_video_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_dest_V {Type I LastRead 1 FirstWrite -1}
		p_4_0_0_0152319_out {Type O LastRead -1 FirstWrite 1}
		p_0_0_0_0144310_out {Type O LastRead -1 FirstWrite 1}}
	AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol {
		p_4_0_0_0152319_reload {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0144310_reload {Type I LastRead 0 FirstWrite -1}
		and_ln3820 {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_user_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_id_V {Type I LastRead 0 FirstWrite -1}
		s_axis_video_V_dest_V {Type I LastRead 0 FirstWrite -1}
		p_4_0_0_0152318_lcssa341_out {Type O LastRead -1 FirstWrite 0}
		p_0_0_0_0144311_lcssa325_out {Type O LastRead -1 FirstWrite 0}}
	reg_unsigned_short_1 {
		d {Type I LastRead 1 FirstWrite -1}}
	reg_unsigned_short_1 {
		d {Type I LastRead 1 FirstWrite -1}}
	v_mix_420_to_422_false_1 {
		srcLayer0 {Type I LastRead 1 FirstWrite -1}
		height {Type I LastRead 0 FirstWrite -1}
		width {Type I LastRead 0 FirstWrite -1}
		layerEnableFlag {Type I LastRead 0 FirstWrite -1}
		srcLayer0Yuv422 {Type O LastRead -1 FirstWrite 1}}
	v_mix_420_to_422_false_1_Pipeline_VITIS_LOOP_76_2 {
		width {Type I LastRead 0 FirstWrite -1}
		srcLayer0 {Type I LastRead 1 FirstWrite -1}
		srcLayer0Yuv422 {Type O LastRead -1 FirstWrite 1}}
	v_mix_422_to_444_false_2 {
		srcLayer0Yuv422 {Type I LastRead 1 FirstWrite -1}
		height {Type I LastRead 0 FirstWrite -1}
		width {Type I LastRead 0 FirstWrite -1}
		layerEnableFlag {Type I LastRead 0 FirstWrite -1}
		srcLayer0Yuv {Type O LastRead -1 FirstWrite 1}}
	v_mix_422_to_444_false_2_Pipeline_VITIS_LOOP_105_2 {
		width {Type I LastRead 0 FirstWrite -1}
		srcLayer0Yuv422 {Type I LastRead 1 FirstWrite -1}
		srcLayer0Yuv {Type O LastRead -1 FirstWrite 1}}
	v_mix_yuv2rgb_false_3 {
		srcLayer0Yuv {Type I LastRead 1 FirstWrite -1}
		height {Type I LastRead 0 FirstWrite -1}
		width {Type I LastRead 0 FirstWrite -1}
		layerEnableFlag {Type I LastRead 0 FirstWrite -1}
		outLayer0 {Type O LastRead -1 FirstWrite 1}}
	v_mix_yuv2rgb_false_3_Pipeline_VITIS_LOOP_897_2 {
		width {Type I LastRead 0 FirstWrite -1}
		srcLayer0Yuv {Type I LastRead 1 FirstWrite -1}
		outLayer0 {Type O LastRead -1 FirstWrite 1}}
	AXIMMvideo2Bytes_1_s {
		HwReg_layerWidth_1_val {Type I LastRead 0 FirstWrite -1}
		mm_video1 {Type I LastRead 2 FirstWrite -1}
		HwReg_layer1_buf1 {Type I LastRead 0 FirstWrite -1}
		bytesLayer1_plane0 {Type O LastRead -1 FirstWrite 2}
		HwReg_layerHeight_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerStride_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerEnableFlag_1_val {Type I LastRead 0 FirstWrite -1}}
	AXIMMvideo2Bytes_1_Pipeline_VITIS_LOOP_203_2 {
		loopWidth_i {Type I LastRead 0 FirstWrite -1}
		mm_video1 {Type I LastRead 1 FirstWrite -1}
		sext_ln203_i {Type I LastRead 0 FirstWrite -1}
		bytesLayer1_plane0 {Type O LastRead -1 FirstWrite 2}}
	Bytes2MultiPixStream_13_s {
		bytesLayer1_plane0 {Type I LastRead 1 FirstWrite -1}
		srcLayer1 {Type O LastRead -1 FirstWrite 2}
		srcLayer1Alpha {Type O LastRead -1 FirstWrite 2}
		Height {Type I LastRead 0 FirstWrite -1}
		Width {Type I LastRead 0 FirstWrite -1}
		enable {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_13_Pipeline_VITIS_LOOP_1383_2 {
		Width {Type I LastRead 0 FirstWrite -1}
		srcLayer1 {Type O LastRead -1 FirstWrite 2}
		srcLayer1Alpha {Type O LastRead -1 FirstWrite 2}
		bytesLayer1_plane0 {Type I LastRead 1 FirstWrite -1}}
	v_mix_420_to_422_false_s {
		srcLayer1 {Type I LastRead 1 FirstWrite -1}
		HwReg_layerHeight_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerWidth_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerEnableFlag_1_val {Type I LastRead 0 FirstWrite -1}
		srcLayer1Yuv422 {Type O LastRead -1 FirstWrite 1}}
	v_mix_420_to_422_false_Pipeline_VITIS_LOOP_76_2 {
		empty {Type I LastRead 0 FirstWrite -1}
		srcLayer1 {Type I LastRead 1 FirstWrite -1}
		srcLayer1Yuv422 {Type O LastRead -1 FirstWrite 1}}
	v_mix_422_to_444_false_s {
		srcLayer1Yuv422 {Type I LastRead 1 FirstWrite -1}
		HwReg_layerHeight_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerWidth_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerEnableFlag_1_val {Type I LastRead 0 FirstWrite -1}
		srcLayer1Yuv {Type O LastRead -1 FirstWrite 1}}
	v_mix_422_to_444_false_Pipeline_VITIS_LOOP_105_2 {
		empty {Type I LastRead 0 FirstWrite -1}
		srcLayer1Yuv422 {Type I LastRead 1 FirstWrite -1}
		srcLayer1Yuv {Type O LastRead -1 FirstWrite 1}}
	v_mix_yuv2rgb_false_s {
		srcLayer1Yuv {Type I LastRead 1 FirstWrite -1}
		HwReg_layerHeight_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerWidth_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerEnableFlag_1_val {Type I LastRead 0 FirstWrite -1}
		srcLayer1Rgb {Type O LastRead -1 FirstWrite 1}}
	v_mix_yuv2rgb_false_Pipeline_VITIS_LOOP_897_2 {
		empty {Type I LastRead 0 FirstWrite -1}
		srcLayer1Yuv {Type I LastRead 1 FirstWrite -1}
		srcLayer1Rgb {Type O LastRead -1 FirstWrite 1}}
	v_mix_upsample_false_s {
		srcLayer1Rgb {Type I LastRead 1 FirstWrite -1}
		HwReg_layerHeight_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerWidth_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerEnableFlag_1_val {Type I LastRead 0 FirstWrite -1}
		srcLayer1x {Type O LastRead -1 FirstWrite 1}}
	v_mix_upsample_false_Pipeline_VITIS_LOOP_107_2 {
		empty {Type I LastRead 0 FirstWrite -1}
		srcLayer1Rgb {Type I LastRead 1 FirstWrite -1}
		srcLayer1x {Type O LastRead -1 FirstWrite 1}}
	v_mix_upsample_alpha_false_s {
		srcLayer1Alpha {Type I LastRead 1 FirstWrite -1}
		HwReg_layerHeight_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerWidth_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerEnableFlag_1_val {Type I LastRead 0 FirstWrite -1}
		srcLayer1Alphax {Type O LastRead -1 FirstWrite 1}}
	v_mix_upsample_alpha_false_Pipeline_VITIS_LOOP_203_2 {
		empty {Type I LastRead 0 FirstWrite -1}
		srcLayer1Alpha {Type I LastRead 1 FirstWrite -1}
		srcLayer1Alphax {Type O LastRead -1 FirstWrite 1}}
	v_mix_core_alpha_true_true_s {
		outLayer0 {Type I LastRead 2 FirstWrite -1}
		srcLayer1x {Type I LastRead 1 FirstWrite -1}
		srcLayer1Alphax {Type I LastRead 1 FirstWrite -1}
		hwReg_width_val {Type I LastRead 1 FirstWrite -1}
		hwReg_height_val {Type I LastRead 1 FirstWrite -1}
		hwReg_background_Y_R_val {Type I LastRead 1 FirstWrite -1}
		hwReg_background_U_G_val {Type I LastRead 1 FirstWrite -1}
		hwReg_background_V_B_val {Type I LastRead 1 FirstWrite -1}
		hwReg_layerEnable_val {Type I LastRead 1 FirstWrite -1}
		hwReg_layerAlpha_1_val {Type I LastRead 0 FirstWrite -1}
		hwReg_layerStartX_1_val {Type I LastRead 1 FirstWrite -1}
		hwReg_layerStartY_1_val {Type I LastRead 1 FirstWrite -1}
		hwReg_layerWidth_1_val {Type I LastRead 1 FirstWrite -1}
		hwReg_layerHeight_1_val {Type I LastRead 1 FirstWrite -1}
		hwReg_layerScaleFactor_1_val {Type I LastRead 1 FirstWrite -1}
		outLayer1 {Type O LastRead -1 FirstWrite 6}}
	v_mix_core_alpha_true_true_Pipeline_VITIS_LOOP_316_3 {
		hwReg_width_val {Type I LastRead 0 FirstWrite -1}
		zext_ln346 {Type I LastRead 0 FirstWrite -1}
		outLayer1 {Type O LastRead -1 FirstWrite 6}
		srcLayer1x {Type I LastRead 1 FirstWrite -1}
		srcLayer1Alphax {Type I LastRead 1 FirstWrite -1}
		hwReg_background_Y_R_val {Type I LastRead 0 FirstWrite -1}
		hwReg_background_U_G_val {Type I LastRead 0 FirstWrite -1}
		hwReg_background_V_B_val {Type I LastRead 0 FirstWrite -1}
		hwReg_layerStartX_1_val {Type I LastRead 0 FirstWrite -1}
		add_ln332 {Type I LastRead 0 FirstWrite -1}
		icmp_ln330_1 {Type I LastRead 0 FirstWrite -1}
		rev7 {Type I LastRead 0 FirstWrite -1}
		empty_61 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		outLayer0 {Type I LastRead 2 FirstWrite -1}
		p_out {Type IO LastRead 2 FirstWrite 1}
		p_out1 {Type IO LastRead 2 FirstWrite 1}
		p_out2 {Type IO LastRead 2 FirstWrite 1}}
	reg_unsigned_short_s {
		d {Type I LastRead 1 FirstWrite -1}}
	v_mix_rgb2yuv_false_s {
		outLayer1 {Type I LastRead 1 FirstWrite -1}
		height_val {Type I LastRead 0 FirstWrite -1}
		width_val {Type I LastRead 0 FirstWrite -1}
		outYuv {Type O LastRead -1 FirstWrite 1}}
	v_mix_rgb2yuv_false_Pipeline_VITIS_LOOP_1042_2 {
		width_val {Type I LastRead 0 FirstWrite -1}
		outLayer1 {Type I LastRead 1 FirstWrite -1}
		outYuv {Type O LastRead -1 FirstWrite 1}}
	v_mix_444_to_422_false_s {
		outYuv {Type I LastRead 1 FirstWrite -1}
		height_val {Type I LastRead 0 FirstWrite -1}
		width_val {Type I LastRead 0 FirstWrite -1}
		out422 {Type O LastRead -1 FirstWrite 1}}
	v_mix_444_to_422_false_Pipeline_VITIS_LOOP_718_2 {
		width_val {Type I LastRead 0 FirstWrite -1}
		outYuv {Type I LastRead 1 FirstWrite -1}
		out422 {Type O LastRead -1 FirstWrite 1}}
	v_mix_422_to_420_false_s {
		out422 {Type I LastRead 1 FirstWrite -1}
		height_val {Type I LastRead 0 FirstWrite -1}
		width_val {Type I LastRead 0 FirstWrite -1}
		out420 {Type O LastRead -1 FirstWrite 1}}
	v_mix_422_to_420_false_Pipeline_VITIS_LOOP_508_2 {
		width_val {Type I LastRead 0 FirstWrite -1}
		out422 {Type I LastRead 1 FirstWrite -1}
		out420 {Type O LastRead -1 FirstWrite 1}}
	MultiPixStream2AXIvideo {
		out420 {Type I LastRead 1 FirstWrite -1}
		m_axis_video_V_data_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_keep_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_strb_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_user_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_last_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_id_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_dest_V {Type O LastRead -1 FirstWrite 1}
		Height {Type I LastRead 0 FirstWrite -1}
		WidthOut {Type I LastRead 0 FirstWrite -1}}
	MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_3903_3 {
		sof {Type I LastRead 0 FirstWrite -1}
		cols {Type I LastRead 0 FirstWrite -1}
		add_ln3916 {Type I LastRead 0 FirstWrite -1}
		out420 {Type I LastRead 1 FirstWrite -1}
		m_axis_video_V_data_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_keep_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_strb_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_user_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_last_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_id_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_dest_V {Type O LastRead -1 FirstWrite 1}}
	reg_unsigned_short_1 {
		d {Type I LastRead 1 FirstWrite -1}}
	reg_unsigned_short_1 {
		d {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4856", "Max" : "141566511"}
	, {"Name" : "Interval", "Min" : "4739", "Max" : "141566402"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	HwReg_width_val { ap_none {  { HwReg_width_val in_data 0 11 }  { HwReg_width_val_ap_vld in_vld 0 1 } } }
	HwReg_height_val { ap_none {  { HwReg_height_val in_data 0 11 }  { HwReg_height_val_ap_vld in_vld 0 1 } } }
	HwReg_background_Y_R_val10 { ap_none {  { HwReg_background_Y_R_val10 in_data 0 8 }  { HwReg_background_Y_R_val10_ap_vld in_vld 0 1 } } }
	HwReg_background_U_G_val11 { ap_none {  { HwReg_background_U_G_val11 in_data 0 8 }  { HwReg_background_U_G_val11_ap_vld in_vld 0 1 } } }
	HwReg_background_V_B_val12 { ap_none {  { HwReg_background_V_B_val12 in_data 0 8 }  { HwReg_background_V_B_val12_ap_vld in_vld 0 1 } } }
	HwReg_layerEnable_val13 { ap_none {  { HwReg_layerEnable_val13 in_data 0 2 }  { HwReg_layerEnable_val13_ap_vld in_vld 0 1 } } }
	 { m_axi {  { m_axi_mm_video1_0_AWVALID VALID 1 1 }  { m_axi_mm_video1_0_AWREADY READY 0 1 }  { m_axi_mm_video1_0_AWADDR ADDR 1 32 }  { m_axi_mm_video1_0_AWID ID 1 1 }  { m_axi_mm_video1_0_AWLEN SIZE 1 32 }  { m_axi_mm_video1_0_AWSIZE BURST 1 3 }  { m_axi_mm_video1_0_AWBURST LOCK 1 2 }  { m_axi_mm_video1_0_AWLOCK CACHE 1 2 }  { m_axi_mm_video1_0_AWCACHE PROT 1 4 }  { m_axi_mm_video1_0_AWPROT QOS 1 3 }  { m_axi_mm_video1_0_AWQOS REGION 1 4 }  { m_axi_mm_video1_0_AWREGION USER 1 4 }  { m_axi_mm_video1_0_AWUSER DATA 1 1 }  { m_axi_mm_video1_0_WVALID VALID 1 1 }  { m_axi_mm_video1_0_WREADY READY 0 1 }  { m_axi_mm_video1_0_WDATA FIFONUM 1 64 }  { m_axi_mm_video1_0_WSTRB STRB 1 8 }  { m_axi_mm_video1_0_WLAST LAST 1 1 }  { m_axi_mm_video1_0_WID ID 1 1 }  { m_axi_mm_video1_0_WUSER DATA 1 1 }  { m_axi_mm_video1_0_ARVALID VALID 1 1 }  { m_axi_mm_video1_0_ARREADY READY 0 1 }  { m_axi_mm_video1_0_ARADDR ADDR 1 32 }  { m_axi_mm_video1_0_ARID ID 1 1 }  { m_axi_mm_video1_0_ARLEN SIZE 1 32 }  { m_axi_mm_video1_0_ARSIZE BURST 1 3 }  { m_axi_mm_video1_0_ARBURST LOCK 1 2 }  { m_axi_mm_video1_0_ARLOCK CACHE 1 2 }  { m_axi_mm_video1_0_ARCACHE PROT 1 4 }  { m_axi_mm_video1_0_ARPROT QOS 1 3 }  { m_axi_mm_video1_0_ARQOS REGION 1 4 }  { m_axi_mm_video1_0_ARREGION USER 1 4 }  { m_axi_mm_video1_0_ARUSER DATA 1 1 }  { m_axi_mm_video1_0_RVALID VALID 0 1 }  { m_axi_mm_video1_0_RREADY READY 1 1 }  { m_axi_mm_video1_0_RDATA FIFONUM 0 64 }  { m_axi_mm_video1_0_RLAST LAST 0 1 }  { m_axi_mm_video1_0_RID ID 0 1 }  { m_axi_mm_video1_0_RFIFONUM LEN 0 7 }  { m_axi_mm_video1_0_RUSER DATA 0 1 }  { m_axi_mm_video1_0_RRESP RESP 0 2 }  { m_axi_mm_video1_0_BVALID VALID 0 1 }  { m_axi_mm_video1_0_BREADY READY 1 1 }  { m_axi_mm_video1_0_BRESP RESP 0 2 }  { m_axi_mm_video1_0_BID ID 0 1 }  { m_axi_mm_video1_0_BUSER DATA 0 1 } } }
	HwReg_layer1_buf1 { ap_none {  { HwReg_layer1_buf1 in_data 0 32 }  { HwReg_layer1_buf1_ap_vld in_vld 0 1 } } }
	HwReg_layerEnableFlag_0_val { ap_none {  { HwReg_layerEnableFlag_0_val in_data 0 1 }  { HwReg_layerEnableFlag_0_val_ap_vld in_vld 0 1 } } }
	HwReg_layerEnableFlag_1_val { ap_none {  { HwReg_layerEnableFlag_1_val in_data 0 1 }  { HwReg_layerEnableFlag_1_val_ap_vld in_vld 0 1 } } }
	HwReg_layerAlpha_1_val14 { ap_none {  { HwReg_layerAlpha_1_val14 in_data 0 9 }  { HwReg_layerAlpha_1_val14_ap_vld in_vld 0 1 } } }
	HwReg_layerStartX_1_val15 { ap_none {  { HwReg_layerStartX_1_val15 in_data 0 16 }  { HwReg_layerStartX_1_val15_ap_vld in_vld 0 1 } } }
	HwReg_layerStartY_1_val16 { ap_none {  { HwReg_layerStartY_1_val16 in_data 0 16 }  { HwReg_layerStartY_1_val16_ap_vld in_vld 0 1 } } }
	HwReg_layerWidth_1_val { ap_none {  { HwReg_layerWidth_1_val in_data 0 16 }  { HwReg_layerWidth_1_val_ap_vld in_vld 0 1 } } }
	HwReg_layerHeight_1_val { ap_none {  { HwReg_layerHeight_1_val in_data 0 16 }  { HwReg_layerHeight_1_val_ap_vld in_vld 0 1 } } }
	HwReg_layerScaleFactor_1_val19 { ap_none {  { HwReg_layerScaleFactor_1_val19 in_data 0 8 }  { HwReg_layerScaleFactor_1_val19_ap_vld in_vld 0 1 } } }
	HwReg_layerStride_1_val { ap_none {  { HwReg_layerStride_1_val in_data 0 16 }  { HwReg_layerStride_1_val_ap_vld in_vld 0 1 } } }
	s_axis_video_V_data_V { axis {  { s_axis_video_TDATA in_data 0 24 } } }
	s_axis_video_V_keep_V { axis {  { s_axis_video_TKEEP in_data 0 3 } } }
	s_axis_video_V_strb_V { axis {  { s_axis_video_TSTRB in_data 0 3 } } }
	s_axis_video_V_user_V { axis {  { s_axis_video_TUSER in_data 0 1 } } }
	s_axis_video_V_last_V { axis {  { s_axis_video_TLAST in_data 0 1 } } }
	s_axis_video_V_id_V { axis {  { s_axis_video_TID in_data 0 1 } } }
	s_axis_video_V_dest_V { axis {  { s_axis_video_TDEST in_data 0 1 }  { s_axis_video_TVALID in_vld 0 1 }  { s_axis_video_TREADY in_acc 1 1 } } }
	m_axis_video_V_data_V { axis {  { m_axis_video_TDATA out_data 1 24 } } }
	m_axis_video_V_keep_V { axis {  { m_axis_video_TKEEP out_data 1 3 } } }
	m_axis_video_V_strb_V { axis {  { m_axis_video_TSTRB out_data 1 3 } } }
	m_axis_video_V_user_V { axis {  { m_axis_video_TUSER out_data 1 1 } } }
	m_axis_video_V_last_V { axis {  { m_axis_video_TLAST out_data 1 1 } } }
	m_axis_video_V_id_V { axis {  { m_axis_video_TID out_data 1 1 } } }
	m_axis_video_V_dest_V { axis {  { m_axis_video_TDEST out_data 1 1 }  { m_axis_video_TVALID out_vld 1 1 }  { m_axis_video_TREADY out_acc 0 1 } } }
}
