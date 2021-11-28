/**
 * @file serial.cpp
 * @author Colin Rioux <crioux@scu.edu>
 * @author David Krakauer
 * @author Alexandra Kissas
 * 
 */

# include <iostream>
# include <stdio.h>
# include <stdlib.h>
# include <assert.h>
# include <time.h>
# include <cstring>

/**
 * Load in the dataset
 * 
 * @param filename the path to the dataset
 */
static void load(const char * const filename)
{
    FILE * fp = fopen(filename, "r");
    assert(fp);

    
}

// d(i,j,k) = min(d(i,j,k-1), d(i,k,k-1) + d(k,j,k-1))
static void floyd_warshall()
{

}

int main(int argc, char **argv)
{

    return EXIT_SUCCESS;
}