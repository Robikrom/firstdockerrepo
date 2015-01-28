#!/bin/bash

#ipoe_Cherckassy_47
Cherckassy_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.18.105.112.111.101.95.67.104.101.114.99.107.97.115.115.121.95.52.55 -Cc -Ovq`
Cherckassy_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.18.105.112.111.101.95.67.104.101.114.99.107.97.115.115.121.95.52.55 -Cc -Ovq`

#ipoe_Dnepr_56
Dnepr_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.13.105.112.111.101.95.68.110.101.112.114.95.53.54 -Cc -Ovq`
Dnepr_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.13.105.112.111.101.95.68.110.101.112.114.95.53.54 -Cc -Ovq`

#ipoe_Evpatoriya_66
Evpatoriya_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.18.105.112.111.101.95.69.118.112.97.116.111.114.105.121.97.95.54.54 -Cc -Ovq`
Evpatoriya_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.18.105.112.111.101.95.69.118.112.97.116.111.114.105.121.97.95.54.54 -Cc -Ovq`

#ipoe_Kharkov_57
Kharkov_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.15.105.112.111.101.95.75.104.97.114.107.111.118.95.53.55 -Cc -Ovq`
Kharkov_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.15.105.112.111.101.95.75.104.97.114.107.111.118.95.53.55 -Cc -Ovq`

#ipoe_Kiev_2
Kiev_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.11.105.112.111.101.95.75.105.101.118.95.50 -Cc -Ovq`
Kiev_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.11.105.112.111.101.95.75.105.101.118.95.50 -Cc -Ovq`

#ipoe_Korosten_41
Korosten_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.16.105.112.111.101.95.75.111.114.111.115.116.101.110.95.52.49 -Cc -Ovq`
Korosten_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.16.105.112.111.101.95.75.111.114.111.115.116.101.110.95.52.49 -Cc -Ovq`

#ipoe_Krivoy_Rog_156
Krivoy_Rog_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.19.105.112.111.101.95.75.114.105.118.111.121.95.82.111.103.95.49.53.54 -Cc -Ovq`
Krivoy_Rog_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.19.105.112.111.101.95.75.114.105.118.111.121.95.82.111.103.95.49.53.54 -Cc -Ovq`

#ipoe_Lutsk_33
Lutsk_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.13.105.112.111.101.95.76.117.116.115.107.95.51.51 -Cc -Ovq`
Lutsk_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.13.105.112.111.101.95.76.117.116.115.107.95.51.51 -Cc -Ovq`

#ipoe_Netish_Khmelnitskiy_38
Netish_Khmelnitskiy_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.27.105.112.111.101.95.78.101.116.105.115.104.95.75.104.109.101.108.110.105.116.115.107.105.121.95.51.56 -Cc -Ovq`
Netish_Khmelnitskiy_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.27.105.112.111.101.95.78.101.116.105.115.104.95.75.104.109.101.108.110.105.116.115.107.105.121.95.51.56 -Cc -Ovq`

#ipoe_Nikolaev_51
Nikolaev_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.16.105.112.111.101.95.78.105.107.111.108.97.101.118.95.53.49 -Cc -Ovq`
Nikolaev_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.16.105.112.111.101.95.78.105.107.111.108.97.101.118.95.53.49 -Cc -Ovq`

#ipoe_Odessa_48
Odessa_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.14.105.112.111.101.95.79.100.101.115.115.97.95.52.56 -Cc -Ovq`
Odessa_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.14.105.112.111.101.95.79.100.101.115.115.97.95.52.56 -Cc -Ovq`

#ipoe_Rovno_36
Rovno_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.13.105.112.111.101.95.82.111.118.110.111.95.51.54 -Cc -Ovq`
Rovno_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.13.105.112.111.101.95.82.111.118.110.111.95.51.54 -Cc -Ovq`

#ipoe_Simf_Evpat_65
Simf_Evpat_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.18.105.112.111.101.95.83.105.109.102.95.69.118.112.97.116.95.54.53 -Cc -Ovq`
Simf_Evpat_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.18.105.112.111.101.95.83.105.109.102.95.69.118.112.97.116.95.54.53 -Cc -Ovq`

#ipoe_Zaprozhie_61
Zaprozhie_in=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.7.1002.17.105.112.111.101.95.90.97.112.114.111.122.104.105.101.95.54.49 -Cc -Ovq`
Zaprozhie_out=`snmpwalk -v 2c -c public 10.3.7.6 1.3.6.1.4.1.1916.1.2.8.2.1.12.1002.17.105.112.111.101.95.90.97.112.114.111.122.104.105.101.95.54.49 -Cc -Ovq`

#echo "Zaprozhie_in:$Zaprozhie_in Zaprozhie_out:$Zaprozhie_out Simf_Evpat_in:$Simf_Evpat_in Simf_Evpat_out:$Simf_Evpat_out Rovno_in:$Rovno_in Rovno_out:$Rovno_out Odessa_in:$Odessa_in Odessa_out:$Odessa_out Nikolaev_in:$Nikolaev_in Nikolaev_out:$Nikolaev_out Netish_Khmelnitskiy_in:$Netish_Khmelnitskiy_in Netish_Khmelnitskiy_out:$Netish_Khmelnitskiy_out Lutsk_in:$Lutsk_in Lutsk_out:$Lutsk_out Krivoy_Rog_in:$Krivoy_Rog_in Krivoy_Rog_out:$Krivoy_Rog_out Korosten_in:$Korosten_in Korosten_out:$Korosten_out Kiev_in:$Kiev_in Kiev_out:$Kiev_out Kharkov_in:$Kharkov_in Kharkov_out:$Kharkov_out Evpatoriya_in:$Evpatoriya_in Evpatoriya_out:$Evpatoriya_out Dnepr_in:$Dnepr_in Dnepr_out:$Dnepr_out Cherckassy_in:$Cherckassy_in Cherckassy_out:$Cherckassy_out"

echo Cherckassy_in:$Cherckassy_in Cherckassy_out:$Cherckassy_out
exit 0;
