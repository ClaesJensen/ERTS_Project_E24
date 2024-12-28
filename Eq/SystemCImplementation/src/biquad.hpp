#ifndef ADVIOS_H
#define ADVIOS_H

#include <systemc.h>

#define SAMPLE_SIZE 32
#define UPPER 1
#define LOWER 23

SC_MODULE(Biquad) {
    sc_in<bool> inClk;
    sc_in<bool> inReset;

    sc_in<sc_int<SAMPLE_SIZE> > inData;
    sc_out<sc_int<SAMPLE_SIZE> > outData;
    
    //Values
    // -- Previous samples
    //sc_uint<SAMPLE_SIZE> x0; // x[n]
    //sc_uint<SAMPLE_SIZE> x1; // x[n-1]
    //sc_uint<SAMPLE_SIZE> x2; // x[n-2]
//
    //sc_uint<SAMPLE_SIZE> y1; // y[n-1]
    //sc_uint<SAMPLE_SIZE> y2; // y[n-2]

    // -- Precomputed coeffs
    //sc_uint<SAMPLE_SIZE> b0_a0; //b0/a0
    //sc_uint<SAMPLE_SIZE> b1_a0; //b1/a0
    //sc_uint<SAMPLE_SIZE> b2_a0; //b2/a0
    //sc_uint<SAMPLE_SIZE> a1_a0; //a1/a0
    //sc_uint<SAMPLE_SIZE> a2_a0; //a2/a0
    
    //sc_int<SAMPLE_SIZE> coeffs[5];


    SC_CTOR(Biquad) {
        SC_CTHREAD(process, inClk.pos());
        reset_signal_is(inReset, true);
    }

    void process();
};
#endif
