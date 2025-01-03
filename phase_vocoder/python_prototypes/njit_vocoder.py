from matplotlib import pyplot as plt
import numpy as np
import sounddevice as sd
from scipy.io import wavfile
from tqdm import tqdm
from numba import njit

# Params
hop = 1 / 4
w_size = 1024
hop_size = int(w_size * hop)

fs, data = wavfile.read("./Crazy Frog - Axel F (Official Video).wav")
x = data[:, 0]
N = len(x)
remainder = N % w_size

if remainder == 0:
    padded = x
else:
    to_add = w_size - remainder
    padded = np.concatenate([x, np.zeros(to_add, dtype=x.dtype)])

sound_out = np.zeros(len(padded))

N_pad = len(padded)

pitch_shift = 1

last_input_phase = np.zeros(w_size)
last_output_phase = np.zeros(w_size)
analysis_freq = np.zeros(w_size)
analysis_mag = np.zeros(w_size)
synth_freq = np.zeros(w_size)
synth_mag = np.zeros(w_size)

window = np.hanning(w_size)


@njit
def wrap_phase(angle):
    if angle >= 0:
        return (angle + np.pi) % (2 * np.pi) - np.pi
    else:
        return (angle - np.pi) % (2 * np.pi) - np.pi


@njit
def compute_analysis(
    X, last_input_phase, analysis_freq, analysis_mag, w_size, hop_size
):
    half = w_size // 2
    for bin in range(half):
        mag = np.abs(X[bin])
        phase = np.angle(X[bin])

        phase_diff = phase - last_input_phase[bin]
        bin_centre_freq = 2.0 * np.pi * (bin / w_size)
        phase_diff = wrap_phase(phase_diff - bin_centre_freq * hop_size)
        bin_dev = phase_diff * w_size / hop_size / (2 * np.pi)

        analysis_freq[bin] = bin + bin_dev
        analysis_mag[bin] = mag
        last_input_phase[bin] = phase


@njit
def apply_pitch_shift(
    analysis_freq, analysis_mag, synth_freq, synth_mag, pitch_shift, w_size
):
    half = w_size // 2
    # Zero out synthesis frequencies/magnitudes
    for n in range(half):
        synth_freq[n] = 0.0
        synth_mag[n] = 0.0
    # Map analysis bins to synthesis bins
    for n in range(half):
        new_bin = int(round(n * pitch_shift))
        if new_bin < half:
            synth_mag[new_bin] += analysis_mag[n]
            synth_freq[new_bin] = analysis_freq[n] * pitch_shift


@njit
def reconstruct_spectrum(synth_freq, synth_mag, last_output_phase, w_size, hop_size):
    half = w_size // 2
    synth_fft = np.zeros(w_size, dtype=np.complex128)
    for n in range(half):
        mag = synth_mag[n]
        inst_freq = synth_freq[n] / w_size
        inst_freq_rad = 2 * np.pi * inst_freq
        phase_diff = inst_freq_rad * hop_size
        out_phase = wrap_phase(last_output_phase[n] + phase_diff)
        last_output_phase[n] = out_phase

        synth_fft[n] = mag * (np.cos(out_phase) + 1j * np.sin(out_phase))
        if n > 0:
            synth_fft[w_size - n] = np.conjugate(synth_fft[n])
    return synth_fft


while True:
    print("Enter pitch shift value (semitones): ")
    pitch_shift_input = eval(input())
    pitch_shift = np.power(2, pitch_shift_input / 12)

    # Run the main loop:
    # We keep FFT and output out of njit. The inner computations are accelerated.
    sound_out[:] = 0.0  # Reset output
    for i in tqdm(range(0, N_pad - w_size, hop_size)):
        x_sig = padded[i : i + w_size]
        x_windowed = x_sig * window

        # FFT in Python space (not jitted)
        X = np.fft.fft(x_windowed)

        # Analysis step
        compute_analysis(
            X, last_input_phase, analysis_freq, analysis_mag, w_size, hop_size
        )

        # Pitch shift step
        apply_pitch_shift(
            analysis_freq, analysis_mag, synth_freq, synth_mag, pitch_shift, w_size
        )

        # Synthesis (reconstruction of spectrum)
        synth_fft = reconstruct_spectrum(
            synth_freq, synth_mag, last_output_phase, w_size, hop_size
        )

        # IFFT in Python space (not jitted)
        t_synth = np.fft.ifft(synth_fft).real
        t_synth_windowed = t_synth * window
        sound_out[i : i + w_size] += t_synth_windowed

    max_amp = np.max(np.abs(sound_out))
    if max_amp > 0:
        sound_norm = sound_out / max_amp
    else:
        sound_norm = sound_out

    sound_out_int16 = (sound_norm * 32767).astype(np.int16)
    wavfile.write("./crazy_out.wav", fs, sound_out_int16)
    sd.play(sound_out, fs)
    sd.wait()
