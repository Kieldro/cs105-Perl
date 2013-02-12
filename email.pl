#!/usr/bin/perl
# Ian Buitrago
# 2-18-2013
# log: 1330-1500 2 hrs
# Assignment 5: Reverse Polish Notation
# use named groupings?

# use warnings;
use v5.10;
# no warnings 'once';

$DEBUG = 1;

# Input
while(<>){
	chomp;
	$block = qr/[A-Za-z0-9\-_]+/;
	
	$emailRE = qr/$block(\.$block)*\@$block/;
	
	
	push @list, $1 if m/($emailRE)/;
	
	
}
# say "boom: @list" if $DEBUG;

@list = sort {$a le $b} @list;

map {say} @list;