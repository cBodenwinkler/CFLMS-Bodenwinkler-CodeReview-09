-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2020 at 04:12 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `office_ID` int(11) NOT NULL,
  `office_name` varchar(55) DEFAULT NULL,
  `fk_address_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `package_type`
--

CREATE TABLE `package_type` (
  `package_type_ID` int(11) NOT NULL,
  `package_type` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(4, 'W-JKS22', 'Scania', 'VAN');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_ID` int(11) NOT NULL,
  `type` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zip`
--

CREATE TABLE `zip` (
  `zip_code` int(11) NOT NULL,
  `zip_city` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
