import pandas as pd
import os
import re
from scipy.stats import fisher_exact

# Read functions file
with open('./functions.txt', 'r') as file:
    lines = file.readlines()

# Dictionaries support variables
data = []
for line in lines:
    nome, valore = line.strip().split()
    data.append({'SmartContract': nome, 'Value': valore.lower() == 'true'})

# DataFrame reation
df = pd.DataFrame(data)

# Filtered smart contracts folder
folder = '../dataset/pattern'

# 6 selected regular expresions
patterns = [
    r'\w+\s+constant\s+?\w+\s*=\s*0x[a-fA-F0-9]+',
    r'administrators\[0x\w+\]\s*=\s*true',
    r'function\s+withdraw\s*\(\s*\)', 
    r'redistribution',
    r'bool\s+public\s+only+(Ambassadors|Founders)+\s*=\s*true\s*',
    r'function\s+disableInitialStage\s*\(\s*\)',
]

# Report initializzation
report_lines = []

# Dataset update with file content and pattern verification
for pattern in patterns:
    # Add a column for current pattern
    df['pattern'] = 0
    
    for index, row in df.iterrows():
        nome_smart_contract = row['SmartContract']
        first_underscore_index = nome_smart_contract.find('_')
        new_name = nome_smart_contract[:first_underscore_index] + '.sol'
        file_path = os.path.join(folder, f"{new_name}")
        if os.path.exists(file_path):
            with open(file_path, 'r', encoding="utf-8") as file:
                content = file.read()
            # Patter presence verification
            if re.search(pattern, content):
                df.at[index, 'pattern'] = 1
            else:
                df.at[index, 'pattern'] = 0
        else:
            print(f"File not found: {file_path}")
    
    # Create contingency table
    contingency_table = pd.crosstab(df['pattern'], df['Value'], margins=True, margins_name='Total')
    
    # Fisher test computation
    table_values = contingency_table.values[:2, :2]
    odds_ratio, p_value = fisher_exact(table_values)

    # Add results to report
    report_lines.append(f"Pattern: {pattern}")
    report_lines.append("Contingency Table:")
    report_lines.append(contingency_table.to_string())
    report_lines.append(f"Odds Ratio: {odds_ratio}")
    report_lines.append(f"P-Value: {p_value}")
    report_lines.append("\n")

# Write report to txt file
out_file_name = 'fisher_report_1.txt'
with open(out_file_name, 'w') as file:
    file.write("\n".join(report_lines))

print("Report saved on ", out_file_name)
