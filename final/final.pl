#!/usr/bin/perl
# Ian Buitrago
# Tri Nguyen
# 4-2-2013
# log:
# 3/4		1800-1900		1 hrs
# 3/19		1200-1400		2 hrs
# Total:					3 hrs
# Final Project: The Six Degrees of Kevin Bacon

use v5.10;

$DEBUG = 1;

# Graph with Nodes as Actors and Edges as Movies
# Cycles will be prevented through "discovering" nodes

# Preload data into hashes
# Bacon, Kevin (I)	12th Annual Screen Actors Guild Awards (2006) (TV)  [Himself]
$numeralRE = qr/[IVXLCDM]+/;
$yearRE = qr/\(\d{4}\)/;
$actorRE = qr/^(?<actor>\w+, \w+( \($numeralRE\))?)/;
$titleRE = qr/(?<title>\t+.+)/;
$movieRE = qr/\t+(?<movie>(?!")\w+.+(?!")\ $yearRE(?!\(TV|V|VG\)))/x;
# Start by adding actor to stack, then create edges (movies) actor has played in, ???
# One thing I see that could happen is an actor's hash holds a list of movies (edges), 
# when we look at the next actor we can access all previous actors hashes and search for the movie, 
# if found then we add an edge between the two actors

# Split regex into smaller pieces
while(<>){
	chomp;
	
	if(/$actorRE $titleRE/x){
	# say 'GOOM' if '	test (2013)' =~ /$movieRE/;
		$key = $+{actor};
		say STDERR '$key: '.$key if $DEBUG;
		$title = $+{title};
			# say STDERR '$title: '.$title;
		if($title =~ /$movieRE/){
			say STDERR '$title: '.$+{movie};
		}
	}elsif(/$movieRE/){
		$movie = $+{movie};
		# say STDERR '$movie: '.$movie if $DEBUG;
	}
	
}

# # Input from user
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
