# 🚀 HPC Job Scripts on ClinWulf Cluster (Slurm)

This repository provides Slurm job script templates to run various workloads on the **ClinWulf HPC cluster** at Stony Brook University — including:

- 🧪 **Jupyter Lab**
- 📓 **Jupyter Notebook**
- ⚙️ **Regular Python / Shell scripts**

> 🔧 These scripts help you efficiently launch jobs on compute/GPU nodes via Slurm, and support SSH tunneling for interactive environments like Jupyter.

---

## 📁 Folder Structure
```
slurm_clinwulf/
├── jupyter/                        # 🔗 Launch Jupyter Lab or Notebook interactively on compute nodes
│   ├── jupyter_lab_slurm.sh
│   ├── jupyter_notebook_slurm.sh  # (optional)
│   ├── jupytertoken.sh
│   └── README.md                   # Mini-readme for Jupyter
│
├── scripts/                        # ⚙️  Run standard batch jobs (Python, R, etc.) using Slurm
│   ├── run_python_script.sh
│   ├── environment.yaml            # Optional: Shared conda env
│   └── README.md                   # Mini-readme for script usage
│
├── LICENSE
└── README.md                       # Main README (overview + links to folders)

```

---


## 📚 Detailed Instructions

📓 **[Jupyter Setup Instructions →](jupyter/README.md)**  
Covers how to run Jupyter Lab or Notebook using Slurm and connect via SSH tunneling.

⚙️ **[Batch Script Instructions →](scripts/README.md)**  
Covers how to submit standard Python/R jobs using Slurm (coming soon!).


---

## 💡 Coming Soon

- [ ] Support for custom Conda environments in both folders
- [ ] Slurm templates for Python, and Shell
- [ ] Screenshots and logs for troubleshooting
- [ ] `sbatch`/`srun` tips and job monitoring tools

---

## 📄 License

MIT License

---

## 🙋‍♀️ Contributing / Support

Feel free to open an issue or discussion for:
- Script improvements
- Feature requests
- Help with job setup or Slurm errors


   
📄 License
MIT License

---

