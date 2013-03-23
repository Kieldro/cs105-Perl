#!/usr/bin/perl

use v5.10;

while(<>){
	# say;
	push @numbers, $_;
	
}
say 'size '.scalar @numbers;

@numbers = count(@numbers);

say 'size '.scalar @numbers;
say @numbers;

sub count{
	my @a = shift;
	say @a;
	my $len = scalar @a;
	if($len < 2){
		return @a;
	}
	my @b = count(@a[0, $len/2]);
	my @c = count(@a[$len/2+1, -1]);
	my @result;
	
	while(scalar @b and scalar @c){
		
		if($b[0] < $c[0]){
			push @result, shift @b
		}else{push @result, shift @c}
	}
	@a = @result;
	return @a;
}


# $user = 'jwilke';
# @machines = qw/seafoam/;# lust milky-way/;
# $pw = ';lkj1234';

# foreach (@machines){
# 	say 'boom';
# 	system qq/ssh keo\@$_.cs.utexas.edu/;
# 	system qq/$pw/;
# 	# system qq/finger $user/;
# 	# system "exit";
# }