#!/bin/bash

source $HOME/.bashrc

# Good to have tools
mamba create -n cli -c bioconda -c conda-forge stow tree tmux pigz bzip2 -y