#!/bin/bash
#SBATCH --partition=broadwell
#SBATCH -N 1 
srun /opt/adw/bin/adw run -i ewels/multiqc -c "/bin/bash -c '{{streamflow_command}}'"
