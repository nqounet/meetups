package MyApp;
use strict;
use warnings;

sub new { bless +{}, shift }

sub foo {
    my $self = shift;
    if (@_) { $self->{foo} = shift }
    else    { $self->{foo} }
}

1;
