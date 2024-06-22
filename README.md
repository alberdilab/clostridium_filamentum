# Clostridium filamentum pangenomes

This repository contains the code to generate pangenomes of Clostridium filamentum and functionally annotate genes using multiple databases. Pangenome generation, gene calling and annotation are piped in snakemake (see snakefile).

## Dependencies

- slurm
- miniconda
- dnakemake
- bifrost
- ggcaller
- bbmap
- dram

## Pipeline

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
