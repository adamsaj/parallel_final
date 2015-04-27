#!/bin/bash
#SBATCH -A TG-CCR140008
#SBATCH -J setup_script
#SBATCH -o setup_script.stdout
#SBATCH -n 1         
#SBATCH -p normal
#SBATCH -t 00:10:00     

source ~/.bashrc

cd /work/03358/tg826576/parallel_final/benchmark_runs/

cd thread_scaling
for i in 4 20 40 60 80 100 120 140 160 180 200 220 240; do
#	mkdir $i
	cd $i
	cp /work/03358/tg826576/parallel_final/template_files/base* /work/03358/tg826576/parallel_final/template_files/grompp* /work/03358/tg826576/parallel_final/template_files/topol.top .
	cp /work/03358/tg826576/parallel_final/template_files/conf.gro_0.125 ./conf.gro
	sed -e "s/processor_count/1/" -e "s/thread_count/$i/" </work/03358/tg826576/parallel_final/template_files/run_electrolyte_sim.slurm >./run_electrolyte_sim.slurm
	cd ..
done

#cd ../symetric
#for i in 1 5 10 15 20 30 60; do
#	mkdir $i
#	cd $i
#	cp /work/03358/tg826576/parallel_final/template_files/base* /work/03358/tg826576/parallel_final/template_files/grompp* /work/03358/tg826576/parallel_final/template_files/topol.top .
#	cp /work/03358/tg826576/parallel_final/template_files/conf.gro_0.125 ./conf.gro
#	j=$((60/$i*4))
#	sed -e "s/processor_count/$i/" -e "s/thread_count/$j/" </work/03358/tg826576/parallel_final/template_files/run_electrolyte_sim.slurm >./run_electrolyte_sim.slurm
#	cd ..
#done
