#!/bin/bash


statuscurrent=`wget -qO - https://10.3.4.15/external/ppp_park.php --no-check-certificate | sed -e 's/park:/parked:/g'`

echo $statuscurrent 



