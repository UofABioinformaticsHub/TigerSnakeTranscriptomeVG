#!/bin/bash
#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=12:00:00
#SBATCH --mem=32GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/slurm/adapterRemoval_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/slurm/adapterRemoval_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

module load fastqc/0.11.4
module load AdapterRemoval/2.2.1-foss-2016b

RAWDATA=/home/a1671704/fastdir/Data_TigerSnake/0_rawData/fastq
TRIMDIR=/home/a1671704/fastdir/Data_TigerSnake/1_trimmedData

# make output directories
# mkdir -p ${TRIMDIR}/fastq
# mkdir -p ${TRIMDIR}/FastQC

for f in ${RAWDATA}/*R1.fastq
  do
    f2=${f%R1.fastq}R2.fastq
    echo "found file ${f}"
    echo "how about ${f2}"
    AdapterRemoval \
    --file1 ${f} \
    --file2 ${f2} \
    --output1 ${TRIMDIR}/fastq/$(basename ${f}) \
    --output2 ${TRIMDIR}/fastq/$(basename ${f2}) \
    --threads 16 \
    --trimqualities \
    --minquality 30 \
    --trimns \
    --minlength 35 
  done
