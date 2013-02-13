#!/usr/bin/perl
# Ian Buitrago
# 2-18-2013
# log: 1330-1500 2.5 hrs
# Assignment 5: Legitimate Business Purposes

# use warnings; no warnings 'once';
use v5.10;

$DEBUG = 0;

# Input
while(<>){
	chomp;
	$block = qr/[\w-]+/;
	$emailRE = qr/$block(\.$block)*\@$block(\.$block)*/;
	
	if (m/$emailRE/){
		push @emails, $& unless exists $count{$&};
		++$count{$&};
	}
}
# say $& if $DEBUG;

printf "%i distinct address found.\n", scalar keys %count;

# Sort
@emails = sort {$count{$b} <=> $count{$a} || $a cmp $b} @emails;	# cmp is default sort
# Output
map {say qq/$_ ($count{$_})/} @emails;