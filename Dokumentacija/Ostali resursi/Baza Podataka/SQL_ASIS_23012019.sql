-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/pAbqbA
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE `User` (
    `uuid` varchar(128)  NOT NULL ,
    `username` varchar(64)  NOT NULL ,
    `pass` varchar(64)  NOT NULL ,
    `email` varchar(64)  NOT NULL ,
    `admin` boolean  NOT NULL ,
	`token` varchar(128) ,
    PRIMARY KEY (
        `uuid`
    )
);

CREATE TABLE `UserStation` (
    `usUuid` varchar(128)  NOT NULL ,
    `stUuid` varchar(128)  NOT NULL ,
    `notifications` boolean  NOT NULL ,
    PRIMARY KEY (
        `usUuid`,`stUuid`
    )
);

CREATE TABLE `Station` (
    `uuid` varchar(128)  NOT NULL ,
    `name` varchar(64)  NOT NULL ,
    `location` varchar(128)  NULL ,
    `temp` float  NOT NULL ,
    `moist` float  NOT NULL ,
    `deleted` boolean  NOT NULL ,
    PRIMARY KEY (
        `uuid`
    )
);

CREATE TABLE `Measurement` (
    `time` int  NOT NULL ,
    `uuidSt` varchar(128)  NOT NULL ,
    `temp` float  NOT NULL ,
    `moist` float  NOT NULL ,
    `alarming` boolean  NOT NULL ,
    `deleted` boolean  NOT NULL ,
    PRIMARY KEY (
        `time`,`uuidSt`
    )
);

CREATE TABLE `HourAverage` (
    `time` int  NOT NULL ,
    `uuidSt` varchar(128)  NOT NULL ,
    `avgTemp` float  NOT NULL ,
    `avgMoist` float  NOT NULL ,
    `alarming` boolean  NOT NULL ,
    `deleted` boolean  NOT NULL ,
    PRIMARY KEY (
        `time`,`uuidSt`
    )
);

ALTER TABLE `UserStation` ADD CONSTRAINT `fk_UserStation_usUuid` FOREIGN KEY(`usUuid`)
REFERENCES `User` (`uuid`);

ALTER TABLE `UserStation` ADD CONSTRAINT `fk_UserStation_stUuid` FOREIGN KEY(`stUuid`)
REFERENCES `Station` (`uuid`);

ALTER TABLE `Measurement` ADD CONSTRAINT `fk_Measurement_uuidSt` FOREIGN KEY(`uuidSt`)
REFERENCES `Station` (`uuid`);

ALTER TABLE `HourAverage` ADD CONSTRAINT `fk_HourAverage_uuidSt` FOREIGN KEY(`uuidSt`)
REFERENCES `Station` (`uuid`);

CREATE INDEX `idx_Station_name`
ON `Station` (`name`);

