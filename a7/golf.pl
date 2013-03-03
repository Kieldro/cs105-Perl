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
	# say @{$grid[-1]};
}
$nrows = scalar @grid;
$ncols = scalar @{$grid[0]};
if($DEBUG){
	say 'Input Complete.';
	say 'nrows: '.$nrows;
	say 'ncols: '.$ncols;
	say 'grid(0,0): '.$grid[0][0];
	printGrid();
	say "\nCalculating...";
}

# Calculations
for ($col = 0, $row = 0; $col < keys @{$grid[0]}; ++$col){
	$_ = $grid[0][$c];
	next unless /x/;
	
	# execute for each x on the first row
	search();
}

if($DEBUG){
	# say 'keys: '.(keys %explored);
	say 'nkeys: '.keys %explored;
}

if($DEBUG){
	printGrid();
	print 'no path found ';
}
say 0;		# no path found


# Functions
#===========================


sub search{
	push @frontier, [$row, $col];
	
	while (scalar @frontier){
		# say scalar @frontier;
		my ($r, $c) = @{shift @frontier};
		# say $r.$c;
		$grid[$r][$c] = '*';		# current node set to explored
		# say @{$grid[0]};
		
		check($r, $c + 1);		# check right
		check($r + 1, $c);		# check bottom
		check($r - 1, $c);		# check top
		check($r, $c - 1);		# check left
		printGrid() if $DEBUG;
	}
}

sub check{
	my ($r, $c) = @_;
	if(inBounds($r, $c) and $grid[$r][$c] eq 'x'){
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
		printGrid() if $DEBUG;
		print 'PATH FOUND! ' if $DEBUG;
		say 1 and exit;
	}
}

# Returns true if $r and $c are in bounds, false otherwise
sub inBounds{
	my($r, $c) = @_;
	return ($r >= 0 and $c >= 0 and $r < $nrows and $c < $ncols);
}

sub printGrid{
	say 'printing grid:' if $DEBUG;
	foreach(@grid){
		say @$_;
	}
	
}