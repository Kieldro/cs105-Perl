a1: rainfall.pl
	rainfall.pl < 2001rain.txt

a2: wordfreq.pl
	./wordfreq.pl pandp.txt #| less

turnin:
	turnin --submit cdunham a3 wordfreq.pl
	turnin --list cdunham a3