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

# adds an actor to hash with the list of his movies
# note here that we're adding the reference to the array (syntax)
sub addActor {
	my $self = shift;
	my $actor = shift;
	my $refToMoviesList = shift;
	$self->{$actor} = $refToMoviesList;
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
