#!/usr/bin/perl -w

use strict;

my @Discovers;
my @Requests;
my @Acks;

my @Offers;
my @Naks;
my @Releases;
my @Informs;
my @Declines;


open(SNMP_Discovers,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.47.1.14.1.1 -Cc -Ovq|");
open(SNMP_Requests,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.47.1.14.1.2 -Cc -Ovq|");
open(SNMP_Acks,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.47.1.14.1.7 -Cc -Ovq|");
open(SNMP_Offers,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.47.1.14.1.6 -Cc -Ovq|");
open(SNMP_Naks,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.47.1.14.1.8 -Cc -Ovq|");
open(SNMP_Releases,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.47.1.14.1.3 -Cc -Ovq|");
open(SNMP_Informs,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.47.1.14.1.5 -Cc -Ovq|");
open(SNMP_Declines,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.47.1.14.1.4 -Cc -Ovq|");

while (<SNMP_Discovers>) { @Discovers=split(/ /, $_); }
while (<SNMP_Requests>) { @Requests=split(/ /, $_); }
while (<SNMP_Acks>) { @Acks=split(/ /, $_); }
while (<SNMP_Offers>) { @Offers=split(/ /, $_); }
while (<SNMP_Naks>) { @Naks=split(/ /, $_); }
while (<SNMP_Releases>) { @Releases=split(/ /, $_); }
while (<SNMP_Informs>) { @Informs=split(/ /, $_); }
while (<SNMP_Declines>) { @Declines=split(/ /, $_); }

chomp $Discovers[0];
chomp $Requests[0];
chomp $Acks[0];
chomp $Offers[0];
chomp $Naks[0];
chomp $Releases[0];
chomp $Informs[0];
chomp $Declines[0];



print "RxDiscovers:$Discovers[0] RxRequests:$Requests[0] TxAcks:$Acks[0] TxOffers:$Offers[0] TxNaks:$Naks[0] RxReleases:$Releases[0] RxInforms:$Informs[0] RxDeclines:$Declines[0]";
