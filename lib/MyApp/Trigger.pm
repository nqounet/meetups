package MyApp::Trigger;
use Moo;
has foo => (
    is      => 'rw',
    trigger => sub {
        my $self = shift;
        my $args = shift;
        die 'foo is foo only' unless $args eq 'foo';
    }
);
1;
