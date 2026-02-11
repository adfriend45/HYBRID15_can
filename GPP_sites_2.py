import matplotlib.pyplot as plt
import numpy as np

def linear_regression(x, y):
    coefs = np.polynomial.polynomial.polyfit(x, y, 1)
    ffit = np.poly1d(coefs)
    m1 = ffit[0]
    b1 = ffit[1]
    eq = 'y = {}x + {}'.format(round(m1, 3), round(b1, 3))
    rsquared = np.corrcoef(x, y)[0, 1]**2
    return rsquared, eq, m1, b1

kyr_ulf, TRW = np.loadtxt ('ulf_TRW.txt',unpack=True)
mikyr, miGPP, miNPP = np.loadtxt ('output_ann.txt',unpack=True)
ksite, kyr, lon, lat, GPP = np.loadtxt ('output_ann_sites.txt',unpack=True)

a = 201
b = a + 114
print(kyr_ulf[a], kyr_ulf[b])
x = kyr_ulf [a:b]
y = TRW [a:b]

my = np.mean(y)
y = y / my
plt.plot(x, y, label = 'TRW')
x_TRW = y

a = 0
b = 114
print(mikyr[a], mikyr[b])
x = mikyr [a:b]
y = miGPP [a:b]

my = np.mean(y)
y = y / my
#plt.plot(x,y, label = 'GPP')

a = 0
b = 114
print(kyr[a], kyr[b])
x = kyr [a:b]
y = GPP [a:b]

my = np.mean(y)
y = y / my
#plt.plot (x, y, alpha = 0.3)

a = 0
b = 114
for i in range(0,295):
    x = kyr [a:b]
    y = GPP [a:b]
    my = np.mean(y)
    #print(kyr[a], kyr[b], my)
    if my > 0.0:
        y = y / (my)
        #plt.plot (x, y, alpha = 0.3)
        rsquared, eq, m, b1 = linear_regression(x_TRW,y)
        rs = rsquared**0.5
        if rs > 0.59:
            print((a+123)/123,lon[a],lat[a],'GPP',rs) # Pearson r
            plt.plot (x,y, alpha=0.3)
    a = a + 123
    b = b + 123

#plt.plot (x, y, alpha = 0.3)
######################################
a = 0
b = 114
print(mikyr[a], mikyr[b])
x = mikyr [a:b]
y = miGPP [a:b]

my = np.mean(y)
y = y / my
plt.plot(x,y, label = 'GPP')
######################################

plt.legend()
plt.show()
