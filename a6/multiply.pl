#!/usr/bin/perl
# Ian Buitrago
# 2-25-2013
# log:
# 2/18		1700-1900		3 hrs
# 2/25		0600-0900		3 hrs
# 2/25		1100-1300		4 hrs
# Assignment 6: Object-Oriented Matrices

use v5.10;
use matrix;
$DEBUG = $matrix::DEBUG;


# Input
while(!eof){
	# say q/eof: /. eof;
	push @a, matrix->new();
	$a[-1]->print() if $DEBUG;
}

# $C = new();		# TODO
say q/len a: /.scalar @a;

# Calculations
for(@a){
	$A = shift @a;
	$B = shift @a;
	unshift @a, $A * $B;
	# say scalar @a;
}

# Output
say 'Product:';
($a[0])->print();