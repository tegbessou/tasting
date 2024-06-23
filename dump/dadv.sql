/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dadv`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dadv` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `dadv`;

--
-- Table structure for table `bottle`
--

DROP TABLE IF EXISTS `bottle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bottle` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `name` varchar(255) NOT NULL,
  `estate_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `grape_varieties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`grape_varieties`)),
  `rate` varchar(2) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `owner_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `country` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `saved_at` date NOT NULL COMMENT '(DC2Type:date_immutable)',
  `tasted_at` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_ACA9A9557E3C61F9` (`owner_id`),
  CONSTRAINT `FK_ACA9A9557E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottle`
--

LOCK TABLES `bottle` WRITE;
/*!40000 ALTER TABLE `bottle` DISABLE KEYS */;
INSERT INTO `bottle` VALUES
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',259.99,'2024-06-23',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',999.99,'2024-06-23',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',2999.99,'2024-06-23',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Italie',899.99,'2024-06-23',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1599.99,'2024-06-23',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'¾m2\Ü#M¿Œfh\Ñ3[¼','France',358.99,'2024-06-23',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Australie',1799.99,'2024-06-23',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1099.99,'2024-06-23',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\Ë#zO0±ˆj­q´s_','United States',199.99,'2024-06-23',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','¾m2\Ü#M¿Œfh\Ñ3[¼','New Zealand',49.99,'2024-06-23',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Italy',899.99,'2024-06-23',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Espagne',1499.99,'2024-06-23',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',1299.99,'2024-06-23',NULL);
/*!40000 ALTER TABLE `bottle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5373C9665E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES
('\ë6Š6³Aï¨º³}a*','Afghanistan'),
('ƒn\Ö=U$Cœ¦´¢\Û\ã„\Ç','Afrique du Sud'),
('•hBNM¶\ïs…éŸ¬?','Albanie'),
('Y \õw§Aù¼3e‹t­N;','AlgÃ©rie'),
('\Ø\Ó¿\ã˜A§µH\ã!^\î\õ','Allemagne'),
('\ï\Ç‚\æ\åMš›Z\ÌÌ²W’·','Andorre'),
('he’=•¯Fr´O¡\Ì;','Angola'),
('V/`¼+B»\è\Ş5Ø¨\ç','Anguilla'),
('\ËKWz\Í\áLÒ¥yŸ¥¯–r','Antarctique'),
('\õL\ÓzXeN› \ñ@¹\Ã+','Antigua-et-Barbuda'),
('Å¶\Ò<\ïEÀ£\ã¿4\ĞÈ²','Antilles NÃ©erlandaises'),
('ac¹@\Ì\óN­’L…Iº!I','Arabie Saoudite'),
('©ho…€FW¡¸Fn•','Argentine'),
(')\õH(¥Bş˜Æ¸¢6»','ArmÃ©nie'),
('\ÌloL M½giY,¯?','Aruba'),
('\öa³H¨GG±“^%x\Ö','Australie'),
('DŠúpBx¬Ó¬şB\è\ğ','Autriche'),
('\îjV\×9A!€\ßE²\ä¾','AzerbaÃ¯djan'),
('\Éa\ñz\ŞkJ4Œº\òü‚\Ø0‡','Bahamas'),
('¤´8KùKRµ\ï$\n\Ñ(','BahreÃ¯n'),
('xNeµE¸¥} -5\Ë\É','Bangladesh'),
('/‘±Å»‚O\ç!üı­“a','Barbade'),
('\ñ\nx\÷sG€°N\ÍvŠµ','BÃ©larus'),
('‡Š˜«\à…ONµ\Ìs¥Mb~','Belgique'),
('/šW4¯\ĞEÜˆ¸°l¸x=i','Belize'),
('ÖšnŠ«B§†U8\Î%ı9Z','BÃ©nin'),
('p\Îp\ÉH<¤Ágş\áSP\Ú','Bermudes'),
('\0Q\÷5I]„$\÷À)¯b','Bhoutan'),
('Áa—mJ$ #[\Ğ\Ì\ãQ','Bolivie'),
('XEĞ¾­I<¤6\Ü’\Ê','Bosnie-HerzÃ©govine'),
('©¾Ó¦ø“@6‘z/\õiı\Ã\ì','Botswana'),
('\Ø{\×a!\ëF>Š$*\î~\Û\Ô','BrÃ©sil'),
('*\Æ3İ¹\×Mo šk³uO','BrunÃ©i Darussalam'),
('°\Ğ`BÀ\ŞBİ½‘Ñ¤¼\î\ë,','Bulgarie'),
('›\Ëx©VA¾‡€,†RŒGe','Burkina Faso'),
('\Û;2ù\ì©L\"‚½R?«}Ú¢','Burundi'),
('\ñP\ìÿ´FC‡\ÈW)w$S','Cambodge'),
('°X{\Ù!Mj²,³s\ót6','Cameroun'),
('\â6Oe‰FL†³J\Ïy´u','Canada'),
('3œ]H[¿¯\×6&‘','Cap-vert'),
('\ğÀ\Ê[HÈ„ú&b½A\Z','Chili'),
('\ÔÆ™GÓz3\õ%','Chine'),
('8\ôû†\ØFÉ‘ƒ9\ä©\Ù','Chypre'),
('|¿TÙN°‚\ÇÎ†*;,','Colombie'),
('\Øÿ~{\òFZ³$\Í™\ğ+','Comores'),
('Š\àşŒztBó¨’ƒX\ØÕ¾\ô','Costa Rica'),
('¬Ræ“œB» \ò8¶m\á§j','CÃ´te d\'Ivoire'),
('\'Ÿ\ÉÀzF›TY—)K«','Croatie'),
('4\Ö\ätÄAL§¹‡Åº€\Ê','Cuba'),
('-4@¹Ñ¾I\ô¹€\ç&¾¯¡','Danemark'),
(':Q;ˆ®\àBQ¡\çmA\n\"\èÿ','Djibouti'),
('\ğPœ.xEşš!\âz(B\ê','Dominique'),
('o\ÖÀ&‚«Eº¡´v$\Úc?','Ã‰gypte'),
('Q6†è°±K²”`J:Bz','El Salvador'),
('\ÒpŠÙŒ\ZJ8»\ËÌ³ûVl','Ã‰mirats Arabes Unis'),
('·o9eú†Kf³G4a.º4','Ã‰quateur'),
('îš³\ã+¡E´˜\İ/P\â4`…','Ã‰rythrÃ©e'),
('©\ñÓ¼5\ÔFÇ\ÃP¶)\Ü/A','Espagne'),
('Luş©\ëaOÌ±sÑ˜\'\ò\Ëd','Estonie'),
('\Ã\0qe¬@¦€\ğšM\â|\Óz','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('\å—Ğ²•EÎ†œ\Ã1øwH¢','Ã‰tats-Unis'),
('Ÿy;{ªE]“;i	B\òS\ô','Ã‰thiopie'),
('¾_GO”‹¥$\ôşš\É','FÃ©dÃ©ration de Russie'),
('¸2>©BHLq…ˆº\ÌH\Äm\r','Fidji'),
('€*Q\Ò\î?Fx†a’¸À','Finlande'),
('lø¯PJO¢œR©‡\÷','France'),
('\Û\íbFE=IŸ¥§5Ä„*','Gabon'),
('.v\âc·\öD\'‡˜=p_‹\ê','Gambie'),
('Dı)\ã\ÕAE“Ÿ.\ßaøº','GÃ©orgie'),
('¡N\Ñ\r†Iq«\òÎ“.™','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('£´bRsVL¤n\ïW','Ghana'),
('?\õdˆ‚¹@_š‹\n{ó¸¶','Gibraltar'),
('%b‡¾™&A\nƒü¿µ\rş„','GrÃ¨ce'),
('®¸’{L3Ißª˜S¡\çE','Grenade'),
('TH”“cNÈ‚—®ƒv\ÜıE','Groenland'),
('‚awŸ\èG„¶L~XT\îG','Guadeloupe'),
('Á\î\ñ\ğ M“˜#A¶)\Ô','Guam'),
(' /QYM¬¼m»‡','Guatemala'),
('\âü•lO&“˜Y7ÀŸ','GuinÃ©e'),
('^•‹^\'CtŒ2ÀHÖ„„','GuinÃ©e Ã‰quatoriale'),
('@\ÒÊ±\î\÷Io\n\ë#Fq','GuinÃ©e-Bissau'),
('S\è?\ÉÁ´@y¬Ãœ \ó˜','Guyana'),
('T\ñ\"Ù¿|JŒb)\ä€\ö’','Guyane FranÃ§aise'),
('}Ó»«\àYHb´-\È?O\0­','HaÃ¯ti'),
('\Ç\'Št¿\ÛAÄ€”\Â5 ™C','Honduras'),
('¸¯6\á=·G˜¼\ócdıX\ç','Hong-Kong'),
('O\îM\ç\ÎF¬‡\ÇR§9¹\Ò\ö','Hongrie'),
('§\ÈQ‚¿J7‚{\çı\ë','Ãle Bouvet'),
('\öYj’FE„ ©E)Š«\á','Ãle Christmas'),
('\í\É\æšvhAe•®a cƒ“ú','Ãle de Man'),
('˜0ƒ\â|\çKB±»S4‰\Ôx','Ãle Norfolk'),
('\ä©Læª®OhŠÿ‚;/5\×','Ãles (malvinas) Falkland'),
('”d=\Ó\áC¤†4t\ñ\Ä-¿','Ãles Ã…land'),
('¨ø\âÕ2Nª#}\ò€\õ','Ãles CaÃ¯manes'),
('?­ tIv˜EÔ“#\×\'\Ø','Ãles Cocos (Keeling)'),
('T\Íf\Í@\á“N¦W9:','Ãles Cook'),
('+Í‹]…KÒ•“¾Õ’\Ê)','Ãles FÃ©roÃ©'),
('ı‰ˆ	«F\òŠ\ê7ù£\és®','Ãles Heard et Mcdonald'),
('\ñY¹WD]™\ó*\âü\"3³','Ãles Mariannes du Nord'),
('µ³\åg’C•¾¾<\÷\Ùş','Ãles Marshall'),
(';5*?)ŠMø©`\ğ„\Í\î\İÁ','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('²²u4N`‰ušq™c5\Ä','Ãles Salomon'),
('Ü›±‰@\Z·>=…Fµ‰\"','Ãles Turks et CaÃ¯ques'),
('¤¾=\n¿Fßš4s9\ï\È','Ãles Vierges Britanniques'),
('U<\Ò\"û’F,¬²i0\ã *','Ãles Vierges des Ã‰tats-Unis'),
('\ğaŠY\\B+¹ê—Ğ®GU','Inde'),
('tDqvEy–6\÷z„·4','IndonÃ©sie'),
('\Ğœy-Jj«Ñ«-¾Õ€','Iraq'),
('ä¨¨¬A\ÙJ¼·ˆ#ù9Qm\İ','Irlande'),
('\ÌX%ùˆAŠˆ\Ì\ê\ÃŸ\Õ','Islande'),
('²OmÀ›OK–©\ÔtE[\Ã,','IsraÃ«l'),
('ı©¸Š“\òC –¤ı¼8Ša','Italie'),
('k7şL`£\Û[`Z\Õw\è','Jamahiriya Arabe Libyenne'),
('l\ò\òLL>“\ĞD\ÉF\Í\İ','JamaÃ¯que'),
(',¦<úiG0ŠBÀJp','Japon'),
('o\"o+\ãD,’\n¦\Ãp\è\ê','Jordanie'),
(',Œ2U4¹@Y¨ˆQ','Kazakhstan'),
('8\ëZ\ÄÁ\êBÂ˜\Ü\Öx:6','Kenya'),
('3\Ä³¥LKƒ¼™F1û…\İ','Kirghizistan'),
('%Nf~ºûMG¶F\êR¬!bŸ','Kiribati'),
('9\"R\÷$=J»&	İˆ€','KoweÃ¯t'),
(':\\\ä@ƒGŒGmj','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('\çTbZL\ZLa\Ï=z-,ıG','Lesotho'),
('†7#økK½Š\Öf\Îi2€ ','Lettonie'),
('\Ã3Q\í_E‘¼û”N\õ\ğ','Liban'),
('¨~²IÓ’Y‰ˆ€\Æh','LibÃ©ria'),
('¶n\Ü\éVHª i\åe 9','Liechtenstein'),
('¬sW‡\ÖiBœ\Ì\Z fuº\Â','Lituanie'),
('9a\ç\Ã!4@ø¥lšb\åwÍ’','Luxembourg'),
('¾ªÖŠU\ÄF®¸\ä\Æ´Á\Ù','Macao'),
('Œ¯;\ZüE\á¦E(\ôø\ä\ô¾','Madagascar'),
('øşûÜº\ÇO¿c•Gd\÷\÷\ó','Malaisie'),
('ƒ\òr¨SD ½k‘e\×\ã','Malawi'),
('§\ÊUL¡E¹©>“Ò…UR','Maldives'),
('Q\àM\ÈtE¦“8—u^™19','Mali'),
('a›\ğªYK±¡\Ç\\d\ÙV\"','Malte'),
('‘¾ƒÚ„GQ¿\Ç\Ì^«\ËU\ô','Maroc'),
('?\×G¯fM3˜oFR\ÆjE','Martinique'),
('½¸7‘>¤F-’\rŒ¥\0’','Maurice'),
('†o¤‰—A\r*ùO1ª\ì','Mauritanie'),
('D¼İ®ÿFÀ•\á[+\ÂÂª','Mayotte'),
(' ‚ú\ì¤BØ«tº•k\Ïe\Ã','Mexique'),
('\è,¿B \çA˜\r	7\r&x\Æ','Monaco'),
('Co´ÁxD£¸\é\î\æ^\Éø','Mongolie'),
('\"\Ş\ïÓ‘\İO5§\Ç\Ëûû[\õ1','Montserrat'),
('\õÿf‹\õ@O˜\ì\î•\Ê9v','Mozambique'),
('\İ\á\Âü\Ì\ÍOy¼uº\à\à\î?','Myanmar'),
('›(*ù¢­BÉ‘\îq—\ë\â\Ô','Namibie'),
('(\ÌgGŸ¥\ëW¹ª–\ë','Nauru'),
('s»-¯M.´\à†>ù\Ã!','NÃ©pal'),
('$\ç\ñ	HN¥\ò‰»r\ğ','Nicaragua'),
('/\È-\Ó\È(FQ˜\Â\Æ','Niger'),
('y‰ L¯‹OJ¸h\í\õW','NigÃ©ria'),
('ş *kN\ò^W\íS­','NiuÃ©'),
('b[ØºIHt•yH\ğ^\ì\ë','NorvÃ¨ge'),
('ŒŸ2H•Eœ½cU¬gP\İ','Nouvelle-CalÃ©donie'),
('Èª\ò\Ün,G¡ˆ=FYT}\ç˜','Nouvelle-ZÃ©lande'),
('®ÑƒÕ¥\ëHœªE_+p Œ','Oman'),
('ÿH\ÄÙ««K¾\ó¥„6°8','Ouganda'),
('¿\÷\çÍŠhD6ˆ<»™\ßqE˜','OuzbÃ©kistan'),
('f\ï#¹-GJ¦xD\é$¹','Pakistan'),
('|,	ÿ‰üN®6\ï\ç£Y','Palaos'),
('\Ï’$tDı„c72y\ì±}','Panama'),
('˜y\æ\ã<\ÔIÔ©l5\ğ!T','Papouasie-Nouvelle-GuinÃ©e'),
('}\×cO	IÄ\ÚDOw?','Paraguay'),
('|½|ßºN5©\ê\Õlo\ÔA9','Pays-Bas'),
('Šs¨M\rX6\ZK¤','PÃ©rou'),
('\õ v™Gl‡\Å%FÁK%','Philippines'),
('½,3\à„I\ï˜I5\Î\Ö\ÒÆ–','Pitcairn'),
('\ß\ğ¥ƒtW@Æ²hD´×™\Ë\Û','Pologne'),
('øtªA\ìXG¨‡q\Ò\Ø\áKX','PolynÃ©sie FranÃ§aise'),
('CK1wA\á¹hR\ïw\ß','Porto Rico'),
('¾¦u¶¡Gı˜L!zUƒ\É','Portugal'),
('†^\İV‚H<ƒ\ôk˜u¡','Qatar'),
('\Òw\àŸ\Ê\ğO×›\ÜÒ \ö½øŒ','RÃ©publique Arabe Syrienne'),
('\Ö\éw}=)O\ã6\ç>Á\à¹Á','RÃ©publique Centrafricaine'),
('Œ\é\àØ²0N\ë\Î\óF\é\Â','RÃ©publique de CorÃ©e'),
('\Ø;úYG~¾½§\êho:','RÃ©publique de Moldova'),
('\ÊnE\ä\ÖJû«¸\ğ»7hh','RÃ©publique DÃ©mocratique du Congo'),
('U«œt;vA¡šO0Ê™´','RÃ©publique DÃ©mocratique Populaire Lao'),
('‰S°4\ò„B«³\ëmX\ê·H\Ï','RÃ©publique Dominicaine'),
('\á4™¢8‘GL‰Á–u\Ñ\\4\Å','RÃ©publique du Congo'),
('™ú½\÷†\ØEv˜tIœ(','RÃ©publique Islamique d\'Iran'),
('\í‡s-&B7¸„?[Ÿ\ß\ğ','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('·G‡U¹DÓµ=\Ã|€`','RÃ©publique TchÃ¨que'),
('\ÜĞ¥½y\íM”¯Á	„i\r\ò','RÃ©publique-Unie de Tanzanie'),
('3‡a\ôh4J˜±\ÉsB\æ_›\Õ','RÃ©union'),
('$$~«¾Fu£Ek\ì¬Í°','Roumanie'),
('\Ş~{C\ÓO \\¨Ê™','Royaume-Uni'),
('_\öj‰\ÆFS {Àwº','Rwanda'),
('D_U¬\\ECûœ\Ú\Ä] ) \ó','Sahara Occidental'),
('\Z±4W8MOº–ZWF½ ','Saint-Kitts-et-Nevis'),
('\ï/\í› Jİ­´\Z8cQc','Saint-Marin'),
('\Å8m«&J®À[\ï6y¦p','Saint-Pierre-et-Miquelon'),
('ZM\ÜG”­¡G\Õ!z-','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('\çû…[c\âEŠ°\ÃÁyh\Ş','Saint-Vincent-et-les Grenadines'),
('\ò`¦¹-O\"™+\ñ\Ê\åK\è¿','Sainte-HÃ©lÃ¨ne'),
('#\Ãj[RDï·²k’~_Z~','Sainte-Lucie'),
('Q¡-\Æ\ïL¹$¸\Æ\Õg<','Samoa'),
('$/\ïs™FÛ’ebŞ»`\Õ','Samoa AmÃ©ricaines'),
('Á{~q¢šE\Z‚šA§“j','Sao TomÃ©-et-Principe'),
('Ì‡\"\ŞXD×®\à˜X\äÀe','SÃ©nÃ©gal'),
('\×oúû¶©Fœ€=ÿ¾l\ê','Serbie-et-MontÃ©nÃ©gro'),
('j\Ó\÷\á°G›‹rnºjÂ¡ş','Seychelles'),
('NªOe\Z:G‰‚ª\É\Ë\è','Sierra Leone'),
('û•½š\ÔD·šF\îbt\í{t','Singapour'),
('Õ¥”3+RH<€0Aü3­','Slovaquie'),
(',\Ó\ê/\ÒB7€\ê7C\ï^','SlovÃ©nie'),
('A/‰4\ÂNF\ë™}¼·\Í\ò','Somalie'),
(':yA\ÃFhIP¹xÿ\ÂÁEv','Soudan'),
('¦iùtŒJ%˜1\â8ˆs','Sri Lanka'),
('&ñ›“ÀET§‘|\"#\ß','SuÃ¨de'),
('Š\Î\Â\0\ÅA>•!å§°F\Ë','Suisse'),
('*\×\ÅkŒI\â¡Mj\ÃÑ‚·','Suriname'),
('\ÏI3\çÀCq“\Ğ\ã\Õ\í,ş”','Svalbard etÃle Jan Mayen'),
('\ã\Æ\õA\ä¸Ü¥„)Œ_','Swaziland'),
('\'\Z\Új\çL¶“\r$4ºt.','Tadjikistan'),
('x\Ñ\Êw\"\õC\à‡¦\02_kp','TaÃ¯wan'),
('œŠë¬6@)¬¸´	À|\Ï\É','Tchad'),
('¹Àa\0qECO‰\×u\ñ)ø','Terres Australes FranÃ§aises'),
('G\è\é\ñı	C¨…\rÒ\ğ\÷','Territoire Britannique de l\'OcÃ©an Indien'),
('¯zj\Ö\ÏDûª®*\ã}','Territoire Palestinien OccupÃ©'),
('Kmı7KKY›ù\ãµCn','ThaÃ¯lande'),
('	\İ(Á…\Â@!º¤¢—¦\ÕU¶','Timor-Leste'),
('µ»\ÜÅ½@\\ª\ÃÅºZû9*','Togo'),
('CˆCü\ÔI¨‘1\å®PL\Ø','Tokelau'),
('·†±h­†Aˆ¦f\æ’W','Tonga'),
('ƒ\äa\ãıH\0µµeµ','TrinitÃ©-et-Tobago'),
('\ñWRf\ïOV™Öª‰\á\Ì','Tunisie'),
('€¨¿³„I™ƒ”¨–\ôš¼','TurkmÃ©nistan'),
('v˜i˜C\É&\óyø','Turquie'),
(',…/D D#’c¢K—±f','Tuvalu'),
('–˜Q\ÓfHu‘\éÀ(°jb=','Ukraine'),
('¾q7\Í1AÏªµ$VYX','Uruguay'),
('Ü¾v`¸A\ö»§Zê´°	m','Vanuatu'),
('\ÏW`£\Ï\ëL²ª\ï0ek4\ô','Venezuela'),
('Ho´\ĞjGA¡u\÷SÚœ¹z','Viet Nam'),
('\È\÷B¶HE‡†iƒ;½W8D','Wallis et Futuna'),
('_©ü¢f˜E{˜\r\â€\Îh','YÃ©men'),
('S\ñ?s¿Ok’Ps{Bv“','Zambie'),
('nb2†*iNu¥\é\Ë!O\Şx‚','Zimbabwe');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES
('DoctrineMigrations\\Version20240124155119','2024-06-23 19:13:37',3),
('DoctrineMigrations\\Version20240201152951','2024-06-23 19:13:37',3),
('DoctrineMigrations\\Version20240202084749','2024-06-23 19:13:37',2),
('DoctrineMigrations\\Version20240202150901','2024-06-23 19:13:37',1),
('DoctrineMigrations\\Version20240207105701','2024-06-23 19:13:37',4),
('DoctrineMigrations\\Version20240319212437','2024-06-23 19:13:37',1),
('DoctrineMigrations\\Version20240614133504','2024-06-23 19:13:37',11),
('DoctrineMigrations\\Version20240617165906','2024-06-23 19:13:37',7);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grape_variety`
--

DROP TABLE IF EXISTS `grape_variety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grape_variety` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ECDE22675E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grape_variety`
--

LOCK TABLES `grape_variety` WRITE;
/*!40000 ALTER TABLE `grape_variety` DISABLE KEYS */;
INSERT INTO `grape_variety` VALUES
('·-³\'-ˆA>˜6H•;“1¶','Cabernet Franc'),
('H–=n+¡A—®+Q\Î\ğn4h','Cabernet Sauvignon'),
('¡‡\È0”eLÙ¥>o’ù\Ò	','Chardonnay'),
('{¾’9‘\áK\å©\ğ\'\Øg9Ob','Chenin'),
(']\ì®<ıTJÏ¨¹\á	\Å(','Cinsault'),
('Or?`£šH\õ»\í+`\n','Grenache'),
('ŠˆÈ¨r@Ü¢“[»,Cµ','Merlot'),
('w3\ÊùqO\r­\Ò\ã\æA','Nebbiolo'),
('°chiC­£ Z¥\ã\rƒ','Petit Verdot'),
('¯‘\Ğ\æœ\ôF±«h\îDN×‹','Pinot Noir'),
('³ü7QD…93Ÿ\Ğ=','Sauvignon Blanc'),
('İ¸\Z\á\ìDQŠ\à\ğ‰Ò¼j','Shiraz'),
('«Pˆ°\ÌNu´|>”±\ì·','Syrah'),
('5DYI$™\ß@v€','Tempranillo');
/*!40000 ALTER TABLE `grape_variety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES
('L\Ë#zO0±ˆj­q´s_','root@gmail.com','Root'),
('¾m2\Ü#M¿Œfh\Ñ3[¼','hugues.gobet@gmail.com','Hugues Gobet');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES
('™d\å9ÿF³œÿ\Ö\Ñ¸·','hugues.gobet@gmail.com','Hugues Gobet'),
('\É5?0O¤…€)\\¦ZDQ','root@gmail.com','Root');
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasting`
--

DROP TABLE IF EXISTS `tasting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasting` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `owner_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `bottle_id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `participants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`participants`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_73621810DCF9352B` (`bottle_id`),
  KEY `IDX_736218107E3C61F9` (`owner_id`),
  CONSTRAINT `FK_736218107E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `participant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasting`
--

LOCK TABLES `tasting` WRITE;
/*!40000 ALTER TABLE `tasting` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
('\îo;ÔˆC¾±ı½\Ë\nl','hugues.gobet@gmail.com'),
('\è˜NE\ÍDÔB\õ\Ä\æ½a’','root@gmail.com'),
('$m7\ÈÁ–@¼¨¨\ÇA\ì:','services.bottle_inventory@gmail.com'),
('ÏŸP5#\ÊJH¼]Å²_\õ_','services.tasting@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-23 19:13:38
