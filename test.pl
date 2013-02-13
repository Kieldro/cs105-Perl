#!/usr/bin/perl

use v5.10;

"aauytt" =~ m/aa.{2}(?=tt)/x;
say $&;