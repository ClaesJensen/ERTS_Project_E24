#include "biquad.hpp"
#include "biquad_test.hpp"

#define FREQ 4

int main() {
    printf("Starting...\n");


    sc_clock s_clock("clock", sc_time(FREQ, SC_SEC));
    sc_signal<bool> s_reset;
    sc_signal<sc_int<SAMPLE_SIZE> > s_inData;
    sc_signal<sc_int<SAMPLE_SIZE> > s_outData;

    sc_trace_file* traceFile =  sc_create_vcd_trace_file("trace");
    traceFile->set_time_unit(100, SC_US);
    
    sc_trace(traceFile, s_clock, "clock");
    sc_trace(traceFile, s_reset, "reset");
    sc_trace(traceFile, s_inData, "inData");
    sc_trace(traceFile, s_outData, "outData");

    Biquad filter("filter");
    filter.inClk.bind(s_clock);
    filter.inReset.bind(s_reset);
    filter.inData.bind(s_inData);
    filter.outData.bind(s_outData);

    BiquadTestbench test("test");
    test.inClk.bind(s_clock);
    test.inReset.bind(s_reset);
    test.inData.bind(s_outData);
    test.outData.bind(s_inData);
    

    printf("Run\n");

    sc_start(FREQ * 1024, SC_SEC);

    printf("StartDone\n");
    sc_close_vcd_trace_file(traceFile);

    return 0;
}