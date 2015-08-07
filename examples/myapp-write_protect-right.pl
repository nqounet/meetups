#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

use MyApp::WriteProtect;

my $app = MyApp::WriteProtect->new;
$app->_set_foo('bar');
print $app->foo;    # bar
