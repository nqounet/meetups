package EcWeb::Database;
use utf8;
use Moo;
with qw(
  EcWeb::Role::HasApp
);
use Path::Tiny qw(path);
use JSON;

has [qw(datafile encoder vars)] => (is => 'lazy');

sub _build_datafile {
    my $self = shift;

    my $config = $self->app->config;
    my $path = path($config->{data_dir}, $config->{data_filename});
    $path->parent->mkpath;
    $path->touch;
    return $path;
}

sub _build_encoder { JSON->new->utf8 }

sub _build_vars {
    my $self = shift;

    my $json = $self->datafile->slurp_utf8 || '{}';
    my $data = $self->encoder->decode($json);
    return $data;
}

sub create {
    my $self = shift;

    my $key   = shift;
    my $value = shift;
    $self->vars->{$key} = $value;
    $self->_save;
}

sub read {
    my $self = shift;

    my $key = shift;
    $self->vars->{$key};
}

sub update { shift->create(@_) }

sub delete {
    my $self = shift;

    my $key = shift;
    delete $self->vars->{$key};
    $self->_save;
}

sub _save {
    my $self = shift;

    my $data = $self->vars;
    my $json = $self->encoder->encode($data);
    $self->datafile->spew_utf8($json);
}

1;
