package EcWeb::Web::Customer;
use utf8;
use Moo;
extends 'EcWeb::Web';
with qw(
  EcWeb::Role::HasApp
  EcWeb::Role::Executable
);
use EcWeb::Model::Customer;
use namespace::clean;


sub _build_path {'user'}

has model => (is => 'lazy');

sub _build_model { EcWeb::Model::Customer->new(app => shift->app) }

sub show {'this is customer.'}

1;
