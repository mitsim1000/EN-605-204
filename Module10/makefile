All: ListPrimes PrimeCheck
	CC=gcc

ListPrimes: ListPrimes.o
		$(CC) $@.o -g -o $@

PrimeCheck: PrimeCheck.o
		$(CC) $@.o -g -o $@

.s.o:
		$(CC) $(@:.o=.s) -g -c -o $@
