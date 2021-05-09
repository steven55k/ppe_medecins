-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 09 mai 2021 à 16:46
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ppe_medic`
--

-- --------------------------------------------------------

--
-- Structure de la table `authentification`
--

CREATE TABLE `authentification` (
  `token` varchar(70) NOT NULL,
  `idPatient` int(5) DEFAULT NULL,
  `ipAppareil` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `authentification`
--

INSERT INTO `authentification` (`token`, `idPatient`, `ipAppareil`) VALUES
('28f18839e3c24aea5ce75743f30feb4df6bce5e035a425a80dc4e78d3b9a', 43, '172.18.204.2'),
('b72be25795098a06335f9fd2cdf367f0291720a566a641b33afa37e51b8c', 43, '172.18.204.4');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `idPatient` int(11) NOT NULL,
  `nomPatient` varchar(50) NOT NULL,
  `prenomPatient` varchar(50) NOT NULL,
  `ruePatient` varchar(100) NOT NULL,
  `cpPatient` varchar(6) NOT NULL,
  `villePatient` varchar(50) NOT NULL,
  `telPatient` varchar(15) NOT NULL,
  `loginPatient` varchar(50) NOT NULL,
  `mdpPatient` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`idPatient`, `nomPatient`, `prenomPatient`, `ruePatient`, `cpPatient`, `villePatient`, `telPatient`, `loginPatient`, `mdpPatient`) VALUES
(43, 'Chevalot', 'Lucas', '15 rue du gué', '55000', 'Bar le duc', '0648789090', 'lchevalot', '$2y$10$kTlQBkvEjWEbjPWwJFOdEOb7f470oEArQDFRnu5KojShHCPdk6L9C'),
(46, 'Oster', 'Steven', 'aaa bbb cccc', '55 000', 'Bar Le Duc', '0011223344', 'steven', '$2y$10$Xyrjhv5WGMqWkCUFmKxJu.CNlmRBQXrhEOz6tqAp/McZFKD5ok6y.');

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

CREATE TABLE `rdv` (
  `idRdv` int(11) NOT NULL,
  `dateHeureRdv` datetime NOT NULL,
  `idPatient` int(5) NOT NULL,
  `idMedecin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `authentification`
--
ALTER TABLE `authentification`
  ADD PRIMARY KEY (`token`),
  ADD KEY `idPatient` (`idPatient`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`idPatient`);

--
-- Index pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD PRIMARY KEY (`idRdv`),
  ADD KEY `idPatient` (`idPatient`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `idPatient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `rdv`
--
ALTER TABLE `rdv`
  MODIFY `idRdv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `authentification`
--
ALTER TABLE `authentification`
  ADD CONSTRAINT `authentification_ibfk_1` FOREIGN KEY (`idPatient`) REFERENCES `patient` (`idPatient`);

--
-- Contraintes pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD CONSTRAINT `rdv_ibfk_1` FOREIGN KEY (`idPatient`) REFERENCES `patient` (`idPatient`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
