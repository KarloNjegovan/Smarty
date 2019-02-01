<?php
/**
 * Created by PhpStorm.
 * User: Forgift
 * Date: 30/01/2019
 * Time: 08:04
 */


include "Database.php";
include "custom_functions.php";

$db = new Database();

$token = filter_input(INPUT_GET, "token", FILTER_SANITIZE_STRING);
$type = filter_input(INPUT_GET, "type", FILTER_SANITIZE_STRING);

$user = filter_input(INPUT_GET, "user", FILTER_SANITIZE_STRING);
$pass = filter_input(INPUT_GET, "pass", FILTER_SANITIZE_STRING);
$email = filter_input(INPUT_GET, "email", FILTER_SANITIZE_STRING);

$name = filter_input(INPUT_GET, "name", FILTER_SANITIZE_STRING);
$location = filter_input(INPUT_GET, "location", FILTER_SANITIZE_STRING);

$temp = filter_input(INPUT_GET, "temp", FILTER_SANITIZE_NUMBER_FLOAT);
$temp = str_replace('-','.',$temp);
$humid = filter_input(INPUT_GET, "humid", FILTER_SANITIZE_NUMBER_FLOAT);
$humid = str_replace('-','.',$humid);

$token = $db->escapeString($token);
$type = $db->escapeString($type);
$isAdmin = $db->isAdmin($token);
$message = '';
$exists = true;

if ($isAdmin) //check if user with this token has rights to register
{
    if ($type ==  "user")
    {
        $user = $db->escapeString($user);
        $pass = $db->escapeString($pass);
        $email = $db->escapeString($email);

        if ($db->isAvailable($user,'username') != true)    //check pass length,username and email availability
        {
            $message .= 'Username not available! ';
        };
        if ($db->isAvailable($email,'email') != true)
        {
            $message .= 'Email not available! ';
        };
        if(strlen($pass) < 8)
        {
            $message .= 'Pass not long enough! ';
        }

        if($message =='') //prepare values for INSERT
        {
            while ($exists == true)     //get new uuid and check uuid existence
            {
                $newUuid = guidv4(openssl_random_pseudo_bytes(16));
                $exists = $db->checkUuidExistence($newUuid,"user");
            }
            $query = "INSERT INTO `User`(uuid, username, pass, email, admin, token) VALUES('$newUuid', '$user', '$pass', '$email', 0, null);";
            if( $db ->executeQuery($query))
            {
                $json = ["message"=>"New user registered","user_uuid"=>".$newUuid.", "success"=>1];
            }else {
                $json = ["message"=>"SQL failed to insert new user", "success"=>0];
            }
        }else{
            $json = ["message"=>"$message", "success"=>0];
        }
    }elseif ( $type == "stat" or $type == 'station')  //register new station
    {
        $name = $db->escapeString($name);
        $location = $db->escapeString($location);
        while ($exists == true)     //get new uuid and check uuid existence
        {
            $newUuid = guidv4(openssl_random_pseudo_bytes(16));
            $exists = $db->checkUuidExistence($newUuid,"station");
        }
        if (strlen($name)<3)
        {
            $json = ["message"=>"Station name is mandatory field", "success"=>0];
        }else{
            //$temp = (float)$temp;
            //$humid = (float)$humid;
            $query = "INSERT INTO `Station`(`uuid`, `name`, `location`, `temp`, `moist`, `deleted`) VALUES ('$newUuid' ,'$name','$location',$temp,$humid,0)";
            echo $query.'<br>';
            //TODO 4.execute SQL and return msg + uuid of new user
            if( $db ->executeQuery($query))
            {
                $json = ["message"=>"Successful registration, station registered","station_uuid"=>".$newUuid.", "success"=>1];
            }else {
                $json = ["message"=>"SQL failed to insert new statiom", "success"=>0];
            }
        }
    }else {
        $json = ["message"=>"Registration type wrong", "success"=>0];
    }
}else{
    $json = ["message"=>"User don't have access right", "success"=>0];
}

$db->close();
echo json_encode($json);
?>