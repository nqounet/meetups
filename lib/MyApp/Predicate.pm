package MyApp::Predicate;
use Moo;
has [qw(foo bar)] => (
    is        => 'lazy',
    predicate => 1
);
sub _build_foo { shift->bar }
sub _build_bar { shift->foo }
1;
