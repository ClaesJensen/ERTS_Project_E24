#ifndef ADVIOS_TESTBENCH_H
#define ADVIOS_TESTBENCH_H
#include <systemc.h>
#include <biquad.hpp>

SC_MODULE(BiquadTestbench) {
    sc_in_clk inClk;
    sc_out<bool> inReset;

    sc_in<sc_int<SAMPLE_SIZE> > inData;
    sc_out<sc_int<SAMPLE_SIZE> > outData;

    sc_int<SAMPLE_SIZE> result[32] = {
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0
    };

    //Variables
    sc_int<SAMPLE_SIZE> signalTest[32] = {
        21961,43919,65873,87820,109756,131681,153592,175485,197359,219212,241041,262843,284616,306358,328067,349739,371373,392967,414517,436022,457479,478886,500241,521540,542783,563965,585086,606143,627134,648055,668906,689683};
    sc_int<SAMPLE_SIZE> signalExpected[32] = {
        21765,43140,64133,84751,105001,124892,144431,163624,182479,201001,219196,237070,254629,271881,288832,305486,321849,337928,353727,369251,384505,399495,414225,428698,442923,456900,470636,484135,497401,510436,523247,535836
    };

    SC_CTOR(BiquadTestbench) {
    	SC_CTHREAD(monitor, inClk);
    }
    void monitor();
};

#endif
