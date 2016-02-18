package EcWeb::Web::Admin;
use utf8;
use Moo;
extends 'EcWeb::Web';
with qw(
  EcWeb::Role::HasApp
  EcWeb::Role::Executable
);
use EcWeb::Model::Admin;
use namespace::clean;

has [qw(id name)] => (is => 'rw');

sub _build_path {'admin'}

has model => (is => 'lazy');

sub _build_model { EcWeb::Model::Admin->new(app => shift->app) }

sub show {'this is admin.'}

sub create {
    my $self = shift;

    my $id   = $self->id;
    my $name = $self->name;
    my $hash = +{
        id   => $id,
        name => $name,
    };
    $self->model->set($id => $hash);
    return $hash;
}

sub read {
    my $self = shift;

    my $id = $self->id;
    return $self->read_all unless defined $id;
    return $self->model->get($id);
}

sub read_all { shift->model->table }

sub delete {
    my $self = shift;

    my $id = $self->id;
    return $self->delete_all unless defined $id;
    return $self->model->delete($id);
}

sub delete_all { shift->model->delete_all }

1;
