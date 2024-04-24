#!/bin/bash -i

# remove cluster logs from previous runs so they don't accumulate:
\mv LyRic/qsub_logs LyRic/qsub_logs_bkp; mkdir LyRic/qsub_logs; rm -rf LyRic/qsub_logs_bkp/ &

# activate snakemake conda environment: 
conda activate snakemake; 

# launch LyRic workflow in cluster/SLURM mode:
snakemake -p --reason --latency-wait 100 --use-conda --configfile LyRic/config.json -s LyRic/master.smk -j 500 --jobname {rulename}.{jobid}._{config["PROJECT_NAME"]}_.sh --cluster-config LyRic/cluster_config_slurm.json --max-jobs-per-second 5 --cluster "sbatch --partition={cluster.partition} --mem={cluster.mem} --time={cluster.time} -o {cluster.out} -e {cluster.err} {cluster.threads}" --rerun-incomplete --keep-going --show-failed-logs

#generate DAG to visualize workflow as SVG image:
snakemake -p --configfile LyRic/config.json -s LyRic/master.smk --forceall --rulegraph > EXAMPLE_dag.dot
cat EXAMPLE_dag.dot | dot -Tsvg > EXAMPLE_dag.svg
