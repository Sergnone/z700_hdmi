set moduleName v_mix
set isTopModule 1
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
set C_modelName {v_mix}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict layerVideoFormat { MEM_WIDTH 8 MEM_SIZE 2 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ mm_video1 int 64 regular {axi_master 0}  }
	{ s_axis_video_V_data_V int 24 regular {axi_s 0 volatile  { s_axis_video Data } }  }
	{ s_axis_video_V_keep_V int 3 regular {axi_s 0 volatile  { s_axis_video Keep } }  }
	{ s_axis_video_V_strb_V int 3 regular {axi_s 0 volatile  { s_axis_video Strb } }  }
	{ s_axis_video_V_user_V int 1 regular {axi_s 0 volatile  { s_axis_video User } }  }
	{ s_axis_video_V_last_V int 1 regular {axi_s 0 volatile  { s_axis_video Last } }  }
	{ s_axis_video_V_id_V int 1 regular {axi_s 0 volatile  { s_axis_video ID } }  }
	{ s_axis_video_V_dest_V int 1 regular {axi_s 0 volatile  { s_axis_video Dest } }  }
	{ width uint 16 regular {axi_slave 0 stable }  }
	{ height uint 16 regular {axi_slave 0 stable }  }
	{ video_format uint 16 unused {axi_slave 0 stable }  }
	{ background_Y_R uint 16 regular {axi_slave 0 stable }  }
	{ background_U_G uint 16 regular {axi_slave 0 stable }  }
	{ background_V_B uint 16 regular {axi_slave 0 stable }  }
	{ layerEnable int 32 regular {axi_slave 0}  }
	{ layer1_buf1 int 32 regular {axi_slave 0}  }
	{ layer1_buf2 int 32 unused {axi_slave 0}  }
	{ layer1_buf3 int 32 unused {axi_slave 0}  }
	{ layerAlpha_0 int 16 regular {pointer 0 stable }  }
	{ layerAlpha_1 int 16 regular {axi_slave 0 stable }  }
	{ layerStartX_0 int 16 regular {pointer 0}  }
	{ layerStartX_1 int 16 regular {axi_slave 0}  }
	{ layerStartY_0 int 16 regular {pointer 0}  }
	{ layerStartY_1 int 16 regular {axi_slave 0}  }
	{ layerWidth_0 int 16 regular {pointer 0 stable }  }
	{ layerWidth_1 int 16 regular {axi_slave 0 stable }  }
	{ layerHeight_0 int 16 regular {pointer 0 stable }  }
	{ layerHeight_1 int 16 regular {axi_slave 0 stable }  }
	{ layerScaleFactor_0 int 8 regular {pointer 0 stable }  }
	{ layerScaleFactor_1 int 8 regular {axi_slave 0 stable }  }
	{ layerVideoFormat int 8 unused {array 2 { } 0 1 }  }
	{ layerStride_0 int 16 regular {pointer 0 stable }  }
	{ layerStride_1 int 16 regular {axi_slave 0 stable }  }
	{ reserve uint 16 unused {axi_slave 0}  }
	{ K11 int 32 unused  }
	{ K12 int 32 unused  }
	{ K13 int 32 unused  }
	{ K21 int 32 unused  }
	{ K22 int 32 unused  }
	{ K23 int 32 unused  }
	{ K31 int 32 unused  }
	{ K32 int 32 unused  }
	{ K33 int 32 unused  }
	{ ROffset int 32 unused  }
	{ GOffset int 32 unused  }
	{ BOffset int 32 unused  }
	{ K11_2 int 32 unused  }
	{ K12_2 int 32 unused  }
	{ K13_2 int 32 unused  }
	{ K21_2 int 32 unused  }
	{ K22_2 int 32 unused  }
	{ K23_2 int 32 unused  }
	{ K31_2 int 32 unused  }
	{ K32_2 int 32 unused  }
	{ K33_2 int 32 unused  }
	{ YOffset int 32 unused  }
	{ UOffset int 32 unused  }
	{ VOffset int 32 unused  }
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
	{ "Name" : "mm_video1", "interface" : "axi_master", "bitwidth" : 64, "direction" : "READONLY", "id_num" : 1, "bitSlice":[ {"cElement": [{"cName": "layer1_buf1","offset": { "type": "dynamic","port_name": "layer1_buf1","bundle": "CTRL"},"direction": "READONLY"},{"cName": "layer1_buf2","offset": { "type": "dynamic","port_name": "layer1_buf2","bundle": "CTRL"}},{"cName": "layer1_buf3","offset": { "type": "dynamic","port_name": "layer1_buf3","bundle": "CTRL"}}]}]} , 
 	{ "Name" : "s_axis_video_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "width", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "height", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "video_format", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "background_Y_R", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "background_U_G", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "background_V_B", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":56}, "offset_end" : {"in":63}} , 
 	{ "Name" : "layerEnable", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":64}, "offset_end" : {"in":71}} , 
 	{ "Name" : "layer1_buf1", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":576}, "offset_end" : {"in":583}} , 
 	{ "Name" : "layer1_buf2", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":588}, "offset_end" : {"in":595}} , 
 	{ "Name" : "layer1_buf3", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":600}, "offset_end" : {"in":607}} , 
 	{ "Name" : "layerAlpha_0", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "layerAlpha_1", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":512}, "offset_end" : {"in":519}} , 
 	{ "Name" : "layerStartX_0", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "layerStartX_1", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":520}, "offset_end" : {"in":527}} , 
 	{ "Name" : "layerStartY_0", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "layerStartY_1", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":528}, "offset_end" : {"in":535}} , 
 	{ "Name" : "layerWidth_0", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "layerWidth_1", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":536}, "offset_end" : {"in":543}} , 
 	{ "Name" : "layerHeight_0", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "layerHeight_1", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":552}, "offset_end" : {"in":559}} , 
 	{ "Name" : "layerScaleFactor_0", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "layerScaleFactor_1", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":560}, "offset_end" : {"in":567}} , 
 	{ "Name" : "layerVideoFormat", "interface" : "memory", "bitwidth" : 8, "direction" : "NONE"} , 
 	{ "Name" : "layerStride_0", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "layerStride_1", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":544}, "offset_end" : {"in":551}} , 
 	{ "Name" : "reserve", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":4080}, "offset_end" : {"in":4087}} , 
 	{ "Name" : "K11", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K12", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K13", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K21", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K22", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K23", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K31", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K32", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K33", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ROffset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "GOffset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "BOffset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K11_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K12_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K13_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K21_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K22_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K23_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K31_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K32_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "K33_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "YOffset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "UOffset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "VOffset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_video_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 124
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_mm_video1_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mm_video1_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mm_video1_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_mm_video1_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mm_video1_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_mm_video1_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_mm_video1_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_mm_video1_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_mm_video1_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_mm_video1_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_mm_video1_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_mm_video1_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_mm_video1_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mm_video1_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mm_video1_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mm_video1_WDATA sc_out sc_lv 64 signal 0 } 
	{ m_axi_mm_video1_WSTRB sc_out sc_lv 8 signal 0 } 
	{ m_axi_mm_video1_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_mm_video1_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mm_video1_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mm_video1_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mm_video1_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mm_video1_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_mm_video1_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mm_video1_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_mm_video1_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_mm_video1_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_mm_video1_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_mm_video1_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_mm_video1_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_mm_video1_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_mm_video1_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_mm_video1_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mm_video1_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_mm_video1_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_mm_video1_RDATA sc_in sc_lv 64 signal 0 } 
	{ m_axi_mm_video1_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_mm_video1_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_mm_video1_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_mm_video1_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_mm_video1_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_mm_video1_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_mm_video1_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_mm_video1_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_mm_video1_BUSER sc_in sc_lv 1 signal 0 } 
	{ s_axis_video_TDATA sc_in sc_lv 24 signal 1 } 
	{ s_axis_video_TVALID sc_in sc_logic 1 invld 7 } 
	{ s_axis_video_TREADY sc_out sc_logic 1 inacc 7 } 
	{ s_axis_video_TKEEP sc_in sc_lv 3 signal 2 } 
	{ s_axis_video_TSTRB sc_in sc_lv 3 signal 3 } 
	{ s_axis_video_TUSER sc_in sc_lv 1 signal 4 } 
	{ s_axis_video_TLAST sc_in sc_lv 1 signal 5 } 
	{ s_axis_video_TID sc_in sc_lv 1 signal 6 } 
	{ s_axis_video_TDEST sc_in sc_lv 1 signal 7 } 
	{ layerAlpha_0 sc_in sc_lv 16 signal 18 } 
	{ layerStartX_0 sc_in sc_lv 16 signal 20 } 
	{ layerStartY_0 sc_in sc_lv 16 signal 22 } 
	{ layerWidth_0 sc_in sc_lv 16 signal 24 } 
	{ layerHeight_0 sc_in sc_lv 16 signal 26 } 
	{ layerScaleFactor_0 sc_in sc_lv 8 signal 28 } 
	{ layerVideoFormat_address0 sc_out sc_lv 1 signal 30 } 
	{ layerVideoFormat_ce0 sc_out sc_logic 1 signal 30 } 
	{ layerVideoFormat_we0 sc_out sc_logic 1 signal 30 } 
	{ layerVideoFormat_d0 sc_out sc_lv 8 signal 30 } 
	{ layerVideoFormat_q0 sc_in sc_lv 8 signal 30 } 
	{ layerVideoFormat_address1 sc_out sc_lv 1 signal 30 } 
	{ layerVideoFormat_ce1 sc_out sc_logic 1 signal 30 } 
	{ layerVideoFormat_we1 sc_out sc_logic 1 signal 30 } 
	{ layerVideoFormat_d1 sc_out sc_lv 8 signal 30 } 
	{ layerVideoFormat_q1 sc_in sc_lv 8 signal 30 } 
	{ layerStride_0 sc_in sc_lv 16 signal 31 } 
	{ K11 sc_in sc_lv 32 signal 34 } 
	{ K12 sc_in sc_lv 32 signal 35 } 
	{ K13 sc_in sc_lv 32 signal 36 } 
	{ K21 sc_in sc_lv 32 signal 37 } 
	{ K22 sc_in sc_lv 32 signal 38 } 
	{ K23 sc_in sc_lv 32 signal 39 } 
	{ K31 sc_in sc_lv 32 signal 40 } 
	{ K32 sc_in sc_lv 32 signal 41 } 
	{ K33 sc_in sc_lv 32 signal 42 } 
	{ ROffset sc_in sc_lv 32 signal 43 } 
	{ GOffset sc_in sc_lv 32 signal 44 } 
	{ BOffset sc_in sc_lv 32 signal 45 } 
	{ K11_2 sc_in sc_lv 32 signal 46 } 
	{ K12_2 sc_in sc_lv 32 signal 47 } 
	{ K13_2 sc_in sc_lv 32 signal 48 } 
	{ K21_2 sc_in sc_lv 32 signal 49 } 
	{ K22_2 sc_in sc_lv 32 signal 50 } 
	{ K23_2 sc_in sc_lv 32 signal 51 } 
	{ K31_2 sc_in sc_lv 32 signal 52 } 
	{ K32_2 sc_in sc_lv 32 signal 53 } 
	{ K33_2 sc_in sc_lv 32 signal 54 } 
	{ YOffset sc_in sc_lv 32 signal 55 } 
	{ UOffset sc_in sc_lv 32 signal 56 } 
	{ VOffset sc_in sc_lv 32 signal 57 } 
	{ m_axis_video_TDATA sc_out sc_lv 24 signal 58 } 
	{ m_axis_video_TVALID sc_out sc_logic 1 outvld 64 } 
	{ m_axis_video_TREADY sc_in sc_logic 1 outacc 64 } 
	{ m_axis_video_TKEEP sc_out sc_lv 3 signal 59 } 
	{ m_axis_video_TSTRB sc_out sc_lv 3 signal 60 } 
	{ m_axis_video_TUSER sc_out sc_lv 1 signal 61 } 
	{ m_axis_video_TLAST sc_out sc_lv 1 signal 62 } 
	{ m_axis_video_TID sc_out sc_lv 1 signal 63 } 
	{ m_axis_video_TDEST sc_out sc_lv 1 signal 64 } 
	{ s_axi_CTRL_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_AWADDR sc_in sc_lv 12 signal -1 } 
	{ s_axi_CTRL_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_CTRL_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_CTRL_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_ARADDR sc_in sc_lv 12 signal -1 } 
	{ s_axi_CTRL_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_CTRL_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_CTRL_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_CTRL_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "CTRL", "role": "AWADDR" },"address":[{"name":"v_mix","role":"start","value":"0","valid_bit":"0"},{"name":"v_mix","role":"continue","value":"0","valid_bit":"4"},{"name":"v_mix","role":"auto_start","value":"0","valid_bit":"7"},{"name":"width","role":"data","value":"16"},{"name":"height","role":"data","value":"24"},{"name":"video_format","role":"data","value":"32"},{"name":"background_Y_R","role":"data","value":"40"},{"name":"background_U_G","role":"data","value":"48"},{"name":"background_V_B","role":"data","value":"56"},{"name":"layerEnable","role":"data","value":"64"},{"name":"layerAlpha_1","role":"data","value":"512"},{"name":"layerStartX_1","role":"data","value":"520"},{"name":"layerStartY_1","role":"data","value":"528"},{"name":"layerWidth_1","role":"data","value":"536"},{"name":"layerStride_1","role":"data","value":"544"},{"name":"layerHeight_1","role":"data","value":"552"},{"name":"layerScaleFactor_1","role":"data","value":"560"},{"name":"layer1_buf1","role":"data","value":"576"},{"name":"layer1_buf2","role":"data","value":"588"},{"name":"layer1_buf3","role":"data","value":"600"},{"name":"reserve","role":"data","value":"4080"}] },
	{ "name": "s_axi_CTRL_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "AWVALID" } },
	{ "name": "s_axi_CTRL_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "AWREADY" } },
	{ "name": "s_axi_CTRL_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "WVALID" } },
	{ "name": "s_axi_CTRL_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "WREADY" } },
	{ "name": "s_axi_CTRL_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL", "role": "WDATA" } },
	{ "name": "s_axi_CTRL_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CTRL", "role": "WSTRB" } },
	{ "name": "s_axi_CTRL_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "CTRL", "role": "ARADDR" },"address":[{"name":"v_mix","role":"start","value":"0","valid_bit":"0"},{"name":"v_mix","role":"done","value":"0","valid_bit":"1"},{"name":"v_mix","role":"idle","value":"0","valid_bit":"2"},{"name":"v_mix","role":"ready","value":"0","valid_bit":"3"},{"name":"v_mix","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_CTRL_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "ARVALID" } },
	{ "name": "s_axi_CTRL_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "ARREADY" } },
	{ "name": "s_axi_CTRL_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "RVALID" } },
	{ "name": "s_axi_CTRL_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "RREADY" } },
	{ "name": "s_axi_CTRL_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL", "role": "RDATA" } },
	{ "name": "s_axi_CTRL_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CTRL", "role": "RRESP" } },
	{ "name": "s_axi_CTRL_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "BVALID" } },
	{ "name": "s_axi_CTRL_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "BREADY" } },
	{ "name": "s_axi_CTRL_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CTRL", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_mm_video1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_mm_video1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_mm_video1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_mm_video1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWID" }} , 
 	{ "name": "m_axi_mm_video1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_mm_video1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_mm_video1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_mm_video1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_mm_video1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_mm_video1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_mm_video1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_mm_video1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_mm_video1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_mm_video1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "WVALID" }} , 
 	{ "name": "m_axi_mm_video1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "WREADY" }} , 
 	{ "name": "m_axi_mm_video1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mm_video1", "role": "WDATA" }} , 
 	{ "name": "m_axi_mm_video1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mm_video1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_mm_video1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "WLAST" }} , 
 	{ "name": "m_axi_mm_video1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "WID" }} , 
 	{ "name": "m_axi_mm_video1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "WUSER" }} , 
 	{ "name": "m_axi_mm_video1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_mm_video1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_mm_video1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_mm_video1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARID" }} , 
 	{ "name": "m_axi_mm_video1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_mm_video1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_mm_video1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_mm_video1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_mm_video1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_mm_video1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_mm_video1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_mm_video1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_mm_video1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_mm_video1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "RVALID" }} , 
 	{ "name": "m_axi_mm_video1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "RREADY" }} , 
 	{ "name": "m_axi_mm_video1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mm_video1", "role": "RDATA" }} , 
 	{ "name": "m_axi_mm_video1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "RLAST" }} , 
 	{ "name": "m_axi_mm_video1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "RID" }} , 
 	{ "name": "m_axi_mm_video1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "RUSER" }} , 
 	{ "name": "m_axi_mm_video1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video1", "role": "RRESP" }} , 
 	{ "name": "m_axi_mm_video1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "BVALID" }} , 
 	{ "name": "m_axi_mm_video1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "BREADY" }} , 
 	{ "name": "m_axi_mm_video1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video1", "role": "BRESP" }} , 
 	{ "name": "m_axi_mm_video1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "BID" }} , 
 	{ "name": "m_axi_mm_video1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video1", "role": "BUSER" }} , 
 	{ "name": "s_axis_video_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "s_axis_video_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "s_axis_video_V_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "s_axis_video_V_strb_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_user_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_id_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "layerAlpha_0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layerAlpha_0", "role": "default" }} , 
 	{ "name": "layerStartX_0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layerStartX_0", "role": "default" }} , 
 	{ "name": "layerStartY_0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layerStartY_0", "role": "default" }} , 
 	{ "name": "layerWidth_0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layerWidth_0", "role": "default" }} , 
 	{ "name": "layerHeight_0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layerHeight_0", "role": "default" }} , 
 	{ "name": "layerScaleFactor_0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "layerScaleFactor_0", "role": "default" }} , 
 	{ "name": "layerVideoFormat_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "layerVideoFormat", "role": "address0" }} , 
 	{ "name": "layerVideoFormat_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layerVideoFormat", "role": "ce0" }} , 
 	{ "name": "layerVideoFormat_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layerVideoFormat", "role": "we0" }} , 
 	{ "name": "layerVideoFormat_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "layerVideoFormat", "role": "d0" }} , 
 	{ "name": "layerVideoFormat_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "layerVideoFormat", "role": "q0" }} , 
 	{ "name": "layerVideoFormat_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "layerVideoFormat", "role": "address1" }} , 
 	{ "name": "layerVideoFormat_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layerVideoFormat", "role": "ce1" }} , 
 	{ "name": "layerVideoFormat_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layerVideoFormat", "role": "we1" }} , 
 	{ "name": "layerVideoFormat_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "layerVideoFormat", "role": "d1" }} , 
 	{ "name": "layerVideoFormat_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "layerVideoFormat", "role": "q1" }} , 
 	{ "name": "layerStride_0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layerStride_0", "role": "default" }} , 
 	{ "name": "K11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K11", "role": "default" }} , 
 	{ "name": "K12", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K12", "role": "default" }} , 
 	{ "name": "K13", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K13", "role": "default" }} , 
 	{ "name": "K21", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K21", "role": "default" }} , 
 	{ "name": "K22", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K22", "role": "default" }} , 
 	{ "name": "K23", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K23", "role": "default" }} , 
 	{ "name": "K31", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K31", "role": "default" }} , 
 	{ "name": "K32", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K32", "role": "default" }} , 
 	{ "name": "K33", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K33", "role": "default" }} , 
 	{ "name": "ROffset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ROffset", "role": "default" }} , 
 	{ "name": "GOffset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "GOffset", "role": "default" }} , 
 	{ "name": "BOffset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BOffset", "role": "default" }} , 
 	{ "name": "K11_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K11_2", "role": "default" }} , 
 	{ "name": "K12_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K12_2", "role": "default" }} , 
 	{ "name": "K13_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K13_2", "role": "default" }} , 
 	{ "name": "K21_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K21_2", "role": "default" }} , 
 	{ "name": "K22_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K22_2", "role": "default" }} , 
 	{ "name": "K23_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K23_2", "role": "default" }} , 
 	{ "name": "K31_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K31_2", "role": "default" }} , 
 	{ "name": "K32_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K32_2", "role": "default" }} , 
 	{ "name": "K33_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "K33_2", "role": "default" }} , 
 	{ "name": "YOffset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "YOffset", "role": "default" }} , 
 	{ "name": "UOffset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "UOffset", "role": "default" }} , 
 	{ "name": "VOffset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "VOffset", "role": "default" }} , 
 	{ "name": "m_axis_video_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "m_axis_video_V_data_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_axis_video_V_keep_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_axis_video_V_strb_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_video_V_user_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_video_V_last_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_video_V_id_V", "role": "default" }} , 
 	{ "name": "m_axis_video_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_video_V_dest_V", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	v_mix {
		mm_video1 {Type I LastRead 2 FirstWrite -1}
		s_axis_video_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_dest_V {Type I LastRead 1 FirstWrite -1}
		width {Type I LastRead 0 FirstWrite -1}
		height {Type I LastRead 0 FirstWrite -1}
		video_format {Type I LastRead -1 FirstWrite -1}
		background_Y_R {Type I LastRead 0 FirstWrite -1}
		background_U_G {Type I LastRead 0 FirstWrite -1}
		background_V_B {Type I LastRead 0 FirstWrite -1}
		layerEnable {Type I LastRead 0 FirstWrite -1}
		layer1_buf1 {Type I LastRead 0 FirstWrite -1}
		layer1_buf2 {Type I LastRead -1 FirstWrite -1}
		layer1_buf3 {Type I LastRead -1 FirstWrite -1}
		layerAlpha_0 {Type I LastRead 0 FirstWrite -1}
		layerAlpha_1 {Type I LastRead 0 FirstWrite -1}
		layerStartX_0 {Type I LastRead 0 FirstWrite -1}
		layerStartX_1 {Type I LastRead 0 FirstWrite -1}
		layerStartY_0 {Type I LastRead 0 FirstWrite -1}
		layerStartY_1 {Type I LastRead 0 FirstWrite -1}
		layerWidth_0 {Type I LastRead 0 FirstWrite -1}
		layerWidth_1 {Type I LastRead 0 FirstWrite -1}
		layerHeight_0 {Type I LastRead 0 FirstWrite -1}
		layerHeight_1 {Type I LastRead 0 FirstWrite -1}
		layerScaleFactor_0 {Type I LastRead 0 FirstWrite -1}
		layerScaleFactor_1 {Type I LastRead 0 FirstWrite -1}
		layerVideoFormat {Type X LastRead -1 FirstWrite -1}
		layerStride_0 {Type I LastRead 0 FirstWrite -1}
		layerStride_1 {Type I LastRead 0 FirstWrite -1}
		reserve {Type I LastRead -1 FirstWrite -1}
		K11 {Type I LastRead -1 FirstWrite -1}
		K12 {Type I LastRead -1 FirstWrite -1}
		K13 {Type I LastRead -1 FirstWrite -1}
		K21 {Type I LastRead -1 FirstWrite -1}
		K22 {Type I LastRead -1 FirstWrite -1}
		K23 {Type I LastRead -1 FirstWrite -1}
		K31 {Type I LastRead -1 FirstWrite -1}
		K32 {Type I LastRead -1 FirstWrite -1}
		K33 {Type I LastRead -1 FirstWrite -1}
		ROffset {Type I LastRead -1 FirstWrite -1}
		GOffset {Type I LastRead -1 FirstWrite -1}
		BOffset {Type I LastRead -1 FirstWrite -1}
		K11_2 {Type I LastRead -1 FirstWrite -1}
		K12_2 {Type I LastRead -1 FirstWrite -1}
		K13_2 {Type I LastRead -1 FirstWrite -1}
		K21_2 {Type I LastRead -1 FirstWrite -1}
		K22_2 {Type I LastRead -1 FirstWrite -1}
		K23_2 {Type I LastRead -1 FirstWrite -1}
		K31_2 {Type I LastRead -1 FirstWrite -1}
		K32_2 {Type I LastRead -1 FirstWrite -1}
		K33_2 {Type I LastRead -1 FirstWrite -1}
		YOffset {Type I LastRead -1 FirstWrite -1}
		UOffset {Type I LastRead -1 FirstWrite -1}
		VOffset {Type I LastRead -1 FirstWrite -1}
		m_axis_video_V_data_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_keep_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_strb_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_user_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_last_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_id_V {Type O LastRead -1 FirstWrite 1}
		m_axis_video_V_dest_V {Type O LastRead -1 FirstWrite 1}}
	VMixHlsDataFlowFunction {
		HwReg_width_val {Type I LastRead 0 FirstWrite -1}
		HwReg_height_val {Type I LastRead 0 FirstWrite -1}
		HwReg_background_Y_R_val11 {Type I LastRead 12 FirstWrite -1}
		HwReg_background_U_G_val12 {Type I LastRead 12 FirstWrite -1}
		HwReg_background_V_B_val13 {Type I LastRead 12 FirstWrite -1}
		HwReg_layerEnable_val14 {Type I LastRead 12 FirstWrite -1}
		mm_video1 {Type I LastRead 2 FirstWrite -1}
		HwReg_layer1_buf1 {Type I LastRead 0 FirstWrite -1}
		HwReg_layerEnableFlag_0_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerEnableFlag_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerAlpha_1_val15 {Type I LastRead 12 FirstWrite -1}
		HwReg_layerStartX_1_val16 {Type I LastRead 12 FirstWrite -1}
		HwReg_layerStartY_1_val17 {Type I LastRead 12 FirstWrite -1}
		HwReg_layerWidth_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerHeight_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerScaleFactor_1_val21 {Type I LastRead 10 FirstWrite -1}
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
	Bytes2MultiPixStream_10_s {
		bytesLayer1_plane0 {Type I LastRead 1 FirstWrite -1}
		srcLayer1 {Type O LastRead -1 FirstWrite 2}
		Height {Type I LastRead 0 FirstWrite -1}
		Width {Type I LastRead 0 FirstWrite -1}
		enable {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_10_Pipeline_VITIS_LOOP_1104_2 {
		Width {Type I LastRead 0 FirstWrite -1}
		srcLayer1 {Type O LastRead -1 FirstWrite 2}
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
	v_mix_upsample_true_s {
		srcLayer1Rgb {Type I LastRead 1 FirstWrite -1}
		HwReg_layerHeight_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerWidth_1_val {Type I LastRead 0 FirstWrite -1}
		HwReg_layerEnableFlag_1_val {Type I LastRead 1 FirstWrite -1}
		HwReg_layerScaleFactor_1_val21 {Type I LastRead 0 FirstWrite -1}
		srcLayer1x {Type O LastRead -1 FirstWrite 3}}
	v_mix_upsample_true_Pipeline_VITIS_LOOP_140_2 {
		shl_ln140_i {Type I LastRead 0 FirstWrite -1}
		srcLayer1x {Type O LastRead -1 FirstWrite 3}
		srcLayer1Rgb {Type I LastRead 1 FirstWrite -1}
		zext_ln126_i {Type I LastRead 0 FirstWrite -1}
		add_ln138_i {Type I LastRead 0 FirstWrite -1}
		bReadLine_i {Type I LastRead 0 FirstWrite -1}}
	reg_ap_uint_8_s {
		d {Type I LastRead 0 FirstWrite -1}}
	reg_ap_uint_8_s {
		d {Type I LastRead 0 FirstWrite -1}}
	reg_ap_uint_8_s {
		d {Type I LastRead 0 FirstWrite -1}}
	v_mix_core_alpha_true_false_s {
		outLayer0 {Type I LastRead 1 FirstWrite -1}
		srcLayer1x {Type I LastRead 1 FirstWrite -1}
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
		outLayer1 {Type O LastRead -1 FirstWrite 5}}
	v_mix_core_alpha_true_false_Pipeline_VITIS_LOOP_395_3 {
		hwReg_width_val {Type I LastRead 0 FirstWrite -1}
		alpha {Type I LastRead 0 FirstWrite -1}
		outLayer1 {Type O LastRead -1 FirstWrite 5}
		srcLayer1x {Type I LastRead 1 FirstWrite -1}
		hwReg_background_Y_R_val {Type I LastRead 0 FirstWrite -1}
		hwReg_background_U_G_val {Type I LastRead 0 FirstWrite -1}
		hwReg_background_V_B_val {Type I LastRead 0 FirstWrite -1}
		hwReg_layerStartX_1_val {Type I LastRead 0 FirstWrite -1}
		add_ln409 {Type I LastRead 0 FirstWrite -1}
		icmp_ln407_1 {Type I LastRead 0 FirstWrite -1}
		rev7 {Type I LastRead 0 FirstWrite -1}
		empty_60 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		outLayer0 {Type I LastRead 1 FirstWrite -1}
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
	{"Name" : "Latency", "Min" : "4799", "Max" : "141566516"}
	, {"Name" : "Interval", "Min" : "4800", "Max" : "141566517"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	mm_video1 { m_axi {  { m_axi_mm_video1_AWVALID VALID 1 1 }  { m_axi_mm_video1_AWREADY READY 0 1 }  { m_axi_mm_video1_AWADDR ADDR 1 32 }  { m_axi_mm_video1_AWID ID 1 1 }  { m_axi_mm_video1_AWLEN SIZE 1 8 }  { m_axi_mm_video1_AWSIZE BURST 1 3 }  { m_axi_mm_video1_AWBURST LOCK 1 2 }  { m_axi_mm_video1_AWLOCK CACHE 1 2 }  { m_axi_mm_video1_AWCACHE PROT 1 4 }  { m_axi_mm_video1_AWPROT QOS 1 3 }  { m_axi_mm_video1_AWQOS REGION 1 4 }  { m_axi_mm_video1_AWREGION USER 1 4 }  { m_axi_mm_video1_AWUSER DATA 1 1 }  { m_axi_mm_video1_WVALID VALID 1 1 }  { m_axi_mm_video1_WREADY READY 0 1 }  { m_axi_mm_video1_WDATA FIFONUM 1 64 }  { m_axi_mm_video1_WSTRB STRB 1 8 }  { m_axi_mm_video1_WLAST LAST 1 1 }  { m_axi_mm_video1_WID ID 1 1 }  { m_axi_mm_video1_WUSER DATA 1 1 }  { m_axi_mm_video1_ARVALID VALID 1 1 }  { m_axi_mm_video1_ARREADY READY 0 1 }  { m_axi_mm_video1_ARADDR ADDR 1 32 }  { m_axi_mm_video1_ARID ID 1 1 }  { m_axi_mm_video1_ARLEN SIZE 1 8 }  { m_axi_mm_video1_ARSIZE BURST 1 3 }  { m_axi_mm_video1_ARBURST LOCK 1 2 }  { m_axi_mm_video1_ARLOCK CACHE 1 2 }  { m_axi_mm_video1_ARCACHE PROT 1 4 }  { m_axi_mm_video1_ARPROT QOS 1 3 }  { m_axi_mm_video1_ARQOS REGION 1 4 }  { m_axi_mm_video1_ARREGION USER 1 4 }  { m_axi_mm_video1_ARUSER DATA 1 1 }  { m_axi_mm_video1_RVALID VALID 0 1 }  { m_axi_mm_video1_RREADY READY 1 1 }  { m_axi_mm_video1_RDATA FIFONUM 0 64 }  { m_axi_mm_video1_RLAST LAST 0 1 }  { m_axi_mm_video1_RID ID 0 1 }  { m_axi_mm_video1_RUSER DATA 0 1 }  { m_axi_mm_video1_RRESP RESP 0 2 }  { m_axi_mm_video1_BVALID VALID 0 1 }  { m_axi_mm_video1_BREADY READY 1 1 }  { m_axi_mm_video1_BRESP RESP 0 2 }  { m_axi_mm_video1_BID ID 0 1 }  { m_axi_mm_video1_BUSER DATA 0 1 } } }
	s_axis_video_V_data_V { axis {  { s_axis_video_TDATA in_data 0 24 } } }
	s_axis_video_V_keep_V { axis {  { s_axis_video_TKEEP in_data 0 3 } } }
	s_axis_video_V_strb_V { axis {  { s_axis_video_TSTRB in_data 0 3 } } }
	s_axis_video_V_user_V { axis {  { s_axis_video_TUSER in_data 0 1 } } }
	s_axis_video_V_last_V { axis {  { s_axis_video_TLAST in_data 0 1 } } }
	s_axis_video_V_id_V { axis {  { s_axis_video_TID in_data 0 1 } } }
	s_axis_video_V_dest_V { axis {  { s_axis_video_TVALID in_vld 0 1 }  { s_axis_video_TREADY in_acc 1 1 }  { s_axis_video_TDEST in_data 0 1 } } }
	layerAlpha_0 { ap_none {  { layerAlpha_0 in_data 0 16 } } }
	layerStartX_0 { ap_none {  { layerStartX_0 in_data 0 16 } } }
	layerStartY_0 { ap_none {  { layerStartY_0 in_data 0 16 } } }
	layerWidth_0 { ap_none {  { layerWidth_0 in_data 0 16 } } }
	layerHeight_0 { ap_none {  { layerHeight_0 in_data 0 16 } } }
	layerScaleFactor_0 { ap_none {  { layerScaleFactor_0 in_data 0 8 } } }
	layerVideoFormat { ap_memory {  { layerVideoFormat_address0 mem_address 1 1 }  { layerVideoFormat_ce0 mem_ce 1 1 }  { layerVideoFormat_we0 mem_we 1 1 }  { layerVideoFormat_d0 mem_din 1 8 }  { layerVideoFormat_q0 mem_dout 0 8 }  { layerVideoFormat_address1 MemPortADDR2 1 1 }  { layerVideoFormat_ce1 MemPortCE2 1 1 }  { layerVideoFormat_we1 MemPortWE2 1 1 }  { layerVideoFormat_d1 MemPortDIN2 1 8 }  { layerVideoFormat_q1 MemPortDOUT2 0 8 } } }
	layerStride_0 { ap_none {  { layerStride_0 in_data 0 16 } } }
	K11 { ap_none {  { K11 in_data 0 32 } } }
	K12 { ap_none {  { K12 in_data 0 32 } } }
	K13 { ap_none {  { K13 in_data 0 32 } } }
	K21 { ap_none {  { K21 in_data 0 32 } } }
	K22 { ap_none {  { K22 in_data 0 32 } } }
	K23 { ap_none {  { K23 in_data 0 32 } } }
	K31 { ap_none {  { K31 in_data 0 32 } } }
	K32 { ap_none {  { K32 in_data 0 32 } } }
	K33 { ap_none {  { K33 in_data 0 32 } } }
	ROffset { ap_none {  { ROffset in_data 0 32 } } }
	GOffset { ap_none {  { GOffset in_data 0 32 } } }
	BOffset { ap_none {  { BOffset in_data 0 32 } } }
	K11_2 { ap_none {  { K11_2 in_data 0 32 } } }
	K12_2 { ap_none {  { K12_2 in_data 0 32 } } }
	K13_2 { ap_none {  { K13_2 in_data 0 32 } } }
	K21_2 { ap_none {  { K21_2 in_data 0 32 } } }
	K22_2 { ap_none {  { K22_2 in_data 0 32 } } }
	K23_2 { ap_none {  { K23_2 in_data 0 32 } } }
	K31_2 { ap_none {  { K31_2 in_data 0 32 } } }
	K32_2 { ap_none {  { K32_2 in_data 0 32 } } }
	K33_2 { ap_none {  { K33_2 in_data 0 32 } } }
	YOffset { ap_none {  { YOffset in_data 0 32 } } }
	UOffset { ap_none {  { UOffset in_data 0 32 } } }
	VOffset { ap_none {  { VOffset in_data 0 32 } } }
	m_axis_video_V_data_V { axis {  { m_axis_video_TDATA out_data 1 24 } } }
	m_axis_video_V_keep_V { axis {  { m_axis_video_TKEEP out_data 1 3 } } }
	m_axis_video_V_strb_V { axis {  { m_axis_video_TSTRB out_data 1 3 } } }
	m_axis_video_V_user_V { axis {  { m_axis_video_TUSER out_data 1 1 } } }
	m_axis_video_V_last_V { axis {  { m_axis_video_TLAST out_data 1 1 } } }
	m_axis_video_V_id_V { axis {  { m_axis_video_TID out_data 1 1 } } }
	m_axis_video_V_dest_V { axis {  { m_axis_video_TVALID out_vld 1 1 }  { m_axis_video_TREADY out_acc 0 1 }  { m_axis_video_TDEST out_data 1 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict mm_video1 { CHANNEL_NUM 0 BUNDLE mm_video1 NUM_READ_OUTSTANDING 4 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ mm_video1 100 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ mm_video1 100 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
