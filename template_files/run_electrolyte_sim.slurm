#!/bin/bash
#SBATCH -A TG-CCR140008
#SBATCH -J benchmark
#SBATCH -o benchmark.stdout
#SBATCH -n 1 -N 1
#SBATCH -p normal-mic
#SBATCH -t 05:00:00     

export MIC_PPN=processor_count
export MIC_OMP_NUM_THREADS=thread_count

source ~/.bashrc

# now for 100 ps
grompp -f grompp_minimize.mdp -maxwarn 10
mdrun
cp confout.gro conf.gro

# now for 100 ps
grompp -f grompp_equil_nvt.mdp -maxwarn 10
ibrun.symm -m mdrun.mic
#mpirun -np 12 mdrun_mpi
