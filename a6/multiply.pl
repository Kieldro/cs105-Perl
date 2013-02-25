#!/usr/bin/perl
# Ian Buitrago
# 2-25-2013
# log:
# 2/18		1700-1900		3 hrs
# 2/25		0600-0900		3 hrs
# Assignment 6: Object-Oriented Matrices

use v5.10;
use matrix;

# Input
$A = matrix->new();
$A->print();
$B = matrix->new();
$B->print();

# say $$A[0][1];

# @v = ();
# $v[0] = 3;
# $v[1] = 7;
# say @v;

# $C = new();		# TODO
# $C = bless [], matrix;
# $C->print();
# $$C[1] = [];
# say scalar @$C;
$C = $A * $B;
$C->print();