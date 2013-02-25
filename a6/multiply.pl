#!/usr/bin/perl
# Ian Buitrago
# 2-25-2013
# log:
# 2/18		1700-1900		3 hrs
# 2/25		0600-0900		3 hrs
# Assignment 6: Object-Oriented Matrices

use v5.10;
use matrix;

$DEBUG = 1;


# Input
# do{
	$A = new();
	$A->print();
# }while(<>);


$B = new();
# say scalar @$B if $DEBUG;
$B->print();

# say $$A[0][1];

$C = bless [], matrix;		# TODO
say scalar @$C;
for ($r = 0; $r < scalar @$A; ++$r){
	for ($c = 0; $c < scalar @B[$r]; ++$c){
		$C[$r][$c] += $A[$r][$c] * $B[$r][$c];
	}
}

$C->print();