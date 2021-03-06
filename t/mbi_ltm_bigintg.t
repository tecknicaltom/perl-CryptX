#!/usr/bin/perl -w

use strict;
use Test;

BEGIN {
    $| = 1;
    chdir 't' if -d 't';
    unshift @INC, '../lib';             # for running manually
    unshift @INC, '../blib/arch';       # for running manually
    plan tests => 356;
}

use Math::BigInt::LTM;

# testing of Math::BigInt::LTM

my $C = 'Math::BigInt::LTM';            # pass classname to sub's

# _new and _str
my $x = $C->_new("123");
my $y = $C->_new("321");
ok(ref($x), 'Math::BigInt::LTM');
ok($C->_str($x), 123);
ok($C->_str($y), 321);

###############################################################################
# _set

my $b = $C->_new("123");
$C->_set($b, 12);
ok($C->_str($b), 12);

###############################################################################
# _add, _sub, _mul, _div
ok($C->_str($C->_add($x, $y)), 444);
ok($C->_str($C->_sub($x, $y)), 123);
ok($C->_str($x), 123);
ok($C->_str($y), 321);
ok($C->_str($C->_mul($x, $y)), 39483);
ok($C->_str(scalar $C->_div($x, $y)), 123);

# check that mul/div doesn't change $y
# and returns the same reference, not something new

ok($C->_str($C->_mul($x, $y)), 39483);
ok($C->_str($x), 39483);
ok($C->_str($y), 321);

ok($C->_str(scalar $C->_div($x, $y)), 123);
ok($C->_str($x), 123);
ok($C->_str($y), 321);

$x = $C->_new("39483");
my ($x1, $r1) = $C->_div($x, $y);
ok("$x1", "$x");
$C->_inc($x1);
ok("$x1", "$x");
ok($C->_str($r1), '0');

# check that sub modifies the right argument:

$x = $C->_new("221");
$y = $C->_new("444");

$x = $C->_sub($y, $x, 1);                       # 444 - 221 => 223

ok($C->_str($x), 223);
ok($C->_str($y), 444);

$x = $C->_new("444");
$y = $C->_new("221");

ok($C->_str($C->_sub($x, $y)), 223);    # 444 - 221 => 223

ok($C->_str($x), 223);
ok($C->_str($y), 221);

###############################################################################

$x = $C->_new("39483"); # reset
$y = $C->_new("321");   # reset

my $z = $C->_new("2");
ok($C->_str($C->_add($x, $z)), 39485);
my ($re, $rr) = $C->_div($x, $y);

ok($C->_str($re), 123);
ok($C->_str($rr), 2);

##############################################################################
# is_zero, _is_one, _one, _zero

ok($C->_is_zero($x)||0, 0);
ok($C->_is_one($x)||0, 0);

ok($C->_str($C->_zero()), "0");
ok($C->_str($C->_one()), "1");

##############################################################################
# _two() and _ten()

ok($C->_str($C->_two()), "2");
ok($C->_str($C->_ten()), "10");
ok($C->_is_ten($C->_two()), 0);
ok($C->_is_two($C->_two()), 1);
ok($C->_is_ten($C->_ten()), 1);
ok($C->_is_two($C->_ten()), 0);

ok($C->_is_one($C->_one()), 1);
ok($C->_is_one($C->_two()), 0);
ok($C->_is_one($C->_ten()), 0);

ok($C->_is_one($C->_zero()) || 0, 0);

ok($C->_is_zero($C->_zero()), 1);

ok($C->_is_zero($C->_one()) || 0, 0);

###############################################################################
# is_odd, is_even

ok($C->_is_odd($C->_one()), 1);
ok($C->_is_odd($C->_zero())||0, 0);
ok($C->_is_even($C->_one()) || 0, 0);
ok($C->_is_even($C->_zero()), 1);

sub _check_len {
    my ($y, $m) = @_;

    my $len = length($y);
    $x = $C->_new($y);
    if ($m eq '_len') {
        ok($C->$m($x), $len);
    } else {
        # equal or at most one bigger
        print STDERR "# $len $y". $C->$m($x). "\n" unless
          ok($len >= $C->$m($x), 1);
    }
}

# _len and _alen
for my $m (qw/_len _alen/) {
    _check_len("1", $m);
    _check_len("12", $m);
    _check_len("123", $m);
    _check_len("1234", $m);
    _check_len("12345", $m);
    _check_len("123456", $m);
    _check_len("1234567", $m);
    _check_len("12345678", $m);
    _check_len("123456789", $m);
    _check_len("1234567890", $m);
    _check_len("7", $m);
    _check_len("8", $m);
    _check_len("9", $m);
    _check_len("10", $m);
    _check_len("11", $m);
    _check_len("21", $m);
    _check_len("321", $m);
    _check_len("320", $m);
    _check_len("4321", $m);
    _check_len("54321", $m);
    _check_len("654321", $m);
    _check_len("7654321", $m);
    _check_len("7654321", $m);
    _check_len("87654321", $m);
    _check_len("987654321", $m);
    _check_len("9876543219876543210", $m);
    _check_len("1234567890" x 10, $m);
    _check_len("1234567890" x 100, $m);

    for (my $i = 1; $i < 9; $i++) {
        my $a = "$i" . '0' x ($i-1);
        _check_len($a, $m);
    }
}

###############################################################################
# _digit

$x = $C->_new("123456789");
ok($C->_digit($x, 0), 9);
ok($C->_digit($x, 1), 8);
ok($C->_digit($x, 2), 7);
ok($C->_digit($x, -1), 1);
ok($C->_digit($x, -2), 2);
ok($C->_digit($x, -3), 3);

###############################################################################
# _copy

foreach (qw/ 1 12 123 1234 12345 123456 1234567 12345678 123456789/) {
    $x = $C->_new("$_");
    ok($C->_str($C->_copy($x)), "$_");
    ok($C->_str($x), "$_");     # did _copy destroy original x?
}

###############################################################################
# _zeros

$x = $C->_new("1256000000");
ok($C->_zeros($x), 6);

$x = $C->_new("152");
ok($C->_zeros($x), 0);

$x = $C->_new("123000");
ok($C->_zeros($x), 3);

$x = $C->_new("123001");
ok($C->_zeros($x), 0);

$x = $C->_new("1");
ok($C->_zeros($x), 0);

$x = $C->_new("8");
ok($C->_zeros($x), 0);

$x = $C->_new("10");
ok($C->_zeros($x), 1);

$x = $C->_new("11");
ok($C->_zeros($x), 0);

$x = $C->_new("0");
ok($C->_zeros($x), 0);

###############################################################################
# _lsft, _rsft

$x = $C->_new("10");
$y = $C->_new("3");
ok($C->_str($C->_lsft($x, $y, 10)), 10000);
$x = $C->_new("20");
$y = $C->_new("3");
ok($C->_str($C->_lsft($x, $y, 10)), 20000);

$x = $C->_new("128");
$y = $C->_new("4");
ok($C->_str($C->_lsft($x, $y, 2)), 128 << 4);

$x = $C->_new("1000");
$y = $C->_new("3");
ok($C->_str($C->_rsft($x, $y, 10)), 1);
$x = $C->_new("20000");
$y = $C->_new("3");
ok($C->_str($C->_rsft($x, $y, 10)), 20);
$x = $C->_new("256");
$y = $C->_new("4");
ok($C->_str($C->_rsft($x, $y, 2)), 256 >> 4);

$x = $C->_new("6411906467305339182857313397200584952398");
$y = $C->_new("45");
ok($C->_str($C->_rsft($x, $y, 10)), 0);

###############################################################################
# _acmp

$x = $C->_new("123456789");
$y = $C->_new("987654321");
ok($C->_acmp($x, $y), -1);
ok($C->_acmp($y, $x), 1);
ok($C->_acmp($x, $x), 0);
ok($C->_acmp($y, $y), 0);
$x = $C->_new("12");
$y = $C->_new("12");
ok($C->_acmp($x, $y), 0);
$x = $C->_new("21");
ok($C->_acmp($x, $y), 1);
ok($C->_acmp($y, $x), -1);
$x = $C->_new("123456789");
$y = $C->_new("1987654321");
ok($C->_acmp($x, $y), -1);
ok($C->_acmp($y, $x), +1);

$x = $C->_new("1234567890123456789");
$y = $C->_new("987654321012345678");
ok($C->_acmp($x, $y), 1);
ok($C->_acmp($y, $x), -1);
ok($C->_acmp($x, $x), 0);
ok($C->_acmp($y, $y), 0);

$x = $C->_new("1234");
$y = $C->_new("987654321012345678");
ok($C->_acmp($x, $y), -1);
ok($C->_acmp($y, $x), 1);
ok($C->_acmp($x, $x), 0);
ok($C->_acmp($y, $y), 0);

###############################################################################
# _modinv

$x = $C->_new("8");
$y = $C->_new("5033");
my ($xmod, $sign) = $C->_modinv($x, $y);
ok($C->_str($xmod), '4404');
           # (4404 * 8) % 5033 = 1
ok($sign, '+');

###############################################################################
# _div

$x = $C->_new("3333");
$y = $C->_new("1111");
ok($C->_str(scalar $C->_div($x, $y)), 3);
$x = $C->_new("33333");
$y = $C->_new("1111");
($x, $y) = $C->_div($x, $y);
ok($C->_str($x), 30);
ok($C->_str($y), 3);
$x = $C->_new("123");
$y = $C->_new("1111");
($x, $y) = $C->_div($x, $y);
ok($C->_str($x), 0);
ok($C->_str($y), 123);

###############################################################################
# _num

foreach (qw/1 12 123 1234 12345 1234567 12345678 123456789 1234567890/) {
    $x = $C->_new("$_");
    ok(ref($x)||'', 'Math::BigInt::LTM');
    ok($C->_str($x), "$_");
    $x = $C->_num($x);
    ok(ref($x)||'', '');
    ok($x, $_);
}

###############################################################################
# _sqrt

$x = $C->_new("144");
ok($C->_str($C->_sqrt($x)), '12');
$x = $C->_new("144000000000000");
ok($C->_str($C->_sqrt($x)), '12000000');

###############################################################################
# _root

$x = $C->_new("81");
my $n = $C->_new("3");
ok($C->_str($C->_root($x, $n)), '4');   # 4*4*4 = 64, 5*5*5 = 125

$x = $C->_new("81");
$n = $C->_new("4");
ok($C->_str($C->_root($x, $n)), '3');   # 3*3*3*3 == 81

###############################################################################
# _pow (and _root)

$x = $C->_new("0");
$n = $C->_new("3");
ok($C->_str($C->_pow($x, $n)), 0);      # 0 ** y => 0

$x = $C->_new("3");
$n = $C->_new("0");
ok($C->_str($C->_pow($x, $n)), 1);      # x ** 0 => 1

$x = $C->_new("1");
$n = $C->_new("3");
ok($C->_str($C->_pow($x, $n)), 1);      # 1 ** y => 1

$x = $C->_new("5");
$n = $C->_new("1");
ok($C->_str($C->_pow($x, $n)), 5);      # x ** 1 => x

$x = $C->_new("81");
$n = $C->_new("3");

ok($C->_str($C->_pow($x, $n)), 81 ** 3);    # 81 ** 3 == 531441

ok($C->_str($C->_root($x, $n)), 81);

$x = $C->_new("81");
ok($C->_str($C->_pow($x, $n)), 81 ** 3);
ok($C->_str($C->_pow($x, $n)), '150094635296999121');   # 531441 ** 3 ==

ok($C->_str($C->_root($x, $n)), '531441');
ok($C->_str($C->_root($x, $n)), '81');

$x = $C->_new("81");
$n = $C->_new("14");
ok($C->_str($C->_pow($x, $n)), '523347633027360537213511521');
ok($C->_str($C->_root($x, $n)), '81');

$x = $C->_new("523347633027360537213511520");
ok($C->_str($C->_root($x, $n)), '80');

$x = $C->_new("523347633027360537213511522");
ok($C->_str($C->_root($x, $n)), '81');

my $res = [ qw/ 9 31 99 316 999 3162 9999/ ];

# 99 ** 2 = 9801, 999 ** 2 = 998001 etc
for my $i (2 .. 9) {
    $x = '9' x $i;
    $x = $C->_new($x);
    $n = $C->_new("2");
    my $rc = '9' x ($i-1). '8' . '0' x ($i-1) . '1';
    print "# _pow(", '9' x $i, ", 2) \n"
      unless ok($C->_str($C->_pow($x, $n)), $rc);

    if ($i <= 7) {
        $x = '9' x $i;
        $x = $C->_new($x);
        $n = '9' x $i;
        $n = $C->_new($n);
        print "# _root(", '9' x $i, ", ", 9 x $i, ") \n"
          unless ok($C->_str($C->_root($x, $n)), '1');

        $x = '9' x $i;
        $x = $C->_new($x);
        $n = $C->_new("2");
        print "# _root(", '9' x $i, ", ", 9 x $i, ") \n"
          unless ok($C->_str($C->_root($x, $n)), $res->[$i-2]);
    }
}

##############################################################################
# _fac

$x = $C->_new("0");  ok($C->_str($C->_fac($x)), '1');
$x = $C->_new("1");  ok($C->_str($C->_fac($x)), '1');
$x = $C->_new("2");  ok($C->_str($C->_fac($x)), '2');
$x = $C->_new("3");  ok($C->_str($C->_fac($x)), '6');
$x = $C->_new("4");  ok($C->_str($C->_fac($x)), '24');
$x = $C->_new("5");  ok($C->_str($C->_fac($x)), '120');
$x = $C->_new("10"); ok($C->_str($C->_fac($x)), '3628800');
$x = $C->_new("11"); ok($C->_str($C->_fac($x)), '39916800');
$x = $C->_new("12"); ok($C->_str($C->_fac($x)), '479001600');
$x = $C->_new("13"); ok($C->_str($C->_fac($x)), '6227020800');

# test that _fac modifes $x in place for small arguments

$x = $C->_new("3");  $C->_fac($x); ok($C->_str($x), '6');
$x = $C->_new("13"); $C->_fac($x); ok($C->_str($x), '6227020800');

##############################################################################
# _inc and _dec

foreach (qw/1 11 121 1231 12341 1234561 12345671 123456781 1234567891/) {
    $x = $C->_new("$_");
    $C->_inc($x);
    print "# \$x = ", $C->_str($x), "\n"
      unless ok($C->_str($x), substr($_, 0, length($_)-1) . '2');
    $C->_dec($x);
    ok($C->_str($x), $_);
}

foreach (qw/19 119 1219 12319 1234519 12345619 123456719 1234567819/) {
    $x = $C->_new("$_");
    $C->_inc($x);
    print "# \$x = ", $C->_str($x), "\n"
      unless ok($C->_str($x), substr($_, 0, length($_)-2) . '20');
    $C->_dec($x);
    ok($C->_str($x), $_);
}

foreach (qw/999 9999 99999 9999999 99999999 999999999 9999999999 99999999999/) {
    $x = $C->_new("$_");
    $C->_inc($x);
    print "# \$x = ", $C->_str($x), "\n"
      unless ok($C->_str($x), '1' . '0' x (length($_)));
    $C->_dec($x);
    ok($C->_str($x), $_);
}

$x = $C->_new("1000");
$C->_inc($x);
ok($C->_str($x), '1001');
$C->_dec($x);
ok($C->_str($x), '1000');

###############################################################################
# _log_int (test handling of plain scalar as base, bug up to v1.17)

$x = $C->_new("81");

my ($r, $exact) = $C->_log_int($x, $C->_new("3"));
ok($C->_str($r), '4');
ok($C->_str($x), '4');
ok($exact, 1);

$x = $C->_new("81");

($r, $exact) = $C->_log_int($x, 3);
ok($C->_str($r), '4');
ok($C->_str($x), '4');
ok($exact, 1);

###############################################################################
# _mod

$x = $C->_new("1000");
$y = $C->_new("3");
ok($C->_str(scalar $C->_mod($x, $y)), 1);
$x = $C->_new("1000");
$y = $C->_new("2");
ok($C->_str(scalar $C->_mod($x, $y)), 0);

###############################################################################
# _and, _or, _xor

$x = $C->_new("5");
$y = $C->_new("2");
ok($C->_str(scalar $C->_xor($x, $y)), 7);
$x = $C->_new("5");
$y = $C->_new("2");
ok($C->_str(scalar $C->_or($x, $y)), 7);
$x = $C->_new("5");
$y = $C->_new("3");
ok($C->_str(scalar $C->_and($x, $y)), 1);

###############################################################################
# _from_hex, _from_bin

ok($C->_str($C->_from_hex("0xFf")), 255);
ok($C->_str($C->_from_bin("0b10101011")), 160+11);

###############################################################################
# _as_hex, _as_bin

ok($C->_str($C->_from_hex($C->_as_hex($C->_new("128")))), 128);
ok($C->_str($C->_from_bin($C->_as_bin($C->_new("128")))), 128);
ok($C->_str($C->_from_hex($C->_as_hex($C->_new("0")))), 0);
ok($C->_str($C->_from_bin($C->_as_bin($C->_new("0")))), 0);
ok($C->_as_hex($C->_new("0")), '0x0');
ok($C->_as_bin($C->_new("0")), '0b0');
ok($C->_as_hex($C->_new("12")), '0xc');
ok($C->_as_bin($C->_new("12")), '0b1100');

###############################################################################
# _from_oct

$x = $C->_from_oct("001");      ok($C->_str($x), '1');
$x = $C->_from_oct("07");       ok($C->_str($x), '7');
$x = $C->_from_oct("077");      ok($C->_str($x), '63');
$x = $C->_from_oct("07654321"); ok($C->_str($x), '2054353');

###############################################################################
# _as_oct
$x = $C->_new("2054353"); ok($C->_as_oct($x), '07654321');
$x = $C->_new("63");      ok($C->_as_oct($x), '077');
$x = $C->_new("0");       ok($C->_as_oct($x), '00');

###############################################################################
# _1ex

ok($C->_str($C->_1ex(0)), "1");
ok($C->_str($C->_1ex(1)), "10");
ok($C->_str($C->_1ex(2)), "100");
ok($C->_str($C->_1ex(12)), "1000000000000");
ok($C->_str($C->_1ex(16)), "10000000000000000");

###############################################################################
# _check

$x = $C->_new("123456789");
ok($C->_check($x), 0);
ok($C->_check(123), '123 is not a reference to Math::BigInt::LTM');

# done

1;
