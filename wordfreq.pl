#!/usr/bin/perl
# Ian Buitrago
# 2-4-2013

# Assignment 3: Word Frequencies
# golfing?

use v5.10;

while(<>){
	@words_in_line = /[a-z](?:[a-z']*[a-z])?/ig;
	
	foreach (@words_in_line){
		$_ = lc $_;		# lower case
		if (exists $count{$_}){
			$count{$_} = 1;
		}else{
			++$count{$_};
		}
	}
	
}
@a = %count;
say scalar keys %count;
say $a[1];
#map {say} @a;

open($inFile, '<', '/usr/share/dict/words')
	or die "Could not open $!\n";



close $inFile;

printf "Number of distinct words: %i\n", scalar keys %count;


print "Number of distinct words not in dictionary: $a\n";