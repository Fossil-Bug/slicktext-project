-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 05, 2024 at 01:49 AM
-- Server version: 8.0.39
-- PHP Version: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slicktext`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mobile_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `zip` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `mobile_number`, `address`, `city`, `state`, `zip`, `created`, `last_updated`) VALUES
(1, 'Hannah', 'Johnson', 'hannah.johnson@example.com', '(570) 631-9066', '202 Birch Rd', 'Chicago', 'OH', 40492, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(2, 'Bob', 'Johnson', 'bob.johnson@example.com', '(396) 886-4111', '123 Main St', 'San Antonio', 'OH', 79727, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(3, 'Jane', 'Smith', 'jane.smith@example.com', '(206) 351-7100', '101 Maple Ln', 'Phoenix', 'PA', 25038, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(4, 'Jane', 'Smith', 'jane.smith@example.com', '(399) 603-2301', '789 Pine Dr', 'Chicago', 'FL', 53868, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(5, 'Frank', 'Doe', 'frank.doe@example.com', '(555) 149-7011', '456 Oak Ave', 'Dallas', 'PA', 68659, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(6, 'Eve', 'Smith', 'eve.smith@example.com', '(857) 839-2924', '202 Birch Rd', 'New York', 'OH', 75800, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(7, 'Hannah', 'Miller', 'hannah.miller@example.com', '(981) 806-2396', '202 Birch Rd', 'Houston', 'OH', 13123, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(8, 'Eve', 'Miller', 'eve.miller@example.com', '(978) 213-9943', '707 Willow Way', 'Houston', 'MI', 37178, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(9, 'Grace', 'Smith', 'grace.smith@example.com', '(237) 426-6069', '303 Cedar Blvd', 'Phoenix', 'FL', 56497, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(10, 'Hannah', 'Martinez', 'hannah.martinez@example.com', '(101) 921-1668', '202 Birch Rd', 'Austin', 'GA', 73786, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(11, 'Eve', 'Garcia', 'eve.garcia@example.com', '(626) 367-2670', '202 Birch Rd', 'New York', 'GA', 49272, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(12, 'Hannah', 'Garcia', 'hannah.garcia@example.com', '(805) 659-4791', '123 Main St', 'Los Angeles', 'OH', 94766, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(13, 'Bob', 'Garcia', 'bob.garcia@example.com', '(961) 928-1035', '789 Pine Dr', 'Dallas', 'TX', 91154, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(14, 'Frank', 'Jones', 'frank.jones@example.com', '(840) 774-9170', '101 Maple Ln', 'San Antonio', 'IL', 46494, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(15, 'Alice', 'Jones', 'alice.jones@example.com', '(273) 210-7935', '707 Willow Way', 'Dallas', 'GA', 12436, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(16, 'Hannah', 'Jones', 'hannah.jones@example.com', '(390) 442-7923', '505 Ash Cir', 'New York', 'TX', 79630, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(17, 'Hannah', 'Smith', 'hannah.smith@example.com', '(651) 199-4643', '404 Elm St', 'New York', 'MI', 58766, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(18, 'Eve', 'Doe', 'eve.doe@example.com', '(470) 234-2776', '123 Main St', 'New York', 'FL', 55345, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(19, 'John', 'Garcia', 'john.garcia@example.com', '(484) 246-8070', '707 Willow Way', 'Los Angeles', 'OH', 20487, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(20, 'Alice', 'Brown', 'alice.brown@example.com', '(388) 487-3569', '789 Pine Dr', 'New York', 'PA', 54129, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(21, 'Frank', 'Miller', 'frank.miller@example.com', '(193) 390-7334', '404 Elm St', 'Houston', 'CA', 34729, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(22, 'Jane', 'Williams', 'jane.williams@example.com', '(285) 908-4331', '101 Maple Ln', 'Chicago', 'FL', 20126, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(23, 'John', 'Davis', 'john.davis@example.com', '(947) 697-3896', '101 Maple Ln', 'Dallas', 'GA', 96044, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(24, 'Eve', 'Garcia', 'eve.garcia@example.com', '(115) 506-4781', '101 Maple Ln', 'New York', 'TX', 21494, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(25, 'John', 'Davis', 'john.davis@example.com', '(744) 594-7695', '123 Main St', 'Houston', 'TX', 12759, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(26, 'Charlie', 'Doe', 'charlie.doe@example.com', '(926) 743-1666', '101 Maple Ln', 'Austin', 'FL', 51396, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(27, 'Charlie', 'Smith', 'charlie.smith@example.com', '(347) 312-9900', '101 Maple Ln', 'Dallas', 'OH', 92957, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(28, 'Alice', 'Garcia', 'alice.garcia@example.com', '(400) 618-6025', '303 Cedar Blvd', 'New York', 'NY', 70444, '2024-12-02 12:32:43', '2024-12-02 12:32:43'),
(29, 'Jane', 'Garcia', 'jane.garcia@example.com', '(440) 216-8165', '707 Willow Way', 'Austin', 'NY', 51621, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(30, 'Alice', 'Doe', 'alice.doe@example.com', '(518) 746-9787', '606 Redwood Pl', 'Chicago', 'TX', 56137, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(31, 'Charlie', 'Brown', 'charlie.brown@example.com', '(876) 209-7519', '404 Elm St', 'Philadelphia', 'NY', 79803, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(32, 'David', 'Garcia', 'david.garcia@example.com', '(124) 311-7957', '606 Redwood Pl', 'Phoenix', 'PA', 45394, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(33, 'Eve', 'Johnson', 'eve.johnson@example.com', '(541) 977-5553', '303 Cedar Blvd', 'Los Angeles', 'FL', 73699, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(34, 'Bob', 'Davis', 'bob.davis@example.com', '(683) 635-9618', '707 Willow Way', 'Los Angeles', 'CA', 29281, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(35, 'John', 'Garcia', 'john.garcia@example.com', '(280) 269-6942', '505 Ash Cir', 'Phoenix', 'CA', 64364, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(36, 'Charlie', 'Doe', 'charlie.doe@example.com', '(541) 996-7893', '789 Pine Dr', 'Houston', 'CA', 75418, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(37, 'Jane', 'Jones', 'jane.jones@example.com', '(290) 709-8573', '505 Ash Cir', 'Austin', 'FL', 54823, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(38, 'Grace', 'Martinez', 'grace.martinez@example.com', '(688) 763-5220', '202 Birch Rd', 'Chicago', 'IL', 48448, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(39, 'John', 'Doe', 'john.doe@example.com', '(889) 536-2000', '606 Redwood Pl', 'New York', 'CA', 81430, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(40, 'Bob', 'Doe', 'bob.doe@example.com', '(602) 322-7768', '456 Oak Ave', 'Houston', 'PA', 34019, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(41, 'Jane', 'Miller', 'jane.miller@example.com', '(733) 200-2720', '202 Birch Rd', 'Houston', 'TX', 42538, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(42, 'Grace', 'Miller', 'grace.miller@example.com', '(311) 411-2606', '505 Ash Cir', 'San Diego', 'PA', 38112, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(43, 'Jane', 'Johnson', 'jane.johnson@example.com', '(839) 357-9994', '606 Redwood Pl', 'Dallas', 'GA', 82430, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(44, 'David', 'Davis', 'david.davis@example.com', '(384) 507-2392', '789 Pine Dr', 'Los Angeles', 'OH', 39732, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(45, 'David', 'Doe', 'david.doe@example.com', '(352) 742-1051', '789 Pine Dr', 'Chicago', 'IL', 89852, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(46, 'Frank', 'Johnson', 'frank.johnson@example.com', '(680) 614-6856', '123 Main St', 'Phoenix', 'MI', 33942, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(47, 'Alice', 'Brown', 'alice.brown@example.com', '(532) 835-1588', '303 Cedar Blvd', 'New York', 'CA', 28940, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(48, 'John', 'Jones', 'john.jones@example.com', '(575) 286-6265', '404 Elm St', 'Dallas', 'NC', 49338, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(49, 'David', 'Johnson', 'david.johnson@example.com', '(488) 603-5900', '123 Main St', 'Los Angeles', 'CA', 36425, '2024-12-02 12:32:44', '2024-12-02 12:32:44'),
(50, 'Hannah', 'Smith', 'hannah.smith@example.com', '(515) 524-5132', '606 Redwood Pl', 'Phoenix', 'IL', 77588, '2024-12-02 12:32:44', '2024-12-02 12:32:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
