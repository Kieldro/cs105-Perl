#!/usr/bin/perl

# run with: ./detectCycle.pl foo.in
use v5.10;


while(<>){
	# /(\d+)/;
	# say
	@sequence = split;
	
	findCycle(0);
	
	# print  @sequence;
	
}

# 2 0 6 3 1 6 3 1 6 3 1

sub findCycle{
	say shift @_;
	@sequest;
}