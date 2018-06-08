#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=01:00:00
#SBATCH --mem=32GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/slurm/kallistoIndex_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/slurm/kallistoIndex_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

# load kallisto module
module load kallisto/0.43.1-foss-2017a

# assign path to assembly variable
ASSEMDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo
OUTDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis

# run kallisto index on trinity assembly
kallisto index -i ${OUTDIR}/cdHIT_KallistoIndex ${ASSEMDIR}/collaspedTrinityDeNovo90
