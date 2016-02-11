#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

use MyApp::Predicate;

my $app = MyApp::Predicate->new;
print $app->foo;    # Deep recursion on subroutine ...
