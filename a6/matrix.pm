#!/usr/bin/perl

# package Matrix;
use v5.10;
use overload

'+' => \&add,
'-' => \&subtract,
'*' => \&multiply;

# Constructor
sub new{
	my $self = bless [];
	say qq/BOOM/.$ARGV;
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

1;		# must evalutate to true
