use strict;
use warnings;
use lib 'lib';
use MyApp::Accessor;
use Data::Dumper qw(Dumper);


my $app = MyApp::Accessor->new(
    x => 0,
    y => 0
);
$app->move_up();
print $app->y;
# $app->clear_y;
if ($app->has_y){
    print 'yあります';
}
$app->wing(1);
print $app->wing;
$app->fly;

print "\n";
print Dumper($app);
