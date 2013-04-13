#!/usr/bin/perl
# File: DNA.pl
# Description: finds matching substrings
#
# Name: Ian Buitrago

use v5.10;

$DEBUG = 1;

# main
while(1){
	@tuple = getStrands();
	# say @tuple if $DEBUG;

	$longestLen = longestCommonSubseq(@tuple);
	say $longestLen if $DEBUG;
	printCommonSubseqs(@tuple, $longestLen);
}

# function definitions

# prompts the user for two strands
# returns a tuple containing the two DNA strands.
sub getStrands{
	my @a;
	for(1..2){
		my $ordinal = $_ == 1 ? 'first' : 'second';
		say "Enter $ordinal strand: ";
		$_ =  <STDIN>;
		chomp;
		say if $DEBUG;
		push @a, $_;
	}
	# say scalar @a if $DEBUG;
	my ($s1, $s2) = @a;
	
	exit if !$s1 or !$s2;		# empty string entered
	
	return ($s1, $s2);
}

# accepts two DNA sequences.
# returns the length of the longest common subsequence of the two strands.
sub longestCommonSubseq{
	say 'longestCommonSubseq...' if $DEBUG;
	my ($s1, $s2) = @_;		# parameters
	# say $s1 if $DEBUG;
	# say $s2 if $DEBUG;
	my $longestLen = 0;
	
	for(my $i = 0; $i < length $s1; ++$i){
		for(my $len = 1; $len > $longestLen and $len + $i < length $s1; ++$len){
			$sub = substr $s1, $i, $len;
			$longestLen = $len if (index $s2, $sub) != -1 and $len > $longestLen;
		}
	}
	
	return $longestLen;
}

# accepts three parameters: 2 DNA strands and a length, in that order.
# Finds all common subsequences of the specified length and prints them to the screen.
sub printCommonSubseqs{
	my ($s1, $s2, $len) = @_;
	my $sub = 'NULL';
	
	say "Common subsequences:";
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
