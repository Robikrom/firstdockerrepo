#!/usr/bin/php
<?php

# deactivate http headers
$no_http_headers = true;
# include some cacti files for ease of use
include(dirname(__FILE__) . "/../include/global.php");
include(dirname(__FILE__) . "/../lib/snmp.php");

# define all OIDs we need for further processing
$oids = array(
	"cpuPhysIndex"		=> ".1.3.6.1.4.1.9.9.109.1.1.1.1.2",	# cpmCPUTotalPhysicalIndex
	"cpuName"			=> ".1.3.6.1.2.1.47.1.1.1.1.7",		# entPhysicalName
	"cpuFiveSec"		=> ".1.3.6.1.4.1.9.9.109.1.1.1.1.6",	# cpmCPUTotal5secRev
	"cpuOneMin"		=> ".1.3.6.1.4.1.9.9.109.1.1.1.1.7",	# cpmCPUTotal1minRev
	"cpuFiveMin"		=> ".1.3.6.1.4.1.9.9.109.1.1.1.1.8",	# cpmCPUTotal5minRev
#	"cpuMonInterval"	=> ".1.3.6.1.4.1.9.9.109.1.1.1.1.9",	# cpmCPUMonInterval
#	"cpuMonTotal"		=> ".1.3.6.1.4.1.9.9.109.1.1.1.1.10",	# cpmCPUTotalMonIntervalValue
#	"cpuMonInterrupt"	=> ".1.3.6.1.4.1.9.9.109.1.1.1.1.11",	# cpmCPUInterruptMonIntervalValue
	);

$xml_delimiter          = "!";

# all required input parms
$hostname       = $_SERVER["argv"][1];
$snmp_community = $_SERVER["argv"][2];
$snmp_version   = $_SERVER["argv"][3];
$snmp_port      = $_SERVER["argv"][4];
$snmp_timeout   = $_SERVER["argv"][5];
$snmp_user      = $_SERVER["argv"][6];
$snmp_pw        = $_SERVER["argv"][7];
$cmd            = $_SERVER["argv"][8];
if (isset($_SERVER["argv"][9]))  { $query_field = $_SERVER["argv"][9]; };
if (isset($_SERVER["argv"][10])) { $query_index = $_SERVER["argv"][10]; };

# get number of snmp retries from global settings
$snmp_retries   = read_config_option("snmp_retries");
# 
# -------------------------------------------------------------------------
# preliminary work needed for all commands (index, query, get)
# -------------------------------------------------------------------------
# cpmCPUTotalIndex is the logical choice for this indexed script query, but 
#	by definition cpmCPUTotalIndex is not persistent
#
# cpmCPUTotalTable
#	cpmCPUTotalEntry
#		cpmCPUTotalIndex (1)		<== CPU index
#		cpmCPUTotalPhysicalIndex (2)
#		cpmCPUTotal5secRev (6)		<== CPU stats
#		cpmCPUTotal1minRev (7)		<==
#		cpmCPUTotal5minRev (8)		<==
#
# fortunately, the name of each CPU appears to be static, so we can use it;
# the name is tied to cpmCPUTotalIndex by way of cpmCPUTotalPhysicalIndex 
#
# cpmCPUTotalPhysicalIndex = entPhysicalIndex
#
# CPU name = entPhysicalName.cpmCPUtotalPhysicalIndex
#
# entPhysicalTable
#	entPhysicalEntry
# 		entPhysicalIndex (1)
#		entPhysicalName (7)
#
# -------------------------------------------------------------------------
#
# walk cpmCPUTotalPhysicalIndex 
$arr_walk = cacti_snmp_walk(	$hostname, $snmp_community, $oids["cpuPhysIndex"],
						$snmp_version, $snmp_user, $snmp_pw, "", "", "", "",
						$snmp_port, $snmp_timeout, $snmp_retries);

# extract cpmCPUTotalIndex from the cpmCPUTotalPhysicalIndex OIDs 
$arr_cpu_index = getindex($arr_walk);

# get the values of cpmCPUTotalPhysicalIndex
$arr_phys_index = getvalue($arr_walk);

# get the name for each CPU 
for ($i=0;($i<sizeof($arr_phys_index));$i++) {
	$value = cacti_snmp_get( $hostname, $snmp_community, 
						$oids["cpuName"] . "." . $arr_phys_index[$i], 
						$snmp_version,  $snmp_user,  $snmp_pw, "", "", "", "",
			          	$snmp_port, $snmp_timeout, $snmp_retries);
	# to be able to use the name as an index, we have to replace the whitespace
	$arr_name[$i] = preg_replace('/\s/', '_', $value);
}

# -------------------------------------------------------------------------
# script MUST respond to index queries
#	the command for this is defined within the XML file as
#	<arg_index>index</arg_index>
#	you may replace the string "index" both in the XML and here
# -------------------------------------------------------------------------
# php -q <script> <parms> index
# 	will list all indices of the target values
# -------------------------------------------------------------------------
if ($cmd == "index") {
 
	# print each name on separate line
	for ($i=0;($i<sizeof($arr_name));$i++) {
		print "$arr_name[$i]\n";
	}
#
# -------------------------------------------------------------------------
# script MUST respond to query requests
#	the command for this is defined within the XML file as
#	<arg_query>query</arg_query>
#	you may replace the string "query" both in the XML and here
# -------------------------------------------------------------------------
# php -q <script> <parms> query <function>
# 	where <function> is a parameter that tells this script,
# 	which target value should be retrieved
# -------------------------------------------------------------------------
}elseif ($cmd == "query") {

	if ($query_field ==  "index") {
		$arr_result = $arr_name;

	}elseif ($query_field ==  "cpuIndex") {
		$arr_result = $arr_cpu_index;

	}elseif ($query_field ==  "physIndex") {
		$arr_result = $arr_phys_index;

	}elseif (	$query_field == "cpuFiveSec" ||
			$query_field == "cpuOneMin"  ||
			$query_field == "cpuFiveMin"    ) {

		# get the requested query
		for ($i=0;($i<sizeof($arr_phys_index));$i++) {		
			$value = cacti_snmp_get(	$hostname, $snmp_community, 
							   	$oids[$query_field] . "." . $arr_cpu_index[$i],
							  	$snmp_version, $snmp_user, $snmp_pw, "", "", "", "",
								$snmp_port, $snmp_timeout, $snmp_retries);
			preg_match('/^\d+/', $value, $match);
			$arr_result[$i] = $match[0];
		}		
 	}else {
		print "Invalid query parameter.\n";
		exit(1);
	}

	# print each result on separate line
	for ($i=0;($i<sizeof($arr_name));$i++) {
		print $arr_name[$i] . $xml_delimiter . $arr_result[$i] . "\n";
	}
# 
# -------------------------------------------------------------------------
# script MUST respond to get requests
#	the command for this is defined within the XML file as
#	<arg_get>get</arg_get>
#	you may replace the string "get" both in the XML and here
# -------------------------------------------------------------------------
# php -q <script> <parms> get <function> <index>
# 	where <function> is a parameter that tells this script,
# 	which target value should be retrieved
# 	and <index> is the index that should be queried
# -------------------------------------------------------------------------
}elseif ($cmd == "get") {

	# translate the query_index into cpmCPUTotalIndex 
	for ($i=0;($i<sizeof($arr_name));$i++) {
		if ($arr_name[$i] == $query_index) {
			$oid_index = $arr_cpu_index[$i];
		}
	}

	# get the value
	$value = cacti_snmp_get(	$hostname, $snmp_community, 
						$oids[$query_field] . "." . $oid_index, 
                             	$snmp_version, $snmp_user, $snmp_pw, "", "", "", "", 
						$snmp_port, $snmp_timeout, $snmp_retries);
	preg_match('/^\d+/', $value, $match);
	print $match[0] . "\n";

# -------------------------------------------------------------------------
# -------------------------------------------------------------------------
} else {
	print "Invalid use of script query, required parameters:\n\n";
	print "    <hostname> <community> <version> <snmp_port> <timeout> <user> <pw> <cmd>\n";
	exit(1);
}

# 
# -------------------------------------------------------------------------
# subroutines
# -------------------------------------------------------------------------
#

# getvalue() extracts the values from the results of an snmpwalk
function getvalue($arr) {
        $return_arr = array();

        for ($i=0;($i<sizeof($arr));$i++) {
                $return_arr[$i] = $arr[$i]["value"];
        }

        return $return_arr;
}

# getindex() extracts the index (last number of the OID) from the results of an snmpwalk
function getindex($arr) {
        $return_arr = array();

        for ($i=0;($i<sizeof($arr));$i++) {
		preg_match('/[0-9]+$/', $arr[$i]['oid'], $match);
                $return_arr[$i] = $match[0];
        }

        return $return_arr;
}

?>


