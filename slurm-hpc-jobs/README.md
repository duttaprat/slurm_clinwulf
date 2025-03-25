# 🚀 HPC Job Scripts on ClinWulf Cluster (Slurm)

This repository provides Slurm job script templates to run various workloads on the **ClinWulf HPC cluster** at Stony Brook University, including **Jupyter Lab**, **Jupyter Notebook**, and regular **Python/R/Shell scripts**.


> 🔧 These scripts help you launch Jupyter Lab on a compute/GPU node via Slurm and connect through SSH tunneling using your web browser.


---

## 📁 Folder Structure
```
slurm-hpc-jobs/
├── jupyter/                        # 🔗 Launch Jupyter Lab or Notebook interactively on compute nodes
│   ├── jupyter_lab_slurm.sh
│   ├── jupyter_notebook_slurm.sh  # (optional)
│   ├── jupytertoken.sh
│   └── [README.md](./jupyter/README.md)                   # Mini-readme for Jupyter
│
├── scripts/                        # ⚙️  Run standard batch jobs (Python, R, etc.) using Slurm
│   ├── run_python_script.sh
│   ├── run_r_script.sh
│   ├── environment.yaml            # Optional: Shared conda env
│   └── README.md                   # Mini-readme for script usage
│
├── LICENSE
└── README.md                       # Main README (overview + links to folders)

```

---

## 📦 What’s Included

This GitHub repository contains two Bash scripts:

1. **`jupyter_lab_slurm.sh`**  
   A Slurm job submission script that requests computing resources and launches a Jupyter Lab server on a compute node.

2. **`jupytertoken.sh`**  
   A helper script that parses the Slurm log file to extract the correct SSH tunneling command and Jupyter access token.

---

## 🚀 Quickstart Guide

### 1️⃣ Download and Transfer Scripts to ClinWulf

Clone the repository and move into the `slurm/` folder:

```bash
git clone https://github.com/duttaprat/Slurm_Clinwulf.git
cd Slurm_Clinwulf/slurm
```
2️⃣ Load Slurm and Submit the Job
      ```
      module load slurm/slurm/20.02.7
      sbatch jupyter_lab_slurm.sh
      ```
      This will launch Jupyter Lab on a compute node. The output will be saved in a file like `jupyter-notebook-<jobid>.log`. This gives you a `<job-id>`
   
3️⃣ 🔑 Get the SSH Tunnel Command and Access Token
   Once the job starts, extract the info using:
   ```
   ./jupytertoken.sh <jobid>
   ```
   This will print:
      * SSH tunnel command
      * Token for browser login


4️⃣ 🌐 Create the SSH Tunnel
      From your local machine, run the command printed by jupytertoken.sh. Example:
      ```
      ssh -N -f -L 8888:compute014:8888 yourusername@login01.uhmc.sbuh.stonybrook.edu
      ```
      Replace `compute014` and `yourusername` with the output from the `jupytertoken.sh` script.



5️⃣ 🧪 Access Jupyter Lab
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


🙋‍♀️ Contributing / Support
Feel free to open an issue or discussion for improvements, questions, or troubleshooting help.
