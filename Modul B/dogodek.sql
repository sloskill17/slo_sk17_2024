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
-- Odloži podatke za tabelo `dogodek`
--

INSERT INTO `dogodek` (`id`, `naziv`, `naslov`, `tel`, `url`, `email`, `datumUra`, `zakljucek`) VALUES
(1, 'MOS - Mednarodni obrtni sejem', 'Celjski sejem, Dečkova 1, Celje', NULL, 'https://ce-sejem.si', NULL, '2024-09-18 07:00:00', NULL),
(2, 'MOS 2024 Razvoj spletnih strani - Skil 17', 'Celjski sejmi d. o. o., Dečkova cesta 1, Celje 3000, Slovenija', '+386 (0)3 54 33 000', 'https://ce-sejem.si', 'info@ce-sejem.si', '2024-09-22 08:00:00', '2024-09-22 10:00:00'),
(3, 'MOS 2024 CNC Rezkanje - Skil 7', 'Celjski sejmi d. o. o., Dečkova cesta 1, Celje 3000, Slovenija', '+386 (0)3 54 33 000', 'https://ce-sejem.si', 'info@ce-sejem.si', '2024-09-18 08:00:00', '2024-09-28 10:00:00'),
(4, 'MOS 2024 Kamnoseštvo - Skil 8', 'Celjski sejmi d. o. o., Dečkova cesta 1, Celje 3000, Slovenija', '+386 (0)3 54 33 000', 'https://ce-sejem.si', 'info@ce-sejem.si', '2024-09-18 10:00:00', '2024-09-18 12:00:00'),
(5, 'MOS 2024 IKT - Skil 39', 'Celjski sejmi d. o. o., Dečkova cesta 1, Celje 3000, Slovenija', '+386 (0)3 54 33 000', 'https://ce-sejem.si', 'info@ce-sejem.si', '2024-09-18 12:00:00', '2024-09-18 14:00:00'),
(6, 'MOS 2024 Stežba - Skil 35', 'Celjski sejmi d. o. o., Dečkova cesta 1, Celje 3000, Slovenija', '+386 (0)3 54 33 000', 'https://ce-sejem.si', 'info@ce-sejem.si', '2024-09-19 08:00:00', '2024-09-19 10:00:00'),
(7, 'MOS 2024 Cvetličarstvo - Skil 28', 'Celjski sejmi d. o. o., Dečkova cesta 1, Celje 3000, Slovenija', '+386 (0)3 54 33 000', 'https://ce-sejem.si', 'info@ce-sejem.si', '2024-09-19 11:00:00', '2024-09-19 13:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
