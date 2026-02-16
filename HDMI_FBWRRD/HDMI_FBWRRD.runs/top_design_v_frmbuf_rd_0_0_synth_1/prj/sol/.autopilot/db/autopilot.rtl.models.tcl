set SynModuleInfo {
  {SRCNAME AXIMMvideo2Bytes_Pipeline_VITIS_LOOP_515_1 MODELNAME AXIMMvideo2Bytes_Pipeline_VITIS_LOOP_515_1 RTLNAME top_design_v_frmbuf_rd_0_0_AXIMMvideo2Bytes_Pipeline_VITIS_LOOP_515_1
    SUBMODULES {
      {MODELNAME top_design_v_frmbuf_rd_0_0_flow_control_loop_pipe_sequential_init RTLNAME top_design_v_frmbuf_rd_0_0_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME top_design_v_frmbuf_rd_0_0_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME AXIMMvideo2Bytes MODELNAME AXIMMvideo2Bytes RTLNAME top_design_v_frmbuf_rd_0_0_AXIMMvideo2Bytes}
  {SRCNAME Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1240_1 MODELNAME Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1240_1 RTLNAME top_design_v_frmbuf_rd_0_0_Bytes2MultiPixStream_Pipeline_VITIS_LOOP_1240_1}
  {SRCNAME Bytes2MultiPixStream MODELNAME Bytes2MultiPixStream RTLNAME top_design_v_frmbuf_rd_0_0_Bytes2MultiPixStream
    SUBMODULES {
      {MODELNAME top_design_v_frmbuf_rd_0_0_urem_10ns_3ns_2_14_seq_1 RTLNAME top_design_v_frmbuf_rd_0_0_urem_10ns_3ns_2_14_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 13 ALLOW_PRAGMA 1}
      {MODELNAME top_design_v_frmbuf_rd_0_0_mul_10ns_12ns_21_1_1 RTLNAME top_design_v_frmbuf_rd_0_0_mul_10ns_12ns_21_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME {reg<unsigned short>} MODELNAME reg_unsigned_short_s RTLNAME top_design_v_frmbuf_rd_0_0_reg_unsigned_short_s}
  {SRCNAME MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_367_1 MODELNAME MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_367_1 RTLNAME top_design_v_frmbuf_rd_0_0_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_367_1
    SUBMODULES {
      {MODELNAME top_design_v_frmbuf_rd_0_0_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_367_1_mapComp_ROM_AUTO_1R RTLNAME top_design_v_frmbuf_rd_0_0_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_367_1_mapComp_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_376_3 MODELNAME MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_376_3 RTLNAME top_design_v_frmbuf_rd_0_0_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_376_3
    SUBMODULES {
      {MODELNAME top_design_v_frmbuf_rd_0_0_sparsemux_7_2_8_1_1 RTLNAME top_design_v_frmbuf_rd_0_0_sparsemux_7_2_8_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
    }
  }
  {SRCNAME MultiPixStream2AXIvideo MODELNAME MultiPixStream2AXIvideo RTLNAME top_design_v_frmbuf_rd_0_0_MultiPixStream2AXIvideo}
  {SRCNAME FrmbufRdHlsDataFlow MODELNAME FrmbufRdHlsDataFlow RTLNAME top_design_v_frmbuf_rd_0_0_FrmbufRdHlsDataFlow
    SUBMODULES {
      {MODELNAME top_design_v_frmbuf_rd_0_0_fifo_w64_d321_B RTLNAME top_design_v_frmbuf_rd_0_0_fifo_w64_d321_B BINDTYPE storage TYPE fifo IMPL bram ALLOW_PRAGMA 1 INSTNAME bytePlanes_U}
      {MODELNAME top_design_v_frmbuf_rd_0_0_fifo_w24_d2_S RTLNAME top_design_v_frmbuf_rd_0_0_fifo_w24_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME img_U}
      {MODELNAME top_design_v_frmbuf_rd_0_0_start_for_Bytes2MultiPixStream_U0 RTLNAME top_design_v_frmbuf_rd_0_0_start_for_Bytes2MultiPixStream_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Bytes2MultiPixStream_U0_U}
      {MODELNAME top_design_v_frmbuf_rd_0_0_start_for_MultiPixStream2AXIvideo_U0 RTLNAME top_design_v_frmbuf_rd_0_0_start_for_MultiPixStream2AXIvideo_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_MultiPixStream2AXIvideo_U0_U}
    }
  }
  {SRCNAME v_frmbuf_rd MODELNAME v_frmbuf_rd RTLNAME top_design_v_frmbuf_rd_0_0_v_frmbuf_rd IS_TOP 1
    SUBMODULES {
      {MODELNAME top_design_v_frmbuf_rd_0_0_mul_13s_3ns_13_1_1 RTLNAME top_design_v_frmbuf_rd_0_0_mul_13s_3ns_13_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME top_design_v_frmbuf_rd_0_0_BYTES_PER_PIXEL_ROM_AUTO_1R RTLNAME top_design_v_frmbuf_rd_0_0_BYTES_PER_PIXEL_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_design_v_frmbuf_rd_0_0_MEMORY2LIVE_ROM_AUTO_1R RTLNAME top_design_v_frmbuf_rd_0_0_MEMORY2LIVE_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_design_v_frmbuf_rd_0_0_mm_video_m_axi RTLNAME top_design_v_frmbuf_rd_0_0_mm_video_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME top_design_v_frmbuf_rd_0_0_CTRL_s_axi RTLNAME top_design_v_frmbuf_rd_0_0_CTRL_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME top_design_v_frmbuf_rd_0_0_regslice_both RTLNAME top_design_v_frmbuf_rd_0_0_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
