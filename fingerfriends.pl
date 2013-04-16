#!/usr/bin/perl
# searches network for a user

use v5.10;

@users = qw/jwilke fayz acoomans pandaman matias carroll keo/;
@machines = split /\s+/, `cshosts -a pub`;

say "searching for friends...";
foreach $host (@machines){
	# spin();
	$pid = fork;
	if(!$pid)
	{
		# child
		@input = `finger \@$host 2>&1`;
		foreach(@input){
			foreach $user(@users){
				say "\n$user found on $host." if /$user/i;
			}
		}
		exit;
	}
}
while(wait != -1){		# reap all children
	spin();
}
say "\nSEARCH COMPLETE.";

sub spin{
	my $percent = (++$i) / (scalar @machines);
	my $total = 25;
	my $nEqs = int($percent * $total);
	my $nSpaces = $total - $nEqs;
	print STDERR "[".('=' x $nEqs).(' ' x $nSpaces)."]\r";
}

# golfed to 1 line
#perl -e 'for$host(`cshosts -a pub`){for(`finger \@$host`){print "$host\n" and exit if /jwilke/i}}'

