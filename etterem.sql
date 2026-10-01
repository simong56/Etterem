-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 01, 2026 at 09:25 AM
-- Server version: 11.4.12-MariaDB
-- PHP Version: 8.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `etterem`
--
CREATE DATABASE IF NOT EXISTS `etterem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `etterem`;

-- --------------------------------------------------------

--
-- Table structure for table `rendeles`
--

CREATE TABLE `rendeles` (
  `id` int(11) NOT NULL,
  `dish` varchar(40) NOT NULL,
  `description` text NOT NULL,
  `orderTime` datetime NOT NULL DEFAULT current_timestamp(),
  `updateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `vendegId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rendeles`
--

INSERT INTO `rendeles` (`id`, `dish`, `description`, `orderTime`, `updateTime`, `vendegId`) VALUES
(1, 'Gulyásleves', 'Marhahússal, friss kenyérrel. Extrém csípősen!!!!!!!!!', '2026-09-17 12:07:11', '2026-10-01 09:24:55', 1),
(2, 'Csirkepaprikás', 'Nokedlivel és tejföllel, egy adag.', '2026-09-17 18:14:22', '2026-09-17 18:14:22', 2),
(3, 'Censored', 'Censored', '2026-09-18 12:21:33', '2026-09-18 12:21:33', 3),
(4, 'Margherita pizza', 'Paradicsommal, mozzarellával és friss bazsalikommal.', '2026-09-18 18:28:44', '2026-09-18 18:28:44', 4),
(5, 'Cézársaláta', 'Grillezett csirkével, öntet külön kérve.', '2026-09-19 12:35:55', '2026-09-19 12:35:55', 5),
(6, 'Somlói galuska', 'Csokoládéöntettel és tejszínhabbal.', '2026-09-19 18:42:06', '2026-09-19 18:42:06', 6),
(7, 'Halászlé', 'Pontyból, csípős paprika külön tálalva.', '2026-09-20 12:49:17', '2026-09-20 12:49:17', 1),
(8, 'Töltött káposzta', 'Két darab, tejföllel és friss kenyérrel.', '2026-09-20 18:56:28', '2026-09-20 18:56:28', 2),
(9, 'Grillezett lazac', 'Párolt zöldségekkel és citromos mártással.', '2026-09-21 12:03:39', '2026-09-21 12:03:39', 3),
(10, 'Bolognai spagetti', 'Parmezánnal, nagy adag.', '2026-09-21 18:10:50', '2026-09-21 18:10:50', 4),
(11, 'Gombás rizottó', 'Vegetáriánus adag, parmezánnal.', '2026-09-22 12:17:01', '2026-09-22 12:17:01', 5),
(12, 'Túrós palacsinta', 'Két darab, vaníliaöntettel.', '2026-09-22 18:24:12', '2026-09-22 18:24:12', 6),
(13, 'Húsleves', 'Cérnametélttel és főtt zöldségekkel.', '2026-09-23 12:31:23', '2026-09-23 12:31:23', 1),
(14, 'Marhapörkölt', 'Galuskával és savanyú uborkával.', '2026-09-23 18:38:34', '2026-09-23 18:38:34', 2),
(15, 'Kacsacomb', 'Párolt lila káposztával és hagymás burgonyával.', '2026-09-24 12:45:45', '2026-09-24 12:45:45', 3),
(16, 'Carbonara spagetti', 'Szalonnával, tojással és pecorino sajttal.', '2026-09-24 18:52:56', '2026-09-24 18:52:56', 4),
(17, 'Rántott sajt', 'Rizzsel és tartármártással.', '2026-09-25 12:59:07', '2026-09-25 12:59:07', 5),
(18, 'Almás rétes', 'Egy szelet, fahéjas porcukorral.', '2026-09-25 18:06:18', '2026-09-25 18:06:18', 6),
(19, 'Jókai bableves', 'Füstölt hússal és csipetkével.', '2026-09-26 12:13:29', '2026-09-26 12:13:29', 1),
(20, 'Brassói aprópecsenye', 'Pirított burgonyával, fokhagymásan.', '2026-09-26 18:20:40', '2026-09-26 18:20:40', 2),
(21, 'Grillezett csirkemell', 'Édesburgonyával, szósz külön kérve.', '2026-09-27 12:27:51', '2026-09-27 12:27:51', 3),
(22, 'Sonkás pizza', 'Sonkával és gombával, vékony tésztával.', '2026-09-27 18:34:02', '2026-09-27 18:34:02', 4),
(23, 'Zöldséges kuszkusz', 'Sült zöldségekkel, tejtermék nélkül.', '2026-09-28 12:41:13', '2026-09-28 12:41:13', 5),
(24, 'Csokoládétorta', 'Egy szelet, vaníliafagylalttal.', '2026-09-28 18:48:24', '2026-09-28 18:48:24', 6),
(25, 'Paradicsomleves', 'Betűtésztával, egy adag.', '2026-09-29 12:55:35', '2026-09-29 12:55:35', 1),
(26, 'Sertésszűz', 'Burgonyapürével és borsmártással.', '2026-09-29 18:02:46', '2026-09-29 18:02:46', 2),
(27, 'Harcsapaprikás', 'Túrós csuszával, egy adag.', '2026-09-30 12:09:57', '2026-09-30 12:09:57', 3),
(28, 'Hamburger', 'Marhahússal és sült burgonyával, hagyma nélkül.', '2026-09-30 18:16:08', '2026-09-30 18:16:08', 4),
(32, 'Csikken', 'Spar to go', '2026-10-01 09:22:23', '2026-10-01 09:22:23', 3);

-- --------------------------------------------------------

--
-- Table structure for table `vendeg`
--

CREATE TABLE `vendeg` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `registrationTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendeg`
--

INSERT INTO `vendeg` (`id`, `name`, `email`, `age`, `password`, `registrationTime`) VALUES
(1, 'Németh Boglárka', 'nemeth.boglarka@example.com', 27, 'etterem1!', '2025-01-08 18:30:00'),
(2, 'Farkas Ábel', 'farkas.abel@example.com', 31, 'vacsora25', '2025-02-01 19:00:00'),
(3, 'Juhász Emese', 'juhasz.emese@example.com', 24, 'menu2025', '2025-02-19 20:15:00'),
(4, 'Orsós Kende', 'orsos.kende@example.com', 29, 'asztal12', '2025-03-10 17:45:00'),
(5, 'Rácz Hanna', 'racz.hanna@example.com', 26, 'pincer99', '2025-03-27 21:05:00'),
(6, 'Tamás Botond', 'tamas.botond@example.com', 33, 'foglalas7', '2025-04-15 18:50:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rendeles`
--
ALTER TABLE `rendeles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rendeles_vendeg` (`vendegId`);

--
-- Indexes for table `vendeg`
--
ALTER TABLE `vendeg`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rendeles`
--
ALTER TABLE `rendeles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `vendeg`
--
ALTER TABLE `vendeg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rendeles`
--
ALTER TABLE `rendeles`
  ADD CONSTRAINT `fk_rendeles_vendeg` FOREIGN KEY (`vendegId`) REFERENCES `vendeg` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
