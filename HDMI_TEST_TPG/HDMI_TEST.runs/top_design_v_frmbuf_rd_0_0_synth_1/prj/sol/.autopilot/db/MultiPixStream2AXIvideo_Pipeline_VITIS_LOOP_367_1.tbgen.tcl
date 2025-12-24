set moduleName MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_367_1
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
set cdfgNum 12
set C_modelName {MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_367_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ mul_ln369 int 4 regular {ap_stable 0} }
	{ kMap_2_out int 2 regular {pointer 1}  }
	{ kMap_1_out int 2 regular {pointer 1}  }
	{ kMap_out int 2 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "mul_ln369", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "kMap_2_out", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "kMap_1_out", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "kMap_out", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mul_ln369 sc_in sc_lv 4 signal 0 } 
	{ kMap_2_out sc_out sc_lv 2 signal 1 } 
	{ kMap_2_out_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ kMap_1_out sc_out sc_lv 2 signal 2 } 
	{ kMap_1_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ kMap_out sc_out sc_lv 2 signal 3 } 
	{ kMap_out_ap_vld sc_out sc_logic 1 outvld 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mul_ln369", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mul_ln369", "role": "default" }} , 
 	{ "name": "kMap_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "kMap_2_out", "role": "default" }} , 
 	{ "name": "kMap_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "kMap_2_out", "role": "ap_vld" }} , 
 	{ "name": "kMap_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "kMap_1_out", "role": "default" }} , 
 	{ "name": "kMap_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "kMap_1_out", "role": "ap_vld" }} , 
 	{ "name": "kMap_out", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "kMap_out", "role": "default" }} , 
 	{ "name": "kMap_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "kMap_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_367_1 {
		mul_ln369 {Type I LastRead 0 FirstWrite -1}
		kMap_2_out {Type O LastRead -1 FirstWrite 1}
		kMap_1_out {Type O LastRead -1 FirstWrite 1}
		kMap_out {Type O LastRead -1 FirstWrite 1}
		mapComp {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "6"}
	, {"Name" : "Interval", "Min" : "4", "Max" : "4"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mul_ln369 { ap_stable {  { mul_ln369 in_data 0 4 } } }
	kMap_2_out { ap_vld {  { kMap_2_out out_data 1 2 }  { kMap_2_out_ap_vld out_vld 1 1 } } }
	kMap_1_out { ap_vld {  { kMap_1_out out_data 1 2 }  { kMap_1_out_ap_vld out_vld 1 1 } } }
	kMap_out { ap_vld {  { kMap_out out_data 1 2 }  { kMap_out_ap_vld out_vld 1 1 } } }
}
