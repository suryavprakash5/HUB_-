-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2024 at 08:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab5`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DNo` int(11) NOT NULL,
  `DName` varchar(20) DEFAULT NULL,
  `MgrSSN` int(11) DEFAULT NULL,
  `MgrStartDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DNo`, `DName`, `MgrSSN`, `MgrStartDate`) VALUES
(1, 'HEAD EUATERS', 103, '2018-05-15'),
(2, 'BANK', 101, '2022-08-22'),
(3, 'SURVEY', 102, '2021-08-22'),
(4, 'ACCOUNTS', 104, '2019-01-01'),
(5, 'RESEARCH', 105, '2021-07-22');

-- --------------------------------------------------------

--
-- Table structure for table `dlocation`
--

CREATE TABLE `dlocation` (
  `DNo` int(11) NOT NULL,
  `DLoc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dlocation`
--

INSERT INTO `dlocation` (`DNo`, `DLoc`) VALUES
(1, 'HOUSTON'),
(4, 'STAFFORD'),
(5, 'BELOW'),
(5, 'HOUSTON'),
(5, 'NAGAR');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `SSN` int(11) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Salary` double DEFAULT NULL,
  `SuperSSN` int(11) DEFAULT NULL,
  `DNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`SSN`, `FName`, `LName`, `Address`, `Gender`, `Salary`, `SuperSSN`, `DNo`) VALUES
(101, 'John', 'scott', 'houston', 'M', 30000, 103, 1),
(102, 'Varun', 'Sharma', 'Mysore', 'M', 30000, 104, 4),
(103, 'Chai', 'B M', 'Mandya', 'F', 40000, 105, 5),
(104, 'Yashi', 'Khandelwal', 'Hassan', 'F', 45000, 104, 4),
(105, 'William', 'Shakesphere', 'Hassan', 'M', 45000, 105, 5),
(106, 'CHOLI', 'HUMBLE', 'MADKERI', 'M', 62000, 103, 1),
(107, 'JEEVITHA', 'SHARMA', 'S', 'F', 61000, 103, 1),
(108, 'ROOPA', 'C', 'N', 'F', 60000, 103, 1),
(109, 'SRI', 'RAM', 'S', 'M', 65000, 103, 1),
(110, 'RAMA', 'SEETHA', 'HUMBLE', 'F', 61000, 103, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `PNo` int(11) NOT NULL,
  `PName` varchar(20) DEFAULT NULL,
  `PLocation` varchar(20) DEFAULT NULL,
  `DNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`PNo`, `PName`, `PLocation`, `DNo`) VALUES
(1, 'PRODUCT X', 'BELLAR', 5),
(3, 'IOT', 'HOUSTON', 5),
(10, 'PRODUCT Z', 'STAFFORD', 4),
(20, 'REORGANIZATION', 'HOUSTON', 1),
(30, 'NEW BENIFITS', 'STAFFORD', 4);

-- --------------------------------------------------------

--
-- Table structure for table `workson`
--

CREATE TABLE `workson` (
  `SSN` int(11) NOT NULL,
  `PNo` int(11) NOT NULL,
  `Hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workson`
--

INSERT INTO `workson` (`SSN`, `PNo`, `Hours`) VALUES
(101, 1, 33),
(102, 1, 20),
(102, 3, 40),
(103, 3, 10),
(104, 1, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DNo`),
  ADD KEY `MgrSSN` (`MgrSSN`);

--
-- Indexes for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD PRIMARY KEY (`DNo`,`DLoc`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `SuperSSN` (`SuperSSN`),
  ADD KEY `DNo` (`DNo`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`PNo`),
  ADD KEY `DNo` (`DNo`);

--
-- Indexes for table `workson`
--
ALTER TABLE `workson`
  ADD PRIMARY KEY (`SSN`,`PNo`),
  ADD KEY `PNo` (`PNo`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MgrSSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD CONSTRAINT `dlocation_ibfk_1` FOREIGN KEY (`DNo`) REFERENCES `department` (`DNo`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SuperSSN`) REFERENCES `employee` (`SSN`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`DNo`) REFERENCES `department` (`DNo`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`DNo`) REFERENCES `department` (`DNo`);

--
-- Constraints for table `workson`
--
ALTER TABLE `workson`
  ADD CONSTRAINT `workson_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`),
  ADD CONSTRAINT `workson_ibfk_2` FOREIGN KEY (`PNo`) REFERENCES `project` (`PNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
