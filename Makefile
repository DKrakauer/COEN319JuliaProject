SRC := serial.cpp
OMPSRC := openmp.cpp

default: serial

serial: fw_serial

openmp: fw_omp

fw_serial: $(SRC)
	g++ -O3 -O0 -Wall -Wextra -o $@ $<

fw_omp: $(OMPSRC)
	g++ -fopenmp -O3 -O0 -g -Wall -Wextra -o $@ $<

clean: 
	rm -f fw_serial fw_omp

submit: clean
	rm -f *.out

dataset:
	mkdir data
	mkdir data/2018
	mkdir data/2021
	unzip DB1BDataset2018.zip -d data/2018
	unzip DB1BDataset2021.zip -d data/2021
	python3 preprocess.py

dataset_preproc:
	python3 preprocess.py