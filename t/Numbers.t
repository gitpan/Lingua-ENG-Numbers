#!/usr/bin/env perl
# For Emacs: -*- mode:cperl; mode:folding -*-
#
# Copyright (C) PetaMem, s.r.o. 2009-present
#

# {{{ use block

use strict;
use warnings;
use utf8;

use Test::More;

# }}}

# {{{ basic tests

my $tests;

BEGIN {
    use_ok('Lingua::ENG::Numbers');
    $tests++;
}

use Lingua::ENG::Numbers           qw(American);

# }}}

# {{{ parse

my $numbers = Lingua::ENG::Numbers->new;

$numbers->parse(1234567890);
is($numbers->get_string, 'One Billion, Two-Hundred Thirty-Four Million, Five-Hundred Sixty-Seven Thousand, Eight-Hundred Ninety', '1 234 567 890 in English');
$tests++;

$numbers = Lingua::ENG::Numbers->new;
$numbers->parse(10 ** 10);
is($numbers->get_string, 'Ten Billion, Zero', '10^10 in English');
$tests++;

$numbers = Lingua::ENG::Numbers->new;
$numbers->parse(10 ** 100);
is($numbers->get_string, '', 'out of bounds');
$tests++;

$numbers = Lingua::ENG::Numbers->new;
$numbers->parse();
is($numbers->get_string, '', 'undef args');
$tests++;

# }}}

done_testing($tests);

__END__
