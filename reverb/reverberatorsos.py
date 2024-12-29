import numpy as np
from scipy.signal import tf2sos

def transfer_function_to_sos(D, a):
    # Define numerator coefficients
    numerator = np.zeros(D + 1)
    numerator[0] = 1
    numerator[D] = -a
    
    # Define denominator coefficients
    denominator = np.zeros(D + 1)
    denominator[0] = 1
    denominator[D] = -a

    # Convert to SOS format
    sos = tf2sos(numerator, denominator)
    return sos

# Example usage
D = 5  # Delay
a = 0.7  # Parameter, -1 < a < 1
sos = transfer_function_to_sos(D, a)
print("Second-order sections (SOS):")
print(sos)