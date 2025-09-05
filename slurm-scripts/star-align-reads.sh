#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --output=output_%j.log
#SBATCH --error=error_%j.log

genomeDirectory="/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA/ccom_database"
ccoFASTQ1="/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA/fastq/paired_cco_com124_EO_6cm_1_R1.fastq.gz"
ccoFASTQ2="/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA/fastq/paired_cco_com124_EO_6cm_1_R2.fastq.gz"
crhFASTQ1="/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA/fastq/paired_crh_rhy115_EO_adult_2_R1.fastq.gz"
crhFASTQ2="/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA/fastq/paired_crh_rhy115_EO_adult_2_R2.fastq.gz"

conda activate QAA

# /usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
#     --outFilterMultimapNmax 3 \
#     --outSAMunmapped Within KeepPairs \
#     --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
#     --readFilesCommand zcat \
#     --readFilesIn $ccoFASTQ1 $ccoFASTQ2 \
#     --genomeDir $genomeDirectory \
#     --outFileNamePrefix cco_mapped

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesCommand zcat \
    --readFilesIn $crhFASTQ1 $crhFASTQ2 \
    --genomeDir $genomeDirectory \
    --outFileNamePrefix crh_mapped