set ModuleHierarchy {[{
"Name" : "v_mix", "RefName" : "v_mix","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_VMixHlsDataFlowFunction_fu_431", "RefName" : "VMixHlsDataFlowFunction","ID" : "1","Type" : "dataflow",
		"SubInsts" : [
		{"Name" : "AXIvideo2MultiPixStream_U0", "RefName" : "AXIvideo2MultiPixStream","ID" : "2","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_142", "RefName" : "AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start","ID" : "3","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "loop_wait_for_start","RefName" : "loop_wait_for_start","ID" : "4","Type" : "pipeline"},]},
			{"Name" : "grp_reg_unsigned_short_1_fu_213", "RefName" : "reg_unsigned_short_1","ID" : "5","Type" : "pipeline"},
			{"Name" : "grp_reg_unsigned_short_1_fu_219", "RefName" : "reg_unsigned_short_1","ID" : "6","Type" : "pipeline"},],
			"SubLoops" : [
			{"Name" : "loop_height","RefName" : "loop_height","ID" : "7","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_162", "RefName" : "AXIvideo2MultiPixStream_Pipeline_loop_width","ID" : "8","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "loop_width","RefName" : "loop_width","ID" : "9","Type" : "pipeline"},]},
			{"Name" : "grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_190", "RefName" : "AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol","ID" : "10","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "loop_wait_for_eol","RefName" : "loop_wait_for_eol","ID" : "11","Type" : "pipeline"},]},]},]},
		{"Name" : "AXIMMvideo2Bytes_1_U0", "RefName" : "AXIMMvideo2Bytes_1_s","ID" : "12","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_196_1","RefName" : "VITIS_LOOP_196_1","ID" : "13","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_AXIMMvideo2Bytes_1_Pipeline_VITIS_LOOP_203_2_fu_138", "RefName" : "AXIMMvideo2Bytes_1_Pipeline_VITIS_LOOP_203_2","ID" : "14","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_203_2","RefName" : "VITIS_LOOP_203_2","ID" : "15","Type" : "pipeline"},]},]},]},
		{"Name" : "v_mix_420_to_422_false_1_U0", "RefName" : "v_mix_420_to_422_false_1","ID" : "16","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_74_1","RefName" : "VITIS_LOOP_74_1","ID" : "17","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_v_mix_420_to_422_false_1_Pipeline_VITIS_LOOP_76_2_fu_74", "RefName" : "v_mix_420_to_422_false_1_Pipeline_VITIS_LOOP_76_2","ID" : "18","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_76_2","RefName" : "VITIS_LOOP_76_2","ID" : "19","Type" : "pipeline"},]},]},]},
		{"Name" : "Bytes2MultiPixStream_10_U0", "RefName" : "Bytes2MultiPixStream_10_s","ID" : "20","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_1099_1","RefName" : "VITIS_LOOP_1099_1","ID" : "21","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_Bytes2MultiPixStream_10_Pipeline_VITIS_LOOP_1104_2_fu_72", "RefName" : "Bytes2MultiPixStream_10_Pipeline_VITIS_LOOP_1104_2","ID" : "22","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_1104_2","RefName" : "VITIS_LOOP_1104_2","ID" : "23","Type" : "pipeline"},]},]},]},
		{"Name" : "v_mix_422_to_444_false_2_U0", "RefName" : "v_mix_422_to_444_false_2","ID" : "24","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_103_1","RefName" : "VITIS_LOOP_103_1","ID" : "25","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_v_mix_422_to_444_false_2_Pipeline_VITIS_LOOP_105_2_fu_74", "RefName" : "v_mix_422_to_444_false_2_Pipeline_VITIS_LOOP_105_2","ID" : "26","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_105_2","RefName" : "VITIS_LOOP_105_2","ID" : "27","Type" : "pipeline"},]},]},]},
		{"Name" : "v_mix_420_to_422_false_U0", "RefName" : "v_mix_420_to_422_false_s","ID" : "28","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_74_1","RefName" : "VITIS_LOOP_74_1","ID" : "29","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_v_mix_420_to_422_false_Pipeline_VITIS_LOOP_76_2_fu_70", "RefName" : "v_mix_420_to_422_false_Pipeline_VITIS_LOOP_76_2","ID" : "30","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_76_2","RefName" : "VITIS_LOOP_76_2","ID" : "31","Type" : "pipeline"},]},]},]},
		{"Name" : "v_mix_yuv2rgb_false_3_U0", "RefName" : "v_mix_yuv2rgb_false_3","ID" : "32","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_895_1","RefName" : "VITIS_LOOP_895_1","ID" : "33","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_v_mix_yuv2rgb_false_3_Pipeline_VITIS_LOOP_897_2_fu_74", "RefName" : "v_mix_yuv2rgb_false_3_Pipeline_VITIS_LOOP_897_2","ID" : "34","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_897_2","RefName" : "VITIS_LOOP_897_2","ID" : "35","Type" : "pipeline"},]},]},]},
		{"Name" : "v_mix_422_to_444_false_U0", "RefName" : "v_mix_422_to_444_false_s","ID" : "36","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_103_1","RefName" : "VITIS_LOOP_103_1","ID" : "37","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_v_mix_422_to_444_false_Pipeline_VITIS_LOOP_105_2_fu_70", "RefName" : "v_mix_422_to_444_false_Pipeline_VITIS_LOOP_105_2","ID" : "38","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_105_2","RefName" : "VITIS_LOOP_105_2","ID" : "39","Type" : "pipeline"},]},]},]},
		{"Name" : "v_mix_yuv2rgb_false_U0", "RefName" : "v_mix_yuv2rgb_false_s","ID" : "40","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_895_1","RefName" : "VITIS_LOOP_895_1","ID" : "41","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_v_mix_yuv2rgb_false_Pipeline_VITIS_LOOP_897_2_fu_70", "RefName" : "v_mix_yuv2rgb_false_Pipeline_VITIS_LOOP_897_2","ID" : "42","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_897_2","RefName" : "VITIS_LOOP_897_2","ID" : "43","Type" : "pipeline"},]},]},]},
		{"Name" : "v_mix_upsample_true_U0", "RefName" : "v_mix_upsample_true_s","ID" : "44","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_136_1","RefName" : "VITIS_LOOP_136_1","ID" : "45","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_v_mix_upsample_true_Pipeline_VITIS_LOOP_140_2_fu_86", "RefName" : "v_mix_upsample_true_Pipeline_VITIS_LOOP_140_2","ID" : "46","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_140_2","RefName" : "VITIS_LOOP_140_2","ID" : "47","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "grp_reg_ap_uint_8_s_fu_305", "RefName" : "reg_ap_uint_8_s","ID" : "48","Type" : "pipeline"},
					{"Name" : "grp_reg_ap_uint_8_s_fu_311", "RefName" : "reg_ap_uint_8_s","ID" : "49","Type" : "pipeline"},
					{"Name" : "grp_reg_ap_uint_8_s_fu_317", "RefName" : "reg_ap_uint_8_s","ID" : "50","Type" : "pipeline"},]},]},]},]},
		{"Name" : "v_mix_core_alpha_true_false_U0", "RefName" : "v_mix_core_alpha_true_false_s","ID" : "51","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_reg_unsigned_short_s_fu_194", "RefName" : "reg_unsigned_short_s","ID" : "52","Type" : "pipeline"},],
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_393_2","RefName" : "VITIS_LOOP_393_2","ID" : "53","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_v_mix_core_alpha_true_false_Pipeline_VITIS_LOOP_395_3_fu_170", "RefName" : "v_mix_core_alpha_true_false_Pipeline_VITIS_LOOP_395_3","ID" : "54","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_395_3","RefName" : "VITIS_LOOP_395_3","ID" : "55","Type" : "pipeline"},]},]},]},
		{"Name" : "v_mix_rgb2yuv_false_U0", "RefName" : "v_mix_rgb2yuv_false_s","ID" : "56","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_1040_1","RefName" : "VITIS_LOOP_1040_1","ID" : "57","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_v_mix_rgb2yuv_false_Pipeline_VITIS_LOOP_1042_2_fu_62", "RefName" : "v_mix_rgb2yuv_false_Pipeline_VITIS_LOOP_1042_2","ID" : "58","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_1042_2","RefName" : "VITIS_LOOP_1042_2","ID" : "59","Type" : "pipeline"},]},]},]},
		{"Name" : "v_mix_444_to_422_false_U0", "RefName" : "v_mix_444_to_422_false_s","ID" : "60","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_716_1","RefName" : "VITIS_LOOP_716_1","ID" : "61","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_v_mix_444_to_422_false_Pipeline_VITIS_LOOP_718_2_fu_62", "RefName" : "v_mix_444_to_422_false_Pipeline_VITIS_LOOP_718_2","ID" : "62","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_718_2","RefName" : "VITIS_LOOP_718_2","ID" : "63","Type" : "pipeline"},]},]},]},
		{"Name" : "v_mix_422_to_420_false_U0", "RefName" : "v_mix_422_to_420_false_s","ID" : "64","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_506_1","RefName" : "VITIS_LOOP_506_1","ID" : "65","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_v_mix_422_to_420_false_Pipeline_VITIS_LOOP_508_2_fu_62", "RefName" : "v_mix_422_to_420_false_Pipeline_VITIS_LOOP_508_2","ID" : "66","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_508_2","RefName" : "VITIS_LOOP_508_2","ID" : "67","Type" : "pipeline"},]},]},]},
		{"Name" : "MultiPixStream2AXIvideo_U0", "RefName" : "MultiPixStream2AXIvideo","ID" : "68","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_reg_unsigned_short_1_fu_120", "RefName" : "reg_unsigned_short_1","ID" : "69","Type" : "pipeline"},
			{"Name" : "grp_reg_unsigned_short_1_fu_126", "RefName" : "reg_unsigned_short_1","ID" : "70","Type" : "pipeline"},],
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_3901_2","RefName" : "VITIS_LOOP_3901_2","ID" : "71","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_3903_3_fu_96", "RefName" : "MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_3903_3","ID" : "72","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_3903_3","RefName" : "VITIS_LOOP_3903_3","ID" : "73","Type" : "pipeline"},]},]},]},]},],
"SubLoops" : [
	{"Name" : "VITIS_LOOP_3296_1","RefName" : "VITIS_LOOP_3296_1","ID" : "74","Type" : "pipeline"},]
}]}