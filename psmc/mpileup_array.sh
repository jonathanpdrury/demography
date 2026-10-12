#!/bin/bash

#SBATCH -p shared
#SBATCH --cpus-per-task=32
#SBATCH --mem=32G
#SBATCH --array=0-37
#SBATCH -t 72:00:00
#SBATCH --gres=tmp:5G


module load bioinformatics
module load bwa/0.7.17
module load samtools/1.9
module load bcftools/1.15
module load vcftools/0.1.16
module load plink/1.90
module load bedtools/2.31.1

bn=($(cat allsamples.bn.txt))

        echo ${bn[${SLURM_ARRAY_TASK_ID}]}
        bcftools mpileup -Q 30 -q 30  --output-type z \
        -f /nobackup/jzxs26/postdoc/genomes/h_americana/GCA_022747635.1_ioHetAmer1.0.p_genomic.fa /nobackup/jzxs26/big_files/fastq2bam/americana/americana_genome/${bn[${SLURM_ARRAY_TASK_ID}]}.sorted.RG.bam |
        bcftools call -c | bcftools filter -i "QUAL>=30 && DP>=6 && DP<=40" | bcftools view --exclude-types indels |
        vcfutils.pl vcf2fq -d 5 -D 34 -Q 30 > ${bn[${SLURM_ARRAY_TASK_ID}]}_cons.fq




