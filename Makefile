ASSIGNMENT = a7

all: ; clear; make $(ASSIGNMENT)

a2: ; cd a2; ./rainfall.pl < 2001rain.txt

a3: ; cd a3; ./wordfreq.pl pandp.txt #| less

a4: ; cd a4; ./calc.pl #< a4/2001Tmax.txt 

a5: ; cd a5; ./email.pl a5/example1.txt 

a6: 
	cd a6 ; ./multiply.pl input.in
	cd a6 ; ./add.pl input.in
	cd a6 ; ./subtract.pl input.in
 
a7: ; cd a7; ./miditest.pl

final: ; cd final; ./final.pl

test: ; ./test.pl

turnin:
	cd $(ASSIGNMENT); turnin --submit cdunham $(ASSIGNMENT) golf.pl
	turnin --list cdunham $(ASSIGNMENT)

.PHONY: a1 a2 a3 a4 a5 a6 a7 final test turnin