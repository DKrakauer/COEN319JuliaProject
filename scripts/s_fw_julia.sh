#!/bin/bash
#
#SBATCH --job-name=dkproj
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=56
#SBATCH --mem-per-cpu=8G
#SBATCH --nodes=1
#SBATCH --output=logs/log-%j.out
#SBATCH --time=3:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=dkrakauer@scu.edu
#

source /WAVE/users/unix/dkrakauer/julia
cd /WAVE/users/unix/dkrakauer/COEN319JuliaProject

for g in 1 2 4 8 16 28; do
    echo ________________ Threads ${g} ________________
    julia fwpara.jl --threads ${g}
done
