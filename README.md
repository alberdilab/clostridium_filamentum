# Clostridium filamentum annotations and pangenomes

This repository contains the code to generate pangenomes of Clostridium filamentum and functionally annotate genes using multiple databases. Pangenome generation, gene calling and annotation are piped in snakemake (see snakefile).

## Genome annotation

Genome annotation is carried out individually for each genome using DRAM. The code below sends 4 jobs to the SLURM queue to run the script run_dram.sh for each of the four genomes.

```{sh}
sbatch run_dram.sh c_filamentum_b1
sbatch run_dram.sh c_filamentum_b2
sbatch run_dram.sh c_filamentum_b3
sbatch run_dram.sh c_saudiense
```

## Pangenome generation

### Dependencies

- slurm
- miniconda
- dnakemake
- bifrost
- ggcaller
- bbmap
- dram

### Pipeline

Clone the repository.

```{sh}
git clone https://github.com/alberdilab/clostridium_filamentum.git
```

Create a screen session to run the snakemake pipeline and enter into the working directory

```{sh}
screen -S clostridium_filamentum
cd clostridium_filamentum
```

Load required modules to launch the pipeline if needed (common in HPC servers)

```{sh}
module purge && module load snakemake/7.20.0 mamba/1.3.1
```

Launch the snakemake pipeline.

```{sh}
snakemake -j 20 --cluster 'sbatch -o logs/{rule}.{wildcards.pangenome}-%j.out --mem {resources.mem_gb}G --time {resources.time} -c {threads} --job-name={rule}.{wildcards.pangenome} -v'   --use-conda --conda-frontend mamba --conda-prefix conda --latency-wait 600
```
