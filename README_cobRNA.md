# Steps so far

## Conda environment:

1. Installed conda on the hpc cluster using bash script:

> https://github.com/cobRNA/slurm_scripts/blob/main/conda.sh

2. Adjusted conda for HPC cluster using this tutorial:

> https://github.com/cobRNA/conda_on_the_cluster

3. Installed mamba for conda environment:

```bash
conda install -n base -c conda-forge mamba
```

> Source: https://snakemake.readthedocs.io/en/stable/getting_started/installation.html

4. Installed older version of snakemake as separate conda environment:

```bash
mamba create -c conda-forge -c bioconda -n snakemake snakemake=6.15.5
```

> Source: https://snakemake.readthedocs.io/en/stable/getting_started/installation.html

## Config files:

1. Made `run_snakemake_EXAMPLE.sh` compatible with SLURM Workload Manager -> `run_snakemake_EXAMPLE_slurm.sh`
2. Made `cluster_config.json` compatible with SLURM Workload Manager -> `cluster_config_slurm.json`

## Troubleshooting:

```bash
klug3@e1890:/mnt/storage_3/home/klug3/pl0203-01/scratch/lyric_test$ ./LyRic/run_snakemake_EXAMPLE_slurm.sh 
KeyError in line 84 of /mnt/storage_2/scratch/pl0203-01/lyric_test/LyRic/master.smk:
'minimumTmergeReadSupport'
  File "/mnt/storage_2/scratch/pl0203-01/lyric_test/LyRic/master.smk", line 84, in <module>
KeyError in line 84 of /mnt/storage_2/scratch/pl0203-01/lyric_test/LyRic/master.smk:
'minimumTmergeReadSupport'
  File "/mnt/storage_2/scratch/pl0203-01/lyric_test/LyRic/master.smk", line 84, in <module>
```

NOT SOLVED

Tried different snakemake version. Tested so far:

- 5.32.2 -> FAIL
- 6.3.0 ->
- 6.15.5 (default) -> FAIL
- 7.32.4 -> FAIL + dot command not found
