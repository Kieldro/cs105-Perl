#!/usr/bin/perl
# Ian Buitrago
# Tri Nguyen
# 4-2-2013
# log:
# 3/4		1800-1900		1 hrs
# 3/19		1200-1400		2 hrs
# 3/23 		0000-0200		2 hrs
# Total:					5 hrs
# Final Project: The Six Degrees of Kevin Bacon

use v5.10;
use Actor;
use Movie;
# initialize hashes of actors and movies
my $actors = Actor->new();
my $movies = Movie->new();

$DEBUG = 1;

# regex objects
$numeralRE = qr/[IVXLCDM]+/;
$title = qr/[\w\d ,]+/;
$yearRE = qr/\(\d{4}\)/;
$role = qr/\[.+\]/;
$billing = qr/<\d+>/;
$actorRE = qr/^(?<actor>.+, \w+( \($numeralRE\))?)\t+/;
$movieRE = qr/\t+(?<movie>(?!")$title(?!") $yearRE(?:  $role)?(?:  $billing)?)(?! \(V\))(?! \(TV\))(?! \(VG\))/;

foreach my $inFile (@ARGV) {
	say "Opening $inFile...";
	# open IN, "zcat $inFile |" or die "Could not open $inFile: $!";
	open IN, "$inFile" or die "Could not open $inFile: $!";
	
	while(<IN>){
		chomp;
		if(/$actorRE/){
			#$actor = $+{actor};
			$actors->addActor($actor);
			say STDERR '$actor: '.$actor if $DEBUG;
		}
		if(/$movieRE/){
			#$movie = $+{movie};
			# Add our movie to our current actor
			# and an actor to our current movie
			$actors->addMovieToActor($actor, $movie);
			$movies->addActorToMovie($actor, $movie);
			
			say STDERR '$movie: '.$movie if $DEBUG;
			
			#push @{$actorHash{$actor}}, $movie;
			#push @{$movieHash{$movie}}, $actor;
		}
	}
}

#say @{$actorHash{"Bacon, Kevin (I)"}};
#say @{$movieHash{"A Few Good Men (1992)  [Capt. Jack Ross]  <4>"}};

# should have list of actors and movies by now, perform 
# "bacon number computation"

#hash for storing our actors and their bacon numbers   
my %baconNumbers;

my @queueActors; # populated by grabbing from movies
my @queueMovies; # populated by grabbing from actors

# start from people with Bacon in their name                             
my @bacons = $actors->searchActors("bacon");

# add bacon people to hash as 0 (starting point)                         
foreach $bacon (@bacons) {
    $baconNumbers{$bacon} = 0;
}

push(@queueActors, @bacons);
while(@queueActors) {
    #grabbing actor from queue                                           
    my $actorName = shift(@queueActors);

    #grab all the movies actor was in                                    
    my $refMovieList = $actors->getMoviesOfActor($actorName);
    my @movieListOfActor = @{$refMovieList};

    # put our list of movies into queue and iterate through              
    push(@queueMovies, @movieListOfActor);
    while(@queueMovies) {
        #grabbing movie from queue                                       
        my $movieName = shift(@queueMovies);

        #grab all actors for the movieName                               
        my $refActorList = $movies->getActorsOfMovie($movieName);
        my @actorListOfMovies = @{$refActorList};
        # check for actors that already processed bacon numbers          
        # those who do can be ignored, those who don't are added         
        # and pushed onto queue of actors for processing through         
        # their movie list (branching out from here)                     
        foreach $actor (@actorListOfMovies) {
            if(!exists $baconNumbers{$actor}) {
                $baconNumbers{$actor} = $baconNumbers{$actorName} + 1;
                push(@queueActors, $actor);
            }
        }
   }
}

print "BACON NUMBA COMPUTACION!\n\n";
while (my ($k,$v)=each %baconNumbers) {print "$k, $v\n"}

 # Input from user
# while(<>){
	
# 	print 'Enter actor: ';
	
	
# }


# sample output

# doctor-nick.cs.utexas.edu% ./final.pl /u/cdunham/cs105/*.list.gz
# Actor/Actress? malkovich
# Malkovich, Claudia
# Malkovich, Erik
# Malkovich, John
# Malkovich, Kent
# Actor/Actress? john malkovic
# Actor/Actress? john malkovich
# Malkovich, John
# 	Queens Logic (1991)
# Bacon, Kevin
# Actor/Actress? Chaplin, Charles
# Chaplin, Charles
# 	Countess from Hong Kong, A (1967)
# Loren, Sophia
# 	Pr?t-?-Porter (1994)
# Whitaker, Forest
# 	Air I Breathe, The (2007)
# Bacon, Kevin
# Actor/Actress? ^D
# doctor-nick.cs.utexas.edu%
