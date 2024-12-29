import csv

def extract_amplitude_to_list(input_csv):
    amplitudes = []
    with open(input_csv, 'r') as infile:
        csvreader = csv.reader(infile)
        
        # Skip the header
        next(csvreader)
        
        # Collect amplitude values into a list
        for row in csvreader:
            amplitude = row[1]  # Extract the amplitude value
            amplitudes.append(amplitude)
    
    return amplitudes

def write_amplitudes_to_csv(amplitudes, output_csv):
    with open(output_csv, 'w', newline='') as outfile:
        csvwriter = csv.writer(outfile)
        csvwriter.writerow(amplitudes)

# Extract amplitudes from input_left_channel.csv
input_amplitudes = extract_amplitude_to_list('input_left_channel.csv')
write_amplitudes_to_csv(input_amplitudes, 'input_left_channel_amplitude.csv')

# Extract amplitudes from processed_audio_left_channel.csv
processed_amplitudes = extract_amplitude_to_list('processed_audio_left_channel.csv')
write_amplitudes_to_csv(processed_amplitudes, 'processed_audio_left_channel_amplitude.csv')