#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --output=output_%j.log
#SBATCH --error=error_%j.log

fastq1="/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA/fastq/cco_com124_EO_6cm_1_R1.fastq.gz"
fastq2="/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA/fastq/cco_com124_EO_6cm_1_R2.fastq.gz"
fastq3="/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA/fastq/crh_rhy115_EO_adult_2_R1.fastq.gz"
fastq4="/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA/fastq/crh_rhy115_EO_adult_2_R2.fastq.gz"

# /usr/bin/time -v ./python-scripts/base-nt-dist.py -f $fastq1 -k 150

# /usr/bin/time -v ./python-scripts/base-nt-dist.py -f $fastq2 -k 150

# /usr/bin/time -v ./python-scripts/base-nt-dist.py -f $fastq3 -k 150

/usr/bin/time -v ./python-scripts/base-nt-dist.py -f $fastq4 -k 150