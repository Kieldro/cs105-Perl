#!/usr/bin/perl
# Ian Buitrago
# 2-18-2013
# log: 1330-1500 2 hrs
# Assignment 5: Reverse Polish Notation

# use warnings;
use v5.10;
# no warnings 'once';

$DEBUG = 1;

# Input
while(<>){
	chomp;
	$block = qr/[A-Za-z0-9\-_]+/;
	$emailRE = qr/$block(\.$block)*\@$block(\.$block)*/;
	
	if (m/($emailRE)/){
		push @list, $1;
		++$hash{$1};
	}
}

printf "%i distinct address found.\n", scalar keys %hash;

# Sort
@list = sort {$hash{$b} <=> $hash{$a} || $a cmp $b} @list;		# cmp is default sort

# Output
map {say qq/$_ ($hash{$_})/} @list;