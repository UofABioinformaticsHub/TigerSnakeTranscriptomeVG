#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --time=00:05:00
#SBATCH --mem=4GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/slurm/BasicStats_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/slurm/BasicStats_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

# load modules
# module load Trinity/2.5.1-foss-2016b

# directories
TRINDIR=/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1
ASSEMDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/trinityInitial/trinity_out_dir
OUTDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/trinityInitial

## Trinity module not working so set directory to trinity folder instead
# run basic stat trinity perl script for stats
${TRINDIR}/util/TrinityStats.pl ${ASSEMDIR}/Trinity.fasta > ${OUTDIR}/basicStatsTrinDN.txt
