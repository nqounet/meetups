package EcWeb::Web;
use utf8;
use Moo;
with qw(
  EcWeb::Role::HasApp
);

has [qw(url path)] => (is => 'lazy');

sub _build_path {''}

sub _build_url {
    my $self = shift;

    join '/', $self->app->config->{base_url}, $self->path;
}

1;
