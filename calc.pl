#!/usr/bin/perl
# Ian Buitrago
# 2-11-2013
# log: 10-12 2 hrs
# Assignment 4: Reverse Polish Notation

use warnings;
use v5.10;
use List::Util qw/reduce/;
no warnings 'once';

$DEBUG = 0;

while(<>){
	chomp;
	
	# operand
	if(m/\d+/){ push @stack, $_ }		# no semicolon? 5.1?
	# operators
	else{
		if   (/\+/){ $stack[-2] += pop @stack }
		elsif(/\-/){ $stack[-2] -= pop @stack }
		elsif(/\*/){ $stack[-2] *= pop @stack }
		elsif(/\//){ $stack[-2] /= pop @stack }
		elsif(/squares/i){ sq() }
		elsif(/sqrt/i){ root() }
		elsif(/sum/i){ sum() }
		elsif(/mean/i){ mean() }
		elsif(/residuals/i){ residuals() }
		elsif(/stddev/i){ stddev() }
		
		say "Stack: @stack"
	}
	say STDERR "debug: @stack" if $DEBUG;
}

# special functions
sub sq{ $stack[-1] **= 2 }

sub root{ $stack[-1] = sqrt($stack[-1]) }

sub sum{ @stack = reduce {$a + $b} @stack }

sub mean{
	my $n = scalar @stack;
	sum();
	$stack[0] /= $n
}

sub residuals{
	@a = @stack;
	mean();
	@stack = map {$_ - $stack[0]} @a
}

sub stddev{
	residuals();
	@stack = map {$_ * $_} @stack;		# square each element
	mean();
	root()
}