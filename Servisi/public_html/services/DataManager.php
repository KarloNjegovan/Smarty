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

    function GetSecondsData( $station, $unixF, $unixT)
    {
        $database =  new Database();
        $secStats = array();
        $escString = $database->escapeString($station);

        $query = "SELECT time, temp, moist, alarming FROM `Measurement` WHERE `uuid`='$escString' and time>'$unixF' and time<'$unixT' and deleted is null ; ";
        $secResponse = $database ->executeQuery($query);
        $database->close();

        while($row=mysqli_fetch_array($secResponse, MYSQLI_ASSOC))
        {
            $secStats[] = $row;
        }
        $json['data'] = $secStats;
        $json['type'] = "min";
        return  json_encode($json,true);
    }

    function  GetHourData( $station, $unixF, $unixT)
    {
        $database =  new Database();
        $hourStats = array();
        $escString = $database->escapeString($station);

        $query = "SELECT time, avgTemp, avgMoist, alarming FROM `HourAverage` WHERE `uuid`='$escString' and time>'$unixF' and time<'$unixT' and deleted is null ; ";
        $hourResponse = $database ->executeQuery($query);
        $database->close();

        while($row=mysqli_fetch_array($hourResponse, MYSQLI_ASSOC))
        {
            $hourStats[] = $row;
        }
        $json['data'] = $hourStats;
        $json['type'] = "hour";
        return  json_encode($json,true);
    }
}