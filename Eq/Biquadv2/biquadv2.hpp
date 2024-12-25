#ifndef BIQUADV2_H
#define BIQUADV2_H
//#include <ap_cint.h>
#include <ap_fixed.h>
typedef ap_fixed<24, 1, AP_RND, AP_SAT> inData_t;
typedef ap_fixed<24, 1, AP_RND, AP_SAT> outData_t;
typedef ap_fixed<27, 3, AP_RND, AP_SAT> coeff_t;
typedef ap_fixed<24, 1, AP_RND, AP_SAT> sample_t;
typedef ap_fixed<24, 1, AP_RND, AP_SAT> result_t;

/*static coeff_t coeffs[5] = {
	0.006437504285881,//8314060,
	0,//-16558260,
	-0.006437504285881,//8245108,
	-(-1.987097752410524),//-(-16558260),
	-(0.987124991428238)//-(8170561)
};*/

#endif
