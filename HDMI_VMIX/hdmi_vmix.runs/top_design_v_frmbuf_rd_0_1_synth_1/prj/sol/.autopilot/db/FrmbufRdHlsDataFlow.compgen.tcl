# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler top_design_v_frmbuf_rd_0_1_fifo_w64_d481_B BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {bytePlanes_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler top_design_v_frmbuf_rd_0_1_fifo_w24_d2_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {img_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler top_design_v_frmbuf_rd_0_1_start_for_Bytes2MultiPixStream_U0 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {start_for_Bytes2MultiPixStream_U0_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler top_design_v_frmbuf_rd_0_1_start_for_MultiPixStream2AXIvideo_U0 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {start_for_MultiPixStream2AXIvideo_U0_U}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 73 \
    name m_axis_video_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_video} \
    metadata {  } \
    op interface \
    ports { m_axis_video_TDATA { O 24 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_video_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 74 \
    name m_axis_video_V_keep_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_video} \
    metadata {  } \
    op interface \
    ports { m_axis_video_TKEEP { O 3 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_video_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 75 \
    name m_axis_video_V_strb_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_video} \
    metadata {  } \
    op interface \
    ports { m_axis_video_TSTRB { O 3 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_video_V_strb_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 76 \
    name m_axis_video_V_user_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_video} \
    metadata {  } \
    op interface \
    ports { m_axis_video_TUSER { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_video_V_user_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 77 \
    name m_axis_video_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_video} \
    metadata {  } \
    op interface \
    ports { m_axis_video_TLAST { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_video_V_last_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 78 \
    name m_axis_video_V_id_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_video} \
    metadata {  } \
    op interface \
    ports { m_axis_video_TID { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_video_V_id_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 79 \
    name m_axis_video_V_dest_V \
    reset_level 1 \
    sync_rst true \
    corename {m_axis_video} \
    metadata {  } \
    op interface \
    ports { m_axis_video_TDEST { O 1 vector } m_axis_video_TVALID { O 1 bit } m_axis_video_TREADY { I 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_video_V_dest_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name mm_video \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mm_video \
    op interface \
    ports { m_axi_mm_video_0_AWVALID { O 1 bit } m_axi_mm_video_0_AWREADY { I 1 bit } m_axi_mm_video_0_AWADDR { O 32 vector } m_axi_mm_video_0_AWID { O 1 vector } m_axi_mm_video_0_AWLEN { O 32 vector } m_axi_mm_video_0_AWSIZE { O 3 vector } m_axi_mm_video_0_AWBURST { O 2 vector } m_axi_mm_video_0_AWLOCK { O 2 vector } m_axi_mm_video_0_AWCACHE { O 4 vector } m_axi_mm_video_0_AWPROT { O 3 vector } m_axi_mm_video_0_AWQOS { O 4 vector } m_axi_mm_video_0_AWREGION { O 4 vector } m_axi_mm_video_0_AWUSER { O 1 vector } m_axi_mm_video_0_WVALID { O 1 bit } m_axi_mm_video_0_WREADY { I 1 bit } m_axi_mm_video_0_WDATA { O 64 vector } m_axi_mm_video_0_WSTRB { O 8 vector } m_axi_mm_video_0_WLAST { O 1 bit } m_axi_mm_video_0_WID { O 1 vector } m_axi_mm_video_0_WUSER { O 1 vector } m_axi_mm_video_0_ARVALID { O 1 bit } m_axi_mm_video_0_ARREADY { I 1 bit } m_axi_mm_video_0_ARADDR { O 32 vector } m_axi_mm_video_0_ARID { O 1 vector } m_axi_mm_video_0_ARLEN { O 32 vector } m_axi_mm_video_0_ARSIZE { O 3 vector } m_axi_mm_video_0_ARBURST { O 2 vector } m_axi_mm_video_0_ARLOCK { O 2 vector } m_axi_mm_video_0_ARCACHE { O 4 vector } m_axi_mm_video_0_ARPROT { O 3 vector } m_axi_mm_video_0_ARQOS { O 4 vector } m_axi_mm_video_0_ARREGION { O 4 vector } m_axi_mm_video_0_ARUSER { O 1 vector } m_axi_mm_video_0_RVALID { I 1 bit } m_axi_mm_video_0_RREADY { O 1 bit } m_axi_mm_video_0_RDATA { I 64 vector } m_axi_mm_video_0_RLAST { I 1 bit } m_axi_mm_video_0_RID { I 1 vector } m_axi_mm_video_0_RFIFONUM { I 7 vector } m_axi_mm_video_0_RUSER { I 1 vector } m_axi_mm_video_0_RRESP { I 2 vector } m_axi_mm_video_0_BVALID { I 1 bit } m_axi_mm_video_0_BREADY { O 1 bit } m_axi_mm_video_0_BRESP { I 2 vector } m_axi_mm_video_0_BID { I 1 vector } m_axi_mm_video_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 81 \
    name HwReg_frm_buffer \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_HwReg_frm_buffer \
    op interface \
    ports { HwReg_frm_buffer { I 32 vector } HwReg_frm_buffer_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 82 \
    name width_val2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_width_val2 \
    op interface \
    ports { width_val2 { I 11 vector } width_val2_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 83 \
    name height_val6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_height_val6 \
    op interface \
    ports { height_val6 { I 11 vector } height_val6_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 84 \
    name stride_val7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stride_val7 \
    op interface \
    ports { stride_val7 { I 16 vector } stride_val7_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 85 \
    name video_format_val8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_video_format_val8 \
    op interface \
    ports { video_format_val8 { I 6 vector } video_format_val8_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 86 \
    name WidthInBytes_val10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_WidthInBytes_val10 \
    op interface \
    ports { WidthInBytes_val10 { I 14 vector } WidthInBytes_val10_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 87 \
    name colorFormat_val11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_colorFormat_val11 \
    op interface \
    ports { colorFormat_val11 { I 3 vector } colorFormat_val11_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


