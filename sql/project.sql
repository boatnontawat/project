-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2024 at 01:11 AM
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
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_price` decimal(10,2) DEFAULT NULL,
  `item_image` varchar(255) DEFAULT NULL,
  `set_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `action`, `details`, `created_by`, `created_at`, `user_name`) VALUES
(121, 'Deleted Set', 'Deleted set with set_id: 97', NULL, '2024-12-21 15:12:03', 'เพชรมณี'),
(122, 'Updated Set', 'Updated set details for set_id 96. Name: ผ่าตัดแมว, Price: 1800.00, Sale Price: 1800.00, Image: hippo-1-728x485.jpg', NULL, '2024-12-21 15:12:14', 'เพชรมณี'),
(123, 'Updated item_id 13 in set_id 96 to new quantity 2.', '', NULL, '2024-12-21 15:12:18', 'เพชรมณี'),
(124, 'Finished managing set_id 96.', '', NULL, '2024-12-21 15:12:18', 'เพชรมณี'),
(125, 'Updated Set', 'Updated set details for set_id 96. Name: ผ่าตัดแมว, Price: 1800.00, Sale Price: 1800.00, Image: hippo-1-728x485.jpg', NULL, '2024-12-21 17:23:40', 'เพชรมณี'),
(126, 'Finished managing set_id 96.', '', NULL, '2024-12-21 17:23:41', 'เพชรมณี'),
(127, 'AddSet', 'Added set: ผ่าตัดแมว with discount 10%', 'เพชรมณี', '2024-12-21 17:39:25', ''),
(128, 'Added item_id 13 to set_id 98 with quantity 1.', '', 'เพชรมณี', '2024-12-21 17:39:28', ''),
(129, 'Updated quantity of item_id 13 in set_id 98.', 'Added 1 more.', 'เพชรมณี', '2024-12-21 17:41:03', ''),
(130, 'Updated quantity of item_id 13 in set_id 98.', 'Added 1 more.', 'เพชรมณี', '2024-12-21 17:42:07', ''),
(131, 'Updated quantity of item_id 13 in set_id 98.', 'Added 1 more.', 'เพชรมณี', '2024-12-21 17:42:54', ''),
(132, 'Added item_id 14 to set_id 98 with quantity 1.', '', 'เพชรมณี', '2024-12-21 17:45:22', ''),
(133, 'Updated quantity of item_id 14 in set_id 98.', 'Added 1 more.', 'เพชรมณี', '2024-12-21 17:45:48', ''),
(134, 'Added item_id 17 to set_id 98 with quantity 1.', '', 'เพชรมณี', '2024-12-21 17:48:55', ''),
(135, 'Finished managing set_id 98.', 'Completed adding/removing items.', 'เพชรมณี', '2024-12-21 17:50:53', ''),
(136, 'Updated Set', 'Updated set details for set_id 98. Name: ผ่าตัดแมว, Price: 1800.00, Sale Price: 1620.00, Image: 3698.JPG', NULL, '2024-12-21 17:53:34', 'เพชรมณี'),
(137, 'Finished managing set_id 98.', '', NULL, '2024-12-21 17:53:36', 'เพชรมณี'),
(138, 'Deleted Set', 'Deleted set with set_id: 98', NULL, '2024-12-21 17:53:58', 'เพชรมณี'),
(139, 'Deleted Set', 'Deleted set with set_id: 96', NULL, '2024-12-21 17:54:00', 'เพชรมณี'),
(140, 'AddSet', 'Added set: ผ่าตัดแมว with discount 0%', 'เพชรมณี', '2024-12-21 18:01:15', ''),
(141, 'AddSet', 'Added set: ผ่าตัดแมว with discount 0%', 'เพชรมณี', '2024-12-21 18:02:38', ''),
(142, 'Deleted Set', 'Deleted set with set_id: 99', NULL, '2024-12-21 18:05:58', 'เพชรมณี'),
(143, 'Deleted Set', 'Deleted set with set_id: 100', NULL, '2024-12-21 18:05:59', 'เพชรมณี');

-- --------------------------------------------------------

--
-- Table structure for table `mid_prices`
--

CREATE TABLE `mid_prices` (
  `id` int(11) NOT NULL,
  `mid_name` varchar(255) NOT NULL,
  `mid_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sets`
--

CREATE TABLE `sets` (
  `set_id` int(11) NOT NULL,
  `set_name` varchar(255) DEFAULT NULL,
  `set_price` decimal(10,2) DEFAULT NULL,
  `discount_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `set_image` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `user_price` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `set_items`
--

CREATE TABLE `set_items` (
  `set_item_id` int(11) NOT NULL,
  `set_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `add_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `hospital_name` varchar(255) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fk_set_id` (`set_id`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `mid_prices`
--
ALTER TABLE `mid_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sets`
--
ALTER TABLE `sets`
  ADD PRIMARY KEY (`set_id`);

--
-- Indexes for table `set_items`
--
ALTER TABLE `set_items`
  ADD PRIMARY KEY (`set_item_id`),
  ADD KEY `set_id` (`set_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `mid_prices`
--
ALTER TABLE `mid_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sets`
--
ALTER TABLE `sets`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `set_items`
--
ALTER TABLE `set_items`
  MODIFY `set_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_set_id` FOREIGN KEY (`set_id`) REFERENCES `sets` (`set_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
