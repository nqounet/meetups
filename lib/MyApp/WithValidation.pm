package MyApp::WithValidation;
use Moo;
has foo => (
    is       => 'rw',
    required => 1,
    isa      => sub {
        my $args = shift;
        die 'foo is foo only' unless $args eq 'foo';
    }
);
1;
