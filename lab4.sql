-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2024 at 08:14 PM
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
-- Database: `lab4`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `USN` varchar(30) NOT NULL,
  `SSID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`USN`, `SSID`) VALUES
('1BI15CS100', 101),
('1BI15CS101', 101),
('1BI15CS102', 101),
('1BI15CS103', 102),
('1BI15CS104', 103);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `SUBCODE` varchar(7) NOT NULL,
  `TITLE` varchar(20) DEFAULT NULL,
  `SEM` int(11) DEFAULT NULL,
  `CREDITS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`SUBCODE`, `TITLE`, `SEM`, `CREDITS`) VALUES
('18CS51', 'MEIT', 3, 5),
('18CS52', 'CNS', 8, 6),
('18CS53', 'DBMS', 5, 4),
('18CS54', 'ATC', 5, 3),
('18CS55', 'ADP', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `iamarks`
--

CREATE TABLE `iamarks` (
  `USN` varchar(10) NOT NULL,
  `SUBCODE` varchar(7) NOT NULL,
  `SSID` int(11) NOT NULL,
  `Test1` int(11) NOT NULL,
  `Test2` int(11) NOT NULL,
  `Test3` int(11) NOT NULL,
  `FinalIA` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `iamarks`
--

INSERT INTO `iamarks` (`USN`, `SUBCODE`, `SSID`, `Test1`, `Test2`, `Test3`, `FinalIA`) VALUES
('1BI15CS100', '18CS51', 101, 2, 1, 20, 11),
('1BI15CS101', '18CS53', 101, 22, 20, 20, 21),
('1BI15CS102', '18CS52', 101, 22, 20, 21, 21.5),
('1BI15CS103', '18CS54', 103, 13, 20, 20, 20),
('1BI15CS104', '18CS55', 103, 24, 20, 20, 22);

-- --------------------------------------------------------

--
-- Stand-in structure for view `mark`
-- (See below for the actual view)
--
CREATE TABLE `mark` (
`SUBCODE` varchar(7)
,`TEST1` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `semsec`
--

CREATE TABLE `semsec` (
  `SSID` int(11) NOT NULL,
  `Sem` int(11) NOT NULL,
  `Sec` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semsec`
--

INSERT INTO `semsec` (`SSID`, `Sem`, `Sec`) VALUES
(101, 4, 'C'),
(102, 4, 'C'),
(103, 5, 'A'),
(104, 4, 'C'),
(105, 5, 'B'),
(106, 8, 'A'),
(107, 8, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `USN` varchar(10) NOT NULL,
  `SNAME` varchar(30) NOT NULL,
  `ADDRESS` varchar(30) NOT NULL,
  `PHONE` bigint(10) DEFAULT NULL,
  `GENDER` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`USN`, `SNAME`, `ADDRESS`, `PHONE`, `GENDER`) VALUES
('1BI15CS100', 'JEEVI', 'PIRIYA PATTANA', 9164922644, 'F'),
('1BI15CS101', 'RAYAN', 'MANDYA', 9164001122, 'M'),
('1BI15CS102', 'AMMU', 'K R PETE', 9888899123, 'F'),
('1BI15CS103', 'XYZ', 'BANGALORE', 9164024259, 'M'),
('1BI15CS104', 'MADHU', 'HUNSUR', 9164024444, 'F'),
('1IB15CS106', 'PUNYA', 'MYSORE', 9164922640, 'F'),
('1IB21CS106', 'PUNYA', 'MYSORE', 1234567890, 'F');

-- --------------------------------------------------------

--
-- Structure for view `mark`
--
DROP TABLE IF EXISTS `mark`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mark`  AS SELECT `iamarks`.`SUBCODE` AS `SUBCODE`, `iamarks`.`Test1` AS `TEST1` FROM `iamarks` WHERE `iamarks`.`USN` = '1BI15CS101' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`USN`,`SSID`),
  ADD KEY `SSID` (`SSID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`SUBCODE`);

--
-- Indexes for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD PRIMARY KEY (`USN`,`SUBCODE`,`SSID`),
  ADD KEY `SUBCODE` (`SUBCODE`),
  ADD KEY `SSID` (`SSID`);

--
-- Indexes for table `semsec`
--
ALTER TABLE `semsec`
  ADD PRIMARY KEY (`SSID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`USN`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `student` (`USN`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`SSID`) REFERENCES `semsec` (`SSID`) ON DELETE CASCADE;

--
-- Constraints for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD CONSTRAINT `iamarks_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `student` (`USN`) ON DELETE CASCADE,
  ADD CONSTRAINT `iamarks_ibfk_2` FOREIGN KEY (`SUBCODE`) REFERENCES `course` (`SUBCODE`) ON DELETE CASCADE,
  ADD CONSTRAINT `iamarks_ibfk_3` FOREIGN KEY (`SSID`) REFERENCES `semsec` (`SSID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
