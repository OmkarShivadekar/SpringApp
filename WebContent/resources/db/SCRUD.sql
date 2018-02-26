-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 26, 2018 at 02:58 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SCRUD`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(30) NOT NULL,
  `city` varchar(15) NOT NULL,
  `phone` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `gender`, `address`, `city`, `phone`) VALUES
(1, 'Omkar Shivadekar', 'male', 'Mangalwar Peth', 'Karad', 9999999999),
(2, 'Mukesh Borana', 'male', 'Yerwada', 'Pune', 8888888888),
(3, 'Sarang Kamble', 'male', 'Hinjewadi', 'Karad', 7789977889),
(4, 'Sandip Batule', 'male', 'Shewalwadi', 'Satara', 7777777777),
(5, 'Vijay Ranka', 'male', 'Rajasthan', 'Satara', 9874563210),
(6, 'Sushant Kamble', 'male', 'Krishna Nagar', 'Satara', 9966554477),
(7, 'Sarang Kamble', 'male', 'Hinjewadi', 'Satara', 7789977889),
(8, 'Himanshu Patel', 'male', 'Anand', 'Karad', 7788448855),
(10, 'Aliya Bhatt', 'female', 'Mumbai', 'Pune', 8877996655),
(11, 'Kriti Sanon', 'female', 'Mumbai', 'Pune', 8877996656);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
