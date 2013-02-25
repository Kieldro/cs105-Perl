#!/usr/bin/perl

package matrix;
use v5.10;
use overload

'+' => \&add,
'-' => \&subtract,
'*' => \&multiply;

# Constructor
sub new{
	my $self = bless [];
	# say qq/BOOM/.$ARGV;
	while(<>){
		last if /^\w*$/;		# exit loop if whitespace line
		# say split;
		add_row($self, split);
	}
	return $self;
	# say scalar @A;
	# die;
}

sub string{
	my $self = shift;
	my $result = '';
	
	for $row (@$self){
		# say scalar @$row;
		$result .= qq/@$row\n/;
	}
	
	return $result;
}

sub print{
	my $self = shift;
	say scalar @$self if $DEBUG;
	print string($self);
}

sub add_row{
	my $self = shift;
	# say scalar @_;
	push @$self, [@_];
	# say scalar @$self;
};

sub multiply{
	my $A = shift;
	my $B = shift;
	# say 'BAM ' . scalar @_;
	my $C = bless [];		# TODO
	
	
	say 'rows: ' . scalar @$A;
	say 'cols: ' . ($#{$$B[0]} + 1);
	say 'mth : ' . scalar @$B;
	# say q/BOOM / . $$A[1][0];

	
	for ($r = 0; $r < scalar @$A; ++$r){
		for ($c = 0; $c < $#{$$B[0]} + 1; ++$c){
			for ($m = 0; $m < scalar @$B; ++$m){
				$$C[$r][$c] += $$A[$r][$m] * $$B[$m][$c];
				# say q/BOOM/.$$C[$r][$c];
				# say $r;
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

1;		# must evalutate to true
