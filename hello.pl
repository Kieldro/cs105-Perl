#!/usr/bin/perl
# chmod 775 hello.pl
# questions
# multiline
=begin
# ./ in path?
# fg?
# Effective Perl Programming 2n ed*
# reference counting trace garbage collection
# QED?
# sed, awk, sh?
# The three principal virtues of a programmer are Laziness, Impatience, and Hubris. See the Camel Book for why.
=cut

use v5.10;		# for say
#use diagnostics		# pragma?
use warnings;		# enables lexical warnings
use strict qw(refs vars subs);		# stricter form of warnings
# prohibits use of symbolic refs
# warns about not decalaring variables

{
	no warnings 'closure';
	
}

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
@b = sort @a;		# stringwise
@bar = sort { $a cmp $b } @foo;		# numerical sort/ merge sort

@ARGV		# command line args are assigned to this
$first = shift;		# takes first arg of ARGV, unless in subroutine then @_ 
$gone = delete $hash{'foo'}
@gone = delete @hash{qw(foo bar)}
%h = (a => undef);		# undef but exists
$a = qq($a $b);
$a = q($a $b);
$a = ' ' x 40;		# 40 spaces
@a = qw(a b ) x 3;
@a = (@a,  'c') x 3;
length('a' x 40);		# length of string
scalar(@a);		# length of array
while(@a)		# similar to scalar
scalar keys %h;
while(1..10)
reverse 1..5;
@b = grep { !boring($_) } @a;
say $a;		# prints with newline
map {say} grep {!boring($_)};		# execute block for every element in list
%b = map {$_ => ++ $c} @a;

printf "%.3f\n", 3.1415;
$a = sprintf "%.cf\n", 3.1415;		# doesn't print

my		# makes it local, good style

our		# global
sub foo {
	say 1;
	foreach $args(@_){
		$sum += 1;
	}
}
 # first parameter of a list binding is called the "slurpie parameter", slurps it up
 # subroutines are passed by reference, watch out
 # clear array to remove aliasing
 @_ = ();

#!/usr/bin/perl -w turns on all warnings
$ref = \$foo;		# forms reference

# perlrequick perlretut perlreref - quick ref perlre - full reference
regex


/[+-]?[1-9][0-9]*(\.[0-9]*)?/		# regular expression for a number
# . is any character
/foo|bar/		# foo or bar
# *, +, ? are quantifiers
# quatifiers have highest precedence, then juxaposition, last alternation
# anchors: ^ is start of line, $ is end of line/string
# metacharacters - do not match a character
/[123456]/
/[1-6]/		# inclusive
/[^0-9]/		# ^ caret inside a character class exludes
/\d/			# digits builtin perl
/\D/		# non digit
/\s/		# whitespace
/\w/		# word [A-Za-z0-9_]
/[^^-]/		# excludes caret or hyphen
# [] character class, () grouping
# spaces are matched in char class or with x flag eg /   /x
local $/;		# enable slurp mode; perldoc perlvar same as $/ = undef;
# dynamic scoping?
# matching
m/g/
# substitution
s/g/G/
if($_ =~ /^s* \w+ /){		# !~ opposite of =~
	
	
}

while(<>){
	chomp;
	die 'invalid input' unless /^\d+\s+\w+/;		# applied to $_
	# or if (!/^\d+\s+\w+/)
	
}
m/foo/ means match
\b is a boundary where oneside is \w and other is \W
\B is the opposite
//i flag: case insensitive
$1 holds first term, $2 etc $rest?
while(<>){
	s{foo|ba[rz] \s+ (\d+)}
	{ uc($1) . ' ' . (1+$2)}eix		# evalutative subsitution, code	
}

qr//		# quotes regexes to create a regex object
my $indent = qr/[A-Za-z]/;
qq//		# double quotes
# capture buffers
if($x =~ /(?<first> \w+) \s+
	(?<second> \w+) /x)		# $first in addition to $1

# arbitrary quantification
=begin
{0,} == *
{0,1} == ?
{n} exactly n times
=cut
# nongreedy quantification
*?, +?, {n,m}?		# grabs as few as possible
# m flag so ^ and & match begin/end of any line instead of whole string
# s flag treats string as single line. . matches \n now

# backreferences
/^(\S+) \s+ \1/x		# \1 matches first group, but maybe exponential runtime
/\d+(?=\t)/		# doesn't consume tab

# \G anchor of cursor, /g flag means \G at begining







