#!/usr/bin/perl -w

use strict;

my @MemTotalInUse;
my @MemCurrentTotalSize;

open(SNMP_MemTotalInUse,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.1.1.2  -Cc -Ovq|");
open(SNMP_MemCurrentTotalSize,"snmpwalk -v 2c -c pWgeNuwe 10.3.7.3 1.3.6.1.4.1.6527.3.1.2.1.1.4  -Cc -Ovq|");

while (<SNMP_MemTotalInUse>) { @MemTotalInUse=split(/ /, $_); }
while (<SNMP_MemCurrentTotalSize>) { @MemCurrentTotalSize=split(/ /, $_); }

chomp $MemTotalInUse[0];
chomp $MemCurrentTotalSize[0];

print "MemTotalInUse:$MemTotalInUse[0] MemCurrentTotalSize:$MemCurrentTotalSize[0]";