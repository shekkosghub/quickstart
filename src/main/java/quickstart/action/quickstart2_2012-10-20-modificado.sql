# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.37)
# Database: quickstart2
# Generation Time: 2012-10-20 19:28:05 -0500
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table city
# ------------------------------------------------------------

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;

INSERT INTO `city` (`id`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`, `name`)
VALUES
	('MTY',now(),now(),NULL,NULL,'Monterrey');

/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table client_activation_number
# ------------------------------------------------------------



# Dump of table cliente
# ------------------------------------------------------------



# Dump of table cliente_estatus
# ------------------------------------------------------------

LOCK TABLES `cliente_estatus` WRITE;
/*!40000 ALTER TABLE `cliente_estatus` DISABLE KEYS */;

INSERT INTO `cliente_estatus` (`estatus`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`, `descripcion`)
VALUES
	('ACVO',now(),now(),NULL,NULL,'activo'),
	('CRDO',now(),now(),NULL,NULL,'creado');

/*!40000 ALTER TABLE `cliente_estatus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table evento
# ------------------------------------------------------------



# Dump of table Person
# ------------------------------------------------------------



# Dump of table person_type
# ------------------------------------------------------------

LOCK TABLES `person_type` WRITE;
/*!40000 ALTER TABLE `person_type` DISABLE KEYS */;

INSERT INTO `person_type` (`person_type`, `fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`, `definition`)
VALUES
	('F',now(),now(),NULL,NULL,'Female'),
	('I',now(),now(),NULL,NULL,'Moral'),
	('M',now(),now(),NULL,NULL,'Male');

/*!40000 ALTER TABLE `person_type` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `address_type` WRITE;
/*!40000 ALTER TABLE `cliente_estatus` DISABLE KEYS */;

INSERT INTO `address_type` (`fecha_creacion`, `fecha_modificacion`, `creado_por`, `modificado_por`, `name`)
VALUES
	(now(),now(),NULL,NULL,'casa'),
	(now(),now(),NULL,NULL,'trabajo');

/*!40000 ALTER TABLE `cliente_estatus` ENABLE KEYS */;
UNLOCK TABLES;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
