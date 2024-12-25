#include "biquadv2coeffs.hpp"

void Biquadv2coeffs(coeff_t in0b0_a0, coeff_t in0b1_a0, coeff_t in0b2_a0, coeff_t in0a1_a0, coeff_t in0a2_a0, coeff_t *out0b0_a0, coeff_t *out0b1_a0, coeff_t *out0b2_a0, coeff_t *out0a1_a0, coeff_t *out0a2_a0) {
#pragma HLS INTERFACE s_axilite port=in0b0_a0 bundle=coeffs
#pragma HLS INTERFACE s_axilite port=in0b1_a0 bundle=coeffs
#pragma HLS INTERFACE s_axilite port=in0b2_a0 bundle=coeffs
#pragma HLS INTERFACE s_axilite port=in0a1_a0 bundle=coeffs
#pragma HLS INTERFACE s_axilite port=in0a2_a0 bundle=coeffs
	static coeff_t coeffs0[5];
	coeffs0[0] = in0b0_a0;
	coeffs0[1] = in0b1_a0;
	coeffs0[2] = in0b2_a0;
	coeffs0[3] = in0a1_a0;
	coeffs0[4] = in0a2_a0;

	*out0b0_a0 = coeffs0[0];
	*out0b1_a0 = coeffs0[1];
	*out0b2_a0 = coeffs0[2];
	*out0a1_a0 = coeffs0[3];
	*out0a2_a0 = coeffs0[4];
}
