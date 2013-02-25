#!/usr/bin/perl

use v5.10;
use matrix;

$A = matrix->new();
$B = matrix->new();

$C = $A + $B;
say 'Sum:';
$C->print();