#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --time=24:00:00
#SBATCH --mem=8GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/qualityAssessment/slurm/readRep_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/qualityAssessment/slurm/readRep_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

## Load modules
module load Bowtie2/2.2.9-foss-2016b
module load SAMtools/1.3.1-foss-2016b

## Directory paths
ASSEMDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo
TRIMDIR=/home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/fastq
OUTDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/qualityAssessment

## Build Bowtie2 index
#bowtie2-build ${ASSEMDIR}/collaspedTrinityDeNovo90 ${ASSEMDIR}/cdHITDeNovo.bowtie2Index.fasta

## Run Alignment
for FILE in ${TRIMDIR}/*_R1.fastq; do
  bowtie2 \
  -p 8 -q --no-unal -k 20 \
  -x ${ASSEMDIR}/cdHITDeNovo.bowtie2Index.fasta \
  -1 ${FILE} \
  -2 ${FILE/R1/R2} | \
  samtools view -@8 -Sb -o bowtie2.bam 2>&1 | \
  tee ${OUTDIR}/readRep.txt
done
