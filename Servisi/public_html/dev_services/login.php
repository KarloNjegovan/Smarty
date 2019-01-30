<?php


/**
 * Created by PhpStorm.
 * User: Forgift
 * Date: 08/01/2019
 * Time: 16:18
 */

include "Database.php";
include "custom_functions.php";

$db = new Database();

$username = filter_input(INPUT_GET, "user", FILTER_SANITIZE_STRING);
$pass = filter_input(INPUT_GET, "pass", FILTER_SANITIZE_STRING);

$username = $db->escapeString($username);
$pass = $db->escapeString($pass);


$querry = "SELECT username FROM `User` WHERE username = '$username' and pass = '$pass'";
$result = $db ->executeQuery($querry);

$json = array();

if(mysqli_num_rows($result)>0){
    $token = guidv4(openssl_random_pseudo_bytes(16));
    $exists = $db->checkUuidExistence($token,"token");
    while ($exists == true)
    {
        $token = guidv4(openssl_random_pseudo_bytes(16));
        $exists = $db->checkUuidExistence($token,"token");
    }
    $updated = $db->updateToken($username,$token);
    $json = ["message"=>"Uspjesna prijava", "success"=>1, "token"=>"$token", "token_updated"=>$updated ];
}
else{
    $json = ["message"=>"Neuspjesna prijava", "success"=>0];
}

$db->close();
echo json_encode($json);
?>