ALL: TestCToF TestInchesToFt TestKPH
LIB=libConversions.s
CC=gcc
TestCToF: TestCToF.o $(LIB)
	       $(CC) $@.o $(LIB) -g -o $@

TestInchesToFt: TestInchesToFt.o $(LIB)
	       $(CC) $@.o $(LIB) -g -o $@

TestKPH: TestKPH.o $(LIB)
	       $(CC) $@.o $(LIB) -g -o $@

.s.o:
	       $(CC) $(@:.o=.s) -g -c -o $@
