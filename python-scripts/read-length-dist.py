#!/usr/bin/env python

import argparse
import numpy as np
import matplotlib.pyplot as plt
import gzip

def get_args():
    parser = argparse.ArgumentParser(description="A program to analyze the read length of a both paired FASTQ files")
    parser.add_argument("-f1", "--file1", help="FASTQ file 1, R1")
    parser.add_argument("-f2", "--file2", help="FASTQ file 2, R2")
    return parser.parse_args()

args = get_args() 

# numpy array set to the the size of the total number of reads in the file
read_length_fq1 = np.zeros(35731051)
read_length_fq2 = np.zeros(35731051)

# go through the fastq file, and take the length of the sequence lines
with gzip.open(args.file1, "rt") as fq1:
    line_ct: int = 1
    curr_record = 0
    for line in fq1:
        if line_ct % 4 == 2:
            stripped_line = line.strip()
            read_length_fq1[curr_record] = len(stripped_line)
            curr_record += 1
        line_ct += 1

# go through the fastq file, and take the length of the sequence lines
with gzip.open(args.file2, "rt") as fq2:
    line_ct: int = 1
    curr_record = 0
    for line in fq2:
        if line_ct % 4 == 2:
            stripped_line = line.strip()
            read_length_fq2[curr_record] = len(stripped_line)
            curr_record += 1
        line_ct += 1      

# plot the histograms on the same graph
plt.hist(read_length_fq1, label='R1', alpha=.7, edgecolor='black', color='red', bins=[40,45,50,55,60,65,70,75,80,85.90,95,100,105,110,115,120,125,130,135,140,145,150])
plt.hist(read_length_fq2, label="R2", alpha=.5, edgecolor='black', color='blue',bins=[40,45,50,55,60,65,70,75,80,85.90,95,100,105,110,115,120,125,130,135,140,145,150])

plt.legend(loc='upper left')
plt.title("Read Length Comparision between R1 and R2 FASTQ Files")
plt.xlabel("Read Length")
plt.ylabel("Frequency")
plt.tight_layout()
plt.grid(axis='y', color = 'black', linestyle = '--', linewidth = 0.5)
plt.savefig("crh_trimmed_read_lgth_dist.png")
