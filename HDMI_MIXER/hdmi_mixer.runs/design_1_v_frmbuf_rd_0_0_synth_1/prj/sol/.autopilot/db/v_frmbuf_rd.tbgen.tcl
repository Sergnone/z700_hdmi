set moduleName v_frmbuf_rd
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
set cdfgNum 28
set C_modelName {v_frmbuf_rd}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ mm_video int 64 regular {axi_master 0}  }
	{ width uint 16 regular {axi_slave 0 stable }  }
	{ height uint 16 regular {axi_slave 0 stable }  }
	{ stride uint 16 regular {axi_slave 0 stable }  }
	{ video_format uint 16 regular {axi_slave 0 stable }  }
	{ frm_buffer int 32 regular {axi_slave 0}  }
	{ frm_buffer2 int 32 regular {axi_slave 0}  }
	{ frm_buffer3 int 32 regular {axi_slave 0}  }
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
	{ "Name" : "mm_video", "interface" : "axi_master", "bitwidth" : 64, "direction" : "READONLY", "id_num" : 1, "bitSlice":[ {"cElement": [{"cName": "frm_buffer","offset": { "type": "dynamic","port_name": "frm_buffer","bundle": "CTRL"},"direction": "READONLY"},{"cName": "frm_buffer2","offset": { "type": "dynamic","port_name": "frm_buffer2","bundle": "CTRL"},"direction": "READONLY"},{"cName": "frm_buffer3","offset": { "type": "dynamic","port_name": "frm_buffer3","bundle": "CTRL"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "width", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "height", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "stride", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "video_format", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "frm_buffer", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "frm_buffer2", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":60}, "offset_end" : {"in":67}} , 
 	{ "Name" : "frm_buffer3", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":116}, "offset_end" : {"in":123}} , 
 	{ "Name" : "m_axis_video_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_video_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 74
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_mm_video_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mm_video_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mm_video_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_mm_video_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mm_video_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_mm_video_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_mm_video_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_mm_video_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_mm_video_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_mm_video_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_mm_video_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_mm_video_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_mm_video_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mm_video_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mm_video_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mm_video_WDATA sc_out sc_lv 64 signal 0 } 
	{ m_axi_mm_video_WSTRB sc_out sc_lv 8 signal 0 } 
	{ m_axi_mm_video_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_mm_video_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mm_video_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mm_video_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mm_video_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mm_video_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_mm_video_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mm_video_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_mm_video_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_mm_video_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_mm_video_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_mm_video_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_mm_video_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_mm_video_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_mm_video_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_mm_video_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mm_video_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_mm_video_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_mm_video_RDATA sc_in sc_lv 64 signal 0 } 
	{ m_axi_mm_video_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_mm_video_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_mm_video_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_mm_video_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_mm_video_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_mm_video_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_mm_video_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_mm_video_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_mm_video_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axis_video_TDATA sc_out sc_lv 24 signal 8 } 
	{ m_axis_video_TVALID sc_out sc_logic 1 outvld 14 } 
	{ m_axis_video_TREADY sc_in sc_logic 1 outacc 14 } 
	{ m_axis_video_TKEEP sc_out sc_lv 3 signal 9 } 
	{ m_axis_video_TSTRB sc_out sc_lv 3 signal 10 } 
	{ m_axis_video_TUSER sc_out sc_lv 1 signal 11 } 
	{ m_axis_video_TLAST sc_out sc_lv 1 signal 12 } 
	{ m_axis_video_TID sc_out sc_lv 1 signal 13 } 
	{ m_axis_video_TDEST sc_out sc_lv 1 signal 14 } 
	{ s_axi_CTRL_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_CTRL_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_CTRL_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_CTRL_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_ARADDR sc_in sc_lv 7 signal -1 } 
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
	{ "name": "s_axi_CTRL_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "CTRL", "role": "AWADDR" },"address":[{"name":"v_frmbuf_rd","role":"start","value":"0","valid_bit":"0"},{"name":"v_frmbuf_rd","role":"continue","value":"0","valid_bit":"4"},{"name":"v_frmbuf_rd","role":"auto_start","value":"0","valid_bit":"7"},{"name":"width","role":"data","value":"16"},{"name":"height","role":"data","value":"24"},{"name":"stride","role":"data","value":"32"},{"name":"video_format","role":"data","value":"40"},{"name":"frm_buffer","role":"data","value":"48"},{"name":"frm_buffer2","role":"data","value":"60"},{"name":"frm_buffer3","role":"data","value":"116"}] },
	{ "name": "s_axi_CTRL_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "AWVALID" } },
	{ "name": "s_axi_CTRL_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "AWREADY" } },
	{ "name": "s_axi_CTRL_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "WVALID" } },
	{ "name": "s_axi_CTRL_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "WREADY" } },
	{ "name": "s_axi_CTRL_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL", "role": "WDATA" } },
	{ "name": "s_axi_CTRL_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CTRL", "role": "WSTRB" } },
	{ "name": "s_axi_CTRL_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "CTRL", "role": "ARADDR" },"address":[{"name":"v_frmbuf_rd","role":"start","value":"0","valid_bit":"0"},{"name":"v_frmbuf_rd","role":"done","value":"0","valid_bit":"1"},{"name":"v_frmbuf_rd","role":"idle","value":"0","valid_bit":"2"},{"name":"v_frmbuf_rd","role":"ready","value":"0","valid_bit":"3"},{"name":"v_frmbuf_rd","role":"auto_start","value":"0","valid_bit":"7"}] },
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
 	{ "name": "m_axi_mm_video_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "AWVALID" }} , 
 	{ "name": "m_axi_mm_video_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "AWREADY" }} , 
 	{ "name": "m_axi_mm_video_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mm_video", "role": "AWADDR" }} , 
 	{ "name": "m_axi_mm_video_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "AWID" }} , 
 	{ "name": "m_axi_mm_video_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mm_video", "role": "AWLEN" }} , 
 	{ "name": "m_axi_mm_video_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_mm_video_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video", "role": "AWBURST" }} , 
 	{ "name": "m_axi_mm_video_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_mm_video_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_mm_video_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video", "role": "AWPROT" }} , 
 	{ "name": "m_axi_mm_video_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video", "role": "AWQOS" }} , 
 	{ "name": "m_axi_mm_video_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video", "role": "AWREGION" }} , 
 	{ "name": "m_axi_mm_video_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "AWUSER" }} , 
 	{ "name": "m_axi_mm_video_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "WVALID" }} , 
 	{ "name": "m_axi_mm_video_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "WREADY" }} , 
 	{ "name": "m_axi_mm_video_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mm_video", "role": "WDATA" }} , 
 	{ "name": "m_axi_mm_video_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mm_video", "role": "WSTRB" }} , 
 	{ "name": "m_axi_mm_video_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "WLAST" }} , 
 	{ "name": "m_axi_mm_video_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "WID" }} , 
 	{ "name": "m_axi_mm_video_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "WUSER" }} , 
 	{ "name": "m_axi_mm_video_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "ARVALID" }} , 
 	{ "name": "m_axi_mm_video_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "ARREADY" }} , 
 	{ "name": "m_axi_mm_video_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mm_video", "role": "ARADDR" }} , 
 	{ "name": "m_axi_mm_video_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "ARID" }} , 
 	{ "name": "m_axi_mm_video_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mm_video", "role": "ARLEN" }} , 
 	{ "name": "m_axi_mm_video_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_mm_video_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video", "role": "ARBURST" }} , 
 	{ "name": "m_axi_mm_video_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_mm_video_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_mm_video_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mm_video", "role": "ARPROT" }} , 
 	{ "name": "m_axi_mm_video_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video", "role": "ARQOS" }} , 
 	{ "name": "m_axi_mm_video_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mm_video", "role": "ARREGION" }} , 
 	{ "name": "m_axi_mm_video_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "ARUSER" }} , 
 	{ "name": "m_axi_mm_video_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "RVALID" }} , 
 	{ "name": "m_axi_mm_video_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "RREADY" }} , 
 	{ "name": "m_axi_mm_video_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mm_video", "role": "RDATA" }} , 
 	{ "name": "m_axi_mm_video_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "RLAST" }} , 
 	{ "name": "m_axi_mm_video_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "RID" }} , 
 	{ "name": "m_axi_mm_video_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "RUSER" }} , 
 	{ "name": "m_axi_mm_video_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video", "role": "RRESP" }} , 
 	{ "name": "m_axi_mm_video_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "BVALID" }} , 
 	{ "name": "m_axi_mm_video_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "BREADY" }} , 
 	{ "name": "m_axi_mm_video_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mm_video", "role": "BRESP" }} , 
 	{ "name": "m_axi_mm_video_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "BID" }} , 
 	{ "name": "m_axi_mm_video_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mm_video", "role": "BUSER" }} , 
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
	v_frmbuf_rd {
		mm_video {Type I LastRead 221 FirstWrite -1}
		width {Type I LastRead 0 FirstWrite -1}
		height {Type I LastRead 0 FirstWrite -1}
		stride {Type I LastRead 0 FirstWrite -1}
		video_format {Type I LastRead 0 FirstWrite -1}
		frm_buffer {Type I LastRead 0 FirstWrite -1}
		frm_buffer2 {Type I LastRead 0 FirstWrite -1}
		frm_buffer3 {Type I LastRead 0 FirstWrite -1}
		m_axis_video_V_data_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_keep_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_strb_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_user_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_last_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_id_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_dest_V {Type O LastRead -1 FirstWrite 2}
		BYTES_PER_PIXEL {Type I LastRead -1 FirstWrite -1}
		MEMORY2LIVE {Type I LastRead -1 FirstWrite -1}
		mapComp {Type I LastRead -1 FirstWrite -1}}
	FrmbufRdHlsDataFlow {
		m_axis_video_V_data_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_keep_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_strb_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_user_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_last_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_id_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_dest_V {Type O LastRead -1 FirstWrite 2}
		mm_video {Type I LastRead 221 FirstWrite -1}
		HwReg_frm_buffer {Type I LastRead 0 FirstWrite -1}
		HwReg_frm_buffer2 {Type I LastRead 0 FirstWrite -1}
		HwReg_frm_buffer3 {Type I LastRead 0 FirstWrite -1}
		width_val2 {Type I LastRead 2 FirstWrite -1}
		height_val5 {Type I LastRead 0 FirstWrite -1}
		stride_val6 {Type I LastRead 0 FirstWrite -1}
		video_format_val8 {Type I LastRead 0 FirstWrite -1}
		WidthInBytes_val10 {Type I LastRead 0 FirstWrite -1}
		colorFormat_val11 {Type I LastRead 4 FirstWrite -1}
		mapComp {Type I LastRead -1 FirstWrite -1}}
	AXIMMvideo2Bytes {
		mm_video {Type I LastRead 221 FirstWrite -1}
		srcImg {Type I LastRead 0 FirstWrite -1}
		srcImg2 {Type I LastRead 0 FirstWrite -1}
		srcImg3 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 2}
		bytePlanes_plane1 {Type O LastRead -1 FirstWrite 2}
		bytePlanes_plane2 {Type O LastRead -1 FirstWrite 2}
		Height_val {Type I LastRead 0 FirstWrite -1}
		WidthInBytes_val {Type I LastRead 0 FirstWrite -1}
		StrideInBytes_val {Type I LastRead 0 FirstWrite -1}
		VideoFormat_val {Type I LastRead 0 FirstWrite -1}}
	AXIMMvideo2Bytes_Pipeline_VITIS_LOOP_625_4 {
		loopwidth_1 {Type I LastRead 0 FirstWrite -1}
		mm_video {Type I LastRead 1 FirstWrite -1}
		sext_ln625 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 2}}
	AXIMMvideo2Bytes_Pipeline_VITIS_LOOP_634_5 {
		lshr_ln4 {Type I LastRead 0 FirstWrite -1}
		mm_video {Type I LastRead 1 FirstWrite -1}
		sext_ln634 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane1 {Type O LastRead -1 FirstWrite 2}}
	AXIMMvideo2Bytes_Pipeline_VITIS_LOOP_640_6 {
		lshr_ln4 {Type I LastRead 0 FirstWrite -1}
		mm_video {Type I LastRead 1 FirstWrite -1}
		sext_ln640 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane2 {Type O LastRead -1 FirstWrite 2}}
	AXIMMvideo2Bytes_Pipeline_VITIS_LOOP_591_1 {
		loopwidth {Type I LastRead 0 FirstWrite -1}
		mm_video {Type I LastRead 1 FirstWrite -1}
		sext_ln591 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 2}}
	AXIMMvideo2Bytes_Pipeline_VITIS_LOOP_597_2 {
		loopwidth {Type I LastRead 0 FirstWrite -1}
		mm_video {Type I LastRead 1 FirstWrite -1}
		sext_ln597 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane1 {Type O LastRead -1 FirstWrite 2}}
	AXIMMvideo2Bytes_Pipeline_VITIS_LOOP_603_3 {
		loopwidth {Type I LastRead 0 FirstWrite -1}
		mm_video {Type I LastRead 1 FirstWrite -1}
		sext_ln603 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane2 {Type O LastRead -1 FirstWrite 2}}
	AXIMMvideo2Bytes_Pipeline_VITIS_LOOP_660_7 {
		lshr_ln {Type I LastRead 0 FirstWrite -1}
		mm_video {Type I LastRead 1 FirstWrite -1}
		sext_ln660 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type O LastRead -1 FirstWrite 2}}
	AXIMMvideo2Bytes_Pipeline_VITIS_LOOP_670_8 {
		lshr_ln {Type I LastRead 0 FirstWrite -1}
		mm_video {Type I LastRead 1 FirstWrite -1}
		sext_ln670 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane1 {Type O LastRead -1 FirstWrite 2}}
	Bytes2MultiPixStream {
		bytePlanes_plane0 {Type I LastRead 3 FirstWrite -1}
		bytePlanes_plane1 {Type I LastRead 1 FirstWrite -1}
		bytePlanes_plane2 {Type I LastRead 1 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		Height_val {Type I LastRead 0 FirstWrite -1}
		Width_val {Type I LastRead 0 FirstWrite -1}
		WidthInBytes_val {Type I LastRead 0 FirstWrite -1}
		VideoFormat_val {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1772_29 {
		loopWidth_9 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		sext_ln1765 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		rev51 {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1532_26 {
		loopWidth_8 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1522 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1548_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1548_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1548_3 {Type I LastRead 0 FirstWrite -1}
		icmp48 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1548_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		sext_ln1548 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp45 {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1450_23 {
		loopWidth_7 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		sext_ln1443 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		rev {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1398_20 {
		trunc_ln5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1387 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1426_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1426_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1426_3 {Type I LastRead 0 FirstWrite -1}
		icmp41 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1426_1 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp38 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1408 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 3 FirstWrite -1}
		add_ln1405 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1405 {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1240_17 {
		trunc_ln2 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1229 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1271_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1271_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1271_3 {Type I LastRead 0 FirstWrite -1}
		icmp35 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1271_1 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp32 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1250 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 3 FirstWrite -1}
		add_ln1247 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1247 {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1197_14 {
		loopWidth_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1187 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1213_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		sext_ln1213 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp29 {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1157_11 {
		loopWidth_3 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1147 {Type I LastRead 0 FirstWrite -1}
		icmp_ln1173_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		sext_ln1173 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp26 {Type I LastRead 0 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_954_8 {
		loopWidth_2 {Type I LastRead 0 FirstWrite -1}
		icmp_ln944 {Type I LastRead 0 FirstWrite -1}
		icmp_ln975_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln975_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln975_3 {Type I LastRead 0 FirstWrite -1}
		icmp23 {Type I LastRead 0 FirstWrite -1}
		icmp_ln975_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln975 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp20 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		VideoFormat_val {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane1 {Type I LastRead 1 FirstWrite -1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_862_5 {
		loopWidth_1 {Type I LastRead 0 FirstWrite -1}
		icmp_ln849 {Type I LastRead 0 FirstWrite -1}
		icmp_ln928_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln928_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln928_3 {Type I LastRead 0 FirstWrite -1}
		icmp17 {Type I LastRead 0 FirstWrite -1}
		icmp_ln928_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln928 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 2}
		icmp14 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane1 {Type I LastRead 1 FirstWrite -1}
		bytePlanes_plane2 {Type I LastRead 1 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 2 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		pixV_1_out {Type IO LastRead 3 FirstWrite 1}
		pixU_1_out {Type IO LastRead 2 FirstWrite 1}}
	Bytes2MultiPixStream_Pipeline_VITIS_LOOP_755_1 {
		trunc_ln745_1 {Type I LastRead 0 FirstWrite -1}
		icmp_ln748 {Type I LastRead 0 FirstWrite -1}
		icmp_ln773_5 {Type I LastRead 0 FirstWrite -1}
		icmp_ln773_4 {Type I LastRead 0 FirstWrite -1}
		icmp_ln773_3 {Type I LastRead 0 FirstWrite -1}
		icmp11 {Type I LastRead 0 FirstWrite -1}
		icmp_ln773_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane0 {Type I LastRead 1 FirstWrite -1}
		bytePlanes_plane1 {Type I LastRead 1 FirstWrite -1}
		bytePlanes_plane2 {Type I LastRead 1 FirstWrite -1}
		add_ln773 {Type I LastRead 0 FirstWrite -1}
		img {Type O LastRead -1 FirstWrite 1}
		icmp8 {Type I LastRead 0 FirstWrite -1}}
	MultiPixStream2AXIvideo {
		img {Type I LastRead 1 FirstWrite -1}
		m_axis_video_V_data_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_keep_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_strb_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_user_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_last_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_id_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_dest_V {Type O LastRead -1 FirstWrite 2}
		Height_val {Type I LastRead 1 FirstWrite -1}
		WidthOut_val {Type I LastRead 1 FirstWrite -1}
		colorFormat_val {Type I LastRead 0 FirstWrite -1}
		mapComp {Type I LastRead -1 FirstWrite -1}}
	MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_367_1 {
		mul_ln369 {Type I LastRead 0 FirstWrite -1}
		kMap_2_out {Type O LastRead -1 FirstWrite 1}
		kMap_1_out {Type O LastRead -1 FirstWrite 1}
		kMap_out {Type O LastRead -1 FirstWrite 1}
		mapComp {Type I LastRead -1 FirstWrite -1}}
	MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_376_3 {
		sof {Type I LastRead 0 FirstWrite -1}
		cols {Type I LastRead 0 FirstWrite -1}
		add_ln392 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 1 FirstWrite -1}
		empty_78 {Type I LastRead 0 FirstWrite -1}
		empty_79 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		m_axis_video_V_data_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_keep_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_strb_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_user_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_last_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_id_V {Type O LastRead -1 FirstWrite 2}
		m_axis_video_V_dest_V {Type O LastRead -1 FirstWrite 2}}
	reg_unsigned_short_s {
		d {Type I LastRead 1 FirstWrite -1}}
	reg_unsigned_short_s {
		d {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "111752", "Max" : "12558756"}
	, {"Name" : "Interval", "Min" : "111753", "Max" : "12558757"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	mm_video { m_axi {  { m_axi_mm_video_AWVALID VALID 1 1 }  { m_axi_mm_video_AWREADY READY 0 1 }  { m_axi_mm_video_AWADDR ADDR 1 32 }  { m_axi_mm_video_AWID ID 1 1 }  { m_axi_mm_video_AWLEN SIZE 1 8 }  { m_axi_mm_video_AWSIZE BURST 1 3 }  { m_axi_mm_video_AWBURST LOCK 1 2 }  { m_axi_mm_video_AWLOCK CACHE 1 2 }  { m_axi_mm_video_AWCACHE PROT 1 4 }  { m_axi_mm_video_AWPROT QOS 1 3 }  { m_axi_mm_video_AWQOS REGION 1 4 }  { m_axi_mm_video_AWREGION USER 1 4 }  { m_axi_mm_video_AWUSER DATA 1 1 }  { m_axi_mm_video_WVALID VALID 1 1 }  { m_axi_mm_video_WREADY READY 0 1 }  { m_axi_mm_video_WDATA FIFONUM 1 64 }  { m_axi_mm_video_WSTRB STRB 1 8 }  { m_axi_mm_video_WLAST LAST 1 1 }  { m_axi_mm_video_WID ID 1 1 }  { m_axi_mm_video_WUSER DATA 1 1 }  { m_axi_mm_video_ARVALID VALID 1 1 }  { m_axi_mm_video_ARREADY READY 0 1 }  { m_axi_mm_video_ARADDR ADDR 1 32 }  { m_axi_mm_video_ARID ID 1 1 }  { m_axi_mm_video_ARLEN SIZE 1 8 }  { m_axi_mm_video_ARSIZE BURST 1 3 }  { m_axi_mm_video_ARBURST LOCK 1 2 }  { m_axi_mm_video_ARLOCK CACHE 1 2 }  { m_axi_mm_video_ARCACHE PROT 1 4 }  { m_axi_mm_video_ARPROT QOS 1 3 }  { m_axi_mm_video_ARQOS REGION 1 4 }  { m_axi_mm_video_ARREGION USER 1 4 }  { m_axi_mm_video_ARUSER DATA 1 1 }  { m_axi_mm_video_RVALID VALID 0 1 }  { m_axi_mm_video_RREADY READY 1 1 }  { m_axi_mm_video_RDATA FIFONUM 0 64 }  { m_axi_mm_video_RLAST LAST 0 1 }  { m_axi_mm_video_RID ID 0 1 }  { m_axi_mm_video_RUSER DATA 0 1 }  { m_axi_mm_video_RRESP RESP 0 2 }  { m_axi_mm_video_BVALID VALID 0 1 }  { m_axi_mm_video_BREADY READY 1 1 }  { m_axi_mm_video_BRESP RESP 0 2 }  { m_axi_mm_video_BID ID 0 1 }  { m_axi_mm_video_BUSER DATA 0 1 } } }
	m_axis_video_V_data_V { axis {  { m_axis_video_TDATA out_data 1 24 } } }
	m_axis_video_V_keep_V { axis {  { m_axis_video_TKEEP out_data 1 3 } } }
	m_axis_video_V_strb_V { axis {  { m_axis_video_TSTRB out_data 1 3 } } }
	m_axis_video_V_user_V { axis {  { m_axis_video_TUSER out_data 1 1 } } }
	m_axis_video_V_last_V { axis {  { m_axis_video_TLAST out_data 1 1 } } }
	m_axis_video_V_id_V { axis {  { m_axis_video_TID out_data 1 1 } } }
	m_axis_video_V_dest_V { axis {  { m_axis_video_TVALID out_vld 1 1 }  { m_axis_video_TREADY out_acc 0 1 }  { m_axis_video_TDEST out_data 1 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict mm_video { CHANNEL_NUM 0 BUNDLE mm_video NUM_READ_OUTSTANDING 4 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ mm_video 100 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ mm_video 100 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
