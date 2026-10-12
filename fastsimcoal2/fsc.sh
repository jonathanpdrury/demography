#!/bin/bash

#SBATCH -p shared
#SBATCH --cpus-per-task=8
#SBATCH --mem=8G
#SBATCH -t 72:00:00
# --array=0-37
#SBATCH --gres=tmp:1G


#######################
# User-defined section

# PATHS TO FILES AND SOFTWARE:
#REFERENCE=/nobackup/jzxs26/postdoc/genomes/h_titia/newer/newer2/RagTag/newer/newer2/even_newer/ultimate/HetTit1.0.p.genome.fasta
#REFBN=/nobackup/jzxs26/postdoc/genomes/h_titia/newer/newer2/RagTag/newer/newer2/even_newer/ultimate/HetTit1.0.p.genome
#INPUTDIR=/nobackup/jzxs26/big_files/novogene/americana/americana/all
#OUTPUTDIR=/nobackup/jzxs26/big_files/bbmap/americana

#SAMTOOLS=samtools
#PICARD=/nobackup/jzxs26/postdoc/programs/picard-2.27.5/picard.jar
#BEDTOOLS=bedtools
#QUALIMAP=qualimap       # only needed for optional quality control step

#NRCORES=16                                              # Number of cores or threads per file. 


#	echo "Mapping with bbmap..."
#	bn=($(cat allsamples.bn.txt))
#		echo ${bn[${SLURM_ARRAY_TASK_ID}]}
#		bbmap.sh in=${INPUTDIR}/${bn[${SLURM_ARRAY_TASK_ID}]}_1.fq.gz in2=${INPUTDIR}/${bn[${SLURM_ARRAY_TASK_ID}]}_2.fq.gz out=${bn[${SLURM_ARRAY_TASK_ID}]}.sam ref=${REFERENCE} vslow k=12 maxindel=200 nodisk threads=$NRCORES 


/nobackup/jzxs26/postdoc/programs/fsc28_linux64/fsc28 -t nmig1.tpl -n400000 -m -e nmig1.est -M -L40 -q --multiSFS -C1 -c8 -B8
