
FILE = /u/cdunham/cs105/*.list.gz
# FILE = actors.list.gz
# oFILE = tris.sublist
# FILE = $(oFILE).gz

all: ; clear; ./final.pl $(FILE) #< input.in

# generate gzipped file if one doesn't exists
$(FILE): $(oFILE)
	gzip -c $(oFILE) > $(FILE)