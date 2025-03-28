# 🚀 Running Jupyter Lab on ClinWulf Cluster using Slurm  (Advanced Arg Version)

This repository provides ready-to-use Slurm job scripts for launching **Jupyter Lab** on the ClinWulf HPC cluster at Stony Brook University.

> 🔧 These scripts help you launch Jupyter Lab on a compute/GPU node via Slurm and connect through SSH tunneling using your web browser.


---

## 📁 Folder Structure
```
jupyter/
      ├── jupyter_lab_slurm_arg.sh   # Slurm script to launch Jupyter Lab (with optional port argument)
      ├── jupytertoken_arg.sh        # Helper script to extract SSH tunnel info and token
      ├── jupyter_slurm.sh         # Slurm script to launch Jupyter notebook
```

---

## 📦 What’s Included

This GitHub repository contains three Bash scripts:

1. **`jupyter_lab_slurm_arg.sh`**  
   A Slurm job script that takes an optional port number, memory and partition as arguments and launches a Jupyter Lab server on a compute node.

2. **`jupytertoken_arg.sh`**  
   A helper script that parses the Slurm log file to extract the correct SSH tunneling command and Jupyter access token. If you have password enabled, it will also inform you. 

3. **`jupyter_slurm.sh`**  
   A Slurm job submission script that requests computing resources and launches a Jupyter notebook on a compute node.

---

## 🚀 Quickstart Guide

### 1️⃣ Download and Transfer Scripts to ClinWulf
Login the Clinwulf server, dont need to use port forwarding:
```bash
ssh pdutta@login01.uhmc.sbuh.stonybrook.edu
```
Clone the repository and move into the `slurm/` folder:

```bash
git clone https://github.com/duttaprat/slurm_clinwulf.git
cd slurm_clinwulf/jupyter
```
2️⃣ Load Slurm and Submit the Job
      ```bash
      module load slurm/slurm/20.02.7
      sbatch --mem=150G --time=1:00:00 --partition=short jupyter_lab_slurm_arg.sh 9858
      ```
      This will launch Jupyter Lab on a compute node. The output will be saved in a file like `jupyterlab-<jobid>.log`. This gives you a `<job-id>`
   
3️⃣ 🔑 Get the SSH Tunnel Command and Access Token
   Once the job starts, extract the info using:
   ```bash
   ./jupytertoken.sh <jobid>
   ```
   This will print:
      * SSH tunnel command
      * Token for browser login


4️⃣ 🌐 Create the SSH Tunnel
      **From your local machine** (_please remember to open a new terminal on your local machine_), run the command printed by `jupytertoken_arg.sh`. Example:
      
      ```bash
      ssh -N -f -L 8888:compute014:8888 yourusername@login01.uhmc.sbuh.stonybrook.edu
      ```
      Replace `compute014` and `yourusername` with the output from the `jupytertoken.sh` script.



5️⃣ 🧪 Access Jupyter Lab
   Open your browser and go to:
   ```bash
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


🙋‍♀️ Contributing / Support
Feel free to open an issue or discussion for improvements, questions, or troubleshooting help.
