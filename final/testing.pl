#!/usr/bin/perl 

use v5.10;
use Actor;
use Movie;

# create actor and movie objects
my $actors = Actor->new();
my $movies = Movie->new();

# sample actor and his movies
my $actor = "Will Smith";
my @movies = ("B", "D", "E");
# create ref for passing through objects
my $refToMovies = \@movies;

# adding to actor and movies to both classes
# for actor, adds actor as hash and list of movies
$actors->addActor($actor, $refToMovies);
# for movies, adds each movie to hash and adds actor to list
$movies->addMovies($actor, $refToMovies);

# adding a few more people
my $actor = "Kevin Bacon";
my @movies = ("A", "B");
my $refToMovies = \@movies;

$actors->addActor($actor, $refToMovies);
$movies->addMovies($actor, $refToMovies);


my $actor = "Angelina Jolie";
my @movies = ("C", "D");
my $refToMovies = \@movies;

$actors->addActor($actor, $refToMovies);
$movies->addMovies($actor, $refToMovies);

# TESTING OUR ACTOR AND MOVIE OBJECTS

#perform search for actor (useful when getting input)                           
@listOfSmiths = $actors->searchActors("smith");

foreach $smith (@listOfSmiths) {
    print "found actor: $smith\n";
}

# getting back reference of movies our actor starred in                         
$refOfMovies = $actors->getMoviesOfActor($actor);
my @movies = @{$refOfMovies};

foreach $movie (@movies) {
    print "found movie: $movie\n";
}

# for each movie get the list of actors in it                                   
foreach $movie (@movies) {
    $refOfActors =  $movies->getActorsOfMovie($movie);
    my @temp = @{$refOfActors};
    foreach $elt (@temp) {
        print "$elt, ";
    }
    print "starred in $movie\n";
}

print "\n\n\n\n\n";

# bacon computation

#hash for storing our actors and their bacon numbers
my %baconNumbers;
my $baconTrack = 0;

# queue for actors and movies 
my @queueActors;
my @queueMovies;

# start from people with Bacon in their name
my @bacons = $actors->searchActors("bacon");
push(@queueActors, @bacons);

# continue until list of actors is exhausted (search through all)
while(@queueActors) {
    #grabbing actor from queue
    my $actorName = shift(@queueActors);

    #set actor's bacon number immediately 
    $baconNumbers{$actorName} = $baconTrack;

    #grab all the movies actor was in
    my $refMovieList = $actors->getMoviesOfActor($actorName);
    my @movieListOfActors = @{$refMovieList};

    # last movie determines when we increase bacon level
    $lastMovieOfActor = $movieListOfActors[-1];

    # put our list of movies into queue and iterate through
    push(@queueMovies, @movieListOfActors);
    while(@queueMovies) {
	#grabbing movie from queue
	my $movieName = shift(@queueMovies);
	
	#grab all actors for the movieName
	my $refActorList = $movies->getActorsOfMovie($movieName);
	my @actorListOfMovies = @{$refActorList};

	# check for actors that already processed bacon numbers
	# this saves us from cycles, etc.
	foreach $actor (@actorListOfMovies) {
	    if(!exists $baconNumbers{$actor}) {
		push(@queueActors, $actor);
	    }
	}

	# checking for last movie to increment bacon distance
	if($movieName eq $lastMovieOfActor) {
	    $baconTrack++;
	}
   }
}

print "BACON NUMBA COMPUTACION!\n\n";
while (my ($k,$v)=each %baconNumbers) {print "$k $v\n"}

