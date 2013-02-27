#!/usr/bin/perl

# assignment 2: rainfall
=begin
The total amount of rainfall, summing all the numerical observations.
The number of days with a positive number of observed inches of rain (rainy days).
The number of days with only a trace amount of rain (drizzly days?).
The number of days with no rain.
The number of days for which no data is available.
=cut

while (<>){
	# $_ constains end char
	chomp;		# removes only line terminator, assumes $_
	if($_ >= 999.99){
		++$NADays;
	}elsif($_ eq 'T'){
		++$traceDays;
	}elsif($_ == 0){
		++$dryDays;
	}else{
		$totalRainfall += $_;
		#print "BOOYAKASHA $totalRainfall\n";
		++$rainDays;
	}
}
print "Total rainfall: $totalRainfall in\n";
print "Days of rain: $rainDays days\n";
print "Days of trace rainfall: $traceDays days\n";
print "Days of no rainfall: $dryDays days\n";
print "Days of no data: $NADays days\n";