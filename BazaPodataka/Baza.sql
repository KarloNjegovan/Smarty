-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 22, 2019 at 06:47 PM
-- Server version: 5.6.42-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mjerenje_testAplikacija`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`mjerenje`@`localhost` PROCEDURE `dorepeat` (IN `p1` INT)  BEGIN
  DECLARE x INT DEFAULT 0;
  REPEAT SET x = x + 1; UNTIL x > p1 END REPEAT;
END$$

CREATE DEFINER=`mjerenje`@`localhost` PROCEDURE `dorepeat2` ()  BEGIN
    DECLARE i int DEFAULT 1;
    WHILE i <= 3 DO
        INSERT INTO Mjerenje_sat (stanica, temperatura, vlaznost) VALUES (i, RAND()*(25-10)+10, RAND()*(25-10)+10);
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`mjerenje`@`localhost` PROCEDURE `dorepeat3` ()  BEGIN
    DECLARE i int DEFAULT 1;
    WHILE i <= 3 DO
        INSERT INTO Mjerenje_sec (stanica_id, temperatura, vlaznost) VALUES (i, RAND()*(25-10)+10, RAND()*(25-10)+10);
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`mjerenje`@`localhost` PROCEDURE `dorepeat4` ()  BEGIN
    DECLARE i int DEFAULT 1;
    WHILE i <= 3 DO
        INSERT INTO Mjerenje_min (stanica, temperatura, vlaznost) VALUES (i, RAND()*(25-10)+10, RAND()*(25-10)+10);
        SET i = i + 1;
    END WHILE;

END$$

CREATE DEFINER=`mjerenje`@`localhost` PROCEDURE `doWhile` ()  BEGIN
DECLARE i INT DEFAULT 1;
SET i=1;
WHILE (i <= 3) DO
    INSERT INTO `Mjerenje_sat` (satnica, temperatura, vlaznost) values (i, RAND()+1, RAND()+2);
    SET i = i+1;
END WHILE;
END$$

CREATE DEFINER=`mjerenje`@`localhost` PROCEDURE `dowhilee` ()  BEGIN
    DECLARE i int DEFAULT 1;
    WHILE i <= 3 DO
        INSERT INTO Mjerenje_sat (stanica, temperatura, vlaznost) VALUES (i, RAND(), RAND());
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Korisnik`
--

CREATE TABLE `Korisnik` (
  `kor_id` int(10) NOT NULL,
  `kor_ime` varchar(10) NOT NULL,
  `lozinka` varchar(10) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Korisnik`
--

INSERT INTO `Korisnik` (`kor_id`, `kor_ime`, `lozinka`, `ime`, `prezime`) VALUES
(0, 'test', 'testlozink', 'testime', 'testprezime'),
(1, 'SQL ime', 'testlozin2', 'testime2', 'testprezime2');

-- --------------------------------------------------------

--
-- Table structure for table `Mjerenje_dan`
--

CREATE TABLE `Mjerenje_dan` (
  `stanica_id` int(11) NOT NULL,
  `temperatura` int(11) NOT NULL,
  `vlaznost` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Mjerenje_dan`
--

INSERT INTO `Mjerenje_dan` (`stanica_id`, `temperatura`, `vlaznost`) VALUES
(1, 16, 19),
(2, 21, 22),
(3, 23, 23),
(1, 20, 24),
(2, 19, 14),
(3, 16, 13),
(1, 23, 22),
(2, 16, 16),
(3, 11, 24),
(1, 19, 12),
(2, 24, 11),
(3, 21, 18),
(1, 14, 24),
(2, 22, 14),
(3, 23, 17),
(1, 23, 25),
(2, 13, 25),
(3, 15, 22),
(1, 23, 24),
(2, 12, 23),
(3, 24, 11);

-- --------------------------------------------------------

--
-- Table structure for table `Mjerenje_sat`
--

CREATE TABLE `Mjerenje_sat` (
  `stanica` int(11) NOT NULL,
  `temperatura` int(11) NOT NULL,
  `vlaznost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Mjerenje_sat`
--

INSERT INTO `Mjerenje_sat` (`stanica`, `temperatura`, `vlaznost`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 0),
(1, 14, 19),
(2, 12, 10),
(3, 19, 23),
(1, 18, 22),
(2, 15, 13),
(3, 13, 15),
(1, 15, 12),
(2, 21, 12),
(3, 18, 13),
(1, 12, 15),
(2, 14, 14),
(3, 17, 19),
(1, 12, 24),
(2, 16, 13),
(3, 22, 17),
(1, 22, 20),
(2, 10, 11),
(3, 13, 21),
(1, 14, 11),
(2, 16, 10),
(3, 22, 11),
(1, 21, 17),
(2, 12, 14),
(3, 23, 20),
(1, 20, 15),
(2, 19, 10),
(3, 14, 16),
(1, 20, 19),
(2, 23, 20),
(3, 21, 18),
(1, 19, 14),
(2, 21, 22),
(3, 20, 25),
(1, 23, 18),
(2, 25, 15),
(3, 19, 12),
(1, 23, 25),
(2, 14, 16),
(3, 12, 16),
(1, 18, 20),
(2, 20, 14),
(3, 15, 22),
(1, 13, 18),
(2, 10, 18),
(3, 18, 13),
(1, 14, 20),
(2, 21, 19),
(3, 24, 21),
(1, 21, 21),
(2, 13, 10),
(3, 15, 21),
(1, 21, 17),
(2, 11, 23),
(3, 12, 11),
(1, 24, 18),
(2, 24, 25),
(3, 12, 22),
(1, 17, 11),
(2, 24, 17),
(3, 16, 18),
(1, 19, 14),
(2, 17, 21),
(3, 15, 14),
(1, 15, 24),
(2, 18, 24),
(3, 13, 25),
(1, 17, 14),
(2, 24, 25),
(3, 12, 19),
(1, 19, 14),
(2, 20, 15),
(3, 22, 11),
(1, 23, 12),
(2, 11, 11),
(3, 25, 22);

-- --------------------------------------------------------

--
-- Table structure for table `Mjerenje_tjedan`
--

CREATE TABLE `Mjerenje_tjedan` (
  `stanica` int(11) NOT NULL,
  `temperatura` int(11) NOT NULL,
  `vlaznost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Mjerenje_tjedan`
--

INSERT INTO `Mjerenje_tjedan` (`stanica`, `temperatura`, `vlaznost`) VALUES
(1, 24, 11),
(2, 19, 19),
(3, 13, 14),
(1, 19, 16),
(2, 11, 12),
(3, 18, 15),
(1, 23, 18),
(2, 12, 24),
(3, 16, 13),
(1, 23, 18),
(2, 10, 20),
(3, 12, 21);

-- --------------------------------------------------------

--
-- Table structure for table `Stanica`
--

CREATE TABLE `Stanica` (
  `stanica_id` int(50) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `lokacija` varchar(50) NOT NULL,
  `al_temp` int(11) NOT NULL,
  `al_vlaz` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Stanica`
--

INSERT INTO `Stanica` (`stanica_id`, `naziv`, `lokacija`, `al_temp`, `al_vlaz`) VALUES
(1, 'stanica_1', 'lijevo_gore', 30, 20),
(2, 'stanica_2', 'desno_gore', 25, 30),
(3, 'stanica_3', 'desno_dole', 35, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Korisnik`
--
ALTER TABLE `Korisnik`
  ADD PRIMARY KEY (`kor_id`);

--
-- Indexes for table `Mjerenje_dan`
--
ALTER TABLE `Mjerenje_dan`
  ADD KEY `stanica_id` (`stanica_id`);

--
-- Indexes for table `Mjerenje_sat`
--
ALTER TABLE `Mjerenje_sat`
  ADD KEY `stanica` (`stanica`);

--
-- Indexes for table `Mjerenje_tjedan`
--
ALTER TABLE `Mjerenje_tjedan`
  ADD KEY `stanica` (`stanica`);

--
-- Indexes for table `Stanica`
--
ALTER TABLE `Stanica`
  ADD PRIMARY KEY (`stanica_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
