#!/usr/bin/perl
# Ian Buitrago
# 2-25-2013
# log:
# 2/18		1700-1900		3 hrs
# Assignment 6: Object-Oriented Matrices

use v5.10;
use matrix;

$DEBUG = 1;

string() if $DEBUG;

while(<>){
	last if scalar split == 0;
	push @A, [split];
	
}

while(<>){
	next if scalar split == 0;
	push @B, [split];
	say scalar @B;
	say split;
	
	# NEW(@A);
	# NEW(@B);
}

sub NEW{
	
	
	return @A;
}