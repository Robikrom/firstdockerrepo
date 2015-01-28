#! /usr/bin/perl

open(LAG,"wget -qO - https://10.3.4.15/external/mi_online.php --no-check-certificate|");

$New_Vinni=0;

while ($line = <LAG>){

 if ($line =~ m/lag3_1001/ or $line =~ m/lag3_1002/ or $line =~ m/lag3_1003/ or $line =~ m/lag3_1004/ or $line =~ m/lag3_1005/ or $line =~ m/lag3_1006/ or $line =~ m/lag3_1007/ or $line =~ m/lag3_1008/ or $line =~ m/lag3_1009/ or $line =~ m/lag3_1010/  or $line =~ m/lag3_1013/  or $line =~ m/lag3_1014/   or $line =~ m/lag3_161/)
                                             {
                                             #chop($line);
                                             #$line =~ s/:/_/g;
                                             #$line =~ s/-//g;
                                             @T=split(/:/, $line);
                                             $line =~ tr/\n / /;
                                             $New_Vinni=$New_Vinni+$T[1];
                                             }
                                             else
                                             {
                                             $line =~ tr/\n / /;
                                             print "$line";
                                             }
                     }

print "lag2_161:$New_Vinni";

close( LAG );