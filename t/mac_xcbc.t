### BEWARE - GENERATED FILE, DO NOT EDIT MANUALLY!

use strict;
use warnings;

use Test::More;

use Crypt::Mac::XCBC qw( xcbc xcbc_hex xcbc_b64 xcbc_b64u );

is( unpack('H*', Crypt::Mac::XCBC->new('AES','1234567890123456')->add("")->mac), '16f66d6127b7fc067e623d157a86b822', 'XCBC/oo+raw/1');
is( Crypt::Mac::XCBC->new('AES','1234567890123456')->add("")->hexmac, '16f66d6127b7fc067e623d157a86b822', 'XCBC/oo+hex/1');
is( unpack('H*', xcbc('AES','1234567890123456',"")), '16f66d6127b7fc067e623d157a86b822', 'XCBC/func+raw/1');
is( xcbc_hex('AES','1234567890123456',""), '16f66d6127b7fc067e623d157a86b822', 'XCBC/func+hex/1');
is( xcbc_b64('AES','1234567890123456',""), 'FvZtYSe3/AZ+Yj0Veoa4Ig==', 'XCBC/func+b64/1');
is( xcbc_b64u('AES','1234567890123456',""), 'FvZtYSe3_AZ-Yj0Veoa4Ig', 'XCBC/func+b64u/1');
is( unpack('H*', Crypt::Mac::XCBC->new('AES','12345678901234561234567890123456')->add("")->mac), '744807bdb50aca24685b6bc78161c229', 'XCBC/oo+raw/2');
is( Crypt::Mac::XCBC->new('AES','12345678901234561234567890123456')->add("")->hexmac, '744807bdb50aca24685b6bc78161c229', 'XCBC/oo+hex/2');
is( unpack('H*', xcbc('AES','12345678901234561234567890123456',"")), '744807bdb50aca24685b6bc78161c229', 'XCBC/func+raw/2');
is( xcbc_hex('AES','12345678901234561234567890123456',""), '744807bdb50aca24685b6bc78161c229', 'XCBC/func+hex/2');
is( xcbc_b64('AES','12345678901234561234567890123456',""), 'dEgHvbUKyiRoW2vHgWHCKQ==', 'XCBC/func+b64/2');
is( xcbc_b64u('AES','12345678901234561234567890123456',""), 'dEgHvbUKyiRoW2vHgWHCKQ', 'XCBC/func+b64u/2');
is( unpack('H*', Crypt::Mac::XCBC->new('Blowfish','1234567890123456')->add("")->mac), '9ef018b3c33f6f35', 'XCBC/oo+raw/3');
is( Crypt::Mac::XCBC->new('Blowfish','1234567890123456')->add("")->hexmac, '9ef018b3c33f6f35', 'XCBC/oo+hex/3');
is( unpack('H*', xcbc('Blowfish','1234567890123456',"")), '9ef018b3c33f6f35', 'XCBC/func+raw/3');
is( xcbc_hex('Blowfish','1234567890123456',""), '9ef018b3c33f6f35', 'XCBC/func+hex/3');
is( xcbc_b64('Blowfish','1234567890123456',""), 'nvAYs8M/bzU=', 'XCBC/func+b64/3');
is( xcbc_b64u('Blowfish','1234567890123456',""), 'nvAYs8M_bzU', 'XCBC/func+b64u/3');
is( unpack('H*', Crypt::Mac::XCBC->new('Blowfish','12345678901234561234567890123456')->add("")->mac), '9ef018b3c33f6f35', 'XCBC/oo+raw/4');
is( Crypt::Mac::XCBC->new('Blowfish','12345678901234561234567890123456')->add("")->hexmac, '9ef018b3c33f6f35', 'XCBC/oo+hex/4');
is( unpack('H*', xcbc('Blowfish','12345678901234561234567890123456',"")), '9ef018b3c33f6f35', 'XCBC/func+raw/4');
is( xcbc_hex('Blowfish','12345678901234561234567890123456',""), '9ef018b3c33f6f35', 'XCBC/func+hex/4');
is( xcbc_b64('Blowfish','12345678901234561234567890123456',""), 'nvAYs8M/bzU=', 'XCBC/func+b64/4');
is( xcbc_b64u('Blowfish','12345678901234561234567890123456',""), 'nvAYs8M_bzU', 'XCBC/func+b64u/4');
is( unpack('H*', Crypt::Mac::XCBC->new('AES','1234567890123456')->add("123")->mac), 'bc9e0ee2a05a751b5ab25ddf0da158ea', 'XCBC/oo+raw/5');
is( Crypt::Mac::XCBC->new('AES','1234567890123456')->add("123")->hexmac, 'bc9e0ee2a05a751b5ab25ddf0da158ea', 'XCBC/oo+hex/5');
is( unpack('H*', xcbc('AES','1234567890123456',"123")), 'bc9e0ee2a05a751b5ab25ddf0da158ea', 'XCBC/func+raw/5');
is( xcbc_hex('AES','1234567890123456',"123"), 'bc9e0ee2a05a751b5ab25ddf0da158ea', 'XCBC/func+hex/5');
is( xcbc_b64('AES','1234567890123456',"123"), 'vJ4O4qBadRtasl3fDaFY6g==', 'XCBC/func+b64/5');
is( xcbc_b64u('AES','1234567890123456',"123"), 'vJ4O4qBadRtasl3fDaFY6g', 'XCBC/func+b64u/5');
is( unpack('H*', Crypt::Mac::XCBC->new('AES','12345678901234561234567890123456')->add("123")->mac), 'c0a87d7fa68bb2a7e18ad56808ec4eb3', 'XCBC/oo+raw/6');
is( Crypt::Mac::XCBC->new('AES','12345678901234561234567890123456')->add("123")->hexmac, 'c0a87d7fa68bb2a7e18ad56808ec4eb3', 'XCBC/oo+hex/6');
is( unpack('H*', xcbc('AES','12345678901234561234567890123456',"123")), 'c0a87d7fa68bb2a7e18ad56808ec4eb3', 'XCBC/func+raw/6');
is( xcbc_hex('AES','12345678901234561234567890123456',"123"), 'c0a87d7fa68bb2a7e18ad56808ec4eb3', 'XCBC/func+hex/6');
is( xcbc_b64('AES','12345678901234561234567890123456',"123"), 'wKh9f6aLsqfhitVoCOxOsw==', 'XCBC/func+b64/6');
is( xcbc_b64u('AES','12345678901234561234567890123456',"123"), 'wKh9f6aLsqfhitVoCOxOsw', 'XCBC/func+b64u/6');
is( unpack('H*', Crypt::Mac::XCBC->new('Blowfish','1234567890123456')->add("123")->mac), '21e88fbfb47a3200', 'XCBC/oo+raw/7');
is( Crypt::Mac::XCBC->new('Blowfish','1234567890123456')->add("123")->hexmac, '21e88fbfb47a3200', 'XCBC/oo+hex/7');
is( unpack('H*', xcbc('Blowfish','1234567890123456',"123")), '21e88fbfb47a3200', 'XCBC/func+raw/7');
is( xcbc_hex('Blowfish','1234567890123456',"123"), '21e88fbfb47a3200', 'XCBC/func+hex/7');
is( xcbc_b64('Blowfish','1234567890123456',"123"), 'IeiPv7R6MgA=', 'XCBC/func+b64/7');
is( xcbc_b64u('Blowfish','1234567890123456',"123"), 'IeiPv7R6MgA', 'XCBC/func+b64u/7');
is( unpack('H*', Crypt::Mac::XCBC->new('Blowfish','12345678901234561234567890123456')->add("123")->mac), '21e88fbfb47a3200', 'XCBC/oo+raw/8');
is( Crypt::Mac::XCBC->new('Blowfish','12345678901234561234567890123456')->add("123")->hexmac, '21e88fbfb47a3200', 'XCBC/oo+hex/8');
is( unpack('H*', xcbc('Blowfish','12345678901234561234567890123456',"123")), '21e88fbfb47a3200', 'XCBC/func+raw/8');
is( xcbc_hex('Blowfish','12345678901234561234567890123456',"123"), '21e88fbfb47a3200', 'XCBC/func+hex/8');
is( xcbc_b64('Blowfish','12345678901234561234567890123456',"123"), 'IeiPv7R6MgA=', 'XCBC/func+b64/8');
is( xcbc_b64u('Blowfish','12345678901234561234567890123456',"123"), 'IeiPv7R6MgA', 'XCBC/func+b64u/8');
is( unpack('H*', Crypt::Mac::XCBC->new('AES','1234567890123456')->add("test\0test\0test\n")->mac), '94cf668c4bbbb2bc0fc0bf14612084b9', 'XCBC/oo+raw/9');
is( Crypt::Mac::XCBC->new('AES','1234567890123456')->add("test\0test\0test\n")->hexmac, '94cf668c4bbbb2bc0fc0bf14612084b9', 'XCBC/oo+hex/9');
is( unpack('H*', xcbc('AES','1234567890123456',"test\0test\0test\n")), '94cf668c4bbbb2bc0fc0bf14612084b9', 'XCBC/func+raw/9');
is( xcbc_hex('AES','1234567890123456',"test\0test\0test\n"), '94cf668c4bbbb2bc0fc0bf14612084b9', 'XCBC/func+hex/9');
is( xcbc_b64('AES','1234567890123456',"test\0test\0test\n"), 'lM9mjEu7srwPwL8UYSCEuQ==', 'XCBC/func+b64/9');
is( xcbc_b64u('AES','1234567890123456',"test\0test\0test\n"), 'lM9mjEu7srwPwL8UYSCEuQ', 'XCBC/func+b64u/9');
is( unpack('H*', Crypt::Mac::XCBC->new('AES','12345678901234561234567890123456')->add("test\0test\0test\n")->mac), '438ad752323bdaab774e5051556b2336', 'XCBC/oo+raw/10');
is( Crypt::Mac::XCBC->new('AES','12345678901234561234567890123456')->add("test\0test\0test\n")->hexmac, '438ad752323bdaab774e5051556b2336', 'XCBC/oo+hex/10');
is( unpack('H*', xcbc('AES','12345678901234561234567890123456',"test\0test\0test\n")), '438ad752323bdaab774e5051556b2336', 'XCBC/func+raw/10');
is( xcbc_hex('AES','12345678901234561234567890123456',"test\0test\0test\n"), '438ad752323bdaab774e5051556b2336', 'XCBC/func+hex/10');
is( xcbc_b64('AES','12345678901234561234567890123456',"test\0test\0test\n"), 'Q4rXUjI72qt3TlBRVWsjNg==', 'XCBC/func+b64/10');
is( xcbc_b64u('AES','12345678901234561234567890123456',"test\0test\0test\n"), 'Q4rXUjI72qt3TlBRVWsjNg', 'XCBC/func+b64u/10');
is( unpack('H*', Crypt::Mac::XCBC->new('Blowfish','1234567890123456')->add("test\0test\0test\n")->mac), '98276a4a6aafd86b', 'XCBC/oo+raw/11');
is( Crypt::Mac::XCBC->new('Blowfish','1234567890123456')->add("test\0test\0test\n")->hexmac, '98276a4a6aafd86b', 'XCBC/oo+hex/11');
is( unpack('H*', xcbc('Blowfish','1234567890123456',"test\0test\0test\n")), '98276a4a6aafd86b', 'XCBC/func+raw/11');
is( xcbc_hex('Blowfish','1234567890123456',"test\0test\0test\n"), '98276a4a6aafd86b', 'XCBC/func+hex/11');
is( xcbc_b64('Blowfish','1234567890123456',"test\0test\0test\n"), 'mCdqSmqv2Gs=', 'XCBC/func+b64/11');
is( xcbc_b64u('Blowfish','1234567890123456',"test\0test\0test\n"), 'mCdqSmqv2Gs', 'XCBC/func+b64u/11');
is( unpack('H*', Crypt::Mac::XCBC->new('Blowfish','12345678901234561234567890123456')->add("test\0test\0test\n")->mac), '98276a4a6aafd86b', 'XCBC/oo+raw/12');
is( Crypt::Mac::XCBC->new('Blowfish','12345678901234561234567890123456')->add("test\0test\0test\n")->hexmac, '98276a4a6aafd86b', 'XCBC/oo+hex/12');
is( unpack('H*', xcbc('Blowfish','12345678901234561234567890123456',"test\0test\0test\n")), '98276a4a6aafd86b', 'XCBC/func+raw/12');
is( xcbc_hex('Blowfish','12345678901234561234567890123456',"test\0test\0test\n"), '98276a4a6aafd86b', 'XCBC/func+hex/12');
is( xcbc_b64('Blowfish','12345678901234561234567890123456',"test\0test\0test\n"), 'mCdqSmqv2Gs=', 'XCBC/func+b64/12');
is( xcbc_b64u('Blowfish','12345678901234561234567890123456',"test\0test\0test\n"), 'mCdqSmqv2Gs', 'XCBC/func+b64u/12');

done_testing();
