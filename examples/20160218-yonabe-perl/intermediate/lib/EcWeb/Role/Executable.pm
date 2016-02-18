package EcWeb::Role::Executable;
use utf8;
use Moo::Role;

requires qw(show);

has method => (
    is      => 'ro',
    default => sub {'show'}
);

sub execute {
    my $self = shift;

    my $method = $self->method;
    my $result = $self->$method();
    return $result;
}

1;
