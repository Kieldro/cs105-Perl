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

my $actor = "Bruce Willis";
my @movies = ("B", "D");
my $refToMovies = \@movies;

$actors->addActor($actor, $refToMovies);
$movies->addMovies($actor, $refToMovies);

my $actor = "Ian Buitrago";
my @movies = ("D", "E", "G");
my $refToMovies = \@movies;

$actors->addActor($actor, $refToMovies);
$movies->addMovies($actor, $refToMovies);

my $actor = "Lim Yo Hwan";
my @movies = ("F", "G");
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

# NOTE: make sure when checking that we also account for actors
# not connected at all, so we'd have to check existence on %baconNumbers

#hash for storing our actors and their bacon numbers
my %baconNumbers;

# queue for actors and movies 
my @queueActors;
my @queueMovies;

# start from people with Bacon in their name
my @bacons = $actors->searchActors("bacon");

# add bacon people to hash as 0 (starting point)
foreach $bacon (@bacons) {
    $baconNumbers{$bacon} = 0;
}

push(@queueActors, @bacons);
while(@queueActors) {
    #grabbing actor from queue
    my $actorName = shift(@queueActors);

    #grab all the movies actor was in
    my $refMovieList = $actors->getMoviesOfActor($actorName);
    my @movieListOfActor = @{$refMovieList}; 

    # put our list of movies into queue and iterate through
    push(@queueMovies, @movieListOfActor);
    while(@queueMovies) {
        #grabbing movie from queue
	my $movieName = shift(@queueMovies);

	#grab all actors for the movieName
	my $refActorList = $movies->getActorsOfMovie($movieName);
	my @actorListOfMovies = @{$refActorList};

	# check for actors that already processed bacon numbers
	# those who do can be ignored, those who don't are added
	# and pushed onto queue of actors for processing through
	# their movie list (branching out from here)
	foreach $actor (@actorListOfMovies) {
	    if(!exists $baconNumbers{$actor}) {
		$baconNumbers{$actor} = $baconNumbers{$actorName} + 1;
		push(@queueActors, $actor);
	    }
	}
   }
}

print "BACON NUMBA COMPUTACION!\n\n";
while (my ($k,$v)=each %baconNumbers) {print "$k, $v\n"}

