#!/usr/bin/perl -w

use strict;

my @TX;
my @RX;
#my $oidTX;
#my $oidRX;

#$oidTX = $ARGV[0];
#$oidRX = $ARGV[1];

#open(SNMP_TX,"snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.15.105.112.111.101.95.75.104.97.114.107.111.118.95.53.55 -Cc -Ovq|");
#open(SNMP_RX,"snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.15.105.112.111.101.95.75.104.97.114.107.111.118.95.53.55 -Cc -Ovq|");
open(SNMP_TX,"snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1016.15.105.112.111.101.95.75.104.97.114.107.111.118.95.53.55 -Cc -Ovq|");
open(SNMP_RX,"snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1016.15.105.112.111.101.95.75.104.97.114.107.111.118.95.53.55 -Cc -Ovq|");







while (<SNMP_TX>) { @TX=split(/ /, $_); }
while (<SNMP_RX>) { @RX=split(/ /, $_); }

chomp $TX[0];
chomp $RX[0];


print "traffic_in:$TX[0] traffic_out:$RX[0]";