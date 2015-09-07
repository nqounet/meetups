# Minimalist Object Orientation
###### Nobutaka Wakabayashi
###### 2015-09-10 YonabePerl

---

# Who am I?
- <http://www.nishimiyahara.net>
- <https://github.com/nqounet>

---

# Agenda
- why use an OOP?
- bless
- use Moo;
- bless VS Moo
- Enjoy Coding

---

# why use an OOP?

___

<blockquote cite="http://inventwithpython.com/blog/2014/12/02/why-is-object-oriented-programming-useful-with-an-role-playing-game-example/" title="Why is Object-Oriented Programming Useful? (With a Role Playing Game Example) | The “Invent with Python” Blog" class="blockquote"><p>There are two key non-OOP concepts to understand right off the bat:</p>
<ul><li>Duplicate code is a Bad Thing.</li><li>Code will always be changed.</li></ul></blockquote><div class="cite">[<cite><a href="http://inventwithpython.com/blog/2014/12/02/why-is-object-oriented-programming-useful-with-an-role-playing-game-example/">Why is Object-Oriented Programming Useful? (With a Role Playing Game Example) | The “Invent with Python” Blog</a></cite>]</div>

___

- (English) <http://www.codeproject.com/Questions/285934/why-we-use-object-oriented-programming>
- (Japanese) <http://tdak.hateblo.jp/entry/20140406/1396773476>
- (Japanese) <http://windymelt.hatenablog.com/entry/2015/04/16/212353>

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
$app->foo('bar');
print $app->foo;    # bar
```

---

# use Moo;

___

###### Accessor

```perl
package MyApp::Accessor;
use Moo;
has foo => (is => 'rw');
1;
```

___

###### Accessor::Multi

```perl
package MyApp::Accessor::Multi;
use Moo;
has [qw(foo bar baz)] => (is => 'rw');
1;
```

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

```perl
use MyApp::ReadOnly;
my $app = MyApp::ReadOnly->new(foo => 'bar');
print $app->foo;    # bar
```

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
```perl
use MyApp::WriteProtect;
my $app = MyApp::WriteProtect->new;
$app->_set_foo('bar');
print $app->foo;    # bar
```

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
my $cond  = +{name => 'nqounet'};
my $row   = $app->model->single('users', $cond);
```

---

## bless VS Moo

___

<blockquote cite="http://inventwithpython.com/blog/2014/12/02/why-is-object-oriented-programming-useful-with-an-role-playing-game-example/" title="Why is Object-Oriented Programming Useful? (With a Role Playing Game Example) | The “Invent with Python” Blog" class="blockquote"><p>There are two key non-OOP concepts to understand right off the bat:</p>
<ul><li>Duplicate code is a Bad Thing.</li><li>Code will always be changed.</li></ul></blockquote><div class="cite">[<cite><a href="http://inventwithpython.com/blog/2014/12/02/why-is-object-oriented-programming-useful-with-an-role-playing-game-example/">Why is Object-Oriented Programming Useful? (With a Role Playing Game Example) | The “Invent with Python” Blog</a></cite>]</div>

___

###### bless VS Moo
- property (attribute)
- method (function)

___

###### bless VS Moo
- property -> ``has``
- method -> ``sub``

___

###### bless VS Moo
```perl
package MyApp::Sleep;
use Moo;
has property => (is => 'lazy');
sub _build_property { sleep 5; return 'woke up'; }
sub method          { sleep 5; return 'woke up'; }
1;
```

___

###### bless VS Moo
```perl
use MyApp::Sleep;
my $app = MyApp::Sleep->new;
print $app->method;      # 5sec
print $app->method;      # 5sec
print $app->property;    # 5sec
print $app->property;    # 0sec
```

---

## Enjoy Coding

---

### extends

---

### with

---

### validation

___

###### validation
```perl
package MyApp::Required;
use Moo;
has foo => (
    is       => 'rw',
    required => 1
);
1;
```

___

###### validation
```perl
package MyApp::Isa;
use Moo;
has foo => (
    is  => 'rw',
    isa => sub {
        my $args = shift;
        die 'foo is foo only' unless $args eq 'foo';
    }
);
1;
```

---

### hook

___

###### hook
```perl
package MyApp::Trigger;
use Moo;
has foo => (
    is      => 'rw',
    trigger => sub {
        my $self = shift;
        my $args = shift;
        die 'foo is foo only' unless $args eq 'foo';
    }
);
1;
```

___

###### hook
- before
- after
- around

---

# Questions?

---

# Thanks!
<https://twitter.com/nqounet>
