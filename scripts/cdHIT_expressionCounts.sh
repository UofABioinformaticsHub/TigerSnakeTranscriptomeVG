#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --time=00:30:00
#SBATCH --mem=16GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/slurm/expressionCounts_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis/slurm/expressionCounts_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

MATRIXDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/cdHITandDeNovo/downstreamAnalysis

# Run counts of expressed genes
/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/util/misc/count_matrix_features_given_MIN_TPM_threshold.pl \
${MATRIXDIR}/CDHITKallistoAbundance.gene.TPM.not_cross_norm | tee ${MATRIXDIR}/CDHITKallistoAbundance.gene.TPM.not_cross_norm.counts_by_min_TPM

# Run counts for expressed transcripts
/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/util/misc/count_matrix_features_given_MIN_TPM_threshold.pl \
${MATRIXDIR}/CDHITKallistoAbundance.isoform.TPM.not_cross_norm | tee ${MATRIXDIR}/CDHITKallistoAbundance.isoform.TPM.not_cross_norm.counts_by_min_TPM
