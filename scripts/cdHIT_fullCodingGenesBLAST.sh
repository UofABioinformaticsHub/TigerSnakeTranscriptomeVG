#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=72:00:00
#SBATCH --mem=32GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/qualityAssessment/slurm/fullLengthGenesBLAST_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/qualityAssessment/slurm/fullLengthGenesBLAST_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

# load modules
module load BLAST+/2.2.27-foss-2015b

# directory paths
PROTDB=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/qualityAssessment
ASSEMDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo
OUTDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/qualityAssessment
TRINITYDIR=/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1

# perform blast search, only report top alignment
blastx -query ${ASSEMDIR}/collaspedTrinityDeNovo90 \
-db ${PROTDB}/uniprot_sprot.fasta \
-out ${OUTDIR}/blastx.outfmt6 \
-evalue 1e-20 \
-num_threads 16 \
-max_target_seqs 1 \
-outfmt 6
echo "top alignment blast search complete"

# examine percent of target being aligned to by best matching trinity transcript
${TRINITYDIR}/util/analyze_blastPlus_topHit_coverage.pl \
${OUTDIR}/blastx.outfmt6 \
${ASSEMDIR}/collaspedTrinityDeNovo90 \
${PROTDB}/uniprot_sprot.fasta
echo "percentage of target aligned to best match trinity transcript complete"

# group blast hits to improve seqeunce coverage
${TRINITYDIR}/util/misc/blast_outfmt6_group_segments.pl \
${OUTDIR}/blastx.outfmt6 \
${ASSEMDIR}/collaspedTrinityDeNovo90 \
${PROTDB}/uniprot_sprot.fasta \ > \
${OUTDIR}/blast.outfmt6.grouped
echo "blast hits grouped"

# percent coverage by length histogram
${TRINITYDIR}/util/misc/blast_outfmt6_group_segments.tophit_coverage.pl \
${OUTDIR}/blast.outfmt6.grouped
echo "percentage coverage done"
