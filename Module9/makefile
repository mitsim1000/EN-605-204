All: Grader LogicalCharCheck largestInt notLogicalCharCheck
CC=gcc

Grader: Grader.o
	$(CC) $@.o -g -o $@

LogicalCharCheck: LogicalCharCheck.o
	$(CC) $@.o -g -o $@
					
largestInt: largestInt.o
	$(CC) $@.o -g -o $@
					
notLogicalCharCheck: notLogicalCharCheck.o
	$(CC) $@.o -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
