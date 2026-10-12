#!/bin/bash

#SBATCH -p shared
#SBATCH --cpus-per-task=32
#SBATCH --mem=32G
#SBATCH -t 72:00:00
#SBATCH --array=0-37
#SBATCH --gres=tmp:5G


module load bioinformatics
module load psmc/0.6.5


bn=($(cat allsamples.bn.txt))

	echo ${bn[${SLURM_ARRAY_TASK_ID}]}
	fq2psmcfa ../${bn[${SLURM_ARRAY_TASK_ID}]}_cons.fq   > ${bn[${SLURM_ARRAY_TASK_ID}]}.psmcfa &&
	psmc -N50 -t15 -r5 -p "4+25*2+4+6" -o ${bn[${SLURM_ARRAY_TASK_ID}]}.psmc ${bn[${SLURM_ARRAY_TASK_ID}]}.psmcfa &&
	psmc_plot.pl -u 2.8e-09 -g 1 -R -p  ${bn[${SLURM_ARRAY_TASK_ID}]} ${bn[${SLURM_ARRAY_TASK_ID}]}.psmc

