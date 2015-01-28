#!/usr/bin/perl -w

use strict;

my @CPU5;

open(SNMP_CPU5,"snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.32.1.4.1.9.1 -Cc -Ovq|");

while (<SNMP_CPU5>)
{

$a="$_";

$a=~ s/"//g;

print "CPU5:$a";

}
