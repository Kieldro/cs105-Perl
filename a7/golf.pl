#!/usr/bin/perl
# Ian Buitrago
# 1-4-2013
# log:
# 2/28		1830-1900		2 hrs
# Assignment 7: Quantum Plinko

use v5.10;

$DEBUG = 1;
for(1..7){
	$pid = fork();
	say $pid if $pid;
}
# if(1){		# path found
# 	say 1;
# }else{		# no path
# 	say 0;
# }
