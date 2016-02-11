#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

use MyApp::Accessor;

my $app = MyApp::Accessor->new;
print $app->foo;    # Use of uninitialized value
$app->foo('bar');
print $app->foo;    # bar
