#!/bin/bash

#source $HOME/.bashrc
mamba activate

# Good to have tools
mamba create -n cli -c bioconda -c conda-forge tree pigz bzip2 -y
