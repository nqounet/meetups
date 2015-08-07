package MyApp::Accessor::Multi;
use Moo;

has [qw(foo bar baz)] => (is => 'rw');

1;
