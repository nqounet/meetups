package MyApp::Accessor;
use Moo;

# extends 'MyApp';
with 'MyApp::Role';
has [qw(x y)] => (
    is        => 'rw',
    clearer   => 1,
    predicate => 1
);

sub move_up {
    my $self = shift;
    my $y    = $self->y();
    $self->y($y - 1);
    $self;
}
1;
