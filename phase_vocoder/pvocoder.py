from matplotlib import pyplot as plt
import numpy as np
import sounddevice as sd
from scipy.io import wavfile


# Params:

hop = 1 / 2
w_size = 1024
hop_size = int(w_size * hop)


fs, data = wavfile.read("./crazy.wav")
x = data[:, 0]
N = len(x)
remainder = N % w_size

if remainder == 0:
    # Already a multiple of w_size, no padding needed
    padded = x
else:
    to_add = w_size - remainder
    padded = np.concatenate([x, np.zeros(to_add, dtype=x.dtype)])

sound_out = np.zeros(len(padded))


# Helper functions
def wrap_phase(angles):
    """
    Wraps angles (in radians) to the range (-pi, pi].
    """
    # The modulo operation shifts angles into [0, 2*pi), then we shift by pi to get (-pi, pi].
    if angles >= 0:
        return (angles + np.pi) % (2 * np.pi) - np.pi
    else:
        return (angles - np.pi) % (2 * np.pi) - np.pi


print(remainder)
print(N)
print(padded.size % w_size)

N_pad = len(padded)


pitch_shift = 1

last_input_phase = np.zeros(w_size)
last_output_phase = np.zeros(w_size)
analysis_freq = np.zeros(w_size)
analysis_mag = np.zeros(w_size)
synth_freq = np.zeros(w_size)
synth_mag = np.zeros(w_size)

for i in range(0, N_pad - w_size, hop_size):
    x_sig = padded[i : i + w_size]
    window = np.hamming(w_size)
    x_windowed = x_sig * window

    X = np.fft.fft(x_windowed)

    # Phase to frequency
    for bin in range(len(X) // 2):
        mag = np.abs(X[bin])
        phase = np.angle(X[bin])

        phase_diff = phase - last_input_phase[bin]

        bin_centre_freq = 2.0 * np.pi * (bin / w_size)
        phase_diff = wrap_phase(phase_diff - bin_centre_freq * hop_size)

        bin_dev = phase_diff * w_size / hop_size / (2 * np.pi)

        analysis_freq[bin] = bin + bin_dev

        analysis_mag[bin] = mag
        last_input_phase[bin] = phase

    # Zero out synthesis frequencies
    for n in range(w_size // 2):
        synth_freq[n] = 0
        synth_mag[n] = 0

    # Handle pitch shift
    for n in range(w_size // 2):
        new_bin = int(np.round(n * pitch_shift))

        if new_bin <= w_size / 2:
            synth_mag[new_bin] += analysis_mag[n]
            synth_freq[new_bin] = analysis_freq[n] * pitch_shift

    # Resynthesize signal based of fft
    synth_fft = np.zeros_like(np.arange(w_size), dtype=np.complex128)
    for n in range(int(w_size / 2)):
        mag = synth_mag[n]

        bin_dev = synth_freq[n] - n

        phase_diff = bin_dev * 2 * np.pi * hop_size / w_size

        bin_centre_freq = 2 * np.pi * n / w_size
        phase_diff = bin_centre_freq * w_size

        out_phase = wrap_phase(last_output_phase[n] + phase_diff)
        synth_fft[n] = mag * np.cos(out_phase) + 1j * mag * np.sin(out_phase)

        if n > 0 and n < w_size / 2:
            synth_fft[w_size - n] = np.conjugate(synth_fft[n])

        last_output_phase[n] = out_phase

    # t_synth = np.fft.fft(np.conjugate(synth_fft)) / w_size
    t_synth = np.fft.ifft(synth_fft)
    t_synth = np.real(t_synth)
    t_synth_windowed = t_synth * window
    sound_out[i : i + w_size] += t_synth_windowed

# Ensuring that the size of the array is a power of 2
# next_power = 1 << (N - 1).bit_length()
# print(next_power)
wavfile.write("./crazy_out.wav", fs, sound_out)

plt.plot(sound_out)
plt.figure()

plt.plot(x)
plt.show()
sd.play(data, fs)
sd.wait()

sd.play(sound_out / 10000, fs)
sd.wait()
