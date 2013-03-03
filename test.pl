#!/usr/bin/perl

use v5.10;

$user = 'jwilke';
@machines = qw/seafoam/;# lust milky-way/;
$pw = ';lkj1234';

foreach (@machines){
	say 'boom';
	system qq/ssh keo\@$_.cs.utexas.edu/;
	system qq/$pw/;
	# system qq/finger $user/;
	# system "exit";
}