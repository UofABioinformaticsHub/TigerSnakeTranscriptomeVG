#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=10:00:00
#SBATCH --mem=32GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/slurm/bowtie2TrinityInitial_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/slurm/bowtie2TrinityInitial_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

# module load Bowtie2
# module load Bowtie2/2.2.9-foss-2016b
# module load SAMtools/1.3.1-foss-2016b

# assign paths to variables for data and output directories
# ASSEMDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/trinityInitial/trinity_out_dir
# TRIMDIR=/home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/fastq
# OUTDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/trinityInitial

# run Bowtie2
# bowtie2 -p 10 -q --no-unal -k 20 -x ${ASSEMDIR}/Trinity.fasta -1 ${TRIMDIR}/*_R1.fastq -2 ${TRIMDIR}/*_R2.fastq | samtools view -@16 -Sb -o bowtie2.bam 2>&1 | tee ${OUTDIR}/align_stats.txt

# module load Bowtie2
module load Bowtie2/2.2.9-foss-2016b
module load SAMtools/1.3.1-foss-2016b

# assign paths to variables for data and output directories
ASSEMDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/trinityInitial/trinity_out_dir
TRIMDIR=/home/a1671704/fastdir/Data_TigerSnake/1_trimmedData/fastq
OUTDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/trinityInitial


## Index trinity assembly
bowtie2-build ${ASSEMDIR}/Trinity.fasta ${ASSEMDIR}/Trinity.fasta


# run Bowtie2
for FILE in ${TRIMDIR}/*_R1.fastq; do

  bowtie2 \
  -p 10 \
  -q \
  --no-unal \
  -k 20 \
  -x ${ASSEMDIR}/Trinity.fasta \
  -1 ${FILE} \
  -2 ${FILE/R1/R2}\ | \
  samtools view -@16 -Sb -o bowtie2.bam 2>&1 | \
  tee ${OUTDIR}/$(basename ${FILE} .fastq).stats

done
