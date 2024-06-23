#!/bin/bash
#SBATCH --job-name=%s                   # Job name
#SBATCH --nodes=1
#SBATCH --ntasks=4                      # Run on 4 CPUs
#SBATCH --mail-user=antton.alberdi@sund.ku.dk
#SBATCH --mem=200gb                     # Job memory request
#SBATCH --time=%d                       # In minutes

module load mamba/1.3.1
source activate /projects/mjolnir1/people/ncl550/0_software/miniconda3/envs/DRAM_more_modules

DRAM.py annotate \-i {input.mag} \-o {params.outdir} \--threads 24 --min_contig_size 1500 
