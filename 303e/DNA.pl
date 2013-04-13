#!/usr/bin/perl
# File: DNA.pl
# Description: finds matching substrings
#
# Name: Ian Buitrago

use v5.10;

# main
@tuple = getStrands();
$len = longestCommonSubseq(@tuple);
printCommonSubseqs(@tuple, $len);

# function definitions

# prompts the user for two strands
# returns a tuple containing the two DNA strands.
sub getStrands{
	say "Enter first strand: ";
	$s1 = <STDIN>;
	
	say "Enter second strand: ";
	$s2 = <STDIN>;
	
	return ($s1, $s2);
}

# accepts two DNA sequences.
# returns the length of the longest common subsequence of the two strands.
sub longestCommonSubseq{
	$s1 = shift;
	$s2 = shift;
	
	return -1;
}

# accepts three parameters: 2 DNA strands and a length, in that order.
# Finds all common subsequences of the specified length and prints them to the screen.
sub printCommonSubseqs{
	$s1 = shift;
	$s2 = shift;
	$len = shift;
	
	say $sub;
}



# SAMPLE OUTPUT
# Please enter a strand of DNA: ATGGCATAAGCTT
# Please enter another strand of DNA: TGCAGCTGCATCAGGAT
# Common subsequence(s):
# AGCT
# GCAT

# Please enter a strand of DNA: TAGGCAT
# Please enter another strand of DNA: GAA
# No common subsequence was found for TAGGCAT and GAA

# Please enter a strand of DNA: AAAAAaaaaaAAAAAAAAaaaaa
# Please enter another strand of DNA: aaaaaaaaaccaaaaaaaa

# Common subsequence(s):
# AAAAAAAAA

# Please enter a strand of DNA: AAGGTTCCAAGGTTCC
# Please enter another strand of DNA: CCTTGGAACCTTGGAA
# Common subsequence(s):
# AA
# GG
# TT
# CC
# AA
# GG
# TT
# CC

# Please enter a strand of DNA: AGTCAGTCAGTCAGTC
# Please enter another strand of DNA: TCGATCGA
# Common subsequence(s):
# TC
# TC

# Please enter a strand of DNA: AGTCAGTC

# Please enter another strand of DNA: CTGACTGACTGACTGA
# No common subsequence was found for AGTCAGTC and CTGACTGACTGACTGA

# Please enter a strand of DNA: 
# Please enter another strand of DNA: 
# Ending program
