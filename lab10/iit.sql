-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 16, 2024 at 12:29 AM
-- Server version: 10.6.16-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iit`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `actorid` int(10) UNSIGNED NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`actorid`, `firstName`, `lastName`, `dob`) VALUES
(1, 'Timothee', 'Chalamet', '1995-12-27'),
(2, 'Finn', 'Wolfhard', '2002-12-23'),
(3, 'Adam', 'Sandler', '1966-09-09'),
(4, 'Michael', 'Jordan', '1987-02-09'),
(5, 'Will', 'Smith', '1968-09-25'),
(6, 'Ian', 'Somerhalder', '1978-12-08'),
(7, 'Meryl', 'Streep', '1949-06-22'),
(8, 'Harrison', 'Ford', '1942-07-13'),
(9, 'Jack', 'Nicholson', '1937-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `actor_movie_relationship`
--

CREATE TABLE `actor_movie_relationship` (
  `actorid` int(10) UNSIGNED NOT NULL,
  `movieid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actor_movie_relationship`
--

INSERT INTO `actor_movie_relationship` (`actorid`, `movieid`) VALUES
(2, 1),
(2, 2),
(3, 2),
(4, 3),
(4, 4),
(5, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movieid` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `year` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movieid`, `title`, `year`) VALUES
(1, 'Elizabeth', '1998'),
(2, 'Black Widow', '2021'),
(3, 'Oh Brother Where Art Thou?', '2000'),
(4, 'The Lord of the Rings: The Fellowship of the Ring', '2001'),
(5, 'Up in the Air', '2009');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`actorid`);

--
-- Indexes for table `actor_movie_relationship`
--
ALTER TABLE `actor_movie_relationship`
  ADD PRIMARY KEY (`actorid`,`movieid`),
  ADD KEY `movieid` (`movieid`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `actorid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actor_movie_relationship`
--
ALTER TABLE `actor_movie_relationship`
  ADD CONSTRAINT `actor_movie_relationship_ibfk_1` FOREIGN KEY (`actorid`) REFERENCES `actors` (`actorid`),
  ADD CONSTRAINT `actor_movie_relationship_ibfk_2` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
