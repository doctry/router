import sys
import random as rd
import numpy as np
#open file
In = sys.argv[1]
f_in = open(In,"w")

#produce random network
x = int(sys.argv[2])
y = int(sys.argv[3])
#z = sys.argv[4]

die = np.zeros((x,y))

output = []

for i in range(x*y//10):
    _x = rd.randrange(0,x)
    _y = rd.randrange(0,y)
    if die[_x][_y] == 0:
        die[_x][_y] = 1
        if(_x>0):
            die[_x-1][_y] = 1
        if(_x<x-1):
            die[_x+1][_y] = 1
        if(_y>0):
            die[_x][_y-1] = 1
            if(_x>0):
                die[_x-1][_y-1] = 1
            if(_x<x-1):
                die[_x+1][_y-1] = 1
        if(_y<y-1):
            die[_x][_y+1] = 1
            if(_x>0):
                die[_x-1][_y+1] = 1
            if(_x<x-1):
                die[_x+1][_y+1] = 1
        output.append(_x)
        output.append(_y)
        output.append(0)

#write file
f_in.write(str(x)+'\n')
f_in.write(str(y)+'\n')
f_in.write(str(1)+'\n')
for i in range(len(output)//6):
    f_in.write(str(output[6*i])+' '+str(output[6*i+1])+' '+str(output[6*i+2])+' '+str(output[6*i+3])+' '+str(output[6*i+4])+' '+str(output[6*i+5])+'\n')
f_in.close()
