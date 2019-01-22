<?php
require "DataManager.php";

$dm = new DataManager();

$basestation=$_GET["bs"];



echo "<br> Sekunde <br>";
echo  $dm->GetSecondsData($basestation);

echo "<br>Minute <br>";
echo $dm->GetMinuteData($basestation);

echo "<br>Sati <br>";
echo  $dm->GetHourData($basestation);


?>