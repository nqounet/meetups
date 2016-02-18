package EcWeb::Role::AsModel;
use utf8;
use Moo::Role;
with qw(
  EcWeb::Role::HasApp
);
use namespace::clean;

requires qw(name);

has [qw(db table)] => (is => 'lazy');

sub _build_db { shift->app->db }

sub _build_table {
    my $self = shift;

    return $self->db->read($self->name);
}

sub get {
    my $self = shift;

    my $key   = shift;
    my $table = $self->table;
    return $table->{$key};
}

sub set {
    my $self = shift;

    my $key   = shift;
    my $value = shift;
    my $table = $self->table;
    $table->{$key} = $value;
    $self->db->update($self->name => $table);
    return $self;
}

sub delete {
    my $self = shift;

    my $key = shift;
    return $self->delete_all unless defined $key;
    my $table = $self->table;
    delete $table->{$key};
    $self->db->update($self->name => $table);
    return $self;
}

sub delete_all {
    my $self = shift;

    $self->db->delete($self->name);
}

1;
