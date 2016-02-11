package MyApp::Predicate;
use Moo;
has [qw(foo bar)] => (
    is        => 'lazy',
    predicate => 1
);

sub _build_foo {
    my $self = shift;
    return $self->bar if $self->has_bar;
    say '`bar` is mandatory.';
}

sub _build_bar {
    my $self = shift;
    $self->foo if $self->has_foo;
    say '`foo` is mandatory.';
}
1;
