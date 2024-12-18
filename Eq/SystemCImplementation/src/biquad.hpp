#ifndef ADVIOS_H
#define ADVIOS_H

#include <systemc.h>

SC_MODULE(Biquad) {
    sc_in<bool> inClk;
    sc_in<bool> inReset;
    sc_out<bool> outIsReady;
    sc_out<bool> outIsDone;

    sc_in<sc_uint<24> > x0;
    
    //Values
    // -- Previous samples
    sc_uint<24> x1; // x[n-1]
    sc_uint<24> x2; // x[n-2]

    sc_uint<24> y1; // y[n-1]
    sc_uint<24> y2; // y[n-2]

    // -- Precomputed coeffs
    sc_uint<24> b0_a0; //b0/a0
    sc_uint<24> b1_a0; //b1/a0
    sc_uint<24> b2_a0; //b2/a0
    sc_uint<24> a1_a0; //a1/a0
    sc_uint<24> a2_a0; //a2/a0

    SC_CTOR(Biquad) {
        SC_CTHREAD(process, inClk.pos());
        reset_signal_is(inReset, true);
    }

    void process();
};
#endif