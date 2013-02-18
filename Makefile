ASSIGNMENT = a6

all:
	clear
	make $(ASSIGNMENT)

a2: rainfall.pl
	rainfall.pl < 2001rain.txt

a3: wordfreq.pl
	./wordfreq.pl pandp.txt #| less

a4: 
	./calc.pl #< 2001Tmax.txt 

a5:
	./email.pl  example1.txt 

a6:
	./multiply.pl 

test:
	./test.pl

turnin:
	turnin --submit cdunham $(ASSIGNMENT) email.pl
	turnin --list cdunham $(ASSIGNMENT)