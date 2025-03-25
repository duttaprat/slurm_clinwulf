#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=80G
#SBATCH -p short
#SBATCH --time 01:30:00
#SBATCH --job-name jupyter-notebook
#SBATCH --output jupyter-notebook-%J.log

# get tunneling info
XDG_RUNTIME_DIR=""
node=$(hostname -s)
user=$(whoami)
#port=9001

# print tunneling instructions to the jupyter-log
#echo -e "
#Command to create ssh tunnel:
#ssh -N -f -L ${port}:${node}:${port} ${user}@login01.uhmc.sbuh.stonybrook.edu

#Use a Browser on your local machine to go to:
#localhost:${port}"

# load modules or conda environments here
#module load jupyter/7.4.4
module add conda3/23.3.1

# ✅ Change working directory to /home
cd /home

# Run Jupyter
jupyter notebook --no-browser  --ip=${node}


#jupyter notebook --no-browser --port=${port} --ip=${node}
