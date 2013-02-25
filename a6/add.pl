#!/usr/bin/perl

use v5.10;
use matrix;

# Input
for($i = 0; !eof; ++$i){
	$A[$i] = matrix->new();
	$A[$i]->print() if $DEBUG;
}

for(@A){
	$A = shift @A;
	$B = shift @A;
	
	say 'Sum:';
	($A+$B)->print();
}
