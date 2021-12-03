#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks=28
#SBATCH --ntasks-per-node=2
#SBATCH --time=00:10:00
#SBATCH --output=myoutput.log
#SBATCH --job-name=my-julia-job

source /WAVE/users/unix/dkrakauer/julia
cd working/folder/of/your/choice
julia my_clustermanager_script.jl