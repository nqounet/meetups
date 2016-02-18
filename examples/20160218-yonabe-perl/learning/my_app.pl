use strict;
use warnings;
use lib 'lib';
use MyApp;

use Data::Printer {deparse => 1};


my $app = MyApp->new;
p $app->foo;
p $app;

p $app->foo('bar');
p $app->foo;
p $app;

my $app2 = MyApp->new(foo => 'hoge');
p $app2;

p $app2->foo;
p $app2;
