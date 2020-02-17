-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 17, 2020 at 02:31 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `airline_reservation`
--
CREATE DATABASE IF NOT EXISTS `airline_reservation` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `airline_reservation`;

-- --------------------------------------------------------

--
-- Table structure for table `credit_card_details`
--

CREATE TABLE IF NOT EXISTS `credit_card_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `card_number` varchar(50) DEFAULT NULL,
  `card_type` varchar(32) DEFAULT NULL,
  `expiration_month` varchar(32) DEFAULT NULL,
  `expiration_year` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `credit_card_details`
--

INSERT INTO `credit_card_details` (`id`, `customer_id`, `card_number`, `card_type`, `expiration_month`, `expiration_year`) VALUES
(1, 1, '54672305670889071100', 'VISA', 'January', '2021'),
(2, 2, '42608247874748787387', 'VERVE', 'June', '2025');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UC_customer` (`email_id`,`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `address`, `phone`, `email_id`) VALUES
(1, 'Mayowa', 'Adeleke', '27 Buckwood Street Lekki', '09094786532', 'mayowadeleke@gmail.com'),
(2, 'Victor', 'Gift', '20 Buckwood Street Lekki', '09094824585', 'victorgift@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE IF NOT EXISTS `flight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airline_id` varchar(32) DEFAULT NULL,
  `airline_name` varchar(32) DEFAULT NULL,
  `fro_location` varchar(32) DEFAULT NULL,
  `to_location` varchar(32) DEFAULT NULL,
  `dep_time` time DEFAULT NULL,
  `arr_time` time DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`id`, `airline_id`, `airline_name`, `fro_location`, `to_location`, `dep_time`, `arr_time`, `customer_id`) VALUES
(1, '1', 'AIRPEACE', 'ABUJA', 'LAGOS', '15:30:00', '17:30:00', 1),
(2, '2', 'AIRPEACE', 'ABUJA', 'PORTHARCOURT', '14:30:00', '17:30:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `flight_details`
--

CREATE TABLE IF NOT EXISTS `flight_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flight_id` int(16) DEFAULT NULL,
  `flight_departure_date` date DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `class` varchar(32) DEFAULT NULL,
  `available_seats` varchar(32) DEFAULT NULL,
  `total_seats` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flight_id` (`flight_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `flight_details`
--

INSERT INTO `flight_details` (`id`, `flight_id`, `flight_departure_date`, `price`, `class`, `available_seats`, `total_seats`) VALUES
(1, 1, '2020-02-20', '23000.00', 'ECONOMY', '56', '100'),
(2, 2, '2020-02-21', '43000.00', 'BUSINESS', '55', '100');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE IF NOT EXISTS `ticket_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(32) DEFAULT NULL,
  `flight_id` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ticket_details`
--

INSERT INTO `ticket_details` (`id`, `customer_id`, `flight_id`) VALUES
(1, 1, 1),
(2, 2, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `credit_card_details`
--
ALTER TABLE `credit_card_details`
  ADD CONSTRAINT `credit_card_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD CONSTRAINT `flight_details_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`);

--
-- Constraints for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD CONSTRAINT `ticket_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
