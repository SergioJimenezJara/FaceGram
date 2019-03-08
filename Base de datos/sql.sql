CREATE DATABASE  IF NOT EXISTS `facegram` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `facegram`;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ;

CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_usuario` bit(1) DEFAULT NULL,
  `tipo_contenido` bit(1) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `imagen` longblob,
  `texto` text,
  PRIMARY KEY (`id`)
);

CREATE TABLE `amigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_1` int(11) DEFAULT NULL,
  `id_usuario_2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario_1` (`id_usuario_1`),
  KEY `id_usuario_2` (`id_usuario_2`),
  CONSTRAINT `amigo_ibfk_1` FOREIGN KEY (`id_usuario_1`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `amigo_ibfk_2` FOREIGN KEY (`id_usuario_2`) REFERENCES `usuario` (`id_usuario`)
);



CREATE TABLE `grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `grupo_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


