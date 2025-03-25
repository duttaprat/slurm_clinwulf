# 🚀 Running Jupyter Lab on ClinWulf Cluster using Slurm

This repository provides ready-to-use Slurm job scripts for launching **Jupyter Lab** on the ClinWulf HPC cluster at Stony Brook University.

> 🔧 These scripts help you launch Jupyter Lab on a compute/GPU node via Slurm and connect through SSH tunneling using your web browser.


---

## 📁 Folder Structure
```
slurm/
      ├── jupyter_lab_slurm.sh     # Slurm script to launch Jupyter Lab
      ├── jupytertoken.sh          # Helper script to extract SSH tunnel info and token
```

---

## 📦 What’s Included

This GitHub repository contains two Bash scripts:

1. **`jupyter_lab_slurm.sh`**  
   A Slurm job submission script that requests computing resources and launches a Jupyter Lab server on a compute node.

2. **`jupytertoken.sh`**  
   A helper script that parses the Slurm log file to extract the correct SSH tunneling command and Jupyter access token.

---

1. Download the folder and keep in clinwulf
2. Use the following command
      ```
      cd slurm
      module load slurm/slurm/20.02.7
      sbatch jupyter_lab_slurm.sh
      ```
      This will launch Jupyter Lab on a compute node. The output will be saved in a file like jupyter-notebook-<jobid>.log. This gives you a `<job-id>`
   
4. 🔑 Get SSH Tunnel Command and Token
   Once the job starts, extract the info using:
   ```
   ./jupytertoken.sh <jobid>
   ```
   This will print:
   * SSH tunnel command
   * Token for browser login


5. 🌐 Create SSH Tunnel
      From your local machine, run the command printed by jupytertoken.sh. Example:
      ```
      ssh -N -f -L 8888:compute014:8888 yourusername@login01.uhmc.sbuh.stonybrook.edu
      ```
      Replace `computeXXX` and `yourusername` with the output from the `jupytertoken.sh` script.



6. 🧪 Access Jupyter Lab
   Open your browser and go to:
   ```
   http://localhost:8888
   ```
   Paste the token when prompted.

   
📄 License
MIT License

---

Let me know if you'd like to add:
- Support for custom Conda environments
- A section on launching Jupyter **Notebook** instead of **Lab**
- Screenshots or troubleshooting tips

