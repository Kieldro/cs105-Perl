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

