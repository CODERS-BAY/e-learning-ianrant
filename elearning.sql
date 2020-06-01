-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2020 at 09:44 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(15) NOT NULL,
  `size` int(4) DEFAULT NULL,
  `max_participant` int(2) DEFAULT NULL,
  `max_moderator` int(2) DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course_testing_module`
--

CREATE TABLE `course_testing_module` (
  `course_testing_module_id` int(11) NOT NULL,
  `course_id` int(15) DEFAULT NULL,
  `testing_module_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `learning_module`
--

CREATE TABLE `learning_module` (
  `learning_module_id` int(15) NOT NULL,
  `learning_module_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `learning_module_order`
--

CREATE TABLE `learning_module_order` (
  `learning_module_order_id` int(11) NOT NULL,
  `learning_module1_id` int(15) DEFAULT NULL,
  `learning_module2_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `learning_module_per_course`
--

CREATE TABLE `learning_module_per_course` (
  `learning_module_per_course_id` int(11) NOT NULL,
  `course_id` int(15) DEFAULT NULL,
  `learning_module_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `learning_object`
--

CREATE TABLE `learning_object` (
  `learning_object_id` int(11) NOT NULL,
  `learning_object_name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(15) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `person_role`
--

CREATE TABLE `person_role` (
  `person_id` int(15) NOT NULL,
  `course_id` int(15) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `question_text` varchar(200) DEFAULT NULL,
  `question_aw_true` varchar(200) DEFAULT NULL,
  `question_aw_false_1` varchar(200) DEFAULT NULL,
  `question_aw_false_2` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `question_testing_module`
--

CREATE TABLE `question_testing_module` (
  `question_testing_module_id` int(11) NOT NULL,
  `testing_module_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `requirement`
--

CREATE TABLE `requirement` (
  `requirement_id` int(15) NOT NULL,
  `course1_id` int(15) DEFAULT NULL,
  `course2_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `testing_module`
--

CREATE TABLE `testing_module` (
  `testing_module_id` int(11) NOT NULL,
  `testing_module_time` date DEFAULT NULL,
  `testing_module_deadline` date DEFAULT NULL,
  `testing_module_mode` varchar(20) DEFAULT NULL,
  `testing_module_definition` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `course_testing_module`
--
ALTER TABLE `course_testing_module`
  ADD PRIMARY KEY (`course_testing_module_id`),
  ADD UNIQUE KEY `course_id` (`course_id`,`testing_module_id`),
  ADD KEY `testing_module_id` (`testing_module_id`);

--
-- Indexes for table `learning_module`
--
ALTER TABLE `learning_module`
  ADD PRIMARY KEY (`learning_module_id`),
  ADD UNIQUE KEY `learning_module_name` (`learning_module_name`);

--
-- Indexes for table `learning_module_order`
--
ALTER TABLE `learning_module_order`
  ADD PRIMARY KEY (`learning_module_order_id`),
  ADD UNIQUE KEY `learning_module1_id` (`learning_module1_id`,`learning_module2_id`),
  ADD KEY `learning_module2_id` (`learning_module2_id`);

--
-- Indexes for table `learning_module_per_course`
--
ALTER TABLE `learning_module_per_course`
  ADD PRIMARY KEY (`learning_module_per_course_id`),
  ADD UNIQUE KEY `course_id` (`course_id`,`learning_module_id`),
  ADD KEY `learning_module_id` (`learning_module_id`);

--
-- Indexes for table `learning_object`
--
ALTER TABLE `learning_object`
  ADD PRIMARY KEY (`learning_object_id`),
  ADD UNIQUE KEY `learning_object_id` (`learning_object_id`,`learning_object_name`),
  ADD KEY `learning_object_name` (`learning_object_name`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `person_role`
--
ALTER TABLE `person_role`
  ADD PRIMARY KEY (`person_id`),
  ADD UNIQUE KEY `person_id` (`person_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `question_testing_module`
--
ALTER TABLE `question_testing_module`
  ADD PRIMARY KEY (`question_testing_module_id`),
  ADD UNIQUE KEY `testing_module_id` (`testing_module_id`,`question_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`requirement_id`),
  ADD UNIQUE KEY `course1_id` (`course1_id`,`course2_id`),
  ADD KEY `course2_id` (`course2_id`);

--
-- Indexes for table `testing_module`
--
ALTER TABLE `testing_module`
  ADD PRIMARY KEY (`testing_module_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course_testing_module`
--
ALTER TABLE `course_testing_module`
  MODIFY `course_testing_module_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `learning_module_order`
--
ALTER TABLE `learning_module_order`
  MODIFY `learning_module_order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `learning_module_per_course`
--
ALTER TABLE `learning_module_per_course`
  MODIFY `learning_module_per_course_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `learning_object`
--
ALTER TABLE `learning_object`
  MODIFY `learning_object_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_testing_module`
--
ALTER TABLE `question_testing_module`
  MODIFY `question_testing_module_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requirement`
--
ALTER TABLE `requirement`
  MODIFY `requirement_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testing_module`
--
ALTER TABLE `testing_module`
  MODIFY `testing_module_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_testing_module`
--
ALTER TABLE `course_testing_module`
  ADD CONSTRAINT `course_testing_module_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `course_testing_module_ibfk_2` FOREIGN KEY (`testing_module_id`) REFERENCES `testing_module` (`testing_module_id`);

--
-- Constraints for table `learning_module_order`
--
ALTER TABLE `learning_module_order`
  ADD CONSTRAINT `learning_module_order_ibfk_1` FOREIGN KEY (`learning_module1_id`) REFERENCES `learning_module` (`learning_module_id`),
  ADD CONSTRAINT `learning_module_order_ibfk_2` FOREIGN KEY (`learning_module2_id`) REFERENCES `learning_module` (`learning_module_id`);

--
-- Constraints for table `learning_module_per_course`
--
ALTER TABLE `learning_module_per_course`
  ADD CONSTRAINT `learning_module_per_course_ibfk_1` FOREIGN KEY (`learning_module_id`) REFERENCES `learning_module` (`learning_module_id`),
  ADD CONSTRAINT `learning_module_per_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `learning_object`
--
ALTER TABLE `learning_object`
  ADD CONSTRAINT `learning_object_ibfk_1` FOREIGN KEY (`learning_object_id`) REFERENCES `learning_module` (`learning_module_id`),
  ADD CONSTRAINT `learning_object_ibfk_2` FOREIGN KEY (`learning_object_name`) REFERENCES `learning_module` (`learning_module_name`);

--
-- Constraints for table `person_role`
--
ALTER TABLE `person_role`
  ADD CONSTRAINT `person_role_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  ADD CONSTRAINT `person_role_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `question_testing_module`
--
ALTER TABLE `question_testing_module`
  ADD CONSTRAINT `question_testing_module_ibfk_1` FOREIGN KEY (`testing_module_id`) REFERENCES `learning_module` (`learning_module_id`),
  ADD CONSTRAINT `question_testing_module_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);

--
-- Constraints for table `requirement`
--
ALTER TABLE `requirement`
  ADD CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`course1_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `requirement_ibfk_2` FOREIGN KEY (`course2_id`) REFERENCES `course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
