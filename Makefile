SRC := serial.cpp
OMPSRC := openmp.cpp

default: serial

serial: $(SRC)
	g++ -O3 -O0 -Wall -Wextra -o $@ $<

openmp: $(OMPSRC)
	g++ -fopenmp -O3 -O0 -g -Wall -Wextra -o $@ $<

clean: 
	rm -f serial openmp

submit: clean
	rm -f *.out

dataset:
	mkdir data
	mkdir data/2018
	mkdir data/2021
	unzip DB1BDataset2018.zip -d data/2018
	unzip DB1BDataset2021.zip -d data/2021