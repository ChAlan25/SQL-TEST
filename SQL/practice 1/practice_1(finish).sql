-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2024 at 09:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `practice 1`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` text NOT NULL,
  `city` text NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `salesman_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `city`, `grade`, `salesman_id`) VALUES
(3001, 'Brad Guzan', 'London', NULL, 5001),
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3003, 'Jozy Altidor', 'Moncow', 200, 5007),
(3004, 'Fabian Johnson', 'Paris', 300, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3008, 'Julian Green', 'London', 300, 5002),
(3009, 'Geoff Camero', 'Berlin', 100, 5003);

-- --------------------------------------------------------

--
-- Table structure for table `item_mast`
--

CREATE TABLE `item_mast` (
  `pro_name` varchar(100) NOT NULL,
  `pro_price` double(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_mast`
--

INSERT INTO `item_mast` (`pro_name`, `pro_price`) VALUES
('ZIP drive', 250.00),
('Mouse', 250.00);

-- --------------------------------------------------------

--
-- Table structure for table `nobel_win`
--

CREATE TABLE `nobel_win` (
  `year` year(4) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `winner` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nobel_win`
--

INSERT INTO `nobel_win` (`year`, `subject`, `winner`, `country`, `category`) VALUES
('1971', 'literature', 'pablo neruda', 'Chile', 'Linguist'),
('1970', 'physics', 'louis neel', 'france', 'scientist'),
('1970', 'physics', 'hannes alfven', 'sweden', 'scientist'),
('1971', 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
('1970', 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
('1970', 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
('1994', 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist'),
('1994', 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
('1987', 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
('1987', 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
('1987', 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
('1987', 'Economics', 'Robert Solow', 'USA', 'Economist'),
('1971', 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
('1970', 'Economics', 'Paul Samuelson', 'USA', 'Economist');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_no` int(11) NOT NULL,
  `purch_amt` double NOT NULL,
  `order_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `salesman_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_no`, `purch_amt`, `order_date`, `customer_id`, `salesman_id`) VALUES
(70001, 150, '2016-10-05', 3005, 5002),
(70002, 65, '2016-10-05', 3002, 5001),
(70003, 2480, '2016-10-10', 3009, 0),
(70004, 110, '2016-08-17', 3009, 0),
(70005, 2400, '2016-07-27', 3007, 5001),
(70007, 948, '2016-09-10', 3005, 5002),
(70008, 5760, '2016-09-10', 3002, 5001),
(70009, 270, '2016-09-10', 3001, 0),
(70010, 1983, '2016-10-10', 3004, 5006),
(70011, 75, '2016-08-17', 3003, 5007),
(70012, 250, '2016-06-27', 3008, 5002);

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `salesman_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `city` text DEFAULT NULL,
  `commission` double(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`salesman_id`, `name`, `city`, `commission`) VALUES
(5000, 'James Hoog', 'New York', 0.15),
(5001, 'Nail Knite', 'Paris', 0.13),
(5002, 'Pit Alex', 'London', 0.11),
(5003, 'Mc Lyon', 'Paris', 0.14),
(5004, 'Lauson hen', '', 0.12),
(5005, 'Paul Adam', 'Rome', 0.13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `salesman_id` (`salesman_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_no`),
  ADD KEY `salesman_id` (`salesman_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`salesman_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `salesman`
--
ALTER TABLE `salesman`
  MODIFY `salesman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5006;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
