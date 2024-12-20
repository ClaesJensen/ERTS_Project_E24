#include "biquadv2.hpp"

void biquadv2(inData_t inData, outData_t* outData) {
#pragma HLS INTERFACE s_axilite port=outData bundle=biquadv2
#pragma HLS INTERFACE s_axilite port=inData bundle=biquadv2
#pragma HLS INTERFACE s_axilite port=return bundle=biquadv2
	const coeff_t coeffs[5] = {
		0.006437504285881,//8314060,
		0,//-16558260,
		-0.006437504285881,//8245108,
		-(-1.987097752410524),//-(-16558260),
		-(0.987124991428238)//-(8170561)
    };

	static sample_t  samples[5]; //STATIC is very important since this array should be persistant across runs!
    samples[0] = inData; //x0

    result_t result = result_t(0.0);
    ap_uint<4> i;
    for (i = 0; i < 5; i++) {
        result += coeffs[i] * samples[i];
    }

    samples[4] = samples[3]; //y2 <- y1
    samples[3] = result; //y1 <- y0
    samples[2] = samples[1]; //x2 <- x1
    samples[1] = samples[0]; //x1 <- x0

    *outData = result;
}
