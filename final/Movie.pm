package Movie;

use v5.10;

# create movie object that stores hash of movies
sub new {
	my $class = shift;
	my %movies = {};
	my $self = \%movies;
	
	bless $self, $class;
	return $self;
}

# whenever we add an actor, also need to add to movies list
# TODO: make sure movie checks for empty list of actors and semi populated
sub addMovies {
    my $self = shift;
    my $actor = shift;
    my $refToMoviesList = shift;
    my @moviesList = @{$refToMoviesList};
    foreach $movie (@moviesList) {
	push(@{$self->{$movie}}, $actor);
    }
}

sub getActorsOfMovie {
    my $self = shift;
    my $movie = shift;
    my $refToActors = $self->{$movie};

    return $refToActors;
}

1;
