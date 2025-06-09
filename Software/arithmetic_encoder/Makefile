coder.o: coder.cpp
	g++ -Wall -g -c coder.cpp -o coder.o

coder: coder.o
	g++ coder.o -o coder

run: coder
	./coder

clean:
	rm *.o coder
