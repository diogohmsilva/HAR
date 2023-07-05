# Plot the accelerometer and gyrocope data
# Usage for a data file called "experiment.txt": python3 plotMovement.py experiment.txt

from scipy.io.wavfile import read
import sys
import numpy as np
import matplotlib.pyplot as plt
from scipy.misc import derivative
from scipy.io.wavfile import read


g_x = []
g_y = []
g_z = []
a_x = []
a_y = []
a_z = []
t = []

th_g = []
th_a = []




if len(sys.argv) > 1:

	filename_movement = sys.argv[1]	
	
	movementfile = open(filename_movement, 'r')
	
	lines = movementfile.readlines()
	
	for line in lines:
		try:
			word = line.split()
			
			g_x.append(float(word[0]))
			g_y.append(float(word[1]))
			g_z.append(float(word[2]))
			a_x.append(float(word[3]))
			a_y.append(float(word[4]))
			a_z.append(float(word[5]))
			t.append(float(word[6]))
		except IndexError:
			break
	
					
			
	
	movementfile.close()
	
	
	fig0, axs0 = plt.subplots(3, sharex = True)
	
	
	axs0[0].plot(t, g_x, label = 'g[x]',c = 'y')	
	axs0[1].plot(t, g_y, label = 'g[y]',c = 'g')	
	axs0[2].plot(t, g_z, label = 'g[z]',c = 'b')	
	
	for ax in axs0[0:2]:
		ax.set_ylabel("dps")
		ax.set_xlabel("ms")


	fig1, axs1 = plt.subplots(3, sharex = True)
	
	axs1[0].plot(t, a_x, label = 'a[x]',c = 'y')
	axs1[1].plot(t, a_y, label = 'a[y]',c = 'g')
	axs1[2].plot(t, a_z, label = 'a[z]',c = 'b')
	
	for ax in axs1[0:2]:
		ax.set_ylabel("g")
		ax.set_xlabel("ms")
	fig0.legend()
	fig1.legend()

	plt.legend()
	plt.show()
else:	

	print("Usage : python3 plotMovement.py [movement filename]")
	sys.exit()
