# router
Author: doctry  
Rout the pins and output a plot of the routing.

## Compile
    make  
  
to compile

## Usage
    python <filename1> <x> <y>  
  
It will randomly generate a file describing a die of size x*y with 2-pin network pins, <filename1>.
  
    ./exe.sh <filename1> <filename2> 
  
It will output a file <filename2> according to <filename1> and plot the result and export it as 'plot.png'.  

## Requirements
`gnuplot`,`g++>=17`,`python>=3.0`  
