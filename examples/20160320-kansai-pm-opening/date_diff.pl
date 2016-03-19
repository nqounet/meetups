#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature 'say';
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1};
use Time::Moment;

my $kansaipm15 = Time::Moment->from_string('20130223T00Z');
my $kansaipm16 = Time::Moment->from_string('20160320T00Z');
say $kansaipm16->delta_years($kansaipm15);
say $kansaipm16->delta_days($kansaipm15);
say $kansaipm16->delta_hours($kansaipm15);
say $kansaipm16->delta_seconds($kansaipm15);
