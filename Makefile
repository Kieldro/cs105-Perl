ASSIGNMENT = a6

all: ; clear; make $(ASSIGNMENT)

a2: ; cd a2; ./rainfall.pl < 2001rain.txt

a3: ; cd a3; ./wordfreq.pl pandp.txt #| less

a4: ; cd a4; ./calc.pl #< a4/2001Tmax.txt 

a5: ; cd a5; ./email.pl a5/example1.txt 

a6: ; cd a6 ; ./multiply.pl input.in
 
a7: ; echo BOOM; ./a7.pl

test: ; ./test.pl

turnin:
	cd a6; turnin --submit cdunham $(ASSIGNMENT) matrix.pm multiply.pl subtract.pl add.pl
	turnin --list cdunham $(ASSIGNMENT)

.PHONY: a1 a2 a3 a4 a5 a6 a7 a8 test turnin