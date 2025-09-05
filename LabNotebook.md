**September 1st**

Created new conda environment called QAA

Installed fastqc, trimmomatic, cutadapt

Working with 2 RNA-seq files from two different electric fish studies (PRJNA1005245 and PRJNA1005244). The methods for the PRJNA1005244 dataset are [published](https://doi.org/10.1093/molbev/msae021) and the methods for the PRJNA1005245 dataset are written in the third chapter of a [thesis](https://canvas.uoregon.edu/courses/266187/files/22059308?module_item_id=5380118)

SRR25630307     Josh
SRR25630395     Josh

Need to download these from NCBI, dump into fastq files and zip

conda install bioconda::sra-tools
- Needed to dump into fastq files 

fasterq-dump SRR25630307 --split-files -O ./fastq
spots read      : 11,275,266
reads read      : 22,550,532
reads written   : 22,550,532

fasterq-dump SRR25630395 --split-files -O ./fastq
spots read      : 36,078,241
reads read      : 72,156,482
reads written   : 72,156,482

Species_sample_tissue_age/size_sample#_readnumber.fastq.gz

https://www.ncbi.nlm.nih.gov/sra/?term=SRR25630395 
SRR25630395
crh_rhy115_EO_adult_2_R1.fastq.gz
crh_rhy115_EO_adult_2_R2.fastq.gz

https://www.ncbi.nlm.nih.gov/sra?term=SRR25630307&cmd=DetailsSearch
SRR25630307
cco_com124_EO_6cm_1_R1.fastq.gz
cco_com124_EO_6cm_1_R2.fastq.gz

gzip SRR25630307_1.fastq
gzip SRR25630307_2.fastq
gzip SRR25630395_1.fastq
gzip SRR25630395_2.fastq

Downloaded Extension Live Server to view HTML files

fastqc fastq/cco_com124_EO_6cm_1_R1.fastq.gz

Filename	SRR25630307_1.fastq.gz
File type	Conventional base calls
Encoding	Sanger / Illumina 1.9
Total Sequences	11275266
Total Bases	1.6 Gbp
Sequences flagged as poor quality	0
Sequence length	150
%GC	48

fastqc fastq/cco_com124_EO_6cm_1_R2.fastq.gz

Filename	SRR25630307_2.fastq.gz
File type	Conventional base calls
Encoding	Sanger / Illumina 1.9
Total Sequences	11275266
Total Bases	1.6 Gbp
Sequences flagged as poor quality	0
Sequence length	150
%GC	48

fastqc fastq/crh_rhy115_EO_adult_2_R1.fastq.gz

Filename	SRR25630395_1.fastq.gz
File type	Conventional base calls
Encoding	Sanger / Illumina 1.9
Total Sequences	36078241
Total Bases	5.4 Gbp
Sequences flagged as poor quality	0
Sequence length	150
%GC	47

fastqc fastq/crh_rhy115_EO_adult_2_R2.fastq.gz

Filename	SRR25630395_2.fastq.gz
File type	Conventional base calls
Encoding	Sanger / Illumina 1.9
Total Sequences	36078241
Total Bases	5.4 Gbp
Sequences flagged as poor quality	0
Sequence length	150
%GC	47

Copied the base-nt-dist python and slurm scripts from the demultiplexing assignments into this directory

Installed numpy and matplotlib

Generating qc per base plots 

sbatch slurm-scripts/base-nt-dist.sh 

crh_rhy115_EO_adult_2_R1.fastq.gz
jobID: 37819994

crh_rhy115_EO_adult_2_R2.fastq.gz
jobID: 37819995

cco_com124_EO_6cm_1_R1.fastq.gz
jobID: 37819980

cco_com124_EO_6cm_1_R2.fastq.gz
jobID: 37819993

**September 3rd**

Had to downgrade cutadapt to version 5.0 and trimmomatic to version 0.39

https://cutadapt.readthedocs.io/en/stable/guide.html

Regular 3’ adapter: -a ADAPTER

cutadapt ADAPTOR -o output.fastq input.fastq.gz

cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -o cutadapt_cco_com124_EO_6cm_1_R1.fastq.gz fastq/cco_com124_EO_6cm_1_R1.fastq.gz

=== Summary ===

Total reads processed:              11,275,266
Reads with adapters:                 2,856,436 (25.3%)
Reads written (passing filters):    11,275,266 (100.0%)

Total basepairs processed: 1,691,289,900 bp
Total written (filtered):  1,616,707,276 bp (95.6%)

cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -o cutadapt_crh_rhy115_EO_adult_2_R1.fastq.gz fastq/crh_rhy115_EO_adult_2_R1.fastq.gz

=== Summary ===

Total reads processed:              36,078,241
Reads with adapters:                 2,785,605 (7.7%)
Reads written (passing filters):    36,078,241 (100.0%)

Total basepairs processed: 5,411,736,150 bp
Total written (filtered):  5,362,839,493 bp (99.1%)

cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -o cutadapt_cco_com124_EO_6cm_1_R2.fastq.gz fastq/cco_com124_EO_6cm_1_R2.fastq.gz

=== Summary ===

Total reads processed:              11,275,266
Reads with adapters:                 1,031,026 (9.1%)
Reads written (passing filters):    11,275,266 (100.0%)

Total basepairs processed: 1,691,289,900 bp
Total written (filtered):  1,684,126,038 bp (99.6%)

cutadapt -a AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o cutadapt_crh_rhy115_EO_adult_2_R2.fastq.gz fastq/crh_rhy115_EO_adult_2_R2.fastq.gz

=== Summary ===

Total reads processed:              36,078,241
Reads with adapters:                 3,017,409 (8.4%)
Reads written (passing filters):    36,078,241 (100.0%)

Total basepairs processed: 5,411,736,150 bp
Total written (filtered):  5,363,239,689 bp (99.1%)

Trimmomatic

http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf 

SLIDINGWINDOW: Performs a sliding window trimming approach. It starts scanning at the 5‟ end and clips the read once the average quality within the window falls below a threshold.
    - SLIDING WINDOW: window size of 5 and required quality of 15
LEADING: Cut bases off the start of a read, if below a threshold quality
    - LEADING: quality of 3
TRAILING: Cut bases off the end of a read, if below a threshold quality
    - TRAILING: quality of 3
MINLEN: Drop the read if it is below a specified length
    - MINLENGTH: 35 bases

trimmomatic PE cutadapt_cco_com124_EO_6cm_1_R1.fastq.gz cutadapt_cco_com124_EO_6cm_1_R2.fastq.gz paired_cco_com124_EO_6cm_1_R1.fastq.gz unpaired_cco_com124_EO_6cm_1_R1.fastq.gz paired_cco_com124_EO_6cm_1_R2.fastq.gz unpaired_cco_com124_EO_6cm_1_R2.fastq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

Input Read Pairs: 11275266 Both Surviving: 11161310 (98.99%) Forward Only Surviving: 81671 (0.72%) Reverse Only Surviving: 29010 (0.26%) Dropped: 3275 (0.03%)
TrimmomaticPE: Completed successfully

trimmomatic PE cutadapt_crh_rhy115_EO_adult_2_R1.fastq.gz cutadapt_crh_rhy115_EO_adult_2_R2.fastq.gz paired_crh_rhy115_EO_adult_2_R1.fastq.gz unpaired_crh_rhy115_EO_adult_2_R1.fastq.gz paired_crh_rhy115_EO_adult_2_R2.fastq.gz unpaired_crh_rhy115_EO_adult_2_R2.fastq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

Input Read Pairs: 36078241 Both Surviving: 35731051 (99.04%) Forward Only Surviving: 256803 (0.71%) Reverse Only Surviving: 77027 (0.21%) Dropped: 13360 (0.04%)
TrimmomaticPE: Completed successfully

Created python script read-length-dist.py to plot the read lengths of the trimmed reads

python3 python-scripts/read-length-dist.py -f1 paired_cco_com124_EO_6cm_1_R1.fastq.gz -f2 paired_cco_com124_EO_6cm_1_R2.fastq.gz 

python3 python-scripts/read-length-dist.py -f1 paired_crh_rhy115_EO_adult_2_R1.fastq.gz -f2 paired_crh_rhy115_EO_adult_2_R2.fastq.gz 

**September 4th**

Installed Star, Picard, Samtools, NumPy, Matpoltlib. HTseq

STAR --version
2.7.11b

samtools --version
samtools 1.21

htseq-count --version
2.0.9

Downloaded the Campylomormyrus compressirostris gff and fasta file from https://datadryad.org/dataset/doi:10.5061/dryad.c59zw3rcj 

scp campylomormyrus.fasta joshkram@login.talapas.uoregon.edu:/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA
scp campylomormyrus.gff joshkram@login.talapas.uoregon.edu:/projects/bgmp/joshkram/bioinfo/Bi623/PS/QAA

To convert the gff file to a gtf file
conda install bioconda::gffread

gffread --version
0.12.7

Convert gff file to gtf file
gffread campylomormyrus.gff -T -o campylomormyrus.gtf

Generate database to align the reads to 

sbatch slurm-scripts/star-make-database.sh
jobID: 37954824

Align the reads with the generated database

C. co
sbatch slurm-scripts/star-align-reads.sh
jobID: 37955003

C. rh
sbatch slurm-scripts/star-align-reads.sh 
jobID: 37955674

Need to sort the output SAM files using samtools to remove duplicates

samtools sort cco_mapped/cco_mappedAligned.out.sam -o cco_mapped/sort_cco_mappedAligned.out.sam

samtools sort crh_mapped/crh_mappedAligned.out.sam -o crh_mapped/sort_crh_mappedAligned.out.sam

picard MarkDuplicates INPUT=cco_mapped/sort_cco_mappedAligned.out.sam OUTPUT=cco_mapped/no_dups_cco_mappedAligned.out.sam METRICS_FILE=duplicates.txt REMOVE_DUPLICATES=TRUE VALIDATION_STRINGENCY=LENIENT

LIBRARY	UNPAIRED_READS_EXAMINED	READ_PAIRS_EXAMINED	SECONDARY_OR_SUPPLEMENTARY_RDS	UNMAPPED_READS	UNPAIRED_READ_DUPLICATES	READ_PAIR_DUPLICATES	READ_PAIR_OPTICAL_DUPLICATES	PERCENT_DUPLICATION	ESTIMATED_LIBRARY_SIZE
Unknown Library	15165	9930007	2706870	2448687	10776	4247962	0	0.428006	7983624

picard MarkDuplicates INPUT=crh_mapped/sort_crh_mappedAligned.out.sam OUTPUT=crh_mapped/no_dups_crh_mappedAligned.out.sam METRICS_FILE=duplicates.txt REMOVE_DUPLICATES=TRUE VALIDATION_STRINGENCY=LENIENT

LIBRARY	UNPAIRED_READS_EXAMINED	READ_PAIRS_EXAMINED	SECONDARY_OR_SUPPLEMENTARY_RDS	UNMAPPED_READS	UNPAIRED_READ_DUPLICATES	READ_PAIR_DUPLICATES	READ_PAIR_OPTICAL_DUPLICATES	PERCENT_DUPLICATION	ESTIMATED_LIBRARY_SIZE
Unknown Library	39049	34213434	4258909	2998090	32538	17394454	0	0.508595	20869870

Copied the script to find mapped and unmapped reads in SAM file

python3 python-scripts/sam_mapped_unmapped.py -s cco_mapped/no_dups_cco_mappedAligned.out.sam

Mapped reads:11368479
Unmapped reads:2447441

python3 python-scripts/sam_mapped_unmapped.py -s crh_mapped/no_dups_crh_mappedAligned.out.sam

Mapped reads:33644471
Unmapped reads:2996185

Htseq-Count

https://htseq.readthedocs.io/en/master/htseqcount.html 

sbatch slurm-scripts/htseq-count.sh 
jobID: 37959192

grep -v "^_" forward_cco.txt | awk '{sum += $2} END {print sum}' 
272487

grep -v "^_" rev_cco.txt | awk '{sum += $2} END {print sum}' 
5870632

grep -v "^_" forward_crh.txt | awk '{sum += $2} END {print sum}' 
943076

grep -v "^_" rev_crh.txt | awk '{sum += $2} END {print sum}' 
20039325

Shows that the "reverse strand" is the correct strand parameter

**FINISHED PS2**