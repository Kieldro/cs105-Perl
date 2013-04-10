#!/usr/bin/perl
# searches network for a user

# use v5.10;

# $user = 'jwilke';
# @machines = `cshosts pub`;
# say "searching for $user...";

# foreach $host (@machines){
# 	spin();
# 	chomp $host;
# 	# say $host;
# 	@input = `finger \@$host`;
# 	foreach(@input){
# 		say "\n$user found on $host." and exit if /^($user)/;
# 	}
# }
# say "\n$user not found.";

# sub spin{
# 	# my $oActor = ord $actor;
# 	# return if $oActor < ord 'A' or $oActor > ord 'Z' or $oActor == $oLast;
# 	# $oLast = ord $actor;
# 	my $percent = (++$i) / (scalar @machines);
# 	my $total = 25;
# 	my $nEqs = int($percent * $total);
# 	my $nSpaces = $total - $nEqs;
# 	print STDERR "[".('=' x $nEqs).(' ' x $nSpaces)."]\r";
# }

# golfed to 1 line
#perl -e for$host(`cshosts pub`){for(`finger \@$host`){print "$host\n" and exit if /^keo/}}
