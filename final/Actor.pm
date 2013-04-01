package Actor;
$DEBUG = 1;

use v5.10;

# create actor object that stores hash of actors
sub new {
	my $class = shift;
	my %actors = {};
	my $self = \%actors;
	
	bless $self, $class;
	return $self;
}

# adds a movie to the list of our actor
sub addMovieToActor {
    my $self = shift;
    my $actor = shift;
    my $movie = shift;
    push @{$self->{$actor}}, $movie;
}


# returns a list of keys that may match the search query
sub searchActors {
	my $self = shift;
	my $queryName = lc shift;
	
	my @listOfActors;
	foreach $key(keys %$self) {
		if(index (lc $key, $queryName) != -1) {
			push @listOfActors, $key;
		}
	}
	
	return @listOfActors;
}

# grabs the list of movies actor starred in
# grab the reference and return the array
sub getMoviesOfActor {
	my $self = shift;
	my $actor = shift;
	my $refToMovies = $self->{$actor};
	
	return $refToMovies;
}
1;
