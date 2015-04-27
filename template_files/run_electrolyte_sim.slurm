#!/bin/bash
#SBATCH -A TG-CCR140008
#SBATCH -J benchmark
#SBATCH -o benchmark.stdout
#SBATCH -n 1
#SBATCH -p normal
#SBATCH -t 05:00:00     

export MIC_PPN=3
export MIC_OMP_NUM_THREADS=4

source ~/.bashrc

# now for 100 ps
grompp -f grompp_minimize.mdp -maxwarn 10
mdrun
cp confout.gro conf.gro

# now for 100 ps
grompp -f grompp_equil_nvt.mdp -maxwarn 10
ibrun.symm -m mdrun.mic
#mpirun -np 12 mdrun_mpi
