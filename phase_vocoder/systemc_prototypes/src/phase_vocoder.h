#ifndef PHASE_VOCODER_H__
#define PHASE_VOCODER_H__

#include "libfixmath/fix16.h"
#include "sysc/communication/sc_clock.h"
#include "sysc/communication/sc_fifo.h"
#include "sysc/kernel/sc_module.h"

#include <systemc.h>

#define FFT_SIZE 1024
#define HOP_SIZE 128 // 1/8 of FFT_SIZE should result in less artifacts  

struct complex_sample
{
    sc_uint<32 > real;
    sc_uint<32 > imag;

    // Constructors
    complex_sample() : real( 0 ), imag( 0 ) {}
    complex_sample( int r, int i ) : real( r ), imag( i ) {}
};

SC_MODULE( PHASE_VOCODER )
{
    /// IO
    // Inputs 
    sc_in<bool > in_clk;
    sc_in<bool > in_reset;

    // Audio Input 
    sc_fifo<sc_uint<32> > audio_in;
    // FFT Input
    sc_fifo<complex_sample > fft_in_data;
    sc_fifo<bool > fft_in_valid;

    // FFT Output
    sc_fifo<complex_sample > fft_out_data;
    sc_fifo<bool > fft_out_valid; 
    
    // Internal memory
    fix16_t hanning_window[FFT_SIZE];
    fix16_t input_buffer[FFT_SIZE];
    fix16_t output_buffer[FFT_SIZE*6];

    fix16_t fft_real[FFT_SIZE];
    fix16_t fft_imag[FFT_SIZE];

    fix16_t last_input_phases [FFT_SIZE / 2 + 1];
    fix16_t last_output_phases[FFT_SIZE / 2 + 1];

    fix16_t analysis_magnitudes[FFT_SIZE / 2 + 1];
    fix16_t analysis_frequencies[FFT_SIZE / 2 + 1];

    fix16_t synthesis_magnitudes[FFT_SIZE / 2 + 1];
    fix16_t synthesis_frequencies[FFT_SIZE / 2 + 1];
    fix16_t one;
    fix16_t two;
    fix16_t pi;

    SC_CTOR(PHASE_VOCODER) {
      SC_CTHREAD(process_phase_vocoder, in_clk.pos());
      reset_signal_is(in_reset, true);
    } 
    // Methods 
    void process_phase_vocoder();
    fix16_t wrap_phase(fix16_t phase_in);
    
    
};

#endif   // !PHASE_VOCODER_H__
