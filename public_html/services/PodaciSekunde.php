<?php


include "Database.php";

$db = new Database();
  

$res = $db ->executeQuery("SELECT * FROM `mjerenje_testAplikacija`.`Mjerenje_sec`");

$row=mysqli_fetch_array($res);
$response = array();
while($row=mysqli_fetch_array($res))
{

 array_push($response,array($row[0]," ",$row[1]," ", $row[2]));
}

echo json_encode(array($response));
mysqli_close($con);


?>