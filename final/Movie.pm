package Movie;

use v5.10;
use Actor;
$DEBUG = $Actor::DEBUG;

# create movie object that stores hash of movies
sub new {
	my $class = shift;
	my %movies = {};
	my $self = \%movies;
	
	bless $self, $class;
	return $self;
}

# adds an actor to the list of our movie
sub addActorToMovie {
    my $self = shift;
    my $actor = shift;
    my $movie = shift;
    push @{$self->{$movie}}, $actor;
}

# gets all actors in the movie
sub getActorsOfMovie {
    my $self = shift;
    my $movie = shift;
    my $refToActors = $self->{$movie};

    return $refToActors;
}

1;
