# Build tools
NVCC = /usr/local/cuda/bin/nvcc
CXX = g++

# here are all the objects
GPUOBJS = reduce.o 
OBJS = timing.o

# make and compile
reduce:$(OBJS) $(GPUOBJS)
	$(NVCC) -no-pie -arch=sm_52 -o reduce $(OBJS) $(GPUOBJS)

reduce.o: reduce.cu
	$(NVCC) -arch=sm_52 -no-pie -c reduce.cu 

timing.o: timing.c
	$(CXX) -c timing.c

clean:
	rm -f *.o
	rm -f reduce
