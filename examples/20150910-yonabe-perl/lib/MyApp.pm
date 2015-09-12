package MyApp;
use strict;
use warnings;

sub new {
    my $class = shift;
    my $object = bless(+{}, $class);
    return $object;
}

sub foo {
    my $self = shift;
    if (@_) {
        $self->{foo} = shift;
    }
    return $self->{foo};
}
1;
