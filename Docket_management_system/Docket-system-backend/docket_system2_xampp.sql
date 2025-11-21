-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2025 at 10:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `docket_system2`
--
CREATE DATABASE IF NOT EXISTS docket_system2;
USE docket_system2;
-- --------------------------------------------------------
--

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('super_admin','finance_officer','exam_officer','registry_officer') NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password_hash`, `role`, `status`, `created_at`, `updated_at`, `password`) VALUES
(1, 'REWARDSON', '$2a$12$jSLcmly2Y6ULhnRUVCl0kehZA.OsvzXMZQ6tw/4YTekJWgtY8tNUm', 'super_admin', 'active', '2025-10-09 09:18:59', '2025-10-09 12:31:06', NULL),
(2, 'DENISE', '$2a$12$jSLcmly2Y6ULhnRUVCl0kehZA.OsvzXMZQ6tw/4YTekJWgtY8tNUm', 'super_admin', 'active', '2025-10-09 09:18:59', '2025-10-09 12:31:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `log_id` int(11) NOT NULL,
  `user_type` enum('student','admin') NOT NULL,
  `user_id` int(11) NOT NULL,
  `action_type` varchar(100) NOT NULL,
  `action_description` text DEFAULT NULL,
  `action_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clearances`
--

CREATE TABLE `clearances` (
  `clearance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `programme_id` int(11) NOT NULL,
  `year_of_study` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `ca1_status` varchar(10) NOT NULL DEFAULT 'blocked',
  `ca2_status` varchar(10) NOT NULL DEFAULT 'blocked',
  `exam_status` varchar(10) NOT NULL DEFAULT 'blocked',
  `last_checked` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clearances`
--

INSERT INTO `clearances` (`clearance_id`, `student_id`, `programme_id`, `year_of_study`, `semester`, `ca1_status`, `ca2_status`, `exam_status`, `last_checked`) VALUES
(1, 1, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-10-11 08:50:22'),
(2, 1, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-10-11 08:50:22'),
(3, 1, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-10-11 08:50:22'),
(4, 1, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-10-11 08:50:22'),
(5, 2, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(6, 2, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(7, 2, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(8, 2, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(9, 3, 3, 1, 1, 'eligible', 'eligible', 'eligible', '2025-10-11 07:36:11'),
(10, 3, 3, 1, 1, 'eligible', 'eligible', 'eligible', '2025-10-11 07:36:11'),
(11, 3, 3, 1, 1, 'eligible', 'eligible', 'eligible', '2025-10-11 07:36:11'),
(12, 3, 3, 1, 1, 'eligible', 'eligible', 'eligible', '2025-10-11 07:36:11'),
(13, 4, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-10-11 08:49:41'),
(14, 4, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-10-11 08:49:41'),
(15, 4, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-10-11 08:49:41'),
(16, 4, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-10-11 08:49:41'),
(17, 5, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(18, 5, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(19, 5, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(20, 5, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(21, 6, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(22, 6, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(23, 6, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(24, 6, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(25, 7, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(26, 7, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(27, 7, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(28, 7, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(29, 8, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(30, 8, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(31, 8, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(32, 8, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(33, 9, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(34, 9, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(35, 9, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(36, 9, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(37, 10, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(38, 10, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(39, 10, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(40, 10, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(41, 11, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(42, 11, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(43, 11, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(44, 11, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(45, 12, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(46, 12, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(47, 12, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(48, 12, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(49, 13, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(50, 13, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(51, 13, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(52, 13, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(53, 14, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(54, 14, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(55, 14, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(56, 14, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(57, 15, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(58, 15, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(59, 15, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(60, 15, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(61, 16, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(62, 16, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(63, 16, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(64, 16, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(65, 17, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(66, 17, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(67, 17, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(68, 17, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(69, 18, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(70, 18, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(71, 18, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(72, 18, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(73, 19, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(74, 19, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(75, 19, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(76, 19, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(77, 20, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(78, 20, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(79, 20, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(80, 20, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(81, 21, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(82, 21, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(83, 21, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(84, 21, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(85, 22, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(86, 22, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(87, 22, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(88, 22, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(89, 23, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(90, 23, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(91, 23, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(92, 23, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(93, 24, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(94, 24, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(95, 24, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(96, 24, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(97, 25, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(98, 25, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(99, 25, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(100, 25, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(101, 26, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(102, 26, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(103, 26, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(104, 26, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(105, 27, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(106, 27, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(107, 27, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(108, 27, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(109, 28, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(110, 28, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(111, 28, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(112, 28, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(113, 29, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(114, 29, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(115, 29, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(116, 29, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(117, 30, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(118, 30, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(119, 30, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(120, 30, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(121, 31, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(122, 31, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(123, 31, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(124, 31, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(125, 32, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(126, 32, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(127, 32, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(128, 32, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(129, 33, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(130, 33, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(131, 33, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(132, 33, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(133, 34, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(134, 34, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(135, 34, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(136, 34, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(137, 35, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(138, 35, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(139, 35, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(140, 35, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(141, 36, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(142, 36, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(143, 36, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(144, 36, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(145, 37, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(146, 37, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(147, 37, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(148, 37, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(149, 38, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(150, 38, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(151, 38, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(152, 38, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(153, 39, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(154, 39, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(155, 39, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(156, 39, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(157, 40, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(158, 40, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(159, 40, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(160, 40, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(161, 41, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(162, 41, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(163, 41, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(164, 41, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(165, 42, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(166, 42, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(167, 42, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(168, 42, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(169, 43, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(170, 43, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(171, 43, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(172, 43, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(173, 44, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(174, 44, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(175, 44, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(176, 44, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(177, 45, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(178, 45, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(179, 45, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(180, 45, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(181, 46, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(182, 46, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(183, 46, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(184, 46, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(185, 47, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(186, 47, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(187, 47, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(188, 47, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(189, 48, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(190, 48, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(191, 48, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(192, 48, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(193, 49, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(194, 49, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(195, 49, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(196, 49, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(197, 50, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(198, 50, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(199, 50, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(200, 50, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(201, 51, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(202, 51, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(203, 51, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(204, 51, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(205, 52, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(206, 52, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(207, 52, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(208, 52, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(209, 53, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(210, 53, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(211, 53, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(212, 53, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(213, 54, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(214, 54, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(215, 54, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(216, 54, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(217, 55, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(218, 55, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(219, 55, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(220, 55, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(221, 56, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(222, 56, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(223, 56, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(224, 56, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(225, 57, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(226, 57, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(227, 57, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(228, 57, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(229, 58, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(230, 58, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(231, 58, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(232, 58, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(233, 59, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(234, 59, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(235, 59, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(236, 59, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(237, 60, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(238, 60, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(239, 60, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(240, 60, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(241, 61, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(242, 61, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(243, 61, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(244, 61, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(245, 62, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(246, 62, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(247, 62, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(248, 62, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(249, 63, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(250, 63, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(251, 63, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(252, 63, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(253, 64, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(254, 64, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(255, 64, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(256, 64, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(257, 65, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(258, 65, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(259, 65, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(260, 65, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(261, 66, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(262, 66, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(263, 66, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(264, 66, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(265, 67, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(266, 67, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(267, 67, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(268, 67, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(269, 68, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(270, 68, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(271, 68, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(272, 68, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(273, 69, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(274, 69, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(275, 69, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(276, 69, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(277, 70, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(278, 70, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(279, 70, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(280, 70, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(281, 71, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(282, 71, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(283, 71, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(284, 71, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(285, 72, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(286, 72, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(287, 72, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(288, 72, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(289, 73, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(290, 73, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(291, 73, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(292, 73, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(293, 74, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(294, 74, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(295, 74, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(296, 74, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(297, 75, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(298, 75, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(299, 75, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(300, 75, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(301, 76, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(302, 76, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(303, 76, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(304, 76, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(305, 77, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(306, 77, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(307, 77, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(308, 77, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(309, 78, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(310, 78, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(311, 78, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(312, 78, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(313, 79, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(314, 79, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(315, 79, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(316, 79, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(317, 80, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(318, 80, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(319, 80, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(320, 80, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(321, 81, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(322, 81, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(323, 81, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(324, 81, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(325, 82, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(326, 82, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(327, 82, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(328, 82, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(329, 83, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(330, 83, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(331, 83, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(332, 83, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(333, 84, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(334, 84, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(335, 84, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(336, 84, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(337, 85, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(338, 85, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(339, 85, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(340, 85, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(341, 86, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(342, 86, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(343, 86, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(344, 86, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(345, 87, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(346, 87, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(347, 87, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(348, 87, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(349, 88, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(350, 88, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(351, 88, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(352, 88, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(353, 89, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(354, 89, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(355, 89, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(356, 89, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(357, 90, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(358, 90, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(359, 90, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(360, 90, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(361, 91, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(362, 91, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(363, 91, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(364, 91, 1, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(365, 92, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(366, 92, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(367, 92, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(368, 92, 2, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(369, 93, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(370, 93, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(371, 93, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(372, 93, 3, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(373, 94, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(374, 94, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(375, 94, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(376, 94, 4, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(377, 95, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(378, 95, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(379, 95, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(380, 95, 5, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(381, 96, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(382, 96, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(383, 96, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(384, 96, 6, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(385, 97, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(386, 97, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(387, 97, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(388, 97, 7, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(389, 98, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(390, 98, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(391, 98, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(392, 98, 8, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(393, 99, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(394, 99, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(395, 99, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(396, 99, 9, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(397, 100, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(398, 100, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(399, 100, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35'),
(400, 100, 10, 1, 1, 'blocked', 'blocked', 'blocked', '2025-09-26 10:53:35');

-- --------------------------------------------------------

--
-- Table structure for table `clearance_rules`
--

CREATE TABLE `clearance_rules` (
  `rule_id` int(11) NOT NULL,
  `exam_type` enum('CA1','CA2','EXAM') NOT NULL,
  `required_percentage` decimal(5,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `programme_id` int(11) NOT NULL,
  `year_of_study` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `credits` int(11) NOT NULL DEFAULT 3,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_code`, `course_name`, `programme_id`, `year_of_study`, `semester`, `credits`, `created_at`, `updated_at`) VALUES
(1, 'BBA101', 'Introduction to Business', 1, 1, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(2, 'BBA102', 'Principles of Management', 1, 1, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(3, 'BBA103', 'Business Mathematics', 1, 1, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(4, 'BBA104', 'Communication Skills', 1, 1, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(5, 'BBA105', 'Financial Accounting 1', 1, 1, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(6, 'BBA106', 'Business Economics', 1, 1, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(7, 'BBA107', 'Organizational Behavior', 1, 1, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(8, 'BBA108', 'Information Systems', 1, 1, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(9, 'BBA201', 'Marketing Principles', 1, 2, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(10, 'BBA202', 'Financial Accounting 2', 1, 2, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(11, 'BBA203', 'Business Statistics', 1, 2, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(12, 'BBA204', 'Business Law', 1, 2, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(13, 'BBA205', 'Operations Management', 1, 2, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(14, 'BBA206', 'Human Resource Management', 1, 2, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(15, 'BBA207', 'Corporate Finance', 1, 2, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(16, 'BBA208', 'Entrepreneurship', 1, 2, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(17, 'BBA301', 'Strategic Management', 1, 3, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(18, 'BBA302', 'Management Accounting', 1, 3, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(19, 'BBA303', 'International Business', 1, 3, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(20, 'BBA304', 'Business Ethics', 1, 3, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(21, 'BBA305', 'Project Management', 1, 3, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(22, 'BBA306', 'Research Methods in Business', 1, 3, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(23, 'BBA307', 'Business Analytics', 1, 3, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(24, 'BBA308', 'Leadership and Change Management', 1, 3, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(25, 'BBA401', 'Advanced Marketing', 1, 4, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(26, 'BBA402', 'Strategic Finance', 1, 4, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(27, 'BBA403', 'International Marketing', 1, 4, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(28, 'BBA404', 'Innovation Management', 1, 4, 1, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(29, 'BBA405', 'Business Policy', 1, 4, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(30, 'BBA406', 'Advanced HR Management', 1, 4, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(31, 'BBA407', 'Business Simulation', 1, 4, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(32, 'BBA408', 'Capstone Project', 1, 4, 2, 3, '2025-09-17 14:31:09', '2025-09-17 14:31:09'),
(33, 'BCS101', 'Introduction to Computing', 2, 1, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(34, 'BCS102', 'Programming Fundamentals', 2, 1, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(35, 'BCS103', 'Discrete Mathematics', 2, 1, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(36, 'BCS104', 'Computer Systems', 2, 1, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(37, 'BCS105', 'Data Structures', 2, 1, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(38, 'BCS106', 'Database Systems', 2, 1, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(39, 'BCS107', 'Software Engineering', 2, 1, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(40, 'BCS108', 'Computer Networks', 2, 1, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(41, 'BCS201', 'Algorithms', 2, 2, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(42, 'BCS202', 'Operating Systems', 2, 2, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(43, 'BCS203', 'Web Development', 2, 2, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(44, 'BCS204', 'Programming Paradigms', 2, 2, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(45, 'BCS205', 'Software Project Management', 2, 2, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(46, 'BCS206', 'Object-Oriented Programming', 2, 2, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(47, 'BCS207', 'Mobile App Development', 2, 2, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(48, 'BCS208', 'Human-Computer Interaction', 2, 2, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(49, 'BCS301', 'Artificial Intelligence', 2, 3, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(50, 'BCS302', 'Machine Learning', 2, 3, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(51, 'BCS303', 'Computer Graphics', 2, 3, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(52, 'BCS304', 'Cybersecurity Fundamentals', 2, 3, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(53, 'BCS305', 'Cloud Computing', 2, 3, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(54, 'BCS306', 'Big Data Analytics', 2, 3, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(55, 'BCS307', 'Network Security', 2, 3, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(56, 'BCS308', 'Software Testing and Quality Assurance', 2, 3, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(57, 'BCS401', 'Advanced AI', 2, 4, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(58, 'BCS402', 'Distributed Systems', 2, 4, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(59, 'BCS403', 'Advanced Web Development', 2, 4, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(60, 'BCS404', 'Capstone Project 1', 2, 4, 1, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(61, 'BCS405', 'Capstone Project 2', 2, 4, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(62, 'BCS406', 'Data Mining', 2, 4, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(63, 'BCS407', 'Computer Vision', 2, 4, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(64, 'BCS408', 'Ethics in Computing', 2, 4, 2, 3, '2025-09-17 14:33:15', '2025-09-17 14:33:15'),
(65, 'BAF101', 'Introduction to Accounting', 3, 1, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(66, 'BAF102', 'Business Mathematics', 3, 1, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(67, 'BAF103', 'Principles of Economics', 3, 1, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(68, 'BAF104', 'Business Communication', 3, 1, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(69, 'BAF105', 'Financial Accounting 1', 3, 1, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(70, 'BAF106', 'Management Accounting 1', 3, 1, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(71, 'BAF107', 'Business Law', 3, 1, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(72, 'BAF108', 'Computer Applications in Accounting', 3, 1, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(73, 'BAF201', 'Financial Accounting 2', 3, 2, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(74, 'BAF202', 'Management Accounting 2', 3, 2, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(75, 'BAF203', 'Corporate Finance', 3, 2, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(76, 'BAF204', 'Statistics for Accounting', 3, 2, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(77, 'BAF205', 'Auditing 1', 3, 2, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(78, 'BAF206', 'Taxation 1', 3, 2, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(79, 'BAF207', 'Accounting Information Systems', 3, 2, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(80, 'BAF208', 'Business Ethics', 3, 2, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(81, 'BAF301', 'Auditing 2', 3, 3, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(82, 'BAF302', 'Taxation 2', 3, 3, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(83, 'BAF303', 'Advanced Financial Accounting', 3, 3, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(84, 'BAF304', 'Financial Statement Analysis', 3, 3, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(85, 'BAF305', 'Management Control Systems', 3, 3, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(86, 'BAF306', 'Corporate Governance', 3, 3, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(87, 'BAF307', 'Investment Analysis', 3, 3, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(88, 'BAF308', 'Strategic Management', 3, 3, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(89, 'BAF401', 'Advanced Auditing', 3, 4, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(90, 'BAF402', 'Advanced Taxation', 3, 4, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(91, 'BAF403', 'Financial Modelling', 3, 4, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(92, 'BAF404', 'Risk Management', 3, 4, 1, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(93, 'BAF405', 'Capstone Project', 3, 4, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(94, 'BAF406', 'Ethics in Accounting', 3, 4, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(95, 'BAF407', 'International Accounting', 3, 4, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(96, 'BAF408', 'Advanced Corporate Finance', 3, 4, 2, 3, '2025-09-17 14:34:34', '2025-09-17 14:34:34'),
(97, 'BPH101', 'Introduction to Public Health', 4, 1, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(98, 'BPH102', 'Human Anatomy and Physiology', 4, 1, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(99, 'BPH103', 'Biostatistics 1', 4, 1, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(100, 'BPH104', 'Health Communication', 4, 1, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(101, 'BPH105', 'Epidemiology 1', 4, 1, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(102, 'BPH106', 'Microbiology', 4, 1, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(103, 'BPH107', 'Nutrition and Health', 4, 1, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(104, 'BPH108', 'Environmental Health', 4, 1, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(105, 'BPH201', 'Epidemiology 2', 4, 2, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(106, 'BPH202', 'Health Policy and Management', 4, 2, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(107, 'BPH203', 'Community Health', 4, 2, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(108, 'BPH204', 'Health Promotion', 4, 2, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(109, 'BPH205', 'Research Methods in Health', 4, 2, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(110, 'BPH206', 'Biostatistics 2', 4, 2, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(111, 'BPH207', 'Occupational Health', 4, 2, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(112, 'BPH208', 'Global Health', 4, 2, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(113, 'BPH301', 'Epidemiology 3', 4, 3, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(114, 'BPH302', 'Health Economics', 4, 3, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(115, 'BPH303', 'Disease Prevention and Control', 4, 3, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(116, 'BPH304', 'Environmental Health Risk Assessment', 4, 3, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(117, 'BPH305', 'Health Program Planning and Evaluation', 4, 3, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(118, 'BPH306', 'Public Health Nutrition', 4, 3, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(119, 'BPH307', 'Infectious Disease Management', 4, 3, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(120, 'BPH308', 'Health Informatics', 4, 3, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(121, 'BPH401', 'Advanced Epidemiology', 4, 4, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(122, 'BPH402', 'Global Health Policy', 4, 4, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(123, 'BPH403', 'Health Research Project 1', 4, 4, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(124, 'BPH404', 'Public Health Ethics', 4, 4, 1, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(125, 'BPH405', 'Health Research Project 2', 4, 4, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(126, 'BPH406', 'Advanced Health Promotion', 4, 4, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(127, 'BPH407', 'Epidemiological Modelling', 4, 4, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(128, 'BPH408', 'Disaster and Emergency Health Management', 4, 4, 2, 3, '2025-09-17 14:35:46', '2025-09-17 14:35:46'),
(130, 'BNUR101', 'Introduction to Nursing', 5, 1, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(131, 'BNUR102', 'Human Anatomy and Physiology 1', 5, 1, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(132, 'BNUR103', 'Fundamentals of Nursing Practice', 5, 1, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(133, 'BNUR104', 'Health Communication Skills', 5, 1, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(134, 'BNUR105', 'Human Anatomy and Physiology 2', 5, 1, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(135, 'BNUR106', 'Microbiology for Nurses', 5, 1, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(136, 'BNUR107', 'Nursing Ethics and Law', 5, 1, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(137, 'BNUR108', 'Community Health Nursing 1', 5, 1, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(138, 'BNUR201', 'Medical-Surgical Nursing 1', 5, 2, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(139, 'BNUR202', 'Pharmacology 1', 5, 2, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(140, 'BNUR203', 'Nutrition in Nursing', 5, 2, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(141, 'BNUR204', 'Pathophysiology 1', 5, 2, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(142, 'BNUR205', 'Medical-Surgical Nursing 2', 5, 2, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(143, 'BNUR206', 'Pharmacology 2', 5, 2, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(144, 'BNUR207', 'Maternal and Child Health Nursing 1', 5, 2, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(145, 'BNUR208', 'Pathophysiology 2', 5, 2, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(146, 'BNUR301', 'Pediatric Nursing 1', 5, 3, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(147, 'BNUR302', 'Mental Health Nursing 1', 5, 3, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(148, 'BNUR303', 'Nursing Research Methods', 5, 3, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(149, 'BNUR304', 'Community Health Nursing 2', 5, 3, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(150, 'BNUR305', 'Pediatric Nursing 2', 5, 3, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(151, 'BNUR306', 'Mental Health Nursing 2', 5, 3, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(152, 'BNUR307', 'Maternal and Child Health Nursing 2', 5, 3, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(153, 'BNUR308', 'Advanced Pharmacology', 5, 3, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(154, 'BNUR401', 'Advanced Medical-Surgical Nursing', 5, 4, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(155, 'BNUR402', 'Nursing Leadership and Management', 5, 4, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(156, 'BNUR403', 'Evidence-Based Nursing Practice', 5, 4, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(157, 'BNUR404', 'Clinical Nursing Practicum 1', 5, 4, 1, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(158, 'BNUR405', 'Critical Care Nursing', 5, 4, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(159, 'BNUR406', 'Public Health Nursing', 5, 4, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(160, 'BNUR407', 'Clinical Nursing Practicum 2', 5, 4, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(161, 'BNUR408', 'Nursing Research Project', 5, 4, 2, 3, '2025-09-18 00:39:45', '2025-09-18 00:39:45'),
(162, 'BEDU101', 'Foundations of Education', 6, 1, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(163, 'BEDU102', 'Introduction to Psychology', 6, 1, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(164, 'BEDU103', 'English Communication Skills', 6, 1, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(165, 'BEDU104', 'ICT in Education', 6, 1, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(166, 'BEDU105', 'Educational Psychology 1', 6, 1, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(167, 'BEDU106', 'Curriculum Studies 1', 6, 1, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(168, 'BEDU107', 'History of Education', 6, 1, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(169, 'BEDU108', 'Philosophy of Education', 6, 1, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(170, 'BEDU201', 'Sociology of Education', 6, 2, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(171, 'BEDU202', 'Educational Psychology 2', 6, 2, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(172, 'BEDU203', 'Curriculum Studies 2', 6, 2, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(173, 'BEDU204', 'Teaching and Learning Theories', 6, 2, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(174, 'BEDU205', 'Measurement and Evaluation in Education', 6, 2, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(175, 'BEDU206', 'Special and Inclusive Education', 6, 2, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(176, 'BEDU207', 'Educational Technology', 6, 2, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(177, 'BEDU208', 'Comparative Education', 6, 2, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(178, 'BEDU301', 'Instructional Methods 1', 6, 3, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(179, 'BEDU302', 'Educational Research Methods', 6, 3, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(180, 'BEDU303', 'Language and Literacy Education', 6, 3, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(181, 'BEDU304', 'Pedagogy in Science and Math Education', 6, 3, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(182, 'BEDU305', 'Instructional Methods 2', 6, 3, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(183, 'BEDU306', 'Guidance and Counselling in Schools', 6, 3, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(184, 'BEDU307', 'Assessment and Evaluation Techniques', 6, 3, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(185, 'BEDU308', 'Sociolinguistics in Education', 6, 3, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(186, 'BEDU401', 'Educational Leadership and Management', 6, 4, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(187, 'BEDU402', 'School Administration and Policy', 6, 4, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(188, 'BEDU403', 'Research Project in Education 1', 6, 4, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(189, 'BEDU404', 'Teaching Practice 1', 6, 4, 1, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(190, 'BEDU405', 'Contemporary Issues in Education', 6, 4, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(191, 'BEDU406', 'Educational Planning and Economics', 6, 4, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(192, 'BEDU407', 'Research Project in Education 2', 6, 4, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(193, 'BEDU408', 'Teaching Practice 2', 6, 4, 2, 3, '2025-09-18 00:41:01', '2025-09-18 00:41:01'),
(194, 'BIT101', 'Introduction to Information Technology', 8, 1, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(195, 'BIT102', 'Computer Hardware and Software Fundamentals', 8, 1, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(196, 'BIT103', 'Programming Fundamentals', 8, 1, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(197, 'BIT104', 'Mathematics for IT', 8, 1, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(198, 'BIT105', 'Database Management Systems 1', 8, 1, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(199, 'BIT106', 'Web Development 1', 8, 1, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(200, 'BIT107', 'Networking Fundamentals', 8, 1, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(201, 'BIT108', 'Systems Analysis and Design 1', 8, 1, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(202, 'BIT201', 'Object-Oriented Programming 1', 8, 2, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(203, 'BIT202', 'Data Structures and Algorithms', 8, 2, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(204, 'BIT203', 'Database Management Systems 2', 8, 2, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(205, 'BIT204', 'Operating Systems', 8, 2, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(206, 'BIT205', 'Object-Oriented Programming 2', 8, 2, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(207, 'BIT206', 'Web Development 2', 8, 2, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(208, 'BIT207', 'Computer Networks 1', 8, 2, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(209, 'BIT208', 'Systems Analysis and Design 2', 8, 2, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(210, 'BIT301', 'Mobile Application Development 1', 8, 3, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(211, 'BIT302', 'Human-Computer Interaction', 8, 3, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(212, 'BIT303', 'Computer Security 1', 8, 3, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(213, 'BIT304', 'Software Engineering 1', 8, 3, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(214, 'BIT305', 'Mobile Application Development 2', 8, 3, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(215, 'BIT306', 'Artificial Intelligence 1', 8, 3, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(216, 'BIT307', 'Computer Security 2', 8, 3, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(217, 'BIT308', 'Software Engineering 2', 8, 3, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(218, 'BIT401', 'Cloud Computing', 8, 4, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(219, 'BIT402', 'Big Data Analytics', 8, 4, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(220, 'BIT403', 'Final Year Project 1', 8, 4, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(221, 'BIT404', 'Professional and Ethical Issues in IT', 8, 4, 1, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(222, 'BIT405', 'Cybersecurity Management', 8, 4, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(223, 'BIT406', 'Artificial Intelligence 2', 8, 4, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(224, 'BIT407', 'Final Year Project 2', 8, 4, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(225, 'BIT408', 'Emerging Trends in IT', 8, 4, 2, 3, '2025-09-18 00:46:56', '2025-09-18 00:46:56'),
(226, 'BMKT101', 'Principles of Marketing', 9, 1, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(227, 'BMKT102', 'Introduction to Business', 9, 1, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(228, 'BMKT103', 'Business Communication', 9, 1, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(229, 'BMKT104', 'Microeconomics for Marketing', 9, 1, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(230, 'BMKT105', 'Consumer Behavior', 9, 1, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(231, 'BMKT106', 'Business Statistics', 9, 1, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(232, 'BMKT107', 'Macroeconomics for Marketing', 9, 1, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(233, 'BMKT108', 'Introduction to Digital Marketing', 9, 1, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(234, 'BMKT201', 'Marketing Research 1', 9, 2, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(235, 'BMKT202', 'Sales Management', 9, 2, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(236, 'BMKT203', 'Advertising Principles', 9, 2, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(237, 'BMKT204', 'Financial Accounting for Marketers', 9, 2, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(238, 'BMKT205', 'Marketing Research 2', 9, 2, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(239, 'BMKT206', 'Public Relations', 9, 2, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(240, 'BMKT207', 'Service Marketing', 9, 2, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(241, 'BMKT208', 'Integrated Marketing Communications', 9, 2, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(242, 'BMKT301', 'Strategic Marketing Management', 9, 3, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(243, 'BMKT302', 'Brand Management', 9, 3, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(244, 'BMKT303', 'Distribution and Supply Chain', 9, 3, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(245, 'BMKT304', 'Marketing Analytics 1', 9, 3, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(246, 'BMKT305', 'International Marketing', 9, 3, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(247, 'BMKT306', 'Retail Management', 9, 3, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(248, 'BMKT307', 'Marketing Ethics and Law', 9, 3, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(249, 'BMKT308', 'Marketing Analytics 2', 9, 3, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(250, 'BMKT401', 'Digital and Social Media Marketing', 9, 4, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(251, 'BMKT402', 'Strategic Brand Strategy', 9, 4, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(252, 'BMKT403', 'Entrepreneurship in Marketing', 9, 4, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(253, 'BMKT404', 'Customer Relationship Management', 9, 4, 1, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(254, 'BMKT405', 'Marketing Strategy and Policy', 9, 4, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(255, 'BMKT406', 'Global Advertising Campaigns', 9, 4, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(256, 'BMKT407', 'Capstone Project in Marketing', 9, 4, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(257, 'BMKT408', 'Contemporary Issues in Marketing', 9, 4, 2, 3, '2025-09-18 00:50:29', '2025-09-18 00:50:29'),
(258, 'BECO101', 'Principles of Microeconomics', 10, 1, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(259, 'BECO102', 'Principles of Macroeconomics', 10, 1, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(260, 'BECO103', 'Mathematics for Economists 1', 10, 1, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(261, 'BECO104', 'Communication Skills for Economists', 10, 1, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(262, 'BECO105', 'Introduction to Development Economics', 10, 1, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(263, 'BECO106', 'Statistics for Economists 1', 10, 1, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(264, 'BECO107', 'History of Economic Thought 1', 10, 1, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(265, 'BECO108', 'Introduction to Econometrics', 10, 1, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(266, 'BECO201', 'Intermediate Microeconomics', 10, 2, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(267, 'BECO202', 'Intermediate Macroeconomics', 10, 2, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(268, 'BECO203', 'Mathematics for Economists 2', 10, 2, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(269, 'BECO204', 'Public Finance 1', 10, 2, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(270, 'BECO205', 'Development Economics 1', 10, 2, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(271, 'BECO206', 'Statistics for Economists 2', 10, 2, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(272, 'BECO207', 'History of Economic Thought 2', 10, 2, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(273, 'BECO208', 'Econometrics 1', 10, 2, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(274, 'BECO301', 'Advanced Microeconomics 1', 10, 3, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(275, 'BECO302', 'Advanced Macroeconomics 1', 10, 3, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(276, 'BECO303', 'Public Finance 2', 10, 3, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(277, 'BECO304', 'Research Methods in Economics', 10, 3, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(278, 'BECO305', 'Development Economics 2', 10, 3, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(279, 'BECO306', 'Econometrics 2', 10, 3, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(280, 'BECO307', 'International Trade Theory', 10, 3, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(281, 'BECO308', 'Monetary Economics 1', 10, 3, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(282, 'BECO401', 'Advanced Microeconomics 2', 10, 4, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(283, 'BECO402', 'Advanced Macroeconomics 2', 10, 4, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(284, 'BECO403', 'Econometrics 3', 10, 4, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(285, 'BECO404', 'Monetary Economics 2', 10, 4, 1, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(286, 'BECO405', 'International Finance', 10, 4, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(287, 'BECO406', 'Economic Policy Analysis', 10, 4, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(288, 'BECO407', 'Capstone Project in Economics', 10, 4, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(289, 'BECO408', 'Contemporary Issues in Economics', 10, 4, 2, 3, '2025-09-18 00:51:42', '2025-09-18 00:51:42'),
(290, 'BENG101', 'Engineering Mathematics I', 7, 1, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(291, 'BENG102', 'Introduction to Engineering', 7, 1, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(292, 'BENG103', 'Engineering Physics I', 7, 1, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(293, 'BENG104', 'Engineering Graphics & Design', 7, 1, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(294, 'BENG105', 'Engineering Mathematics II', 7, 1, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(295, 'BENG106', 'Engineering Chemistry', 7, 1, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(296, 'BENG107', 'Engineering Physics II', 7, 1, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(297, 'BENG108', 'Workshop Technology', 7, 1, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(298, 'BENG201', 'Strength of Materials', 7, 2, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(299, 'BENG202', 'Fluid Mechanics I', 7, 2, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(300, 'BENG203', 'Thermodynamics I', 7, 2, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(301, 'BENG204', 'Electrical Engineering Fundamentals', 7, 2, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(302, 'BENG205', 'Mechanics of Machines', 7, 2, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(303, 'BENG206', 'Fluid Mechanics II', 7, 2, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(304, 'BENG207', 'Thermodynamics II', 7, 2, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(305, 'BENG208', 'Materials Science', 7, 2, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(306, 'BENG301', 'Control Systems Engineering', 7, 3, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(307, 'BENG302', 'Structural Analysis', 7, 3, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(308, 'BENG303', 'Manufacturing Processes', 7, 3, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(309, 'BENG304', 'Engineering Economics', 7, 3, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(310, 'BENG305', 'Machine Design I', 7, 3, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(311, 'BENG306', 'Environmental Engineering', 7, 3, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(312, 'BENG307', 'Power Systems', 7, 3, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(313, 'BENG308', 'Project Management', 7, 3, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(314, 'BENG401', 'Machine Design II', 7, 4, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(315, 'BENG402', 'Renewable Energy Systems', 7, 4, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(316, 'BENG403', 'Civil Engineering Design', 7, 4, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(317, 'BENG404', 'Engineering Research Methods', 7, 4, 1, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(318, 'BENG405', 'Final Year Project', 7, 4, 2, 6, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(319, 'BENG406', 'Industrial Training', 7, 4, 2, 6, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(320, 'BENG407', 'Ethics & Professional Practice', 7, 4, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37'),
(321, 'BENG408', 'Entrepreneurship for Engineers', 7, 4, 2, 3, '2025-09-18 17:41:37', '2025-09-18 17:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `curriculum`
--

CREATE TABLE `curriculum` (
  `curriculum_id` int(11) NOT NULL,
  `programme_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `year_of_study` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `curriculum`
--

INSERT INTO `curriculum` (`curriculum_id`, `programme_id`, `course_id`, `year_of_study`, `semester`, `created_at`) VALUES
(5, 1, 1, 1, 1, '2025-09-18 19:33:51'),
(6, 1, 2, 1, 1, '2025-09-18 19:33:51'),
(7, 1, 3, 1, 1, '2025-09-18 19:33:51'),
(8, 1, 4, 1, 1, '2025-09-18 19:33:51'),
(13, 1, 5, 1, 2, '2025-09-18 19:36:21'),
(14, 1, 6, 1, 2, '2025-09-18 19:36:21'),
(15, 1, 7, 1, 2, '2025-09-18 19:36:21'),
(16, 1, 8, 1, 2, '2025-09-18 19:36:21'),
(17, 1, 9, 2, 1, '2025-09-18 19:36:21'),
(18, 1, 10, 2, 1, '2025-09-18 19:36:21'),
(19, 1, 11, 2, 1, '2025-09-18 19:36:21'),
(20, 1, 12, 2, 1, '2025-09-18 19:36:21'),
(21, 1, 13, 2, 2, '2025-09-18 19:36:21'),
(22, 1, 14, 2, 2, '2025-09-18 19:36:21'),
(23, 1, 15, 2, 2, '2025-09-18 19:36:21'),
(24, 1, 16, 2, 2, '2025-09-18 19:36:21'),
(25, 1, 17, 3, 1, '2025-09-18 19:36:21'),
(26, 1, 18, 3, 1, '2025-09-18 19:36:21'),
(27, 1, 19, 3, 1, '2025-09-18 19:36:21'),
(28, 1, 20, 3, 1, '2025-09-18 19:36:21'),
(29, 1, 21, 3, 2, '2025-09-18 19:36:21'),
(30, 1, 22, 3, 2, '2025-09-18 19:36:21'),
(31, 1, 23, 3, 2, '2025-09-18 19:36:21'),
(32, 1, 24, 3, 2, '2025-09-18 19:36:21'),
(33, 1, 25, 4, 1, '2025-09-18 19:36:21'),
(34, 1, 26, 4, 1, '2025-09-18 19:36:21'),
(35, 1, 27, 4, 1, '2025-09-18 19:36:21'),
(36, 1, 28, 4, 1, '2025-09-18 19:36:21'),
(37, 1, 29, 4, 2, '2025-09-18 19:36:21'),
(38, 1, 30, 4, 2, '2025-09-18 19:36:21'),
(39, 1, 31, 4, 2, '2025-09-18 19:36:21'),
(40, 1, 32, 4, 2, '2025-09-18 19:36:21'),
(73, 2, 33, 1, 1, '2025-09-18 20:00:29'),
(74, 2, 34, 1, 1, '2025-09-18 20:00:29'),
(75, 2, 35, 1, 1, '2025-09-18 20:00:29'),
(76, 2, 36, 1, 1, '2025-09-18 20:00:29'),
(77, 2, 37, 1, 2, '2025-09-18 20:00:29'),
(78, 2, 38, 1, 2, '2025-09-18 20:00:29'),
(79, 2, 39, 1, 2, '2025-09-18 20:00:29'),
(80, 2, 40, 1, 2, '2025-09-18 20:00:29'),
(81, 2, 41, 2, 1, '2025-09-18 20:00:29'),
(82, 2, 42, 2, 1, '2025-09-18 20:00:29'),
(83, 2, 43, 2, 1, '2025-09-18 20:00:29'),
(84, 2, 44, 2, 1, '2025-09-18 20:00:29'),
(85, 2, 45, 2, 2, '2025-09-18 20:00:29'),
(86, 2, 46, 2, 2, '2025-09-18 20:00:29'),
(87, 2, 47, 2, 2, '2025-09-18 20:00:29'),
(88, 2, 48, 2, 2, '2025-09-18 20:00:29'),
(89, 2, 49, 3, 1, '2025-09-18 20:00:29'),
(90, 2, 50, 3, 1, '2025-09-18 20:00:29'),
(91, 2, 51, 3, 1, '2025-09-18 20:00:29'),
(92, 2, 52, 3, 1, '2025-09-18 20:00:29'),
(93, 2, 53, 3, 2, '2025-09-18 20:00:29'),
(94, 2, 54, 3, 2, '2025-09-18 20:00:29'),
(95, 2, 55, 3, 2, '2025-09-18 20:00:29'),
(96, 2, 56, 3, 2, '2025-09-18 20:00:29'),
(97, 2, 57, 4, 1, '2025-09-18 20:00:29'),
(98, 2, 58, 4, 1, '2025-09-18 20:00:29'),
(99, 2, 59, 4, 1, '2025-09-18 20:00:29'),
(100, 2, 60, 4, 1, '2025-09-18 20:00:29'),
(101, 2, 61, 4, 2, '2025-09-18 20:00:29'),
(102, 2, 62, 4, 2, '2025-09-18 20:00:29'),
(103, 2, 63, 4, 2, '2025-09-18 20:00:29'),
(104, 2, 64, 4, 2, '2025-09-18 20:00:29'),
(105, 3, 65, 1, 1, '2025-09-18 20:04:32'),
(106, 3, 66, 1, 1, '2025-09-18 20:04:32'),
(107, 3, 67, 1, 1, '2025-09-18 20:04:32'),
(108, 3, 68, 1, 1, '2025-09-18 20:04:32'),
(109, 3, 69, 1, 2, '2025-09-18 20:04:32'),
(110, 3, 70, 1, 2, '2025-09-18 20:04:32'),
(111, 3, 71, 1, 2, '2025-09-18 20:04:32'),
(112, 3, 72, 1, 2, '2025-09-18 20:04:32'),
(113, 3, 73, 2, 1, '2025-09-18 20:04:32'),
(114, 3, 74, 2, 1, '2025-09-18 20:04:32'),
(115, 3, 75, 2, 1, '2025-09-18 20:04:32'),
(116, 3, 76, 2, 1, '2025-09-18 20:04:32'),
(117, 3, 77, 2, 2, '2025-09-18 20:04:32'),
(118, 3, 78, 2, 2, '2025-09-18 20:04:32'),
(119, 3, 79, 2, 2, '2025-09-18 20:04:32'),
(120, 3, 80, 2, 2, '2025-09-18 20:04:32'),
(121, 3, 81, 3, 1, '2025-09-18 20:04:32'),
(122, 3, 82, 3, 1, '2025-09-18 20:04:32'),
(123, 3, 83, 3, 1, '2025-09-18 20:04:32'),
(124, 3, 84, 3, 1, '2025-09-18 20:04:32'),
(125, 3, 85, 3, 2, '2025-09-18 20:04:32'),
(126, 3, 86, 3, 2, '2025-09-18 20:04:32'),
(127, 3, 87, 3, 2, '2025-09-18 20:04:32'),
(128, 3, 88, 3, 2, '2025-09-18 20:04:32'),
(129, 3, 89, 4, 1, '2025-09-18 20:04:32'),
(130, 3, 90, 4, 1, '2025-09-18 20:04:32'),
(131, 3, 91, 4, 1, '2025-09-18 20:04:32'),
(132, 3, 92, 4, 1, '2025-09-18 20:04:32'),
(133, 3, 93, 4, 2, '2025-09-18 20:04:32'),
(134, 3, 94, 4, 2, '2025-09-18 20:04:32'),
(135, 3, 95, 4, 2, '2025-09-18 20:04:32'),
(136, 3, 96, 4, 2, '2025-09-18 20:04:32'),
(137, 4, 97, 1, 1, '2025-09-18 20:16:35'),
(138, 4, 98, 1, 1, '2025-09-18 20:16:35'),
(139, 4, 99, 1, 1, '2025-09-18 20:16:35'),
(140, 4, 100, 1, 1, '2025-09-18 20:16:35'),
(141, 4, 101, 1, 2, '2025-09-18 20:16:35'),
(142, 4, 102, 1, 2, '2025-09-18 20:16:35'),
(143, 4, 103, 1, 2, '2025-09-18 20:16:35'),
(144, 4, 104, 1, 2, '2025-09-18 20:16:35'),
(145, 4, 105, 2, 1, '2025-09-18 20:16:35'),
(146, 4, 106, 2, 1, '2025-09-18 20:16:35'),
(147, 4, 107, 2, 1, '2025-09-18 20:16:35'),
(148, 4, 108, 2, 1, '2025-09-18 20:16:35'),
(149, 4, 109, 2, 2, '2025-09-18 20:16:35'),
(150, 4, 110, 2, 2, '2025-09-18 20:16:35'),
(151, 4, 111, 2, 2, '2025-09-18 20:16:35'),
(152, 4, 112, 2, 2, '2025-09-18 20:16:35'),
(153, 4, 113, 3, 1, '2025-09-18 20:16:35'),
(154, 4, 114, 3, 1, '2025-09-18 20:16:35'),
(155, 4, 115, 3, 1, '2025-09-18 20:16:35'),
(156, 4, 116, 3, 1, '2025-09-18 20:16:35'),
(157, 4, 117, 3, 2, '2025-09-18 20:16:35'),
(158, 4, 118, 3, 2, '2025-09-18 20:16:35'),
(159, 4, 119, 3, 2, '2025-09-18 20:16:35'),
(160, 4, 120, 3, 2, '2025-09-18 20:16:35'),
(161, 4, 121, 4, 1, '2025-09-18 20:16:35'),
(162, 4, 122, 4, 1, '2025-09-18 20:16:35'),
(163, 4, 123, 4, 1, '2025-09-18 20:16:35'),
(164, 4, 124, 4, 1, '2025-09-18 20:16:35'),
(165, 4, 125, 4, 2, '2025-09-18 20:16:35'),
(166, 4, 126, 4, 2, '2025-09-18 20:16:35'),
(167, 4, 127, 4, 2, '2025-09-18 20:16:35'),
(168, 4, 128, 4, 2, '2025-09-18 20:16:35'),
(201, 5, 130, 1, 1, '2025-09-18 20:26:49'),
(202, 5, 131, 1, 1, '2025-09-18 20:26:49'),
(203, 5, 132, 1, 1, '2025-09-18 20:26:49'),
(204, 5, 133, 1, 1, '2025-09-18 20:26:49'),
(205, 5, 134, 1, 2, '2025-09-18 20:26:49'),
(206, 5, 135, 1, 2, '2025-09-18 20:26:49'),
(207, 5, 136, 1, 2, '2025-09-18 20:26:49'),
(208, 5, 137, 1, 2, '2025-09-18 20:26:49'),
(209, 5, 138, 2, 1, '2025-09-18 20:26:49'),
(210, 5, 139, 2, 1, '2025-09-18 20:26:49'),
(211, 5, 140, 2, 1, '2025-09-18 20:26:49'),
(212, 5, 141, 2, 1, '2025-09-18 20:26:49'),
(213, 5, 142, 2, 2, '2025-09-18 20:26:49'),
(214, 5, 143, 2, 2, '2025-09-18 20:26:49'),
(215, 5, 144, 2, 2, '2025-09-18 20:26:49'),
(216, 5, 145, 2, 2, '2025-09-18 20:26:49'),
(217, 5, 146, 3, 1, '2025-09-18 20:26:49'),
(218, 5, 147, 3, 1, '2025-09-18 20:26:49'),
(219, 5, 148, 3, 1, '2025-09-18 20:26:49'),
(220, 5, 149, 3, 1, '2025-09-18 20:26:49'),
(221, 5, 150, 3, 2, '2025-09-18 20:26:49'),
(222, 5, 151, 3, 2, '2025-09-18 20:26:49'),
(223, 5, 152, 3, 2, '2025-09-18 20:26:49'),
(224, 5, 153, 3, 2, '2025-09-18 20:26:49'),
(225, 5, 154, 4, 1, '2025-09-18 20:26:49'),
(226, 5, 155, 4, 1, '2025-09-18 20:26:49'),
(227, 5, 156, 4, 1, '2025-09-18 20:26:49'),
(228, 5, 157, 4, 1, '2025-09-18 20:26:49'),
(229, 5, 158, 4, 2, '2025-09-18 20:26:49'),
(230, 5, 159, 4, 2, '2025-09-18 20:26:49'),
(231, 5, 160, 4, 2, '2025-09-18 20:26:49'),
(232, 5, 161, 4, 2, '2025-09-18 20:26:49'),
(233, 6, 162, 1, 1, '2025-09-19 19:04:04'),
(234, 6, 163, 1, 1, '2025-09-19 19:04:04'),
(235, 6, 164, 1, 1, '2025-09-19 19:04:04'),
(236, 6, 165, 1, 1, '2025-09-19 19:04:04'),
(237, 6, 166, 1, 2, '2025-09-19 19:04:04'),
(238, 6, 167, 1, 2, '2025-09-19 19:04:04'),
(239, 6, 168, 1, 2, '2025-09-19 19:04:04'),
(240, 6, 169, 1, 2, '2025-09-19 19:04:04'),
(241, 6, 170, 2, 1, '2025-09-19 19:04:04'),
(242, 6, 171, 2, 1, '2025-09-19 19:04:04'),
(243, 6, 172, 2, 1, '2025-09-19 19:04:04'),
(244, 6, 173, 2, 1, '2025-09-19 19:04:04'),
(245, 6, 174, 2, 2, '2025-09-19 19:04:04'),
(246, 6, 175, 2, 2, '2025-09-19 19:04:04'),
(247, 6, 176, 2, 2, '2025-09-19 19:04:04'),
(248, 6, 177, 2, 2, '2025-09-19 19:04:04'),
(249, 6, 178, 3, 1, '2025-09-19 19:04:04'),
(250, 6, 179, 3, 1, '2025-09-19 19:04:04'),
(251, 6, 180, 3, 1, '2025-09-19 19:04:04'),
(252, 6, 181, 3, 1, '2025-09-19 19:04:04'),
(253, 6, 182, 3, 2, '2025-09-19 19:04:04'),
(254, 6, 183, 3, 2, '2025-09-19 19:04:04'),
(255, 6, 184, 3, 2, '2025-09-19 19:04:04'),
(256, 6, 185, 3, 2, '2025-09-19 19:04:04'),
(257, 6, 186, 4, 1, '2025-09-19 19:04:04'),
(258, 6, 187, 4, 1, '2025-09-19 19:04:04'),
(259, 6, 188, 4, 1, '2025-09-19 19:04:04'),
(260, 6, 189, 4, 1, '2025-09-19 19:04:04'),
(261, 6, 190, 4, 2, '2025-09-19 19:04:04'),
(262, 6, 191, 4, 2, '2025-09-19 19:04:04'),
(263, 6, 192, 4, 2, '2025-09-19 19:04:04'),
(264, 6, 193, 4, 2, '2025-09-19 19:04:04'),
(265, 8, 194, 1, 1, '2025-09-19 19:12:59'),
(266, 8, 195, 1, 1, '2025-09-19 19:12:59'),
(267, 8, 196, 1, 1, '2025-09-19 19:12:59'),
(268, 8, 197, 1, 1, '2025-09-19 19:12:59'),
(269, 8, 198, 1, 2, '2025-09-19 19:12:59'),
(270, 8, 199, 1, 2, '2025-09-19 19:12:59'),
(271, 8, 200, 1, 2, '2025-09-19 19:12:59'),
(272, 8, 201, 1, 2, '2025-09-19 19:12:59'),
(273, 8, 202, 2, 1, '2025-09-19 19:12:59'),
(274, 8, 203, 2, 1, '2025-09-19 19:12:59'),
(275, 8, 204, 2, 1, '2025-09-19 19:12:59'),
(276, 8, 205, 2, 1, '2025-09-19 19:12:59'),
(277, 8, 206, 2, 2, '2025-09-19 19:12:59'),
(278, 8, 207, 2, 2, '2025-09-19 19:12:59'),
(279, 8, 208, 2, 2, '2025-09-19 19:12:59'),
(280, 8, 209, 2, 2, '2025-09-19 19:12:59'),
(281, 8, 210, 3, 1, '2025-09-19 19:12:59'),
(282, 8, 211, 3, 1, '2025-09-19 19:12:59'),
(283, 8, 212, 3, 1, '2025-09-19 19:12:59'),
(284, 8, 213, 3, 1, '2025-09-19 19:12:59'),
(285, 8, 214, 3, 2, '2025-09-19 19:12:59'),
(286, 8, 215, 3, 2, '2025-09-19 19:12:59'),
(287, 8, 216, 3, 2, '2025-09-19 19:12:59'),
(288, 8, 217, 3, 2, '2025-09-19 19:12:59'),
(289, 8, 218, 4, 1, '2025-09-19 19:12:59'),
(290, 8, 219, 4, 1, '2025-09-19 19:12:59'),
(291, 8, 220, 4, 1, '2025-09-19 19:12:59'),
(292, 8, 221, 4, 1, '2025-09-19 19:12:59'),
(293, 8, 222, 4, 2, '2025-09-19 19:12:59'),
(294, 8, 223, 4, 2, '2025-09-19 19:12:59'),
(295, 8, 224, 4, 2, '2025-09-19 19:12:59'),
(296, 8, 225, 4, 2, '2025-09-19 19:12:59'),
(297, 9, 226, 1, 1, '2025-09-19 19:25:36'),
(298, 9, 227, 1, 1, '2025-09-19 19:25:36'),
(299, 9, 228, 1, 1, '2025-09-19 19:25:36'),
(300, 9, 229, 1, 1, '2025-09-19 19:25:36'),
(301, 9, 230, 1, 2, '2025-09-19 19:25:36'),
(302, 9, 231, 1, 2, '2025-09-19 19:25:36'),
(303, 9, 232, 1, 2, '2025-09-19 19:25:36'),
(304, 9, 233, 1, 2, '2025-09-19 19:25:36'),
(305, 9, 234, 2, 1, '2025-09-19 19:25:36'),
(306, 9, 235, 2, 1, '2025-09-19 19:25:36'),
(307, 9, 236, 2, 1, '2025-09-19 19:25:36'),
(308, 9, 237, 2, 1, '2025-09-19 19:25:36'),
(309, 9, 238, 2, 2, '2025-09-19 19:25:36'),
(310, 9, 239, 2, 2, '2025-09-19 19:25:36'),
(311, 9, 240, 2, 2, '2025-09-19 19:25:36'),
(312, 9, 241, 2, 2, '2025-09-19 19:25:36'),
(313, 9, 242, 3, 1, '2025-09-19 19:25:36'),
(314, 9, 243, 3, 1, '2025-09-19 19:25:36'),
(315, 9, 244, 3, 1, '2025-09-19 19:25:36'),
(316, 9, 245, 3, 1, '2025-09-19 19:25:36'),
(317, 9, 246, 3, 2, '2025-09-19 19:25:36'),
(318, 9, 247, 3, 2, '2025-09-19 19:25:36'),
(319, 9, 248, 3, 2, '2025-09-19 19:25:36'),
(320, 9, 249, 3, 2, '2025-09-19 19:25:36'),
(321, 9, 250, 4, 1, '2025-09-19 19:25:36'),
(322, 9, 251, 4, 1, '2025-09-19 19:25:36'),
(323, 9, 252, 4, 1, '2025-09-19 19:25:36'),
(324, 9, 253, 4, 1, '2025-09-19 19:25:36'),
(325, 9, 254, 4, 2, '2025-09-19 19:25:36'),
(326, 9, 255, 4, 2, '2025-09-19 19:25:36'),
(327, 9, 256, 4, 2, '2025-09-19 19:25:36'),
(328, 9, 257, 4, 2, '2025-09-19 19:25:36'),
(329, 10, 258, 1, 1, '2025-09-19 19:30:47'),
(330, 10, 259, 1, 1, '2025-09-19 19:30:47'),
(331, 10, 260, 1, 1, '2025-09-19 19:30:47'),
(332, 10, 261, 1, 1, '2025-09-19 19:30:47'),
(333, 10, 262, 1, 2, '2025-09-19 19:30:47'),
(334, 10, 263, 1, 2, '2025-09-19 19:30:47'),
(335, 10, 264, 1, 2, '2025-09-19 19:30:47'),
(336, 10, 265, 1, 2, '2025-09-19 19:30:47'),
(337, 10, 266, 2, 1, '2025-09-19 19:30:47'),
(338, 10, 267, 2, 1, '2025-09-19 19:30:47'),
(339, 10, 268, 2, 1, '2025-09-19 19:30:47'),
(340, 10, 269, 2, 1, '2025-09-19 19:30:47'),
(341, 10, 270, 2, 2, '2025-09-19 19:30:47'),
(342, 10, 271, 2, 2, '2025-09-19 19:30:47'),
(343, 10, 272, 2, 2, '2025-09-19 19:30:47'),
(344, 10, 273, 2, 2, '2025-09-19 19:30:47'),
(345, 10, 274, 3, 1, '2025-09-19 19:30:47'),
(346, 10, 275, 3, 1, '2025-09-19 19:30:47'),
(347, 10, 276, 3, 1, '2025-09-19 19:30:47'),
(348, 10, 277, 3, 1, '2025-09-19 19:30:47'),
(349, 10, 278, 3, 2, '2025-09-19 19:30:47'),
(350, 10, 279, 3, 2, '2025-09-19 19:30:47'),
(351, 10, 280, 3, 2, '2025-09-19 19:30:47'),
(352, 10, 281, 3, 2, '2025-09-19 19:30:47'),
(353, 10, 282, 4, 1, '2025-09-19 19:30:47'),
(354, 10, 283, 4, 1, '2025-09-19 19:30:47'),
(355, 10, 284, 4, 1, '2025-09-19 19:30:47'),
(356, 10, 285, 4, 1, '2025-09-19 19:30:47'),
(357, 10, 286, 4, 2, '2025-09-19 19:30:47'),
(358, 10, 287, 4, 2, '2025-09-19 19:30:47'),
(359, 10, 288, 4, 2, '2025-09-19 19:30:47'),
(360, 10, 289, 4, 2, '2025-09-19 19:30:47'),
(361, 7, 290, 1, 1, '2025-09-19 19:35:19'),
(362, 7, 291, 1, 1, '2025-09-19 19:35:19'),
(363, 7, 292, 1, 1, '2025-09-19 19:35:19'),
(364, 7, 293, 1, 1, '2025-09-19 19:35:19'),
(365, 7, 294, 1, 2, '2025-09-19 19:35:19'),
(366, 7, 295, 1, 2, '2025-09-19 19:35:19'),
(367, 7, 296, 1, 2, '2025-09-19 19:35:19'),
(368, 7, 297, 1, 2, '2025-09-19 19:35:19'),
(369, 7, 298, 2, 1, '2025-09-19 19:35:19'),
(370, 7, 299, 2, 1, '2025-09-19 19:35:19'),
(371, 7, 300, 2, 1, '2025-09-19 19:35:19'),
(372, 7, 301, 2, 1, '2025-09-19 19:35:19'),
(373, 7, 302, 2, 2, '2025-09-19 19:35:19'),
(374, 7, 303, 2, 2, '2025-09-19 19:35:19'),
(375, 7, 304, 2, 2, '2025-09-19 19:35:19'),
(376, 7, 305, 2, 2, '2025-09-19 19:35:19'),
(377, 7, 306, 3, 1, '2025-09-19 19:35:19'),
(378, 7, 307, 3, 1, '2025-09-19 19:35:19'),
(379, 7, 308, 3, 1, '2025-09-19 19:35:19'),
(380, 7, 309, 3, 1, '2025-09-19 19:35:19'),
(381, 7, 310, 3, 2, '2025-09-19 19:35:19'),
(382, 7, 311, 3, 2, '2025-09-19 19:35:19'),
(383, 7, 312, 3, 2, '2025-09-19 19:35:19'),
(384, 7, 313, 3, 2, '2025-09-19 19:35:19'),
(385, 7, 314, 4, 1, '2025-09-19 19:35:19'),
(386, 7, 315, 4, 1, '2025-09-19 19:35:19'),
(387, 7, 316, 4, 1, '2025-09-19 19:35:19'),
(388, 7, 317, 4, 1, '2025-09-19 19:35:19'),
(389, 7, 318, 4, 2, '2025-09-19 19:35:19'),
(390, 7, 319, 4, 2, '2025-09-19 19:35:19'),
(391, 7, 320, 4, 2, '2025-09-19 19:35:19'),
(392, 7, 321, 4, 2, '2025-09-19 19:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `device_registry`
--

CREATE TABLE `device_registry` (
  `device_id` int(11) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `device_type` varchar(50) DEFAULT 'scanner',
  `registered_by` int(11) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_used` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dockets`
--

CREATE TABLE `dockets` (
  `docket_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `programme_id` int(11) NOT NULL,
  `exam_type` varchar(10) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `year_of_study` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `qr_code` varchar(255) NOT NULL,
  `issued_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','expired','reprinted','issued') DEFAULT 'active',
  `printed_count` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dockets`
--

INSERT INTO `dockets` (`docket_id`, `student_id`, `programme_id`, `exam_type`, `course_id`, `year_of_study`, `semester`, `qr_code`, `issued_at`, `expires_at`, `status`, `printed_count`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'ca1', NULL, 0, 0, '104775_ca1_zLQRYl3ipOM7DwCCfO6H2g', '2025-10-09 09:33:32', NULL, '', 1, '2025-10-09 09:33:32', '2025-10-09 09:33:32'),
(2, 1, 1, 'ca1', NULL, 0, 0, '104775_ca1_mvM06cJUljPJWJWrl3CMbg', '2025-10-09 13:04:22', NULL, '', 1, '2025-10-09 13:04:22', '2025-10-09 13:04:22'),
(3, 1, 1, 'ca1', NULL, 0, 0, '104775_ca1_Qi8Duo7QRoxmct5N-jXsCA', '2025-10-09 13:26:07', NULL, '', 1, '2025-10-09 13:26:07', '2025-10-09 13:26:07');

-- --------------------------------------------------------

--
-- Table structure for table `docket_tokens`
--

CREATE TABLE `docket_tokens` (
  `token_id` int(11) NOT NULL,
  `docket_id` int(11) NOT NULL,
  `token_hash` varchar(255) NOT NULL,
  `issued_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','expired','reprinted','used') DEFAULT 'active',
  `used_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `docket_tokens`
--

INSERT INTO `docket_tokens` (`token_id`, `docket_id`, `token_hash`, `issued_at`, `expires_at`, `status`) VALUES
(1, 1, 'fd25671bceec6fb291ab766c0f60356b32cb53da2ef36c17eee4bb65a7097d9a', '2025-10-09 09:33:32', NULL, 'active'),
(2, 2, 'd08a86c61771e0157d51fced13e71dceb2e91bb8213001a8d9d4376f43bc1f52', '2025-10-09 13:04:22', NULL, 'active'),
(3, 3, 'd6158a8fe246a985cd5337ccc941d6c576134eae0a6722ae7a936a697a17b95e', '2025-10-09 13:26:07', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `year_of_study` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `enrollment_status` enum('active','dropped') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `student_id`, `curriculum_id`, `year_of_study`, `semester`, `enrollment_status`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1, 1, 'active', '2025-09-23 01:18:51', '2025-09-23 01:18:51'),
(2, 1, 6, 1, 1, 'active', '2025-09-23 01:18:51', '2025-09-23 01:18:51'),
(3, 1, 7, 1, 1, 'active', '2025-09-23 01:18:51', '2025-09-23 01:18:51'),
(4, 1, 8, 1, 1, 'active', '2025-09-23 01:18:51', '2025-09-23 01:18:51'),
(8, 2, 73, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(9, 2, 74, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(10, 2, 75, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(11, 2, 76, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(12, 3, 105, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(13, 3, 106, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(14, 3, 107, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(15, 3, 108, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(16, 4, 137, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(17, 4, 138, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(18, 4, 139, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(19, 4, 140, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(20, 5, 201, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(21, 5, 202, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(22, 5, 203, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(23, 5, 204, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(24, 6, 233, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(25, 6, 234, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(26, 6, 235, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(27, 6, 236, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(28, 7, 361, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(29, 7, 362, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(30, 7, 363, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(31, 7, 364, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(32, 8, 265, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(33, 8, 266, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(34, 8, 267, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(35, 8, 268, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(36, 9, 297, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(37, 9, 298, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(38, 9, 299, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(39, 9, 300, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(40, 10, 329, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(41, 10, 330, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(42, 10, 331, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(43, 10, 332, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(44, 11, 5, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(45, 11, 6, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(46, 11, 7, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(47, 11, 8, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(48, 12, 73, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(49, 12, 74, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(50, 12, 75, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(51, 12, 76, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(52, 13, 105, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(53, 13, 106, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(54, 13, 107, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(55, 13, 108, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(56, 14, 137, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(57, 14, 138, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(58, 14, 139, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(59, 14, 140, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(60, 15, 201, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(61, 15, 202, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(62, 15, 203, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(63, 15, 204, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(64, 16, 233, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(65, 16, 234, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(66, 16, 235, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(67, 16, 236, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(68, 17, 361, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(69, 17, 362, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(70, 17, 363, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(71, 17, 364, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(72, 18, 265, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(73, 18, 266, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(74, 18, 267, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(75, 18, 268, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(76, 19, 297, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(77, 19, 298, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(78, 19, 299, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(79, 19, 300, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(80, 20, 329, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(81, 20, 330, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(82, 20, 331, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(83, 20, 332, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(84, 21, 5, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(85, 21, 6, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(86, 21, 7, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(87, 21, 8, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(88, 22, 73, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(89, 22, 74, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(90, 22, 75, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(91, 22, 76, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(92, 23, 105, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(93, 23, 106, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(94, 23, 107, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(95, 23, 108, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(96, 24, 137, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(97, 24, 138, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(98, 24, 139, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(99, 24, 140, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(100, 25, 201, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(101, 25, 202, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(102, 25, 203, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(103, 25, 204, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(104, 26, 233, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(105, 26, 234, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(106, 26, 235, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(107, 26, 236, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(108, 27, 361, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(109, 27, 362, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(110, 27, 363, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(111, 27, 364, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(112, 28, 265, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(113, 28, 266, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(114, 28, 267, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(115, 28, 268, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(116, 29, 297, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(117, 29, 298, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(118, 29, 299, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(119, 29, 300, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(120, 30, 329, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(121, 30, 330, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(122, 30, 331, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(123, 30, 332, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(124, 31, 5, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(125, 31, 6, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(126, 31, 7, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(127, 31, 8, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(128, 32, 73, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(129, 32, 74, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(130, 32, 75, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(131, 32, 76, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(132, 33, 105, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(133, 33, 106, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(134, 33, 107, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(135, 33, 108, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(136, 34, 137, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(137, 34, 138, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(138, 34, 139, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(139, 34, 140, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(140, 35, 201, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(141, 35, 202, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(142, 35, 203, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(143, 35, 204, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(144, 36, 233, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(145, 36, 234, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(146, 36, 235, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(147, 36, 236, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(148, 37, 361, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(149, 37, 362, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(150, 37, 363, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(151, 37, 364, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(152, 38, 265, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(153, 38, 266, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(154, 38, 267, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(155, 38, 268, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(156, 39, 297, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(157, 39, 298, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(158, 39, 299, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(159, 39, 300, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(160, 40, 329, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(161, 40, 330, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(162, 40, 331, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(163, 40, 332, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(164, 41, 5, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(165, 41, 6, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(166, 41, 7, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(167, 41, 8, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(168, 42, 73, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(169, 42, 74, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(170, 42, 75, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(171, 42, 76, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(172, 43, 105, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(173, 43, 106, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(174, 43, 107, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(175, 43, 108, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(176, 44, 137, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(177, 44, 138, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(178, 44, 139, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(179, 44, 140, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(180, 45, 201, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(181, 45, 202, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(182, 45, 203, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(183, 45, 204, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(184, 46, 233, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(185, 46, 234, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(186, 46, 235, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(187, 46, 236, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(188, 47, 361, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(189, 47, 362, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(190, 47, 363, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(191, 47, 364, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(192, 48, 265, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(193, 48, 266, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(194, 48, 267, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(195, 48, 268, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(196, 49, 297, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(197, 49, 298, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(198, 49, 299, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(199, 49, 300, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(200, 50, 329, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(201, 50, 330, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(202, 50, 331, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(203, 50, 332, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(204, 51, 5, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(205, 51, 6, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(206, 51, 7, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(207, 51, 8, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(208, 52, 73, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(209, 52, 74, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(210, 52, 75, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(211, 52, 76, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(212, 53, 105, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(213, 53, 106, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(214, 53, 107, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(215, 53, 108, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(216, 54, 137, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(217, 54, 138, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(218, 54, 139, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(219, 54, 140, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(220, 55, 201, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(221, 55, 202, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(222, 55, 203, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(223, 55, 204, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(224, 56, 233, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(225, 56, 234, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(226, 56, 235, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(227, 56, 236, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(228, 57, 361, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(229, 57, 362, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(230, 57, 363, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(231, 57, 364, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(232, 58, 265, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(233, 58, 266, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(234, 58, 267, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(235, 58, 268, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(236, 59, 297, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(237, 59, 298, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(238, 59, 299, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(239, 59, 300, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(240, 60, 329, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(241, 60, 330, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(242, 60, 331, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(243, 60, 332, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(244, 61, 5, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(245, 61, 6, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(246, 61, 7, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(247, 61, 8, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(248, 62, 73, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(249, 62, 74, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(250, 62, 75, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(251, 62, 76, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(252, 63, 105, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(253, 63, 106, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(254, 63, 107, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(255, 63, 108, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(256, 64, 137, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(257, 64, 138, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(258, 64, 139, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(259, 64, 140, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(260, 65, 201, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(261, 65, 202, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(262, 65, 203, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(263, 65, 204, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(264, 66, 233, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(265, 66, 234, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(266, 66, 235, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(267, 66, 236, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(268, 67, 361, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(269, 67, 362, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(270, 67, 363, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(271, 67, 364, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(272, 68, 265, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(273, 68, 266, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(274, 68, 267, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(275, 68, 268, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(276, 69, 297, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(277, 69, 298, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(278, 69, 299, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(279, 69, 300, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(280, 70, 329, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(281, 70, 330, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(282, 70, 331, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(283, 70, 332, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(284, 71, 5, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(285, 71, 6, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(286, 71, 7, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(287, 71, 8, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(288, 72, 73, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(289, 72, 74, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(290, 72, 75, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(291, 72, 76, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(292, 73, 105, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(293, 73, 106, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(294, 73, 107, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(295, 73, 108, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(296, 74, 137, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(297, 74, 138, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(298, 74, 139, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(299, 74, 140, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(300, 75, 201, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(301, 75, 202, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(302, 75, 203, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(303, 75, 204, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(304, 76, 233, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(305, 76, 234, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(306, 76, 235, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(307, 76, 236, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(308, 77, 361, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(309, 77, 362, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(310, 77, 363, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(311, 77, 364, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(312, 78, 265, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(313, 78, 266, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(314, 78, 267, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(315, 78, 268, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(316, 79, 297, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(317, 79, 298, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(318, 79, 299, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(319, 79, 300, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(320, 80, 329, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(321, 80, 330, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(322, 80, 331, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(323, 80, 332, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(324, 81, 5, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(325, 81, 6, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(326, 81, 7, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(327, 81, 8, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(328, 82, 73, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(329, 82, 74, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(330, 82, 75, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(331, 82, 76, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(332, 83, 105, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(333, 83, 106, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(334, 83, 107, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(335, 83, 108, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(336, 84, 137, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(337, 84, 138, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(338, 84, 139, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(339, 84, 140, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(340, 85, 201, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(341, 85, 202, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(342, 85, 203, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(343, 85, 204, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(344, 86, 233, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(345, 86, 234, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(346, 86, 235, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(347, 86, 236, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(348, 87, 361, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(349, 87, 362, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(350, 87, 363, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(351, 87, 364, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(352, 88, 265, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(353, 88, 266, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(354, 88, 267, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(355, 88, 268, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(356, 89, 297, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(357, 89, 298, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(358, 89, 299, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(359, 89, 300, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(360, 90, 329, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(361, 90, 330, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(362, 90, 331, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(363, 90, 332, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(364, 91, 5, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(365, 91, 6, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(366, 91, 7, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(367, 91, 8, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(368, 92, 73, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(369, 92, 74, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(370, 92, 75, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(371, 92, 76, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(372, 93, 105, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(373, 93, 106, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(374, 93, 107, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(375, 93, 108, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(376, 94, 137, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(377, 94, 138, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(378, 94, 139, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(379, 94, 140, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(380, 95, 201, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(381, 95, 202, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(382, 95, 203, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(383, 95, 204, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(384, 96, 233, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(385, 96, 234, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(386, 96, 235, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(387, 96, 236, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(388, 97, 361, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(389, 97, 362, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(390, 97, 363, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(391, 97, 364, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(392, 98, 265, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(393, 98, 266, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(394, 98, 267, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(395, 98, 268, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(396, 99, 297, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(397, 99, 298, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(398, 99, 299, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(399, 99, 300, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(400, 100, 329, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(401, 100, 330, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(402, 100, 331, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30'),
(403, 100, 332, 1, 1, 'active', '2025-09-23 01:57:30', '2025-09-23 01:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `fee_schedule`
--

CREATE TABLE `fee_schedule` (
  `schedule_id` int(11) NOT NULL,
  `exam_type` enum('CA1','CA2','EXAM') NOT NULL,
  `required_percentage` decimal(5,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fee_schedule`
--

INSERT INTO `fee_schedule` (`schedule_id`, `exam_type`, `required_percentage`, `created_at`) VALUES
(1, 'CA1', 20.00, '2025-09-17 00:48:16'),
(2, 'CA2', 75.00, '2025-09-17 00:48:16'),
(3, 'EXAM', 100.00, '2025-09-17 00:48:16');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `programme_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_type` enum('CA1','CA2','Exam','General') NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_status` enum('pending','completed','failed') DEFAULT 'completed',
  `receipt_number` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `student_id`, `programme_id`, `course_id`, `amount`, `payment_type`, `payment_date`, `payment_status`, `receipt_number`, `created_at`) VALUES
(1, 1, 1, NULL, 8000.00, 'General', '2025-10-11 07:18:11', 'completed', NULL, '2025-10-11 07:18:11'),
(2, 3, 3, NULL, 11000.00, 'General', '2025-10-11 07:36:11', 'completed', NULL, '2025-10-11 07:36:11'),
(3, 1, 1, NULL, 10000.00, 'General', '2025-10-11 07:42:19', 'completed', NULL, '2025-10-11 07:42:19'),
(4, 1, 1, NULL, 8000.00, 'General', '2025-10-11 08:03:18', 'completed', NULL, '2025-10-11 08:03:18'),
(5, 1, 1, NULL, 1000.00, 'General', '2025-10-11 08:12:14', 'completed', NULL, '2025-10-11 08:12:14'),
(6, 1, 1, NULL, 1000.00, 'General', '2025-10-11 08:25:15', 'completed', NULL, '2025-10-11 08:25:15'),
(7, 1, 1, NULL, 1000.00, 'General', '2025-10-11 08:34:30', 'completed', NULL, '2025-10-11 08:34:30'),
(8, 1, 1, NULL, 1000.00, 'General', '2025-10-11 08:36:55', 'completed', NULL, '2025-10-11 08:36:55'),
(9, 1, 1, NULL, 500.00, 'General', '2025-10-11 08:40:18', 'completed', NULL, '2025-10-11 08:40:18'),
(10, 1, 1, NULL, 500.00, 'General', '2025-10-11 08:45:03', 'completed', NULL, '2025-10-11 08:45:03'),
(11, 4, 4, NULL, 1000.00, 'General', '2025-10-11 08:49:41', 'completed', NULL, '2025-10-11 08:49:41');

--
-- Triggers `payments`
--
DELIMITER $$
CREATE TRIGGER `update_balance_after_payment` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
    -- Update student balance after new payment
    UPDATE student_balances
    SET amount_paid = amount_paid + NEW.amount,
        balance = total_fee - (amount_paid + NEW.amount),
        last_updated = NOW()
    WHERE student_id = NEW.student_id
      AND programme_id = NEW.programme_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `programmes`
--

CREATE TABLE `programmes` (
  `programme_id` int(11) NOT NULL,
  `programme_name` varchar(100) NOT NULL,
  `programme_code` varchar(10) DEFAULT NULL,
  `total_years` int(11) NOT NULL DEFAULT 4,
  `semesters_per_year` int(11) NOT NULL DEFAULT 2,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `duration_years` int(11) DEFAULT 4,
  `total_fee` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programmes`
--

INSERT INTO `programmes` (`programme_id`, `programme_name`, `programme_code`, `total_years`, `semesters_per_year`, `created_at`, `updated_at`, `duration_years`, `total_fee`) VALUES
(1, 'Bachelor of Business Administration', 'BBA', 4, 2, '2025-09-17 13:34:18', '2025-09-26 10:30:29', 4, 10000.00),
(2, 'Bachelor of Computer Science', 'BCS', 4, 2, '2025-09-17 13:34:18', '2025-09-26 10:30:29', 4, 12000.00),
(3, 'Bachelor of Accounting and Finance', 'BAF', 4, 2, '2025-09-17 13:34:18', '2025-09-26 10:30:29', 4, 11000.00),
(4, 'Bachelor of Public Health', 'BPH', 4, 2, '2025-09-17 13:34:18', '2025-09-26 10:30:29', 4, 9000.00),
(5, 'Bachelor of Nursing', 'BNUR', 4, 2, '2025-09-17 13:34:18', '2025-09-26 10:30:29', 4, 9500.00),
(6, 'Bachelor of Education', 'BEDU', 4, 2, '2025-09-17 13:34:18', '2025-09-26 10:30:29', 4, 10000.00),
(7, 'Bachelor of Engineering', 'BENG', 4, 2, '2025-09-17 13:34:18', '2025-09-26 10:30:29', 4, 13000.00),
(8, 'Bachelor of Information Technology', 'BIT', 4, 2, '2025-09-17 13:34:18', '2025-09-26 10:30:29', 4, 11500.00),
(9, 'Bachelor of Marketing', 'BMKT', 4, 2, '2025-09-17 13:34:18', '2025-09-26 10:30:29', 4, 10000.00),
(10, 'Bachelor of Economics', 'BECO', 4, 2, '2025-09-17 13:34:18', '2025-09-26 10:30:29', 4, 10500.00);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_number` char(6) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `programme_id` int(11) DEFAULT NULL,
  `current_year` int(11) NOT NULL,
  `current_semester` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT 'system',
  `password_hash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_number`, `first_name`, `last_name`, `email`, `programme_id`, `current_year`, `current_semester`, `password`, `status`, `created_at`, `created_by`, `password_hash`) VALUES
(1, '104775', 'Rewardson', 'Bukuru', 'rb104775@students.cavendish.co.zm', 1, 1, 1, 'REWARDSON2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$vJWFLObJO7sa1vKEKNc.7OXKU9oO77zG50AXeOlzO2ZQC1ecrHYV2'),
(2, '104776', 'Denise', 'Seti', 'ds104776@students.cavendish.co.zm', 2, 1, 1, 'DENISE2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$KSBzTw2o2ydH9S21GbCfQuG3VG8fD6t1bGo81uoWTtbh3W9lFFLtu'),
(3, '104777', 'James', 'Mwale', 'jm104777@students.cavendish.co.zm', 3, 1, 1, 'JAMES2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$b.U4j.GTPjXdGWbm5DpU9engaIYeXjQ2cp/C8/CYeg.O/uwic93ci'),
(4, '104778', 'Agness', 'Zulu', 'az104778@students.cavendish.co.zm', 4, 1, 1, 'AGNESS2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$9rdaW0xpkctvtpsRap7dWOlqKyGZNXmPIBMj.PxCoymFxwfX6jl82'),
(5, '104779', 'Peter', 'Tembo', 'pt104779@students.cavendish.co.zm', 5, 1, 1, 'PETER2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$9IHaX0l9KnSrqo9POs/o7OPZhOoj1DWRMUaQuM/nPJ2JiOa9JrXCi'),
(6, '104780', 'Joseph', 'Mumba', 'jm104780@students.cavendish.co.zm', 6, 1, 1, 'JOSEPH2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$ib7JEqCOvoA3vs/Y3unpjuE6cVT3TW7MxBop/ZeHs0EhGhQK35CBK'),
(7, '104781', 'Linda', 'Chanda', 'lc104781@students.cavendish.co.zm', 7, 1, 1, 'LINDA2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$vZcPKC3Mw/GNBtc1X92r8.tckERd6.QHWcvrsI1L3uQjUZkPFZzKi'),
(8, '104782', 'Henry', 'Ngoma', 'hn104782@students.cavendish.co.zm', 8, 1, 1, 'HENRY2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$L0mLV3BF.o4S3.Mk1bBg7ejTrJGwU3JN4AoJDA1qPJbLyiosUo9Cu'),
(9, '104783', 'Brenda', 'Kabaso', 'bk104783@students.cavendish.co.zm', 9, 1, 1, 'BRENDA2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$SOA8KcR8Bi9GMTd5CD5HZe2uT/DxF.BWkWwkSUXhV5BhGQAhUy1Ly'),
(10, '104784', 'Patrick', 'Lungu', 'pl104784@students.cavendish.co.zm', 10, 1, 1, 'PATRICK2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$/qz0AdmHpTfSXYIk/hStc.O24Qi5fJsz2LdrMdAUh.2gCABDvZKay'),
(11, '104785', 'Alice', 'Mwansa', 'am104785@students.cavendish.co.zm', 1, 1, 1, 'ALICE2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$r24ZR.nZ/dVeUyzDSU3AbO3G5vrclPIRFWdRTtwUtkDcT9EM.3GLG'),
(12, '104786', 'Michael', 'Phiri', 'mp104786@students.cavendish.co.zm', 2, 1, 1, 'MICHAEL2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$Wz3OFhqRwPRN8z3D2vB2Je72/7dAos6kTG5jV2nr8YOKatqbNBfMu'),
(13, '104787', 'Grace', 'Kunda', 'gk104787@students.cavendish.co.zm', 3, 1, 1, 'GRACE2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$B/d8ps/GW1cMmR/WZrXUbOROZFtL1.VHT1UpGte4cxhJyaWheWIda'),
(14, '104788', 'Daniel', 'Chilufya', 'dc104788@students.cavendish.co.zm', 4, 1, 1, 'DANIEL2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$D4g462HhrRz91i8H.jtZIeW.ypOFxaM6k4KirruaNiZDrnm9O05VG'),
(15, '104789', 'Faith', 'Mwewa', 'fm104789@students.cavendish.co.zm', 5, 1, 1, 'FAITH2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$RnEQaKcDJOVgz2Sbtsh3U.mzTRpcGxLl6HHlGk50DiNUo0McySBNu'),
(16, '104790', 'Steven', 'Mwila', 'sm104790@students.cavendish.co.zm', 6, 1, 1, 'STEVEN2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$KkgkosxXewFFlfxH3MHPv.hjGjnWTz0VtXW52OZmCbVuvAOTkZRzS'),
(17, '104791', 'Patricia', 'Kabwe', 'pk104791@students.cavendish.co.zm', 7, 1, 1, 'PATRICIA2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$SnkdQTpnq5tnV20piaemZ.5cF8D0TpDoO0odwSQ1Qztg3sog2c6ni'),
(18, '104792', 'Charles', 'Phiri', 'cp104792@students.cavendish.co.zm', 8, 1, 1, 'CHARLES2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$HsLWyueRmJgWUgSOY2O0P./aEd9cWQcMg2Ubi7E80dwaNT7kcK.XO'),
(19, '104793', 'Esther', 'Mumba', 'em104793@students.cavendish.co.zm', 9, 1, 1, 'ESTHER2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$xasGky1UdCgulTgpGaw4K.hlTB6XOKze6FhPdxO1fTCw/P9naQhDG'),
(20, '104794', 'Brian', 'Chilenga', 'bc104794@students.cavendish.co.zm', 10, 1, 1, 'BRIAN2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$KlekNFZQ9lxR1QXLNDB77uBO0F6UK49hPTXy89.PV4lDPGWbC/fIu'),
(21, '104795', 'Rebecca', 'Lungu', 'rl104795@students.cavendish.co.zm', 1, 1, 1, 'REBECCA2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$XrDMBqIdq4SZHkMR7Te1GecSIBYWDoNr5FzLo/UlG1efo1L1etVsi'),
(22, '104796', 'Edward', 'Zulu', 'ez104796@students.cavendish.co.zm', 2, 1, 1, 'EDWARD2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$plj7SzTdYzslOYOMNUt2kenfEUJndGjCCFcLRYVDD3HylcQRpfU2S'),
(23, '104797', 'Joyce', 'Mwansa', 'jm104797@students.cavendish.co.zm', 3, 1, 1, 'JOYCE2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$2DqhN4x/oLX4SNFa7obxvuNWvGXuZrNVz6uxe7BAz/tI/0ECINjUm'),
(24, '104798', 'Victor', 'Kunda', 'vk104798@students.cavendish.co.zm', 4, 1, 1, 'VICTOR2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$XDXne23US9u10bkhX2tO1uZlbl9U64aAA71nacvy0FlZj7WppoouO'),
(25, '104799', 'Lilian', 'Chanda', 'lc104799@students.cavendish.co.zm', 5, 1, 1, 'LILIAN2025', 'active', '2025-09-17 14:00:12', 'admin', '$2b$12$HrF5HNUkvC9SV/YG7gpvuOYnS8ApM7hfjAkzeKod1P2tcG8WsV0l6'),
(26, '104800', 'Samuel', 'Mwila', 'sm104800@students.cavendish.co.zm', 6, 1, 1, 'SAMUEL2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$7IM8naQihw43CCKGmOK0ge0VgqzRnq2BtBrG4fHIEVUmacv79PxSm'),
(27, '104801', 'Naomi', 'Phiri', 'np104801@students.cavendish.co.zm', 7, 1, 1, 'NAOMI2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$qnwxBBIFuDbTGaletI6pSOGiuJT6svR7vbX6tTFaa8lCkqDUtXB8u'),
(28, '104802', 'Brian', 'Mumba', 'bm104802@students.cavendish.co.zm', 8, 1, 1, 'BRIAN2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$lL.Rccqu2rWoGbVHik7Y3OeONnDnRA4BWCAtrQOUkGs2HHqR4Sa02'),
(29, '104803', 'Linda', 'Chilufya', 'lc104803@students.cavendish.co.zm', 9, 1, 1, 'LINDA2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$rph3hDXJmjYsJq1WKVRmuOFA72FpMK6uZLqyBE482pBqQDuafIkxy'),
(30, '104804', 'Peter', 'Lungu', 'pl104804@students.cavendish.co.zm', 10, 1, 1, 'PETER2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$JyTu0CTt4MqZyyyQi45rQeO6yCWtr7Nl3ravrbIl/HxFIfIoDoQg2'),
(31, '104805', 'Alice', 'Mwale', 'am104805@students.cavendish.co.zm', 1, 1, 1, 'ALICE2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$sGsXsamgRRvPQrtW.BhxbuKa87qptA2QiZzL4LxcS0MrIm7ul30m2'),
(32, '104806', 'Daniel', 'Phiri', 'dp104806@students.cavendish.co.zm', 2, 1, 1, 'DANIEL2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$Vvl1xnlngGvnQ0w89qNXjeI7cFbaPCsv6NO.dU1abLTfFCz5SGoWe'),
(33, '104807', 'Faith', 'Chanda', 'fc104807@students.cavendish.co.zm', 3, 1, 1, 'FAITH2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$3ga5Iq01s2Zc6KgyEv4kwOAsWoSmx2QG1x/0hdgbJpSXI5SInk58.'),
(34, '104808', 'Victor', 'Tembo', 'vt104808@students.cavendish.co.zm', 4, 1, 1, 'VICTOR2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$8O99iz/lOmfuysazPFMAIeissF1P.kH1iAgi8gk588ZKe1ACaK2by'),
(35, '104809', 'Rebecca', 'Kabaso', 'rk104809@students.cavendish.co.zm', 5, 1, 1, 'REBECCA2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$c.NQo54iO8zBurfhmVWrKOtzlqcIPxXVkx/G0cyobPXNw0tbf3AEu'),
(36, '104810', 'Charles', 'Kabwe', 'ck104810@students.cavendish.co.zm', 6, 1, 1, 'CHARLES2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$S7MVeiyyIO1cbLntO1z3b.x/OUF8NmPhiVQGszK7ezDNmJy02GWdy'),
(37, '104811', 'Esther', 'Ngoma', 'en104811@students.cavendish.co.zm', 7, 1, 1, 'ESTHER2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$0XR16lzMSa.k.ttv3F8Fg.W3XkhOMDBrbqpn/lnhI9/7A9DzvPnZq'),
(38, '104812', 'Michael', 'Phiri', 'mp104812@students.cavendish.co.zm', 8, 1, 1, 'MICHAEL2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$vRZmr82055lhzPvz.Ro63Oh6Ns/TV1PKLoVjVlEyRAhRzsy2l698G'),
(39, '104813', 'Joyce', 'Mwansa', 'jm104813@students.cavendish.co.zm', 9, 1, 1, 'JOYCE2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$qRmlBZZ6SoNUrG1rendrhuBjFaDqM.45r87L44y15Il2Y9x3YTmuu'),
(40, '104814', 'Henry', 'Chilenga', 'hc104814@students.cavendish.co.zm', 10, 1, 1, 'HENRY2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$so/ZHpjTham2du/W.hSrj.cQLXxi3h6jmirbC0vWyesJPcV8Ae9N.'),
(41, '104815', 'Patricia', 'Lungu', 'pl104815@students.cavendish.co.zm', 1, 1, 1, 'PATRICIA2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$WI9OwOUt5UfwQGdXYjjEROPR/L2dIBeyW4j5QwXCro.ACG6HQpTze'),
(42, '104816', 'Edward', 'Zulu', 'ez104816@students.cavendish.co.zm', 2, 1, 1, 'EDWARD2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$gLrMTWozOUv5eLdY3fAMlugumdlWOlJa6t5/lI0hNq0SErLwE2sX6'),
(43, '104817', 'Brenda', 'Mwale', 'bm104817@students.cavendish.co.zm', 3, 1, 1, 'BRENDA2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$xha.OhIi3hxuxXI9u7r95ObrT/58MF5UXIhHLfrO0KC1Ms0F31vs2'),
(44, '104818', 'Samuel', 'Phiri', 'sp104818@students.cavendish.co.zm', 4, 1, 1, 'SAMUEL2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$wTeM2nVwGXSla6IkFgsLnuGJAj4N9CBqjB9PrQ9HtK/EKxmWDnFty'),
(45, '104819', 'Lilian', 'Chanda', 'lc104819@students.cavendish.co.zm', 5, 1, 1, 'LILIAN2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$NIZoJImkf1gKteWb.4hZyOQJMkvEgM9xIX8Ywce5cOXPMJWWADYWa'),
(46, '104820', 'John', 'Mwansa', 'jm104820@students.cavendish.co.zm', 6, 1, 1, 'JOHN2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$pnI51onsh3V.2bCZLzyPsesmc4ww4My20bdnKYQJbh/sl5jpTx8bK'),
(47, '104821', 'Mary', 'Kunda', 'mk104821@students.cavendish.co.zm', 7, 1, 1, 'MARY2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$ZVU7vTxjLuKOe1eVGRftgeZTlFWhuF4hg.Gcr/tL9.F.K40u7oFzO'),
(48, '104822', 'James', 'Lungu', 'jl104822@students.cavendish.co.zm', 8, 1, 1, 'JAMES2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$Ua9NvuDL84ZuUaKe7maPIeLpkHJ81oHXRRZWm/xNpp3AB5DZ67eFW'),
(49, '104823', 'Agness', 'Chilufya', 'ac104823@students.cavendish.co.zm', 9, 1, 1, 'AGNESS2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$3D0Me3toXOGafgRWEXwhyebKRc8ilcfvukYY0a3uoXMdAd7QgPFpS'),
(50, '104824', 'Peter', 'Mwila', 'pm104824@students.cavendish.co.zm', 10, 1, 1, 'PETER2025', 'active', '2025-09-17 14:03:57', 'admin', '$2b$12$if4RiY.ku2B607PREjWxGu4N851WGThn7OnL.Hj9RAnmFYRQgLzQe'),
(51, '104825', 'Alice', 'Phiri', 'ap104825@students.cavendish.co.zm', 1, 1, 1, 'ALICE2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$pmOA8euR3cemqVe5oUopu.eGZDQXOOpN5x30SucUfqtD6pu3u5TBe'),
(52, '104826', 'Daniel', 'Mwale', 'dm104826@students.cavendish.co.zm', 2, 1, 1, 'DANIEL2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$dDvfkWgEsvm9fwj26.AQdePo0YwIMj102vfLNr7JcBtzvFtg1rxle'),
(53, '104827', 'Faith', 'Tembo', 'ft104827@students.cavendish.co.zm', 3, 1, 1, 'FAITH2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$K1QcXLKIcgciGlynAshaDOhQQUwd2PrsqDT1oILwiX74rmNLsbmMe'),
(54, '104828', 'Victor', 'Kabwe', 'vk104828@students.cavendish.co.zm', 4, 1, 1, 'VICTOR2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$pK/Ud3vLa5Imxs1A90Ql/erY/aqT/TP62QWEXRj/39s/XEDrbnKue'),
(55, '104829', 'Rebecca', 'Chanda', 'rc104829@students.cavendish.co.zm', 5, 1, 1, 'REBECCA2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$/1ySJePbsVlZCANYLkTBKuwYcYu7ilkmaC4GfidQ72gNo0irIoDC6'),
(56, '104830', 'Charles', 'Mwansa', 'cm104830@students.cavendish.co.zm', 6, 1, 1, 'CHARLES2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$4RMbneuHXitUtLmfGYxqieK11fxYt4MJCab.63AiquDHDwBMtRPgO'),
(57, '104831', 'Esther', 'Phiri', 'ep104831@students.cavendish.co.zm', 7, 1, 1, 'ESTHER2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$PtxZz1XK2Ja0EGWIb44NIe3x/LTrIx/WeevsRQcytUL8Xi4wKkRde'),
(58, '104832', 'Michael', 'Kunda', 'mk104832@students.cavendish.co.zm', 8, 1, 1, 'MICHAEL2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$LRBsediyWw2rrZd37DAtY.KEbIhG3ThV36.H/seNj3N844c5osX7q'),
(59, '104833', 'Joyce', 'Lungu', 'jl104833@students.cavendish.co.zm', 9, 1, 1, 'JOYCE2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$RAu7hMyi6eRxUOCHoXllQO2HpTbjmPOxJ1RrGs1cnPEXBA71lv6S.'),
(60, '104834', 'Henry', 'Chilenga', 'hc104834@students.cavendish.co.zm', 10, 1, 1, 'HENRY2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$gs1Vj0I62wDv17dVtRh7IeyX0GMZov00KWvMPQoTnYqWsHIa0xGpG'),
(61, '104835', 'Patricia', 'Mwila', 'pm104835@students.cavendish.co.zm', 1, 1, 1, 'PATRICIA2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$QZEs9PAYrfy4OKzpCqtCIuZSSYwuwZQ3ucdgQSOrR.pFEmRnX.AGm'),
(62, '104836', 'Edward', 'Mumba', 'em104836@students.cavendish.co.zm', 2, 1, 1, 'EDWARD2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$6Nrh2XzLDafFsU5.zOfPAuxjOkOmM/ZiXYzbXg/MEidOFlwLrRe9i'),
(63, '104837', 'Brenda', 'Chilufya', 'bc104837@students.cavendish.co.zm', 3, 1, 1, 'BRENDA2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$MgI2cDo02JaX8E8YTSF.t.mYPu/CsgTQUFamZwdc8O8OqASofAmVq'),
(64, '104838', 'Samuel', 'Tembo', 'st104838@students.cavendish.co.zm', 4, 1, 1, 'SAMUEL2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$XDda5zMQoggzQcSQTy3uAeAZABoy5ZfChR.WXd2K5riY522yI8Gye'),
(65, '104839', 'Lilian', 'Kabwe', 'lk104839@students.cavendish.co.zm', 5, 1, 1, 'LILIAN2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$JzwSiVoUVM0.oI23Bzxeb.bX5O3Fmv925gUME8srTWO6A1Ao2ufDS'),
(66, '104840', 'John', 'Chanda', 'jc104840@students.cavendish.co.zm', 6, 1, 1, 'JOHN2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$aRDCSylrpAC6WNCZiOwm7u32s1zeZGoE7zuRkXvySbPhqON.pJ44S'),
(67, '104841', 'Mary', 'Mwansa', 'mm104841@students.cavendish.co.zm', 7, 1, 1, 'MARY2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$fj2qSI9mc1YJXSyDmeaMMe3mOpxsg5/8L6QPXVnxvE6tPNQCtTZHy'),
(68, '104842', 'James', 'Phiri', 'jp104842@students.cavendish.co.zm', 8, 1, 1, 'JAMES2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$lzGJnfQQZSH5Eka5DopzCu3a0p.Fc9P9vJKINPTobOeNdbliwoU3e'),
(69, '104843', 'Agness', 'Mumba', 'am104843@students.cavendish.co.zm', 9, 1, 1, 'AGNESS2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$HGD.6Bpfg9WpduMyDKsKv.K/v2yXGmtCzvj6E9.gUWAVPjuAsZwQe'),
(70, '104844', 'Peter', 'Chilenga', 'pc104844@students.cavendish.co.zm', 10, 1, 1, 'PETER2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$uz1hnLPnDu42gNlWFWVkoONClW30u/auH.u4.y5G6.pud0lcpJEBC'),
(71, '104845', 'Alice', 'Lungu', 'al104845@students.cavendish.co.zm', 1, 1, 1, 'ALICE2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$w1jYOJC1XmOvENDE393Y2eIqNePUcQzaN3dAcr9ST84lsqQ2FzOcG'),
(72, '104846', 'Daniel', 'Zulu', 'dz104846@students.cavendish.co.zm', 2, 1, 1, 'DANIEL2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$I.LW8v9uvu0cmrMeEHzs/.m0pkIwUTBYj9SojkS3lPpmJ5lunpSAe'),
(73, '104847', 'Faith', 'Mwale', 'fm104847@students.cavendish.co.zm', 3, 1, 1, 'FAITH2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$pcKs3qt4X3m75bHcyz3QpebeH9ffA15b/I4L/ryonNFW58QzgtgcG'),
(74, '104848', 'Victor', 'Phiri', 'vp104848@students.cavendish.co.zm', 4, 1, 1, 'VICTOR2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$fD.X17FGyXue3W/cx/lCkeck/BWamBSZZ5PSZ8CkGGi5Iys2QFb/e'),
(75, '104849', 'Rebecca', 'Mwansa', 'rm104849@students.cavendish.co.zm', 5, 1, 1, 'REBECCA2025', 'active', '2025-09-17 14:08:10', 'admin', '$2b$12$n1LH1vZHTLyHt0rHGjdwXOUC6IeW/gTjrPkvPFwbcHw169FBaOIQS'),
(76, '104850', 'Charles', 'Kunda', 'ck104850@students.cavendish.co.zm', 6, 1, 1, 'CHARLES2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$ngCcdTHk/02KNLBAwtnLZOYNVeBr/.ewf9WlTpbaL9syqMFYbUi7m'),
(77, '104851', 'Esther', 'Lungu', 'el104851@students.cavendish.co.zm', 7, 1, 1, 'ESTHER2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$TrYJRr0quODVKUR5wGsKv.7VSxZhBIPxPSYMyG1Xf.YfCLG8hyKI.'),
(78, '104852', 'Michael', 'Mwila', 'mm104852@students.cavendish.co.zm', 8, 1, 1, 'MICHAEL2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$MdETutPoFkRiNKZ4qdlHWudldE7LKAzkHk5mo7cDyBNciyLnlR4ZO'),
(79, '104853', 'Joyce', 'Chilufya', 'jc104853@students.cavendish.co.zm', 9, 1, 1, 'JOYCE2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$drdML0dYyanwgQj5MrIce.T9FaphMeAFNW3nAnYn.aw8TKBPXPfuK'),
(80, '104854', 'Henry', 'Phiri', 'hp104854@students.cavendish.co.zm', 10, 1, 1, 'HENRY2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$fAyEKGOGBWqRRuZBnS20Gup09LhG9cK284H81sFutYGBUXlcpksUq'),
(81, '104855', 'Patricia', 'Mwansa', 'pm104855@students.cavendish.co.zm', 1, 1, 1, 'PATRICIA2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$WqOENijeypBfBJf6d3iIJO5TDkG0wlPrEr.lRDHU9G5Q3iIxnUyuW'),
(82, '104856', 'Edward', 'Chanda', 'ec104856@students.cavendish.co.zm', 2, 1, 1, 'EDWARD2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$uJE4rNor34OcgyUHXYpJLu2SHPIPJvwyIdALb559SVP/aAE3nrWhC'),
(83, '104857', 'Brenda', 'Mwale', 'bm104857@students.cavendish.co.zm', 3, 1, 1, 'BRENDA2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$Wg9YouUoTUTS438DtO8DpOBjOhvYqeWKVY2OgANO2HLcCcZz21BfK'),
(84, '104858', 'Samuel', 'Kabwe', 'sk104858@students.cavendish.co.zm', 4, 1, 1, 'SAMUEL2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$l5V3bczJ0VhmrBAm/hByX.PV3DJMrOPhjVuHsMDkkTg5k6OQ14naC'),
(85, '104859', 'Lilian', 'Mwila', 'lm104859@students.cavendish.co.zm', 5, 1, 1, 'LILIAN2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$RwYMyz/cr9ukV2QnxTh38eqXBpr5aqh.GAJYbXIXAd5xIqU9Znx3i'),
(86, '104860', 'John', 'Phiri', 'jp104860@students.cavendish.co.zm', 6, 1, 1, 'JOHN2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$TrWPw2c7UiRpa/vw8ELZ6eGSxl8lCzakPYyK09gzeAwd1.m1DCmgO'),
(87, '104861', 'Mary', 'Mwale', 'mm104861@students.cavendish.co.zm', 7, 1, 1, 'MARY2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$q0WS0k1G5qU.CKJQ27QDFen3jEY7f/I/ee1dKIkB9sYUz0HIOecdK'),
(88, '104862', 'James', 'Chilufya', 'jc104862@students.cavendish.co.zm', 8, 1, 1, 'JAMES2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$ANNsCMA7XqSiVJ8/J7jYxOaeNzildrBysLpR98X1MlZhhI/PJHGiy'),
(89, '104863', 'Agness', 'Lungu', 'al104863@students.cavendish.co.zm', 9, 1, 1, 'AGNESS2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$D0lPrcSAt/PuSqeac88B/uhjAtYLzCdtfWHsht6nRA1gFTRBOvQQS'),
(90, '104864', 'Peter', 'Phiri', 'pp104864@students.cavendish.co.zm', 10, 1, 1, 'PETER2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$LK88KB9cGm4wGZqC8hu2.u4S.jC4nLh2jd9xChOgKG9tHQqsrQiUK'),
(91, '104865', 'Alice', 'Kabwe', 'ak104865@students.cavendish.co.zm', 1, 1, 1, 'ALICE2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$WADLj5StCM7P5FJ7MKnTFuYefUpdyrO/6kCG8ClQLyk2GhPkz7CUy'),
(92, '104866', 'Daniel', 'Mwansa', 'dm104866@students.cavendish.co.zm', 2, 1, 1, 'DANIEL2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$vDJ8G4Ce9R8NrUTzJGbzB.ezoaI.4ng/sO9PQxYqGfbK.vCXClvii'),
(93, '104867', 'Faith', 'Phiri', 'fp104867@students.cavendish.co.zm', 3, 1, 1, 'FAITH2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$jXcCCbeUXGRGzco.T0boceUaf9wDBEWyyZxedGs.mOPceZnIWIgMG'),
(94, '104868', 'Victor', 'Mwila', 'vm104868@students.cavendish.co.zm', 4, 1, 1, 'VICTOR2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$Ve9SrtevuGMbrI7F18/g1eRHeVP4fXUB4FjVm2jmrwtHW/ewUK.N.'),
(95, '104869', 'Rebecca', 'Chilenga', 'rc104869@students.cavendish.co.zm', 5, 1, 1, 'REBECCA2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$7ZG5pR5LeWYdshkBDRP.w.OFowTZK6Hb1JqRfPFBJBdqYoHTBSVRG'),
(96, '104870', 'Charles', 'Lungu', 'cl104870@students.cavendish.co.zm', 6, 1, 1, 'CHARLES2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$DK16i1GIfR1VuRmuDquV3epAsueV2TEw1sgx6VIIYdq1QdCmbbsmm'),
(97, '104871', 'Esther', 'Phiri', 'ep104871@students.cavendish.co.zm', 7, 1, 1, 'ESTHER2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$xHraCacwnD1PNa1IrHLYWeBnqhySxPegjjN8p86qJ15jxN83vaIXS'),
(98, '104872', 'Michael', 'Mwansa', 'mm104872@students.cavendish.co.zm', 8, 1, 1, 'MICHAEL2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$KMDpc2uNgkgFiL0o9lpszeVVSJJvUDmT2v3YxOxrLeNBLliJFh4s2'),
(99, '104873', 'Joyce', 'Mwila', 'jm104873@students.cavendish.co.zm', 9, 1, 1, 'JOYCE2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$D5r.FJrkIHd3.YYjh./eF.2ZtwL8mFVAQeBOJAxkXtwUzbHOA1nrS'),
(100, '104874', 'Henry', 'Chilufya', 'hc104874@students.cavendish.co.zm', 10, 1, 1, 'HENRY2025', 'active', '2025-09-17 14:09:52', 'admin', '$2b$12$nIDDuw3ovDvPYldNxWYrTO4y1VnZeBRkiHZ4n4jTV52M9Li2ryq9m');

-- --------------------------------------------------------

--
-- Table structure for table `student_balances`
--

CREATE TABLE `student_balances` (
  `balance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `programme_id` int(11) NOT NULL,
  `year_of_study` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `total_fee` decimal(10,2) NOT NULL,
  `amount_paid` decimal(10,2) DEFAULT 0.00,
  `balance` decimal(10,2) GENERATED ALWAYS AS (`total_fee` - `amount_paid`) STORED,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_balances`
--

INSERT INTO `student_balances` (`balance_id`, `student_id`, `programme_id`, `year_of_study`, `semester`, `total_fee`, `amount_paid`, `last_updated`) VALUES
(4, 1, 1, 1, 1, 10000.00, 0.00, '2025-10-11 08:50:22'),
(5, 2, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(6, 2, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(7, 2, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(8, 2, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(9, 3, 3, 1, 1, 11000.00, 22000.00, '2025-10-11 07:36:11'),
(10, 3, 3, 1, 1, 11000.00, 22000.00, '2025-10-11 07:36:11'),
(11, 3, 3, 1, 1, 11000.00, 22000.00, '2025-10-11 07:36:11'),
(12, 3, 3, 1, 1, 11000.00, 22000.00, '2025-10-11 07:36:11'),
(13, 4, 4, 1, 1, 9000.00, 1000.00, '2025-10-11 08:49:41'),
(14, 4, 4, 1, 1, 9000.00, 1000.00, '2025-10-11 08:49:41'),
(15, 4, 4, 1, 1, 9000.00, 1000.00, '2025-10-11 08:49:41'),
(16, 4, 4, 1, 1, 9000.00, 1000.00, '2025-10-11 08:49:41'),
(17, 5, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(18, 5, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(19, 5, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(20, 5, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(21, 6, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(22, 6, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(23, 6, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(24, 6, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(25, 7, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(26, 7, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(27, 7, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(28, 7, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(29, 8, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(30, 8, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(31, 8, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(32, 8, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(33, 9, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(34, 9, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(35, 9, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(36, 9, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(37, 10, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(38, 10, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(39, 10, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(40, 10, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(41, 11, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(42, 11, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(43, 11, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(44, 11, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(45, 12, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(46, 12, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(47, 12, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(48, 12, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(49, 13, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(50, 13, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(51, 13, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(52, 13, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(53, 14, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(54, 14, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(55, 14, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(56, 14, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(57, 15, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(58, 15, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(59, 15, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(60, 15, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(61, 16, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(62, 16, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(63, 16, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(64, 16, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(65, 17, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(66, 17, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(67, 17, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(68, 17, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(69, 18, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(70, 18, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(71, 18, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(72, 18, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(73, 19, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(74, 19, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(75, 19, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(76, 19, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(77, 20, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(78, 20, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(79, 20, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(80, 20, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(81, 21, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(82, 21, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(83, 21, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(84, 21, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(85, 22, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(86, 22, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(87, 22, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(88, 22, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(89, 23, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(90, 23, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(91, 23, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(92, 23, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(93, 24, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(94, 24, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(95, 24, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(96, 24, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(97, 25, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(98, 25, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(99, 25, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(100, 25, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(101, 26, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(102, 26, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(103, 26, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(104, 26, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(105, 27, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(106, 27, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(107, 27, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(108, 27, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(109, 28, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(110, 28, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(111, 28, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(112, 28, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(113, 29, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(114, 29, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(115, 29, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(116, 29, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(117, 30, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(118, 30, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(119, 30, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(120, 30, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(121, 31, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(122, 31, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(123, 31, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(124, 31, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(125, 32, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(126, 32, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(127, 32, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(128, 32, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(129, 33, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(130, 33, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(131, 33, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(132, 33, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(133, 34, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(134, 34, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(135, 34, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(136, 34, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(137, 35, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(138, 35, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(139, 35, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(140, 35, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(141, 36, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(142, 36, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(143, 36, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(144, 36, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(145, 37, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(146, 37, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(147, 37, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(148, 37, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(149, 38, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(150, 38, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(151, 38, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(152, 38, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(153, 39, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(154, 39, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(155, 39, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(156, 39, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(157, 40, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(158, 40, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(159, 40, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(160, 40, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(161, 41, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(162, 41, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(163, 41, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(164, 41, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(165, 42, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(166, 42, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(167, 42, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(168, 42, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(169, 43, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(170, 43, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(171, 43, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(172, 43, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(173, 44, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(174, 44, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(175, 44, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(176, 44, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(177, 45, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(178, 45, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(179, 45, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(180, 45, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(181, 46, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(182, 46, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(183, 46, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(184, 46, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(185, 47, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(186, 47, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(187, 47, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(188, 47, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(189, 48, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(190, 48, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(191, 48, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(192, 48, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(193, 49, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(194, 49, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(195, 49, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(196, 49, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(197, 50, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(198, 50, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(199, 50, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(200, 50, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(201, 51, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(202, 51, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(203, 51, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(204, 51, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(205, 52, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(206, 52, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(207, 52, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(208, 52, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(209, 53, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(210, 53, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(211, 53, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(212, 53, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(213, 54, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(214, 54, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(215, 54, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(216, 54, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(217, 55, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(218, 55, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(219, 55, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(220, 55, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(221, 56, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(222, 56, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(223, 56, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(224, 56, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(225, 57, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(226, 57, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(227, 57, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(228, 57, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(229, 58, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(230, 58, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(231, 58, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(232, 58, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(233, 59, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(234, 59, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(235, 59, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(236, 59, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(237, 60, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(238, 60, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(239, 60, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(240, 60, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(241, 61, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(242, 61, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(243, 61, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(244, 61, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(245, 62, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(246, 62, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(247, 62, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(248, 62, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(249, 63, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(250, 63, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(251, 63, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(252, 63, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(253, 64, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(254, 64, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(255, 64, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(256, 64, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(257, 65, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(258, 65, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(259, 65, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(260, 65, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(261, 66, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(262, 66, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(263, 66, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(264, 66, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(265, 67, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(266, 67, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(267, 67, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(268, 67, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(269, 68, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(270, 68, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(271, 68, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(272, 68, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(273, 69, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(274, 69, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(275, 69, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(276, 69, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(277, 70, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(278, 70, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(279, 70, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(280, 70, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(281, 71, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(282, 71, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(283, 71, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(284, 71, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(285, 72, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(286, 72, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(287, 72, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(288, 72, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(289, 73, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(290, 73, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(291, 73, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(292, 73, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(293, 74, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(294, 74, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(295, 74, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(296, 74, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(297, 75, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(298, 75, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(299, 75, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(300, 75, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(301, 76, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(302, 76, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(303, 76, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(304, 76, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(305, 77, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(306, 77, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(307, 77, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(308, 77, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(309, 78, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(310, 78, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(311, 78, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(312, 78, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(313, 79, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(314, 79, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(315, 79, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(316, 79, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(317, 80, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(318, 80, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(319, 80, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(320, 80, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(321, 81, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(322, 81, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(323, 81, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(324, 81, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(325, 82, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(326, 82, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(327, 82, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(328, 82, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(329, 83, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(330, 83, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(331, 83, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(332, 83, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(333, 84, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(334, 84, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(335, 84, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(336, 84, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(337, 85, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(338, 85, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(339, 85, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(340, 85, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(341, 86, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(342, 86, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(343, 86, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(344, 86, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(345, 87, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(346, 87, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(347, 87, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(348, 87, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(349, 88, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(350, 88, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(351, 88, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(352, 88, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(353, 89, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(354, 89, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(355, 89, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(356, 89, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(357, 90, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(358, 90, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(359, 90, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(360, 90, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(361, 91, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(362, 91, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(363, 91, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(364, 91, 1, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(365, 92, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(366, 92, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(367, 92, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(368, 92, 2, 1, 1, 12000.00, 0.00, '2025-09-26 10:36:44'),
(369, 93, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(370, 93, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(371, 93, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(372, 93, 3, 1, 1, 11000.00, 0.00, '2025-09-26 10:36:44'),
(373, 94, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(374, 94, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(375, 94, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(376, 94, 4, 1, 1, 9000.00, 0.00, '2025-09-26 10:36:44'),
(377, 95, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(378, 95, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(379, 95, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(380, 95, 5, 1, 1, 9500.00, 0.00, '2025-09-26 10:36:44'),
(381, 96, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(382, 96, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(383, 96, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(384, 96, 6, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(385, 97, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(386, 97, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(387, 97, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(388, 97, 7, 1, 1, 13000.00, 0.00, '2025-09-26 10:36:44'),
(389, 98, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(390, 98, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(391, 98, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(392, 98, 8, 1, 1, 11500.00, 0.00, '2025-09-26 10:36:44'),
(393, 99, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(394, 99, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(395, 99, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(396, 99, 9, 1, 1, 10000.00, 0.00, '2025-09-26 10:36:44'),
(397, 100, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(398, 100, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(399, 100, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44'),
(400, 100, 10, 1, 1, 10500.00, 0.00, '2025-09-26 10:36:44');

--
-- Triggers `student_balances`
--
DELIMITER $$
CREATE TRIGGER `update_clearance_after_balance_update` AFTER UPDATE ON `student_balances` FOR EACH ROW BEGIN
    DECLARE ca1_req DECIMAL(5,2);
    DECLARE ca2_req DECIMAL(5,2);
    DECLARE exam_req DECIMAL(5,2);
    DECLARE percent_paid DECIMAL(5,2);

    -- Get required percentages from fee_schedule
    SELECT required_percentage INTO ca1_req FROM fee_schedule WHERE exam_type = 'CA1';
    SELECT required_percentage INTO ca2_req FROM fee_schedule WHERE exam_type = 'CA2';
    SELECT required_percentage INTO exam_req FROM fee_schedule WHERE exam_type = 'EXAM';

    -- Calculate percentage paid
    SET percent_paid = (NEW.amount_paid / NEW.total_fee) * 100;

    -- Update clearance statuses
    UPDATE clearances
    SET ca1_status  = IF(percent_paid >= ca1_req, 'eligible', 'blocked'),
        ca2_status  = IF(percent_paid >= ca2_req, 'eligible', 'blocked'),
        exam_status = IF(percent_paid >= exam_req, 'eligible', 'blocked'),
        last_checked = NOW()
    WHERE student_id = NEW.student_id
      AND programme_id = NEW.programme_id
      AND year_of_study = NEW.year_of_study
      AND semester = NEW.semester;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `token_keys`
--

CREATE TABLE `token_keys` (
  `key_id` int(11) NOT NULL,
  `key_name` varchar(100) NOT NULL,
  `secret_key` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token_keys`
--

INSERT INTO `token_keys` (`key_id`, `key_name`, `secret_key`, `created_at`, `status`) VALUES
(1, 'default_verification_key', 'Gy2tX0HLL8tYxnrm3OgAj_r8FlmO2pk5_zUS0USPFDQ', '2025-10-09 09:33:32', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `verification_id` int(11) NOT NULL,
  `docket_id` int(11) NOT NULL,
  `scanned_by` int(11) NOT NULL,
  `scanned_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `scan_result` enum('valid','invalid','expired','reprinted','forged') NOT NULL,
  `device_id` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `clearances`
--
ALTER TABLE `clearances`
  ADD PRIMARY KEY (`clearance_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `programme_id` (`programme_id`);

--
-- Indexes for table `clearance_rules`
--
ALTER TABLE `clearance_rules`
  ADD PRIMARY KEY (`rule_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_code` (`course_code`);

--
-- Indexes for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`curriculum_id`),
  ADD KEY `programme_id` (`programme_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `device_registry`
--
ALTER TABLE `device_registry`
  ADD PRIMARY KEY (`device_id`),
  ADD KEY `registered_by` (`registered_by`);

--
-- Indexes for table `dockets`
--
ALTER TABLE `dockets`
  ADD PRIMARY KEY (`docket_id`),
  ADD UNIQUE KEY `qr_code` (`qr_code`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `programme_id` (`programme_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `docket_tokens`
--
ALTER TABLE `docket_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD UNIQUE KEY `token_hash` (`token_hash`),
  ADD UNIQUE KEY `token_hash_2` (`token_hash`),
  ADD KEY `docket_id` (`docket_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `curriculum_id` (`curriculum_id`);

--
-- Indexes for table `fee_schedule`
--
ALTER TABLE `fee_schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `receipt_number` (`receipt_number`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `programmes`
--
ALTER TABLE `programmes`
  ADD PRIMARY KEY (`programme_id`),
  ADD UNIQUE KEY `programme_name` (`programme_name`),
  ADD UNIQUE KEY `programme_code` (`programme_code`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_number` (`student_number`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `student_balances`
--
ALTER TABLE `student_balances`
  ADD PRIMARY KEY (`balance_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `programme_id` (`programme_id`);

--
-- Indexes for table `token_keys`
--
ALTER TABLE `token_keys`
  ADD PRIMARY KEY (`key_id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`verification_id`),
  ADD KEY `docket_id` (`docket_id`),
  ADD KEY `scanned_by` (`scanned_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clearances`
--
ALTER TABLE `clearances`
  MODIFY `clearance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=512;

--
-- AUTO_INCREMENT for table `clearance_rules`
--
ALTER TABLE `clearance_rules`
  MODIFY `rule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `curriculum`
--
ALTER TABLE `curriculum`
  MODIFY `curriculum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;

--
-- AUTO_INCREMENT for table `device_registry`
--
ALTER TABLE `device_registry`
  MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dockets`
--
ALTER TABLE `dockets`
  MODIFY `docket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `docket_tokens`
--
ALTER TABLE `docket_tokens`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `fee_schedule`
--
ALTER TABLE `fee_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `programmes`
--
ALTER TABLE `programmes`
  MODIFY `programme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `student_balances`
--
ALTER TABLE `student_balances`
  MODIFY `balance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=512;

--
-- AUTO_INCREMENT for table `token_keys`
--
ALTER TABLE `token_keys`
  MODIFY `key_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `verification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clearances`
--
ALTER TABLE `clearances`
  ADD CONSTRAINT `clearances_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `clearances_ibfk_2` FOREIGN KEY (`programme_id`) REFERENCES `programmes` (`programme_id`);

--
-- Constraints for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD CONSTRAINT `curriculum_ibfk_1` FOREIGN KEY (`programme_id`) REFERENCES `programmes` (`programme_id`),
  ADD CONSTRAINT `curriculum_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `device_registry`
--
ALTER TABLE `device_registry`
  ADD CONSTRAINT `device_registry_ibfk_1` FOREIGN KEY (`registered_by`) REFERENCES `admins` (`admin_id`);

--
-- Constraints for table `dockets`
--
ALTER TABLE `dockets`
  ADD CONSTRAINT `dockets_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `dockets_ibfk_2` FOREIGN KEY (`programme_id`) REFERENCES `programmes` (`programme_id`),
  ADD CONSTRAINT `dockets_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `docket_tokens`
--
ALTER TABLE `docket_tokens`
  ADD CONSTRAINT `docket_tokens_ibfk_1` FOREIGN KEY (`docket_id`) REFERENCES `dockets` (`docket_id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`curriculum_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `student_balances`
--
ALTER TABLE `student_balances`
  ADD CONSTRAINT `student_balances_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_balances_ibfk_2` FOREIGN KEY (`programme_id`) REFERENCES `programmes` (`programme_id`);

--
-- Constraints for table `verifications`
--
ALTER TABLE `verifications`
  ADD CONSTRAINT `verifications_ibfk_1` FOREIGN KEY (`docket_id`) REFERENCES `dockets` (`docket_id`),
  ADD CONSTRAINT `verifications_ibfk_2` FOREIGN KEY (`scanned_by`) REFERENCES `admins` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
