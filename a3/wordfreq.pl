#!/usr/bin/perl
# Ian Buitrago
# 2-4-2013
# log: 2-4 3 hrs
# Assignment 3: Word Frequencies

use v5.10;

while(<>){
	@words_in_line = /[a-z](?:[a-z']*[a-z])?/ig;
	
	foreach (@words_in_line){
		++$count{lc $_};
	}
	
}
printf "Number of distinct words: %i\n", scalar keys %count;

@keys = sort { $count{$b} <=> $count{$a} } keys %count;		# sort by value
foreach (@keys){
	last if(++$i > 10);
	print "$_: $count{$_}\n";
}


# remove dictionary words
open(INFILE, '<', '/usr/share/dict/words')
	or die "Could not open $!\n";
while(<INFILE>){
	chomp;
	delete $count{lc $_};
}
close INFILE;

printf "Number of distinct words not in dictionary: %i\n", scalar keys %count;

@keys = sort { $count{$b} <=> $count{$a} } keys %count;		# sort by value
foreach (@keys){
	last if(++$j > 10);
	print "$_: $count{$_}\n";
}