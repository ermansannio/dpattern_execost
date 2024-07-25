import difflib
import pandas as pd
import re

def create_html_diff_report(file_pairs_csv, output_file):
    html_diff = difflib.HtmlDiff()
    file_pairs_df = pd.read_csv(file_pairs_csv)  # Carica le coppie di file da CSV
    folder="../dataset/smart_contracts"
    with open(output_file, 'w') as report_file:
        report_file.write("<html><body>")
        # Add general legend
        report_file.write("<table class='diff' summary='Legends'>")
        report_file.write("<tr> <th colspan='2'> Legends </th> </tr>")
        report_file.write("<tr> <td> <table border='' summary='Colors'>")
        report_file.write("<tr><th> Colors </th> </tr>")
        report_file.write("<tr><td class='diff_sub'>Expensive function contract</td></tr>")
        report_file.write("<tr><td class='diff_chg'>Changed</td> </tr>")
        report_file.write("<tr><td class='diff_add'>Normal function contract</td> </tr>")
        report_file.write("</table></td>")
        report_file.write("<td> <table border='' summary='Links'>")
        report_file.write("<tr><th colspan='2'> Links </th> </tr>")
        report_file.write("<tr><td>(f)irst change</td> </tr>")
        report_file.write("<tr><td>(n)ext change</td> </tr>")
        report_file.write("<tr><td>(t)op</td> </tr>")
        report_file.write("</table></td> </tr>")
        report_file.write("</table>")
        report_file.write("<br>")
        for index, row in file_pairs_df.iterrows():
            file1 = folder+row['File1']
            file2 = folder+row['File2']
            with open(file1, 'r') as f1, open(file2, 'r') as f2:
                file1_content = f1.readlines()
                file2_content = f2.readlines()
            # Add table with diff data
            report_file.write("<br>")
            report_file.write("<table border='1'>")
            report_file.write("<tr><th>Function 1</th><th>Gas price 1</th><th>Function 2</th><th>Gas price 2</th><th>Similarity</th></tr>")
            report_file.write("<tr>")
            report_file.write(f"<td class='diff_sub'>{row['Fun1']}</td>")
            report_file.write(f"<td>{row['Gas1']}</td>")
            report_file.write(f"<td class='diff_add'>{row['Fun2']}</td>")
            report_file.write(f"<td>{row['Gas2']}</td>")
            report_file.write(f"<td>{row['Sim']}</td>")
            report_file.write("</tr>")
            report_file.write("</table>")
            diff = html_diff.make_file(file1_content, file2_content, fromdesc=file1, todesc=file2)
            # Remove legend for every diff
            diff_without_legend = re.sub(r'<table class="diff" summary="Legends">.*?<\/table>.*?<\/table>', '', diff, flags=re.DOTALL)
            report_file.write(diff_without_legend)
        report_file.write("</body></html>")

# Report creation
file_pairs_csv = "diff_file_pairs.csv"
output_file = "diff_report.html"
create_html_diff_report(file_pairs_csv, output_file)
