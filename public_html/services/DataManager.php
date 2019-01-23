<?php
/**
 * Created by PhpStorm.
 * User: Forgift
 * Date: 22/01/2019
 * Time: 03:49
 */
require "Database.php";

class DataManager
{

    function GetSecondsData($station)
    {
        $database =  new Database();
        $secStats = array();
        $escString = $database->escapeString($station);

        $query = "SELECT * FROM `Measurement` WHERE `uuid`='$escString'; ";
        $secResponse = $database ->executeQuery($query);
        $database->close();

        while($row=mysqli_fetch_array($secResponse, MYSQLI_ASSOC))
        {
            $secStats[] = $row;
        }
        return  json_encode($secStats,true);
    }

    function  GetHourData($station)
    {
        $database =  new Database();
        $hourStats = array();
        $escString = $database->escapeString($station);

        $query = "SELECT * FROM `Measurement` WHERE `uuid`='$escString'; ";
        $hourResponse = $database ->executeQuery($query);
        $database->close();
        while($row=mysqli_fetch_array($hourResponse, MYSQLI_ASSOC))
        {
            $hourStats[] = $row;
        }
        return  json_encode($hourStats,true);
    }
}