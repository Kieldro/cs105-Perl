ASSIGNMENT = final
# FILE = /u/cdunham/cs105/*.list.gz
# FILE = actors.list.gz
FILE = tris.sublist.gz
oFILE = ${$(FILE):0:-3}

all: ; make $(ASSIGNMENT)

a2: ; cd a2; clear; ./rainfall.pl < 2001rain.txt

a3: ; cd a3; clear; ./wordfreq.pl pandp.txt #| less

a4: ; cd a4; clear; ./calc.pl < 2001Tmax.txt

a5: ; cd a5; clear; ./email.pl example1.txt

a6:
	cd a6 ; clear; ./multiply.pl input.in
	cd a6 ; ./add.pl input.in
	cd a6 ; ./subtract.pl input.in

a7: ; cd a7; clear; ./miditest.pl

final: final/$(FILE)
	cd final; clear; ./final.pl $(FILE) < input.in
	
# generate gzipped file if one doesn't exists
final/$(FILE): final/$(oFILE)
	cd final; gzip -c $(oFILE) > $(FILE)

curtis: ; clear; /u/cdunham/cs105/final /u/cdunham/cs105/*.list.gz

test: ; clear; ./test.pl IntegerArray.txt

turnin:
	cd $(ASSIGNMENT); turnin --submit cdunham $(ASSIGNMENT) final.pl \
		Actor.pm Movie.pm
	turnin --list cdunham $(ASSIGNMENT)

.PHONY: a1 a2 a3 a4 a5 a6 a7 final curtis test turnin