#!/bin/bash
bras=`snmpwalk -v 2c -c $1 $2 .1.3.6.1.4.1.2352.2.27.1.2.1.1.1.5.108.111.99.97.108 | awk -F": " '{ print $2}'`
echo bras:$bras
