#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --time=02:00:00
#SBATCH --mem=96GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/qualityAssessment/slurm/transRate_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/qualityAssessment/slurm/transRate_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

## directories
TRANSDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/qualityAssessment/transrate-1.0.3-linux-x86_64
ASSEMDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo
OUTDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/qualityAssessment

## to list all R1 files as comma separated in script do the following for R1 and R2 files
# set path to directories with trimmed fastq files
TRIMDIR=/home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/fastq

# assign R1 and R2 variable with list of all R1 and R2 files
R1FILES=${TRIMDIR}/*_R1.fastq
R2FILES=${TRIMDIR}/*_R2.fastq

# within subshell list all R1/left files, then replace the space between them with a comma separation and assign to variable
LEFT=$(echo ${R1FILES} | tr ' ' ,)
RIGHT=$(echo ${R2FILES} | tr ' ' ,)

# check to see if this works, comment out if it does
#echo ${LEFT}
#echo ${RIGHT}

## run transRate
${TRANSDIR}/transrate \
--assembly=${ASSEMDIR}/collaspedTrinityDeNovo90 \
--left=${LEFT} \
--right=${RIGHT} \
--threads=16 \
--output=${OUTDIR}
