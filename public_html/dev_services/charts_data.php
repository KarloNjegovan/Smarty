<?php
require "DataManager.php";
require "Database.php";

$db = new Database();
$dm = new DataManager();

$bs=$db->escapeString($_GET["bs"]);
echo $dm->GetMinuteData($bs);

?>