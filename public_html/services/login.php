<?php


/**
 * Created by PhpStorm.
 * User: Forgift
 * Date: 08/01/2019
 * Time: 16:18
 */

include "Database.php";

$db = new Database();

$username = $_POST["user"];
$pass = $_POST["pass"];

$result = $db ->executeQuery("SELECT * FROM `mjerenje_testAplikacija`.`Korisnik` WHERE kor_ime = '$username' and lozinka = '$pass'");
$db->close();

if(mysqli_num_rows($result)>0){
  echo  "Uspjesno logiranje";
  
}
else{
    echo "Neuspjeh";
}



?>