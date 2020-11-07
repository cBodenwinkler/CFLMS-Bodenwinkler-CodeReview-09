-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2020 at 09:40 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_christian_bodenwinkler_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_christian_bodenwinkler_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_christian_bodenwinkler_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_ID` int(11) NOT NULL,
  `address_street_name` varchar(55) NOT NULL,
  `address_house_number` int(11) NOT NULL,
  `address_country` varchar(55) NOT NULL,
  `fk_zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_ID`, `address_street_name`, `address_house_number`, `address_country`, `fk_zip_code`) VALUES
(1001, 'Neustiftgasse', 15, 'Austria', 1070),
(1002, 'Blindengasse', 8, 'Austria', 1080),
(1003, 'Huberweg', 44, 'Austria', 4040),
(1004, 'Horstforstweg', 13, 'Austria', 5020),
(1005, 'Pfeilgasse', 1, 'Austria', 8010),
(1006, 'Breiterweg', 115, 'Austria', 6020),
(2001, 'Neustiftgasse', 90, 'Austria', 1070),
(2002, 'Gürtelstraße', 33, 'Austria', 1080),
(2003, 'Wegerstraße', 29, 'Austria', 5020),
(2004, 'Straßerweg', 111, 'Austria', 6020),
(2005, 'Holzweg', 815, 'Austria', 8010),
(3001, 'Stellstraße', 44, 'Austria', 1070),
(3002, 'Hansweg', 334, 'Austria', 6020),
(3003, 'Holzgasse', 13, 'Austria', 5020),
(3004, 'Stellstraße', 14, 'Austria', 1080),
(3005, 'Schnellstraße', 44, 'Austria', 4040);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_ID` int(11) NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_time` time DEFAULT NULL,
  `fk_truck_ID` int(11) DEFAULT NULL,
  `fk_employee_ID` int(11) DEFAULT NULL,
  `fk_package_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_ID`, `delivery_date`, `delivery_time`, `fk_truck_ID`, `fk_employee_ID`, `fk_package_ID`) VALUES
(1, '1991-06-01', '13:33:00', 1, 10001, 1),
(2, '2015-12-08', '08:12:00', 3, 10003, 2),
(3, '2017-05-01', '09:15:00', 4, 10002, 3),
(4, '2020-12-05', '18:13:00', 1, 10004, 4),
(5, '2019-01-23', '07:05:00', 2, 10005, 5),
(6, '2015-05-18', '11:55:00', 2, 10006, 6),
(7, '2001-12-29', '12:41:00', 4, 10005, 7),
(8, '2009-08-20', '10:23:00', 3, 10003, 8);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_ID` int(11) NOT NULL,
  `employee_first_name` varchar(55) DEFAULT NULL,
  `employee_last_name` varchar(55) DEFAULT NULL,
  `employee_department` varchar(55) DEFAULT NULL,
  `fk_office_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_ID`, `employee_first_name`, `employee_last_name`, `employee_department`, `fk_office_ID`) VALUES
(10001, 'Hermann', 'Maier', 'Delivery', 1),
(10002, 'Fritz', 'Ehrenmann', 'Delivery', 2),
(10003, 'Gudrun', 'Mayr', 'Delivery', 3),
(10004, 'Alexander', 'Möller', 'Delivery', 4),
(10005, 'Thomas', 'Winkler', 'Delivery', 5),
(10006, 'Gabriel', 'Schütz', 'Delivery', 6),
(10008, 'Sebastian', 'Fellner', 'Office', 1),
(10009, 'Rene', 'Möller', 'Office', 2),
(10010, 'Roland', 'Oberwinkler', 'Office', 3),
(10011, 'Verena', 'Hochberger', 'Office', 4),
(10012, 'Helene', 'Hintervorderberger', 'Office', 5),
(10013, 'Miriam', 'Stadlbauer', 'Office', 6);

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `office_ID` int(11) NOT NULL,
  `office_name` varchar(55) DEFAULT NULL,
  `fk_address_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`office_ID`, `office_name`, `fk_address_ID`) VALUES
(1, 'Wien-Neubau', 1001),
(2, 'Wien-Josefstadt', 1002),
(3, 'Linz-Urfahr', 1003),
(4, 'Salzburg', 1004),
(5, 'Innsbruck', 1006),
(6, 'Graz', 1005);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_ID` int(11) NOT NULL,
  `package_date_deposited` date DEFAULT NULL,
  `fk_package_type_ID` int(11) DEFAULT NULL,
  `fk_sender_ID` int(11) DEFAULT NULL,
  `fk_recipient_ID` int(11) DEFAULT NULL,
  `fk_office_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_ID`, `package_date_deposited`, `fk_package_type_ID`, `fk_sender_ID`, `fk_recipient_ID`, `fk_office_ID`) VALUES
(1, '1991-05-27', 2, 2, 5, 3),
(2, '2015-12-03', 2, 4, 3, 2),
(3, '2017-04-17', 2, 3, 2, 5),
(4, '2020-11-01', 2, 1, 1, 1),
(5, '2019-01-21', 1, 2, 2, 2),
(6, '2015-05-15', 2, 3, 3, 3),
(7, '2001-12-23', 2, 4, 4, 4),
(8, '2009-08-11', 1, 5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `package_type`
--

CREATE TABLE `package_type` (
  `package_type_ID` int(11) NOT NULL,
  `package_type` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_type`
--

INSERT INTO `package_type` (`package_type_ID`, `package_type`) VALUES
(1, 'Mail'),
(2, 'Package');

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `recipient_ID` int(11) NOT NULL,
  `recipient_first_name` varchar(55) DEFAULT NULL,
  `recipient_last_name` varchar(55) DEFAULT NULL,
  `fk_address_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`recipient_ID`, `recipient_first_name`, `recipient_last_name`, `fk_address_ID`) VALUES
(1, 'Gertrude', 'Hansson', 3001),
(2, 'Herboldt', 'Gunslberger', 3002),
(3, 'Gianno', 'Branelli', 3003),
(4, 'Gundbrechthild', 'Scorpio', 3004),
(5, 'Hank', 'Hinterberger', 3005);

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

CREATE TABLE `sender` (
  `sender_ID` int(11) NOT NULL,
  `sender_first_name` varchar(55) NOT NULL,
  `sender_last_name` varchar(55) NOT NULL,
  `fk_type_ID` int(11) DEFAULT NULL,
  `fk_address_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`sender_ID`, `sender_first_name`, `sender_last_name`, `fk_type_ID`, `fk_address_ID`) VALUES
(1, 'Friedrich', 'Schmitt', 1, 2001),
(2, 'Laura', 'Mayr', 1, 2002),
(3, 'Herbert', 'Zausser', 2, 2004),
(4, 'Elisabeth', 'Vogel', 1, 2003),
(5, 'Friedrich', 'Thaler', 2, 2005);

-- --------------------------------------------------------

--
-- Table structure for table `truck`
--

CREATE TABLE `truck` (
  `truck_ID` int(11) NOT NULL,
  `truck_licence` varchar(55) NOT NULL,
  `truck_manufacturer` varchar(55) NOT NULL,
  `truck_type` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `truck`
--

INSERT INTO `truck` (`truck_ID`, `truck_licence`, `truck_manufacturer`, `truck_type`) VALUES
(1, 'W-3432J', 'MAN', 'VAN'),
(2, 'L-8973F', 'VOLVO', 'Truck'),
(3, 'S-399H9', 'MAN', 'Truck'),
(4, 'W-JKS22', 'Scania', 'VAN'),
(5, 'L-3432J', 'MAN', 'VAN'),
(6, 'I-3212J', 'MAN', 'Truck'),
(7, 'KL-F2221', 'MAN', 'Truck'),
(8, 'WL-33233', 'Scania', 'VAN');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_ID` int(11) NOT NULL,
  `type` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_ID`, `type`) VALUES
(1, 'Private'),
(2, 'Company');

-- --------------------------------------------------------

--
-- Table structure for table `zip`
--

CREATE TABLE `zip` (
  `zip_code` int(11) NOT NULL,
  `zip_city` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zip`
--

INSERT INTO `zip` (`zip_code`, `zip_city`) VALUES
(1070, 'Wien-Neubau'),
(1080, 'Wien-Josefstadt'),
(4040, 'Linz'),
(5020, 'Salzburg'),
(6020, 'Innsbruck'),
(8010, 'Graz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_ID`),
  ADD KEY `fk_zip_code` (`fk_zip_code`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_ID`),
  ADD KEY `fk_truck_ID` (`fk_truck_ID`),
  ADD KEY `fk_employee_ID` (`fk_employee_ID`),
  ADD KEY `fk_package_ID` (`fk_package_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_ID`),
  ADD KEY `fk_office_ID` (`fk_office_ID`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_ID`),
  ADD KEY `fk_package_type_ID` (`fk_package_type_ID`),
  ADD KEY `fk_sender_ID` (`fk_sender_ID`),
  ADD KEY `fk_recipient_ID` (`fk_recipient_ID`),
  ADD KEY `fk_office_ID` (`fk_office_ID`);

--
-- Indexes for table `package_type`
--
ALTER TABLE `package_type`
  ADD PRIMARY KEY (`package_type_ID`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`sender_ID`),
  ADD KEY `fk_type_ID` (`fk_type_ID`),
  ADD KEY `fk_address_ID` (`fk_address_ID`);

--
-- Indexes for table `truck`
--
ALTER TABLE `truck`
  ADD PRIMARY KEY (`truck_ID`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_ID`);

--
-- Indexes for table `zip`
--
ALTER TABLE `zip`
  ADD PRIMARY KEY (`zip_code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`fk_zip_code`) REFERENCES `zip` (`zip_code`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`fk_truck_ID`) REFERENCES `truck` (`truck_ID`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`fk_employee_ID`) REFERENCES `employee` (`employee_ID`),
  ADD CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`fk_package_ID`) REFERENCES `package` (`package_ID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_office_ID`) REFERENCES `office` (`office_ID`);

--
-- Constraints for table `office`
--
ALTER TABLE `office`
  ADD CONSTRAINT `office_ibfk_1` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`address_ID`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_package_type_ID`) REFERENCES `package_type` (`package_type_ID`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_sender_ID`) REFERENCES `sender` (`sender_ID`),
  ADD CONSTRAINT `package_ibfk_3` FOREIGN KEY (`fk_recipient_ID`) REFERENCES `recipient` (`recipient_ID`),
  ADD CONSTRAINT `package_ibfk_4` FOREIGN KEY (`fk_office_ID`) REFERENCES `office` (`office_ID`);

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`address_ID`);

--
-- Constraints for table `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`fk_type_ID`) REFERENCES `type` (`type_ID`),
  ADD CONSTRAINT `sender_ibfk_2` FOREIGN KEY (`fk_address_ID`) REFERENCES `address` (`address_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
