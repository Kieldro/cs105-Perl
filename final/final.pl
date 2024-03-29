#!/usr/bin/perl
# Ian Buitrago
# Tri Nguyen
# 4-2-2013
# log:
# 3/4		1800-1900		1 hrs
# 3/19		1200-1400		2 hrs
# 3/23		0000-0200		2 hrs
# 3/25		0900-1100		2 hrs
# 4/1		1300-1700		3 hrs
# Total:					10 hrs
# Final Project: The Six Degrees of Kevin Bacon

use v5.10;
use Actor;
use Movie;

$DEBUG = $Actor::DEBUG;

# initialize hashes of actors and movies
my $actors = Actor->new();
my $movies = Movie->new();

my @spinner = qw/| \/ - \\ /;

# regex objects
$numeralRE = qr/[IVXLCDM]+/;
$title = qr/[\w\d ,]+/;
$yearRE = qr/\(\d{4}\)/;
$role = qr/\[.+\]/;
$billing = qr/<\d+>/;
$actorRE = qr/^(?<actor>.+, \w+( \($numeralRE\))?)\t+/;
$movieRE = qr/\t+(?<movie>(?!")$title(?!") $yearRE)(?:  $role)?(?:  $billing)?(?! \(V\))(?! \(TV\))(?! \(VG\))/;

# Data input
$startTime = time;
foreach my $inFile (@ARGV) {
	say "\nOpening $inFile...";
	open IN, "zcat $inFile |" or die "Could not open $inFile: $!";
	
	say 'Extracting data...';
	while(<IN>){
		chomp;
		if(/$actorRE/){
			$actor = $+{actor};		# this defines $actor and give a value to $actor
			spin();
		}
		if(/$movieRE/){
			$movie = $+{movie};
			
			$actors->addMovieToActor($actor, $movie);
			$movies->addActorToMovie($actor, $movie);
		}
	}
	close IN;
}
$extractionTime = time - $startTime;
say "\nExtraction time: $extractionTime s";

# Bacon numbers computation
%baconNumbers = computeBacons();		# stores all actors with bacon numbers
say "Total elapsed time: ".($extractionTime + $baconTime)." s";

# Input from user
while(1){
	print 'Enter actor: ';
	$query = <STDIN>;
	chomp $query;
	if($query eq ''){
		say "Thank you for testing.";
		exit;
	}
	# adjust format
	if($query =~ /(\w+) (\w+)/){
		$query = $2.', '.$1;
	}
	say 'query: '.$query if $DEBUG;

	# if we have more than 1 element, print list contents
	@queryActors = $actors->searchActors($query);
	if(scalar @queryActors > 1) {
	    while(@queryActors) {
			$actor = shift @queryActors;
			say $actor;
	    }
	    next;
	}
	$search = shift @queryActors;
	
	search();
}
		
sub spin{
	my $oActor = ord $actor;
	return if $oActor < ord 'A' or $oActor > ord 'Z' or $oActor == $oLast;
	$oLast = ord $actor;
	# if($i++ % 100000){
	# 	print ' ';
	# }else{
	# 	print STDERR $spinner[++$j % @spinner];
	# }
	# say STDERR (ord $actor) if $DEBUG;
	my $percent = ((ord $actor) - 65) / ((ord 'Z') - 65);
	my $total = 26;
	my $nEqs = int($percent * $total);
	my $nSpaces = $total - $nEqs;
	# say STDERR "eqs: ".$nEqs if $DEBUG;
	if ($DEBUG and (($nEqs + $nSpaces) != 26)){
		say STDERR "BOOM: ".($nEqs + $nSpaces);
		exit;
	}
	print STDERR "[".('=' x $nEqs).(' ' x $nSpaces)."]\r";
}

sub computeBacons{
	$startTime = time;
	say "Computing bacon numbers...";
	my @actorQueue;		# populated by grabbing from movies
	my @movieQueue;		# populated by grabbing from actors

	# Start our search at Kevin Bacon
	my @bacons = $actors->searchActors("Bacon, Kevin");
	# @bacons should only have Kevin Bacon in it
	$bacon = shift @bacons;
	$baconNumbers{$bacon} = 0;
	
	push @actorQueue, $bacon;
	while(scalar @actorQueue) {
		# grabbing actor from queue
		my $actorName = shift @actorQueue;

		# grab all the movies actor was in
		my $refMovieList = $actors->getMoviesOfActor($actorName);
		my @movieListOfActor = @$refMovieList;

		# put our list of movies into queue and iterate through
		push @movieQueue, @movieListOfActor;
		while(scalar @movieQueue) {
			# print STDERR $spinner[++$j % @spinner]."\r" unless $j % 100000;
			# grabbing movie from queue
			my $movieName = shift @movieQueue;

			# grab all actors for the movieName
			my $refActorList = $movies->getActorsOfMovie($movieName);
			my @actorListOfMovies = @{$refActorList};
			# check for actors that already processed bacon numbers
			# those who do can be ignored, those who don't are added
			# and pushed onto queue of actors for processing through
			# their movie list (branching out from here)
			foreach $actor (@actorListOfMovies) {
				if(!exists $baconNumbers{$actor}) {
					$baconNumbers{$actor} = $baconNumbers{$actorName} + 1;
					push @actorQueue, $actor;
				}
			}
		}
	}

	# print "Printing out Actors and their Bacon Numbers: \n";
	# while (my ($k,$v)=each %baconNumbers) {print "\tBacon Number: $v\tActor: $k\n"}
	$baconTime = time - $startTime;
	say "bacon number computation time: $baconTime";
	return %baconNumbers;
}

sub search{
	# setting current bacon number to our search (eventually this will = 0)
	my $currentBacon = $baconNumbers{$search};
	# say 'BOOM'.$search;
	# the path, we will print all of this junk out later
	my @path;
	push @path, $search;
	SEARCH:
	while($currentBacon != 0) {
		# just grabbing movie list from our search
		$refToMovies = $actors->getMoviesOfActor($search);
		@movieList = @{$refToMovies};
		MOVIE:
		while(@movieList) {
			# grabbing actor list from our movieList
			my $movie = shift @movieList;
			$refToActors = $movies->getActorsOfMovie($movie);
			@actorList = @{$refToActors};
			while(@actorList) {
				$actor = shift @actorList;
				# checks for bacon number one less, if so move to that actor
				if( ($baconNumbers{$actor} + 1) == $currentBacon) {
					# resetting, etc. etc.
					push @path, $movie;
					push @path, $actor;
					--$currentBacon;
					$search = $actor;
					last MOVIE;
				}
			}
		}

		if(@movieList == 0 && @actorList == 0) {
			#exhausted movie list, means infinite bacon number
			$nogo = shift @path;
			say "Unable to find bacon number for $nogo\n";
			last SEARCH;
		}
	}

	# search is finished
	if($currentBacon == 0) {
		while(@path) {
			my $actor = shift @path;
			print "$actor\n";
			if(@path) {
				my $movie = shift @path;
				print "\t$movie\n";
			}
		}
	}
}