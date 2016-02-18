# Intermediate Moo
###### Nobutaka Wakabayashi
###### 2016-02-18 YonabePerl

---

# Who am I?
- <http://www.nishimiyahara.net>
- <https://github.com/nqounet>

---

# Agenda
- Why not use Moo?
- Enjoy Coding

---

# Why not use Moo?

___

###### define

```
package MyApp;
use Moo;
has foo => (is => 'rw');
1;
```

___

###### use

```
use MyApp;

my $app = MyApp->new;
$app->foo('bar');
print $app->foo;
```

---

# Enjoy Coding

---

# Questions?

---

# Thanks!
<https://twitter.com/nqounet>
