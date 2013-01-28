#!/usr/bin/perl

# assignment 2

while (<>){
	# $_ constains end char
	chomp;		# removes only line terminator, assumes $_
	++$b;
	if($_ eq 'T'){
		$yay++;
	}
	# string wise comparisons le, eq, ne, gt, etc...
}