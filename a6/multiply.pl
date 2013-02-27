#!/usr/bin/perl

use v5.10;
use matrix;
use List::Util q/reduce/;

$DEBUG = $matrix::DEBUG;

# Input
while(!eof){
	push @a, matrix->new();
	$a[-1]->print() if $DEBUG;
}

# Calculations
$C = reduce {$a * $b} @a;

# Output
say 'Product:';
$C->print();