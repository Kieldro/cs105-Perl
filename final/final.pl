#!/usr/bin/perl
# Ian Buitrago
# Tri Nguyen
# 4-2-2013
# log:
# 3/4		1800-1900		1 hrs
# Total:					1 hrs
# Final Project: The Six Degrees of Kevin Bacon


use v5.10;

$DEBUG = 1;

# Preload data into hashes
while(<>){
	chomp;
	
	# movie
	if(/^\t+/){
		$hash{$key} = movie;
	}else{
		$key = actor;
	}
	
}

# Input from user
while(<>){
	
	print 'Enter actor: ';
	
	
}

# sample output

# doctor-nick.cs.utexas.edu% ./final.pl /u/cdunham/cs105/*.list.gz
# Actor/Actress? malkovich
# Malkovich, Claudia
# Malkovich, Erik
# Malkovich, John
# Malkovich, Kent
# Actor/Actress? john malkovic
# Actor/Actress? john malkovich
# Malkovich, John
# 	Queens Logic (1991)
# Bacon, Kevin
# Actor/Actress? Chaplin, Charles
# Chaplin, Charles
# 	Countess from Hong Kong, A (1967)
# Loren, Sophia
# 	Pr?t-?-Porter (1994)
# Whitaker, Forest
# 	Air I Breathe, The (2007)
# Bacon, Kevin
# Actor/Actress? ^D
# doctor-nick.cs.utexas.edu%
