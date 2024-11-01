server : server.o
	ld server.o -o server

server.o : server.asm
	fasm server.asm

constants :
	gcc -E -P constants.c > constants.txt

run : server
	./server

trace : server
	strace ./server

clean :
	-rm server.o
	-rm server
	-rm constants.txt
