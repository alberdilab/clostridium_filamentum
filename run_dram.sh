#!/bin/bash

$1

#SBATCH --job-name=dram_${1}
#SBATCH --nodes=1
#SBATCH --ntasks=24
#SBATCH --mem=64gb
#SBATCH --time=600 

module load mamba/1.3.1
source activate /projects/mjolnir1/people/ncl550/0_software/miniconda3/envs/DRAM_more_modules

DRAM.py annotate -i ${1}.fasta -o dram/${1} --threads 24 --min_contig_size 1500 
