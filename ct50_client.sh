#!/bin/bash

#/usr/share/cacti/site/scripts/ct50.sh > /tmp/clients_ct50.log
print=`/usr/share/cacti/site/scripts/ct50.sh | grep Total | awk '{print $9}'`
#print=`cat /tmp/clients_ct50.log | grep Total | awk '{print $9}'`
echo ct50:$print 

