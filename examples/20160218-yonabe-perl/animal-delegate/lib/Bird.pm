package Bird;
use Moo;
extends 'Animal';
with qw(
  Role::CanFly
);

sub lay_egg {'lay eggs.'}

1;
