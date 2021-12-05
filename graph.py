##COEN-319 Speed-up Graph Script
##Fall 2021
##Alexandria Kissas

##Packages/Libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

##Functions
def strong_scaling(t1,tt):
    return tt/t1

def weak_scaling(t1,tt):
    return t1/tt

def process(times, scaling_func):
    processed = []
    for t in times:
        processed.append(scaling_func(times[0],t))
    return processed

##def get_graphing_vars(filename):
##    data = pd.DataFrame(pd.read_csv(filename+'.csv'))
    
    
threads = [1,
2,
4,
8,
16,
28]

serial = [300, 300, 1000, 2500, 5000, 10000]
results = [0,0,3,47,376,2992]

omp_2018 = [0.23756,
0.119873,
0.061297,
0.032512,
0.020288,
0.013956]

omp_2021 = [0.258341,
0.130321,
0.066635,
0.035512,
0.021715,
0.015152]

omp_1000 = [3.293781,
1.657093,
0.839807,
0.428324,
0.235122,
0.146253]

omp_2500 = [50.880959,
25.565109,
12.893659,
6.481454,
3.513888,
2.113388]

omp_5000 = [400.616732,
201.104608,
101.182272,
51.509837,
27.982837,
16.515188]

omp_10000 = [3506.156129,
1750.673189,
885.702772,
450.397551,
267.698308,
283.020232]

omp_2018 = process(omp_2018, strong_scaling)
omp_2021 = process(omp_2021, strong_scaling)
omp_1000 = process(omp_1000, strong_scaling)
omp_2500 = process(omp_2500, strong_scaling)
omp_5000 = process(omp_5000, strong_scaling)
omp_10000 = process(omp_10000, strong_scaling)


jg_2018 = [0.227076652,
0.214703535,
0.213235693,
0.23433367,
0.2492373,
0.362956393]

jg_2021 = [0.043055345,
0.023003845,
0.021371347,
0.022543442,
0.037107261,
0.07238574]

jg_1000 = [0.865362462,
0.602055139,
0.470233938,
0.415913878,
0.321427109,
0.423408721]

jg_2500 = [14.34101575,
7.479092316,
3.912042451,
2.351201454,
2.648219904,
2.555252632]

jg_5000 = [138.5220296,
70.20419159,
37.26713184,
28.2633668,
27.67699117,
24.00291645]

jr_2018 = [0.110025648,
0.073181996,
0.056108027,
0.074505088,
0.081330332,
0.101345708]

jr_2021 = [0.087491606,
0.048114145,
0.029021264,
0.03191659,
0.048383701,
0.061059795]

jr_1000 = [1.172596834,
0.629416235,
0.343136486,
0.223181972,
0.238554134,
0.222939708]

jr_2500 = [24.29408578,
12.7479951,
6.202865223,
3.23246976,
2.554500446,
2.303637779]

jr_5000 = [200.7738064,
101.3849112,
50.10533747,
26.3479284,
23.05037414,
16.44057974]

jg_2018 = process(jg_2018, strong_scaling)
jg_2021 = process(jg_2021, strong_scaling)
jg_1000 = process(jg_1000, strong_scaling)
jg_2500 = process(jg_2500, strong_scaling)
jg_5000 = process(jg_5000, strong_scaling)
##jg_10000 = process(jg_10000, strong_scaling)

jr_2018 = process(jr_2018, strong_scaling)
jr_2021 = process(jr_2021, strong_scaling)
jr_1000 = process(jr_1000, strong_scaling)
jr_2500 = process(jr_2500, strong_scaling)
jr_5000 = process(jr_5000, strong_scaling)
##jr_10000 = process(jr_10000, strong_scaling)

##plt.figure()
##plt.title('OMP Speedup')
##plt.xlabel('number of threads')
##plt.ylabel('strong scaling')
##plt.plot(threads, omp_2018, marker='o', label='2018, 300 pts')
##plt.plot(threads, omp_2021, marker='o', label='2021. 300 pts')
##plt.plot(threads, omp_1000, marker='o', label='1000')
##plt.plot(threads, omp_2500, marker='o', label='2500')
##plt.plot(threads, omp_5000, marker='o', label='5000')
##plt.plot(threads, omp_10000, marker='o', label='10000')
##plt.legend()
##plt.show()

##plt.figure()
##plt.title('JuliaGraph Speedup')
##plt.xlabel('number of threads')
##plt.ylabel('strong scaling')
##plt.plot(threads, jg_2018, marker='o', label='2018, 300 pts')
##plt.plot(threads, jg_2021, marker='o', label='2021. 300 pts')
##plt.plot(threads, jg_1000, marker='o', label='1000')
##plt.plot(threads, jg_2500, marker='o', label='2500')
##plt.plot(threads, jg_5000, marker='o', label='5000')
####plt.plot(threads, jg_10000, marker='o', label='10000')
##plt.legend()
##plt.show()

##plt.figure()
##plt.title('Julia Solution Speedup')
##plt.xlabel('number of threads')
##plt.ylabel('strong scaling')
##plt.plot(threads, jr_2018, marker='o', label='2018, 300 pts')
##plt.plot(threads, jr_2021, marker='o', label='2021. 300 pts')
##plt.plot(threads, jr_1000, marker='o', label='1000')
##plt.plot(threads, jr_2500, marker='o', label='2500')
##plt.plot(threads, jr_5000, marker='o', label='5000')
####plt.plot(threads, jr_10000, marker='o', label='10000')
##plt.legend()
##plt.show()

##plt.figure()
##plt.title('2018 Dataset')
##plt.xlabel('number of threads')
##plt.ylabel('strong scaling')
##plt.plot(threads, jr_2018, marker='o', label='Julia Solution')
##plt.plot(threads, jg_2018, marker='o', label='JuliaGraph')
##plt.plot(threads, omp_2018, marker='o', label='OMP')
##plt.legend()
##plt.show()

##plt.figure()
##plt.title('2021 Dataset')
##plt.xlabel('number of threads')
##plt.ylabel('strong scaling')
##plt.plot(threads, jr_2021, marker='o', label='Julia Solution')
##plt.plot(threads, jg_2021, marker='o', label='JuliaGraph')
##plt.plot(threads, omp_2021, marker='o', label='OMP')
##plt.legend()
##plt.show()

##plt.figure()
##plt.title('1000 Dataset')
##plt.xlabel('number of threads')
##plt.ylabel('strong scaling')
##plt.plot(threads, jr_1000, marker='o', label='Julia Solution')
##plt.plot(threads, jg_1000, marker='o', label='JuliaGraph')
##plt.plot(threads, omp_1000, marker='o', label='OMP')
##plt.legend()
##plt.show()

##plt.figure()
##plt.title('2500 Dataset')
##plt.xlabel('number of threads')
##plt.ylabel('strong scaling')
##plt.plot(threads, jr_2500, marker='o', label='Julia Solution')
##plt.plot(threads, jg_2500, marker='o', label='JuliaGraph')
##plt.plot(threads, omp_2500, marker='o', label='OMP')
##plt.legend()
##plt.show()

##plt.figure()
##plt.title('5000 Dataset')
##plt.xlabel('number of threads')
##plt.ylabel('strong scaling')
##plt.plot(threads, jr_5000, marker='o', label='Julia Solution')
##plt.plot(threads, jg_5000, marker='o', label='JuliaGraph')
##plt.plot(threads, omp_5000, marker='o', label='OMP')
##plt.legend()
##plt.show()
