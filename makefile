CXX=g++ -g -std=c++11 -lpthread -D_VERSION_=1.0.0 -Wl,--build-id 
SOURCE=bitset.cpp
TARGET=test
all: $(SOURCE)
	$(CXX) $(SOURCE) -o $(TARGET)
run: all
	./test
massif: all
	valgrind --tool=massif --time-unit=ms --threshold=0.1 ./test
clean:
	rm -f *.o
	rm -f test
		
