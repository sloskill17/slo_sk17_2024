-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 07. jun 2024 ob 11.25
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
-- Odloži podatke za tabelo `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `name`, `level`, `status`, `created_at`, `updated_at`) VALUES
(2, 'MOS 2024 Razvoj spletnih strani - Skil 17', 'Celjski sejmi d. o. o., Dečkova cesta 1, Celje 3000, Slovenija', '+386 (0)3 54 33 000', 0, 0, '2024-09-22 10:00:00', '2024-09-22 12:00:00'),
(3, 'MOS 2024 CNC Rezkanje - Skil 7', 'Celjski sejmi d. o. o., Dečkova cesta 1, Celje 3000, Slovenija', '+386 (0)3 54 33 000', 0, 0, '2024-09-18 10:00:00', '2024-09-28 12:00:00'),
(4, 'MOS 2024 Kamnoseštvo - Skil 8', 'Celjski sejmi d. o. o., Dečkova cesta 1, Celje 3000, Slovenija', '+386 (0)3 54 33 000', 0, 0, '2024-09-18 12:00:00', '2024-09-18 14:00:00'),
(5, 'MOS 2024 IKT - Skil 39', 'Celjski sejmi d. o. o., Dečkova cesta 1, Celje 3000, Slovenija', '+386 (0)3 54 33 000', 0, 0, '2024-09-18 14:00:00', '2024-09-18 16:00:00'),
(6, 'MOS 2024 Stežba - Skil 35', 'Celjski sejmi d. o. o., Dečkova cesta 1, Celje 3000, Slovenija', '+386 (0)3 54 33 000', 0, 0, '2024-09-19 10:00:00', '2024-09-19 12:00:00'),
(7, 'MOS 2024 Cvetličarstvo - Skil 28', 'Celjski sejmi d. o. o., Dečkova cesta 1, Celje 3000, Slovenija', '+386 (0)3 54 33 000', 0, 0, '2024-09-19 13:00:00', '2024-09-19 15:00:00'),
(8, 'eva.skarja@podjetje.cx', '8cf21e9be6803b9e0bb9f792462fefafdc290f10697a1ee785c2420099699699', 'Eva škarja', 1, 9, '2024-06-05 02:19:06', '2024-06-05 02:19:06');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
