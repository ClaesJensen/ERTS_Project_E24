from math import cos, sin, sinh, pi, sqrt, floor, atan2, log, log10
from enum import Enum
import matplotlib.pyplot as plt
from matplotlib import ticker
import fixedpoint as fp
import numpy as np

class FilterParametersCase(Enum):
    Q = 1
    BW = 2
    S = 3

class FilterParameters:
    def __init__(self, case: FilterParametersCase, dbGain: float, f0: float, fs: int, Q: float = 0, BW: float = 0, S: float = 0):
        self.isReady: bool = True    

        self.A = 10**(dbGain/40)
        self.f0 = f0
        self.fs = fs
        self.w0 = 2 * pi * self.f0/self.fs

        self.Q = Q
        self.BW = BW
        self.S = S

        if case == FilterParametersCase.Q:
            self.alpha = sin(self.w0) / (2 * Q)
        elif case == FilterParametersCase.BW:
            self.alpha = sin(self.w0) * sinh(log(2)/2 * BW * self.w0/sin(self.w0))
        elif case == FilterParametersCase.S:
            self.alpha = sin(self.w0) / 2 * sqrt((self.A + 1/self.A) * (1/self.S - 1) + 2)
        else:
            self.isReady = False

    def pri():
        pass

    @classmethod
    def Q(cls, dbGain: float, f0: float, fs: int, Q: float):
        return cls(FilterParametersCase.Q, dbGain, f0, fs, Q, 0, 0)
    
    @classmethod
    def BW(cls, dbGain: float, f0: float, fs: int, BW: float):
        return cls(FilterParametersCase.BW, dbGain, f0, fs, 0, BW, 0)

    @classmethod
    def S(cls, dbGain: float, f0: float, fs: int, S: float):
        return cls(FilterParametersCase.S, dbGain, f0, fs, 0, 0, S)  

class Biquad:
    def __init__(self, fs: float, b0: float, b1: float, b2: float, a0: float, a1: float, a2: float):
        self.fs = fs

        self.m = 4
        self.n = 12
        
        # Float init
        self.b0 = b0
        self.b1 = b1
        self.b2 = b2
        self.a0 = a0
        self.a1 = a1
        self.a2 = a2   

        # Precompute coefficients
        self.coef0 = self.b0/self.a0
        self.coef1 = self.b1/self.a0
        self.coef2 = self.b2/self.a0
        self.coef3 = self.a1/self.a0
        self.coef4 = self.a2/self.a0

        print(f'b0: {self.b0} | b1: {self.b1} | b2: {self.b2} | a0: {self.a0} | a1: {self.a1} | a2: {self.a2}')

    @staticmethod
    def divisionComplex(a_real: float, b_imag: float, c_real: float, d_imag: float) -> tuple[float, float]:
        real = (a_real * c_real + b_imag * d_imag) / (c_real**2 + d_imag**2)
        imag = (b_imag * c_real - a_real * d_imag) / (c_real**2 + d_imag**2)
        return [real, imag]

    def freqResponse(self, db: bool = False, angle: bool = False):
        w = [pi*x/floor(self.fs/2) for x in range(0, floor(self.fs/2))] #self.biquad.fs
        
        H_real: list[float] = [0] * len(w)
        H_imag: list[float] = [0] * len(w)

        for i in range(len(w)):
            H_real_fragment, H_imag_fragment = Lowpass.divisionComplex(
                self.b0 + self.b1 * round(cos(w[i]), 8) + self.b2 * round(cos(2*w[i]), 8),
                self.b1 * round(-sin(w[i]), 8) + self.b2 * round(-sin(2*w[i]), 8),
                self.a0 + self.a1 * round(cos(w[i]), 8) + self.a2 * round(cos(2*w[i]), 8),
                self.a1 * round(-sin(w[i]), 8) + self.a2 * round(-sin(2*w[i]), 8))
            H_real[i] = H_real_fragment
            H_imag[i] = H_imag_fragment


        if (angle):
            phase = [atan2(H_real[i], H_imag[i]) / pi * 180 for i in range(len(w))]
        else:
            phase = [atan2(H_real[i], H_imag[i]) for i in range(len(w))]

        if (db):
            power = [sqrt(pow(H_real[i], 2) + pow(H_imag[i], 2)) for i in range(len(w))]
            
            for i in range(len(power)):
                if (power[i] == 0):
                    power[i] = 0
                else:
                    power[i] = 20*log10(power[i])
        else:
            power = [round(sqrt(pow(H_real[i], 2) + pow(H_imag[i], 2)), 4) for i in range(len(w))]

        return power, phase
    
    def plotFreqResponse(self, db: bool, angle: bool, size: tuple[int, int] = [8, 10]):
        power, phase = self.freqResponse(db, angle)

        fig = plt.figure()
        fig.set_size_inches(size[0], size[1])
        
        ax = fig.add_subplot(2,1,1)
        ax.set_title("Frequency Response")

        ax.semilogx(power)
        ax.grid(True, which="both")

        if (db):
            ax.set_ylabel("Gain [dB]")
            ax.set_ybound(lower=-60)
        else:
            ax.set_ylabel("Gain [linear]")
            ax.set_ybound(lower=0)
        ax.set_xlabel("Frequency [Hz]")
        ax.get_xaxis().set_major_formatter(ticker.FuncFormatter(lambda x, p: format(int(x))))

        ax2 = fig.add_subplot(2,1,2)
        ax2.semilogx(phase)
        ax2.grid(True, which="both")

        if (angle):
            ax2.set_ylabel("Phase [deg]")
            ax2.set_ybound(lower=-180, upper=180)
        else:
            ax2.set_ylabel("Phase [rad]")
            ax2.set_ybound(lower=-pi, upper=pi)
        ax2.set_xlabel("Frequency [Hz]")
        ax2.get_xaxis().set_major_formatter(ticker.FuncFormatter(lambda x, p: format(int(x))))
        
    
    def stepResponse(self, duration: float):
        x: list[float] = [0] * floor(self.fs * duration)
        x[0] = 1

        return self.process(x)

    def plotStepResponse(self, durationSec: float, size: tuple[int, int] = [8, 10]):
        fig = plt.figure()
        fig.set_size_inches(size[0], size[1])
        ax = fig.add_subplot(1,1,1)
        ax.plot([t/self.fs for t in range(0, floor(self.fs * durationSec) - 1)], self.stepResponse(durationSec), marker="x")
        ax.set_xlabel("Time [s]")
        ax.set_ylabel("Amplitude [relative]")
        ax.set_title("Step Response")
        ax.grid(True)

    def process(self, x: np.ndarray[np.float32]):
        x = np.concat([np.zeros(shape=(2), dtype=np.float32), x])
        y: np.array = np.zeros(shape=(len(x)), dtype=np.float32)
        return np.array([self.single(x[i], x[i-1], x[i-2], y[i-1], y[i-2]) for i in range(2, len(x))], dtype=np.float32)

    def single(self, x0: float, x1: float, x2: float, y1: float, y2: float): 
        return np.float32(self.b0 / self.a0 * x0 + self.b1 / self.a0 * x1 + self.b2 / self.a0 * x2 - self.a1 / self.a0 * y1 - self.a2 / self.a0 * y2)
    
    def GetFpCoeffs(self, frac: int):
        self.fp_b0_a0: int = int(self.b0/self.a0 * (2**frac - 1))
        self.fp_b1_a0: int = int(self.b1/self.a0 * (2**frac - 1))
        self.fp_b2_a0: int = int(self.b2/self.a0 * (2**frac - 1))
        self.fp_a1_a0: int = int(self.a1/self.a0 * (2**frac - 1))
        self.fp_a2_a0: int = int(self.a2/self.a0 * (2**frac - 1))

        return [self.fp_b0_a0, self.fp_b1_a0, self.fp_b2_a0, self.fp_a1_a0, self.fp_a2_a0]

    def processFp(self, x: np.ndarray[int], frac: int):
        self.fp_b0_a0: int = int(self.b0/self.a0 * (2**frac - 1))
        self.fp_b1_a0: int = int(self.b1/self.a0 * (2**frac - 1))
        self.fp_b2_a0: int = int(self.b2/self.a0 * (2**frac - 1))
        self.fp_a1_a0: int = int(self.a1/self.a0 * (2**frac - 1))
        self.fp_a2_a0: int = int(self.a2/self.a0 * (2**frac - 1))

        x = np.concat([np.zeros(shape=(2), dtype=np.int64), x])
        y: np.array = np.zeros(shape=(len(x)), dtype=np.int64)
        return np.array([self.singleFp(x[i], x[i-1], x[i-2], y[i-1], y[i-2], frac) for i in range(2, len(x))], dtype=np.int64)
    
    def singleFp(self, x0: int, x1: int, x2: int, y1: int, y2: int, frac: int): 
        return (int(self.fp_b0_a0 * x0) >> frac) + (int(self.fp_b1_a0 * x1) >> frac) + (int(self.fp_b2_a0 * x2) >> frac) - (int(self.fp_a1_a0 * y1) >> frac) - (int(self.fp_a2_a0 * y2) >> frac)

class Lowpass(Biquad):
    def __init__(self, filter: FilterParameters):
        assert filter.isReady
        super().__init__(
            filter.fs,
            (1 - cos(filter.w0)) / 2,
            1 - cos(filter.w0),
            (1 - cos(filter.w0)) / 2,
            1 + filter.alpha,
            -2 * cos(filter.w0),
            1 - filter.alpha
        )

class Highpass(Biquad):
    def __init__(self, filter: FilterParameters):
        assert filter.isReady
        super().__init__(
            filter.fs,
            (1 + cos(filter.w0)) / 2,
            -(1 + cos(filter.w0)),
            (1 + cos(filter.w0)) / 2,
            1 + filter.alpha,
            -2 * cos(filter.w0),
            1 - filter.alpha
        )

class BandpassPeakGain(Biquad):
    def __init__(self, filter: FilterParameters):
        assert filter.isReady
        super().__init__(
            filter.fs,
            sin(filter.w0)/2,
            0,
            -sin(filter.w0)/2,
            1 + filter.alpha,
            -2*cos(filter.w0),
            1 - filter.alpha
        )

class Bandpass(Biquad):
    def __init__(self, filter: FilterParameters):
        assert filter.isReady
        super().__init__(
            filter.fs,
            filter.alpha,
            0,
            -filter.alpha,
            1 + filter.alpha,
            -2*cos(filter.w0),
            1 - filter.alpha
        )

class Notch(Biquad):
    def __init__(self, filter: FilterParameters):
        assert filter.isReady
        super().__init__(
            filter.fs,
            1,
            -2*cos(filter.w0),
            1,
            1 + filter.alpha,
            -2*cos(filter.w0),
            1 - filter.alpha
        )

class Allpass(Biquad):
    def __init__(self, filter: FilterParameters):
        assert filter.isReady
        super().__init__(
            filter.fs,
            1 - filter.alpha,
            -2*cos(filter.w0),
            1 + filter.alpha,
            1 + filter.alpha,
            -2*cos(filter.w0),
            1 - filter.alpha
        )

class PeakingEQ(Biquad):
    def __init__(self, filter: FilterParameters):
        assert filter.isReady
        super().__init__(
            filter.fs,
            1 + filter.alpha * filter.A,
            -2 * cos(filter.w0),
            1 - filter.alpha * filter.A,
            1 + filter.alpha / filter.A,
            -2*cos(filter.w0),
            1 - filter.alpha / filter.A
        )

class LowShelf(Biquad):
    def __init__(self, filter: FilterParameters):
        assert filter.isReady
        super().__init__(
            filter.fs,
            filter.A * ((filter.A + 1) - (filter.A - 1) * cos(filter.w0) + 2 * sqrt(filter.A) * filter.alpha),
            2 * filter.A * ((filter.A-1) - (filter.A+1) * cos(filter.w0)),
            filter.A * ((filter.A + 1) - (filter.A-1) * cos(filter.w0) - 2 * sqrt(filter.A) * filter.alpha),
            (filter.A + 1) + (filter.A - 1) * cos(filter.w0) + 2 * sqrt(filter.A) * filter.alpha,
            -2*((filter.A-1) + (filter.A+1) * cos(filter.w0)),
            (filter.A+1) + (filter.A-1) * cos(filter.w0) - 2 * sqrt(filter.A) * filter.alpha
        )

class HighShelf(Biquad):
    def __init__(self, filter: FilterParameters):
        assert filter.isReady
        super().__init__(
            filter.fs,
            filter.A * ((filter.A + 1) + (filter.A - 1) * cos(filter.w0) + 2 * sqrt(filter.A) * filter.alpha),
            -2 * filter.A * ((filter.A-1) + (filter.A+1) * cos(filter.w0)),
            filter.A * ((filter.A + 1) + (filter.A-1) * cos(filter.w0) - 2 * sqrt(filter.A) * filter.alpha),
            (filter.A + 1) - (filter.A - 1) * cos(filter.w0) + 2 * sqrt(filter.A) * filter.alpha,
            2*((filter.A-1) - (filter.A+1) * cos(filter.w0)),
            (filter.A+1) - (filter.A-1) * cos(filter.w0) - 2 * sqrt(filter.A) * filter.alpha
        )

class FilterCollection:
    def __init__(self, filters: list[Biquad], fs: int):
        assert FilterCollection.checkFs(filters) == 0
        self.filters = filters
        print(self.filters)
        self.fs = fs


    @staticmethod
    def checkFs(filters: list[Biquad]):
        for i in range(1, len(filters)):
            if (filters[i-1].fs != filters[i].fs):
                return -1
        return 0
    
    @staticmethod
    def phaseWrap(phase: list[float], angle: bool):
        adjustment: float = 0
        for i in range(len(phase)):
            if (phase[i] + adjustment > 180):
                adjustment = adjustment - 360
            elif (phase[i] + adjustment < -180):
                adjustment = adjustment + 360
            
            phase[i] = phase[i] + adjustment

        return phase
    
    def coeffs(self, fixedPoint: bool = False, fractional_bits: int = 15): 
        coeffs: list[list[float]] = []

        if (fixedPoint):
            for filter in self.filters:
                coeffs.append(filter.GetFpCoeffs(fractional_bits))
        else:
             for filter in self.filters:
                coeffs.append([filter.b0 / filter.a0, filter.b1 / filter.a0, filter.b2 / filter.a0, filter.a1 / filter.a0, filter.a2 / filter.a0])

        return coeffs
    
    @staticmethod
    def toFixedPoint(coeffs: list[int], fractional_bits: int):
        for i in range(len(coeffs)):
            coeffs[i] = int(round(coeffs[i] * (2**fractional_bits - 1)))
        return coeffs
        

    
    def process(self, x: np.ndarray[np.float32]):
        y = x
        if (len(self.filters) > 0):
            for filter in self.filters:
                y = filter.process(y)
        return y
    
    def processFp(self, x: np.ndarray[np.int64], frac: int):
        y = x
        if (len(self.filters) > 0):
            for filter in self.filters:
                y = filter.processFp(y, frac)
        return y

        
    def freqResponse(self, db: bool, angle: bool):
        power: list[float] = [0] * floor(self.fs/2)
        phase: list[float] = [0] * floor(self.fs/2)
        for filter in self.filters:
            power_single, phase_single = filter.freqResponse(db, angle)
            if (db):
                power = [20*log10(10**(power[i]/20) * 10**(power_single[i]/20)) for i in range(len(power))]
            else:
                power = [power[i] * power_single[i] for i in range(len(power))]
            phase = [phase[i] + phase_single[i] for i in range(len(phase))]



        return power, phase

    def plotFreqResponse(self, db: bool, angle: bool, size: tuple[int, int] = [8, 10]):
        power, phase = self.freqResponse(db, angle)

        fig = plt.figure()
        fig.set_size_inches(size[0], size[1])
        
        ax = fig.add_subplot(2,1,1)
        ax.set_title("Frequency Response")

        ax.semilogx(power)
        ax.grid(True, which="both")

        if (db):
            ax.set_ylabel("Gain [dB]")
            ax.set_ybound(lower=-60)
        else:
            ax.set_ylabel("Gain [linear]")
            ax.set_ybound(lower=0)
        ax.set_xlabel("Frequency [Hz]")
        ax.get_xaxis().set_major_formatter(ticker.FuncFormatter(lambda x, p: format(int(x))))

        ax2 = fig.add_subplot(2,1,2)
        ax2.semilogx(phase)
        ax2.grid(True, which="both")

        if (angle):
            ax2.set_ylabel("Phase [deg]")
            #ax2.set_ybound(lower=-180, upper=180)
        else:
            ax2.set_ylabel("Phase [rad]")
            #ax2.set_ybound(lower=-pi, upper=pi)
        ax2.set_xlabel("Frequency [Hz]")
        ax2.get_xaxis().set_major_formatter(ticker.FuncFormatter(lambda x, p: format(int(x))))