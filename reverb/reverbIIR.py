from math import cos, sin, sinh, pi, sqrt, floor, atan2, log, log10
from enum import Enum
import numpy as np
import soundfile as sf
import matplotlib.pyplot as plt
from typing import Callable
import wave
class ResultArray:
    def __init__(self, size: int):
        self.size = size
        self.data = np.zeros(size, dtype=np.float32)

    def __getitem__(self, key: int):
        return self.data[key]

    def __setitem__(self, key: int, value: float):
        self.data[key] = value

    def __len__(self):
        return self.size

    def __str__(self):
        return str(self.data)

    def __repr__(self):
        return str(self.data)

class AllPassReverberatorSection:
    def __init__(self, g: float, D_samples: int, array_size: int):
        self.g = g
        self.D_samples = D_samples
        self.buffer = np.zeros(array_size, dtype=np.float32)
        self.idx = 0
        self.x = np.zeros(array_size, dtype=np.float32)
        self.y = np.zeros(array_size, dtype=np.float32)
        self.w = np.zeros(array_size + D_samples, dtype=np.float32)

    def process(self, input: np.ndarray) -> np.ndarray:
        output = np.zeros(len(input), dtype=np.float32)
        # Fill up the buffer of x with the input
        for n in range(len(input)):
            self.x[self.idx] = input[n]
            self.idx = (self.idx + 1) % len(self.x)

        print("Array sizes: x:" + str(self.x.size) + " y:" + str(self.y.size) + " w:" + str(self.w.size),"input:" + str(input.size), "Output:" + str(output.size))
        # Process the input
        for n in range(len(input)):
            self.w[n] = self.x[n]
            if(n - self.D_samples >= 0):
                self.w[n] += self.g * self.w[n - self.D_samples]
                self.y[n] += self.w[n - self.D_samples]
            #self.y[n] = -self.g * self.w[n] + self.w[n - self.D_samples]
            self.y[n] = -self.g * self.w[n]
            output[n] = self.y[n]
            print("Output:" + str(output[n]))
            return output
    

class AllPassReverberatorChain:
    def __init__ (self, g: float, M1: int, M2: int, M3: int, samplesize: int):
        self.sections = [
            AllPassReverberatorSection(g, M1, samplesize),
            AllPassReverberatorSection(g, M2, samplesize),
            AllPassReverberatorSection(g, M3, samplesize)
        ]

    def process(self, input: np.ndarray) -> np.ndarray:
        output = np.zeros(len(input), dtype=np.float32)
        for section in self.sections:
            input = section.process(input)
        return input

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

        #Convert and normalize
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


    def process(self, f: Callable[[np.ndarray], np.ndarray]):
        filtered_pcm_left: np.ndarray[np.float32] = f(np.copy(self.pcm_left)).astype(np.float32)
        filtered_pcm_right: np.ndarray[np.float32] = f(np.copy(self.pcm_right)).astype(np.float32)

        # Normalize
        filtered_pcm_left: np.ndarray[np.float32] = np.array(filtered_pcm_left / np.max(filtered_pcm_left)).astype(np.float32)
        filtered_pcm_right: np.ndarray[np.float32] = np.array(filtered_pcm_right / np.max(filtered_pcm_right)).astype(np.float32)

        #Convert back to fixedpoint integers
        converted_pcm_left: np.ndarray[np.int16] = np.array([pcm * (2**self.fractional_bits - 1) for pcm in filtered_pcm_left]).astype(dtype=np.int16)
        converted_pcm_right: np.ndarray[np.int16] = np.array([pcm * (2**self.fractional_bits - 1) for pcm in filtered_pcm_right]).astype(dtype=np.int16)

        raw_write: bytes = b'' 
        for i_pcm in range(len(converted_pcm_left)):
            raw_write += np.int16.tobytes(converted_pcm_left[i_pcm])
            raw_write += np.int16.tobytes(converted_pcm_right[i_pcm])

        outputFile = open(self.outputFilePath, "wb")
        writer = wave.Wave_write(outputFile)
        writer.setframerate(self.fs)
        writer.setnchannels(self.channels)
        writer.setnframes(self.frames)
        writer.setsampwidth(self.sampleWidth)
        writer.setcomptype('NONE', 'not compressed')
        writer.writeframesraw(raw_write)
        writer.close()
        outputFile.close()

        return filtered_pcm_left, filtered_pcm_right

# Example usage
if __name__ == "__main__":
    # Delays M1, M2, M3
    M1 = 1051
    M2 = 337
    M3 = 113
    # Feedback coefficient
    g = 0.7

    # Create a single reverberator

    # Create an instance of AudioEffectApplier
    audio_effect_applier = AudioEffectApplier("klap.wav", "Output.wav", fractional_bits=15)

    # Create testsection with length of input signal
    testSection = AllPassReverberatorSection(g, M1, len(audio_effect_applier.pcm_left))
    # Create an instance of AllPassReverberator
    reverberatorChain = AllPassReverberatorChain(g, M1, M2, M3, len(audio_effect_applier.pcm_left))

    # Process the audio with the all_pass_reverberator function
    processed_audio_left, processed_audio_right = audio_effect_applier.process(reverberatorChain.process)

    # (Optional) Plot the result
    plt.plot((processed_audio_left), label="Left Channel")
    plt.title("Output Signal")
    plt.xlabel("Sample Index")
    plt.ylabel("Amplitude")
    plt.show()

