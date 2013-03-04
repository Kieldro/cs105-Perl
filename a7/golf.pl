#!/usr/bin/perl
# Ian Buitrago
# 1-6-2013
# log:
# 2/28		1830-1930		1 hrs
# 3/1		1130-1230		1 hrs
# 3/2		1800-1900		1 hrs
# Total:					3 hrs
# Assignment 7: Quantum Plinko

use v5.10;

$DEBUG = !1;

# Input
while(<>){
	chomp;
	push @grid, [split //];		# split on empty string
}
$nrows = scalar @grid;
$ncols = scalar @{$grid[0]};
if($DEBUG){
	say STDERR 'Input Complete.';
	say STDERR 'nrows: '.$nrows;
	say STDERR 'ncols: '.$ncols;
	# printGrid();
	say STDERR "\nCalculating...";
}

# Calculations
for ($col = 0, $row = 0; $col < keys @{$grid[0]}; ++$col){
	next unless $grid[0][$col] =~ /x/;
	# execute for each x on the first row
	search();
}

if($DEBUG){
	printGrid();
	print 'no path found ';
}
say 0;		# no path found


#===========================
# Functions
#===========================

# BFS search
sub search{
	push @frontier, [$row, $col];
	
	while (scalar @frontier){
		printGrid() if $DEBUG;
		# say STDERR scalar @frontier;
		my ($r, $c) = @{shift @frontier};
		$grid[$r][$c] = '*';		# current node set to explored
		
		check($r + 1, $c);		# check bottom
		check($r, $c + 1);		# check right
		check($r, $c - 1);		# check left
		check($r - 1, $c);		# check top
	}
}

# adds neighbor to frontier
sub check{
	my ($r, $c) = @_;
	if(inBounds($r, $c) and $grid[$r][$c] =~ /x/){
		pathFound($r, $c);		# check for win
		push @frontier, [$r, $c];
		$grid[$r][$c] = 'F';
	}
}

# Checks win condition.
# Prints 1 and exits if true.
sub pathFound{
	my($r, $c) = @_;
	if ($r == $nrows - 1 and $grid[$r][$c] =~ /x/){		# path found
		if($DEBUG){
			$grid[$r][$c] = '!';
			printGrid();
			print 'PATH FOUND! ';
		}
		say 1 and exit;
	}
}

# Returns true if $r and $c are in bounds, false otherwise
sub inBounds{
	my($r, $c) = @_;
	return ($r >= 0 and $c >= 0 and $r < $nrows and $c < $ncols);		# must have parens
}

sub printGrid{
	say STDERR 'printing grid:' if $DEBUG;
	foreach(@grid){
		say STDERR @$_;
	}
}