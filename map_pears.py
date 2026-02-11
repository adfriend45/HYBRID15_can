import matplotlib.pyplot as plt
import numpy as np

ksite, lon, lat, rnpp = np.loadtxt ('pears.txt',unpack=True)

color = [str(item) for item in rnpp]

fig = plt.figure()
fig.set_figheight(10)
fig.set_figwidth(16)

plt.scatter(lon,lat,s=1,c=color,marker='s')

for i, txt in enumerate(rnpp):
    plt.annotate(txt, (lon[i], lat[i]), size = 7)

plt.savefig("pears_sites.pdf",format='pdf')

plt.show()
