package Actor;

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
# TODO: make sure that name format (i.e. last, first) is taken care of
sub searchActors {
	my $self = shift;
	# uppercasing the first letter
	my $queryName = ucfirst(shift);
	my @listOfActors;
	foreach $key(keys %{$self}) {
		if(index($key, $queryName) != -1) {
			push(@listOfActors, $key);
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
