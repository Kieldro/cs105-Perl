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
		unless (exists $count{$_}){
			$count{$_} = 1;
		}else{
			++$count{$_};
		}
	}
	
}

say scalar keys %count;
say $a[1];
#map {say} @a;

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
	#$dict{$_} = undef;
	delete $count{lc $_};
}
close INFILE;

printf "Number of distinct words not in dictionary: %i\n", scalar keys %count;

@keys = sort { $count{$b} <=> $count{$a} } keys %count;		# sort by value
foreach (@keys){
	last if(++$j > 10);
	print "$_: $count{$_}\n";
}