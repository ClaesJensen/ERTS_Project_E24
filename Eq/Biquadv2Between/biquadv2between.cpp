#include "biquadv2between.hpp"
#define LEFT_SAMPLE_OFFSET 0
#define RIGHT_SAMPLE_OFFSET 5

void biquadv2between(
		coeff_t b0_a0,
		coeff_t b1_a0,
		coeff_t b2_a0,
		coeff_t a1_a0,
		coeff_t a2_a0,
		inData_t inDataLeft,
		inData_t inDataRight,
		outData_t* outDataLeft,
		outData_t* outDataRight
) {
//The DSP modules are precious in our case since we need A LOT of them so we
// reduce the amount this module is allowed to use to 1
#pragma HLS ALLOCATION instances=mul limit=1 operation

//PORTS MARKED AS AP_HS.
#pragma HLS INTERFACE ap_hs port=inDataLeft
#pragma HLS INTERFACE ap_hs port=inDataRight
#pragma HLS INTERFACE ap_hs port=outDataLeft
#pragma HLS INTERFACE ap_hs port=outDataRight

//SLAVE AXILITE PORTS
#pragma HLS INTERFACE s_axilite port=b0_a0 bundle=biquadv2
#pragma HLS INTERFACE s_axilite port=b1_a0 bundle=biquadv2
#pragma HLS INTERFACE s_axilite port=b2_a0 bundle=biquadv2
#pragma HLS INTERFACE s_axilite port=a1_a0 bundle=biquadv2
#pragma HLS INTERFACE s_axilite port=a2_a0 bundle=biquadv2

//REMOVE AP_CTRL
#pragma HLS INTERFACE ap_ctrl_none port=return

	//-- DECLARE VARIABLES
	static coeff_t coeffs[5];
#pragma HLS ARRAY_MAP variable=coeffs instance=array horizontal
	static sample_t samples[10];
#pragma HLS ARRAY_MAP variable=samples instance=array horizontal
 //STATIC is very important since this array should be persistant across runs!
    result_t resultLeft = 0;
    result_t resultRight = 0;
	ap_uint<4> i;

	//-- SET PARAMETERS
	coeffs[0] = b0_a0;
	coeffs[1] = b1_a0;
	coeffs[2] = b2_a0;
	coeffs[3] = a1_a0;
	coeffs[4] = a2_a0;

    // -- LEFT & RIGHT PROCESSING
    samples[0 + LEFT_SAMPLE_OFFSET] = inDataLeft; //x0
    samples[0 + RIGHT_SAMPLE_OFFSET] = inDataRight;
    LOOP_PROCESSING: for (i = 0; i < 5; i++) {
        resultLeft += coeffs[i] * samples[i + LEFT_SAMPLE_OFFSET];
    	resultRight += coeffs[i] * samples[i + RIGHT_SAMPLE_OFFSET];
    }

    // -- MOVE LEFT SAMPLES AROUND
    samples[4+LEFT_SAMPLE_OFFSET] = samples[3+LEFT_SAMPLE_OFFSET]; //y2 <- y1
    samples[3+LEFT_SAMPLE_OFFSET] = resultLeft; //y1 <- y0
    samples[2+LEFT_SAMPLE_OFFSET] = samples[1+LEFT_SAMPLE_OFFSET]; //x2 <- x1
    samples[1+LEFT_SAMPLE_OFFSET] = samples[0+LEFT_SAMPLE_OFFSET]; //x1 <- x0

    // -- MOVE RIGHT SAMPLES AROUND
    samples[4+RIGHT_SAMPLE_OFFSET] = samples[3+RIGHT_SAMPLE_OFFSET]; //y2 <- y1
    samples[3+RIGHT_SAMPLE_OFFSET] = resultRight; //y1 <- y0
    samples[2+RIGHT_SAMPLE_OFFSET] = samples[1+RIGHT_SAMPLE_OFFSET]; //x2 <- x1
    samples[1+RIGHT_SAMPLE_OFFSET] = samples[0+RIGHT_SAMPLE_OFFSET]; //x1 <- x0

    // -- OUTPUT DATA
    *outDataLeft = resultLeft;
    *outDataRight = resultRight;
}
