#!/bin/bash
#SBATCH -A TG-CCR140008
#SBATCH -J setup_script
#SBATCH -o setup_script.stdout
#SBATCH -n 1         
#SBATCH -p normal
#SBATCH -t 00:10:00     

source ~/.bashrc

cd /work/03358/tg826576/parallel_final/benchmark_runs/

cd strong_scaling_8
for i in 1 5 10 15 20 25 30; do
	mkdir $i
	cd $i
	cp /work/03358/tg826576/parallel_final/template_files/base* /work/03358/tg826576/parallel_final/template_files/grompp* /work/03358/tg826576/parallel_final/template_files/topol.top .
	cp /work/03358/tg826576/parallel_final/template_files/conf.gro_0.125 ./conf.gro
	sed -e "s/processor_count/$i/" -e "s/thread_count/8/" </work/03358/tg826576/parallel_final/template_files/run_electrolyte_sim.slurm >./run_electrolyte_sim.slurm
	cd ..
done
cd ..

cd strong_scaling_16
for i in 1 3 5 7 9 11 13 15; do
	mkdir $i
	cd $i
	cp /work/03358/tg826576/parallel_final/template_files/base* /work/03358/tg826576/parallel_final/template_files/grompp* /work/03358/tg826576/parallel_final/template_files/topol.top .
	cp /work/03358/tg826576/parallel_final/template_files/conf.gro_0.125 ./conf.gro
	sed -e "s/processor_count/$i/" -e "s/thread_count/16/" </work/03358/tg826576/parallel_final/template_files/run_electrolyte_sim.slurm >./run_electrolyte_sim.slurm
	cd ..
done
cd ..

cd strong_scaling_32
for i in 1 2 3 4 5 6 7; do
	mkdir $i
	cd $i
	cp /work/03358/tg826576/parallel_final/template_files/base* /work/03358/tg826576/parallel_final/template_files/grompp* /work/03358/tg826576/parallel_final/template_files/topol.top .
	cp /work/03358/tg826576/parallel_final/template_files/conf.gro_0.125 ./conf.gro
	sed -e "s/processor_count/$i/" -e "s/thread_count/32/" </work/03358/tg826576/parallel_final/template_files/run_electrolyte_sim.slurm >./run_electrolyte_sim.slurm
	cd ..
done
