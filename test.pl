#!/usr/bin/perl

use v5.10;

package identifier;
sub foo{
	say 'hi';
}
package main;
@a;
$a = \@a;
bless $a, identifier;

$a->foo;