#!/bin/bash
#SBATCH --partition=broadwell
#SBATCH -N 1 
srun /opt/adw/bin/adw run -i quay.io/biocontainers/fastqc:0.11.9--hdfd78af_1  -c "/bin/bash -c '{{streamflow_command}}'"
