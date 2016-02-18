package EcWeb::Model::Customer;
use utf8;
use Moo;
with qw(
  EcWeb::Role::AsModel
);

sub name {'user'}

1;
