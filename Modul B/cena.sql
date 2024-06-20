-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 07. jun 2024 ob 11.26
-- Različica strežnika: 10.4.28-MariaDB
-- Različica PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `prireditev`
--

--
-- Odloži podatke za tabelo `cena`
--

INSERT INTO `cena` (`id`, `dogodek_id`, `vrstaOdsek_id`, `znesek`) VALUES
(1, 1, 1, 0.00),
(2, 1, 1, 12.38),
(3, 1, 1, 24.00),
(5, 1, 0, 0.00),
(6, 1, 1, 17.50),
(7, 1, 2, 35.00),
(8, 2, 0, 0.00),
(9, 2, 1, 6.00),
(10, 2, 2, 12.00),
(11, 3, 0, 0.00),
(12, 3, 1, 6.00),
(13, 3, 2, 12.00),
(14, 4, 0, 0.00),
(15, 4, 1, 6.00),
(16, 4, 2, 12.00),
(17, 5, 0, 0.00),
(18, 5, 1, 6.00),
(19, 5, 2, 12.00),
(20, 6, 0, 0.00),
(21, 6, 1, 6.00),
(22, 6, 2, 12.00),
(23, 7, 0, 0.00),
(24, 7, 1, 6.00),
(25, 7, 2, 12.00);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
