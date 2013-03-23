#!/usr/bin/perl

use v5.10;
use actor;
use movie;

my $actors = Actor->new();
my $movies = Movie->new();

my $actor = "Will Smith";
my @movies = ["Independence Day", "I, Robot", "Insert Movie"];

$actors->addActor($actor, @movies);

@listOfSmiths = $actors->searchActors("smith");

@listOfMovies = $actors->getMoviesOfActor($actor);

while(@listOfSmiths) {
	print "$_\n";
}

while(@listOfMovies) {
	print "$_\n";
}