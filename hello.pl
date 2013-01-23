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

# idiom = <ARGV> = <> reads stdin or args
