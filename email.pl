#!/usr/bin/perl
# Ian Buitrago
# 2-18-2013
# log: 1330-1500 2.5 hrs
# Assignment 5: Legitimate Business Purposes
# without g flag, infinite loop?

# use warnings; no warnings 'once';
use v5.10;

$DEBUG = 0;

# Input
while(<>){
	$block = qr/[\w-]+/;
	$emailRE = qr/$block(\.$block)*\@$block(\.$block)*/;
	
	++$count{$&} while (m/$emailRE/g);
}

printf "%i distinct addresses found.\n", scalar keys %count;

# Sort by count then lexigraphcally
@emails = sort {$count{$b} <=> $count{$a} || $a cmp $b} keys %count;	# cmp is default sort

# Output
map {say qq/$_ ($count{$_})/} @emails;