-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2020 at 10:20 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `film`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Akcja'),
(2, 'Horror'),
(3, 'Fantasy'),
(4, 'Komedia'),
(5, 'Dramat'),
(6, 'Animacja'),
(7, 'Romans'),
(8, 'Wojenny'),
(9, 'Sci-Fi'),
(10, 'Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`id`, `name`) VALUES
(1, 'Author One'),
(2, 'Director One'),
(3, 'Author Two'),
(4, 'Steven Spielberg'),
(5, 'M. Night Shyamalan'),
(6, 'Olivier Nakache'),
(7, 'Todd Phillips'),
(8, 'Gabriele Muccino'),
(9, 'J. Mackye Gruber'),
(10, 'Clint Eastwood'),
(11, 'Christopher Nolan'),
(12, 'Mark Herman');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `original_title` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `imdb_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `img`, `title`, `original_title`, `year`, `imdb_id`) VALUES
(1, 'assets/img/titanic.jpg', 'Titanic', 'Titanic', '1970', 'tt0120338'),
(2, 'assets/img/avatar.jpg', 'Avatar', 'Avatar', '2012', 'tt0499549'),
(3, 'assets/img/Green.jpg', 'Zielona Mila', 'Green Mile', '1999', NULL),
(4, 'assets/img/odlot.jpg', 'Odlot', 'Up', '2010', NULL),
(5, 'assets/img/forrest.jpg', 'Forrest Gump', 'Forrest Gump', '1994', NULL),
(6, 'assets/img/ryan.jpg', 'Szeregowiec Ryan', 'Saving Private Ryan', '1998', NULL),
(7, 'assets/img/zmysl.jpg', 'Szósty zmysł', 'The Sixth Sense', '1999', NULL),
(8, 'assets/img/untouch.jpg', 'Nietykalni', 'Intouchables', '2011', NULL),
(9, 'assets/img/kac.jpg', 'Kac Vegas', 'The Hangover', '2009', NULL),
(10, 'assets/img/sevenp.jpg', 'Siedem dusz', 'Seven Pounds', '2008', NULL),
(11, 'assets/img/butterfly.jpg', 'Efekt motyla', 'The Butterfly Effect', '2004', NULL),
(12, 'assets/img/grant.jpg', 'Gran Torino', 'Gran Turyn', '2008', NULL),
(13, 'assets/img/darkk.jpg', 'Mroczny Rycerz', 'The Dark Knight', '2008', NULL),
(14, 'assets/img/boys.jpg', 'Chłopiec w pasiastej piżamie', 'The Boy in the Striped Pyjamas', '2008', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `film_category`
--

CREATE TABLE `film_category` (
  `id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `film_category`
--

INSERT INTO `film_category` (`id`, `film_id`, `category_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 5),
(5, 3, 1),
(6, 4, 1),
(7, 4, 6),
(8, 5, 1),
(9, 5, 5),
(10, 5, 7),
(11, 6, 8),
(12, 6, 5),
(15, 7, 5),
(16, 8, 5),
(17, 9, 4),
(18, 10, 5),
(19, 11, 9),
(20, 11, 10),
(21, 12, 5),
(22, 12, 1),
(23, 13, 1),
(24, 13, 9),
(25, 14, 5),
(26, 14, 8);

-- --------------------------------------------------------

--
-- Table structure for table `film_director`
--

CREATE TABLE `film_director` (
  `id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `director_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `film_director`
--

INSERT INTO `film_director` (`id`, `film_id`, `director_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 3),
(4, 3, 2),
(5, 4, 2),
(6, 5, 1),
(7, 6, 4),
(8, 7, 5),
(9, 8, 6),
(10, 9, 7),
(11, 10, 8),
(12, 10, 1),
(13, 11, 9),
(14, 12, 10),
(15, 13, 11),
(16, 14, 12);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`) VALUES
(1, 'year'),
(2, 'category'),
(3, 'title'),
(4, 'director');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `login`, `password`) VALUES
(1, 'test1234', '$argon2i$v=19$m=65536,t=4,p=1$cmp3eE5sS01XblJWbTR5bA$Yk1vMkFjvBM8COH9hSFBdZyDjAZZZjMcNYpPXNxP3zY'),
(2, 'test123', '$argon2i$v=19$m=65536,t=4,p=1$VTd3WFFtZk5IcHZMQmQxVQ$hB08nBU8vPR3jwx6siFg8bBZExCwboF04mUIw+PM1FY');

-- --------------------------------------------------------

--
-- Table structure for table `user_permission`
--

CREATE TABLE `user_permission` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_permission`
--

INSERT INTO `user_permission` (`id`, `user_id`, `permission_id`) VALUES
(12, 2, 1),
(13, 2, 2),
(14, 2, 3),
(15, 2, 4),
(115, 1, 1),
(116, 1, 2),
(117, 1, 3),
(118, 1, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `film_category`
--
ALTER TABLE `film_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film_category_film` (`film_id`),
  ADD KEY `film_category_category` (`category_id`);

--
-- Indexes for table `film_director`
--
ALTER TABLE `film_director`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film_director_film` (`film_id`),
  ADD KEY `film_director_director` (`director_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permission`
--
ALTER TABLE `user_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_permission` (`user_id`),
  ADD KEY `permission_user` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `director`
--
ALTER TABLE `director`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `film_category`
--
ALTER TABLE `film_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `film_director`
--
ALTER TABLE `film_director`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_permission`
--
ALTER TABLE `user_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `film_category`
--
ALTER TABLE `film_category`
  ADD CONSTRAINT `film_category_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `film_category_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `film_director`
--
ALTER TABLE `film_director`
  ADD CONSTRAINT `film_director_director` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `film_director_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_permission`
--
ALTER TABLE `user_permission`
  ADD CONSTRAINT `permission_user` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_permission` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
