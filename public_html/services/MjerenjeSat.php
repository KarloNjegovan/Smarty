<?php


include "Database.php";

$db = new Database();
$bs=$_POST["bs"];

  

$res = $db ->executeQuery("SELECT * FROM `mjerenje_testAplikacija`.`Mjerenje_sat`WHERE stanica LIKE '$bs'");
$res2 = $db ->executeQuery("SELECT * FROM `mjerenje_testAplikacija`.`Mjerenje_sec`WHERE stanica_id LIKE '$bs'");

$res3 = $db ->executeQuery("SELECT * FROM `mjerenje_testAplikacija`.`Mjerenje_min`WHERE stanica LIKE '$bs'");


$row2=mysqli_fetch_array($res2);
$response2 = array();



$row=mysqli_fetch_array($res);
$response = array();

$row3=mysqli_fetch_array($re3);
$response3 = array();

while($row=mysqli_fetch_array($res))
{

 array_push($response,array($row[1],));
}


while($row2=mysqli_fetch_array($res2))
{

 array_push($response2,array($row2[1]));
}

while($row3=mysqli_fetch_array($res3))
{

 array_push($response3,array($row3[1]));
}
$zarez=",";

echo json_encode(array($response));
echo json_encode($zarez);
echo json_encode(array($response2));
echo json_encode($zarez);
echo json_encode(array($response3));
mysqli_close($con);



?>