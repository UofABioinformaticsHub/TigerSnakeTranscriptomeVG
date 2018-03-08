#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=02:00:00
#SBATCH --mem=32GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/slurm/trimfastqc_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/slurm/trimfastqc_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

#load FastQC module 
module load fastqc/0.11.4

TRIMDATA=/home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/fastq
TRIMDIR=/home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/FastQC

fastqc -t 16 -o ${TRIMDIR} -f fastq ${TRIMDATA}/*.fastq

