package EcWeb;
use utf8;
use Moo;
use EcWeb::Database;
use EcWeb::Web::Root;
use EcWeb::Web::Admin;
use EcWeb::Web::Customer;

use Data::Printer {deparse => 1};

has name => (
    is      => 'ro',
    default => 'EcWeb',    # OK
);

has default_mode => (
    is      => 'ro',
    default => sub {'root'},    # Recommend
);

has db => (is => 'lazy');

has config => (
    is      => 'rw',
    default => sub {
        +{
            base_url      => 'http://ec-web.jp',
            data_dir      => 'var',
            data_filename => 'data.json',
        };
    },
);

sub _build_db { EcWeb::Database->new(app => shift) }

sub dispatch {
    my $self = shift;

    my %args  = @_;
    my $mode  = delete $args{mode} || $self->default_mode;
    my $class = qq{EcWeb::Web::} . ucfirst $mode;
    my $route = $class->new(
        %args,
        app => $self,
    );

    $route;
}

sub update_base_url {
    my $self = shift;

    my $url    = shift;
    my $config = $self->config;
    $config->{base_url} = $url;
    $self->config($config);

    $self;
}

1;
