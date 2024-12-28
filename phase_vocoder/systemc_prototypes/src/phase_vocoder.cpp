#include "phase_vocoder.h"

#include "libfixmath/fix16.h"
#include "libfixmath/fixmath.h"
#include "sysc/kernel/sc_macros.h"
#include <cmath>
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
    
    // så processering først sker når data er klar
    SC_WAIT_UNTIL(audio_in_valid);
    for ( int i = 0; i < FFT_SIZE; i++ )
    {
        input_buffer[ i ] = audio_in.read();
    }
    bool first_iter = true;
    fix16_t pitch_shift;
    complex_sample single_sample;
    while ( 1 )
    {
        // Read current pitch shift value from processor 
        pitch_shift = in_pitch_shift.read();
        SC_WAIT_UNTIL(audio_in_valid);
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
        for(uint n = 0; n < FFT_SIZE; n++) {
          // Hanning window 
          input_buffer[n] = fix16_mul(input_buffer[n], hanning_window[n]);
          // Convert to data type
          single_sample.real = input_buffer[n];
          // Send to fft
          fft_in_data.write(single_sample);
        }
        fft_in_valid.write(true);
        // Read data from fft ip core
        // Make sure that fft has processed block before continuing 
        // single sample is reused 
        SC_WAIT_UNTIL(fft_out_valid);
        for(uint n = 0; n < FFT_SIZE; n++) {
          fft_out_data.read(single_sample);
          fft_real[n] = single_sample.real;
          fft_imag[n] = single_sample.imag;
        }
        // FFT processing is not needed until new data is written
        fft_in_valid.write(false);
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
        
        // Zero synthesis arrays
        for(uint n = 0; n <= FFT_SIZE / 2; n++){ 
          synthesis_magnitudes[n] = synthesis_frequencies[n] = fix16_from_int(0);
        }
        // Handle pitch shift  
        for(uint n = 0; n <= FFT_SIZE / 2; n++){ 
          fix16_t new_bin = fix16_floor(fix16_add(fix16_mul(fix16_from_int(n), pitch_shift), + fix16_from_float(0.5)));
          // Only pitch shift if the new bin is below nyq bin 
          if(new_bin <= fix16_div(FFT_SIZE_FIX,  two)) {
            synthesis_magnitudes[n] += analysis_magnitudes[n];
            synthesis_frequencies[n] = fix16_mul(analysis_frequencies[n], pitch_shift);
          }
        // Calculating instantaneous frequencies
        complex_sample fft_synth[FFT_SIZE];
        for(uint n = 0; n <= FFT_SIZE / 2; n++) {
          fix16_t mag = synthesis_magnitudes[n];
          fix16_t inst_freq = fix16_div(synthesis_frequencies[n], FFT_SIZE_FIX);
          fix16_t inst_freq_rad = fix16_deg_to_rad(inst_freq);
          fix16_t phase_diff = fix16_mul(inst_freq_rad, HOP_SIZE_FIX);

          fix16_t out_phase = wrap_phase(fix16_add(last_output_phases[n], phase_diff));
          last_output_phases[n] = out_phase;
          
          // Complex conjugate as we want to calculate ifft using the fft block
          single_sample.real = fix16_mul(mag, fix16_cos(out_phase));
          single_sample.imag = fix16_mul(fix16_from_int(-1), fix16_mul(mag, fix16_sin(out_phase)));
          fft_synth[n] = single_sample;
          if(n > 0 && n < FFT_SIZE / 2){
            // Taking account for hermithan symmetry 
            single_sample.imag = fix16_mul(-1, single_sample.imag);
            fft_synth[FFT_SIZE-n].real = single_sample.real;
            fft_synth[FFT_SIZE-n].imag = single_sample.imag;
          }
        }
        
        // Finally ready for inverse fft 
        // Send data to fft ip core 
        for(uint n = 0; n < FFT_SIZE; n++)
        {
          fft_in_data.write(fft_synth[n]); 
        }
        fft_in_valid.write(true);

        SC_WAIT_UNTIL(fft_out_valid);
        for(uint n = 0; n < FFT_SIZE; n++) {
          fft_out_data.read(single_sample);
          single_sample.real = fix16_mul(single_sample.real, hanning_window[n]); // We only need the real part 
          output_buffer[HOP_SIZE_FIX + n] += fix16_div(single_sample.real, FFT_SIZE_FIX);
        }
        fft_in_valid.write(false);
        for(uint n = 0; n < fft_out_valid; n++)
        {
          // Shift output_buffer down to get correct overlap for next hop 
          output_buffer[n] = output_buffer[HOP_SIZE + n];
          if(n < HOP_SIZE)
            audio_out.write(output_buffer[n]);
        }
        // audio data is ready
        audio_out_valid.write(true);
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
