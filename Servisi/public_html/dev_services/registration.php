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


//TODO get new free uuid :$uuid ='' ;
if ($isAdmin) //check if user with this token has rights to register
{
    if ($type ==  "user")
    {
        $user = $db->escapeString($user);
        $pass = $db->escapeString($pass);
        $email = $db->escapeString($email);
        /*TODO list:
        //check username and email availability
        //get new uuid and check uuid existence
        prepare INSERT
        execute SQL and return msg + uuid of new user
        */
        //$query = "INSERT INTO `User`(uuid, username, pass, email, admin, token) VALUES('$id', '$user', '$pass', '$email', $admin,  default)";
        $user_uuid = guidv4(openssl_random_pseudo_bytes(16));
        $json = ["message"=>"Uspiješna registracija koristnika","user_uuid"=>".$user_uuid.", "success"=>1];
    }elseif ( $type == "stat")
    {
        $name = $db->escapeString($name);
        $location = $db->escapeString($location);
        //TODO REGISTER STATION
        $station_uuid= "station_uuid";
        $json = ["message"=>"Uspiješna registracija stanice","station_uuid"=>".$station_uuid.", "success"=>1];
    }else {
        $json = ["message"=>"Registration type wrong", "success"=>0];
    }

}else{

}

$db->close();

echo json_encode($json);

?>