CREATE DATABASE  IF NOT EXISTS `db_mensageria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_mensageria`;


CREATE TABLE `usuario` (
  `ID_USUARIO` int NOT NULL AUTO_INCREMENT,
  `NOME_USUARIO` varchar(20) NOT NULL,
  `SENHA` varchar(40) NOT NULL,
  `PRIVATE_KEY` blob,
  `PUBLIC_KEY` blob,
  PRIMARY KEY (`ID_USUARIO`),
  UNIQUE KEY `NOME_USUARIO` (`NOME_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `mensagem` (
  `ID_MENSAGEM` int NOT NULL AUTO_INCREMENT,
  `ID_REMETENTE` int NOT NULL,
  `ID_DESTINATARIO` int NOT NULL,
  `MENSAGEM_TITULO` blob NOT NULL,
  `MENSAGEM_CORPO` blob,
  `MENSAGEM_DATA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_MENSAGEM`),
  KEY `FK_ID_REMETENTE` (`ID_REMETENTE`),
  KEY `FK_ID_DESTINATARIO` (`ID_DESTINATARIO`),
  CONSTRAINT `FK_ID_DESTINATARIO` FOREIGN KEY (`ID_DESTINATARIO`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE CASCADE,
  CONSTRAINT `FK_ID_REMETENTE` FOREIGN KEY (`ID_REMETENTE`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
