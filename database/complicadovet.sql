-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.3.28-MariaDB-1:10.3.28+maria~focal - mariadb.org binary distribution
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para complicadovet
CREATE DATABASE IF NOT EXISTS `complicadovet` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `complicadovet`;

-- Copiando estrutura para tabela complicadovet.animais
CREATE TABLE IF NOT EXISTS `animais` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) unsigned NOT NULL,
  `especie_id` int(11) unsigned NOT NULL,
  `raca_id` int(11) unsigned NOT NULL,
  `nome` varchar(255) NOT NULL,
  `nascimento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_animais_especies_id` (`especie_id`),
  KEY `FK_animais_pessoas_id` (`pessoa_id`),
  KEY `FK_animais_racas_id` (`raca_id`),
  CONSTRAINT `FK_animais_especies_id` FOREIGN KEY (`especie_id`) REFERENCES `especies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_animais_pessoas_id` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_animais_racas_id` FOREIGN KEY (`raca_id`) REFERENCES `racas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela complicadovet.animais: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `animais` DISABLE KEYS */;
/*!40000 ALTER TABLE `animais` ENABLE KEYS */;

-- Copiando estrutura para tabela complicadovet.Animal
CREATE TABLE IF NOT EXISTS `Animal` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Raca` varchar(255) DEFAULT NULL,
  `Especie` varchar(255) DEFAULT NULL,
  `HistoricoClinico` text DEFAULT NULL,
  `Nascimento` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048;

-- Copiando dados para a tabela complicadovet.Animal: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `Animal` DISABLE KEYS */;
INSERT INTO `Animal` (`Id`, `IdCliente`, `Nome`, `Raca`, `Especie`, `HistoricoClinico`, `Nascimento`) VALUES
	(1, 1, 'Miúdo', 'Pincher', 'Canina', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In urna lacus, vulputate ac erat non, tempus egestas enim. Quisque et velit venenatis lectus gravida sodales vitae at erat. Sed risus augue, eleifend eu quam eu, lobortis vestibulum felis. Mauris in eros iaculis, pulvinar eros non, interdum sem. Maecenas et purus euismod, feugiat ligula vel, malesuada lectus. Duis euismod interdum ipsum, dapibus tempus tellus ultricies non. Nullam sit amet malesuada ligula, lacinia rhoncus elit. Nam sit amet ultrices ex, eu mollis orci. Mauris in sapien lacinia, accumsan dui ut, imperdiet erat. Suspendisse eu dui dui. Mauris nec libero neque.\r\n\r\nNunc mauris ante, lacinia vel volutpat id, pulvinar id diam. Aliquam erat volutpat. Aliquam placerat egestas elit et pharetra. Ut blandit ligula ut arcu euismod, et accumsan lectus porttitor. Morbi eu dui eu tellus vulputate egestas in vel lectus. Sed ultrices orci mi, id eleifend sapien aliquet et. Aenean non tellus dictum, sollicitudin dui quis, congue nunc. Aliquam lorem tortor, finibus non nisi quis, lacinia sollicitudin est. Sed non arcu non lacus cursus mattis. Praesent a magna nibh. Aliquam vitae tincidunt quam. Sed feugiat pulvinar auctor. Duis fringilla purus elit, sed rutrum sem tincidunt ac. Nunc lobortis sodales tellus, at lacinia ante lacinia a.\r\n', '15/06/2015'),
	(2, 1, 'Toddy', 'Siamês', 'Felino', '----', '12/03/0216'),
	(3, 1, 'Mickey', 'SRD', 'Canina', 'Achado na rua', NULL),
	(4, 3, 'Tobby', 'SRD', 'Canina', 'Sem registro', '24/08/2013'),
	(5, 2, 'Sucesso', 'York', 'Canina', 'Phasellus congue tempus lorem, a luctus felis ultricies eget. Duis non vulputate elit. Curabitur eleifend arcu lacus, dictum pellentesque nisi aliquam vitae. Nam a felis ultrices urna volutpat imperdiet sed non urna. Suspendisse ullamcorper consectetur tristique. Sed fringilla sed arcu pretium posuere. Suspendisse vel pellentesque mauris, eget vulputate est. Fusce fringilla nisi ut turpis lobortis, sed viverra arcu sagittis. Praesent pharetra varius elit, et rhoncus justo mollis a. In rhoncus massa quam, et ultricies mauris placerat ut.\r\n\r\nNulla accumsan tempus arcu, a vehicula mauris efficitur at. Sed facilisis pretium urna, rutrum ultrices nisi eleifend et. Cras in lorem dictum, rhoncus ex non, volutpat dolor. Aenean pharetra at diam id ornare. Duis vel feugiat felis, in ornare orci. Aliquam at felis nec sapien ornare venenatis. Sed sodales mollis consequat. Quisque elit mi, pharetra at magna vel, cursus facilisis nunc. Proin in imperdiet mauris. Sed vulputate nibh eget facilisis porttitor. Donec vitae pretium felis. Mauris ullamcorper vestibulum augue, eu molestie metus cursus dictum. Cras mollis aliquam nulla at molestie. Donec urna elit, placerat vel sapien nec, dictum bibendum libero. Quisque quam eros, convallis sit amet lorem et, semper blandit nisi.\r\n\r\nFusce semper nisi at consequat porttitor. Nunc faucibus lacus felis, sit amet imperdiet elit rhoncus id. Nullam sed erat ipsum. Maecenas tempor leo nec massa commodo pretium. Proin rutrum justo nulla, sed scelerisque felis malesuada nec. Nulla porta arcu vel risus bibendum bibendum. Aenean vestibulum risus neque, quis mollis ligula bibendum id. Morbi sodales eleifend nisl at ullamcorper. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse ultrices mi in nulla porttitor, sagittis ultricies nulla pellentesque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam sem justo, laoreet ut est vel, semper rhoncus lacus. Vestibulum quis tincidunt elit.', '22/09/2013'),
	(6, 3, 'GG', 'Labrador', 'Canina', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In urna lacus, vulputate ac erat non, tempus egestas enim. Quisque et velit venenatis lectus gravida sodales vitae at erat. Sed risus augue, eleifend eu quam eu, lobortis vestibulum felis. Mauris in eros iaculis, pulvinar eros non, interdum sem. Maecenas et purus euismod, feugiat ligula vel, malesuada lectus. Duis euismod interdum ipsum, dapibus tempus tellus ultricies non. Nullam sit amet malesuada ligula, lacinia rhoncus elit. Nam sit amet ultrices ex, eu mollis orci. Mauris in sapien lacinia, accumsan dui ut, imperdiet erat. Suspendisse eu dui dui. Mauris nec libero neque.\r\nFusce semper nisi at consequat porttitor. Nunc faucibus lacus felis, sit amet imperdiet elit rhoncus id. Nullam sed erat ipsum. Maecenas tempor leo nec massa commodo pretium. Proin rutrum justo nulla, sed scelerisque felis malesuada nec. Nulla porta arcu vel risus bibendum bibendum. Aenean vestibulum risus neque, quis mollis ligula bibendum id. Morbi sodales eleifend nisl at ullamcorper. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse ultrices mi in nulla porttitor, sagittis ultricies nulla pellentesque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam sem justo, laoreet ut est vel, semper rhoncus lacus. Vestibulum quis tincidunt elit.', NULL),
	(7, 4, 'Kit', 'Angorá', 'Felino', 'Nulla accumsan tempus arcu, a vehicula mauris efficitur at. Sed facilisis pretium urna, rutrum ultrices nisi eleifend et. Cras in lorem dictum, rhoncus ex non, volutpat dolor. Aenean pharetra at diam id ornare. Duis vel feugiat felis, in ornare orci. Aliquam at felis nec sapien ornare venenatis. Sed sodales mollis consequat. Quisque elit mi, pharetra at magna vel, cursus facilisis nunc. Proin in imperdiet mauris. Sed vulputate nibh eget facilisis porttitor. Donec vitae pretium felis. Mauris ullamcorper vestibulum augue, eu molestie metus cursus dictum. Cras mollis aliquam nulla at molestie. Donec urna elit, placerat vel sapien nec, dictum bibendum libero. Quisque quam eros, convallis sit amet lorem et, semper blandit nisi.', '2020-03-22'),
	(8, 8, 'Rex', 'SRD', 'Canina', 'Suspendisse vel pellentesque mauris, eget vulputate est. Fusce fringilla nisi ut turpis lobortis, sed viverra arcu sagittis. Praesent pharetra varius elit, et rhoncus justo mollis a. In rhoncus massa quam, et ultricies mauris placerat ut.\r\n\r\nNulla accumsan tempus arcu, a vehicula mauris efficitur at. Sed facilisis pretium urna, rutrum ultrices nisi eleifend et. Cras in lorem dictum, rhoncus ex non, volutpat dolor. Aenean pharetra at diam id ornare. Duis vel feugiat felis, in ornare orci. Aliquam at felis nec sapien ornare venenatis. Sed sodales mollis consequat. Quisque elit mi, pharetra at magna vel, cursus facilisis nunc. Proin in imperdiet mauris. Sed vulputate nibh eget facilisis porttitor. Donec vitae pretium felis. Mauris ullamcorper vestibulum augue, eu molestie metus cursus dictum. Cras mollis aliquam nulla at molestie. Donec urna elit, placerat vel sapien nec, dictum bibendum libero. Quisque quam eros, convallis sit amet lorem et, semper blandit nisi.\r\n\r\nFusce semper nisi at consequat porttitor. Nunc faucibus lacus felis, sit amet imperdiet elit rhoncus id. Nullam sed erat ipsum. Maecenas tempor leo nec massa commodo pretium. Proin rutrum justo nulla, sed scelerisque felis malesuada nec. Nulla porta arcu vel risus bibendum bibendum. Aenean vestibulum risus neque, quis mollis ligula bibendum id. Morbi sodales eleifend nisl at ullamcorper. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse ultrices mi in nulla porttitor, sagittis ultricies nulla pellentesque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam sem justo, laoreet ut est vel, semper rhoncus lacus. Vestibulum quis tincidunt elit.', NULL);
/*!40000 ALTER TABLE `Animal` ENABLE KEYS */;

-- Copiando estrutura para tabela complicadovet.Cliente
CREATE TABLE IF NOT EXISTS `Cliente` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) DEFAULT NULL,
  `Telefone1` varchar(255) DEFAULT NULL,
  `Telefone2` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276;

-- Copiando dados para a tabela complicadovet.Cliente: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` (`Id`, `Nome`, `Telefone1`, `Telefone2`, `Email`) VALUES
	(1, 'Caio Castro', '11 87875546', '11 99857-4561', 'caio@castro.com'),
	(2, 'Anitta', '(21) 99236-9870', NULL, 'ani@ttaom'),
	(3, 'Ariana Grande', '11 986501287', NULL, 'ariana@big.com'),
	(4, 'Raul Gil', '21 98757-9188', '21 3201-2050', 'raulgil@record.com.br'),
	(5, 'Lincoln Sena', '(71)', '(71) 99336-8898', NULL);
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela complicadovet.contatos
CREATE TABLE IF NOT EXISTS `contatos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) unsigned NOT NULL,
  `tipo` enum('celular','fixo','email') NOT NULL,
  `contato` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_contatos_pessoas_id` (`pessoa_id`),
  CONSTRAINT `FK_contatos_pessoas_id` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela complicadovet.contatos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `contatos` DISABLE KEYS */;
/*!40000 ALTER TABLE `contatos` ENABLE KEYS */;

-- Copiando estrutura para tabela complicadovet.especies
CREATE TABLE IF NOT EXISTS `especies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela complicadovet.especies: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `especies` DISABLE KEYS */;
/*!40000 ALTER TABLE `especies` ENABLE KEYS */;

-- Copiando estrutura para tabela complicadovet.pessoas
CREATE TABLE IF NOT EXISTS `pessoas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela complicadovet.pessoas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;

-- Copiando estrutura para tabela complicadovet.racas
CREATE TABLE IF NOT EXISTS `racas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `especie_id` int(11) unsigned NOT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_racas_especies_id` (`especie_id`),
  CONSTRAINT `FK_racas_especies_id` FOREIGN KEY (`especie_id`) REFERENCES `especies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela complicadovet.racas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `racas` DISABLE KEYS */;
/*!40000 ALTER TABLE `racas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
