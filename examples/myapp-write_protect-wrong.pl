#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

use MyApp::WriteProtect;

my $app = MyApp::WriteProtect->new;
$app->foo('bar');    # foo is a read-only accessor
print $app->foo;
