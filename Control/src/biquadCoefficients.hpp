#ifndef BIQUADCOEFFICIENTS_HPP_
#define BIQUADCOEFFICIENTS_HPP_
#include <stdint.h>
#include <math.h>
#include <stdio.h>
class BiquadCoefficients {
public:
    BiquadCoefficients(uint32_t fs);
    void PeakingEQ_Q(double Q, double f0, double dbGain);
    void PeakingEQ_BW(double BW, double f0, double dbGain);
    void GetLatestCoefficients(uint32_t *b0_a0, uint32_t *b1_a0, uint32_t *b2_a0, uint32_t *a1_a0, uint32_t *a2_a0);
private:
    uint32_t fs;
    uint32_t b0_a0;
    uint32_t b1_a0;
    uint32_t b2_a0;
    uint32_t a1_a0;
    uint32_t a2_a0;
};
#endif