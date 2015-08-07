package MyApp::Lazy;
use Moo;

has model => (is => 'lazy');

sub _build_model { Model->new }

1;
