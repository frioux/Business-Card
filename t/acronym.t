#!perl
use strict;
use warnings;
use feature ':5.10';
use Test::More 'no_plan';
use Test::Exception;

use FindBin;
use lib "$FindBin::Bin/../lib";

BEGIN { use_ok 'Acronym', 'Acronym Loads' }

dies_ok { Acronym->new(); } 'Dies without required params string and abbreviation';
dies_ok { Acronym->new(format => 'foo'); } 'Dies without required param abbreviation';
dies_ok { Acronym->new(abbreviation => 'F'); } 'Dies without required param string';
lives_ok { Acronym->new(format => 'foo', abbreviation => 'F'); } 'Lives with all required params';

my $acronym = Acronym->new(
   format       => '%s %s %s',
   abbreviation => 'FBB',
   values       => [qw{foo bar baz}],
);

my $GNU = Acronym->new(
   format       => q{%s's %s %s},
   abbreviation => 'GNU',
   values       => [qw{Not Unix}],
);

unshift @{$GNU->values}, $GNU; #recursion woo!

my $GNOME = Acronym->new(
   format       => '%s %s %s %s %s',
   abbreviation => 'GNOME',
   values       => [$GNU, qw{Network Object Model Environment}],
);


my $AOL = Acronym->new(
   format       => '%s %s %s',
   abbreviation => 'AOL',
   values       => [qw{America On Line}],
);

my $GAIM = Acronym->new(
   format       => '%s %s %s %s',
   abbreviation => 'GAIM',
   values       => [$GNOME, $AOL, qw{Instant Messenger}],
);

is $acronym->format, '%s %s %s', 'format set correctly';
is $acronym->abbreviation, 'FBB', 'abbreviation set correctly';
is $acronym->get_value(0), 'foo', 'values are set correctly';
is $acronym->get_value(1), 'bar', 'values are set correctly';
is $acronym->get_value(2), 'baz', 'values are set correctly';
is $acronym->expand(), 'foo bar baz', 'acronym expands correctly';
is $GAIM->expand(3), q{GNU's Not Unix's Not Unix Network Object Model Environment America On Line Instant Messenger}, 'complex expansion works correctly';
