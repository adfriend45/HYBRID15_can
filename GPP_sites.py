import matplotlib.pyplot as plt
import numpy as np

kyr_ulf, TRW = np.loadtxt ('ulf_TRW.txt',unpack=True)

mikyr, miGPP, miNPP = np.loadtxt ('output_ann.txt',unpack=True)
ksite, kyr, lon, lat, GPP = np.loadtxt ('output_ann_sites.txt',unpack=True)

a = 201
b = a + 113
x = TRW [a:b]
c = a - 201
d = b - 201
y = miGPP [c:d]
y1 = miNPP [c:d]

mTRW = np.mean(x)
mGPP = np.mean(y)
mNPP = np.mean(y1)
print(mTRW, mGPP)
print(mTRW, mNPP)

GPP_sub = []
kyr_sub = []

plt.xlim(1900,2015)
a = 0
b = a + 115
for i in range(0,295):
        #print (i,a,b)
        plt.plot (kyr[a:b], GPP[a:b], alpha=0.3)
        #if GPP[a] > 1500:
            #GPP_sub.append(miGPP[i])
            #kyr_sub.append(mikyr[i])
        #if GPP[a] < 1500:
        #    print (lon[a],lat[b])
        a = a + 123
        b = b + 123

plt.plot (kyr_ulf, 1669*TRW/mTRW, color='pink', label = 'TRW', linewidth = 1)
plt.plot (mikyr, miGPP, color='red', label = 'miGPP', linewidth = 1)

#plt.plot(TRW[a:b],GPP[c:d],'o')

plt.legend()
def linear_regression(x, y1):
    coefs = np.polynomial.polynomial.polyfit(x, y1, 1)
    ffit = np.poly1d(coefs)
    m = ffit[0]
    b = ffit[1]
    eq = 'y = {}x + {}'.format(round(m, 3), round(b, 3))
    rsquared = np.corrcoef(x, y1)[0, 1]**2
    return rsquared, eq, m, b

rsquared, eq, m, b = linear_regression(x,y1)
print(rsquared, m, b) # Pearson Coefficient, R2
print(eq)
rs = rsquared**0.5
print('GPP',rs) # Pearson r

plt.savefig("GPP_sites.pdf",format='pdf')

plt.show()
