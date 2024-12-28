import csv
import numpy as np
import matplotlib.pyplot as plt

def read_csv(file_path):
    expected = []
    result = []
    with open(file_path, 'r') as csvfile:
        csvreader = csv.reader(csvfile)
        next(csvreader)  # Skip header
        for row in csvreader:
            expected.append(float(row[0]))
            result.append(float(row[1]))
    return np.array(expected), np.array(result)

def calculate_differences(expected, result):
    differences = expected - result
    return differences

def calculate_statistics(differences):
    mean_diff = np.mean(differences)
    max_diff = np.max(np.abs(differences))  # Max deviation from 0
    min_diff = np.min(np.abs(differences))  # Min deviation from 0
    return mean_diff, max_diff, min_diff

def print_statistics(segment, mean_diff, max_diff, min_diff):
    print(f"Segment {segment}:")
    print(f"  Mean Difference: {mean_diff:.4f}")
    print(f"  Max Deviation: {max_diff:.4f}")
    print(f"  Min Deviation: {min_diff:.4f}")
    print()

def plot_statistics(segment_stats):
    segments = list(segment_stats.keys())
    mean_diffs = [stats['mean'] for stats in segment_stats.values()]
    max_diffs = [stats['max'] for stats in segment_stats.values()]
    min_diffs = [stats['min'] for stats in segment_stats.values()]

    plt.figure(figsize=(12, 6))

    plt.subplot(3, 1, 1)
    plt.plot(segments, mean_diffs, marker='o', label='Mean Difference')
    plt.title('Mean Difference per Segment')
    plt.xlabel('Segment')
    plt.ylabel('Mean Difference')
    plt.legend()
    plt.gca().yaxis.set_major_formatter(plt.FuncFormatter(lambda x, _: f'{x:.5f}'))

    plt.subplot(3, 1, 2)
    plt.plot(segments, max_diffs, marker='o', label='Max Deviation', color='r')
    plt.title('Max Deviation per Segment')
    plt.xlabel('Segment')
    plt.ylabel('Max Deviation')
    plt.legend()
    plt.gca().yaxis.set_major_formatter(plt.FuncFormatter(lambda x, _: f'{x:.5f}'))

    plt.subplot(3, 1, 3)
    plt.plot(segments, min_diffs, marker='o', label='Min Deviation', color='g')
    plt.title('Min Deviation per Segment')
    plt.xlabel('Segment')
    plt.ylabel('Min Deviation')
    plt.legend()
    plt.gca().yaxis.set_major_formatter(plt.FuncFormatter(lambda x, _: f'{x:.5f}'))

    plt.tight_layout()
    plt.show()

def main():
    file_path = 'testdatahls.csv'
    expected, result = read_csv(file_path)
    differences = calculate_differences(expected, result)
    
    segment_size = 500
    num_segments = len(differences) // segment_size
    
    segment_stats = {}

    print("Statistics for each segment of 500 samples:")
    for i in range(num_segments):
        segment_diffs = differences[i * segment_size:(i + 1) * segment_size]
        mean_diff, max_diff, min_diff = calculate_statistics(segment_diffs)
        print_statistics(i + 1, mean_diff, max_diff, min_diff)
        segment_stats[i + 1] = {'mean': mean_diff, 'max': max_diff, 'min': min_diff}
    
    if len(differences) % segment_size != 0:
        segment_diffs = differences[num_segments * segment_size:]
        mean_diff, max_diff, min_diff = calculate_statistics(segment_diffs)
        print_statistics(num_segments + 1, mean_diff, max_diff, min_diff)
        segment_stats[num_segments + 1] = {'mean': mean_diff, 'max': max_diff, 'min': min_diff}
    
    print("Statistics for the entire CSV:")
    mean_diff, max_diff, min_diff = calculate_statistics(differences)
    print_statistics("Total", mean_diff, max_diff, min_diff)

    # Plot the statistics for each segment
    plot_statistics(segment_stats)

if __name__ == "__main__":
    main()