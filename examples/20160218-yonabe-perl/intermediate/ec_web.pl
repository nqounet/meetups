use strict;
use warnings;
use lib 'lib';
use EcWeb;

use Data::Printer {deparse => 1};


my $app = EcWeb->new;
p $app;

my $route = $app->dispatch(@ARGV);
p $route;

my $result = $route->execute;
p $result;
