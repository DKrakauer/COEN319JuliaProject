# COEN 319 Project
Authors: Alexandra Kissas, David Krakauer, Colin Rioux
This project was made for a graduate course on parallel programing at Santa Clara University, 2021.

### Distributed Floyd-Warshall Implementation in Julia and C++
The goal of this project is to demonstrate the usage of Julia in a parallel problem
in which we can compare its performance with a lower-level language like C++.

The Floyd-Warshall problem is used in this situation to demonstrate some of the core
parallel and distributed systems libraries available to each, as well as their individual
performance. The dataset used for testing is a publicly available data set about the market prices for flights between airports, which input through a graph matrix.

## Installation
Requirements:
- Python3
- Julia
- C++

### Dataset
1. Download DB1BDataset2018 from [our mirror](https://drive.google.com/file/d/19sXIK9Zo7ZZ2VoEBTIejD-cYezjQXATe/view?usp=sharing) into the root of the project.

2. Download DB1BDataset2021 from [our mirror](https://drive.google.com/file/d/1-eumEXlShRpxW78l6ernpc0wC5BCH6g7/view?usp=sharing) into the root of the project

3. Then, place these into the `/data` directory within the project files.

4. Then, in the root of the project:
```bash
$ make dataset
```

5. Optionally, 
This script will unpack the datasets present in the `/data` directory & preprocess them into our graph format.

## Setting up the julia envirnoment on WAVE (Or any other HPC envirnoment)
1. First, download the julia envirnoment files from https://julialang.org/downloads/, and download the binary for your system. (For WAVE, it would be the generic linux binaries (Linux x86).
2. Next, create a directory with the unpacked files and create a file named `j_env`

Example j_env on WAVE where the julia files have been stored at `/WAVE/users/unix/{USER}/julia/`
```
export PATH=/WAVE/users/unix/{USER}/julia/bin:$PATH
export LD_LIBRARY_PATH=/WAVE/users/unix/{USER}/julia/lib:$LD_LIBRARY_PATH
export CPATH=/WAVE/users/unix/{USER}/julia/include:$CPATH
```
3. Then, include the following in your bash script before submitting your job through SLURM:

```
source /WAVE/users/unix/{USER}/julia/j_env
cd /WAVE/user/unix//{USER}/{Project Location}
```
An example script can be found in `/scripts/s_fw_julia.sh`

# Julia compilation
1. Julia can be compiled and run with the `julia fwpara.jl`
2. To run with threads, export the `export JULIA_NUM_THREADS={Thread Count}` envirnoment variable before running fwpara.jl

# C++/OpenMP compilation


