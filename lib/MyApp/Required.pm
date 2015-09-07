package MyApp::Required;
use Moo;
has foo => (
    is       => 'rw',
    required => 1
);
1;
