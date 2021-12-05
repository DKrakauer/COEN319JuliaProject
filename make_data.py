#!/usr/bin/python3
"""
Preprocess the dataset into operable graph representations
Author: David Anastasiu
Author: David Krakauer
"""

import numpy as np
def genGraph(n, prob=0.6):
    np.random.seed(0)
    print('Creating %lu x %lu SPD matrix...' % (n, n))
    # construct a symmetric matrix
    A = np.random.rand(n,n)
    A = (A + A.T) * 10.0
    # make diagonal values infinity
    np.fill_diagonal(A, 0)
    B = np.random.rand(n,n) > prob
    B = B + B.T
    A[B] = np.inf
    # write matrix to file
    with open('./%d.graph' % n, "w") as fh:
        fh.write("%d\n" % n)
        np.savetxt(fh, A, delimiter=' ', fmt='%1.4g')
    print('Wrote matrix to %d.graph' % n)

genGraph(1000, 0.4)
genGraph(2500, 0.3)
genGraph(5000, 0.2)
