#!/usr/bin/perl
# Ian Buitrago
# 2-25-2013
# log:
# 2/18		1700-1900		3 hrs
# 2/25		0600-0900		3 hrs
# 2/25		1100-1300		4 hrs
# 2/26		1800-1900		1 hrs
# Assignment 6: Object-Oriented Matrices

package matrix;
use v5.10;
use overload

'+' => \&add,
'-' => \&subtract,
'*' => \&multiply;

$DEBUG = !1;

# Constructor
sub new{
	my $self = bless [];
	
	while(<>){
		if (!scalar split){
			if (scalar @$self){ last }		# matrix done
			else{ next }		# skip preceeding whitespace
		}
				
		add_row($self, split);
	}
	
	return $self;
}

sub string{
	my ($self,) = @_;
	my $result = '';
	
	for my $row (@$self){
		$result .= qq/@$row\n/;
	}
	
	return $result;
}

sub print{
	my ($self,) = @_;
	print string($self);
}

sub add_row{
	my $self = shift;
	push @$self, [@_];
}

sub multiply{
	my ($A, $B) = @_;
	my $C = bless [];
	
	if ($DEBUG){
		say 'rows: ' . scalar @$A;
		say 'cols: ' . ($#{$$B[0]} + 1);
		say 'mth : ' . scalar @$B;
	}
	
	for ($r = 0; $r < scalar @$A; ++$r){
		for ($c = 0; $c < $#{$$B[0]} + 1; ++$c){
			for ($m = 0; $m < scalar @$B; ++$m){
				$$C[$r][$c] += $$A[$r][$m] * $$B[$m][$c];
			}
		}
	}
	
	$C->print() if $DEBUG;
	
	return $C;
}

sub add     { binaryOp(@_[0,1], sub{$_[0] + $_[1]}); }
sub subtract{ binaryOp(@_[0,1], sub{$_[0] - $_[1]}); }

# factored out code
sub binaryOp{
	my ($A, $B, $op) = @_;
	my $C = bless [];
	
	if ($DEBUG){
		say ref $op;
		say 'rows: ' . scalar @$A;
		say 'cols: ' . ($#{$$B[0]} + 1);
		say 'mth : ' . scalar @$B;
	}
	
	for ($r = 0; $r < scalar @$A; ++$r){
		for ($c = 0; $c < $#{$$B[0]} + 1; ++$c){
			$$C[$r][$c] = &$op($$A[$r][$c], $$B[$r][$c]);
		}
	}
	
	return $C;
}

1;		# must evalutate to true
