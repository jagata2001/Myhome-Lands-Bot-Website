-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 07, 2022 at 03:41 PM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 7.3.11-0ubuntu0.19.10.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lands_bot`
--

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int NOT NULL,
  `link_id` int NOT NULL,
  `link` varchar(512) NOT NULL,
  `scraping_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `insert_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `link_id`, `link`, `scraping_status`, `insert_date`) VALUES
(56254, 11585889, 'https://www.myhome.ge/ka/pr/11585889/iyideba-sasoflo-sameurneo-miwis-nakveTi-ozurgeTis-municipalitetshi-ureki', 'success', '2021-11-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `myhome_users`
--

CREATE TABLE `myhome_users` (
  `id` int NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(512) NOT NULL,
  `phone_number` varchar(9) NOT NULL,
  `posts_quantity` int NOT NULL DEFAULT '0',
  `working` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `myhome_users`
--

INSERT INTO `myhome_users` (`id`, `username`, `password`, `phone_number`, `posts_quantity`, `working`) VALUES
(1, 'falek57034@ngo1.com', '9ebc184d5cd273bfa13d08ea07a882625364b057ce9879c2d22ae9446e60ae286d377d512b6a3f054570aba006fd9da1c82050ba9aaca816b0d579917f009e849d0ebc35903e30f585043d60ec38a9f2b31a674c4ee3104a11cba2eeee5098a294bf59553c1d1923932e8e6d940a08ec3dd82015bfb4f95ee24352da91d97c585fa5ef65319449b9f443f237d41e0c4218bb3d10282a4e090c81d148b4c960b6ce83d8bdfff9be75ac0dcec8cc80317877a4650b8b8002882bb69841c3b0b3551b2ec8158ccf79ccdacab2fa61e205f7411b02fddee4ea23f04de5113f24a31e0b8d22a62685745152bd5dd547468faccf38ceff92812a0ed6eb9fe4156c0dd0', '577607756', 1764, 1),
(3, 'xekomop158@mail2paste.com', '9a886f9869d026ac218cb4b596a727bd26eecbfc8953e7f241df31b6e13060840b16dd52599a3a37f6d0274e4650b08ef69b0d4b8bda1d58ba7c52c6e7b55d81c5894db9f57ab4092d0251b9c4e3228fc66932abe6443b9946df4a19bd0b76ff9c83099c1bdbbc31cb90cd8bded4721aedbff872096dc9cd2fe1e1bc7cc33e29158f67f6e8b2bf462f50f75317565ab2c87f479a93dad1d1dae659f6a649dae7a7b208bb30eec41bb88401e7b8b72e7fbb5c01f4fb6a5d559ec96a82f1b1a43502b1ce513b406a8cb3602ee0e56f4b08a041179a3268928245350420e1ace7a3944f42ad9abada642bbad9469a179acf43716b3da61c6a2bb1589d834669e4fc', '577607756', 1763, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `amount` decimal(7,2) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `amount`, `date`) VALUES
(2, '100.00', '2021-09-16 05:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int NOT NULL,
  `post_id` int DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `post_status` text,
  `user` varchar(256) NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_id`, `post_date`, `post_status`, `user`, `name`, `phone`, `link_id`) VALUES
(3177, 11599695, '2021-09-16 01:54:59', 'success', 'falek57034@ngo1.com', 'Mamuka', '599 180 028', 11585889),
(3288, 11599696, '2021-10-17 01:58:00', 'success', 'falek57034@ngo1.com', 'Mamuka', '599 180 028', 11585889),
(3289, 11599695, '2021-09-16 01:54:59', 'success', 'falek57034@ngo1.com', 'Mamuka', '599 180 028', 11585887),
(3290, 11599696, '2021-10-15 01:58:00', 'success', 'falek57034@ngo1.com', 'Mamuka', '599 180 028', 11585889);

-- --------------------------------------------------------

--
-- Table structure for table `website_users`
--

CREATE TABLE `website_users` (
  `id` int NOT NULL,
  `user` varchar(128) NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `website_users`
--

INSERT INTO `website_users` (`id`, `user`, `password`) VALUES
(1, 'admin', '8450eca01665516d9aeb5317764902b78495502637c96192c81b1683d32d691a0965cf037feca8b9ed9ee6fc6ab8f27fce8f77c4fd9b4a442a00fc317b8237e6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link_id` (`link_id`);

--
-- Indexes for table `myhome_users`
--
ALTER TABLE `myhome_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website_users`
--
ALTER TABLE `website_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161194;

--
-- AUTO_INCREMENT for table `myhome_users`
--
ALTER TABLE `myhome_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3291;

--
-- AUTO_INCREMENT for table `website_users`
--
ALTER TABLE `website_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
