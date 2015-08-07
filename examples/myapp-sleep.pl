#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use MyApp::Sleep;
my $app = MyApp::Sleep->new;
print $app->method;      # 5sec
print $app->method;      # 5sec
print $app->property;    # 5sec
print $app->property;    # 0sec
