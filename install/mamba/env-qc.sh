#!/bin/bash

source $HOME/.bashrc

mamba create -n qc -c bioconda -c conda-forge pigz seqkit bbmap multiqc fastqc samtools bedtools bzip2 -y