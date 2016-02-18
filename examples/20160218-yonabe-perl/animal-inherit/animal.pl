use strict;
use warnings;
use lib 'lib';
use Dog;
use Cat;
use Pigeon;
use Bat;
use Penguin;


my $dog = Dog->new;
$dog->speak;

my $cat = Cat->new;
$cat->speak;

my $pigeon = Pigeon->new;
$pigeon->speak;

my $bat = Bat->new;
$bat->speak;

my $penguin = Penguin->new;
$penguin->speak;
