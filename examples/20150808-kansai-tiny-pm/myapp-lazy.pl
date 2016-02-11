#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

use MyApp::Lazy;

my $app   = MyApp::Lazy->new;
my $model = $app->model;
my $cond  = +{name => 'nqounet'};
my $row   = $model->single('users', $cond);
