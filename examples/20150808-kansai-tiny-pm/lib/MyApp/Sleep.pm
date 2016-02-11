package MyApp::Sleep;
use Moo;
has property => (is => 'lazy');
sub _build_property { sleep 5; return 'woke up'; }
sub method          { sleep 5; return 'woke up'; }
1;
