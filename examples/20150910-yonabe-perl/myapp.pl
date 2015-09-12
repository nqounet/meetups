use strict;
use warnings;
use lib 'lib';
use MyApp;
use Data::Dumper qw(Dumper);


my $app = MyApp->new();
$app->foo('bar');
print $app->foo;

print "\n";
print Dumper($app);
