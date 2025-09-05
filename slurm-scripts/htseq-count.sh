#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --output=output_%j.log
#SBATCH --error=error_%j.log

htseq-count -s yes -i Parent crh_mapped/no_dups_crh_mappedAligned.out.sam ref_genome/campylomormyrus.gff > forward_crh.txt &
htseq-count -s reverse -i Parent crh_mapped/no_dups_crh_mappedAligned.out.sam ref_genome/campylomormyrus.gff > rev_crh.txt &
htseq-count -s yes -i Parent cco_mapped/no_dups_cco_mappedAligned.out.sam ref_genome/campylomormyrus.gff > forward_cco.txt &
htseq-count -s reverse -i Parent cco_mapped/no_dups_cco_mappedAligned.out.sam ref_genome/campylomormyrus.gff > rev_cco.txt &
wait