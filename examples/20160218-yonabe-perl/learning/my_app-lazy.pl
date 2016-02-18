use strict;
use warnings;
use lib 'lib';
use MyApp::Lazy;

use Data::Printer {deparse => 1};


my $app = MyApp::Lazy->new;
p $app;

p $app->foo;
p $app;

# $app->foo('hoge');    # foo is a read-only accessor


my $app2 = MyApp::Lazy->new(foo => 'hoge');
p $app2;

p $app2->foo;
p $app2;
