<?php
/**
 * Created by PhpStorm.
 * User: Forgift
 * Date: 02/02/2019
 * Time: 08:04
 */
include "Database.php";
$db = new Database();

$uuid = filter_input(INPUT_GET, "uuid", FILTER_SANITIZE_STRING);
$time = filter_input(INPUT_GET, "time", FILTER_SANITIZE_NUMBER_INT);
$temp = filter_input(INPUT_GET, "temp", FILTER_SANITIZE_NUMBER_FLOAT);
$temp = str_replace('-','.',$temp);
$humid = filter_input(INPUT_GET, "humid", FILTER_SANITIZE_NUMBER_FLOAT);
$humid = str_replace('-','.',$humid);

if($db->checkUuidExistence($uuid,'station')){ //security feature: add station token
    $query = "SELECT `temp`,`moist` FROM `Station` WHERE `uuid`= '$uuid'; ";
    $result = $db->executeQuery($query);
    $alarms = mysqli_fetch_assoc($result);
    if ($alarms['temp']<=$temp or $alarms['moist']<=$humid)//check for alarming values
    {
        //TODO prepare class for sending notifications on all platforms
        $insertQuery = "INSERT INTO `Measurement`(`time`, `uuid`, `temp`, `moist`, `alarming`, `deleted`) VALUES ($time,'$uuid',$temp,$humid,1,0)";
        echo $insertQuery;
        if ($db->executeQuery($insertQuery))
        {
            $json = ["message"=>"Data successfully stored","warning"=>"Alarming values temp=$temp and moist=$humid", "success"=>1];
        }else{
            $json = ["message"=>"Error in storing data","warning"=>"Alarming values temp=$temp and moist=$humid", "success"=>0];
        }

    }else{
        $insertQuery = "INSERT INTO `Measurement`(`time`, `uuid`, `temp`, `moist`, `alarming`, `deleted`) VALUES ($time,'$uuid',$temp,$humid,0,0)";
        if ($db->executeQuery($insertQuery))
        {
            $json = ["message"=>"Data successfully stored", "success"=>1];
        }else{
            $json = ["message"=>"Error in storing data", "success"=>0];
        }
    }
}else{
    $json = ["message"=>"Error station not existing", "success"=>0];
}
$db->close();
echo json_encode($json);
?>