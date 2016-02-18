package MyApp::Lazy;
use Moo;

has foo => (is => 'lazy');

sub _build_foo {'bar'}

1;
