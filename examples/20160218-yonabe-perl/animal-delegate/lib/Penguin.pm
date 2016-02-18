package Penguin;
use Moo;
extends 'Bird';

sub speak {'...'}

sub fly {die 'can not fly.'}

sub swim {'flying in the water'}

1;
