set SynModuleInfo {
  {SRCNAME {reg<unsigned short>} MODELNAME reg_unsigned_short_s RTLNAME top_design_v_frmbuf_wr_0_0_reg_unsigned_short_s}
  {SRCNAME AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start MODELNAME AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start RTLNAME top_design_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start
    SUBMODULES {
      {MODELNAME top_design_v_frmbuf_wr_0_0_flow_control_loop_pipe_sequential_init RTLNAME top_design_v_frmbuf_wr_0_0_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME top_design_v_frmbuf_wr_0_0_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME AXIvideo2MultiPixStream_Pipeline_loop_width MODELNAME AXIvideo2MultiPixStream_Pipeline_loop_width RTLNAME top_design_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_width}
  {SRCNAME AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol MODELNAME AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol RTLNAME top_design_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol}
  {SRCNAME AXIvideo2MultiPixStream MODELNAME AXIvideo2MultiPixStream RTLNAME top_design_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream}
  {SRCNAME MultiPixStream2Bytes_Pipeline_VITIS_LOOP_1090_1 MODELNAME MultiPixStream2Bytes_Pipeline_VITIS_LOOP_1090_1 RTLNAME top_design_v_frmbuf_wr_0_0_MultiPixStream2Bytes_Pipeline_VITIS_LOOP_1090_1}
  {SRCNAME MultiPixStream2Bytes MODELNAME MultiPixStream2Bytes RTLNAME top_design_v_frmbuf_wr_0_0_MultiPixStream2Bytes
    SUBMODULES {
      {MODELNAME top_design_v_frmbuf_wr_0_0_mul_11ns_13ns_23_1_1 RTLNAME top_design_v_frmbuf_wr_0_0_mul_11ns_13ns_23_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Bytes2AXIMMvideo_Pipeline_VITIS_LOOP_1552_1 MODELNAME Bytes2AXIMMvideo_Pipeline_VITIS_LOOP_1552_1 RTLNAME top_design_v_frmbuf_wr_0_0_Bytes2AXIMMvideo_Pipeline_VITIS_LOOP_1552_1}
  {SRCNAME Bytes2AXIMMvideo MODELNAME Bytes2AXIMMvideo RTLNAME top_design_v_frmbuf_wr_0_0_Bytes2AXIMMvideo}
  {SRCNAME FrmbufWrHlsDataFlow MODELNAME FrmbufWrHlsDataFlow RTLNAME top_design_v_frmbuf_wr_0_0_FrmbufWrHlsDataFlow
    SUBMODULES {
      {MODELNAME top_design_v_frmbuf_wr_0_0_fifo_w24_d2_S RTLNAME top_design_v_frmbuf_wr_0_0_fifo_w24_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME img_U}
      {MODELNAME top_design_v_frmbuf_wr_0_0_fifo_w64_d481_B RTLNAME top_design_v_frmbuf_wr_0_0_fifo_w64_d481_B BINDTYPE storage TYPE fifo IMPL bram ALLOW_PRAGMA 1 INSTNAME bytePlanes_U}
      {MODELNAME top_design_v_frmbuf_wr_0_0_start_for_MultiPixStream2Bytes_U0 RTLNAME top_design_v_frmbuf_wr_0_0_start_for_MultiPixStream2Bytes_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_MultiPixStream2Bytes_U0_U}
      {MODELNAME top_design_v_frmbuf_wr_0_0_start_for_Bytes2AXIMMvideo_U0 RTLNAME top_design_v_frmbuf_wr_0_0_start_for_Bytes2AXIMMvideo_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_Bytes2AXIMMvideo_U0_U}
    }
  }
  {SRCNAME v_frmbuf_wr MODELNAME v_frmbuf_wr RTLNAME top_design_v_frmbuf_wr_0_0_v_frmbuf_wr IS_TOP 1
    SUBMODULES {
      {MODELNAME top_design_v_frmbuf_wr_0_0_mul_14s_3ns_14_1_1 RTLNAME top_design_v_frmbuf_wr_0_0_mul_14s_3ns_14_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME top_design_v_frmbuf_wr_0_0_BYTES_PER_PIXEL_ROM_AUTO_1R RTLNAME top_design_v_frmbuf_wr_0_0_BYTES_PER_PIXEL_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_design_v_frmbuf_wr_0_0_MEMORY2LIVE_ROM_AUTO_1R RTLNAME top_design_v_frmbuf_wr_0_0_MEMORY2LIVE_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_design_v_frmbuf_wr_0_0_mm_video_m_axi RTLNAME top_design_v_frmbuf_wr_0_0_mm_video_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME top_design_v_frmbuf_wr_0_0_CTRL_s_axi RTLNAME top_design_v_frmbuf_wr_0_0_CTRL_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME top_design_v_frmbuf_wr_0_0_regslice_both RTLNAME top_design_v_frmbuf_wr_0_0_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
