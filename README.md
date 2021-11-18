# COEN 319 Project
### Authors: Alexandra Kissas, David Krakauer, Colin Rioux
###### Distributed Floyd-Warshall Implementation in Julia and C++
The goal of this project is to demonstrate the usage of Julia in a parallel problem
in which we can compare its performance with a lower-level language like C++.

THe Floyd-Warshall problem is used in this situation to demonstrate some of the core
parallel and distributed systems libraries available to each, as well as their individual
performance. The dataset used for testing is a publicly available data set about the market prices for flights between airports, which input through a graph matrix.