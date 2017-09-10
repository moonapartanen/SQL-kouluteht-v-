-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 10.09.2017 klo 18:40
-- Palvelimen versio: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koneet`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `huoltohistoria`
--

CREATE TABLE `huoltohistoria` (
  `ID` int(11) NOT NULL,
  `KONE_ID` int(11) NOT NULL,
  `KUVAUS` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `huoltohistoria`
--

INSERT INTO `huoltohistoria` (`ID`, `KONE_ID`, `KUVAUS`) VALUES
(1, 3, 'Konetta huollettu, koska oli rikki'),
(2, 3, 'Koneeseen tehty peruskorjaus'),
(3, 3, 'Huollettiin, koska oli mäsänä'),
(4, 2, 'Oli rikki, niin piti huoltoukkelin korjata');

-- --------------------------------------------------------

--
-- Rakenne taululle `koneet`
--

CREATE TABLE `koneet` (
  `ID` int(11) NOT NULL,
  `NIMI` varchar(50) NOT NULL,
  `KUVAUS` varchar(50) NOT NULL,
  `LUONTIPVM` date NOT NULL,
  `KONETYYPPI_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `koneet`
--

INSERT INTO `koneet` (`ID`, `NIMI`, `KUVAUS`, `LUONTIPVM`, `KONETYYPPI_ID`) VALUES
(2, 'Ruohonleikkuri', 'Kone, joka leikkaa nurmikkoa', '2017-09-07', 2),
(3, 'Kaivinkone', 'Kone, jolla voi kaivaa kuoppia', '2017-09-28', 3),
(4, 'Porakone', 'Kone, jolla voi porata ruuvia', '2017-09-30', 4),
(5, 'Nurmenajelukone', 'Tällä koneella leikataan nurmea', '2017-09-10', 2),
(12, 'dgfssgsgfsgfg', 'sfgfgfdgs', '2017-09-20', 2),
(13, 'dgfssgsgfsgfg', 'sfgfgfdgs', '2017-09-20', 2),
(14, 'dgfssgsgfsgfg', 'sfgfgfdgs', '2017-09-20', 2);

-- --------------------------------------------------------

--
-- Rakenne taululle `konetyypit`
--

CREATE TABLE `konetyypit` (
  `ID` int(11) NOT NULL,
  `LYHENNE` varchar(50) NOT NULL,
  `KUVAUS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `konetyypit`
--

INSERT INTO `konetyypit` (`ID`, `LYHENNE`, `KUVAUS`) VALUES
(2, 'RHNL', 'Ihan normaali ruohonleikkuri'),
(3, 'KVNK', 'Tavallinen kaivinkone'),
(4, 'PRKN', 'Tavallinen porakone'),
(5, 'KTJR', 'Normaali katujyrä');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `huoltohistoria`
--
ALTER TABLE `huoltohistoria`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `KONE_ID` (`KONE_ID`),
  ADD KEY `KONE_ID_2` (`KONE_ID`);

--
-- Indexes for table `koneet`
--
ALTER TABLE `koneet`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `KONETYYPPI_ID` (`KONETYYPPI_ID`);

--
-- Indexes for table `konetyypit`
--
ALTER TABLE `konetyypit`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `huoltohistoria`
--
ALTER TABLE `huoltohistoria`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `koneet`
--
ALTER TABLE `koneet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `konetyypit`
--
ALTER TABLE `konetyypit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `huoltohistoria`
--
ALTER TABLE `huoltohistoria`
  ADD CONSTRAINT `huoltohistoria_ibfk_1` FOREIGN KEY (`KONE_ID`) REFERENCES `koneet` (`ID`);

--
-- Rajoitteet taululle `koneet`
--
ALTER TABLE `koneet`
  ADD CONSTRAINT `koneet_ibfk_1` FOREIGN KEY (`KONETYYPPI_ID`) REFERENCES `konetyypit` (`ID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
