package EcWeb::Model::Customer;
use utf8;
use Moo;
with qw(
  EcWeb::Role::AsModel
);
use namespace::clean;


sub name {'user'}

1;
