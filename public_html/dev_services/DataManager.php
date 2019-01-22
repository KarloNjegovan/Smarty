<?php
/**
 * Created by PhpStorm.
 * User: Forgift
 * Date: 22/01/2019
 * Time: 03:49
 */

class DataManager
{
    function GetSecondsData()
    {
        return "";
    }

    function GetMinuteData($bs)
    {
        $db = new Database();
        $minuteStats = array();
        $query = "SELECT * FROM `mjerenje_testAplikacija`.`Mjerenje_min`WHERE stanica=$bs; ";
        $minuteResponse = $db ->executeQuery($query);
        $db->close();
        while($row=mysqli_fetch_array($minuteResponse, MYSQLI_ASSOC))
        {
            $minuteStats[] = $row;
        }
        return  json_encode($minuteStats,true);
    }

    function  GetHourData()
    {
        return "";
    }
}