ASSIGNMENT = a4

all: $(ASSIGNMENT)

a2: rainfall.pl
	rainfall.pl < 2001rain.txt

a3: wordfreq.pl
	./wordfreq.pl pandp.txt #| less

a4: 
	./calc.pl #< 2001Tmax.txt 

test:
	./test.pl

turnin:
	turnin --submit cdunham $(ASSIGNMENT) calc.pl
	turnin --list cdunham $(ASSIGNMENT)