# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.37)
# Database: quickstart2
# Generation Time: 2012-11-03 12:38:41 -0600
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `modificado_por` varchar(255) DEFAULT NULL,
  `street_and_number` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `suburb` varchar(255) DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `idaddress_type` int(11) DEFAULT NULL,
  `idcity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBB979BF4BA4EFC10` (`idaddress_type`),
  KEY `FKBB979BF4CB40532F` (`idcity`),
  KEY `FKBB979BF49B8860FB` (`idcliente`),
  CONSTRAINT `FKBB979BF49B8860FB` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FKBB979BF4BA4EFC10` FOREIGN KEY (`idaddress_type`) REFERENCES `address_type` (`id`),
  CONSTRAINT `FKBB979BF4CB40532F` FOREIGN KEY (`idcity`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;

INSERT INTO `address` (`id`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`, `street_and_number`, `zip_code`, `suburb`, `idcliente`, `idaddress_type`, `idcity`)
VALUES
	(1,'2012-11-03 11:23:13','2012-11-03 11:23:13',NULL,NULL,'prueba',NULL,NULL,6,NULL,'MTY'),
	(2,'2012-11-03 11:37:47','2012-11-03 11:37:47',NULL,NULL,'prueba',NULL,NULL,7,NULL,'CDMX');

/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table address_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `address_type`;

CREATE TABLE `address_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `modificado_por` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `address_type` WRITE;
/*!40000 ALTER TABLE `address_type` DISABLE KEYS */;

INSERT INTO `address_type` (`id`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`, `name`)
VALUES
	(1,'2012-10-21 12:01:32','2012-10-21 12:01:32',NULL,NULL,'casa'),
	(2,'2012-10-21 12:01:32','2012-10-21 12:01:32',NULL,NULL,'trabajo');

/*!40000 ALTER TABLE `address_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` varchar(255) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `modificado_por` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `idstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2E996B9E9673E9` (`idstate`),
  CONSTRAINT `FK2E996B9E9673E9` FOREIGN KEY (`idstate`) REFERENCES `state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;

INSERT INTO `city` (`id`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`, `name`, `idstate`)
VALUES
	('CDMX','2012-10-21 12:01:30','2012-10-21 12:01:30',NULL,NULL,'Ciudad de Mexico',2),
	('GUAD','2012-10-21 12:01:30','2012-10-21 12:01:30',NULL,NULL,'Guadalupe',1),
	('MTY','2012-10-21 12:01:30','2012-10-21 12:01:30',NULL,NULL,'Monterrey',1),
	('TOL','2012-10-21 12:01:30','2012-10-21 12:01:30',NULL,NULL,'Toluca',2);

/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table client_activation_number
# ------------------------------------------------------------

DROP TABLE IF EXISTS `client_activation_number`;

CREATE TABLE `client_activation_number` (
  `activation_number` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `modificado_por` varchar(255) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`activation_number`),
  KEY `FK8D6FB31E435D997` (`id`),
  CONSTRAINT `FK8D6FB31E435D997` FOREIGN KEY (`id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table cliente
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `modificado_por` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasenia` varchar(255) DEFAULT NULL,
  `fecha_activacion` date DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `person_type` varchar(255) DEFAULT NULL,
  `estatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`),
  KEY `FK334B85FABDF97851` (`person_type`),
  KEY `FK334B85FA3D7D6912` (`estatus`),
  CONSTRAINT `FK334B85FA3D7D6912` FOREIGN KEY (`estatus`) REFERENCES `cliente_estatus` (`estatus`),
  CONSTRAINT `FK334B85FABDF97851` FOREIGN KEY (`person_type`) REFERENCES `person_type` (`person_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;

INSERT INTO `cliente` (`id`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`, `nombre`, `apellido_paterno`, `apellido_materno`, `correo`, `contrasenia`, `fecha_activacion`, `birth_date`, `person_type`, `estatus`)
VALUES
	(1,'2012-11-02 17:10:42','2012-11-02 17:10:42',NULL,NULL,'Yeyo','Segura','Gomez','yeyo123','asumecha2',NULL,NULL,'M','ACVO'),
	(2,'2012-11-02 17:17:26','2012-11-02 17:17:26',NULL,NULL,'ailu','ASA','EFRSC','alilu999@hotmail.com','kkkkkkas',NULL,NULL,'F','ACVO'),
	(3,'2012-11-02 17:21:52','2012-11-02 17:21:52',NULL,NULL,'tezt','AAWA','MMJN','tezt@jotmail.com','omdjcmdkm',NULL,NULL,'F','ACVO'),
	(4,'2012-11-02 17:24:39','2012-11-02 17:24:39',NULL,NULL,'ppppo','Perez','Perez','ppppo@jotmail.com','opopoqwqw',NULL,NULL,'I','ACVO'),
	(5,'2012-11-03 11:12:27','2012-11-03 11:12:27',NULL,NULL,'Samuel','Adams','','samadam@hotmail.com','azufrecarniz',NULL,NULL,'M','ACVO'),
	(6,'2012-11-03 11:23:13','2012-11-03 11:23:13',NULL,NULL,'Achiles','Davendorn','','nosoyasesino@hotmail.com','soyasesinojojojo',NULL,NULL,'M','ACVO'),
	(7,'2012-11-03 11:37:47','2012-11-03 11:37:47',NULL,NULL,'Bruce','Wayne','','batman@jotmeil.com','nosoybatman',NULL,NULL,'M','ACVO');

/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cliente_estatus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cliente_estatus`;

CREATE TABLE `cliente_estatus` (
  `estatus` varchar(255) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `modificado_por` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `cliente_estatus` WRITE;
/*!40000 ALTER TABLE `cliente_estatus` DISABLE KEYS */;

INSERT INTO `cliente_estatus` (`estatus`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`, `descripcion`)
VALUES
	('ACVO','2012-10-21 12:01:30','2012-10-21 12:01:30',NULL,NULL,'activo'),
	('CRDO','2012-10-21 12:01:30','2012-10-21 12:01:30',NULL,NULL,'creado');

/*!40000 ALTER TABLE `cliente_estatus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table evento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `evento`;

CREATE TABLE `evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `modificado_por` varchar(255) DEFAULT NULL,
  `titulo` varchar(140) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `imagen` blob,
  `idcliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB307E1159B8860FB` (`idcliente`),
  CONSTRAINT `FKB307E1159B8860FB` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Person
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Person`;

CREATE TABLE `Person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table person_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `person_type`;

CREATE TABLE `person_type` (
  `person_type` varchar(255) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `modificado_por` varchar(255) DEFAULT NULL,
  `definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `person_type` WRITE;
/*!40000 ALTER TABLE `person_type` DISABLE KEYS */;

INSERT INTO `person_type` (`person_type`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`, `definition`)
VALUES
	('F','2012-10-21 12:01:30','2012-10-21 12:01:30',NULL,NULL,'Female'),
	('I','2012-10-21 12:01:30','2012-10-21 12:01:30',NULL,NULL,'Moral'),
	('M','2012-10-21 12:01:30','2012-10-21 12:01:30',NULL,NULL,'Male');

/*!40000 ALTER TABLE `person_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `modificado_por` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;

INSERT INTO `state` (`id`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`, `name`)
VALUES
	(1,'2012-10-21 12:01:30','2012-10-21 12:01:30',NULL,NULL,'Nuevo Leon'),
	(2,'2012-10-21 12:01:30','2012-10-21 12:01:30',NULL,NULL,'Estado de Mexico');

/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
