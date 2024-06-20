-- SQL Dump
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 07. jun 2024 ob 11.26
-- Različica strežnika: 10.4.28-MariaDB

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

-- --------------------------------------------------------

--
-- Struktura tabele `cena`
--

CREATE TABLE `cena` (
  `id` int(11) NOT NULL,
  `dogodek_id` int(11) NOT NULL,
  `vrstaOdsek_id` int(11) NOT NULL,
  `znesek` decimal(6,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_slovenian_ci;

-- --------------------------------------------------------

--
-- Struktura tabele `dogodek`
--

CREATE TABLE `dogodek` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `naslov` varchar(100) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `datumUra` timestamp NOT NULL DEFAULT current_timestamp(),
  `zakljucek` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_slovenian_ci;

-- --------------------------------------------------------

--
-- Struktura tabele `stranka`
--

CREATE TABLE `stranka` (
  `id` int(11) NOT NULL,
  `ime` varchar(25) NOT NULL,
  `priimek` varchar(35) NOT NULL,
  `email` varchar(35) DEFAULT NULL,
  `davcnaSt` int(8) NOT NULL,
  `ustvarjena` timestamp NOT NULL DEFAULT current_timestamp(),
  `azurirana` timestamp NULL DEFAULT NULL,
  `STATUS` int(11) NOT NULL DEFAULT 0,
  `secret` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_slovenian_ci;

-- --------------------------------------------------------

--
-- Struktura tabele `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_slovenian_ci;

-- --------------------------------------------------------

--
-- Struktura tabele `vstopnica`
--

CREATE TABLE `vstopnica` (
  `id` int(11) NOT NULL,
  `serijskaSt` decimal(14,0) DEFAULT NULL,
  `dogodek_id` int(11) NOT NULL,
  `stranka_id` int(11) NOT NULL,
  `cena_id` int(11) NOT NULL,
  `prodana` timestamp NOT NULL DEFAULT current_timestamp(),
  `prodajalec_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_slovenian_ci;

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `cena`
--
ALTER TABLE `cena`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Cena_dogodek_id` (`dogodek_id`);

--
-- Indeksi tabele `dogodek`
--
ALTER TABLE `dogodek`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `stranka`
--
ALTER TABLE `stranka`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `s_davcnaSt_UNIQUE` (`davcnaSt`),
  ADD UNIQUE KEY `s_email_UNIQUE` (`email`);

--
-- Indeksi tabele `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_email_UNIQUE` (`email`);

--
-- Indeksi tabele `vstopnica`
--
ALTER TABLE `vstopnica`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `v_stankaKarta_UNIQUE` (`dogodek_id`,`stranka_id`),
  ADD UNIQUE KEY `v_serijskaSt_UNIQUE` (`serijskaSt`),
  ADD KEY `fk_Vstopnica_dogodek_id` (`dogodek_id`),
  ADD KEY `fk_Vstopnica_stranka_id` (`stranka_id`),
  ADD KEY `fk_Vstopnica_cena_id` (`cena_id`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `cena`
--
ALTER TABLE `cena`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `dogodek`
--
ALTER TABLE `dogodek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `stranka`
--
ALTER TABLE `stranka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `vstopnica`
--
ALTER TABLE `vstopnica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Omejitve tabel za povzetek stanja
--

--
-- Omejitve za tabelo `cena`
--
ALTER TABLE `cena`
  ADD CONSTRAINT `fk_Cena_dogodek_id` FOREIGN KEY (`dogodek_id`) REFERENCES `dogodek` (`id`);

--
-- Omejitve za tabelo `vstopnica`
--
ALTER TABLE `vstopnica`
  ADD CONSTRAINT `fk_Vstopnica_cena_id` FOREIGN KEY (`cena_id`) REFERENCES `cena` (`id`),
  ADD CONSTRAINT `fk_Vstopnica_dogodek_id` FOREIGN KEY (`dogodek_id`) REFERENCES `dogodek` (`id`),
  ADD CONSTRAINT `fk_Vstopnica_stranka_id` FOREIGN KEY (`stranka_id`) REFERENCES `stranka` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
