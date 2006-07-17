#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id: invalid.t 11446 2006-02-06 14:07:49Z fperrad $

=head1 NAME

t/invalid.t - WMLScript invalid & conversion

=head1 SYNOPSIS

    % perl -I../lib -IWMLScript/t WMLScript/t/invalid.t

=head1 DESCRIPTION

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 17;
use Test::More;

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '! invalid', cflags => '-On');
extern function main()
{
    var a = ! invalid;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '~ invalid', cflags => '-On');
extern function main()
{
    var a = ~ invalid;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '- invalid', cflags => '-On');
extern function main()
{
    var a = - invalid;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '++', cflags => '-On');
extern function main()
{
    var a = invalid;
    a ++;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', '--', cflags => '-On');
extern function main()
{
    var a = invalid;
    a --;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid << 2', cflags => '-On');
extern function main()
{
    var a = invalid << 2;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid >> 3', cflags => '-On');
extern function main()
{
    var a = invalid >> 3;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid >>> 4', cflags => '-On');
extern function main()
{
    var a = invalid >>> 4;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid & 2', cflags => '-On');
extern function main()
{
    var a = invalid & 2;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid ^ 3', cflags => '-On');
extern function main()
{
    var a = invalid ^ 3;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid | 4', cflags => '-On');
extern function main()
{
    var a = invalid | 4;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid % 5', cflags => '-On');
extern function main()
{
    var a = invalid % 5;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid div 6', cflags => '-On');
extern function main()
{
    var a = invalid div 6;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid * 2', cflags => '-On');
extern function main()
{
    var a = invalid * 2;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid / 3', cflags => '-On');
extern function main()
{
    var a = invalid / 3;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid - 4', cflags => '-On');
extern function main()
{
    var a = invalid - 4;
    Console.println(typeof a);
}
CODE
4
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'invalid + 5', cflags => '-On');
extern function main()
{
    var a = invalid + 5;
    Console.println(typeof a);
}
CODE
4
OUT

