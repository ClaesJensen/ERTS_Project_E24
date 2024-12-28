# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set port_coeffs {
in0b0_a0_V { 
	dir I
	width 27
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
in0b1_a0_V { 
	dir I
	width 27
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
in0b2_a0_V { 
	dir I
	width 27
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
in0a1_a0_V { 
	dir I
	width 27
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
in0a2_a0_V { 
	dir I
	width 27
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
}


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 0 \
			corename Biquadv2coeffs_coeffs_axilite \
			name Biquadv2coeffs_coeffs_s_axi \
			ports {$port_coeffs} \
			op interface \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'coeffs'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler Biquadv2coeffs_coeffs_s_axi
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1 \
    name out0b0_a0_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_out0b0_a0_V \
    op interface \
    ports { out0b0_a0_V { O 27 vector } out0b0_a0_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name out0b1_a0_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_out0b1_a0_V \
    op interface \
    ports { out0b1_a0_V { O 27 vector } out0b1_a0_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name out0b2_a0_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_out0b2_a0_V \
    op interface \
    ports { out0b2_a0_V { O 27 vector } out0b2_a0_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name out0a1_a0_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_out0a1_a0_V \
    op interface \
    ports { out0a1_a0_V { O 27 vector } out0a1_a0_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name out0a2_a0_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_out0a2_a0_V \
    op interface \
    ports { out0a2_a0_V { O 27 vector } out0a2_a0_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 0 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


