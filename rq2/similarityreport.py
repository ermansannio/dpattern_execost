import os
import difflib

# Similarity bounds
similarity_threshold_from = 0.95
similarity_threshold_to = 1

# Median value
median= 53379.0

# Median tollerance index
tollerace_index_perc=5
margin = median * (tollerace_index_perc / 100)
median_min = median - margin
median_max = median + margin

# Functions directory
folder='../dataset/functions'

# Source CSV
csvfile='./similar_pairs_gas_red_filtered.csv'

# White space removing function
def unified_diff_ignore_space(a, b, **kwargs):
    diff = difflib.unified_diff(a, b, **kwargs)

    for line in diff:
        yield line.rstrip()

# Compute the diff between two Solidity files
def calculate_diff(file1_path, file2_path):
    # Read file content
    with open(file1_path, 'r') as file1, open(file2_path, 'r') as file2:
        file1_content = file1.readlines()
        file2_content = file2.readlines()

    # Execute diff
    diff = unified_diff_ignore_space(file1_content, file2_content, fromfile='file1', tofile='file2', lineterm='')

    # Get diff as string
    return '\n'.join(diff)

# Open txt file to print report
with open(f"report_svfun_{str(similarity_threshold_from).replace('.', '')}_{str(similarity_threshold_to).replace('.', '')}__red.txt", 'w') as report_file:
    # Write report header
    report_file.write("Similarity Report:\n\n")
    report_file.write(f"Median: {median}. Tollerance range: {median_min} - {median_max}\n\n")

    # Read the CSV source and filter on similarity value
    with open(csvfile, 'r') as csv_file:
        # Skip header
        next(csv_file)
        pair_nr=0;
        for line in csv_file:
            # Split CSV to obtain values
            row = line.strip().split(',')
            similarity = float(row[2])
            if (similarity > similarity_threshold_from) and (similarity < similarity_threshold_to):
                
                row_file, column_file, row_price_high,  column_price_high, row_gas_price, column_gas_price= row[0], row[1], row[3], row[4], row[5], row[6]
                
                # Get similar functions with different names
                if(row_file.split("_")[-1] != column_file.split("_")[-1]):
                    
                    # Get only functions which are not around the median defined by a tolerance index 
                    if(not((median_min<=float(row_gas_price)<=median_max)and(median_min<=float(column_gas_price)<=median_max))):
                        pair_nr+=1
                        # Get solidity files path
                        row_file_path = os.path.join(folder, row_file)
                        column_file_path = os.path.join(folder, column_file)

                        # Diff computation
                        diff_result = calculate_diff(row_file_path, column_file_path)

                        # Write to report
                        report_file.write(f"File 1: {row_file} {row_gas_price} {row_price_high}\nFile 2: {column_file} {column_gas_price} {column_price_high}\nSimilarity: {similarity}\nDifference:\n{diff_result}\n\n")
        report_file.write(f"Pair found: {pair_nr}")
print("Report successfully done.")
