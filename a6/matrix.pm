#!/usr/bin/perl

package matrix;
use v5.10;
use overload

'+' => \&add,
'-' => \&subtract,
'*' => \&multiply;

$DEBUG = 1;

# Constructor
sub new{
	my $self = bless [];
	
	while(<>){
		# chomp;
		last if /^\w*$/ and scalar @$self;		# exit loop if whitespace line
		
		add_row($self, split);
	}
	
	return $self;
}

sub string{
	my $self = shift;
	my $result = '';
	
	for my $row (@$self){
		$result .= qq/@$row\n/;
	}
	
	return $result;
}

sub print{
	my $self = shift;
	# say 'dssdf: '.scalar @$self if $DEBUG;
	print string($self);
}

sub add_row{
	my $self = shift;
	# say scalar @_;
	push @$self, [@_];
	# say scalar @$self;
}

sub multiply{
	# say q/BOOM /;
	my $A = shift;
	my $B = shift;
	my $C = bless [];		# TODO
	
	say 'rows: ' . scalar @$A;
	say 'cols: ' . ($#{$$B[0]} + 1);
	say 'mth : ' . scalar @$B;
	
	for ($r = 0; $r < scalar @$A; ++$r){
		for ($c = 0; $c < $#{$$B[0]} + 1; ++$c){
			for ($m = 0; $m < scalar @$B; ++$m){
				$$C[$r][$c] += $$A[$r][$m] * $$B[$m][$c];
			}
		}
	}
	
	$C->print();
	
	return $C;
}

sub add{
	my $A = shift;
	my $B = shift;
	my $C = bless [];		# TODO
	
	say 'rows: ' . scalar @$A;
	say 'cols: ' . ($#{$$B[0]} + 1);
	say 'mth : ' . scalar @$B;
	
	for ($r = 0; $r < scalar @$A; ++$r){
		for ($c = 0; $c < $#{$$B[0]} + 1; ++$c){
			$$C[$r][$c] = $$A[$r][$c] + $$B[$r][$c];
			# say $r;
		}
	}
	
	return $C;
}

sub subtract{
	# binaryOp(@_, _sub_{$_[0] - $_[1]});
	
	my $A = shift;
	my $B = shift;
	my $C = bless [];		# TODO
	
	say 'rows: ' . scalar @$A;
	say 'cols: ' . ($#{$$B[0]} + 1);
	say 'mth : ' . scalar @$B;
	
	for ($r = 0; $r < scalar @$A; ++$r){
		for ($c = 0; $c < $#{$$B[0]} + 1; ++$c){
			$$C[$r][$c] = $$A[$r][$c] - $$B[$r][$c];
		}
	}
	
	return $C;
}

# sub binaryOp{
# 	my $A = shift;
# 	my $B = shift;
# 	pop;
# 	my $C = bless [];		# TODO
# 	$foo = pop;
	
# 	say 'rows: ' . scalar @$A;
# 	say 'cols: ' . ($#{$$B[0]} + 1);
# 	say 'mth : ' . scalar @$B;
	
# 	for ($r = 0; $r < scalar @$A; ++$r){
# 		for ($c = 0; $c < $#{$$B[0]} + 1; ++$c){
# 			$$C[$r][$c] = $op($$A[$r][$c], $$B[$r][$c]);
# 		}
# 	}
	
# 	return $C;
# }

# sub subOp{
	
# }

1;		# must evalutate to true
