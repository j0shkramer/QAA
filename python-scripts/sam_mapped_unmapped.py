#!/usr/bin/env python

import argparse

def get_args():
    parser = argparse.ArgumentParser(description="A program that takes a SAM file and finds the number of mapped and unmapped reads")
    parser.add_argument("-s", "--samfile", help="SAM file")
    return parser.parse_args()

args = get_args()

unmapped_reads: int = 0
mapped_reads: int = 0
# seen_reads: dict[str, bool] = {} # a dictionary to store reads you've already seen so they are not counted twice

with open(args.samfile, "r") as SAM:
    for line in SAM:
        line.strip() 
        # skip the headers
        if line[0] == "@":
            continue
        else:
            # QNAME, FLAG, RNAME, POS, MAPQ, CIGAR, RNEXT, PNEXT, TLEN. SEQ. QUAL, NH, HI, AS, nM
            alignment_list = line.split() # split the alignment section into a list 
            qname = alignment_list[0]
            flag = int(alignment_list[1])
            # check the bitwise flag, if it not equal to 256 (binary). then it is a primary alignment
            if ((flag & 256) != 256):
                # check the bitwise flag again, if it is not equal to 4 (binary), then it is mapped
                if ((flag & 4) != 4):
                    mapped_reads += 1
                else:
                    unmapped_reads += 1
            else:
                continue
            
print(f'Mapped reads:{mapped_reads}')
print(f'Unmapped reads:{unmapped_reads}')