#!/usr/bin/perl -w

use strict;

my @RadReject_8;
my @RadReject_26;
my @RadReject_29;
my @RadReject_27;
my @RadReject_16;

my @RadSuccess_8;
my @RadSuccess_26;
my @RadSuccess_29;
my @RadSuccess_27;
my @RadSuccess_16;


open(SNMP_AuthRadReject_26,"snmpwalk -v 2c -c pWgeNuwe  10.3.7.3 1.3.6.1.4.1.6527.3.1.2.33.1.4.1.2.14.77.73.95.114.97.100.105.117.115.95.102.97.114.109.1  -Cc -Ovq|");
open(SNMP_AuthRadReject_8,"  snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.33.1.4.1.2.14.77.73.95.114.97.100.105.117.115.95.102.97.114.109.4  -Cc -Ovq|");
open(SNMP_AuthRadReject_29,"snmpwalk -v 2c -c pWgeNuwe  10.3.7.3 1.3.6.1.4.1.6527.3.1.2.33.1.4.1.2.14.77.73.95.114.97.100.105.117.115.95.102.97.114.109.5  -Cc -Ovq|");
open(SNMP_AuthRadReject_27,"  snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.33.1.4.1.2.14.77.73.95.114.97.100.105.117.115.95.102.97.114.109.6  -Cc -Ovq|");
open(SNMP_AuthRadReject_16,"  snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.33.1.4.1.2.14.77.73.95.114.97.100.105.117.115.95.102.97.114.109.7  -Cc -Ovq|");


open(SNMP_AuthRadSuccess_26,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.33.1.4.1.1.14.77.73.95.114.97.100.105.117.115.95.102.97.114.109.1  -Cc -Ovq|");
open(SNMP_AuthRadSuccess_8,"snmpwalk -v 2c -c pWgeNuwe  10.3.7.3 1.3.6.1.4.1.6527.3.1.2.33.1.4.1.1.14.77.73.95.114.97.100.105.117.115.95.102.97.114.109.4  -Cc -Ovq|");
open(SNMP_AuthRadSuccess_29,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.33.1.4.1.1.14.77.73.95.114.97.100.105.117.115.95.102.97.114.109.5  -Cc -Ovq|");
open(SNMP_AuthRadSuccess_27,"snmpwalk -v 2c -c pWgeNuwe  10.3.7.3 1.3.6.1.4.1.6527.3.1.2.33.1.4.1.1.14.77.73.95.114.97.100.105.117.115.95.102.97.114.109.6  -Cc -Ovq|");
open(SNMP_AuthRadSuccess_16,"snmpwalk -v 2c -c pWgeNuwe  10.3.7.3 1.3.6.1.4.1.6527.3.1.2.33.1.4.1.1.14.77.73.95.114.97.100.105.117.115.95.102.97.114.109.7  -Cc -Ovq|");


while (<SNMP_AuthRadReject_26>) { @RadReject_26=split(/ /, $_); }
while (<SNMP_AuthRadReject_8>)  { @RadReject_8=split(/ /, $_); }
while (<SNMP_AuthRadReject_29>) { @RadReject_29=split(/ /, $_); }
while (<SNMP_AuthRadReject_27>) { @RadReject_27=split(/ /, $_); }
while (<SNMP_AuthRadReject_16>) { @RadReject_16=split(/ /, $_); }

while (<SNMP_AuthRadSuccess_26>) { @RadSuccess_26=split(/ /, $_); }
while (<SNMP_AuthRadSuccess_8>)  { @RadSuccess_8=split(/ /, $_); }
while (<SNMP_AuthRadSuccess_29>) { @RadSuccess_29=split(/ /, $_); }
while (<SNMP_AuthRadSuccess_27>) { @RadSuccess_27=split(/ /, $_); }
while (<SNMP_AuthRadSuccess_16>) { @RadSuccess_16=split(/ /, $_); }

chomp $RadReject_26[0];
chomp $RadReject_8[0];
chomp $RadReject_29[0];
chomp $RadReject_27[0];
chomp $RadReject_16[0];

chomp $RadSuccess_8[0];
chomp $RadSuccess_26[0];
chomp $RadSuccess_29[0];
chomp $RadSuccess_27[0];
chomp $RadSuccess_16[0];

print "RadReject_26:$RadReject_26[0] RadReject_8:$RadReject_8[0] RadReject_29:$RadReject_29[0] RadReject_27:$RadReject_27[0] RadReject_16:$RadReject_16[0] RadSuccess_8:$RadSuccess_8[0] RadSuccess_26:$RadSuccess_26[0] RadSuccess_29:$RadSuccess_29[0] RadSuccess_27:$RadSuccess_27[0] RadSuccess_16:$RadSuccess_16[0]";