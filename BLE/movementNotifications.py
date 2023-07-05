# Connect to the SensorTag and receive messages from a custom characteristic 
# The message consists of the data for each sensor axis (2 bytes each) and the timestamp
# Saves the received data to a file called "experiment.txt"

import logging
import asyncio
import platform
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np
from bleak import BleakClient
from bleak import _logger as logger

import time

sensor_data = []
delta = 0


acc_range = 4 #g
gyro_range = 500 # +-250 dps

frame_t = []
t = []
g_x = []
g_y = []
g_z = []
a_x = []
a_y = []
a_z = []

line = []
idx = 0
duration = 10	#seconds
frequency = 100 #Hz

WRITE_CHAR_UUID = "f000beef-0451-4000-b000-000000000000" 
CHARACTERISTIC_UUID = "f0002bae-0451-4000-b000-000000000000"  # <--- Change to the characteristic you want to enable notifications from.

def acc_convert(value):
	return	(value*1.0) / (32768/acc_range)

def gyro_convert(value):
	return (value*1.0) / (65332 / gyro_range)

def to_ms(t):
	return t * 1000 / 65536

def hextosigdec(value):
    return -(value & 0x8000) | (value & 0x7fff)

def notification_handler(sender, data):

    #global delta
    #delta = time.time() - delta
    """Simple notification handler which prints the data received."""
    
    mv = memoryview(data).cast('H') 
    gyro = tuple([hextosigdec(d) for d in mv[0:3]])
    acc = tuple([hextosigdec(d) for d in mv[3:6]])       
    delta = to_ms(mv[6])
    sensor_data.append([gyro, acc, delta])
    #print("{0}: {1}".format(sender, data))



async def run(address, debug=False):
    if debug:
        import sys

        l = logging.getLogger("asyncio")
        l.setLevel(logging.DEBUG)
        h = logging.StreamHandler(sys.stdout)
        h.setLevel(logging.DEBUG)
        l.addHandler(h)
        logger.addHandler(h)

    
    
    async with BleakClient(address) as client:
        x = await client.is_connected()
        print("Connected")
        
        await client.start_notify(CHARACTERISTIC_UUID, notification_handler)        
        await asyncio.sleep(5)
        
        print("Notifications enabled")
        
        await asyncio.sleep(duration)
        await client.stop_notify(CHARACTERISTIC_UUID)
    		

if __name__ == "__main__":
    import os

    os.environ["PYTHONASYNCIODEBUG"] = str(1)
    address = (
        "54:6c:0e:80:8a:82"  # <--- Change to your device's address here if you are using Windows or Linux
        if platform.system() != "Darwin"
        else "B9EA5233-37EF-4DD6-87A8-2A875E821C46"  # <--- Change to your device's address here if you are using macOS
    )
    loop = asyncio.get_event_loop()
    # loop.set_debug(True)
    loop.run_until_complete(run(address, True))
    
    print("Finished")
    
    file1 = open("experiment.txt", "a")
    
    previous = 0
    last_a = []
    d_a = []
    d_g = []
    
    
    for i, d in enumerate(sensor_data):
    
        g = d[0]
        a = d[1]
        dt = d[2]

        t.append(previous)

        g_x.append(g[0])
        g_y.append(g[1])
        g_z.append(g[2])

        a_x.append(a[0])
        a_y.append(a[1])
        a_z.append(a[2])


        file1.write(str(g[0]) + " " + str(g[1]) + " " + str(g[2]) + " " + str(a[0]) + " " + str(a[1]) + " " + str(a[2]) + " " + str(dt + previous))
        previous = previous + dt

        file1.write("\n")
    	
    	
    file1.write("\n")
    file1.close()
    


