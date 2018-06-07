# TigerSnakeTranscriptomeVG
Assembly of the Venom Gland Transcriptome from Tiger Snake

Data in this repository is structured using the following layout:

| Root | Files | Description |
|:---- |:----- |:----------- |
| `0_rawData` | `FastQC/*fastqc.html`               | Individual Fastqc summaries  |
|             | `FastQC/*fastqc.zip`                | Data for each Fastqc report |
|             | `FastQC/ngsReports_Fastqc.Rmd/.html`| ngsReport of Fastqc summaries for raw data |
|             | `seqkitstatsRAW.tsv`                | Tab delimited file containing seqkit statistics |
|             |
| `1_trimmedData` | `FastQC/*fastqc.html`                | Individual Fastqc summaries |
|                 | `FastQC/ngsReports_Fastqc.Rmd/.html` | ngsReports of Fastqc summaries for trimmed data |
|                 | `seqkitstatsTRIM.tsv`                | Tab delimited file containing seqkit statistics |
|                 |
| `scripts` | `adapterRemoval.sh`                       | shell script for removal of adapters and low quality scoring bases |
|           | `fastqc.sh`                               | shell script for fastqc reports of raw data |
|           | `mergereads.sh`                           | shell script to merge raw reads together |
|           | `trimmedfastqc.sh`                        | shell script for fastqc reports of trimmed data |
|           | `seqkitstatsRAW.sh`                       | shell script for applying seqkit statistic function to raw data |
|           | `seqkitstatsTRIM.sh`                      | shell script for applying seqkit statistic function to trimmed data |
|           | `trinityInitial.sh`                       | shell script to run the Trinity De novo assmembler on trimmed data |
|           | `soapDeNovoTransInitial.sh`               | shell script to run the Soap De novo-Trans assembler on trimmed data |
|           | `bowtie2SoapDeNovoInitial.sh`             | shell script to assess read alignment of reads to Soap De novo-Trans  transcriptome assembly |
|           | `bowtie2TrinityInitial.sh`                | shell script to assess read alignment of reads to Trinity De novo transcriptome assembly |
|           | `fullLengthTranscriptsTrinityInitial.sh`  | shell script to assess full length transcripts which match to known proteins |
|           | `basicStatsTrinDN.sh`                     | shell script to assess basic contig and assembly statistics |
|           | `transRateTrinity.sh`                     | shell script to run the transRate assembly quality assessment | 
|           | `TrinDN_BUSCO_metazoa.sh`                 | shell script alignment of transcriptome to the metazoan BUSCO gene set |
|           | `TrinDN_BUSCO_tetrapoda.sh`               | shell script alignment of transcriptome to the tetrapoda BUSCO gene set |
|           | `TrinDN_BUSCO_vertebrata.sh`              | shell script alignment of transcriptome to the vertebrata BUSCO gene set |
|           | `CDHIT_TrinityDN.sh`                      | shell script running CDHIT program on Trinity De novo transcriptome assembly to cluster similar proteins |
|           | `cdHIT_readRep.sh`                 | shell script to assess read alignment of reads to Trinity De novo transcriptome after removing redundancy |
|           | `cdHIT_basicStats.sh`              | shell script assessing basic statistics of Trinity De novo transcriptome after removing redundancy |
|           | `cdHIT_fullCodingGenesBLAST.sh`    | shell script assessing full length transcripts which match to known proteins in the Trinity De novo transcriptome after removing redundancy |
|           | `cdHIT_busco_metazoa.sh`           | shell script assessing alignment of the transcriptome produced by CD-HIT to the metazoa BUSCO gene set |
|           | `cdHIT_busco_tetrapoda.sh`         | shell script assessing alignment of the transcriptome produced by CD-HIT to the tetrapoda BUSCO gene set |
|           | `cdHIT_busco_vertabrata.sh`        | shell script assessing alignment of the transcriptome produced by CD-HIT to the vertebrata BUSCO gene set |
|           | `cdHIT_ExN50.sh`                   | shell script to produce E90N50 statistic |
|           | `cdHIT_transRate.sh`               | shell script to run the transRate assembly quality assessment on the Trinity De novo transcriptome after removing redundancy | 
|           | `cdHIT_kallistoIndex.sh`           | shell script to produce the Kallisto Index in order to run the Kallisto expression quantification step |
|           | `cdHIT_kallistoQuant.sh`           | shell script to run Kallisto quantification step|
|           | `cdHIT_expressionMatrices.sh`      | shell script produce matrices of raw expression counts, TPM normalised expression values and TMM normalised expression values |
|           | `cdHIT_expressionCounts.sh`        | shell script to produce counts of normalised TPM expression matrices |
|           | `RawDataSummary.Rmd/.html`               | source code and html file for summary of raw and trimmed data |
|           | `AssemblyComparison.Rmd/.html`           | source code and html file of assembly comparison statistics |
|           | `BUSCOs.Rmd/.html`                       | source code and html file for the BUSCOs comparison for Trinity De novo assembly before and after reducing redundancy |
|           | `CDHITTranscriptAndGeneQuant.Rmd/.html`  | source code and html file for the downstream analysis for the Trinity De novo assembly before and after reducing redundancy |
|           | `TranscriptQuant.Rmd/.html`              | source code and html file for the downstream analysis of the Trinity De novo assembly before using CDHIT  to reduce redundancy | 
