#!/bin/bash

# move to the fast drive
cd /localscratch/

# download and install miniconda
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh"
bash Miniforge3-Linux-x86_64.sh -b -u -p /localscratch/miniforge3/

# init conda
miniforge3/bin/mamba init bash

