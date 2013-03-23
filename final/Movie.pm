package Movie;

use v5.10;

# create movie object that stores hash of movies
sub new {
	my $class = shift;
	my %movies = {};
	my $self = \%movies;
	
	bless $self, %movies, $class;
	return $self;
}

# adds an actor to hash with the list of his movies
# TODO: make sure movie checks for empty list of actors and semi populated
sub addMovie {
	my $self = shift;
	my $movie = shift;
	my @actors = shift;
	$self->{$movie} = @actors;
}


