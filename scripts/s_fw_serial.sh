#!/bin/bash
#
#SBATCH --job-name=criouxpSERIAL
#SBATCH --partition=shared
#SBATCH --ntasks-per-node=56
#SBATCH --mem=8G
#SBATCH --nodes=1
#SBATCH --output=/home/crioux/project/logs/serial-%j.out
#SBATCH --time=1:10:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=crioux@scu.edu

#SBATCH -A scu100
#
export OMP_PLACES=cores
export OMP_PROC_BIND=true

module load gcc/10.2.0
cd /home/crioux/project
make fw_serial
./fw_serial /home/crioux/project/data/Origin_and_Destination_Survey_DB1BMarket_2018_1.csv.graph outs/serial_2018.out
./fw_serial /home/crioux/project/data/Origin_and_Destination_Survey_DB1BMarket_2021_1.csv.graph outs/serial_2021.out