#! /bin/bash
#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --time=3:00:00
#SBATCH --mem=16GB
#SBATCH --mail-type=ALL
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

# load the FastQC program
module load fastqc/0.11.4

# change directories into directories containing your fastq files.
DATADIR="/home/a1671704/fastdir/fastqinitialcomplete"

# loop through fastq files and run FastQC one for each PAIR of fastq files
# to do this, write the loop only for the first fastq file
# then extract out the common part of the file name and store this in the variable pairID
# then run fastq for both fastq in a pair , by using the pairID 
for firstread in ls ${DATADIR}/*.fastq
do
	echo "${DATADIR} and $firstread"
#	pairID="${firstread}"
	fastqc ${firstread} -t 8 -f fastq -o ./FastQC
done 
