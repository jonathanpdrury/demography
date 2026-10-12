#!/bin/bash

#SBATCH -p shared
#SBATCH -c 20
#SBATCH --mem=20G
#SBATCH -t 72:00:00


fq2psmcfa E001_cons.fq   > titia.E001.psmcfa



