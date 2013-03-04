#!/usr/bin/perl
# Ian Buitrago
# Tri Nguyen
# 3-26-2013
# log:
# 3/4		1800-1900		1 hrs
# Total:					3 hrs
# Final: 

use v5.10;

$DEBUG = !1;

# Input
while(<>){
	chomp;
	push @grid, [split //];		# split on empty string
}