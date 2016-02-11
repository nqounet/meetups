package MyApp::Isa;
use Moo;
has foo => (
    is  => 'rw',
    isa => sub {
        my $args = shift;
        die 'foo is foo only' unless $args eq 'foo';
    }
);
1;
