#!/usr/bin/perl

use v5.10;
use matrix;

# Input
while(!eof){
	push @a, matrix->new();
	$a[-1]->print() if $DEBUG;
}

for(@A){
	$A = shift @A;
	$B = shift @A;
	
	say 'Sum:';
	($A + $B)->print();
}
