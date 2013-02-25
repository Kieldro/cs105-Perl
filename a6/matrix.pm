#!/usr/bin/perl

# package matrix;
use v5.10;

# Constructor
sub new{
	while(<>){
		last if /^\w+$/;		# exit loop if whitespace line
		push @A, [split];
	}
	# say scalar @A;
	return bless \@A;
}

sub string{
	my $self = shift;
	# say scalar @$self;
	for $row (@$self){
		print qq/@$row /;
		# for(@$row){
		# 	say $_;
			
		# }
		say;
	}
}

sub print{
	say q/hi/;
}

sub add_row{
	
};

1;		# must evalutate to true
