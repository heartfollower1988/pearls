CXX=g++ -g -std=c++11 -lpthread -D_VERSION_=1.0.0 -Wl,--build-id 
SOURCE=stl_func.cpp
TARGET=test
all: $(SOURCE)
	$(CXX) $(SOURCE) -o $(TARGET)
run: all
	./test
clean:
	rm -f *.o
	rm -f test
		
