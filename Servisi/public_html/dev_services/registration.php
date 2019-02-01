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
$humid = filter_input(INPUT_GET, "humid", FILTER_SANITIZE_NUMBER_FLOAT);

$token = $db->escapeString($token);
$type = $db->escapeString($type);
$isAdmin = $db->isAdmin($token);
$message = '';
if ($isAdmin) //check if user with this token has rights to register
{
    if ($type ==  "user")
    {
        $exists = true;
        $user = $db->escapeString($user);
        $pass = $db->escapeString($pass);
        $email = $db->escapeString($email);

        //check pass length,username and email availability
        if ($db->isAvailable($user,'username') != true)
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
            //TODO 3.prepare INSERT
            $query = "INSERT INTO `User`(uuid, username, pass, email, admin, token) VALUES('$newUuid', '$user', '$pass', '$email', 0, null)";
            echo $query .'<br>';
            //TODO 4.execute SQL and return msg + uuid of new user
            $json = ["message"=>"$message","user_uuid"=>".$newUuid.", "success"=>1];
        }else{
            $json = ["message"=>"$message", "success"=>0];
        }
    }elseif ( $type == "stat")
    {
        $name = $db->escapeString($name);
        $location = $db->escapeString($location);
        //TODO REGISTER STATION
        $station_uuid= "station_uuid";
        $json = ["message"=>"Successful registration station registered","station_uuid"=>".$station_uuid.", "success"=>1];
    }else {
        $json = ["message"=>"Registration type wrong", "success"=>0];
    }

}else{
    $json = ["message"=>"User don't have access right", "success"=>0];
}

$db->close();

echo json_encode($json);

?>