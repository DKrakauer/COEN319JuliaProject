#!/bin/bash
#
#SBATCH --job-name=criouxOMP
#SBATCH --partition=shared
#SBATCH --ntasks-per-node=56
#SBATCH --mem=8G
#SBATCH --nodes=1
#SBATCH --output=/home/crioux/project/logs/omp-%j.out
#SBATCH --time=5:10:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=crioux@scu.edu

#SBATCH -A scu100
#
export OMP_PLACES=cores
export OMP_PROC_BIND=true

module load gcc/10.2.0
cd /home/crioux/project
make fw_omp
for g in 1 2 4 8 16 28; do
    ./fw_omp /home/crioux/project/1000.graph outs/omp-1000-${g}.out -t ${g}
    ./fw_omp /home/crioux/project/2500.graph outs/omp-2500-${g}.out -t ${g}
    ./fw_omp /home/crioux/project/5000.graph outs/omp-5000-${g}.out -t ${g}
    ./fw_omp /home/crioux/project/data/Origin_and_Destination_Survey_DB1BMarket_2018_1.csv.graph outs/omp_2018-${g}.out -t ${g}
    ./fw_omp /home/crioux/project/data/Origin_and_Destination_Survey_DB1BMarket_2021_1.csv.graph outs/omp_2021-${g}.out -t ${g}
done