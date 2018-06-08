#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --time=20:00:00
#SBATCH --mem=32GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/qualityAssessment/slurm/BUSCO_tetrapoda_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/qualityAssessment/slurm/BUSCO_tetrapoda_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

# load module needed to activate virtual environment
module load Anaconda2

# activate virtual environment
source activate /home/a1671704/transsoap

# load modules needed for script, this is done after in virtual environment
module load BUSCO/2.0.1-foss-2016uofa-Python-2.7.11

# assign path to variables
ASSEMDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo
LINDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/qualityAssessment

# run busco
BUSCO.py -i ${ASSEMDIR}/collaspedTrinityDeNovo90 -o cdHIT_busco_tetrapoda -l ${LINDIR}/tetrapoda_odb9 -m tran -f

# deactivate virtual environment
source deactivate
