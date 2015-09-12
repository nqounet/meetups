package MyApp::Role;
use Moo::Role;
has wing => (is => 'rw');
sub fly {print 'flying...'}
1;
