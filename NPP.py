import matplotlib.pyplot as plt
import numpy as np

kyr_ulf, TRW = np.loadtxt ('ulf_TRW.txt',unpack=True)

kyr_ce, GPP, NPP = np.loadtxt ('output_ann.txt',unpack=True)

aTRW = 1901-1700+1
bTRW = 2015-1700+1
mTRW = np.mean(TRW[aTRW:bTRW])

aGPP = 1
bGPP = 2015-1901+1
mGPP = np.mean(GPP[aGPP:bGPP])

aNPP = 1
bNPP = 2015-1901+1
mNPP = np.mean(NPP[aNPP:bNPP])

print('mean TRW = ',mTRW)
print('mean GPP = ',mGPP)
print('mean NPP = ',mNPP)

plt.xlim (1901, 2023)
plt.plot (kyr_ulf, TRW/mTRW, label = 'TRW')
plt.plot (kyr_ce , GPP/mGPP, label = 'GPP')
#plt.plot (kyr_ce , NPP/mNPP, label = 'NPP')

plt.savefig("GPP.pdf",format='pdf')

plt.legend()

x = TRW [aTRW:bTRW]
y = GPP [aGPP:bGPP]
def linear_regression(x, y):
    coefs = np.polynomial.polynomial.polyfit(x, y, 1)
    ffit = np.poly1d(coefs)
    m = ffit[0]
    b = ffit[1]
    eq = 'y = {}x + {}'.format(round(m, 3), round(b, 3))
    rsquared = np.corrcoef(x, y)[0, 1]**2
    return rsquared, eq, m, b
rsquared, eq, m, b = linear_regression(x,y)
print(rsquared, m, b) # Pearson Coefficient, R2
print(eq)
rs = rsquared**0.5
print('GPP',rs) # Pearson r

x = TRW [aTRW:bTRW]
y = NPP [aNPP:bNPP]
def linear_regression(x, y):
    coefs = np.polynomial.polynomial.polyfit(x, y, 1)
    ffit = np.poly1d(coefs)
    m = ffit[0]
    b = ffit[1]
    eq = 'y = {}x + {}'.format(round(m, 3), round(b, 3))
    rsquared = np.corrcoef(x, y)[0, 1]**2
    return rsquared, eq, m, b
rsquared, eq, m, b = linear_regression(x,y)
print(rsquared, m, b) # Pearson Coefficient, R2
print(eq)
rs = rsquared**0.5
print('NPP',rs) # Pearson r

plt.show()
