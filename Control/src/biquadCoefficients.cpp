#include "biquadCoefficients.hpp"

BiquadCoefficients::BiquadCoefficients(uint32_t fs) {
    this->fs = fs;
}

void BiquadCoefficients::PeakingEQ_Q(double Q, double f0, double dbGain) {
    if (dbGain != 0) {
        double A = pow(10, dbGain/40);
        double w0 = 2 * M_PI * f0/this->fs;
        double alpha = sin(w0) / (2 * Q);

        //Calculate coefficients.
        double b0 = 1 + alpha * A;
        double b1 = -2*cos(w0);
        double b2 = 1 - alpha * A;
        double a0 = 1 + alpha/A;
        double a1 = -2*cos(w0);
        double a2 = 1 - alpha/A;
        //printf("%lf | %lf | %lf | %lf | %lf | %lf\r\n", b0, b1, b2, a0, a1, a2); //Debug

        //Convert coefficients so they fit Direct form 2.
        double t_b0_a0 = b0/a0;
        double t_b1_a0 = b1/a0;
        double t_b2_a0 = b2/a0;
        double t_a1_a0 = a1/a0;
        double t_a2_a0 = a2/a0;
        //printf("%lf | %lf | %lf | %lf | %lf\r\n", t_b0_a0, t_b1_a0, t_b2_a0, t_a1_a0, t_a2_a0); //Debug

        //Convert to fixedpoint representation.
        this->b0_a0 = (uint32_t) round(t_b0_a0 * ((1 << 24) - 1));
        this->b1_a0 = (uint32_t) round(t_b1_a0 * ((1 << 24) - 1));
        this->b2_a0 = (uint32_t) round(t_b2_a0 * ((1 << 24) - 1));
        this->a1_a0 = (uint32_t) round(t_a1_a0 * ((1 << 24) - 1));
        this->a2_a0 = (uint32_t) round(t_a2_a0 * ((1 << 24) - 1));
        //printf("%ld | %ld | %ld | %ld | %ld\r\n", this->b0_a0, this->b1_a0, this->b2_a0, this->a1_a0, this->a2_a0); //Debug
    } else {
        this->b0_a0 = (1 << 24);
        this->b1_a0 = 0;
        this->b2_a0 = 0;
        this->a1_a0 = 0;
        this->a2_a0 = 0;
    }
}

void BiquadCoefficients::GetLatestCoefficients(uint32_t *b0_a0, uint32_t *b1_a0, uint32_t *b2_a0, uint32_t *a1_a0, uint32_t *a2_a0) {
    *b0_a0 = this->b0_a0;
    *b1_a0 = this->b1_a0;
    *b2_a0 = this->b2_a0;
    *a1_a0 = this->a1_a0;
    *a2_a0 = this->a2_a0;
    //printf("b0_a0  | b1_a0  | b2_a0  | a1_a0  | a2_a0\r\n"); //Debug
    //printf("0x%02X | 0x%02X | 0x%02X | 0x%02X | 0x%02X\r\n", this->b0_a0, this->b1_a0, this->b2_a0, this->a1_a0, this->a2_a0); //Debug
}