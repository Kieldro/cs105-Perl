#!/usr/bin/perl
# chmod 775 hello.pl
@a = qw(foo bar baz);
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

while (<>){
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
%a = ('a', 1, 'b', 2, 'c', 3);
%a = ('a' => 1, 'b' => 2, 'c' => 3);