#!/usr/bin/perl

# run with: ./detectCycle.pl foo.in
use v5.10;


while(<>){
	# /(\d+)/;
	# say
	@sequence = split;
	
	(a,b) = findCycle($i++);
	
	# print  @sequence;
	
}

# 2 0 6 3 1 6 3 1 6 3 1

sub findCycle{
	my $start = @_[0];
	say $sequence[$i];
	if($sequence[$start] == $sequence[$start + ++$j]){
		
		
	}
	return ($start, $j);
}