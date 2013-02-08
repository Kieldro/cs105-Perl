#!/usr/bin/perl
# File: Fence.pl
# Description: coin change calculator.
# Assignment Number: 3
#
# Name: Keo
# EID: KEOTRON
# Course Name: CS 303E
#
# Date created: 2-8-2013
# Date last modified: 2-8-2013
use v5.10;

# Constants
$DEBUG = 1;
$WOODPRICE = 16.27;
$IRONPRICE = 37.89;
while(<>){
	print "Please enter the length of the fence: ";
	$length = $_;
	print STDOUT $length if $DEBUG;

	say "The costs for the fences are:";
	printf "\t1. \$%.2f for the wooden fence\n", $WOODPRICE * $length;
	printf "\t2. \$%.2f for the iron fence\n", $IRONPRICE * $length;
	print "Would you like fence 1 or fence 2? ";
	$choice = <>;
	$price = ($choice == 1) ? $WOODPRICE : $IRONPRICE;
	print STDOUT $choice if $DEBUG;

	say "The fence company only accepts cash.";
	print "How much money do you plan to give the fence builder? ";
	$money = <>;
	print STDOUT $money if $DEBUG;

	# Calculation
	$balance = $length * $price;
	$change = $tempChange = $money - $balance;

	$dollars = int($tempChange);
	$quarters = int(($tempChange -= $dollars) / .25);
	$dimes = int(($tempChange -= $quarters * .25) / .10);
	$nickels = int(($tempChange -= $dimes * .10) / .05);
	$pennies = int(($tempChange -= $nickels * .05) / .01);
	#say STDOUT "temp: $tempChange" if $DEBUG;

	printf "Your change, \$%.2f, consists of:\n", $change;
	say "\t$dollars dollars";
	say "\t$quarters quarters";
	say "\t$dimes dimes";
	say "\t$nickels nickels";
	say "\t$pennies pennies";
}

=begin
Please enter the length of the fence: 60
The costs for the fences are:
	1. $976.20 for the wooden fence
	2. $2273.40 for the iron fence
Would you like fence 1 or fence 2? 1
The fence company only accepts cash.
How much money do you plan to give the fence builder? 991.54
Your change, $15.34, consists of:
	15 dollars
	1 quarters
	0 dimes
	1 nickels
	4 pennies
	
	
	
	
	 Test your program using at least 5 different test cases. Some recommended test cases:

    60 feet, wooden, 991.54
    45 feet, iron, 1705.32
    103 feet, wooden, 1677.64

=cut