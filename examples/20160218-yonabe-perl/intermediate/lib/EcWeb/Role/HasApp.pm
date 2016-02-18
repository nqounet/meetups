package EcWeb::Role::HasApp;
use utf8;
use Moo::Role;

use Data::Printer {deparse => 1};
use namespace::clean;


has app => (
    is       => 'ro',
    required => 1,
    weak_ref => 1,
    isa      => sub {
        my $app = shift;
        die '`app` must be `EcWeb` instance' unless ref $app eq 'EcWeb';
    },
    trigger => sub {
        
    },
);

1;
