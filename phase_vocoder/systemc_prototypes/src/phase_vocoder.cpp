#include "phase_vocoder.h"

#include "libfixmath/fix16.h"
#include "libfixmath/fixmath.h"
#include "sysc/kernel/sc_macros.h"
#include <systemc.h>

void PHASE_VOCODER::process_phase_vocoder()
{
    // Init
    // Initialize hanning window
    
    // Convert constants and variables:
    one = fix16_from_float(1.0f);
    two = fix16_from_float(2.0f);
    pi = fix16_pi;

    fix16_t FFT_SIZE_FIX = fix16_from_int(FFT_SIZE - 1);
    fix16_t HOP_SIZE_FIX = fix16_from_int(HOP_SIZE- 1);

    for (uint n = 0; n < FFT_SIZE; n++) {
      fix16_t nFix = fix16_from_int(n);

      // Compute the angle in fixed point:
      // angle = (2.0 * M_PI * n) / (FFT_SIZE- 1)
      fix16_t angle = fix16_div(fix16_mul(fix16_mul(two, pi), nFix), FFT_SIZE_FIX);

      // Compute cos(angle) in fixed point
      fix16_t cos_val = fix16_cos(angle);

      // 0.5f*(1.0f - cos(...))
      hanning_window[n] = fix16_mul(fix16_from_float(0.5f), fix16_sub(one, cos_val));
    }

    // First iteration must read all samples if ready
    // Muligvist nødvendigt at implementere en wait funktion
    // så processering først sker når data er klar
    for ( int i = 0; i < FFT_SIZE; i++ )
    {
        input_buffer[ i ] = audio_in.read();
    }
    bool first_iter = true;
    
    complex_sample single_sample;
    while ( 1 )
    {
        // Only read new samples equating to the hop size in to buffer
        if ( !first_iter )
        {
            for ( int i = 0; i < FFT_SIZE - HOP_SIZE; i++ )
            {
                input_buffer[ i ] = input_buffer[ i + HOP_SIZE ];
            }
            first_iter = !first_iter;
        }
        
        // Send data to fft
        // Imaginary part is zero as audio data is real only 
        single_sample.imag = 0;
        // Wait until to be sure that the fft is ready to process the next block
        SC_WAIT_UNTIL(fft_out_valid);
        for(uint n = 0; n < FFT_SIZE; n++) {
          // Hanning window 
          input_buffer[n] = fix16_mul(input_buffer[n], hanning_window[n]);
          // Convert to data type
          single_sample.real = input_buffer[n];
          // Send to fft
          fft_in_data.write(single_sample);
        }
        // Read data from fft ip core
        // Make sure that fft has processed block before continuing 
        // single sample is reused 
        SC_WAIT_UNTIL(fft_in_valid);
        for(uint n = 0; n < FFT_SIZE; n++) {
          fft_out_data.read(single_sample);
          fft_real[n] = single_sample.real;
          fft_imag[n] = single_sample.imag;
        }
        // Calculating instantaneous frequencies
        for(uint n = 0; n <= FFT_SIZE / 2; n++){
          // Pythagoras (:
          fix16_t amplitude = fix16_sqrt(fix16_add(
                fix16_mul(fft_real[n], fft_real[n]), 
                fix16_mul(fft_imag[n], fft_imag[n])
                ));
          fix16_t phase = fix16_atan2(fft_real[n], fft_imag[n]);
          
          // Phase difference between current and last bin 
          fix16_t phase_diff = phase - last_input_phases[n]; 
          
          fix16_t bin_centre_freq = fix16_div(fix16_mul(fix16_mul(two, pi), fix16_from_int(n)), FFT_SIZE_FIX); 
          phase_diff = wrap_phase(fix16_sub(phase_diff, fix16_mul(bin_centre_freq, HOP_SIZE_FIX)));
          
          fix16_t bin_dev = fix16_mul(phase_diff, fix16_div(FFT_SIZE_FIX, fix16_div(HOP_SIZE_FIX, fix16_mul(two, pi))));

          analysis_frequencies[n] = fix16_add(fix16_from_int(n), bin_dev);

          analysis_magnitudes[n] = amplitude;

          last_input_phases[n] = phase;
        }
        
    }
}

fix16_t PHASE_VOCODER::wrap_phase(fix16_t phase_in) {
  if(phase_in >= fix16_from_int(0))
    // ((phase_in + pi) % 2pi) - pi 
    return fix16_sub(fix16_mod(fix16_add(phase_in, pi), fix16_mul(two, pi)), pi);
  else
    // ((phase_in - pi) % 2pi) + pi 
    return fix16_add(fix16_mod(fix16_sub(phase_in, pi), fix16_mul(two, pi)), pi);
}
