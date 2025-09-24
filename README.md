# RNA-seq Quality Assessment 

### Dataset:

2 RNA-seq files from two different electric fish studies (PRJNA1005245 and PRJNA1005244). The methods for the PRJNA1005244 dataset are [published](https://doi.org/10.1093/molbev/msae021) and the methods for the PRJNA1005245 dataset are written in the third chapter of a [thesis](https://canvas.uoregon.edu/courses/266187/files/22059308?module_item_id=5380118). 

### Read quality score distributions

Use FastQC and my own quality score plotting script to find the overall data quality of the two libraries 

### Adaptor trimming comparison

Use CutAdapt to trim adaptor sequences and Trimmoatic to trim reads

Plot trimmed length distributions

### Alignment and strand-specificity

Use STAR to align the reads to a reference genome

Remove PCR dupliactes using Picard

Use a Python script to determine the number of mapped and unmapped reads generated from the SAM files post duplication with Picard

Count the deduplicated reads that map to features using htseq-count and determine the strandedness of the reads


