<?php
require "DataManager.php";

$dm = new DataManager();

$type = filter_input(INPUT_GET, "type", FILTER_SANITIZE_STRING);
$stationUuid = filter_input(INPUT_GET, "uuid", FILTER_SANITIZE_STRING);

$token = filter_input(INPUT_GET, "token", FILTER_SANITIZE_STRING);
$unixF = filter_input(INPUT_GET, "unixF", FILTER_SANITIZE_NUMBER_INT);
$unixT = filter_input(INPUT_GET, "unixT", FILTER_SANITIZE_NUMBER_INT);

//TODO check token and user access rights

$db = new Database();
$stationsResult = $db->getUserStations($token);
while ($stationUuids = mysqli_fetch_row($stationsResult)) //get all stations user has access to
{
    if ($stationUuid == $stationUuids[0]) //user has right to access that station
    {
        if ($type==="min")
        {
            echo  $dm->GetSecondsData($stationUuid, $unixF, $unixT);
        }elseif ($type==="hour")
        {
            echo  $dm->GetHourData($stationUuid, $unixF, $unixT);
        }
    }
}







?>