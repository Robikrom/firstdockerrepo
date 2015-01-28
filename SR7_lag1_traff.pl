#!/usr/bin/perl -w

use strict;

my @TX;
my @RX;
#my $oidTX;
#my $oidRX;

#$oidTX = $ARGV[0];
#$oidRX = $ARGV[1];

open(SNMP_TX,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.2.1.31.1.1.1.6.1342177281 -Cc -Ovq|");
open(SNMP_RX,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.2.1.31.1.1.1.10.1342177281 -Cc -Ovq|");

while (<SNMP_TX>) { @TX=split(/ /, $_); }
while (<SNMP_RX>) { @RX=split(/ /, $_); }

chomp $TX[0];
chomp $RX[0];

print "traffic_in:$TX[0] traffic_out:$RX[0]";
