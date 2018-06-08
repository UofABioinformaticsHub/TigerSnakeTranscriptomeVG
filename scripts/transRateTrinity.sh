#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=24:00:00
#SBATCH --mem=68GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/slurm/transRateTrinity_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/slurm/transRateTrinity_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

# assign paths
TRDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/qualityAssessment 
ASSEMDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/trinityInitial/trinity_out_dir
TRIMDIR=/home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/fastq
OUTDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/trinityInitial
TRANSDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/qualityAssessment/transrate-1.0.3-linux-x86_64

${TRANSDIR}/transrate \
--assembly=${ASSEMDIR}/Trinity.fasta \
--left=${TRIMDIR}/313A_C85FPANXX_CGTACG_L004_R1.fastq,${TRIMDIR}/313B_C85FPANXX_GAGTGG_L004_R1.fastq,${TRIMDIR}/313C_C85FPANXX_ACTGAT_L004_R1.fastq,${TRIMDIR}/352A_C85FPANXX_ATTCCT_L004_R1.fastq,${TRIMDIR}/352B_C85FPANXX_ATCACG_L004_R1.fastq,${TRIMDIR}/352C_C85FPANXX_CGATGT_L004_R1.fastq,${TRIMDIR}/58722A_R1.fastq,${TRIMDIR}/58722B_R1.fastq,${TRIMDIR}/58722C_R1.fastq \
--right=${TRIMDIR}/313A_C85FPANXX_CGTACG_L004_R2.fastq,${TRIMDIR}/313B_C85FPANXX_GAGTGG_L004_R2.fastq,${TRIMDIR}/313C_C85FPANXX_ACTGAT_L004_R2.fastq,${TRIMDIR}/352A_C85FPANXX_ATTCCT_L004_R2.fastq,${TRIMDIR}/352B_C85FPANXX_ATCACG_L004_R2.fastq,${TRIMDIR}/352C_C85FPANXX_CGATGT_L004_R2.fastq,${TRIMDIR}/58722A_R2.fastq,${TRIMDIR}/58722B_R2.fastq,${TRIMDIR}/58722C_R2.fastq \
--threads=16 \
--output=${OUTDIR} 
