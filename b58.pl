#!/usr/bin/perl

# Ian Buitrago
# 2-19-2014

use v5.10;		# for say

$code_string = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";
# $code_string = "0123456789ABCDEF";
$base = 58;
$x = $ARGV[0];
$result = "";

# print "Enter number in decimal: ";
# $x = <>;
say "Converting x ...";
# say "base: " . $base;
if($x == 0){
	$result = substr($code_string, 0, 1);
}else {while($x > 0){
	# say "x: " . $x;
	$remainder = $x % $base;
	# say "remainder: " . $remainder;
	$result = substr($code_string, $remainder, 1) . $result;
	$x = int($x / $base);
	# say "result: " . $result;
}}

say "number in human readable base " . $base . ": " . $result;
