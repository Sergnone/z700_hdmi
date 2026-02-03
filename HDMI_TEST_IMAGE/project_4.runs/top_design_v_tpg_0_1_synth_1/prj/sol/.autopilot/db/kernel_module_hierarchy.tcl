set ModuleHierarchy {[{
"Name" : "v_tpg", "RefName" : "v_tpg","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_v_tpgHlsDataFlow_fu_440", "RefName" : "v_tpgHlsDataFlow","ID" : "1","Type" : "dataflow",
		"SubInsts" : [
		{"Name" : "tpgBackground_U0", "RefName" : "tpgBackground","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_563_1","RefName" : "VITIS_LOOP_563_1","ID" : "3","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_tpgBackground_Pipeline_VITIS_LOOP_565_2_fu_432", "RefName" : "tpgBackground_Pipeline_VITIS_LOOP_565_2","ID" : "4","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_565_2","RefName" : "VITIS_LOOP_565_2","ID" : "5","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "grp_reg_ap_uint_10_s_fu_1924", "RefName" : "reg_ap_uint_10_s","ID" : "6","Type" : "pipeline"},
					{"Name" : "grp_reg_int_s_fu_2226", "RefName" : "reg_int_s","ID" : "7","Type" : "pipeline"},]},]},]},]},
		{"Name" : "tpgForeground_U0", "RefName" : "tpgForeground","ID" : "8","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_772_1","RefName" : "VITIS_LOOP_772_1","ID" : "9","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_tpgForeground_Pipeline_VITIS_LOOP_774_2_fu_182", "RefName" : "tpgForeground_Pipeline_VITIS_LOOP_774_2","ID" : "10","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_774_2","RefName" : "VITIS_LOOP_774_2","ID" : "11","Type" : "pipeline"},]},]},]},
		{"Name" : "MultiPixStream2AXIvideo_U0", "RefName" : "MultiPixStream2AXIvideo","ID" : "12","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_979_1","RefName" : "VITIS_LOOP_979_1","ID" : "13","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_981_2_fu_163", "RefName" : "MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_981_2","ID" : "14","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_981_2","RefName" : "VITIS_LOOP_981_2","ID" : "15","Type" : "pipeline"},]},]},]},]},
	{"Name" : "grp_reg_unsigned_short_s_fu_616", "RefName" : "reg_unsigned_short_s","ID" : "16","Type" : "pipeline"},]
}]}