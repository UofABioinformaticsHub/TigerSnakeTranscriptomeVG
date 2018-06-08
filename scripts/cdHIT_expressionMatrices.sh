#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=00:20:00
#SBATCH --mem=16GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/slurm/expressionMatrices_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/slurm/expressionMatrices_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

####################################################

## Make gene to trans map

TRINITY=/home/a1671704/transsoap/opt/trinity-2.4.0/util/support_scripts
ASSEMDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo
OUTDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo

${TRINITY}/get_Trinity_gene_to_trans_map.pl ${ASSEMDIR}/collaspedTrinityDeNovo90 > ${OUTDIR}/collaspedTrinityDeNovo90.gene_trans_map

####################################################

## Make expression matrices
OUTDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis
MAPDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/
SAMPLE313=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/abundance313
SAMPLE352=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/abundance352
SAMPLE58722=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/abundance58722

/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/util/abundance_estimates_to_matrix.pl --est_method kallisto \
--gene_trans_map ${MAPDIR}/collaspedTrinityDeNovo90.gene_trans_map \
--out_prefix ${OUTDIR}/CDHITKallistoAbundance \
--name_sample_by_basedir \
${SAMPLE313}/abundance.tsv \
${SAMPLE352}/abundance.tsv \
${SAMPLE58722}/abundance.tsv

