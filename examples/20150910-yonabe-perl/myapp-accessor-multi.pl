use strict;
use warnings;
use lib 'lib';
use MyApp::Accessor::Multi;
use Data::Dumper qw(Dumper);


my $app = MyApp::Accessor::Multi->new();
$app->foo('foo');
print $app->foo;
$app->bar('bar');
print $app->bar;
$app->baz('baz');
print $app->baz;

print "\n";
print Dumper($app);
