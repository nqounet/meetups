use strict;
use warnings;
use lib 'lib';
use Dog;
use Cat;
use Pigeon;
use Bat;
use Penguin;
use Data::Printer {deparse => 1};


my $dog = Dog->new;
p $dog->speak;
p $dog;
p $dog->run;
# $dog->fly;

my $cat = Cat->new;
p $cat->speak;
p $cat;
# $cat->fly;

my $pigeon = Pigeon->new;
p $pigeon->speak;
p $pigeon;
p $pigeon->fly;

my $bat = Bat->new;
p $bat->speak;
p $bat;
p $bat->fly;

my $penguin = Penguin->new;
p $penguin->speak;
p $penguin;
# $penguin->fly;
p $penguin->swim;
