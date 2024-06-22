# clostridium_filamentum



```{sh}
screen -S clostridium_filamentum
cd clostridium_filamentum
```

```{sh}
module purge && module load snakemake/7.20.0 mamba/1.3.1
```

```{sh}
snakemake -j 20 --cluster 'sbatch -o logs/{rule}.{wildcards.pangenome}-%j.out --mem {resources.mem_gb}G --time {resources.time} -c {threads} --job-name={rule}.{wildcards.pangenome} -v'   --use-conda --conda-frontend mamba --conda-prefix conda --latency-wait 600
```
