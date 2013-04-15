#!/usr/bin/perl
# searches network for a user

use v5.10;

@users = qw/jwilke fayz acoomans pandaman matias carroll keo/;
@machines = `cshosts -a sins64`;
say "searching for friends...";

foreach $host (@machines){
	# spin();
	chomp $host;
	$pid = fork();
	chomp $pid;
	say $pid;
	push @pid, $pid;
	# ++$n;
	if($pid){
		# child
		# say $host;
		@input = `finger \@$host`;
		foreach(@input){
			foreach $user(@users){
				say "\n$user found on $host." if /$user/i;
			}
		}
		say "$n$host exiting..." and 
		exit;
	}
}
# say "wait returns: ".waitpid;
# say 
foreach(@pid){
	# say @pid;
	# say waitpid($_, 0);
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

