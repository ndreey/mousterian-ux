#!/bin/bash

# Set channels so we get the hierarchy: conda-forge > bioconda > defaults
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

# Set priority (often required by snakemake and nextflow)
conda config --set channel_priority strict