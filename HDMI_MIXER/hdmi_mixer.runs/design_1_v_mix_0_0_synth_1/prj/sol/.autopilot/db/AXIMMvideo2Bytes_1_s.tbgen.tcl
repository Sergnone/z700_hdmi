set moduleName AXIMMvideo2Bytes_1_s
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
set cdfgNum 40
set C_modelName {AXIMMvideo2Bytes<1>}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ HwReg_layerWidth_1_val int 14 regular {ap_stable 0} }
	{ mm_video1 int 64 regular {axi_master 0 stable }  }
	{ HwReg_layer1_buf1 int 32 regular {ap_stable 0} }
	{ bytesLayer1_plane0 int 64 regular {fifo 1 volatile }  }
	{ HwReg_layerHeight_1_val int 16 regular {ap_stable 0} }
	{ HwReg_layerStride_1_val int 16 regular {ap_stable 0} }
	{ HwReg_layerEnableFlag_1_val int 1 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "HwReg_layerWidth_1_val", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "mm_video1", "interface" : "axi_master", "bitwidth" : 64, "direction" : "READONLY", "id_num" : 0, "bitSlice":[ {"cElement": [{"cName": "layer1_buf1","offset": { "type": "dynamic","port_name": "layer1_buf1","bundle": "CTRL"},"direction": "READONLY"},{"cName": "layer1_buf2","offset": { "type": "dynamic","port_name": "layer1_buf2","bundle": "CTRL"}},{"cName": "layer1_buf3","offset": { "type": "dynamic","port_name": "layer1_buf3","bundle": "CTRL"}}]}]} , 
 	{ "Name" : "HwReg_layer1_buf1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "bytesLayer1_plane0", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "HwReg_layerHeight_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerStride_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "HwReg_layerEnableFlag_1_val", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 66
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
	{ HwReg_layerWidth_1_val sc_in sc_lv 14 signal 0 } 
	{ m_axi_mm_video1_0_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_mm_video1_0_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_mm_video1_0_AWADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_mm_video1_0_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_mm_video1_0_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_mm_video1_0_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_mm_video1_0_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_mm_video1_0_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_mm_video1_0_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_mm_video1_0_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_mm_video1_0_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_mm_video1_0_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_mm_video1_0_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_mm_video1_0_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_mm_video1_0_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_mm_video1_0_WDATA sc_out sc_lv 64 signal 1 } 
	{ m_axi_mm_video1_0_WSTRB sc_out sc_lv 8 signal 1 } 
	{ m_axi_mm_video1_0_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_mm_video1_0_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_mm_video1_0_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_mm_video1_0_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_mm_video1_0_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_mm_video1_0_ARADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_mm_video1_0_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_mm_video1_0_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_mm_video1_0_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_mm_video1_0_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_mm_video1_0_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_mm_video1_0_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_mm_video1_0_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_mm_video1_0_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_mm_video1_0_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_mm_video1_0_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_mm_video1_0_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_mm_video1_0_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_mm_video1_0_RDATA sc_in sc_lv 64 signal 1 } 
	{ m_axi_mm_video1_0_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_mm_video1_0_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_mm_video1_0_RFIFONUM sc_in sc_lv 7 signal 1 } 
	{ m_axi_mm_video1_0_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_mm_video1_0_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_mm_video1_0_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_mm_video1_0_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_mm_video1_0_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_mm_video1_0_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_mm_video1_0_BUSER sc_in sc_lv 1 signal 1 } 
	{ HwReg_layer1_buf1 sc_in sc_lv 32 signal 2 } 
	{ bytesLayer1_plane0_din sc_out sc_lv 64 signal 3 } 
	{ bytesLayer1_plane0_full_n sc_in sc_logic 1 signal 3 } 
	{ bytesLayer1_plane0_write sc_out sc_logic 1 signal 3 } 
	{ bytesLayer1_plane0_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ bytesLayer1_plane0_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ HwReg_layerHeight_1_val sc_in sc_lv 16 signal 4 } 
	{ HwReg_layerStride_1_val sc_in sc_lv 16 signal 5 } 
	{ HwReg_layerEnableFlag_1_val sc_in sc_lv 1 signal 6 } 
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
 	{ "name": "HwReg_layerWidth_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "HwReg_layerWidth_1_val", "role": "default" }} , 
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
 	{ "name": "bytesLayer1_plane0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytesLayer1_plane0", "role": "din" }} , 
 	{ "name": "bytesLayer1_plane0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytesLayer1_plane0", "role": "full_n" }} , 
 	{ "name": "bytesLayer1_plane0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytesLayer1_plane0", "role": "write" }} , 
 	{ "name": "bytesLayer1_plane0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bytesLayer1_plane0", "role": "num_data_valid" }} , 
 	{ "name": "bytesLayer1_plane0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bytesLayer1_plane0", "role": "fifo_cap" }} , 
 	{ "name": "HwReg_layerHeight_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "HwReg_layerHeight_1_val", "role": "default" }} , 
 	{ "name": "HwReg_layerStride_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "HwReg_layerStride_1_val", "role": "default" }} , 
 	{ "name": "HwReg_layerEnableFlag_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "HwReg_layerEnableFlag_1_val", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
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
		bytesLayer1_plane0 {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "17938801"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "17938801"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	HwReg_layerWidth_1_val { ap_stable {  { HwReg_layerWidth_1_val in_data 0 14 } } }
	 { m_axi {  { m_axi_mm_video1_0_AWVALID VALID 1 1 }  { m_axi_mm_video1_0_AWREADY READY 0 1 }  { m_axi_mm_video1_0_AWADDR ADDR 1 32 }  { m_axi_mm_video1_0_AWID ID 1 1 }  { m_axi_mm_video1_0_AWLEN SIZE 1 32 }  { m_axi_mm_video1_0_AWSIZE BURST 1 3 }  { m_axi_mm_video1_0_AWBURST LOCK 1 2 }  { m_axi_mm_video1_0_AWLOCK CACHE 1 2 }  { m_axi_mm_video1_0_AWCACHE PROT 1 4 }  { m_axi_mm_video1_0_AWPROT QOS 1 3 }  { m_axi_mm_video1_0_AWQOS REGION 1 4 }  { m_axi_mm_video1_0_AWREGION USER 1 4 }  { m_axi_mm_video1_0_AWUSER DATA 1 1 }  { m_axi_mm_video1_0_WVALID VALID 1 1 }  { m_axi_mm_video1_0_WREADY READY 0 1 }  { m_axi_mm_video1_0_WDATA FIFONUM 1 64 }  { m_axi_mm_video1_0_WSTRB STRB 1 8 }  { m_axi_mm_video1_0_WLAST LAST 1 1 }  { m_axi_mm_video1_0_WID ID 1 1 }  { m_axi_mm_video1_0_WUSER DATA 1 1 }  { m_axi_mm_video1_0_ARVALID VALID 1 1 }  { m_axi_mm_video1_0_ARREADY READY 0 1 }  { m_axi_mm_video1_0_ARADDR ADDR 1 32 }  { m_axi_mm_video1_0_ARID ID 1 1 }  { m_axi_mm_video1_0_ARLEN SIZE 1 32 }  { m_axi_mm_video1_0_ARSIZE BURST 1 3 }  { m_axi_mm_video1_0_ARBURST LOCK 1 2 }  { m_axi_mm_video1_0_ARLOCK CACHE 1 2 }  { m_axi_mm_video1_0_ARCACHE PROT 1 4 }  { m_axi_mm_video1_0_ARPROT QOS 1 3 }  { m_axi_mm_video1_0_ARQOS REGION 1 4 }  { m_axi_mm_video1_0_ARREGION USER 1 4 }  { m_axi_mm_video1_0_ARUSER DATA 1 1 }  { m_axi_mm_video1_0_RVALID VALID 0 1 }  { m_axi_mm_video1_0_RREADY READY 1 1 }  { m_axi_mm_video1_0_RDATA FIFONUM 0 64 }  { m_axi_mm_video1_0_RLAST LAST 0 1 }  { m_axi_mm_video1_0_RID ID 0 1 }  { m_axi_mm_video1_0_RFIFONUM LEN 0 7 }  { m_axi_mm_video1_0_RUSER DATA 0 1 }  { m_axi_mm_video1_0_RRESP RESP 0 2 }  { m_axi_mm_video1_0_BVALID VALID 0 1 }  { m_axi_mm_video1_0_BREADY READY 1 1 }  { m_axi_mm_video1_0_BRESP RESP 0 2 }  { m_axi_mm_video1_0_BID ID 0 1 }  { m_axi_mm_video1_0_BUSER DATA 0 1 } } }
	HwReg_layer1_buf1 { ap_stable {  { HwReg_layer1_buf1 in_data 0 32 } } }
	bytesLayer1_plane0 { ap_fifo {  { bytesLayer1_plane0_din fifo_data_out 1 64 }  { bytesLayer1_plane0_full_n fifo_status_empty 0 1 }  { bytesLayer1_plane0_write fifo_data_in 1 1 }  { bytesLayer1_plane0_num_data_valid fifo_update 0 3 }  { bytesLayer1_plane0_fifo_cap fifo_data 0 3 } } }
	HwReg_layerHeight_1_val { ap_stable {  { HwReg_layerHeight_1_val in_data 0 16 } } }
	HwReg_layerStride_1_val { ap_stable {  { HwReg_layerStride_1_val in_data 0 16 } } }
	HwReg_layerEnableFlag_1_val { ap_stable {  { HwReg_layerEnableFlag_1_val in_data 0 1 } } }
}
