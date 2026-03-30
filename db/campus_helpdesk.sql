-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 27 Mars 2026 à 08:07
-- Version du serveur :  5.7.11
-- Version de PHP :  7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `campus_helpdesk`
--

CREATE DATABASE IF NOT EXISTS campus_helpdesk;
USE campus_helpdesk;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `auteur_id` int(11) NOT NULL,
  `contenu` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `messages`
--

INSERT INTO `messages` (`id`, `ticket_id`, `auteur_id`, `contenu`, `created_at`) VALUES
(1, 1, 2, 'fdhjghghf', '2026-02-27 17:35:24'),
(2, 1, 2, 'fini', '2026-02-28 10:23:43'),
(3, 4, 2, 'Donnez moi le nom de la dernière mise à jour de ton pc.', '2026-02-28 10:35:24'),
(4, 4, 2, 'Donnez moi le nom de la dernière mise à jour de ton pc.', '2026-02-28 10:35:37'),
(5, 5, 2, 'non', '2026-02-28 11:04:32'),
(6, 8, 2, 'rtèijhgry(è-_iukjhgyt-è_ouij;,ghytè-iujh,nhfyrè_iukhgjhu_uolhj;,gjftu', '2026-03-06 19:20:30'),
(7, 9, 2, 'rod_it,fudx,ufdxufkxiufxkdifuxkdifuxfixuflrifufdjrlikfudrftigdrutgdrolifkgudjflitducfjgldcokgujdroçitk,g', '2026-03-08 20:03:47');

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `titre` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `categorie` varchar(50) NOT NULL,
  `priorite` enum('FAIBLE','MOYENNE','ELEVEE') NOT NULL,
  `statut` enum('OPEN','IN_PROGRESS','RESOLVED','CLOSED') NOT NULL DEFAULT 'OPEN',
  `auteur_id` int(11) NOT NULL,
  `technicien_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tickets`
--

INSERT INTO `tickets` (`id`, `titre`, `description`, `categorie`, `priorite`, `statut`, `auteur_id`, `technicien_id`, `created_at`, `updated_at`) VALUES
(1, 'premier ticket', 'test', 'MATERIEL', 'FAIBLE', 'RESOLVED', 1, NULL, '2026-02-27 16:43:09', '2026-02-28 10:23:38'),
(2, 'ticket 2', 'test', 'MATERIEL', 'MOYENNE', 'OPEN', 1, NULL, '2026-02-27 17:17:52', NULL),
(3, 'ticket 3', 'test 3', 'RESEAU', 'MOYENNE', 'OPEN', 1, NULL, '2026-02-27 17:39:45', NULL),
(4, 'plus de wifi', 'Depuis que mon pc a fait la dernière mise à jour du réseau je n\'ai plus internet.', 'RESEAU', 'MOYENNE', 'IN_PROGRESS', 1, NULL, '2026-02-28 10:34:29', '2026-02-28 10:34:58'),
(5, 'ticket 4', 'Plus d\'écran', 'MATERIEL', 'MOYENNE', 'CLOSED', 1, 2, '2026-02-28 10:59:58', '2026-02-28 11:04:25'),
(6, 'blablu', 'pc marche pas', 'MATERIEL', 'FAIBLE', 'OPEN', 1, NULL, '2026-03-06 12:07:30', NULL),
(7, 'blablu', 'pc marche pas', 'MATERIEL', 'FAIBLE', 'IN_PROGRESS', 1, 2, '2026-03-06 12:22:02', '2026-03-06 14:07:15'),
(8, '(-_-iujhg-(', '-èujhgt(-èuyt', 'LOGICIEL', 'ELEVEE', 'IN_PROGRESS', 1, 2, '2026-03-06 18:48:02', '2026-03-06 18:48:18'),
(9, 'wiwi pas content', 'pc marche plus', 'LOGICIEL', 'ELEVEE', 'IN_PROGRESS', 4, 2, '2026-03-06 19:44:33', '2026-03-08 20:03:30');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mdp_hash` varchar(255) NOT NULL,
  `role` enum('ETUDIANT','TECH','ADMIN') NOT NULL,
  `actif` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `email`, `mdp_hash`, `role`, `actif`) VALUES
(1, 'Etudiant', 'student@campus.local', '$2y$10$XrA7INoytJGsteDhPpN6fObg3NxSg7XX1XWxvRh2FZjJg6FJk8Bn6', 'ETUDIANT', 1),
(2, 'Tech', 'tech@campus.local', '$2y$10$cziRZmMGIY6zQ1MmD4bLNOBg33yjQJZbx5vfKsjCUETFXPgtgqqpa', 'TECH', 1),
(3, 'Admin', 'admin@campus.local', '$2y$10$S3oGcJSqiz2snUZ/NU8Au.dTOrc6Oo5TtG5ZKIvlx/pKT04NrFTMS', 'ADMIN', 1),
(4, 'Wiwi', 'nouveauetudient@test.com', '$2y$10$9veBUi9R6vpnazqhdsoh4OuyJm8z.mM6uWHUTi53jEZ90fEjjFR3u', 'ETUDIANT', 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `auteur_id` (`auteur_id`);

--
-- Index pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auteur_id` (`auteur_id`),
  ADD KEY `technicien_id` (`technicien_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`auteur_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`auteur_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`technicien_id`) REFERENCES `utilisateurs` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
