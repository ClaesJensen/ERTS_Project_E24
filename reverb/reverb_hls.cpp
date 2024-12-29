#include "reverb.hpp"

// ==================================================
// Reverb Function
// ==================================================
void reverb( data_t inputData, data_t* outputData )
{
    // ==================================================
    // Allpass Filter Arrays
    // ==================================================

    // Allpass 1
    static data_t AP1_w[ D1 ];
    // #pragma HLS RESOURCE   variable=AP1_w  core=RAM_1P_BRAM

    static data_t AP1_x[ D1 ];
    // #pragma HLS ARRAY_MAP  variable=AP1_x  instance=AllArrays horizontal
    static int AP1_idx = 0;

    // Allpass 2
    static data_t AP2_w[ D2 ];
    // #pragma HLS RESOURCE   variable=AP2_w  core=RAM_1P_BRAM

    static data_t AP2_x[ D2 ];
    // #pragma HLS ARRAY_MAP  variable=AP2_x  instance=AllArrays horizontal
    static int AP2_idx = 0;

    // Allpass 3
    static data_t AP3_w[ D3 ];
    // #pragma HLS RESOURCE   variable=AP3_w  core=RAM_1P_BRAM

    static data_t AP3_x[ D3 ];
    // #pragma HLS ARRAY_MAP  variable=AP3_x  instance=AllArrays horizontal
    static int AP3_idx = 0;

    // Allpass 4
    static data_t AP4_w[ D4 ];
    // #pragma HLS RESOURCE   variable=AP4_w  core=RAM_1P_BRAM

    static data_t AP4_x[ D4 ];
    // #pragma HLS ARRAY_MAP  variable=AP4_x  instance=AllArrays horizontal
    static int AP4_idx = 0;
    /*
    // Allpass 5
    static data_t AP5_w[D5];
    //#pragma HLS RESOURCE   variable=AP5_w  core=RAM_1P_BRAM

    static data_t AP5_x[D5];
    //#pragma HLS ARRAY_MAP  variable=AP5_x  instance=AllArrays horizontal
    static int AP5_idx = 0;
     */

    // ==================================================
    // Feedback Comb Filter Arrays
    // ==================================================

    static data_t FCF1_db[ K1 ];
    // #pragma HLS ARRAY_MAP  variable=FCF1_db instance=AllArrays horizontal
    static int FCF1_idx = 0;

    static data_t FCF2_db[ K2 ];
    // #pragma HLS ARRAY_MAP  variable=FCF2_db instance=AllArrays horizontal
    static int FCF2_idx = 0;

    static data_t FCF3_db[ K3 ];
    // #pragma HLS ARRAY_MAP  variable=FCF3_db instance=AllArrays horizontal
    static int FCF3_idx = 0;

    static data_t FCF4_db[ K4 ];
    // #pragma HLS ARRAY_MAP  variable=FCF4_db instance=AllArrays horizontal
    static int FCF4_idx = 0;

    static data_t FCF5_db[ K5 ];
    // #pragma HLS ARRAY_MAP  variable=FCF5_db instance=AllArrays horizontal
    static int FCF5_idx = 0;

    static data_t FCF6_db[ K6 ];
    // #pragma HLS ARRAY_MAP  variable=FCF6_db instance=AllArrays horizontal
    static int FCF6_idx = 0;

/*
static data_t FCF7_db[K7];
//#pragma HLS ARRAY_MAP  variable=FCF7_db instance=AllArrays horizontal
static int FCF7_idx = 0;

static data_t FCF8_db[K8];
//#pragma HLS ARRAY_MAP  variable=FCF8_db instance=AllArrays horizontal
static int FCF8_idx = 0;

static data_t FCF9_db[K9];
//#pragma HLS ARRAY_MAP  variable=FCF9_db instance=AllArrays horizontal
static int FCF9_idx = 0;
*/

// Pipeline the function & limit multiplier usage
#pragma HLS PIPELINE
#pragma HLS ALLOCATION instances = mul limit = 2 operation

    // Allpass value (single coefficient for all allpass filters)
    static const coeff_t a_value_allpass = 0.85f;

    // Comb values (feedback coefficients)
    // Could also be placed in a static array, but small so it's typically fine
    // as is.
    static const coeff_t a_values_comb[ 6 ] =
        { 0.65f, 0.75f, 0.75f, 0.66f, 0.85f, 0.81f };

    // ---------------------------------------------------------------
    // Comb filter processing
    // ---------------------------------------------------------------
    int N_active_comb_filters = 6;
    coeff_t FCF_frac = 1.0 / N_active_comb_filters;

    // Comb filter 1
    data_t FCF1_output = inputData + a_values_comb[ 0 ] * FCF1_db[ FCF1_idx ];
    FCF1_db[ FCF1_idx ] = FCF1_output;
    FCF1_output *= FCF_frac;   // multiply by reciprocal instead of divide
    FCF1_idx = ( FCF1_idx + 1 ) % K1;

    // Comb filter 2
    data_t FCF2_output = inputData + a_values_comb[ 1 ] * FCF2_db[ FCF2_idx ];
    FCF2_db[ FCF2_idx ] = FCF2_output;
    FCF2_output *= FCF_frac;
    FCF2_idx = ( FCF2_idx + 1 ) % K2;

    // Comb filter 3
    data_t FCF3_output = inputData + a_values_comb[ 2 ] * FCF3_db[ FCF3_idx ];
    FCF3_db[ FCF3_idx ] = FCF3_output;
    FCF3_output *= FCF_frac;
    FCF3_idx = ( FCF3_idx + 1 ) % K3;

    // Comb filter 4
    data_t FCF4_output = inputData + a_values_comb[ 3 ] * FCF4_db[ FCF4_idx ];
    FCF4_db[ FCF4_idx ] = FCF4_output;
    FCF4_output *= FCF_frac;
    FCF4_idx = ( FCF4_idx + 1 ) % K4;

    // Comb filter 5
    data_t FCF5_output = inputData + a_values_comb[ 4 ] * FCF5_db[ FCF5_idx ];
    FCF5_db[ FCF5_idx ] = FCF5_output;
    FCF5_output *= FCF_frac;
    FCF5_idx = ( FCF5_idx + 1 ) % K5;

    // Comb filter 6
    data_t FCF6_output = inputData + a_values_comb[ 5 ] * FCF6_db[ FCF6_idx ];
    FCF6_db[ FCF6_idx ] = FCF6_output;
    FCF6_output *= FCF_frac;
    FCF6_idx = ( FCF6_idx + 1 ) % K6;

    /*
    // Comb filter 7
    data_t FCF7_output = inputData + a_values_comb[6] * FCF7_db[FCF7_idx];
    FCF7_db[FCF7_idx] = FCF7_output;
    FCF7_output *= FCF_frac;
    FCF7_idx = (FCF7_idx + 1) % K7;

    // Comb filter 8
    data_t FCF8_output = inputData + a_values_comb[7] * FCF8_db[FCF8_idx];
    FCF8_db[FCF8_idx] = FCF8_output;
    FCF8_output *= FCF_frac;
    FCF8_idx = (FCF8_idx + 1) % K8;

    // Comb filter 9
    data_t FCF9_output = inputData + a_values_comb[8] * FCF9_db[FCF9_idx];
    FCF9_db[FCF9_idx] = FCF9_output;
    FCF9_output *= FCF_frac;
    FCF9_idx = (FCF9_idx + 1) % K9;
    */

    data_t processedData = FCF1_output + FCF2_output + FCF3_output + FCF4_output
                           + FCF5_output + FCF6_output;

    /*
     // Sum up the comb filter outputs
    data_t processedData =
        FCF1_output + FCF2_output + FCF3_output +
        FCF4_output + FCF5_output + FCF6_output +
        FCF7_output + FCF8_output + FCF9_output;
    */

    // ---------------------------------------------------------------
    // Allpass filters in series
    // ---------------------------------------------------------------
    data_t allpassOut = processedData;

    // -----------------------------------------------------------
    // Allpass 1
    // -----------------------------------------------------------
    int delayed_idx = ( AP1_idx - D1 + D1 ) % D1;
    data_t tmp = -a_value_allpass * allpassOut + AP1_w[ delayed_idx ];

    AP1_w[ AP1_idx ] = a_value_allpass * tmp + allpassOut;
    // AP1_x[AP1_idx] = allpassOut;  // only if you want to log input
    AP1_idx = ( AP1_idx + 1 ) % D1;

    allpassOut = tmp;

    // -----------------------------------------------------------
    // Allpass 2
    // -----------------------------------------------------------
    delayed_idx = ( AP2_idx - D2 + D2 ) % D2;
    tmp = -a_value_allpass * allpassOut + AP2_w[ delayed_idx ];

    AP2_w[ AP2_idx ] = a_value_allpass * tmp + allpassOut;
    // AP2_x[AP2_idx] = allpassOut;
    AP2_idx = ( AP2_idx + 1 ) % D2;

    allpassOut = tmp;

    // -----------------------------------------------------------
    // Allpass 3
    // -----------------------------------------------------------
    delayed_idx = ( AP3_idx - D3 + D3 ) % D3;
    tmp = -a_value_allpass * allpassOut + AP3_w[ delayed_idx ];

    AP3_w[ AP3_idx ] = a_value_allpass * tmp + allpassOut;
    // AP3_x[AP3_idx] = allpassOut;
    AP3_idx = ( AP3_idx + 1 ) % D3;

    allpassOut = tmp;

    // -----------------------------------------------------------
    // Allpass 4
    // -----------------------------------------------------------
    delayed_idx = ( AP4_idx - D4 + D4 ) % D4;
    tmp = -a_value_allpass * allpassOut + AP4_w[ delayed_idx ];

    AP4_w[ AP4_idx ] = a_value_allpass * tmp + allpassOut;
    // AP4_x[AP4_idx] = allpassOut;
    AP4_idx = ( AP4_idx + 1 ) % D4;

    allpassOut = tmp;

    /*
    // -----------------------------------------------------------
    // Allpass 5
    // -----------------------------------------------------------
    delayed_idx = (AP5_idx - D5 + D5) % D5;
    tmp = -a_value_allpass * allpassOut + AP5_w[delayed_idx];

    AP5_w[AP5_idx] = a_value_allpass * tmp + allpassOut;
    // AP5_x[AP5_idx] = allpassOut;
    AP5_idx = (AP5_idx + 1) % D5;
    allpassOut = tmp;
    */

    // ---------------------------------------------------------------
    // Mix dry/wet signal and output
    // ---------------------------------------------------------------
    *outputData =
        ( ( ap_fixed< 16, 4 > )1.0f - mix ) * inputData + mix * allpassOut;
}

// ==================================================
// Function to update the mix
// ==================================================
void updateMix( coeff_t newMixVal )
{
    // Guard the value between 0 and 1
    if ( newMixVal >= 0.0 && newMixVal <= 1.0 )
    {
        mix = newMixVal;
    }
}
