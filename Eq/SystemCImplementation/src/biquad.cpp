#include "biquad.hpp"


void Biquad::process() {
//#pragma HLS ARRAY_PARTITION variable=samples complete dim=1
#pragma HLS resource core=AXI4LiteS metadata="-bus_bundle biquad_io" variable=inData
#pragma HLS resource core=AXI4LiteS metadata="-bus_bundle biquad_io" variable=outData

	//Init
    const sc_int<SAMPLE_SIZE> coeffs[5] = {
        8314060,
        -16558260,
        8245108,
        -(-16558260),
        -(8170561)
    };

    sc_int<SAMPLE_SIZE> samples[5];

    //samples[0] = 0; //x0
    //samples[1] = 0; //x1
    //samples[2] = 0; //x2
    //samples[3] = 0; //y1
    //samples[4] = 0; //y2

    while(true) {
        //Read
        samples[0] = inData.read();
        wait();

        sc_int<SAMPLE_SIZE> result = 0;
        sc_int<SAMPLE_SIZE * 2> single_coeff;
        sc_int<SAMPLE_SIZE * 2> single_sample;
        sc_int<8> i;
        for (i = 0; i < 5; i++) {
        	single_coeff = coeffs[i];
        	single_sample = samples[i];
            result += ((single_coeff * single_sample) >> 23);

            //if (result >= (1 << 23) || result <= -(1<<23)) {
            //    printf("%i | %i\n", (1<<23), -(1<<23));
            //    printf("OVERFLOW!\n");
            //}
            //printf("i: %i | %lli\n", i.to_int(), result.to_int64());
            
        }
        //sc_uint<SAMPLE_SIZE> result = b0_a0 * x0 + b1_a0 * x1 + b2_a0 * x2 - a1_a0 * y1 - a2_a0 * y2;

        //Shift samples
        samples[4] = samples[3];
        samples[3] = result;
        samples[2] = samples[1];
        samples[1] = samples[0];

        //Write to output
        outData.write(result);
        wait();
    }
}
