#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --time=00:15:00
#SBATCH --mem=4GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/0_rawData/slurm/seqkitstatsRAW_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/0_rawData/slurm/seqkitstatsRAW_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

# load in seqkit module
module load seqkit/0.5.4

# assign paths of variables
RAWDIR=/home/a1671704/fastdir/Data_TigerSnake/0_rawData/fastq
OUTDIR=/home/a1671704/fastdir/Data_TigerSnake/0_rawData

seqkit stats --all ${RAWDIR}/*.fastq
