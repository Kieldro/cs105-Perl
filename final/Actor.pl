package Actor;

use v5.10;

# create actor object that stores hash of actors
sub new {
	my $class = shift;
	my %actors = {};
	my $self = \%actors;
	
	bless $self, %actors, $class;
	return $self;
}

# adds an actor to hash with the list of his movies
sub addActor {
	my $self = shift;
	my $actor = shift;
	my @movies = shift;
	$self->{$actor} = @movies;
}

# returns a list of keys that may match the search query
# TODO: make sure that name format (i.e. last, first) is taken care of
# TODO: check if Upper or lower case matters
sub searchActors {
	my $self = shift;
	# uppercasing the first letter
	my $queryName = ucfirst(shift);
	my @listOfMatches;
	foreach $key(keys %{self}) {
		if(index($key, $queryName) != -1) {
			push(@listOfMatches, $key);
		}
	}
	
	return @listOfMatches;
}