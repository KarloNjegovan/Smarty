<?php
require "DataManager.php";

$dm = new DataManager();

$type = filter_input(INPUT_GET, "type", FILTER_SANITIZE_STRING);
$stationUuid = filter_input(INPUT_GET, "uuid", FILTER_SANITIZE_STRING);

$token = filter_input(INPUT_GET, "token", FILTER_SANITIZE_STRING);
$unixF = filter_input(INPUT_GET, "unixF", FILTER_SANITIZE_NUMBER_INT);
$unixT = filter_input(INPUT_GET, "unixT", FILTER_SANITIZE_NUMBER_INT);

/*TODO list:
1.provjeri korisnikov token
2.pravo korisnika na stanicu
3.dodati vremena u DataManager
*/
echo "<br> Sekunde <br>";
echo  $dm->GetSecondsData($stationUuid);

echo "<br>Sati <br>";
echo  $dm->GetHourData($stationUuid);


?>