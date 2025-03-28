#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --job-name jupyterlab
#SBATCH --output=jupyterlab-%J.log

# Setup environment variables
XDG_RUNTIME_DIR=""
node=$(hostname -s)
user=$(whoami)

# Use the first argument as the port if provided; default to 9001.
if [ -n "$1" ]; then
    port=$1
else
    port=9671
fi

# # Load required module (Conda)
# module add conda3/23.3.1

# Change working directory (adjust as needed)
cd /home


# load modules or conda environments here
module add conda3/23.3.1

# # Source the conda initialization script so that conda activate works.
# source /home/pdutta/anaconda3/etc/profile.d/conda.sh

# # Load modules or activate conda environment if necessary
# conda activate GDC_VCF

# Launch Jupyter Lab without opening a browser
jupyter lab --no-browser --ip=${node} --port=${port}
