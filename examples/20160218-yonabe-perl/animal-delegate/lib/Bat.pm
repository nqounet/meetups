package Bat;
use Moo;
extends 'Mammal';
with qw(
  Role::CanFly
);

sub speak {'screech'}

1;
