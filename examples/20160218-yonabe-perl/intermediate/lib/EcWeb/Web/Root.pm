package EcWeb::Web::Root;
use utf8;
use Moo;
extends 'EcWeb::Web';
with qw(
  EcWeb::Role::HasApp
  EcWeb::Role::Executable
);
use Encode;
use namespace::clean;


has model => (is => 'rw');

sub show {'this is root.'}

1;
