// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.2
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _Biquad_HH_
#define _Biquad_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "Biquad_process.h"

namespace ap_rtl {

struct Biquad : public sc_module {
    // Port declarations 4
    sc_in_clk inClk;
    sc_in< sc_logic > inReset;
    sc_in< sc_lv<32> > inData;
    sc_out< sc_lv<32> > outData;


    // Module declarations
    Biquad(sc_module_name name);
    SC_HAS_PROCESS(Biquad);

    ~Biquad();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    Biquad_process* grp_Biquad_process_fu_58;
    sc_signal< sc_lv<32> > grp_Biquad_process_fu_58_outData;
    sc_signal< sc_logic > grp_Biquad_process_fu_58_outData_ap_vld;
    sc_signal< sc_lv<2> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    static const sc_logic ap_const_logic_1;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<2> ap_const_lv2_0;
    static const sc_logic ap_const_logic_0;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_outData();
    void thread_ap_CS_fsm();
    void thread_ap_CS_fsm_state2();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif