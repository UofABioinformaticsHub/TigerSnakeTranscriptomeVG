#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=05:00:00
#SBATCH --mem=32GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/slurm/kallistoQuant_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/slurm/kallistoQuant_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

## Set up
# load kallisto module
module load kallisto/0.43.1-foss-2017a

# path to variables
KALINDEX=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis
TRIMDIR=/home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/fastq
QUANTALL=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/abundanceALL
QUANT313=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/abundance313
QUANT352=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/abundance352
QUANT58722=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/abundance58722

## RUN Kallisto quatification on all samples and each individually
# All samples
for f in ${TRIMDIR}/*R1.fastq
  do
    f2=${f%R1.fastq}R2.fastq
    echo "found file ${f}"
    echo "how about ${f2}"
    kallisto quant \
    -i ${KALINDEX}/cdHIT_KallistoIndex \
    -o ${QUANTALL} \
    ${f} \
    ${f2}
  done

  # sample 313
  for f in ${TRIMDIR}/313*R1.fastq
  do
    f2=${f%R1.fastq}R2.fastq
    echo "found file ${f}"
    echo "how about ${f2}"
    kallisto quant \
    -i ${KALINDEX}/cdHIT_KallistoIndex \
    -o ${QUANT313} \
    ${f} \
    ${f2}
  done

# sample 352
for f in ${TRIMDIR}/352*R1.fastq
  do
    f2=${f%R1.fastq}R2.fastq
    echo "found file ${f}"
    echo "how about ${f2}"
    kallisto quant \
    -i ${KALINDEX}/cdHIT_KallistoIndex \
    -o ${QUANT352} \
    ${f} \
    ${f2}
  done

# sample 58722
for f in ${TRIMDIR}/58722*R1.fastq
  do
    f2=${f%R1.fastq}R2.fastq
    echo "found file ${f}"
    echo "how about ${f2}"
    kallisto quant \
    -i ${KALINDEX}/cdHIT_KallistoIndex \
    -o ${QUANT58722} \
    ${f} \
    ${f2}
  done
