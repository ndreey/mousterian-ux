#!/bin/bash

# add conda and mamba to start when terminal initiates.
#conda init bash
#mamba init bash

# Set channels
conda config --add channels conda-forge
conda config --add channels bioconda
conda config --add channels defaults

# Set priority (often required by snakemake and nextflow)
conda config --set channel_priority strict