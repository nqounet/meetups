package MyApp::WriteProtect;
use Moo;

has foo => (is => 'rwp');

1;
