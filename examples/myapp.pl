#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

use MyApp;

my $app = MyApp->new;
print $app->foo;    # Use of uninitialized value
$app->foo('bar');
print $app->foo;    # bar
