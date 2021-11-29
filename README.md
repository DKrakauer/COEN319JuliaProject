# COEN 319 Project
Authors: Alexandra Kissas, David Krakauer, Colin Rioux
This project was made for a graduate course on parallel programing at Santa Clara University, 2021.

## Installation
Requirements:
- Python3

### Dataset
1. Download DB1BDataset2018 from [our mirror](https://drive.google.com/file/d/19sXIK9Zo7ZZ2VoEBTIejD-cYezjQXATe/view?usp=sharing) into the root of the project.

2. Download DB1BDataset2021 from [our mirror](https://drive.google.com/file/d/1-eumEXlShRpxW78l6ernpc0wC5BCH6g7/view?usp=sharing) into the root of the project

3. Then, in the root of the project:
```bash
$ make dataset
```
This script will unpack the datasets & preprocess them into our graph format.

### Distributed Floyd-Warshall Implementation in Julia and C++
The goal of this project is to demonstrate the usage of Julia in a parallel problem
in which we can compare its performance with a lower-level language like C++.

THe Floyd-Warshall problem is used in this situation to demonstrate some of the core
parallel and distributed systems libraries available to each, as well as their individual
performance. The dataset used for testing is a publicly available data set about the market prices for flights between airports, which input through a graph matrix.