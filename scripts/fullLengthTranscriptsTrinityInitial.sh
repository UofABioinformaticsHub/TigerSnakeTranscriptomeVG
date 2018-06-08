#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=48:00:00
#SBATCH --mem=32GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/slurm/fullLengthTranscriptsTrinityInitial_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/slurm/fullLengthTranscriptsTrinityInitial_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

# load modules 
module load BLAST+/2.2.27-foss-2015b

# create variable paths
PROTDB=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/qualityAssessment
ASSEMDATA=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/trinityInitial/trinity_out_dir
OUTDATA=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/trinity/trinityInitial
TRINITYDIR=/home/a1671704/transsoap/opt/trinity-2.4.0

# build blastable database 
makeblastdb -in ${PROTDB}/uniprot_sprot.fasta -dbtype prot

# perform blast search, only report top alignment
blastx -query ${ASSEMDATA}/Trinity.fasta -db ${PROTDB}/uniprot_sprot.fasta -out ${OUTDATA}/blastx.outfmt6 -evalue 1e-20 -num_threads 6 -max_target_seqs 1 -outfmt 6

echo "blast search worked yo, now percent of target alignment"
# examine percent of target being aligned to by best matching transcript
${TRINITYDIR}/util/analyze_blastPlus_topHit_coverage.pl ${OUTDATA}/blastx.outfmt6 ${ASSEMDATA}/Trinity.fasta ${PROTDB}/uniprot_sprot.fasta
echo "yeah dat worked too yip"
