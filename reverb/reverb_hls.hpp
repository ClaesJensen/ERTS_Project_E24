#include "ap_fixed.h"

typedef ap_fixed<24, 1, AP_RND, AP_SAT> data_t;
typedef ap_fixed<27, 3, AP_RND, AP_SAT> coeff_t;
typedef ap_fixed<24, 1, AP_RND, AP_SAT> sample_t;
typedef ap_fixed<24, 1, AP_RND, AP_SAT> result_t;

static coeff_t mix = 1.0;

void reverb(data_t inputData, data_t* outputData);
void tuneMix(coeff_t newMixVal);
// Perhaps a function for adjusting roomsize?

// Define delay values for 5 allpasses
#define D1 89
#define D2 131
#define D3 563
#define D4 3001
// #define D5 7001

// Define delay values, K, for 9 comb filters
/*
#define K1 1511
#define K2 1723
#define K3 1999
#define K4 2137
#define K5 2411
#define K6 2731
#define K7 3163
#define K8 3571
#define K9 4001
*/

#define K1 1511
#define K2 1723
#define K3 2137
#define K4 2731
#define K5 3163
#define K6 4001
