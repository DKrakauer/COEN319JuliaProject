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