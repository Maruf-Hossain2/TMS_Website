-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 02:31 PM
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
-- Database: `tms_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','confirmed','canceled') DEFAULT 'pending',
  `source` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `shipment_id`, `booking_date`, `status`, `source`, `destination`, `vehicle_id`, `booking_id`) VALUES
(19, 11, NULL, '2024-12-14 11:56:42', 'confirmed', 'Bangladesh', 'Moon', NULL, NULL),
(20, 11, NULL, '2024-12-14 16:16:29', 'confirmed', 'Earth', 'earth', NULL, NULL),
(21, 11, NULL, '2024-12-14 16:22:31', 'confirmed', 'moon', 'earth', NULL, NULL),
(22, 11, NULL, '2024-12-15 16:25:17', 'confirmed', 'vcgfgf', 'vfhfuf68', NULL, NULL),
(23, 11, NULL, '2024-12-15 16:33:10', 'confirmed', 'abcde12345', '12345abcde', NULL, NULL),
(24, 11, NULL, '2024-12-15 17:07:50', '', 'Hooman', 'Alien', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `amount` decimal(10,2) NOT NULL,
  `method` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `client_id`, `shipment_id`, `payment_date`, `amount`, `method`) VALUES
(2, 11, NULL, '2024-08-01 10:00:00', 800.00, 'credit card');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `start_point` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `distance` float NOT NULL,
  `estimated_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `status` enum('pending','picked_up','in_transit','delivered','canceled') DEFAULT 'pending',
  `shipment_date` date DEFAULT NULL,
  `pickup_time` datetime DEFAULT NULL,
  `special_instructions` text DEFAULT NULL,
  `items_list` text DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `client_id`, `source`, `destination`, `driver_id`, `vehicle_id`, `status`, `shipment_date`, `pickup_time`, `special_instructions`, `items_list`, `booking_id`) VALUES
(17, 11, 'Bangladesh', '0', 13, 4, 'pending', NULL, NULL, NULL, NULL, NULL),
(18, 11, 'Sun', '0', 13, 4, 'picked_up', NULL, NULL, NULL, NULL, NULL),
(19, 11, 'Abc', '0', 15, 4, 'pending', NULL, NULL, NULL, NULL, NULL),
(20, 11, 'gggg', '0', 15, 4, 'delivered', NULL, NULL, NULL, NULL, NULL),
(25, 11, 'moon', 'earth', NULL, 4, 'pending', NULL, '2024-12-15 16:43:04', NULL, NULL, NULL),
(36, 20, 'abc', 'pqr', 15, 5, 'in_transit', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipment_locations`
--

CREATE TABLE `shipment_locations` (
  `id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','client','driver') NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `vehicle_id`, `phone`, `address`, `profile_pic`) VALUES
(11, 'client', 'client@gmail.com', '$2y$10$AYbTeVZaTe2ARYX4KT5BAe/UZ6ZV9C7ADHmRG5LYOWK6bkUa5He36', 'client', NULL, '0173354', 'Tali office road, dhaka 1209', 'uploads/Screenshot 2024-12-07 184644.png'),
(12, 'admin', 'admin@gmail.com', '$2y$10$WDIuPEu6q/2/v9Guo7djY.CXP57mYwyachJ0oIso9JCRw/nFy6cY6', 'admin', NULL, '62346546', NULL, 'uploads/Screenshot 2024-12-07 184248.png'),
(13, 'driver', 'driver@gmail.com', '$2y$10$SWOfFN7odXEhdYsX38mppOEwSv5wsKU4oSZc/dnBJJGF7pZD6LXcy', 'driver', NULL, NULL, NULL, NULL),
(15, 'driver1', 'driver1@gmail.com', '$2y$10$TyvpAQ6oWdquARScKRJAa.hyxRvAL4cI9FRaXL246NDWCUkBerguK', 'driver', NULL, '01745903062', '1/5 rayer bazar, tali office road, dhaka', 'uploads/Screenshot 2024-12-07 184248.png'),
(16, 'Alien', 'd@gmail.com', '$2y$10$GweKy1ns/lxBoHpDVhXAS.tzrgRdzs2IHMnEsonGOyxlf25KzzOyK', 'driver', NULL, NULL, NULL, NULL),
(17, 'driver', 'driver321@gmail.com', '$2y$10$GzrRUA0yoJ9efnAFycxG1uFl7jY0VXJcuuFQLFbIz6umBhdNNRCZC', 'driver', NULL, NULL, NULL, NULL),
(18, 'abc', 'abc@gmail.com', '$2y$10$ozm1wzU3usx5fgOFIVUQp.OZe7PYJjGP83.1wIXPxv76Razd8/rwm', 'driver', NULL, NULL, NULL, NULL),
(19, 'aaaa', 'aaaa@gmail.com', '$2y$10$FFS3j3RcXVPPEPdHRFzsxOe3sUMWRKgtLNUPB5eNHKfHNmQD24aOS', 'driver', NULL, NULL, NULL, NULL),
(20, 'a', 'a@gmail.com', '$2y$10$fU7szdHqvXcHhmx6r68YbuquuJScDR4vd1YBpO9HYPxIP5lAwt7Uq', 'client', NULL, NULL, NULL, NULL),
(21, 'b', 'b@gmail.com', '$2y$10$eOtM47u3QOJbYeyxtjOYG.KdwqiqGE28Iea/iqVZOQ4cUQH/Oe3ta', 'driver', NULL, NULL, NULL, NULL),
(22, 'c', 'c@gmail.com', '$2y$10$d3poyNpJMbRky1tfecRHj.fu0A0cLx4XG1FGmU2Da5Y06LStTVStm', 'admin', NULL, NULL, NULL, NULL),
(27, 'aaa', 'aaa@gmail.com', '$2y$10$lqlDVKx0Og1jys.b9xCQMuNset6oErBAifvNKX.SUxHl5xuDTRU6O', 'client', NULL, NULL, NULL, NULL),
(28, 'ab', 'ab@gmail.com', '$2y$10$p88qz8.bTo8OnZPEKyqgt.2TXn81RTwTvT6WS8W8y31/yywBeiQay', 'driver', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `vehicle_number` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `capacity` int(11) NOT NULL,
  `status` enum('available','in_transit','maintenance') DEFAULT 'available',
  `license_number` varchar(255) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `vehicle_number`, `type`, `capacity`, `status`, `license_number`, `driver_id`) VALUES
(4, '141', 'Truck', 24243, 'available', '0', NULL),
(5, 'Truck123', 'Truck', 1000, 'available', 'XYZ-456', NULL),
(6, '12645', 'afb', 415, 'available', '0', NULL),
(22, '123', 'Hooman', 4, 'available', '321', NULL),
(23, 'rst4', '3b3', 352, 'available', '2bbwr', NULL),
(24, '313vdaev', 'Mango', 132131, 'in_transit', '0', 17),
(25, '321cba321', 'Mango', 123, 'maintenance', '123', 18),
(26, 'acs', 'cacw', 131, 'in_transit', '0', 19),
(27, 'bbb', 'bbb', 111, 'available', 'bbb', 21),
(28, '0', 'ab', 123, 'available', 'ab12', 28);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_bookings_shipments` (`shipment_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `shipment_id` (`shipment_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `fk_shipments_bookings` (`booking_id`);

--
-- Indexes for table `shipment_locations`
--
ALTER TABLE `shipment_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_id` (`shipment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_users_vehicles` (`vehicle_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehicle_number` (`vehicle_number`),
  ADD KEY `fk_vehicles_drivers` (`driver_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `shipment_locations`
--
ALTER TABLE `shipment_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`),
  ADD CONSTRAINT `fk_bookings_shipments` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`);

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `fk_shipments_bookings` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `shipments_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `shipments_ibfk_3` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`);

--
-- Constraints for table `shipment_locations`
--
ALTER TABLE `shipment_locations`
  ADD CONSTRAINT `shipment_locations_ibfk_1` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_vehicles` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`);

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `fk_vehicles_drivers` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
