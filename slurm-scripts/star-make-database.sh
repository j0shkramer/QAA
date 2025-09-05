#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --output=output_%j.log
#SBATCH --error=error_%j.log

genomeDirectory="/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA/ccom_database"
genomeFASTA="/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA/campylomormyrus.fasta"
genomeGFT="/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA/campylomormyrus.gtf"

mamba activate QAA

/usr/bin/time -v STAR --runThreadN 8 --runMode genomeGenerate \
    --genomeDir $genomeDirectory --genomeFastaFiles $genomeFASTA \
    --sjdbGTFfile $genomeGFT