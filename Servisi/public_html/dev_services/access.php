<?php
/**
 * Created by PhpStorm.
 * User: Forgift
 * Date: 02/02/2019
 * Time: 11:44
 */

include "Database.php";
include "custom_functions.php";

$db = new Database();

$token = filter_input(INPUT_GET, "token", FILTER_SANITIZE_STRING);

if ($db->checkUuidExistence($token,'token'))
{
    $result = $db->getUserStations($token);
    $stations = array();
    while ($currentUuid = mysqli_fetch_row($result)) //get all stations user has access to
    {
        $stations[]=$currentUuid[0];
    }
    $json["message"]="List of stations";
    $json['stations'] = $stations;
    $json["success"] = 1;
}else{
    $json = ["message"=>"Invalid token", "success"=>0];
}
$db->close();
echo json_encode($json);
?>