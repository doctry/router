# CC and CFLAGS are varilables
CC = g++
CFLAGS = -c
# -c option ask g++ to compile the source files, but do not link.
# -g option is for debugging version
# -O2 option is for optimized version
DBGFLAGS = -g
OPTFLAGS = -O3

all	: rout plot
	@echo -n ""

# optimized version
rout				: src/die.o src/main.o src/cost.o
			$(CC) $(OPTFLAGS) src/die.o src/main.o src/cost.o -o rout
src/main.o 		   	: src/main.cpp src/router.h
			$(CC) $(CFLAGS) $(OPTFLAGS) $< -o $@
src/die.o			: src/die.cpp src/die.h src/grid.h
			$(CC) $(CFLAGS) $(OPTFLAGS) $< -o $@
src/cost.o 			: src/cost_function.cpp src/die.h
			$(CC) $(CFLAGS) $(OPTFLAGS) $< -o $@
plot				: src/file.cpp
			$(CC) $(OPTFLAGS) src/file.cpp -o plot

# DEBUG Version
dbg : rout_dbg
	@echo -n ""

rout_dbg			: src/die_dbg.o src/main_dbg.o src/cost_dbg.o
			$(CC) $(DBGFLAGS) die_dbg.o main_dbg.o cost_dbg.o -o rout_dbg
src/main_dbg.o 		: src/main.cpp src/router.h
			$(CC) $(CFLAGS) $(DBGFLAGS) $< -o $@
src/die_dbg.o		: src/die.cpp src/die.h src/grid.h
			$(CC) $(CFLAGS) $(DBGFLAGS) $< -o $@
src/cost_dbg.o 		: src/cost_function.cpp src/die.h
			$(CC) $(CFLAGS) $(DBGFLAGS) $< -o $@

# create data.txt and gnuplot



# clean all the .o and executable files
clean:
		rm -rf src/*.o rout plot rout_dbg *.gp *.png
