#!/usr/bin/perl

use v5.10;

$octet = qr/\d{3}/;
while(<>){
	s/0{0,2}(\d+)/$1/g;
	print;
}