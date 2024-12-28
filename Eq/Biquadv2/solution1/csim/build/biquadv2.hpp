#ifndef BIQUADV2_H
#define BIQUADV2_H
//#include <ap_cint.h>
#include <ap_fixed.h>
typedef ap_fixed<24, 1, AP_RND, AP_SAT> inData_t;
typedef ap_fixed<24, 1, AP_RND, AP_SAT> outData_t;
typedef ap_fixed<27, 3, AP_RND, AP_SAT> coeff_t;
typedef ap_fixed<24, 1, AP_RND, AP_SAT> sample_t;
typedef ap_fixed<24, 1, AP_RND, AP_SAT> result_t;
#endif
