use strict;
use warnings;
use lib 'lib';
use MyApp::ReadOnly;
use Data::Dumper qw(Dumper);


my $app = MyApp::ReadOnly->new(foo => 'foo');
print $app->foo;

print "\n";
print Dumper($app);
