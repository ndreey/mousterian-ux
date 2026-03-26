#!/bin/bash

mamba activate

mamba create -n qc \
	pigz seqkit bbmap multiqc fastqc samtools bedtools bzip2 -y
