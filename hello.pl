#!/usr/bin/perl
# chmod 775 hello.pl
# questions
# multiline
# ./ in path?
@a = qw(foo bar baz);		# quote words, quote the fucking words, no commas or quotes!
@a = ('foo', 'bar', 'baz');		# single quotes are raw

while (defined($a = <STDIN>)){
	print $a;
}

while (<STDIN>){
	print $_;
}

# idiom = <> = <ARGV> reads stdin or args
# 1-23-13
# wc -l # word count number of lines

while (<>){		# "	while diamond"
	# $_ constains end char
	chomp;		# removes only line terminator, assumes $_
	++$b;
	if($_ eq 'T'){
		$yay++;
	}
	# string wise comparisons le, eq, ne, gt, etc...
}

use feature qw(switch);

given($grade){
	when('A'){ print "Excellent\n"; }
	when('B'){ print "Good\n"; }
	when('C'){ print "Be al that\n"; }
	default{ print "Always\n"; }
	
}
# hashes
%a = ('a', 1, 'b', 2, 'c', 3);
%a = ('a' => 1, 'b' => 2, 'c' => 3);		# syntactic sugar/sugar


die "usage: $0 sdldl\n" if true;

foreach $foo(@foo){		# iterating over plurals
	$foo .= $foo
}

foreach $foo (keys %foo){		# iterates over keys
	$foo{} .= $foo
}

foreach $bar (values %foo){		# iterates over keys
	print "$bar\n"
}

# C style for loops included
# foreach and for are synonyms
foreach (@baz){
	# iterates into $_
}

# file IO
open($config, 'config');
while(<$config>){
	chomp;
}
close$config;

# 3 arg open is more secure
open($config, '<', 'config');

split		# into an array of tokens
# $_ is implicit not magical or special. Documented in perlvar

# $0 is auto set to name of program
open or die "Could not open $!\n"		# $! is the error
push @a, 5;		# push 5 onto the end of @a
pop @a;		# pop the last element
unshift @a, 1;		# idk
shift @a;

@a[1, 3];		# slice array
($a, $b) = @a{'k1', 'k2'};		# slice hash
# or assign to slices
@a[1, -3] = qw(M W);

# List Flattening
@a = (@b, @c, $a, keys %d);
# splice removes scalars from arrays?
sort
@ARGV


printf
my
our