# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler design_1_v_frmbuf_rd_0_0_partselect_8ns_64ns_6ns_8_1_1 BINDTYPE {op} TYPE {partselect} IMPL {auto}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name loopWidth_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_loopWidth_1 \
    op interface \
    ports { loopWidth_1 { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 129 \
    name icmp_ln849 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_ln849 \
    op interface \
    ports { icmp_ln849 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 130 \
    name icmp_ln928_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_ln928_5 \
    op interface \
    ports { icmp_ln928_5 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 131 \
    name icmp_ln928_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_ln928_4 \
    op interface \
    ports { icmp_ln928_4 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name icmp_ln928_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_ln928_3 \
    op interface \
    ports { icmp_ln928_3 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name icmp17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp17 \
    op interface \
    ports { icmp17 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name icmp_ln928_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_ln928_1 \
    op interface \
    ports { icmp_ln928_1 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 135 \
    name sext_ln928 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln928 \
    op interface \
    ports { sext_ln928 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name img \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_img \
    op interface \
    ports { img_din { O 24 vector } img_full_n { I 1 bit } img_write { O 1 bit } img_num_data_valid { I 32 vector } img_fifo_cap { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name icmp14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp14 \
    op interface \
    ports { icmp14 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name bytePlanes_plane1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bytePlanes_plane1 \
    op interface \
    ports { bytePlanes_plane1_dout { I 64 vector } bytePlanes_plane1_empty_n { I 1 bit } bytePlanes_plane1_read { O 1 bit } bytePlanes_plane1_num_data_valid { I 10 vector } bytePlanes_plane1_fifo_cap { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 139 \
    name bytePlanes_plane2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bytePlanes_plane2 \
    op interface \
    ports { bytePlanes_plane2_dout { I 64 vector } bytePlanes_plane2_empty_n { I 1 bit } bytePlanes_plane2_read { O 1 bit } bytePlanes_plane2_num_data_valid { I 10 vector } bytePlanes_plane2_fifo_cap { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 140 \
    name bytePlanes_plane0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bytePlanes_plane0 \
    op interface \
    ports { bytePlanes_plane0_dout { I 64 vector } bytePlanes_plane0_empty_n { I 1 bit } bytePlanes_plane0_read { O 1 bit } bytePlanes_plane0_num_data_valid { I 10 vector } bytePlanes_plane0_fifo_cap { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 141 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 142 \
    name pixV_1_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pixV_1_out \
    op interface \
    ports { pixV_1_out_i { I 64 vector } pixV_1_out_o { O 64 vector } pixV_1_out_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 143 \
    name pixU_1_out \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pixU_1_out \
    op interface \
    ports { pixU_1_out_i { I 64 vector } pixU_1_out_o { O 64 vector } pixU_1_out_o_ap_vld { O 1 bit } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
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


# flow_control definition:
set InstName design_1_v_frmbuf_rd_0_0_flow_control_loop_pipe_sequential_init_U
set CompName design_1_v_frmbuf_rd_0_0_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix design_1_v_frmbuf_rd_0_0_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


