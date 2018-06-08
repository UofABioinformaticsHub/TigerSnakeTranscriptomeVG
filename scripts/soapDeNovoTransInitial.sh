#!/bin/bash

#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=10:00:00
#SBATCH --mem=32GB
#SBATCH -o /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/soapDeNovoTrans/slurm/soapDeNovoTrans_%j.out
#SBATCH -e /home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/soapDeNovoTrans/slurm/soapDeNovoTrans_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a1671704@student.adelaide.edu.au

# enter python virtual environment
# transcript_env
# echo "woohoo"

SOAPDIR=/home/a1671704/fastdir/Data_TigerSnake/3_transcriptomeAssembly/soapDeNovoTrans

echo "its working"
${SOAPDIR}/SOAPdenovo-Trans-31mer all -s ${SOAPDIR}/Soapconfigfile3.txt -o graph_prefix
echo "OMG it worked"

# exit python virtual environment
# source deactivate
