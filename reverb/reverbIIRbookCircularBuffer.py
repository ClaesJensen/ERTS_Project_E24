from math import cos, sin, sinh, pi, sqrt, floor, atan2, log, log10
from enum import Enum
import numpy as np
import soundfile as sf
import math
import matplotlib.pyplot as plt
from typing import Callable
import wave
import csv

class allPassReverberatorSection:
    def __init__(self, a: float, D: int, input_size: int):
        
        self.a = a
        self.D = D
        self.w = np.zeros(self.D)
        self.x = np.zeros(self.D)
        self.idx = 0 # Index for the circular buffer


    def process(self, input: np.ndarray) -> np.ndarray:
        output = np.zeros(len(input))
        for n in range(len(input)):
            # Calculate the index for the delay
            delayed_idx = (self.idx - self.D) % self.D

            x_n_D = self.x[delayed_idx]
            w_n_D = self.w[delayed_idx]

            # Compute y[n] using the first equation
            y_n = -self.a * input[n] + w_n_D

            # Compute w[n] using the second equation
            w_n = self.a * y_n + input[n]

            # Update the circular buffer
            self.x[self.idx] = input[n]
            self.w[self.idx] = w_n

            # Store the computed value in the output    
            output[n] = y_n

            # Increment the circular buffer index
            self.idx = (self.idx + 1) % self.D
        return output

class allpassReverberatorChain:
    def __init__(self, a_values: np.ndarray, D_values: np.ndarray, input_size: int):
        self.N_allpass_filters = len(a_values)
        self.reverberators = []
        for i in range(self.N_allpass_filters):
            self.reverberators.append(allPassReverberatorSection(a_values[i], D_values[i], input_size))

    def process(self, input: np.ndarray) -> np.ndarray:
           for reverberator in self.reverberators:
               input = reverberator.process(input)
           return input
    
class feedbackCombFilterSection:
    def __init__ (self, a: float, K: int, input_size: int):
        self.a = a
        self.K = K
        self.delay_buffer = np.zeros(K)
        self.idx = 0 # circular buffer index

    def process(self, input: np.ndarray) -> np.ndarray:
        output = np.zeros(len(input))
        for n in range(len(input)):
            # Get the delayed sample 
            y_n_K = self.delay_buffer[self.idx]

            # Compute the current output
            output[n] = input[n] + self.a * y_n_K

            # Update the circular buffer with the current output
            self.delay_buffer[self.idx] = output[n]

            # Increment the circular buffer index
            self.idx = (self.idx + 1) % self.K
            
        return output

# This should be a vertical array of feedback comb filters taking in the input signal
class feedbackCombFilterArray:
    def __init__(self, N_comb_filters: int, a_values: np.ndarray, K_values: np.ndarray, input_size: int):
        self.N_comb_filters = N_comb_filters
        self.comb_filters = []
        for i in range(N_comb_filters):
            self.comb_filters.append(feedbackCombFilterSection(a_values[i], K_values[i], input_size))

    # The process function takes the input array and processes it through all the comb filters, returning the output as a sum of the comb filter outputs
    def process(self, input: np.ndarray) -> np.ndarray:
        output = np.zeros(len(input))
        for i in range(self.N_comb_filters):
            output += self.comb_filters[i].process(input)
        
        output /= self.N_comb_filters
        return output

class reverbEffect:
    def __init__(self, a_values_reverberator: np.ndarray, a_values_comb_filter: np.ndarray, D_values: np.ndarray, K_values: np.ndarray, input_size: int, mix: float):
        self.allpass_reverberator = allpassReverberatorChain(a_values_reverberator, D_values, input_size)
        self.comb_filter = feedbackCombFilterArray(len(K_values), a_values_comb_filter, K_values, input_size)
        self.mix = mix  # Mix percentage (0.0 to 1.0)

    def process(self, input: np.ndarray) -> np.ndarray:
        dry_signal = input
        processed_audio = self.allpass_reverberator.process(input)
        processed_audio = self.comb_filter.process(processed_audio)
        
        # Mix dry and wet signals
        output = (1 - self.mix) * dry_signal + self.mix * processed_audio
        return output

class AudioEffectApplier:
    def __init__(self, filePath: str, outputFilePath: str, fractional_bits=15):
        self.outputFilePath = outputFilePath
        self.audiofile = wave.open(filePath, "r")
        self.fractional_bits = fractional_bits
        # Save audiofile parameters
        self.sampleWidth = self.audiofile.getsampwidth()
        self.channels = self.audiofile.getnchannels()
        self.frames = self.audiofile.getnframes()
        self.fs = self.audiofile.getframerate()

        # Read audio file to buffer
        raw_input_audio_buffer = self.audiofile.readframes(self.frames)
        pcm_int16 = np.frombuffer(raw_input_audio_buffer, dtype=np.int16)

        # Convert and normalize
        pcm_float32 = pcm_int16.astype(np.float32) / 2**fractional_bits

        self.pcm_left = np.array([pcm_float32[i] for i in range(0, len(pcm_float32) - 1, 2)], dtype=np.float32)
        self.pcm_right = np.array([pcm_float32[i] for i in range(1, len(pcm_float32), 2)], dtype=np.float32)

        # Close file
        self.audiofile.close()

    def signed(self, n, bits=16):
        n &= (1 << bits) - 1 
        if n >> (bits - 1):
            n -= 1 << bits
        return n

    def to_float(self, x: int, n: int):
        c = abs(int(x))
        sign = 1
        if (x < 0):
            c = int(x) - 1
            c = ~c
            sign = -1
        f = float((1.0 * c) / 2**n)
        f = f*sign
        return f
    
    def to_fixed(self, f: float, n: int):
        a = f*(2**n)
        b = int(round(a))
        if (a < 0):
            b = abs(b)
            b = ~b
            b = b + 1
        return b


    def process(self, effect_function: Callable[[np.ndarray], np.ndarray]):
        # Apply the effect function to the audio data
        processed_audio = effect_function(self.pcm_left)

        # Convert back to int16
        processed_audio_int16 = (processed_audio * 2**self.fractional_bits).astype(np.int16)

        # Write the processed audio to the output .wav file
        sf.write(self.outputFilePath, processed_audio_int16, self.fs)

        return processed_audio

# Example usage
if __name__ == "__main__":
    # Delays M1, M2, M3
    M1 = 1051
    M2 = 337
    M3 = 113
    # Feedback coefficient
    g = 0.85

    # Create a single reverberator

    # Create an instance of AudioEffectApplier
    audio_effect_applier = AudioEffectApplier("klap.wav", "OutputCircular4test.wav", fractional_bits=15)

    # Allpass values
    M_values = [89, 131, 563, 3001]
    a = 0.85
    a_values_allpass = [a, a, a, a]
    
    # Comb values, 0.8 is chosen for a long natural sounding reverb
    a_values_comb = [0.65, 0.75, 0.75, 0.66, 0.85, 0.81]
    fs = audio_effect_applier.fs
    K_values = [1511, 1723, 2137, 2731, 3163, 4001]

    reverbEffectInstance = reverbEffect(a_values_allpass, a_values_comb, M_values, K_values, len(audio_effect_applier.pcm_left), 1.0)

    # Process the audio
    processed_audio_left = reverbEffectInstance.process(audio_effect_applier.pcm_left)

    #Combine left and right to WAV format and write to output.wav
    audio_effect_applier.process(lambda x: processed_audio_left)

    # Save 10,000 samples of the input data from the left channel to a CSV file
    with open('input_left_channel.csv', 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(['Sample Index', 'Amplitude'])
        for i in range(min(10000, len(audio_effect_applier.pcm_left))):
            csvwriter.writerow([i, audio_effect_applier.pcm_left[i]])

    # Save 10,000 samples of the processed audio left channel to a CSV file
    with open('processed_audio_left_channel.csv', 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(['Sample Index', 'Amplitude'])
        for i in range(min(10000, len(processed_audio_left))):
            csvwriter.writerow([i, processed_audio_left[i]])

    # (Optional) Plot the result
    """ plt.plot((processed_audio_left), label="Left Channel")
    plt.title("Output Signal")
    plt.xlabel("Sample Index")
    plt.ylabel("Amplitude")
    plt.show() """

    

    # Take the difference between the klap.wav and the output.wav
    # to see the effect of the all-pass reverberator
    diff = audio_effect_applier.pcm_left - processed_audio_left
    plt.plot(diff)
    plt.title("Difference between input and output")
    plt.xlabel("Sample Index")
    plt.ylabel("Amplitude")
    plt.show()
