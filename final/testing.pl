#!/usr/bin/perl 

use v5.10;
use Actor;
use Movie;

my $actors = Actor->new();
my $movies = Movie->new();

my $actor = "Will Smith";
my @movies = ("Independence Day", "I, Robot", "Insert Movie");
my $refToMovies = \@movies;

$actors->addActor($actor, $refToMovies);

@listOfSmiths = $actors->searchActors("smith");

$refOfMovies = $actors->getMoviesOfActor($actor);

foreach $smith (@listOfSmiths) {
    print "found actor: $smith\n";
}

my @movies = @{$refOfMovies};

foreach $movie (@movies) {
    print "found movie: $movie\n";
}
