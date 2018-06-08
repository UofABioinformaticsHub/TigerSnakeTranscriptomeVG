#!/bin/bash

#SBATCH -p batch #change batch to test to test if it works
#SBATCH -N 1
#SBATCH -n 16 #use 16 cores/threads
#SBATCH --time=20:00:00
#SBATCH --mem=124GB #start with 32GB/ 2GB per core
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/slurm/trinityInitial_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/slurm/trinityInitial_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

#module load Trinity/2.5.1-foss-2016b

#load module for bowtie2
module load Bowtie2/2.2.9-foss-2016b

#load recent java version
module load Java/1.8.0_71

DATADIR=/home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/fastq

#Run trinity with fastq sequence type
/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/Trinity --seqType fq --left ${DATADIR}/58722A_R1.fastq,${DATADIR}/58722B_R1.fastq,${DATADIR}/58722C_R1.fastq,${DATADIR}/313A_C85FPANXX_CGTACG_L004_R1.fastq,${DATADIR}/313B_C85FPANXX_GAGTGG_L004_R1.fastq,${DATADIR}/313C_C85FPANXX_ACTGAT_L004_R1.fastq,${DATADIR}/352A_C85FPANXX_ATTCCT_L004_R1.fastq,${DATADIR}/352B_C85FPANXX_ATCACG_L004_R1.fastq,${DATADIR}/352C_C85FPANXX_CGATGT_L004_R1.fastq --right ${DATADIR}/58722A_R2.fastq,${DATADIR}/58722B_R2.fastq,${DATADIR}/58722C_R2.fastq,${DATADIR}/313A_C85FPANXX_CGTACG_L004_R2.fastq,${DATADIR}/313B_C85FPANXX_GAGTGG_L004_R2.fastq,${DATADIR}/313C_C85FPANXX_ACTGAT_L004_R2.fastq,${DATADIR}/352A_C85FPANXX_ATTCCT_L004_R2.fastq,${DATADIR}/352B_C85FPANXX_ATCACG_L004_R2.fastq,${DATADIR}/352C_C85FPANXX_CGATGT_L004_R2.fastq --CPU 16 --max_memory 64G --verbose
