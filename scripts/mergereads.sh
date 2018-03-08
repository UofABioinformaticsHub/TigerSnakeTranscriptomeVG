#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=2:00:00
#SBATCH --mem=32GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/mergereads/slurm/mergereads_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/mergereads/slurm/mergereads_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

# load modules
module load Java/1.8.0_71
module load BBMap/35.92-GCC-5.3.0-binutils-2.25-Java-1.8.0_71

BBMERGE=/apps/software/BBMap/35.92-GCC-5.3.0-binutils-2.25-Java-1.8.0_71
DATADIR=/home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/fastq
MERGEDIR=/home/a1671704/fastdir/Data_TigerSnake/mergereads/mergedfastq

${BBMERGE}/bbmerge.sh in1=${DATADIR}/313A_C85FPANXX_CGTACG_L004_R1.fastq in2=${DATADIR}/313A_C85FPANXX_CGTACG_L004_R2.fastq out=${MERGEDIR}/313Amerged.fastq
${BBMERGE}/bbmerge.sh in1=${DATADIR}/313B_C85FPANXX_GAGTGG_L004_R1.fastq in2=${DATADIR}/313B_C85FPANXX_GAGTGG_L004_R2.fastq out=${MERGEDIR}/313Bmerged.fastq
${BBMERGE}/bbmerge.sh in1=${DATADIR}/313C_C85FPANXX_ACTGAT_L004_R1.fastq in2=${DATADIR}/313C_C85FPANXX_ACTGAT_L004_R2.fastq out=${MERGEDIR}/313Cmerged.fastq
${BBMERGE}/bbmerge.sh in1=${DATADIR}/352A_C85FPANXX_ATTCCT_L004_R1.fastq in2=${DATADIR}/352A_C85FPANXX_ATTCCT_L004_R2.fastq out=${MERGEDIR}/352Amerged.fastq
${BBMERGE}/bbmerge.sh in1=${DATADIR}/352B_C85FPANXX_ATCACG_L004_R1.fastq in2=${DATADIR}/352B_C85FPANXX_ATCACG_L004_R2.fastq out=${MERGEDIR}/352Bmerged.fastq
${BBMERGE}/bbmerge.sh in1=${DATADIR}/352C_C85FPANXX_CGATGT_L004_R1.fastq in2=${DATADIR}/352C_C85FPANXX_CGATGT_L004_R2.fastq out=${MERGEDIR}/352Cmerged.fastq
${BBMERGE}/bbmerge.sh in1=${DATADIR}/58722A_R1.fastq in2=${DATADIR}/58722A_R2.fastq out=${MERGEDIR}/58722Amerged.fastq
${BBMERGE}/bbmerge.sh in1=${DATADIR}/58722B_R1.fastq in2=${DATADIR}/58722B_R2.fastq out=${MERGEDIR}/58722Bmerged.fastq
${BBMERGE}/bbmerge.sh in1=${DATADIR}/58722C_R1.fastq in2=${DATADIR}/58722C_R2.fastq out=${MERGEDIR}/58722Cmerged.fastq

