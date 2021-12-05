#!/bin/bash
#
#SBATCH --job-name=dkproj
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=28
#SBATCH --mem-per-cpu=8G
#SBATCH --nodes=1
#SBATCH --output=/WAVE/users/unix/dkrakauer/COEN319JuliaProject/juliaout2.txt
#SBATCH --time=3:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=dkrakauer@scu.edu
#

source /WAVE/users/unix/dkrakauer/julia/j_env
cd /WAVE/users/unix/dkrakauer/COEN319JuliaProject

for g in 1 2 4 8 16 28; do
	echo ________________ Threads ${g} ________________
	export JULIA_NUM_THREADS=${g}
	julia fwpara.jl
done

