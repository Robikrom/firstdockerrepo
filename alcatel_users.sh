#!/bin/bash
#bras=`snmpwalk -v 2c -c $1 $2  .1.3.6.1.4.1.6527.3.1.2.4.2.3.1.60.777 | awk -F": " '{ print $2}'`
#bras=`snmpwalk -v 2c -c $1 $2  .1.3.6.1.4.1.6527.3.1.2.4.2.3.1.60.3 | awk -F": " '{ print $2}'`

bras=`snmpwalk -v 2c -c  pWgeNuwe 10.3.7.3  1.3.6.1.4.1.6527.3.1.2.3.2.1.56.2 |cut -d' ' -f 4`
#bras=`snmpwalk -v 2c -c  pWgeNuwe 10.3.7.24  .1.3.6.1.4.1.6527.3.1.2.3.2.1.57.2 |cut -d' ' -f 4`

echo bras:$bras
