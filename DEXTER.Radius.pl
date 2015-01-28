#!/usr/bin/perl -w

use strict;

my @radiusServAccessRequests;
my @radiusServDupAccessRequests;
my @radiusServAccessAccepts;
my @radiusServAccessRejects;
my @radiusServAccessChallenges;

open(SNMP_radiusServAccessRequests,"snmpwalk -v 1 -c 837ygfbnms 10.3.4.44:9991 .1.3.6.1.3.79.1.1.1.6.1.4.13 -Cc -Ovq|");
open(SNMP_radiusServDupAccessRequests,"snmpwalk -v 1 -c 837ygfbnms 10.3.4.44:9991 .1.3.6.1.3.79.1.1.1.6.1.5.13 -Cc -Ovq|");
open(SNMP_radiusServAccessAccepts,"snmpwalk -v 1 -c 837ygfbnms 10.3.4.44:9991 .1.3.6.1.3.79.1.1.1.6.1.6.13 -Cc -Ovq|");
open(SNMP_radiusServAccessRejects,"snmpwalk -v 1 -c 837ygfbnms 10.3.4.44:9991 .1.3.6.1.3.79.1.1.1.6.1.7.13 -Cc -Ovq|");
open(SNMP_radiusServAccessChallenges,"snmpwalk -v 1 -c 837ygfbnms 10.3.4.44:9991 .1.3.6.1.3.79.1.1.1.6.1.8.13 -Cc -Ovq|");

while (<SNMP_radiusServAccessRequests>) { @radiusServAccessRequests=split(/ /, $_); }
while (<SNMP_radiusServDupAccessRequests>) { @radiusServDupAccessRequests=split(/ /, $_); }
while (<SNMP_radiusServAccessAccepts>) { @radiusServAccessAccepts=split(/ /, $_); }
while (<SNMP_radiusServAccessRejects>) { @radiusServAccessRejects=split(/ /, $_); }
while (<SNMP_radiusServAccessChallenges>) { @radiusServAccessChallenges=split(/ /, $_); }

chomp $radiusServAccessRequests[0];
chomp $radiusServDupAccessRequests[0];
chomp $radiusServAccessAccepts[0];
chomp $radiusServAccessRejects[0];
chomp $radiusServAccessChallenges[0];

print "radiusServAccessRequests:$radiusServAccessRequests[0] radiusServDupAccessRequests:$radiusServDupAccessRequests[0] radiusServAccessAccepts:$radiusServAccessAccepts[0] radiusServAccessRejects:$radiusServAccessRejects[0] radiusServAccessChallenges:$radiusServAccessChallenges[0]

";
