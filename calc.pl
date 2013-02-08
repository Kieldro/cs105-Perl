#!/usr/bin/perl
# Ian Buitrago
# 2-11-2013
# log: 2-4 3 hrs
# Assignment 4: Reverse Polish Notation

use warnings;
use v5.10;
use List::Util qw(reduce);
no warnings 'once';

$DEBUG = 1;

while(<>){
	chomp;
	
	# operand
	if(m/\d+/){ push @stack, $_ }		# no semicolon? 5.1?
	# operators
	elsif(/\+/){ add() }
	elsif(/\-/){ minus() }
	elsif(/\*/){ mult() }
	elsif(/\//){ div() }
	elsif(/squares/i){ sq() }
	elsif(/sqrt/i){ root() }
	elsif(/sum/i){ sum() }
	elsif(/mean/i){ mean() }
	elsif(/residuals/i){ residuals() }
	elsif(/stddev/i){ stddev() }
	
	say "Stack: @stack"
}

sub add{
	my $b = pop @stack;
	my $a = pop @stack;
	
	push @stack, $a + $b
}

sub minus{
	my $b = pop @stack;
	my $a = pop @stack;
	
	push @stack, $a - $b
}

sub mult{
	my $b = pop @stack;
	my $a = pop @stack;
	
	push @stack, $a * $b
}

sub div{
	my $b = pop @stack;
	my $a = pop @stack;
	
	push @stack, $a / $b
}

sub sq{ $stack[-1] *= $stack[-1] }

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
	
	say "debug: @stack" if $DEBUG;
	
	$stack[-1] *= $stack[-1]
}



=begin
sqrt
    Replace the top element of the stack with its square root. (You can make use of the built-in sqrt function.) 
sum
    Replace the stack with the sum of all the numbers that were on the stack. 
mean
    Replace the stack with the arithmetic mean of all the numbers that were on the stack. This value should be equal to the sum of all the numbers divided by the size of the stack. 
squares
    Multiply each number on the stack by itself. 
residuals
    Subtract from each number on the stack the mean of all the numbers on the stack. 
stddev
    Replace the stack with the standard deviation of all the numbers that were on the stack.
    This value should be equal to the square root of the mean of the squares of the residuals of all the numbers on the stack. 
=cut