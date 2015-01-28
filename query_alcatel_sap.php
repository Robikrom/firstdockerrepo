<?php

/* do NOT run this script through a web browser */
if (!isset($_SERVER["argv"][0]) || isset($_SERVER['REQUEST_METHOD'])  || isset($_SERVER['REMOTE_ADDR'])) {
   die("<br><strong>This script is only meant to run at the command line.</strong>");
}

$no_http_headers = true;

include(dirname(__FILE__) . "/../include/global.php");
include(dirname(__FILE__) . "/../lib/snmp.php");

$oids = array(
    "index" => ".1.3.6.1.2.1.25.3.3.1",
    "usage" => ".1.3.6.1.2.1.25.3.3.1",
#    "sap_list" => ".1.3.6.1.4.1.6527.3.1.2.4.3.2.1.1",
    "sap_list" => "iso.3.6.1.4.1.6527.3.1.2.3.4.1.5",
#    "sap_desc" => ".1.3.6.1.4.1.6527.3.1.2.4.3.2.1.5",
    "sap_desc" => "iso.3.6.1.4.1.6527.3.1.2.3.4.1.4",
    "sap_opState" => ".1.3.6.1.4.1.6527.3.1.2.4.3.2.1.7",
    "sap_inBytes" => ".1.3.6.1.4.1.6527.3.1.2.4.3.7.1",
    "sap_outBytes" => ".1.3.6.1.4.1.6527.3.1.2.4.3.8.1",
#    "sap_subHosts" => ".1.3.6.1.4.1.6527.3.1.2.4.3.14.1.5",
    "sap_subHosts" => "iso.3.6.1.4.1.6527.3.1.2.3.19.1.22",
    "sap_fdb" => ".1.3.6.1.4.1.6527.3.1.2.4.3.3.1.20",
);


$hostname = $_SERVER["argv"][1];
$snmp_community = $_SERVER["argv"][2];
$snmp_version = $_SERVER["argv"][3];
$cmd = $_SERVER["argv"][4];


if ($cmd == "index") {
    $arr = reindex(cacti_snmp_walk($hostname, $snmp_community, $oids["sap_list"], $snmp_version, "", "", "", "", "", "", "", 161, 1000));
    foreach ($arr  as $key => $value) {
	print $key . "\n";
    }	                                
}
elseif ($cmd == "query") {
    $arg = $_SERVER["argv"][5];
    $arr_index = get_indexes($hostname, $snmp_community, $snmp_version, $oids['sap_list']);
    
    if ($arg == "sap_desc") {
	$arr = get_sap_desc($hostname, $snmp_community, $snmp_version, $oids['sap_desc']);
    }
    elseif ($arg == "sap_opState") {
	$arr = get_sap_opState($hostname, $snmp_community, $snmp_version, $oids['sap_opState']);
    }
    elseif ($arg == "sap") {
	$arr = get_sap($hostname, $snmp_community, $snmp_version, $oids['sap_desc']);
    }
    elseif ($arg == "sap_inBytes") {
	$arr = get_sap_inBytes($hostname, $snmp_community, $snmp_version, $oids['sap_inBytes']);
    }
    elseif ($arg == "sap_outBytes") {
	$arr = get_sap_outBytes($hostname, $snmp_community, $snmp_version, $oids['sap_outBytes']);
    }
    elseif ($arg == "sap_subHosts") {
	$arr = get_sap_subHosts($hostname, $snmp_community, $snmp_version, $oids['sap_subHosts']);
    }
    elseif ($arg == "sap_fdb") {
	$arr = get_sap_fdb($hostname, $snmp_community, $snmp_version, $oids['sap_fdb']);
    }
    elseif ($arg == "svc_num") {
	foreach ($arr_index as $key => $value) {
	    $arr[$key] = preg_replace("/([0-9]+)\..*/", "\\1", $key);
	}
    }
    elseif ($arg == "index") {
	$arr = $arr_index;
    }
    foreach ($arr_index as $key => $value) { 
        print $value . "!" . (isset($arr[$value]) ? $arr[$value] : 0 ) . "\n";
    }
}
elseif ($cmd == "get") {
    $arg = $_SERVER["argv"][5];
    $index = $_SERVER["argv"][6];
    $arr_index = get_indexes($hostname, $snmp_community, $snmp_version, $oids['sap_list']);
    if ($arg == "sap_inBytes") {
	$arr = get_sap_inBytes($hostname, $snmp_community, $snmp_version, $oids['sap_inBytes']);
    }
    elseif ($arg == "sap_outBytes") {
	$arr = get_sap_outBytes($hostname, $snmp_community, $snmp_version, $oids['sap_outBytes']);
    }
    elseif ($arg == "sap_subHosts") {
	$arr = get_sap_subHosts($hostname, $snmp_community, $snmp_version, $oids['sap_subHosts']);
    }
    elseif ($arg == "sap_fdb") {
	$arr = get_sap_fdb($hostname, $snmp_community, $snmp_version, $oids['sap_fdb']);
    }
    
    if (isset($arr_index[$index])) {
        print $arr[$index];
    }
}
                                                                



function get_sap_desc($hostname, $snmp_community, $snmp_version, $oid) {
	$return_arr = reindex(cacti_snmp_walk($hostname, $snmp_community, $oid, $snmp_version, "", "", "", "", "", "", "", 161, 1000));
	return $return_arr;
}

function get_indexes($hostname, $snmp_community, $snmp_version, $oid) {
    $return_arr = array();
    $arr = reindex(cacti_snmp_walk($hostname, $snmp_community, $oid, $snmp_version, "", "", "", "", "", "", "", 161, 1000));
    foreach ($arr  as $key => $value) {
        $return_arr[$key] = $key;
    }	                                
    return $return_arr;
}
function get_sap($hostname, $snmp_community, $snmp_version, $oid) {
    $return_arr = array();
    $arr = reindex(cacti_snmp_walk($hostname, $snmp_community, $oid, $snmp_version, "", "", "", "", "", "", "", 161, 1000));
    foreach ($arr as $key => $value) {
	$int_id = preg_replace("/[0-9]+\.([0-9]+)\..*/", "\\1", $key);
	$int_array[$key] = $int_id;
    }
    $int_name = cacti_snmp_walk($hostname, $snmp_community, '.1.3.6.1.2.1.31.1.1.1.1', $snmp_version, "", "", "", "", "", "", "", 161, 1000);
    foreach ($int_name as $key => $value) {
	$int_id = preg_replace("/.*[0-9]+\.([0-9]+)$/", "\\1", $value['oid']);
	$int_array2[$int_id] = $value['value'];
    }
    foreach ($arr as $key => $value) {
        $return_arr[$key] = $int_array2[$int_array[$key]] . ":" . preg_replace("/.*\.([0-9]+)$/", "\\1", $key);
    }	                                
    return $return_arr;
}

function get_sap_opState($hostname, $snmp_community, $snmp_version, $oid) {
    $return_arr = array();
    $arr = reindex(cacti_snmp_walk($hostname, $snmp_community, $oid, $snmp_version, "", "", "", "", "", "", "", 161, 1000));
    foreach ($arr  as $key => $value) {
        $return_arr[$key] = ($value == 1 ? 'Up' : ($value == 2 ? 'Down' : 'Testing'));
    }	                                
    return $return_arr;
}
function get_sap_subHosts($hostname, $snmp_community, $snmp_version, $oid) {
    $return_arr = array();
    $arr = reindex(cacti_snmp_walk($hostname, $snmp_community, $oid, $snmp_version, "", "", "", "", "", "", "", 161, 1000));
    foreach ($arr  as $key => $value) {
        $return_arr[$key] = $value;
    }	                                
    return $return_arr;
}
function get_sap_fdb($hostname, $snmp_community, $snmp_version, $oid) {
    $return_arr = array();
    $arr = reindex(cacti_snmp_walk($hostname, $snmp_community, $oid, $snmp_version, "", "", "", "", "", "", "", 161, 1000));
    foreach ($arr  as $key => $value) {
        $return_arr[$key] = $value;
    }	                                
    return $return_arr;
}
function get_sap_inBytes($hostname, $snmp_community, $snmp_version, $oid) {
    $return_arr = array();
    $arr_input = cacti_snmp_walk($hostname, $snmp_community, $oid.".12", $snmp_version, "", "", "", "", "", "", "", 161, 1000);
    $arr_output = cacti_snmp_walk($hostname, $snmp_community, $oid.".13", $snmp_version, "", "", "", "", "", "", "", 161, 1000);
    
    foreach ($arr_input as $key => $value) {
	$index = preg_replace("/.*\.([0-9]+\.[0-9]+\.[0-9]+)\.[0-9]+$/", "\\1", $value['oid']);
	$return_arr[$index] = (isset($return_arr[$index]) ? $return_arr[$index] : 0) +  $value['value'];
    }
    foreach ($arr_output as $key => $value) {
	$index = preg_replace("/.*\.([0-9]+\.[0-9]+\.[0-9]+)\.[0-9]+$/", "\\1", $value['oid']);
	$return_arr[$index] += $value['value'];
    }
    return $return_arr;
}
function get_sap_outBytes($hostname, $snmp_community, $snmp_version, $oid) {
    $return_arr = array();
    $arr_input = cacti_snmp_walk($hostname, $snmp_community, $oid.".6", $snmp_version, "", "", "", "", "", "", "", 161, 1000);
    $arr_output = cacti_snmp_walk($hostname, $snmp_community, $oid.".8", $snmp_version, "", "", "", "", "", "", "", 161, 1000);
    
    foreach ($arr_input as $key => $value) {
	$index = preg_replace("/.*\.([0-9]+\.[0-9]+\.[0-9]+)\.[0-9]+$/", "\\1", $value['oid']);
	$return_arr[$index] = (isset($return_arr[$index]) ? $return_arr[$index] : 0) +  $value['value'];
    }
    foreach ($arr_output as $key => $value) {
	$index = preg_replace("/.*\.([0-9]+\.[0-9]+\.[0-9]+)\.[0-9]+$/", "\\1", $value['oid']);
	$return_arr[$index] += $value['value'];
    }
    return $return_arr;
}
function reindex ($arr){
    $return_arr = array();
    for ($i=0;($i<sizeof($arr));$i++) {
	$index = preg_replace("/.*\.([0-9]+\.[0-9]+\.[0-9]+)/","\\1", $arr[$i]['oid']);
        $return_arr[$index] = $arr[$i]["value"];
    }
    return $return_arr;
}
?>
