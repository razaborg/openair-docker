DROP TABLE IF EXISTS `mmeidentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmeidentity` (
  `idmmeidentity` int(11) NOT NULL AUTO_INCREMENT,
  `mmehost` varchar(255) DEFAULT NULL,
  `mmerealm` varchar(200) DEFAULT NULL,
  `UE-Reachability` tinyint(1) NOT NULL COMMENT 'Indicates whether the MME supports UE Reachability Notifcation',
  PRIMARY KEY (`idmmeidentity`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmeidentity`
--

LOCK TABLES `mmeidentity` WRITE;
/*!40000 ALTER TABLE `mmeidentity` DISABLE KEYS */;
INSERT INTO `mmeidentity` VALUES 
(1,'mme.openair4G.eur','openair4G.eur',0);
/*!40000 ALTER TABLE `mmeidentity` ENABLE KEYS */;
UNLOCK TABLES;
