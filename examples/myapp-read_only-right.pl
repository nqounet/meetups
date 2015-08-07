#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

use MyApp::ReadOnly;

my $app = MyApp::ReadOnly->new(foo => 'bar');
print $app->foo;    # bar
