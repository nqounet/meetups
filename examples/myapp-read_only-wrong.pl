#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

use MyApp::ReadOnly;

my $app = MyApp::ReadOnly->new;
$app->foo('bar');    # foo is a read-only accessor
print $app->foo;
