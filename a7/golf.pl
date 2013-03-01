#!/usr/bin/perl
# Ian Buitrago
# 1-6-2013
# log:
# 2/28		1830-1930		1 hrs
# 3/1		1130-1230		1 hrs
# Assignment 7: Quantum Plinko

use v5.10;

$DEBUG = 1;

# Input
while(<>){
	chomp;
	push @grid, [split //];
	say @{$grid[-1]};
}

if($DEBUG){
	say 'nrows: '.scalar @grid;
	say 'ncols: '.scalar @{$grid[-1]};
}

foreach (@{$grid[0]}){
	next unless /x/;
	
	# execute for each x on the first row
	
	if (1){		# path found
		say 1;
		exit;
	}
}

print 'no path found ' if $DEBUG;
say 0;		# no path found