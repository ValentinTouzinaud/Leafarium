-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 06 mars 2023 à 18:10
-- Version du serveur : 5.7.36
-- Version de PHP : 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `plante`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(1, 'arbre'),
(2, 'plante'),
(3, 'bambou');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C7440455F85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `username`, `roles`, `password`) VALUES
(1, 'adminLeVrai', '[\"ROLE_ADMIN\"]', '$2y$13$buwr7Zw5zChYnNcpuRNCaOghgVGJvqvB.ahFa6S8Dcx6zoGaZa9SW');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220510140936', '2022-05-10 14:09:41', 550),
('DoctrineMigrations\\Version20220511151932', '2022-05-11 15:19:48', 1302),
('DoctrineMigrations\\Version20221110093607', '2022-11-10 09:36:27', 1102),
('DoctrineMigrations\\Version20230223173409', '2023-02-23 17:34:26', 961),
('DoctrineMigrations\\Version20230223173658', '2023-02-23 17:37:07', 690);

-- --------------------------------------------------------

--
-- Structure de la table `plante`
--

DROP TABLE IF EXISTS `plante`;
CREATE TABLE IF NOT EXISTS `plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2550) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `visible` tinyint(1) NOT NULL,
  `nom_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_flo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_symb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_taille` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_517A6947BCF5E72D` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `plante`
--

INSERT INTO `plante` (`id`, `nom`, `description`, `categorie_id`, `image`, `image2`, `updated_at`, `visible`, `nom_image`, `desc_image`, `desc_flo`, `desc_symb`, `desc_taille`) VALUES
(1, 'L’érable du canada', 'L’érable est célèbre pour sa feuille qui est l’emblème du Canada. Certaines espèces sont connues et généralement utilisées pour produire du sirop d’érable, notamment au Canada et aux États-Unis. D’autres espèces sont plutôt destinées à la menuiserie ou à l’ornementation.', 1, 'erablePetit.png', 'erableDetail.png', '2022-05-12 14:22:14', 1, 'L\'érable du Canada', 'Espèce commune d\'arbre au Canada', 'Fin d’hiver et début de printemps.', 'La feuille d’érable est évidemment le symbole du Canada et sa fleur symbolise le sens de l’observation et la réserve.', 'La taille d’un érable du canada peut atteindre entre trois à huit mètres de hauteur.'),
(2, 'Le bouleau', 'Le bouleau est un genre composé généralement d’arbres connus pour leur ravissante écorce blanche, très faciles à cultiver. Ces derniers poussent presque partout et se retrouve généralement dans les forêts de France.', 1, 'bouleauPetit.png', 'bouleauDetail.png', '2022-05-12 14:25:11', 1, 'Le bouleau de France\n', 'Espèce commune en France', 'Il n’y a pas forcément de temps mois de floraison pour le bouleau.', 'Dans le langage des fleurs, le bouleau symbolise la résignation, la force, la sagesse, la douceur, la distinction, la protection et le nouveau départ.', 'Le bouleau n’est pas très large mais sa hauteur moyenne est de 10 à 15 mètre et peut atteindre jusqu’à 25 mètres de haut.'),
(3, 'Le sapin', 'Le sapin est un genre de plantes vivaces, au feuillage persistant de la famille des Pinaceae. Originaire des régions tempérées de l’hémisphère nord, le sapin pousse partout dans le monde dans les régions tempérées ou froides.', 1, 'sapinPetit.png', 'sapinDetail.png', '2022-05-10 14:36:41', 1, 'Le sapin', 'Espèce commune d\'arbre en montagne', 'Généralement, le sapin fleurit au printemps.', 'Il est le symbole du renouveau de la vie dans le thème traditionnel païen.', 'La taille de celui-ci dépend de son éspèce, mais en général, le sapin atteint une hauteur de 25 mètres.'),
(4, 'Le pin', 'Le pin est un arbre de la famille des Pinaceae. Ils ont des feuilles en aiguilles regroupées par 2, 3 ou 5 et forment des fruits du nom de « pomme de pin ». C’est le plus vaste genre de conifères et beaucoup de ses espèces sont des essences d’arbres forestiers importantes.', 1, 'pinPetit.png', 'pinDetail.png', '2022-05-12 14:23:38', 1, 'Le pin', 'Espèce commune d\'arbre', 'Il fleurit entre Mars et Mai.', 'Les pins symbolisent au Moyen-Orient la vie éternelle', 'Le pin mesure environ 15 mètres de haut et peut avoir une hauteur maximale de 25 mètres.'),
(5, 'Le bambou', 'Le bambou est de la famille des graminées, plus précisément des poacées. On recense environ 80 genres et plus de 1300 espèces. Il est un emblème culte de la culture chinoise mais également celle de la nourriture favorite du panda.', 3, 'bambouPetit.png', 'bambouDetail.png', NULL, 1, 'Le bambou', 'Espèce de plante monocotylédones', 'La floraison du bambou est un événement rare, qui ne se produit souvent qu\'à intervalle de plusieurs décennies.', 'Les bambous ont une symbolique surtout attribuée à l’amitié.', 'Il mesure entre 1 à 9 mètres de hauteur. La taille de celui-ci dépend de son environnement ainsi que de son espèce.'),
(6, 'Le chêne de Hongrie', 'Le chêne de Hongrie est un éspèce qui ressemble énormement à celui de France. Il n’a pas spécialement de particularité mis à part le fait qu’il ne fait pas pousser un nombre excessif de gland.', 1, 'chenePetit.png', 'cheneDetail.png', NULL, 1, 'Le chêne de Hongrie', 'Espèce d\'abre de Hongrie', 'Il fleurit principalement au début du printemps.', 'il est l\'arbre sacré et spirituel possédant un esprit très puissant de régénération et d\'immortalité.', 'Le chêne mesure environ 15 mètres de hauteur et sa largeur dépend de son âge car celui-ci peut vivre entre 200 à 1500 ans.'),
(7, 'Le cerisier', 'Le cerisier est un arbre cultivé pour son fruit la cerise. Il fait partie de la famille des Rosacées. Il est l’un des arbres les plus emblématiques de la culture japonaise. Il fait également parti des arbres les plus beau sur cette planète', 1, 'cerisierPetit.png', 'cerisierDetail.png', NULL, 1, 'Le cerisier', 'Espèce d\'arbre du Japon', 'Le cerisier fleurit fin Mars début Avril. Son processus ne dure pas plus de 15 jours.', 'il est l\'arbre sacré et spirituel possédant un esprit très puissant de régénération et d\'immortalité.', 'Il mesure  entre 5 à 8 mètres de hauteur pour une largeur de 2 à 3 mètres maximum.'),
(8, 'La glycine', 'Ce sont des plantes ligneuses et grimpantes à feuilles composées pennées caduques et à fleurs papilionacées, dont certaines espèces sont appelées « glycines ». Certaines d\'entre elles sont cultivées comme plantes ornementales en raison de leurs grappes de fleurs printanières et de leur épais feuillage.', 2, 'glycinePetit.png', 'glycineDetail.png', NULL, 1, 'La glycine', 'Espèce de plante peu commune', 'La floraison de la glycine se fait généralement durant la période Avril - Juin.', 'Dans le langage des fleurs, la glycine symbolise la tendresse et l\'amitié.', 'La taille de la glycine dépend de la saison. En hiver, elle atteint une taille de 10cm tandis que durant l’été, celle-ci mesure 30cm.'),
(9, 'Le lupin', 'Le lupins, est un genre de plantes dicotylédones de la famille des Fabaceae, sous-famille des Faboideae, originaire des régions tempérées de l\'Ancien Monde et du Nouveau Monde, qui regroupe plus de 600 espèces acceptées.', 2, 'lupinPetit.png', 'lupinDetail.png', '2022-05-10 14:39:31', 1, 'Le lupin', 'Espèce de plante dicotylédone', 'Il fleurit durant les beaux jours du printemps ainsi que durant l’été.', 'Le lupin est le symbole de l’imagination et du besoin de calme.', 'Cette plante mesure 30 centimètres et peut atteindre une hauteur de 2 mètres.');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `plante_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_42C84955177B16E8` (`plante_id`),
  KEY `IDX_42C8495519EB6921` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `plante`
--
ALTER TABLE `plante`
  ADD CONSTRAINT `FK_517A6947BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C84955177B16E8` FOREIGN KEY (`plante_id`) REFERENCES `plante` (`id`),
  ADD CONSTRAINT `FK_42C8495519EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
