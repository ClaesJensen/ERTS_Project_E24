// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.2
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _biquadv2between_HH_
#define _biquadv2between_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "biquadv2between_mcud.h"
#include "biquadv2between_abkb.h"
#include "biquadv2between_biquadv2_s_axi.h"

namespace ap_rtl {

template<unsigned int C_S_AXI_BIQUADV2_ADDR_WIDTH = 6,
         unsigned int C_S_AXI_BIQUADV2_DATA_WIDTH = 32>
struct biquadv2between : public sc_module {
    // Port declarations 31
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst_n;
    sc_in< sc_lv<24> > inDataLeft_V;
    sc_in< sc_logic > inDataLeft_V_ap_vld;
    sc_out< sc_logic > inDataLeft_V_ap_ack;
    sc_in< sc_lv<24> > inDataRight_V;
    sc_in< sc_logic > inDataRight_V_ap_vld;
    sc_out< sc_logic > inDataRight_V_ap_ack;
    sc_out< sc_lv<24> > outDataLeft_V;
    sc_out< sc_logic > outDataLeft_V_ap_vld;
    sc_in< sc_logic > outDataLeft_V_ap_ack;
    sc_out< sc_lv<24> > outDataRight_V;
    sc_out< sc_logic > outDataRight_V_ap_vld;
    sc_in< sc_logic > outDataRight_V_ap_ack;
    sc_in< sc_logic > s_axi_biquadv2_AWVALID;
    sc_out< sc_logic > s_axi_biquadv2_AWREADY;
    sc_in< sc_uint<C_S_AXI_BIQUADV2_ADDR_WIDTH> > s_axi_biquadv2_AWADDR;
    sc_in< sc_logic > s_axi_biquadv2_WVALID;
    sc_out< sc_logic > s_axi_biquadv2_WREADY;
    sc_in< sc_uint<C_S_AXI_BIQUADV2_DATA_WIDTH> > s_axi_biquadv2_WDATA;
    sc_in< sc_uint<C_S_AXI_BIQUADV2_DATA_WIDTH/8> > s_axi_biquadv2_WSTRB;
    sc_in< sc_logic > s_axi_biquadv2_ARVALID;
    sc_out< sc_logic > s_axi_biquadv2_ARREADY;
    sc_in< sc_uint<C_S_AXI_BIQUADV2_ADDR_WIDTH> > s_axi_biquadv2_ARADDR;
    sc_out< sc_logic > s_axi_biquadv2_RVALID;
    sc_in< sc_logic > s_axi_biquadv2_RREADY;
    sc_out< sc_uint<C_S_AXI_BIQUADV2_DATA_WIDTH> > s_axi_biquadv2_RDATA;
    sc_out< sc_lv<2> > s_axi_biquadv2_RRESP;
    sc_out< sc_logic > s_axi_biquadv2_BVALID;
    sc_in< sc_logic > s_axi_biquadv2_BREADY;
    sc_out< sc_lv<2> > s_axi_biquadv2_BRESP;
    sc_signal< sc_logic > ap_var_for_const0;


    // Module declarations
    biquadv2between(sc_module_name name);
    SC_HAS_PROCESS(biquadv2between);

    ~biquadv2between();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    biquadv2between_abkb* array_r_U;
    biquadv2between_biquadv2_s_axi<C_S_AXI_BIQUADV2_ADDR_WIDTH,C_S_AXI_BIQUADV2_DATA_WIDTH>* biquadv2between_biquadv2_s_axi_U;
    biquadv2between_mcud<1,2,27,24,51>* biquadv2between_mcud_U0;
    sc_signal< sc_logic > ap_rst_n_inv;
    sc_signal< sc_lv<27> > b0_a0_V;
    sc_signal< sc_lv<27> > b1_a0_V;
    sc_signal< sc_lv<27> > b2_a0_V;
    sc_signal< sc_lv<27> > a1_a0_V;
    sc_signal< sc_lv<27> > a2_a0_V;
    sc_signal< sc_lv<4> > array_r_address0;
    sc_signal< sc_logic > array_r_ce0;
    sc_signal< sc_logic > array_r_we0;
    sc_signal< sc_lv<27> > array_r_d0;
    sc_signal< sc_lv<27> > array_r_q0;
    sc_signal< sc_lv<4> > array_r_address1;
    sc_signal< sc_logic > array_r_ce1;
    sc_signal< sc_logic > array_r_we1;
    sc_signal< sc_lv<27> > array_r_d1;
    sc_signal< sc_lv<27> > array_r_q1;
    sc_signal< sc_logic > inDataLeft_V_blk_n;
    sc_signal< sc_lv<17> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_logic > inDataRight_V_blk_n;
    sc_signal< sc_logic > outDataLeft_V_blk_n;
    sc_signal< sc_logic > ap_CS_fsm_state16;
    sc_signal< sc_logic > outDataRight_V_blk_n;
    sc_signal< sc_lv<51> > grp_fu_279_p2;
    sc_signal< sc_lv<51> > reg_301;
    sc_signal< sc_logic > ap_CS_fsm_state8;
    sc_signal< sc_logic > ap_CS_fsm_state9;
    sc_signal< sc_lv<24> > inDataRight_V_read_reg_863;
    sc_signal< bool > ap_block_state1;
    sc_signal< sc_lv<24> > inDataLeft_V_read_reg_868;
    sc_signal< sc_lv<27> > a2_a0_V_read_reg_873;
    sc_signal< sc_lv<27> > a1_a0_V_read_reg_878;
    sc_signal< sc_lv<27> > b2_a0_V_read_reg_883;
    sc_signal< sc_lv<27> > inDataLeft_V_trunc_fu_305_p1;
    sc_signal< sc_lv<27> > inDataLeft_V_trunc_reg_888;
    sc_signal< sc_logic > ap_CS_fsm_state4;
    sc_signal< sc_lv<27> > inDataRight_V_trunc_fu_309_p1;
    sc_signal< sc_lv<27> > inDataRight_V_trunc_reg_893;
    sc_signal< sc_lv<3> > i_V_fu_319_p2;
    sc_signal< sc_lv<3> > i_V_reg_901;
    sc_signal< sc_logic > ap_CS_fsm_state5;
    sc_signal< sc_lv<4> > tmp_3_cast_fu_330_p1;
    sc_signal< sc_lv<4> > tmp_3_cast_reg_906;
    sc_signal< sc_lv<1> > tmp_2_fu_313_p2;
    sc_signal< sc_lv<27> > array_load_4_reg_921;
    sc_signal< sc_logic > ap_CS_fsm_state6;
    sc_signal< sc_lv<24> > tmp_20_fu_345_p1;
    sc_signal< sc_lv<24> > tmp_20_reg_926;
    sc_signal< sc_lv<51> > OP1_V_fu_359_p1;
    sc_signal< sc_lv<51> > OP1_V_reg_936;
    sc_signal< sc_logic > ap_CS_fsm_state7;
    sc_signal< sc_lv<51> > OP2_V_fu_363_p1;
    sc_signal< sc_lv<24> > tmp_26_fu_367_p1;
    sc_signal< sc_lv<24> > tmp_26_reg_946;
    sc_signal< sc_lv<1> > tmp_22_reg_951;
    sc_signal< sc_lv<51> > OP2_V_1_fu_371_p1;
    sc_signal< sc_lv<51> > p_Val2_2_fu_387_p2;
    sc_signal< sc_lv<51> > p_Val2_2_reg_961;
    sc_signal< sc_lv<1> > signbit_reg_966;
    sc_signal< sc_lv<24> > p_Val2_4_fu_422_p2;
    sc_signal< sc_lv<24> > p_Val2_4_reg_972;
    sc_signal< sc_lv<1> > newsignbit_fu_428_p3;
    sc_signal< sc_lv<1> > newsignbit_reg_978;
    sc_signal< sc_lv<1> > carry_fu_442_p2;
    sc_signal< sc_lv<1> > carry_reg_984;
    sc_signal< sc_lv<1> > Range2_all_ones_fu_458_p2;
    sc_signal< sc_lv<1> > Range2_all_ones_reg_991;
    sc_signal< sc_lv<1> > Range1_all_ones_fu_474_p2;
    sc_signal< sc_lv<1> > Range1_all_ones_reg_996;
    sc_signal< sc_lv<1> > Range1_all_zeros_fu_480_p2;
    sc_signal< sc_lv<1> > Range1_all_zeros_reg_1003;
    sc_signal< sc_lv<1> > tmp_28_reg_1008;
    sc_signal< sc_lv<1> > p_38_i_i_fu_515_p2;
    sc_signal< sc_lv<1> > p_38_i_i_reg_1013;
    sc_signal< sc_logic > ap_CS_fsm_state10;
    sc_signal< sc_lv<1> > tmp_9_fu_530_p2;
    sc_signal< sc_lv<1> > tmp_9_reg_1018;
    sc_signal< sc_lv<1> > brmerge40_demorgan_i_fu_541_p2;
    sc_signal< sc_lv<1> > brmerge40_demorgan_i_reg_1023;
    sc_signal< sc_lv<1> > underflow_fu_558_p2;
    sc_signal< sc_lv<1> > underflow_reg_1028;
    sc_signal< sc_lv<1> > brmerge_i_i_i_fu_563_p2;
    sc_signal< sc_lv<1> > brmerge_i_i_i_reg_1033;
    sc_signal< sc_lv<51> > p_Val2_7_fu_581_p2;
    sc_signal< sc_lv<51> > p_Val2_7_reg_1038;
    sc_signal< sc_lv<1> > signbit_1_reg_1043;
    sc_signal< sc_lv<24> > p_Val2_9_fu_616_p2;
    sc_signal< sc_lv<24> > p_Val2_9_reg_1049;
    sc_signal< sc_lv<1> > newsignbit_1_fu_622_p3;
    sc_signal< sc_lv<1> > newsignbit_1_reg_1055;
    sc_signal< sc_lv<1> > carry_1_fu_636_p2;
    sc_signal< sc_lv<1> > carry_1_reg_1061;
    sc_signal< sc_lv<1> > Range2_all_ones_1_fu_652_p2;
    sc_signal< sc_lv<1> > Range2_all_ones_1_reg_1068;
    sc_signal< sc_lv<1> > Range1_all_ones_1_fu_668_p2;
    sc_signal< sc_lv<1> > Range1_all_ones_1_reg_1073;
    sc_signal< sc_lv<1> > Range1_all_zeros_1_fu_674_p2;
    sc_signal< sc_lv<1> > Range1_all_zeros_1_reg_1080;
    sc_signal< sc_lv<24> > resultLeft_V_fu_701_p3;
    sc_signal< sc_lv<24> > resultLeft_V_reg_1085;
    sc_signal< sc_logic > ap_CS_fsm_state11;
    sc_signal< sc_lv<1> > p_38_i_i1_fu_738_p2;
    sc_signal< sc_lv<1> > p_38_i_i1_reg_1090;
    sc_signal< sc_lv<1> > tmp_16_fu_753_p2;
    sc_signal< sc_lv<1> > tmp_16_reg_1095;
    sc_signal< sc_lv<1> > brmerge40_demorgan_i_1_fu_764_p2;
    sc_signal< sc_lv<1> > brmerge40_demorgan_i_1_reg_1100;
    sc_signal< sc_lv<1> > underflow_1_fu_781_p2;
    sc_signal< sc_lv<1> > underflow_1_reg_1105;
    sc_signal< sc_lv<1> > brmerge_i_i_i1_fu_786_p2;
    sc_signal< sc_lv<1> > brmerge_i_i_i1_reg_1110;
    sc_signal< sc_lv<24> > resultRight_V_fu_813_p3;
    sc_signal< sc_logic > ap_CS_fsm_state12;
    sc_signal< sc_lv<24> > tmp_4_fu_821_p1;
    sc_signal< sc_lv<24> > tmp_4_reg_1120;
    sc_signal< sc_logic > ap_CS_fsm_state13;
    sc_signal< sc_lv<24> > tmp_17_fu_825_p1;
    sc_signal< sc_lv<24> > tmp_17_reg_1125;
    sc_signal< sc_lv<24> > tmp_18_fu_838_p1;
    sc_signal< sc_lv<24> > tmp_18_reg_1130;
    sc_signal< sc_logic > ap_CS_fsm_state14;
    sc_signal< sc_lv<24> > tmp_19_fu_842_p1;
    sc_signal< sc_lv<24> > tmp_19_reg_1135;
    sc_signal< sc_lv<24> > p_Val2_5_reg_242;
    sc_signal< sc_lv<24> > p_Val2_s_reg_255;
    sc_signal< sc_lv<3> > p_s_reg_268;
    sc_signal< sc_lv<32> > tmp_3_fu_325_p1;
    sc_signal< sc_lv<32> > addr5_cast_fu_340_p1;
    sc_signal< sc_lv<32> > addr1_cast_fu_354_p1;
    sc_signal< sc_logic > ap_reg_ioackin_outDataLeft_V_ap_ack;
    sc_signal< sc_logic > ap_sig_ioackin_outDataLeft_V_ap_ack;
    sc_signal< sc_logic > ap_sig_ioackin_outDataRight_V_ap_ack;
    sc_signal< bool > ap_block_state16_io;
    sc_signal< sc_logic > ap_reg_ioackin_outDataRight_V_ap_ack;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    sc_signal< sc_logic > ap_CS_fsm_state3;
    sc_signal< sc_lv<27> > samples_V_load11_tru_fu_829_p1;
    sc_signal< sc_lv<27> > p_Val2_trunc_fu_833_p1;
    sc_signal< sc_logic > ap_CS_fsm_state15;
    sc_signal< sc_lv<27> > samples_V_load_114_t_fu_846_p1;
    sc_signal< sc_lv<27> > samples_V_load_217_t_fu_850_p1;
    sc_signal< sc_lv<27> > p_Val2_5_trunc_fu_854_p1;
    sc_signal< sc_logic > ap_CS_fsm_state17;
    sc_signal< sc_lv<27> > samples_V_load_320_t_fu_859_p1;
    sc_signal< sc_lv<27> > grp_fu_279_p0;
    sc_signal< sc_lv<24> > grp_fu_279_p1;
    sc_signal< sc_lv<4> > addr5_fu_334_p2;
    sc_signal< sc_lv<4> > addr1_fu_349_p2;
    sc_signal< sc_lv<48> > tmp_8_fu_375_p3;
    sc_signal< sc_lv<51> > tmp_8_cast_fu_383_p1;
    sc_signal< sc_lv<24> > p_Val2_3_fu_401_p4;
    sc_signal< sc_lv<24> > tmp_5_fu_411_p1;
    sc_signal< sc_lv<1> > tmp_23_fu_414_p3;
    sc_signal< sc_lv<1> > tmp_s_fu_436_p2;
    sc_signal< sc_lv<2> > tmp_6_fu_448_p4;
    sc_signal< sc_lv<3> > tmp_7_fu_464_p4;
    sc_signal< sc_lv<1> > tmp_25_fu_486_p3;
    sc_signal< sc_lv<1> > tmp_1_fu_498_p2;
    sc_signal< sc_lv<1> > p_41_i_i_fu_504_p2;
    sc_signal< sc_lv<1> > deleted_zeros_fu_493_p3;
    sc_signal< sc_lv<1> > p_not_i_i_fu_519_p2;
    sc_signal< sc_lv<1> > brmerge_i_i_fu_525_p2;
    sc_signal< sc_lv<1> > deleted_ones_fu_509_p3;
    sc_signal< sc_lv<1> > tmp_demorgan_fu_546_p2;
    sc_signal< sc_lv<1> > tmp_fu_552_p2;
    sc_signal< sc_lv<1> > overflow_fu_535_p2;
    sc_signal< sc_lv<48> > tmp_10_fu_569_p3;
    sc_signal< sc_lv<51> > tmp_13_cast_fu_577_p1;
    sc_signal< sc_lv<24> > p_Val2_8_fu_595_p4;
    sc_signal< sc_lv<24> > tmp_11_fu_605_p1;
    sc_signal< sc_lv<1> > tmp_29_fu_608_p3;
    sc_signal< sc_lv<1> > tmp_12_fu_630_p2;
    sc_signal< sc_lv<2> > tmp_13_fu_642_p4;
    sc_signal< sc_lv<3> > tmp_14_fu_658_p4;
    sc_signal< sc_lv<1> > tmp1_fu_680_p2;
    sc_signal< sc_lv<1> > underflow_not_fu_684_p2;
    sc_signal< sc_lv<24> > p_Val2_4_mux_fu_689_p3;
    sc_signal< sc_lv<24> > p_Val2_4_4_fu_695_p3;
    sc_signal< sc_lv<1> > tmp_31_fu_709_p3;
    sc_signal< sc_lv<1> > tmp_15_fu_721_p2;
    sc_signal< sc_lv<1> > p_41_i_i1_fu_727_p2;
    sc_signal< sc_lv<1> > deleted_zeros_1_fu_716_p3;
    sc_signal< sc_lv<1> > p_not_i_i1_fu_742_p2;
    sc_signal< sc_lv<1> > brmerge_i_i1_fu_748_p2;
    sc_signal< sc_lv<1> > deleted_ones_1_fu_732_p3;
    sc_signal< sc_lv<1> > tmp2_demorgan_fu_769_p2;
    sc_signal< sc_lv<1> > tmp2_fu_775_p2;
    sc_signal< sc_lv<1> > overflow_1_fu_758_p2;
    sc_signal< sc_lv<1> > tmp3_fu_792_p2;
    sc_signal< sc_lv<1> > underflow_1_not_fu_796_p2;
    sc_signal< sc_lv<24> > p_Val2_9_mux_fu_801_p3;
    sc_signal< sc_lv<24> > p_Val2_9_5_fu_807_p3;
    sc_signal< sc_lv<17> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<17> ap_ST_fsm_state1;
    static const sc_lv<17> ap_ST_fsm_state2;
    static const sc_lv<17> ap_ST_fsm_state3;
    static const sc_lv<17> ap_ST_fsm_state4;
    static const sc_lv<17> ap_ST_fsm_state5;
    static const sc_lv<17> ap_ST_fsm_state6;
    static const sc_lv<17> ap_ST_fsm_state7;
    static const sc_lv<17> ap_ST_fsm_state8;
    static const sc_lv<17> ap_ST_fsm_state9;
    static const sc_lv<17> ap_ST_fsm_state10;
    static const sc_lv<17> ap_ST_fsm_state11;
    static const sc_lv<17> ap_ST_fsm_state12;
    static const sc_lv<17> ap_ST_fsm_state13;
    static const sc_lv<17> ap_ST_fsm_state14;
    static const sc_lv<17> ap_ST_fsm_state15;
    static const sc_lv<17> ap_ST_fsm_state16;
    static const sc_lv<17> ap_ST_fsm_state17;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<32> ap_const_lv32_F;
    static const int C_S_AXI_DATA_WIDTH;
    static const sc_lv<32> ap_const_lv32_7;
    static const sc_lv<32> ap_const_lv32_8;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<32> ap_const_lv32_4;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<32> ap_const_lv32_5;
    static const sc_lv<32> ap_const_lv32_6;
    static const sc_lv<32> ap_const_lv32_9;
    static const sc_lv<32> ap_const_lv32_A;
    static const sc_lv<32> ap_const_lv32_B;
    static const sc_lv<32> ap_const_lv32_C;
    static const sc_lv<32> ap_const_lv32_D;
    static const sc_lv<24> ap_const_lv24_0;
    static const sc_lv<3> ap_const_lv3_0;
    static const bool ap_const_boolean_0;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<4> ap_const_lv4_1;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<4> ap_const_lv4_2;
    static const sc_lv<4> ap_const_lv4_3;
    static const sc_lv<32> ap_const_lv32_2;
    static const sc_lv<4> ap_const_lv4_4;
    static const sc_lv<4> ap_const_lv4_5;
    static const sc_lv<4> ap_const_lv4_A;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<4> ap_const_lv4_8;
    static const sc_lv<4> ap_const_lv4_6;
    static const sc_lv<4> ap_const_lv4_D;
    static const sc_lv<4> ap_const_lv4_B;
    static const sc_lv<4> ap_const_lv4_9;
    static const sc_lv<32> ap_const_lv32_E;
    static const sc_lv<4> ap_const_lv4_7;
    static const sc_lv<4> ap_const_lv4_E;
    static const sc_lv<32> ap_const_lv32_10;
    static const sc_lv<4> ap_const_lv4_C;
    static const sc_lv<32> ap_const_lv32_17;
    static const sc_lv<3> ap_const_lv3_5;
    static const sc_lv<3> ap_const_lv3_1;
    static const sc_lv<32> ap_const_lv32_32;
    static const sc_lv<32> ap_const_lv32_18;
    static const sc_lv<32> ap_const_lv32_2F;
    static const sc_lv<32> ap_const_lv32_31;
    static const sc_lv<2> ap_const_lv2_3;
    static const sc_lv<32> ap_const_lv32_30;
    static const sc_lv<3> ap_const_lv3_7;
    static const sc_lv<24> ap_const_lv24_7FFFFF;
    static const sc_lv<24> ap_const_lv24_800000;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_var_for_const0();
    void thread_ap_clk_no_reset_();
    void thread_OP1_V_fu_359_p1();
    void thread_OP2_V_1_fu_371_p1();
    void thread_OP2_V_fu_363_p1();
    void thread_Range1_all_ones_1_fu_668_p2();
    void thread_Range1_all_ones_fu_474_p2();
    void thread_Range1_all_zeros_1_fu_674_p2();
    void thread_Range1_all_zeros_fu_480_p2();
    void thread_Range2_all_ones_1_fu_652_p2();
    void thread_Range2_all_ones_fu_458_p2();
    void thread_addr1_cast_fu_354_p1();
    void thread_addr1_fu_349_p2();
    void thread_addr5_cast_fu_340_p1();
    void thread_addr5_fu_334_p2();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state10();
    void thread_ap_CS_fsm_state11();
    void thread_ap_CS_fsm_state12();
    void thread_ap_CS_fsm_state13();
    void thread_ap_CS_fsm_state14();
    void thread_ap_CS_fsm_state15();
    void thread_ap_CS_fsm_state16();
    void thread_ap_CS_fsm_state17();
    void thread_ap_CS_fsm_state2();
    void thread_ap_CS_fsm_state3();
    void thread_ap_CS_fsm_state4();
    void thread_ap_CS_fsm_state5();
    void thread_ap_CS_fsm_state6();
    void thread_ap_CS_fsm_state7();
    void thread_ap_CS_fsm_state8();
    void thread_ap_CS_fsm_state9();
    void thread_ap_block_state1();
    void thread_ap_block_state16_io();
    void thread_ap_rst_n_inv();
    void thread_ap_sig_ioackin_outDataLeft_V_ap_ack();
    void thread_ap_sig_ioackin_outDataRight_V_ap_ack();
    void thread_array_r_address0();
    void thread_array_r_address1();
    void thread_array_r_ce0();
    void thread_array_r_ce1();
    void thread_array_r_d0();
    void thread_array_r_d1();
    void thread_array_r_we0();
    void thread_array_r_we1();
    void thread_brmerge40_demorgan_i_1_fu_764_p2();
    void thread_brmerge40_demorgan_i_fu_541_p2();
    void thread_brmerge_i_i1_fu_748_p2();
    void thread_brmerge_i_i_fu_525_p2();
    void thread_brmerge_i_i_i1_fu_786_p2();
    void thread_brmerge_i_i_i_fu_563_p2();
    void thread_carry_1_fu_636_p2();
    void thread_carry_fu_442_p2();
    void thread_deleted_ones_1_fu_732_p3();
    void thread_deleted_ones_fu_509_p3();
    void thread_deleted_zeros_1_fu_716_p3();
    void thread_deleted_zeros_fu_493_p3();
    void thread_grp_fu_279_p0();
    void thread_grp_fu_279_p1();
    void thread_i_V_fu_319_p2();
    void thread_inDataLeft_V_ap_ack();
    void thread_inDataLeft_V_blk_n();
    void thread_inDataLeft_V_trunc_fu_305_p1();
    void thread_inDataRight_V_ap_ack();
    void thread_inDataRight_V_blk_n();
    void thread_inDataRight_V_trunc_fu_309_p1();
    void thread_newsignbit_1_fu_622_p3();
    void thread_newsignbit_fu_428_p3();
    void thread_outDataLeft_V();
    void thread_outDataLeft_V_ap_vld();
    void thread_outDataLeft_V_blk_n();
    void thread_outDataRight_V();
    void thread_outDataRight_V_ap_vld();
    void thread_outDataRight_V_blk_n();
    void thread_overflow_1_fu_758_p2();
    void thread_overflow_fu_535_p2();
    void thread_p_38_i_i1_fu_738_p2();
    void thread_p_38_i_i_fu_515_p2();
    void thread_p_41_i_i1_fu_727_p2();
    void thread_p_41_i_i_fu_504_p2();
    void thread_p_Val2_2_fu_387_p2();
    void thread_p_Val2_3_fu_401_p4();
    void thread_p_Val2_4_4_fu_695_p3();
    void thread_p_Val2_4_fu_422_p2();
    void thread_p_Val2_4_mux_fu_689_p3();
    void thread_p_Val2_5_trunc_fu_854_p1();
    void thread_p_Val2_7_fu_581_p2();
    void thread_p_Val2_8_fu_595_p4();
    void thread_p_Val2_9_5_fu_807_p3();
    void thread_p_Val2_9_fu_616_p2();
    void thread_p_Val2_9_mux_fu_801_p3();
    void thread_p_Val2_trunc_fu_833_p1();
    void thread_p_not_i_i1_fu_742_p2();
    void thread_p_not_i_i_fu_519_p2();
    void thread_resultLeft_V_fu_701_p3();
    void thread_resultRight_V_fu_813_p3();
    void thread_samples_V_load11_tru_fu_829_p1();
    void thread_samples_V_load_114_t_fu_846_p1();
    void thread_samples_V_load_217_t_fu_850_p1();
    void thread_samples_V_load_320_t_fu_859_p1();
    void thread_tmp1_fu_680_p2();
    void thread_tmp2_demorgan_fu_769_p2();
    void thread_tmp2_fu_775_p2();
    void thread_tmp3_fu_792_p2();
    void thread_tmp_10_fu_569_p3();
    void thread_tmp_11_fu_605_p1();
    void thread_tmp_12_fu_630_p2();
    void thread_tmp_13_cast_fu_577_p1();
    void thread_tmp_13_fu_642_p4();
    void thread_tmp_14_fu_658_p4();
    void thread_tmp_15_fu_721_p2();
    void thread_tmp_16_fu_753_p2();
    void thread_tmp_17_fu_825_p1();
    void thread_tmp_18_fu_838_p1();
    void thread_tmp_19_fu_842_p1();
    void thread_tmp_1_fu_498_p2();
    void thread_tmp_20_fu_345_p1();
    void thread_tmp_23_fu_414_p3();
    void thread_tmp_25_fu_486_p3();
    void thread_tmp_26_fu_367_p1();
    void thread_tmp_29_fu_608_p3();
    void thread_tmp_2_fu_313_p2();
    void thread_tmp_31_fu_709_p3();
    void thread_tmp_3_cast_fu_330_p1();
    void thread_tmp_3_fu_325_p1();
    void thread_tmp_4_fu_821_p1();
    void thread_tmp_5_fu_411_p1();
    void thread_tmp_6_fu_448_p4();
    void thread_tmp_7_fu_464_p4();
    void thread_tmp_8_cast_fu_383_p1();
    void thread_tmp_8_fu_375_p3();
    void thread_tmp_9_fu_530_p2();
    void thread_tmp_demorgan_fu_546_p2();
    void thread_tmp_fu_552_p2();
    void thread_tmp_s_fu_436_p2();
    void thread_underflow_1_fu_781_p2();
    void thread_underflow_1_not_fu_796_p2();
    void thread_underflow_fu_558_p2();
    void thread_underflow_not_fu_684_p2();
    void thread_ap_NS_fsm();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
