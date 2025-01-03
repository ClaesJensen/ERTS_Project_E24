import tkinter as tk
from tkinter import ttk
from matplotlib import pyplot as plt
import numpy as np
import sounddevice as sd
from scipy.io import wavfile

# Global variables
pitch_shift = 1.0  # Default pitch shift factor


def wrap_phase(angles):
    # Vectorized wrap to (-pi, pi]
    angles = (angles + np.pi) % (2 * np.pi) - np.pi
    return angles


def process_audio():
    global pitch_shift
    # Params
    hop = 1 / 2
    w_size = 1024
    hop_size = int(w_size * hop)

    fs, data = wavfile.read("./crazy.wav")
    x = data[:, 0]
    N = len(x)
    remainder = N % w_size

    if remainder == 0:
        # Already a multiple of w_size, no padding needed
        padded = x.astype(np.float64)
    else:
        to_add = w_size - remainder
        padded = np.concatenate([x, np.zeros(to_add, dtype=x.dtype)]).astype(np.float64)

    sound_out = np.zeros(len(padded))

    N_pad = len(padded)

    last_input_phase = np.zeros(w_size)
    last_output_phase = np.zeros(w_size)
    analysis_freq = np.zeros(w_size)
    analysis_mag = np.zeros(w_size)
    synth_freq = np.zeros(w_size)
    synth_mag = np.zeros(w_size)

    # Analysis/Synthesis loop
    for i in range(0, N_pad - w_size, hop_size):
        x_sig = padded[i : i + w_size]
        window = np.hanning(w_size)
        x_windowed = x_sig * window

        X = np.fft.fft(x_windowed)

        # Analysis step
        half_size = w_size // 2
        for bin in range(half_size):
            mag = np.abs(X[bin])
            phase = np.angle(X[bin])

            phase_diff = phase - last_input_phase[bin]
            bin_centre_freq = 2.0 * np.pi * (bin / w_size)
            phase_diff = wrap_phase(phase_diff - bin_centre_freq * hop_size)

            bin_dev = phase_diff * w_size / hop_size / (2 * np.pi)

            analysis_freq[bin] = bin + bin_dev
            analysis_mag[bin] = mag
            last_input_phase[bin] = phase

        # Reset synthesis arrays
        synth_freq.fill(0)
        synth_mag.fill(0)

        # Pitch shifting
        for n in range(half_size):
            new_bin = int(np.round(n * pitch_shift))
            if new_bin < half_size:
                synth_mag[new_bin] += analysis_mag[n]
                synth_freq[new_bin] = analysis_freq[n] * pitch_shift

        # Synthesis
        synth_fft = np.zeros(w_size, dtype=np.complex128)
        for n in range(half_size):
            mag = synth_mag[n]
            # Instantaneous frequency in cycles per sample
            inst_freq = synth_freq[n] / w_size
            # Convert to radians per sample
            inst_freq_rad = 2 * np.pi * inst_freq

            # Phase increment = instantaneous angular frequency * hop_size
            phase_diff = inst_freq_rad * hop_size

            out_phase = wrap_phase(last_output_phase[n] + phase_diff)
            last_output_phase[n] = out_phase

            synth_fft[n] = mag * (np.cos(out_phase) + 1j * np.sin(out_phase))

            if n > 0 and n < half_size:
                synth_fft[w_size - n] = np.conjugate(synth_fft[n])

        # Inverse FFT and overlap-add
        t_synth = np.fft.ifft(synth_fft)
        t_synth = np.real(t_synth)
        t_synth_windowed = t_synth * window
        sound_out[i : i + w_size] += t_synth_windowed

    # Normalize and write output
    max_amp = np.max(np.abs(sound_out))
    if max_amp > 0:
        sound_out /= max_amp
    # Convert to int16 if desired
    out_int16 = (sound_out * 32767).astype(np.int16)
    wavfile.write("./crazy_out.wav", fs, out_int16)

    # Optionally play output
    sd.play(sound_out, fs)
    sd.wait()


def on_scale_change(val):
    global pitch_shift
    pitch_shift = float(val)
    # Optionally, process audio immediately on slider change:
    # process_audio()
    # But better to do it on a button press to avoid lag.


def on_process_click():
    process_audio()


# Tkinter GUI
root = tk.Tk()
root.title("Pitch Shift Control")

scale_label = tk.Label(root, text="Pitch Shift (-2.0 to 2.0):")
scale_label.pack(pady=10)

pitch_scale = tk.Scale(
    root,
    from_=-2.0,
    to=2.0,
    resolution=0.01,
    orient=tk.HORIZONTAL,
    command=on_scale_change,
)
pitch_scale.set(1.0)  # Default at no pitch shift
pitch_scale.pack(padx=20, pady=10)

process_button = ttk.Button(root, text="Process Audio", command=on_process_click)
process_button.pack(pady=20)

root.mainloop()
