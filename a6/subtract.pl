#!/usr/bin/perl

use v5.10;
use matrix;

$DEBUG = $matrix::DEBUG;

# Input
while(!eof){
	push @a, matrix->new();
	$a[-1]->print() if $DEBUG;
}

for(@a){
	$A = shift @a;
	$B = shift @a;
	
	say 'Difference:';
	($A - $B)->print();
}