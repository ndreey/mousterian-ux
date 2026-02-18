#!/bin/bash

# Download the installation file
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh

# Start the interactive intallation. CHOOSE TO INITIALIZE THE SHELL WHEN PROMPTED
sh Miniforge3-Linux-x86_64.sh

# Set changes
source $HOME/.bashrc

# Set channels
conda config --add channels conda-forge
conda config --add channels bioconda
conda config --add channels defaults

# Set priority (often required by snakemake and nextflow)
conda config --set channel_priority strict
