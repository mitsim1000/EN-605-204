All: recMult fib
		CC=gcc

ListPrimes: recMult.o
			$(CC) $@.o -g -o $@

PrimeCheck: fib.o
			$(CC) $@.o -g -o $@

.s.o:
			$(CC) $(@:.o=.s) -g -c -o $@
