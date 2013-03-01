#!/usr/bin/perl

# version 1.6 - 27 tests

use File::Slurp;
use strict;
$| = 1;

my $filename = shift || 'golf.pl';

my @cases = (

[<<END, 1],
x x     x 
x x xxx xx
xxx x x x 
  xxx x   
      xxx 
  xxxxx x 
  x   xxx 
     xx x 
xxx xxx   
    x     
END

[<<END, 0],
x x     x 
x x xxx xx
xxx x x x 
  xxx x   
      xxx 
  xxxxx x 
  x   xxx 
     xx x 
xxx  xx   
    x     
END

[<<END, 1],
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
END

[<<END, 0],
          
          
          
          
          
          
          
          
          
          
END

[<<END, 0],
 x x x x x
x x x x x 
 x x x x x
x x x x x 
 x x x x x
x x x x x 
 x x x x x
x x x x x 
 x x x x x
x x x x x 
END

[<<END, 0],
x x x x x 
 x x x x x
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
x x x x x 
 x x x x x
END

[<<END, 0],
 x x x x x
x x x x x 
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
xxxxxxxxxx
 x x x x x
x x x x x 
END

[<<END, 0],
          
x x xxx xx
xxx x x x 
  xxx x   
      xxx 
  xxxxx x 
  x   xxx 
     xx x 
xxx xxx   
    x     
END

[<<END, 0],
 x x      
   x      
   x      
          
   x      
   x      
   x      
   x      
   x      
   x      
END

[<<END, 0],
      x   
      x   
      x   
      x   
xxxx  xxxx
xxxx  xxxx
   x  x   
   x      
   x      
   x      
END

[<<END, 0],
      x   
      x   
      x   
      x   
   x  x   
   x  x   
   x  x   
   x      
   x      
   x      
END

[<<END, 1],
   x  x   
   x      
   x      
   x      
   x      
   x      
   x      
   x      
   x      
   x      
END

[<<END, 1],
 x x      
   x      
   x      
   x      
   x      
   x      
   x      
   x      
   x      
   x      
END

[<<END, 1],
x x     x 
x x xxx xx
xxx x x x 
x xxx x   
x     xxx 
x xxxxx x 
x x   xxx 
x    xx x 
xxx xxx   
x   x     
END

[<<END, 1],
x x     x 
x x xxx xx
xxx x x x 
  xxx x   
      xxx 
  xxxxx x 
  x   xxx 
     xx x 
xxx xxx   
    x     
END

[<<END, 1],
x x     x 
x x xxx xx
xxx x x x 
  xxx x   
      xxx 
  xxxxx x 
  x   xxx 
     xx x 
xxx xxx   
x   x     
END

[<<END, 1],
         x
x x xxx xx
xxx x xxx 
  xxx x   
      xxx 
  xxxxx x 
  x   xxx 
     xx x 
xxx xxx   
    x     
END

[<<END, 1],
x       x 
x x xxx xx
xxx x x x 
  xxx x   
      xxx 
  xxxxx x 
  x   xxx 
     xx x 
xxx xxx   
    x     
END

[<<END, 1],
 x        
 x  xxx xx
xxx x x x 
  xxx x   
      xxx 
  xxxxx x 
  x   xxx 
     xx x 
xxx xxxxxx
         x
END


[<<END, 0],
xxx       
  xxx     
    xxx   
      xxx 
x       xx
xxx       
  xxx     
    xxx   
      xxx 
x       xx
END

[<<END, 0],
xxxxxxxxxx
x        x
x xxxxxx x
x x    x x
x x xx x x
 xx xx xx 
x x    x x
x xxxxxx x
x        x
xxxxxxxxxx
END

[<<END, 1],
x         
x xxx xxx 
x x x x x 
xxx xxx x 
        x 
xxx xxx x 
x x x x x 
x xxx xxx 
x         
x         
END

[<<END, 1],
x         
x xxxxxxxx
x x      x
x x xxxx x
x x x  x x
x x x  x x
x xxx  x x
x      x x
xxxxxxxx x
         x
END

[<<END, 0],
x         
x xxxxxxxx
x x      x
x x xxxx x
x x    x x
x x x  x x
x xxx  x x
x      x x
xxxxxxxx x
         x
END

[<<END, 1],
x         
x xxx xxxx
x x x x  x
x x x x xx
x x x x x 
x x x x xx
x x x x  x
x x x x xx
xxx xxx x 
        x 
END

[<<END, 1],
 x        
 x  xxx xx
xxx x x x 
  xxx x   
      xxx 
  xxxxx x 
  x   xxx 
     xx x 
xxx xxx   
    x     
END

[<<END, 0],
  x     x 
x x xxx xx
xxx x x x 
  xxx     
      xxx 
  xxxxx x 
  x   xxx 
     xx x 
xxx xxx   
    x     
END

	);

my $script = read_file $filename;
s/^\s*__END__.*//ms, s/\s*\z/\n/ for $script;
my $score = length($script) - 8;
print "$script\nscore: $score\n";
my $n;
for (@cases)
	{
	my ($d, $want) = @$_;
	write_file 'tmp1', $d;
	my $display = "----------\n$d----------\n";
	#print $display; $display = '';
	my $got = `$^X $filename <tmp1 2>err.tmp`;
	if(-s 'err.tmp')
		{
		print read_file 'err.tmp';
		die "${display}printed to STDERR";
		}
	(my $show = $got)=~s/\n/\\n/g;
	die "${display}failed, got \"$show\", wanted $want" unless "$want\n" eq $got;
	printf "%3d: correctly found $want\n", ++$n;
	}
print "\nPASSED\n\n";
print "$script\nscore: $score\n";
append_file 'run.log', "score: $score\n$script\n";
