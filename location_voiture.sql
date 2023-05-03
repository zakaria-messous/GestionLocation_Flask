-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 03 mai 2023 à 19:08
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `location_voiture`
--

-- --------------------------------------------------------

--
-- Structure de la table `car`
--

CREATE TABLE `car` (
  `id_car` int(11) NOT NULL,
  `marque` varchar(40) NOT NULL,
  `model` varchar(5) NOT NULL,
  `type_carburant` varchar(20) NOT NULL,
  `nombre_place` varchar(2) NOT NULL,
  `transmission` varchar(20) NOT NULL,
  `prix_location` varchar(6) NOT NULL,
  `disponibilite` tinyint(1) NOT NULL DEFAULT 1,
  `matricule` varchar(20) NOT NULL,
  `car_image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `car`
--

INSERT INTO `car` (`id_car`, `marque`, `model`, `type_carburant`, `nombre_place`, `transmission`, `prix_location`, `disponibilite`, `matricule`, `car_image`) VALUES
(19, 'Bently Ghost', '2022', 'Essance', '4', 'Automatic', '2000', 1, '11111 B 11', 'C:\\Users\\iouad\\Documents\\GitHub\\Python_PFA\\FlaskMarket\\images\\bently.png'),
(20, 'Audi A7', '2021', 'Essance', '4', 'Manuel', '1500', 1, '25442 B 26', 'C:\\Users\\iouad\\Documents\\GitHub\\Python_PFA\\FlaskMarket\\images\\audi.jpg'),
(21, 'Lamborgini Verron', '2023', 'Essance', '2', 'Automatic', '2500', 1, '55555 B 23', 'C:\\Users\\iouad\\Documents\\GitHub\\Python_PFA\\FlaskMarket\\images\\black_lambo.png'),
(22, 'Audi Sport', '2023', 'Essance', '2', 'Automatic', '2700', 1, '25442 B 26', 'C:\\Users\\iouad\\Documents\\GitHub\\Python_PFA\\FlaskMarket\\images\\red_audi.png'),
(23, 'Mercedes G-Wagon', '2021', 'Gasoil', '4', 'Manuel', '1800', 1, '99999 B 26', 'C:\\Users\\iouad\\Documents\\GitHub\\Python_PFA\\FlaskMarket\\images\\mercedes_wagon.png'),
(24, 'Lamborgini Verron', '2022', 'Essance', '2', 'Automatic', '1800', 1, '25442 B 26', 'C:\\Users\\iouad\\Documents\\GitHub\\Python_PFA\\FlaskMarket\\images\\yellow_lambo.png'),
(25, 'Mercedes Class', '2022', 'Gasoil', '2', 'Automatic', '2000', 1, '22222 B 22', 'C:\\Users\\iouad\\Documents\\GitHub\\Python_PFA\\FlaskMarket\\images\\mercedes_black.png'),
(26, 'Ferrari G7', '2023', 'Essance', '2', 'Automatic', '2500', 1, '11111 B 11', 'C:\\Users\\iouad\\Documents\\GitHub\\Python_PFA\\FlaskMarket\\images\\red_ferari.png'),
(27, 'BMW X8', '2022', 'Gasoil', '4', 'Manuel', '1800', 1, '22222 B 22', 'C:\\Users\\iouad\\Documents\\GitHub\\Python_PFA\\FlaskMarket\\images\\bmw.png'),
(29, 'Porshe Panamera', '2021', 'Gasoil', '2', 'Manuel', '1500', 1, '77777 A 77', 'C:\\Users\\iouad\\Documents\\GitHub\\Python_PFA\\FlaskMarket\\images\\white_porshe.png');

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE `contrat` (
  `id_paiment` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `mail` varchar(30) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `pays` varchar(30) NOT NULL,
  `ville` varchar(30) NOT NULL,
  `zip` int(7) NOT NULL,
  `rental_charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id_paiment`, `nom`, `prenom`, `start_date`, `finish_date`, `mail`, `adresse`, `pays`, `ville`, `zip`, `rental_charge`, `payment_method`) VALUES
(1, '0', 'OUADEIH', '2023-04-23', '2023-04-23', 'larb.ouadieh^@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'United States', 'California', 40010, '0.00', ''),
(2, '0', 'OUADEIH', '2023-04-24', '2023-05-05', 'larbi.ouaieh@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'United States', 'California', 40010, '0.00', ''),
(3, '0', 'Ameksa', '2023-04-23', '2023-04-26', 'larbi.ouieh@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'United States', 'California', 40010, '0.00', ''),
(4, '0', 'OUADEIH', '2023-04-20', '2023-05-06', 'larbi.oueh^@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'United States', 'California', 40010, '0.00', ''),
(5, '0', 'OUADEIH', '2023-04-24', '2023-06-03', 'dieh@gmail.com', 'RES ALAOUI IMM A LOT df333s', 'United States', 'California', 10, '0.00', ''),
(6, '0', 'OUADEIH', '2023-04-24', '2023-06-03', 'dieh@gmail.com', 'RES ALAOUI IMM A LOT df333s', 'United States', 'California', 10, '0.00', ''),
(7, 'ahmed', 'OUADEIH', '2023-04-24', '2023-06-03', 'dieh@gmail.com', 'RES ALAOUI IMM A LOT df333s', 'United States', 'California', 10, '0.00', ''),
(8, 'OUADEIH', 'Larbi', '2023-04-27', '2023-05-07', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'maroc', 'MARRAKECH', 40010, '0.00', ''),
(9, 'mohamed', 'amekdasa', '2023-04-27', '2023-05-05', 'simooo@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon', 'MARRAKECH', 40010, '0.00', ''),
(10, 'mohamed', 'amekdasa', '2023-04-27', '2023-05-05', 'simooo@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon', 'MARRAKECH', 40010, '0.00', ''),
(11, 'OUADEIH', 'Larbi', '2023-05-04', '2023-05-05', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon', 'MARRAKECH', 40010, '0.00', ''),
(12, 'OUADEIH', 'Larbi', '2023-05-04', '2023-05-05', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon', 'MARRAKECH', 40010, '0.00', ''),
(13, 'OUADEIH', 'Larbi', '2023-05-04', '2023-05-07', 'smaiidil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'maroc', 'MARRAKECH', 40010, '0.00', ''),
(14, 'OUADEIH', 'Larbi', '2023-05-04', '2023-05-07', 'smaiidil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'maroc', 'MARRAKECH', 40010, '0.00', ''),
(15, 'OUADEIH', 'Larbi', '2023-04-29', '2023-05-06', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon qsdf', 'MARRAKECH', 40010, '0.00', ''),
(16, 'OUADEIH', 'Larbi', '2023-04-29', '2023-05-03', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'France*', 'MARRAKECH', 40010, '0.00', ''),
(17, 'OUADEIH', 'Larbi', '2023-04-29', '2023-05-05', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabonbeeee', 'MARRAKECH', 40010, '0.00', ''),
(18, 'OUADEIH', 'Larbi', '2023-05-05', '2023-04-25', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'maroc', 'MARRAKECH', 40010, '0.00', ''),
(19, 'OUADEIH', 'Larbi', '2023-05-01', '2023-05-05', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'maroc', 'MARRAKECH', 40010, '0.00', ''),
(20, 'OUADEIH', 'Larbi', '2023-05-01', '2023-06-09', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'maroc', 'MARRAKECH', 40010, '0.00', ''),
(21, 'OUADEIH', 'Larbi', '2023-05-02', '2023-05-05', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'maroc', 'MARRAKECH', 40010, '0.00', ''),
(22, 'OUADEIH', 'Larbi', '2023-05-02', '2023-05-13', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon', 'MARRAKECH', 40010, '0.00', ''),
(23, 'OUADEIH', 'Larbi', '2023-05-03', '2023-05-06', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'maroc', 'MARRAKECH', 40010, '0.00', ''),
(24, 'OUADEIH', 'Larbi', '2023-05-10', '2023-05-26', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'France*', 'MARRAKECH', 40010, '0.00', ''),
(25, 'OUADEIH', 'Larbi', '2023-05-10', '2023-05-26', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'France*s', 'MARRAKECH', 40010, '0.00', ''),
(26, 'OUADEIH', 'Larbi', '2023-05-10', '2023-05-26', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'France*sfss', 'MARRAKECH', 40010, '0.00', ''),
(27, 'OUADEIH', 'Larbi', '2023-05-02', '2023-05-18', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'marocdddd', 'MARRAKECH', 40010, '0.00', ''),
(28, 'OUADEIHSDFSDF', 'mohamed', '2023-05-02', '2023-05-26', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon qsdf', 'MARRAKECH', 40010, '0.00', ''),
(29, 'OUADEIH', 'sdfsdf', '2023-05-02', '2023-05-26', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'maroc', 'MARRAKECH', 40010, '0.00', ''),
(30, 'OUADEIH', 'sdfsdf', '2023-05-02', '2023-05-18', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'sdf', 'MARRAKECH', 40010, '0.00', ''),
(31, 'OUADEIH', 'qsdqsd', '2023-05-09', '2023-05-11', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon', 'MARRAKECH', 40010, '0.00', ''),
(32, 'OUADEIH', 'Larbi', '2023-05-02', '2023-05-18', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'maroc', 'MARRAKECH', 40010, '0.00', ''),
(33, 'OUADEIH', 'sdfi', '2023-05-02', '2023-05-19', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'France*sff', 'MARRAKECH', 40010, '0.00', ''),
(34, 'OUADEIH', 'Larbi', '2023-05-03', '2023-06-01', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'SDF', 'MARRAKECH', 40010, '0.00', ''),
(35, 'OUADEIH', 'Larbi', '2023-05-02', '2023-05-18', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'maroc', 'MARRAKECH', 40010, '0.00', ''),
(36, 'sdfsdf', 'Larbi', '2023-05-02', '2023-05-25', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon', 'MARRAKECH', 40010, '0.00', ''),
(37, 'sdfsdf', 'Larbi', '2023-05-02', '2023-05-25', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon', 'MARRAKECH', 40010, '0.00', ''),
(38, 'sdfsdf', 'Larbi', '2023-05-02', '2023-05-25', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon', 'MARRAKECH', 40010, '0.00', ''),
(39, 'sdfsdf', 'Larbi', '2023-05-02', '2023-05-25', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon', 'MARRAKECH', 40010, '0.00', ''),
(40, 'OUADEIHddd', 'Larbi', '2023-05-02', '2023-05-18', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon', 'MARRAKECH', 40010, '0.00', ''),
(41, 'OUADEIH', 'Larbi', '2023-05-09', '2023-06-01', 'smaiiil@gmail.com', 'RES ALAOUI IMM A LOT BOUIZGARNE', 'Gabon', 'MARRAKECH', 40010, '0.00', ''),
(42, 'simp', 'simpoa', '2023-05-03', '2023-05-18', 'simpa@gmail.com', 'RES ALAOUI Ipsqoduif ', 'Gabonbeeee', 'MARRAKECH', 40010, '0.00', '');

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE `login` (
  `id_login` int(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`id_login`, `username`, `mail`, `password`) VALUES
(1, 'fff', 'larbi.ouaieh@gmail.com', 'qsdqsd'),
(2, 'lar01', 'larbi.ouaieh@gmail.com', 'mlkmlk'),
(3, 'lar01', 'larbi.ouaieh@gmail.com', 'sdfsdf'),
(4, 'lar01', 'larbi.ouaieh@gmail.com', 'dfgdfg'),
(5, 'fss', 'larbi.ouaiedh@gmail.com', 'sdfsdf'),
(6, 'fss', 'larbi.oduaieh@gmail.com', 'sdfsdf'),
(7, 'fdd', 'smaiiil@gmail.com', 'qsdqsd'),
(8, 'mohamed', 'smaiddiil@gmail.com', 'sdfsdf'),
(9, 'ffsdf', 'smaiidil@gmail.com', 'sdfsdf'),
(10, 'fssdff', 'sdmaiiil@gmail.com', 'sdfsdf'),
(11, 'fssetdg', 'smaifffiil@gmail.com', 'qsdqsd'),
(12, 'fssdd', 'smaissiil@gmail.com', 'qsdqsd'),
(13, 'admin', 'admin@admin.com', 'admin'),
(14, 'simp', 'simp@gmail.com', 'qsdfqsdf'),
(15, 'amine', 'amùne.ouadeih@gmail.com', 'qsdfqsdf'),
(16, 'amina', 'amine.ouadeih@gmail.com', 'sdfsdf');

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `nom_carte` varchar(50) NOT NULL,
  `numero_carte` varchar(16) NOT NULL,
  `expiration` date NOT NULL,
  `cvv` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`id`, `nom_carte`, `numero_carte`, `expiration`, `cvv`) VALUES
(1, 'dfcsdf', '23232323', '0000-00-00', '232'),
(2, 'SOIEJND D ', '213234213', '0000-00-00', '122'),
(3, 'dfgf', '3242', '0000-00-00', '234'),
(4, 'SDF', '123', '0000-00-00', '123'),
(5, 'SDF', '123', '0000-00-00', '123'),
(6, 'SDF', '123', '0000-00-00', '123'),
(7, 'sdfd sdf', '12', '2023-05-04', '4'),
(8, 'ameksa mohgamd', '1532154865153216', '2023-05-07', '123'),
(9, 'ameksa mohgamd', '1532154865153216', '2023-05-07', '12'),
(10, 'qsdfd', '343', '2023-04-27', '3'),
(11, 'qsdfd', '23343', '2023-04-27', '3'),
(12, 'sdfsdf', '234', '2023-05-03', '3'),
(13, 'sdfsdf', '234', '2023-05-03', '3'),
(14, 'qsdf qsdfq ', '34123123', '2023-05-04', '212'),
(15, 'larbi ouadeih', '15232659856', '2023-05-06', '231'),
(16, 'tyuu gyu', '123486543568', '2023-05-05', '513'),
(17, 'dsfsdf', '1523512025', '2023-05-05', '234'),
(18, 'sdq', '123', '2023-05-04', '123'),
(19, 'sdf', '234', '2023-05-04', '133'),
(20, 'sdf', '123', '2023-06-07', '123'),
(21, 'sdf', '123', '2023-05-10', '123'),
(22, 'sdf', '123', '2023-05-19', '123'),
(23, 'sdf', '123', '2023-06-08', '123'),
(24, 'sdf', '123', '2023-06-08', '123'),
(25, 'sdf', '123', '2023-06-08', '123'),
(26, 'sdf', '123', '2023-05-18', '123'),
(27, 'sdf', '123', '2023-05-18', '123'),
(28, 'dsf', '123', '2023-06-08', '123'),
(29, 'sdf', '1111111111111111', '2023-05-10', '112'),
(30, 'sdf', '123', '2023-05-03', '123'),
(31, 'sdf', '123', '2023-05-17', '123'),
(32, 'sdf', '123', '2023-05-10', '123'),
(33, 'ERT', '345', '2023-05-04', '345'),
(34, 'sdf', '123', '2023-05-10', '456'),
(35, 'dfgh', '123', '2023-05-18', '132');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `CIN` varchar(10) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `phone` int(10) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `nom`, `prenom`, `CIN`, `adresse`, `phone`, `mail`, `password`) VALUES
(1, 'Larbi', 'OUADEIH', 'ee504012', 'RES ALAOUI IMM A LOT BOUIZGARNE', 2147483647, 'larbi.ouadieh^@gmail.com', 'qsdfqsdf'),
(6, 'Larbi', 'OUADEIH', 'eed504012d', 'RES ALAOUI IMM A LOT BOUIZGARNE', 680165637, 'larbi.ouadieh@gmail.com', 'sqdfqsdf'),
(7, 'Larbi', 'OUADEIH', 'ee504012f', 'RES ALAOUI IMM A LOT BOUIZGARNE', 68016563, 'larbi.ouadi^@gmail.com', 'sdfsdfsdf'),
(9, 'Larbi', 'OUADEIH', 'ee504', 'RES ALAOUI IMM A LOT BOUIZGARNE', 680165677, 'larb.ouadieh^@gmail.com', 'qsdfdf');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id_car`);

--
-- Index pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD PRIMARY KEY (`id_paiment`);

--
-- Index pour la table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `CIN` (`CIN`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `car`
--
ALTER TABLE `car`
  MODIFY `id_car` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `contrat`
--
ALTER TABLE `contrat`
  MODIFY `id_paiment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
