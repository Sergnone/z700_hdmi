# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 170 \
    name outLayer0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_outLayer0 \
    op interface \
    ports { outLayer0_dout { I 24 vector } outLayer0_empty_n { I 1 bit } outLayer0_read { O 1 bit } outLayer0_num_data_valid { I 3 vector } outLayer0_fifo_cap { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 171 \
    name srcLayer1x \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_srcLayer1x \
    op interface \
    ports { srcLayer1x_dout { I 24 vector } srcLayer1x_empty_n { I 1 bit } srcLayer1x_read { O 1 bit } srcLayer1x_num_data_valid { I 3 vector } srcLayer1x_fifo_cap { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 172 \
    name srcLayer1Alphax \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_srcLayer1Alphax \
    op interface \
    ports { srcLayer1Alphax_dout { I 8 vector } srcLayer1Alphax_empty_n { I 1 bit } srcLayer1Alphax_read { O 1 bit } srcLayer1Alphax_num_data_valid { I 5 vector } srcLayer1Alphax_fifo_cap { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 173 \
    name hwReg_width_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hwReg_width_val \
    op interface \
    ports { hwReg_width_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 174 \
    name hwReg_height_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hwReg_height_val \
    op interface \
    ports { hwReg_height_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 175 \
    name hwReg_background_Y_R_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hwReg_background_Y_R_val \
    op interface \
    ports { hwReg_background_Y_R_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 176 \
    name hwReg_background_U_G_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hwReg_background_U_G_val \
    op interface \
    ports { hwReg_background_U_G_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 177 \
    name hwReg_background_V_B_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hwReg_background_V_B_val \
    op interface \
    ports { hwReg_background_V_B_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 178 \
    name hwReg_layerEnable_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hwReg_layerEnable_val \
    op interface \
    ports { hwReg_layerEnable_val { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 179 \
    name hwReg_layerAlpha_1_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hwReg_layerAlpha_1_val \
    op interface \
    ports { hwReg_layerAlpha_1_val { I 9 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 180 \
    name hwReg_layerStartX_1_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hwReg_layerStartX_1_val \
    op interface \
    ports { hwReg_layerStartX_1_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 181 \
    name hwReg_layerStartY_1_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hwReg_layerStartY_1_val \
    op interface \
    ports { hwReg_layerStartY_1_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 182 \
    name hwReg_layerWidth_1_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hwReg_layerWidth_1_val \
    op interface \
    ports { hwReg_layerWidth_1_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 183 \
    name hwReg_layerHeight_1_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hwReg_layerHeight_1_val \
    op interface \
    ports { hwReg_layerHeight_1_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 184 \
    name hwReg_layerScaleFactor_1_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hwReg_layerScaleFactor_1_val \
    op interface \
    ports { hwReg_layerScaleFactor_1_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 185 \
    name outLayer1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_outLayer1 \
    op interface \
    ports { outLayer1_din { O 24 vector } outLayer1_full_n { I 1 bit } outLayer1_write { O 1 bit } outLayer1_num_data_valid { I 32 vector } outLayer1_fifo_cap { I 32 vector } } \
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


