#!/usr/bin/perl
# Ian Buitrago
# Tri Nguyen
# 4-2-2013
# log:
# 3/4		1800-1900		1 hrs
# 3/19		1200-1400		2 hrs
# 3/23		0000-0200		2 hrs
# 3/25		0900-1100		2 hrs
# Total:					7 hrs
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

foreach my $inFile (@ARGV) {
	say "Opening $inFile..."	;
	open IN, "zcat $inFile |" or die "Could not open $inFile: $!";
	# open IN, "$inFile" or die "Could not open $inFile: $!";
	
	say 'Extracting data...';
	while(<IN>){
		print STDERR ''.$spinner[++$i/10000 % @spinner]."\r";
		chomp;
		if(/$actorRE/){
			$actor = $+{actor};		# this defines $actor and give a value to $actor
			# say STDERR '$actor: '.$actor if $DEBUG;
		}
		if(/$movieRE/){
			$movie = $+{movie};

			# Add our movie to our current actor
			# and an actor to our current movie
			$actors->addMovieToActor($actor, $movie);
			$movies->addActorToMovie($actor, $movie);
			# say STDERR '$movie: '.$movie if $DEBUG;
			# push @{$actorHash{$actor}}, $movie;
			# push @{$movieHash{$movie}}, $actor;
		}
	}
}
#say @{$movieHash{"A Few Good Men (1992)"}} if $DEBUG;

# Bacon numbers computation
%baconNumbers = computeBacons();		# stores all actors with bacon numbers

# Input from user
while(1){
	print 'Actor/Actress? (last name, first name) ';
	$query = <STDIN>;
	chomp $query;
	if($query eq ''){
		say "Thank you for testing.";
		exit;
	}
	say 'query: '.$query if $DEBUG;
	if($query =~ /(\w+) (\w+)/){
		$query = $2.', '.$1;
		say 'query: '.$query;
	}

	# if we have more than 1 element, print list contents, otherwise search
	my @queryActors = $actors->searchActors($query);
	if(scalar @queryActors > 1) {
	    while(@queryActors) {
			$actor = shift @queryActors;
			print "$actor\n";
	    }
	}
	else {
		my $search = shift @queryActors;

		# setting current bacon number to our search (eventually this will = 0)
		my $currentBacon = $baconNumbers{$search};
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
}


sub computeBacons{
	my @actorQueue;		# populated by grabbing from movies
	my @movieQueue;		# populated by grabbing from actors

	# Start our search at Kevin Bacon
	my @bacons = $actors->searchActors("Bacon, Kevin");
	# @bacons should only have Kevin Bacon in it
	$bacon = shift @bacons;
	$baconNumbers{$bacon} = 0;

	push(@actorQueue, $bacon);
	foreach(@actorQueue) {
		# grabbing actor from queue
		my $actorName = $_;

		# grab all the movies actor was in
		my $refMovieList = $actors->getMoviesOfActor($actorName);
		my @movieListOfActor = @$refMovieList;

		# put our list of movies into queue and iterate through
		push @movieQueue, @movieListOfActor;
		foreach(@movieQueue) {
			# grabbing movie from queue
			my $movieName = $_;

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
		
		return %baconNumbers;
	}

	print "Printing out Actors and their Bacon Numbers: \n";
	#while (my ($k,$v)=each %baconNumbers) {print "\tBacon Number: $v\tActor: $k\n"}
}

# sample output

# doctor-nick.cs.utexas.edu% ./final.pl /u/cdunham/cs105/*.list.gz
# Actor/Actress? malkovich
# Malkovich, Claudia
# Malkovich, Erik
# Malkovich, John
# Malkovich, Kent
# Actor/Actress? john malkovic
# Actor/Actress? john malkovich
# Malkovich, John
# 	Queens Logic (1991)
# Bacon, Kevin
# Actor/Actress? Chaplin, Charles
# Chaplin, Charles
# 	Countess from Hong Kong, A (1967)
# Loren, Sophia
# 	Pr?t-?-Porter (1994)
# Whitaker, Forest
# 	Air I Breathe, The (2007)
# Bacon, Kevin
# Actor/Actress? ^D
# doctor-nick.cs.utexas.edu%
