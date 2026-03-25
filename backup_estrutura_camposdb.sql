-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: camposdb
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `qryPesquisaCampos`
--

DROP TABLE IF EXISTS `qryPesquisaCampos`;
/*!50001 DROP VIEW IF EXISTS `qryPesquisaCampos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `qryPesquisaCampos` AS SELECT 
 1 AS `ID`,
 1 AS `Escopo`,
 1 AS `Locador`,
 1 AS `Tipo_Negociacao`,
 1 AS `inicio`,
 1 AS `Termino`,
 1 AS `Status_Fly`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tblCampos`
--

DROP TABLE IF EXISTS `tblCampos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblCampos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Escopo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Proximo_Contato` datetime DEFAULT NULL,
  `Sigla` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Hora` datetime DEFAULT NULL,
  `Locador_Contato` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Historico` text COLLATE utf8mb4_unicode_ci,
  `SAP` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tipo_Negociacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Movimentacao` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Inicio` datetime DEFAULT NULL,
  `Termino` datetime DEFAULT NULL,
  `Intervalo_Dias` int DEFAULT NULL,
  `Fly_Conecta` tinyint(1) DEFAULT '0',
  `Solicitacao_QA` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Data_Envio_QA` datetime DEFAULT NULL,
  `Data_Devolucao_QA` datetime DEFAULT NULL,
  `No_Consultivo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Data_Envio_Consultivo` datetime DEFAULT NULL,
  `Data_Retorno_Consultivo` datetime DEFAULT NULL,
  `Data_Parametrizacao` datetime DEFAULT NULL,
  `Parametrizado_em` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Assinado_em` datetime DEFAULT NULL,
  `Origem` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Enviado_Cadastro` tinyint(1) DEFAULT '0',
  `Evolucao` text COLLATE utf8mb4_unicode_ci,
  `Telefones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Locador` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CPF` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CNPJ` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Anotacoes` text COLLATE utf8mb4_unicode_ci,
  `Midia` longblob,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `idx_locador` (`Locador`),
  KEY `idx_tipo_neg` (`Tipo_Negociacao`),
  KEY `idx_status` (`Fly_Conecta`,`Enviado_Cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCampos`
--

LOCK TABLES `tblCampos` WRITE;
/*!40000 ALTER TABLE `tblCampos` DISABLE KEYS */;
INSERT INTO `tblCampos` VALUES (1,'Exemplo Escopo','2026-03-30 14:00:00','ABC',NULL,'João Silva','Histórico detalhado do contato...','SAP12345','Negociação Inicial',NULL,'2026-03-23 09:00:00','2026-03-23 11:00:00',7,1,'Solicitação pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'João Silva LTDA','123.456.789-00','12.345.678/0001-99','Contato realizado com sucesso',NULL,'2026-03-23 11:52:40','2026-03-23 11:53:43'),(2,'Exemplo Escopo','2026-03-30 10:00:00','ABC',NULL,'João Silva','Histórico detalhado do contato...','SAP12345','Negociação Inicial',NULL,'2026-03-23 09:00:00','2026-03-23 11:00:00',7,0,'Solicitação pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'João Silva LTDA','123.456.789-00','12.345.678/0001-99','Anotações adicionais aqui...',NULL,'2026-03-23 11:53:16','2026-03-23 11:53:16'),(3,'Exemplo Escopo','2026-03-30 10:00:00','ABC',NULL,'João Silva','Histórico detalhado do contato...','SAP12345','Negociação Inicial',NULL,'2026-03-23 09:00:00','2026-03-23 11:00:00',7,0,'Solicitação pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'João Silva LTDA','123.456.789-00','12.345.678/0001-99','Anotações adicionais aqui...',NULL,'2026-03-23 11:56:42','2026-03-23 11:56:42');
/*!40000 ALTER TABLE `tblCampos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vwCamposResumo`
--

DROP TABLE IF EXISTS `vwCamposResumo`;
/*!50001 DROP VIEW IF EXISTS `vwCamposResumo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwCamposResumo` AS SELECT 
 1 AS `ID`,
 1 AS `Escopo`,
 1 AS `Locador`,
 1 AS `CPF`,
 1 AS `CNPJ`,
 1 AS `Proximo_Contato`,
 1 AS `Tipo_Negociacao`,
 1 AS `Status`,
 1 AS `Inicio`,
 1 AS `Termino`,
 1 AS `Intervalo_Dias`,
 1 AS `created_at`,
 1 AS `updated_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `qryPesquisaCampos`
--

/*!50001 DROP VIEW IF EXISTS `qryPesquisaCampos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `qryPesquisaCampos` AS select `tblCampos`.`ID` AS `ID`,`tblCampos`.`Escopo` AS `Escopo`,`tblCampos`.`Locador` AS `Locador`,`tblCampos`.`Tipo_Negociacao` AS `Tipo_Negociacao`,`tblCampos`.`Inicio` AS `inicio`,`tblCampos`.`Termino` AS `Termino`,(case when `tblCampos`.`Fly_Conecta` then 'Conectado' else 'Pendente' end) AS `Status_Fly` from `tblCampos` where (`tblCampos`.`Proximo_Contato` >= now()) order by `tblCampos`.`Proximo_Contato` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwCamposResumo`
--

/*!50001 DROP VIEW IF EXISTS `vwCamposResumo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwCamposResumo` AS select `tblCampos`.`ID` AS `ID`,`tblCampos`.`Escopo` AS `Escopo`,`tblCampos`.`Locador` AS `Locador`,`tblCampos`.`CPF` AS `CPF`,`tblCampos`.`CNPJ` AS `CNPJ`,`tblCampos`.`Proximo_Contato` AS `Proximo_Contato`,`tblCampos`.`Tipo_Negociacao` AS `Tipo_Negociacao`,(case when `tblCampos`.`Fly_Conecta` then '✅ Conectado' when `tblCampos`.`Enviado_Cadastro` then '✅ Cadastro OK' else '⏳ Pendente' end) AS `Status`,`tblCampos`.`Inicio` AS `Inicio`,`tblCampos`.`Termino` AS `Termino`,`tblCampos`.`Intervalo_Dias` AS `Intervalo_Dias`,`tblCampos`.`created_at` AS `created_at`,`tblCampos`.`updated_at` AS `updated_at` from `tblCampos` order by `tblCampos`.`Proximo_Contato` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-23  9:40:41
