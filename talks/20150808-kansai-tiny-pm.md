# Why do you not use the Moo?
###### Nobutaka Wakabayashi
###### use Kansai::Tiny v0.0.1

---

# Who am I?
- <http://www.nishimiyahara.net>
- <https://github.com/nqounet>

---

# Agenda
- bless
- use Moo;
- Accessor
- ReadOnly
- WriteProtect
- Lazy
- Predicate
- use Moo;

---

# bless

___

###### bless

```perl
package MyApp;
use strict;
use warnings;

sub new { bless +{}, shift }

sub foo {
    my $self = shift;
    if (@_) { $self->{foo} = shift }
    else    { $self->{foo} }
}

1;
```

___

###### bless

```perl
use MyApp;

my $app = MyApp->new;
print $app->foo;    # Use of uninitialized value
$app->foo('bar');
print $app->foo;    # bar
```

---

# use Moo;

---

## Accessor
___

###### Accessor

```perl
package MyApp::Accessor;
use Moo;

has foo => (is => 'rw');

1;
```

___

###### Accessor

```perl
use MyApp::Accessor;

my $app = MyApp::Accessor->new;
print $app->foo;    # Use of uninitialized value
$app->foo('bar');
print $app->foo;    # bar
```

___

## Accessor::Multi

___

###### Accessor::Multi

```perl
package MyApp::Accessor::Multi;
use Moo;

has [qw(foo bar baz)] => (is => 'rw');

1;
```

---

## ReadOnly

___

###### ReadOnly

```perl
package MyApp::ReadOnly;
use Moo;

has foo => (is => 'ro');

1;
```

___

###### Readonly
<!-- .slide: data-background="#c70000" -->

```perl
use MyApp::ReadOnly;

my $app = MyApp::ReadOnly->new;
$app->foo('bar');    # foo is a read-only accessor
print $app->foo;
```

___

###### Readonly

```perl
use MyApp::ReadOnly;

my $app = MyApp::ReadOnly->new(foo => 'bar');
print $app->foo;    # bar
```

---

## WriteProtect

___

###### WriteProtect

```perl
package MyApp::WriteProtect;
use Moo;

has foo => (is => 'rwp');

1;
```

___

###### WriteProtect
<!-- .slide: data-background="#c70000" -->

```perl
use MyApp::WriteProtect;

my $app = MyApp::WriteProtect->new;
$app->foo('bar');    # foo is a read-only accessor
print $app->foo;
```

___

###### WriteProtect
```perl
use MyApp::WriteProtect;

my $app = MyApp::WriteProtect->new;
$app->_set_foo('bar');
print $app->foo;    # bar
```

---

## Lazy (readonly)

___

######  Lazy (readonly)
```perl
package MyApp::Lazy;
use Moo;

has model => (is => 'lazy');

sub _build_model { Model->new }

1;
```

___

######  Lazy (readonly)

```perl
use MyApp::Lazy;

my $app   = MyApp::Lazy->new;
my $model = $app->model;
my $cond  = +{name => 'nqounet'};
my $row   = $model->single('users', $cond);
```

---

## Predicate

___

###### Predicate

```perl
package MyApp::Predicate;
use Moo;
has [qw(foo bar)] => (
    is        => 'lazy',
    predicate => 1
);
sub _build_foo { shift->bar }
sub _build_bar { shift->foo }
1;
```

___

###### Predicate
<!-- .slide: data-background="#c70000" -->

```perl
use MyApp::Predicate;

my $app = MyApp::Predicate->new;
print $app->foo;    # Deep recursion on subroutine ...
```

___

###### Predicate
<!-- .slide: data-background="#c7c700" -->

```perl
use MyApp::Predicate;

my $app = MyApp::Predicate->new;
if ($app->has_bar) {
    print $app->foo;
}
```

___

###### Predicate

```perl
use MyApp::Predicate;

my $app = MyApp::Predicate->new(bar => 'bar');
if ($app->has_bar) {
    print $app->foo;
}
```

---

## use Moo;
- ``has`` - property
- ``sub`` - method

___

###### use Moo;
```perl
package MyApp::Sleep;
use Moo;
has property => (is => 'lazy');
sub _build_property { sleep 5; return 'woke up'; }
sub method          { sleep 5; return 'woke up'; }
1;
```
___

###### use Moo;
```perl
use MyApp::Sleep;

my $app = MyApp::Sleep->new;
print $app->method;      # 5sec
print $app->method;      # 5sec
print $app->property;    # 5sec
print $app->property;    # 0sec
```

---

# Questions?

---

# Thanks!
https://twitter.com/nqounet