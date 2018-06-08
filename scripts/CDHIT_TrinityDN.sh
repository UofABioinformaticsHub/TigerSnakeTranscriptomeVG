#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=72:00:00
#SBATCH --mem=32GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/slurm/cdhit_busco_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/slurm/cdhit_busco_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

#variable path
CDHITDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/qualityAssessment/cdhit-4.6.8
TRINITYDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/trinityInitial/trinity_out_dir
OUTDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/trinityInitial

#run the command 
${CDHITDIR}/cd-hit \
-i ${TRINITYDIR}/Trinity.fasta \
-o ${OUTDIR}/collaspedTrinityDeNovo90 \
-c 0.9 \
-n 5 \
-d 0 \
-M 16000 \
-T 16
