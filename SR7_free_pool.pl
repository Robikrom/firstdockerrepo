#!/usr/bin/perl -w
use strict;
my $pool;
my $limit;
my @part;

$pool="0";

open(SNMP,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 .1.3.6.1.4.1.6527.3.1.2.47.1.17.1.1 -Ov|");

while (<SNMP>)          {

@part=split(/ /, $_);

$pool=$part[1]+$pool;
                        }
print "FREE:$pool";

