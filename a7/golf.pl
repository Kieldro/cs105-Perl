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
for ($c = 0; $c < keys @{$grid[0]}; ++$c){
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
	$r = 0;
	# say '$_: '.$_;
	# $_ = '*';
	$grid[$r][$c] = '*';
	$explored{\$_} = 1;		# current node set to explored
	# say @{$grid[0]};
	
	# explore right
	++$c;
	if(inBounds($r, $c) and $grid[$r][$c] == 'x'){
		pathFound($r, $c);		# check for win
		$grid[$r][$c];
	}
	
	
}

# Checks win condition.
# Prints 1 and exits if true.
sub pathFound{
	my($r, $c) = @_;
	if ($r == $nrows - 1 and $grid[$r][$c] == /x/){		# path found
		print 'PATH FOUND! ' if $DEBUG;
		say 1 and exit;
	}
}

# Returns true if $r and $c are in bounds, false otherwise
sub inBounds{
	my($r, $c) = @_;
	return $r >= 0 and $c >= 0 and $r < $nrows and $c < $ncols;
}

sub printGrid{
	say 'printing grid:' if $DEBUG;
	foreach(@grid){
		say @$_;
	}
	
}