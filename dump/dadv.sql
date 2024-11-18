/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.9-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv
-- ------------------------------------------------------
-- Server version	10.11.9-MariaDB-ubu2204

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
  `id` binary(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  `estate_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `grape_varieties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`grape_varieties`)),
  `rate` varchar(2) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `owner_id` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `saved_at` date NOT NULL,
  `tasted_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottle`
--

LOCK TABLES `bottle` WRITE;
/*!40000 ALTER TABLE `bottle` DISABLE KEYS */;
INSERT INTO `bottle` VALUES
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',259.99,'2024-11-17',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-11-17',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-11-17',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-11-17',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-11-17',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-11-17',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-11-17',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-11-17',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-11-17',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-11-17',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-11-17',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-11-17',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',1299.99,'2024-11-17',NULL);
/*!40000 ALTER TABLE `bottle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` binary(16) NOT NULL,
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
('˜™–¹@ßƒ™6k\ÃLº','Afghanistan'),
('´>B‡–Dú·£\ér£\év','Afrique du Sud'),
('\Ä\çŸ	\÷ŸK“®uY£','Albanie'),
('f\à\Ç)¾[LJPKPúuµ','AlgÃ©rie'),
('x¿h˜M/G½Š\Èûû\Í','Allemagne'),
('@\íR\Ä@¹¬O\ğIN)\Ó','Andorre'),
('¶’\Ã9O\ï†:rš¢	\\','Angola'),
('\é_\ê*MØ¥1\Ìn#~À°','Anguilla'),
('E\ÅPÿ·şMÃ‚)!¯¬!','Antarctique'),
('†şvm˜BO‰AN‚:Iø\È','Antigua-et-Barbuda'),
('\îı@ùlNÈ¿%\ÖünQY\ñ','Antilles NÃ©erlandaises'),
('6\Îa?YH©›G½\Ü\Î\r¹\Ø','Arabie Saoudite'),
('a~!\ÄXI¤¡eJ’u[¢H','Argentine'),
('%1Ê˜;GZ•%»!•F','ArmÃ©nie'),
('A&5\èRNı¤\ê\ÏRÀ','Aruba'),
('Ë“\ä\ç\Ì\ÅL–£‚9¬\ò\Z¹','Australie'),
('\ğ(Y`¸\ÊCµ\÷¬\î(¦²n','Autriche'),
('Qœu\Å\'F\'™m\ÄL\ìG','AzerbaÃ¯djan'),
('yù\ÜI\ÂDbŒJrº\Õ\Åo','Bahamas'),
('ys¤\ë¦JN•g¬\é¦\í¡','BahreÃ¯n'),
('\Øw¥nJ7¨/\Ø\\’}\ô','Bangladesh'),
(' 	E Ov”\"5Œ^¶\Î`','Barbade'),
('U•+B·¨½û”¿°\Ñ','BÃ©larus'),
('»\ÖhH\ë§\0gş{\Ù','Belgique'),
('\æÀ·M›£Æ´K;\ñ¦¤','Belize'),
('V¥]lTEH˜\ïQ„L\ä?#','BÃ©nin'),
('8\í<@&\'K¦“×”\n\Ë{O','Bermudes'),
('\öXy†\î“H1‚Š\Í\Ñwm•','Bhoutan'),
('i¼oV“IN«ş´±\Z?','Bolivie'),
('œº\Õ\Ë@\rKŞˆ£† qN\â','Bosnie-HerzÃ©govine'),
('‡\Ô*!BwN²¦\É˜^\ÒÀL','Botswana'),
('›\ãnHn¿\ÂÁÕ¤m‹\Ä','BrÃ©sil'),
(']øß¨1\ÂOR”<=ªd¦\Ì','BrunÃ©i Darussalam'),
('Qe°OD/³¸\ö¨‹\'Dw','Bulgarie'),
('\Âú@§3@E4š\ñ`·A8','Burkina Faso'),
('4/eƒ‹K¬Xbds¸²‘','Burundi'),
('¢‚\ÆH¥\ÔHû˜*ºVŒu','Cambodge'),
('\î‹%\Û\ÙJĞ§\Z\Û\ï4\ËZ','Cameroun'),
('N\Õ77–®@±©‚^(	\ö\×','Canada'),
('@£ªtZJc‘\Ò\ÉG‡\÷','Cap-vert'),
('0ÔŠ¤\Ş\ÌG¶€-Œ‘Ò¤6','Chili'),
('a k\ë™n@¡¯,ƒ\Ü\Ó<','Chine'),
('ÁdD\ÏJ´š jOı\0 ','Chypre'),
('47o/Oµ¯¨j³Š°¬O','Colombie'),
('Šnj\å\ö¶J[uºc\óI\æ','Comores'),
('J:\È@°)DÏ´3L¥ªûJ','Costa Rica'),
('Ñ¼hBB	¤E \Şe\ÏD','CÃ´te d\'Ivoire'),
('\Ê\éYù„\ÓD=šP|Q9•\ß','Croatie'),
(')ª9\êg^O€ª\ÄVkøüs\Û','Cuba'),
('ü[Õ¤– EŞ¿gûš#¸+¾','Danemark'),
('\à\ó±g\Í\èI¹…P	š`ˆ|I','Djibouti'),
('F\Z“”Õ¤Eş£|\è ˜‹?','Dominique'),
('±lŠ€?D‡%i\ÕO\æ;','Ã‰gypte'),
('¬$¯pY‚B½¿°\ÄZ9ş','El Salvador'),
('\Ú${—€·JO˜JBI\Å‹s','Ã‰mirats Arabes Unis'),
('Qn‹\ÏH#NY²û|i%\Zk','Ã‰quateur'),
('¾Zq\ZxD¥9Ä¹\ÎX\íy','Ã‰rythrÃ©e'),
('\õ†\0ÁQ•Kù¢“p\'–\ÕE','Espagne'),
('Ù–YV\æ\êNs©\È;yLV.ƒ','Estonie'),
('Sc¾ÙƒO@Î™®)-\Ù\ì:','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('È¹¥¤’vD\ï°~2e08','Ã‰tats-Unis'),
('\õuNMŒ«Fx¤™£5¶ú‡d','Ã‰thiopie'),
('¦\èÿS\0Nl«\ç\çŒC¬Œ','FÃ©dÃ©ration de Russie'),
('w\õv‡k2E\Z\Ç# f\nc','Fidji'),
('P6\õ“VJsºÌ¨F\õK\Ô\Ä','Finlande'),
('\ß\óhYCŠ´CÓ‰_\ê?','France'),
('\Ó\ğ\÷\åD\õˆr\óWxµÀ','Gabon'),
('†\ç9]H¦\ÓĞ¼\ÆÄ…','Gambie'),
('Mü\æ˜D¿°iScV²\Ü','GÃ©orgie'),
('\Üµa”,J\êqe\èI%x\Ê','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('À\Ç&\îF¸\ÈV»;Šıj','Ghana'),
('”¹¦——C™q·6E  _','Gibraltar'),
('Ç²\Ïs\Z@¡»N´\÷[c^','GrÃ¨ce'),
('\Z|¾\ÓJ\á¦Q˜º\ö\ê','Grenade'),
('ršJ\ã\îI\ö£\ÛŞ¢]Í‚M','Groenland'),
('\åÿ\Õ@3¸m\ÌÚ¡µ!','Guadeloupe'),
('ŸœDU¿\ÖK{ƒ\ò\ê\Z¹*\õ´','Guam'),
('<Û±\Ğ\\MO…‘wf“½*¥','Guatemala'),
('—C1›\ÖùFÑ™K¯\Ğ\Øl¤4','GuinÃ©e'),
('S\ß\öøG¤³ù” 7\êª','GuinÃ©e Ã‰quatoriale'),
('•7\r©D{«Eÿ\ğı\ñ','GuinÃ©e-Bissau'),
('\ìxuCg[OÂ¤´m»\à9\Õ|','Guyana'),
('¿§¹E\ãJ7«\Åc˜¼ÿ','Guyane FranÃ§aise'),
('\â>\ç\ÌIS§\ê3,Z\æ','HaÃ¯ti'),
('\'¼À¯SD»°1›’\Ô\ê','Honduras'),
('\Ö\Ø\ÑKNOµÚ«\Ş\Û\Û','Hong-Kong'),
('˜›ŒH\çPC\ì«-$·\Ó\æ¸W','Hongrie'),
('\Û\ï‚}„\ÊD½½\ñ\Ó\Ã\÷\àc','Ãle Bouvet'),
('aâ¾·1¶IÏ‚ ’¦”Šs)','Ãle Christmas'),
('Á¦oÿ\Ä\Å@P®Rj!0,','Ãle de Man'),
('\É<)†—\ëIÿ·k\×\Ì\\:{<','Ãle Norfolk'),
('Ù´F\ëG†¢Yê²šŒ²)','Ãles (malvinas) Falkland'),
('|\ÒgI-½Kf¼\ãŞ•\ÆÊ','Ãles Ã…land'),
('¨DU\ßo·KN¸(\ó‰¹$','Ãles CaÃ¯manes'),
('e.h:\Æ@¨!\"\Í\ô\íL','Ãles Cocos (Keeling)'),
('\ÃL\n{ bL2º«—N=\Z','Ãles Cook'),
('…±x\õ¾yM\é’+Q¹bCk\0','Ãles FÃ©roÃ©'),
('2`\ãA!C-½7\Ã\\kYO','Ãles Heard et Mcdonald'),
('F\èH^F‹\\B—ewŠ\ğ','Ãles Mariannes du Nord'),
('h¾C!TH³dE¤t\Ç','Ãles Marshall'),
(';9\ëø\ÛGu›;Ê„š‘ª‡','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('\êR½L9L}T©xx+','Ãles Salomon'),
('Æ†ic\ëMOšµ\Õ\r\' \Ú~','Ãles Turks et CaÃ¯ques'),
('\ï\ï\ãP9\òMŠ‰¿\Øj5øü','Ãles Vierges Britanniques'),
('\÷:^…\"‚J4±“˜Vµ¿y#','Ãles Vierges des Ã‰tats-Unis'),
('—ÿUGÀF´±\õ\àŸ/¯{v','Inde'),
('\÷\ÚM4w\îO~›‡‹l0=u\æ','IndonÃ©sie'),
('¯‹?\ÍIHl¥\à\İ˜S‹','Iraq'),
('şµ‹¤I³°.M/\êÈ™9','Irlande'),
('\ßJG`\ëšIL¤#3ŞŒ>¹U','Islande'),
('\çOû[K}¢d(	[:','IsraÃ«l'),
('„z§–\ÉM˜«m]3œ','Italie'),
('\ç<\ëZO\÷Ÿ\ĞWDSDS','Jamahiriya Arabe Libyenne'),
(':‡\Ê\Å\'Fù¬²6•\÷: (','JamaÃ¯que'),
('\öOPu‰A–—\\ª©<¿','Japon'),
('¦\Ô+\ò)C»U¥@ü›\Ò','Jordanie'),
('s\ë\ÃûH¶N‡b6+\Ï','Kazakhstan'),
('w™\ÍşşFŒ­\ìc$k','Kenya'),
('Ş¦\ÆıL¶‘‰û±µ\Ô\Ü','Kirghizistan'),
('B€,ºTADN†\Ó\Ö\òZ6\Ü','Kiribati'),
('\ìN¾K\áº\Â!½š‡8u','KoweÃ¯t'),
('Z!^x\ïjD5w\ğ©S|f','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
(']¡\ôT½\×H=’8!°U$\n	','Lesotho'),
('ù}F\÷@\ÜF\ç«ZÅ\Ãuf','Lettonie'),
('~À¸\\ˆA¹\ò,J¿G+','Liban'),
('4(º\ö\Ï\ãNˆ“T:bO};','LibÃ©ria'),
('}©Sø\Ï-N=˜ø`\Â½7m','Liechtenstein'),
('\Ú-y\ãB\rš®\0¾<¼3E','Lituanie'),
('\æTú\rfIQ¶\å;š”d{\n','Luxembourg'),
('\r`«£F¹œIÿ±IÍ®','Macao'),
('…)	lP\r@¡y\ï\àŒL\Ì','Madagascar'),
('5r7l\ÅsKš‹ \ÕW1(\ç','Malaisie'),
('µ¨7Ï‘\ÑOº˜\Í\â±u\ç9','Malawi'),
('@\É\ê\Æ\Í\áL™Ÿ\Ğd’\Z\ìR9','Maldives'),
('\ô\Äc}0›G³‡R\î2–c','Mali'),
('\ô~Lh²Ç·X“*','Malte'),
('$$( A¨9D›?µ\Â\ê','Maroc'),
('F\"\îZBl„ƒ`\\­\ß*š','Martinique'),
('¦?r)\âML´\ò`?\î\"b«','Maurice'),
('u\ğa8K 2À\æºÿ«?','Mauritanie'),
('qÎœn\ñI¢=o°³\Î\Ö_','Mayotte'),
('_Y\Ê3€Aµ»@B\àı\Z†\\','Mexique'),
('‰Ø¼\÷@nD¼»\íy\Ş\Ñ\İA','Monaco'),
('\"±¹¾ûJD·¡Ç‡ú°\à@','Mongolie'),
('\Ñ\Ş“_F•\éÀ¸_J','Montserrat'),
('\ß,\0y#M­¯\á\Ó\Ñ?','Mozambique'),
('\r\ÓSv<\çO¼\îaù†8_j','Myanmar'),
('ª{&rfOe +‰út-\ï','Namibie'),
('\Ù\å‡ÁùCº²‰f‡\"j','Nauru'),
('F\"”\Æ\"\ÙLO¾5Wl\\p·•','NÃ©pal'),
('r\ê\'•\rMLªÀ‡p\Õ','Nicaragua'),
('j6¹—“Dÿ¢Z\êG½p[','Niger'),
('qp2	„=A™´Iqâ¸‚­','NigÃ©ria'),
('d\è¦\ÇpşD¥¬û\ê\Ñ’º','NiuÃ©'),
('´‹\Ş\Ş!AA5³³&\èâŸ‘','NorvÃ¨ge'),
('¾9¹¬\İL Ÿ!\Ã>#†\Ì','Nouvelle-CalÃ©donie'),
(' s‹ı¡3A‡®fjc^','Nouvelle-ZÃ©lande'),
('·\ğn\'Á§F3µ4\Û\ÑÒ¢±^','Oman'),
('Ì³Y,UDf˜!CPÿ‘\Ğ\ß','Ouganda'),
('	en\Æo(K9™[|¡P\æm','OuzbÃ©kistan'),
('	0’1Œ\ÒB¹¿Qº’ƒ‡','Pakistan'),
('\Ã\Í K\öJH·Å§ÄlŒ','Palaos'),
('¯M¯KI‡\æû\×F\Ê\á','Panama'),
('r`¬8J‡µ®Z]+d{','Papouasie-Nouvelle-GuinÃ©e'),
('j\Ú\ê\ì„\\K¤«]„\á\ô¨CK','Paraguay'),
('\ÇGHy‹G\"\Ë$µûR','Pays-Bas'),
('¯-Mr˜B ¬—}\ÅB\Üş6','PÃ©rou'),
('8¿\ÃuNT¦À)&¼‘','Philippines'),
('–\ç\Öù2„M«´\r1­¢i¢a','Pitcairn'),
('©Œ6\ÙıIJ1‡ÛŒJ\Ç\×','Pologne'),
('©\ã\ëº_®L{¬\ò¾ƒMaŸ«','PolynÃ©sie FranÃ§aise'),
('¤bU¿\ìH7‘\é\Ø,\â¼øw','Porto Rico'),
('­¬X\ì[‘AŒªª\ó!\nYœ','Portugal'),
('\ä\Ãd¶|Nr¤ú·pF\İ^','Qatar'),
('\íÀ™M\Ë\ÉB´³€®>”\ò','RÃ©publique Arabe Syrienne'),
('b\Èø2E\r½J	O\õ\Ù\n','RÃ©publique Centrafricaine'),
('cùE\óœH¥·²¨G6)','RÃ©publique de CorÃ©e'),
('\Ä\Í„\àF„¯m\Õe\Ê~Œ“','RÃ©publique de Moldova'),
('ªp±N«KRŸ9G—‘§G','RÃ©publique DÃ©mocratique du Congo'),
('²\édüˆ”@ª£ºÚ°§\â\å','RÃ©publique DÃ©mocratique Populaire Lao'),
('Ø©M^G\ò–K´­¹\ì²','RÃ©publique Dominicaine'),
('É“\Ü!TB”œ±4Q\Î;k','RÃ©publique du Congo'),
('B†@\Ì0RK\ö\Æe\é','RÃ©publique Islamique d\'Iran'),
('\à\éD$\è0O¾3\Ãÿ\Ğ]}\Ô','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('Xgåˆ­M‰¾\å\ò4\ã‰','RÃ©publique TchÃ¨que'),
('\õn{<	H1¿rY\"~‹K','RÃ©publique-Unie de Tanzanie'),
('—\ÂAdC«J	 1\ØjHŸ','RÃ©union'),
('Ä‹“\É½C*¿&\ï\ì\×?_','Roumanie'),
('zY%\rM|“d*s\ÕÌ“','Royaume-Uni'),
('À\r@yBHÍ™z—*N\Î	c','Rwanda'),
('—±Md²CG–_y\î\æ£','Sahara Occidental'),
('}·—‚dFl¹\÷|{UaŠ','Saint-Kitts-et-Nevis'),
('a¡ˆW\õI\ö‹¾¢8EaN','Saint-Marin'),
('¤!Ş«\åH—b\à\óm®','Saint-Pierre-et-Miquelon'),
('£?›;\Ú\ÓBº¹Y³/>$©','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('Á\ğ\ßW™DÒœ\ß\åe¦\0','Saint-Vincent-et-les Grenadines'),
('‹P‘‘G¾İµgœ+_f','Sainte-HÃ©lÃ¨ne'),
('nµ#L¹#Ï€i\"´p','Sainte-Lucie'),
('; <Œ¥J\Z…\ñ<±;\ï','Samoa'),
('\rºÒ¨Š#E]‚\ÖM¨[Y','Samoa AmÃ©ricaines'),
('Šı=¾‰F¨»yKC8J*f','Sao TomÃ©-et-Principe'),
('Š	A9{OM®M‘\Û\öQ¯','SÃ©nÃ©gal'),
('Ğ€\æYLüƒ\â\ê\çû\Æ','Serbie-et-MontÃ©nÃ©gro'),
('\Ğú^Ø„»Bµ\ïø\éÁW\Ü5','Seychelles'),
('Ğ!z™qK\ögu\é','Sierra Leone'),
('\óC\ğ“¨ME™?R³G‚s','Singapour'),
('U¥œ{P³O\Ï&\è4‘i)','Slovaquie'),
('f\ê¢r\ØEk±lš>‘š‰h','SlovÃ©nie'),
('3š\n!E¾w-œ\ì\å‘','Somalie'),
('g„& \Ó\ÆDºş\Ğ\Ü0\ã','Soudan'),
('j°|¢\ôJˆˆjûº','Sri Lanka'),
('˜\É\Ú\ÅEB½i\ÈN4','SuÃ¨de'),
('º¢€”BB£›²¼\ÉÀ\õG','Suisse'),
('\Æt\Û˜O¬€°$\æo‰a','Suriname'),
('•E¼¼ÁJ¼?\ño‚­\ì\è','Svalbard etÃle Jan Mayen'),
('±%\àwJ\à†½F\ÖNtdŠ','Swaziland'),
(']ªi‹\ÏNş“3q\Ñş\í','Tadjikistan'),
('\ï<\0\È—DÄ¢\ÑÑ‹\Ó\êE«','TaÃ¯wan'),
('†l\Î[—?D†‚q4ƒ¶xÀ','Tchad'),
('I‘O7&M\ç½\ZÖ«\àn®e','Terres Australes FranÃ§aises'),
('nĞ‰\å¢H&µi\\µ\õ=›','Territoire Britannique de l\'OcÃ©an Indien'),
('\í,\ÅB\ZA¨p¦(*aÄ›','Territoire Palestinien OccupÃ©'),
('\Ş-ø´\Æ\ÑK´X°4\Åë¯‡','ThaÃ¯lande'),
('˜kuWùYAù¡«\'¸g;‡\È','Timor-Leste'),
('r\é`H\ò”-}*¶Šû\0','Togo'),
('\Ì\Ş\ÓÃˆG·¿–”u[s—','Tokelau'),
(', ½¶\ÇNª¾w\Äe\ÊTf\Â','Tonga'),
('\á\×v|\ËE£\ÒD\ĞL\Ì','TrinitÃ©-et-Tobago'),
('£\Ö\ä«AW±k N25','Tunisie'),
('U¨|]\íL¢µ\çBş\õŠN$','TurkmÃ©nistan'),
('\Äw‡şÚ¢KË†‘EX¹	·','Turquie'),
('\\Hj•9J{¼‡ X³q±','Tuvalu'),
('-@–=N+IÒš,~?p_\å¡','Ukraine'),
('‘;VŒEO‡Ÿ¾G*8\æ\Æ','Uruguay'),
('‰h\äP‚[OÃ£%^iµL‡','Vanuatu'),
('\Ãd\Ä\æn­Iš«†»qKwk\ë','Venezuela'),
('‡@\â\Ú$FÎ¢LŠ<’>','Viet Nam'),
('/Œ\æ¤7£N5¬\ÄÎ–a¤û','Wallis et Futuna'),
('\àšŒ›@hŸœŠÏ½\Ù\Õ','YÃ©men'),
('\õ\à›¡6E‹¨™§IŒ\÷²','Zambie'),
('Á‡\\\ç\ä<A\ì¼s~¤5H…','Zimbabwe');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES
('DoctrineMigrations\\Version20240124155119','2024-11-17 20:18:31',3),
('DoctrineMigrations\\Version20240201152951','2024-11-17 20:18:31',1),
('DoctrineMigrations\\Version20240202084749','2024-11-17 20:18:31',3),
('DoctrineMigrations\\Version20240202150901','2024-11-17 20:18:31',2),
('DoctrineMigrations\\Version20240207105701','2024-11-17 20:18:31',2),
('DoctrineMigrations\\Version20240319212437','2024-11-17 20:18:31',2),
('DoctrineMigrations\\Version20240614133504','2024-11-17 20:18:31',8),
('DoctrineMigrations\\Version20240617165906','2024-11-17 20:18:31',6),
('DoctrineMigrations\\Version20240708061729','2024-11-17 20:18:31',9),
('DoctrineMigrations\\Version20240801202153','2024-11-17 20:18:31',3),
('DoctrineMigrations\\Version20240815153823','2024-11-17 20:18:31',2),
('DoctrineMigrations\\Version20240916065051','2024-11-17 20:18:31',4),
('DoctrineMigrations\\Version20240929091802','2024-11-17 20:18:31',13),
('DoctrineMigrations\\Version20241002164506','2024-11-17 20:18:31',7);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grape_variety`
--

DROP TABLE IF EXISTS `grape_variety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grape_variety` (
  `id` binary(16) NOT NULL,
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
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitation` (
  `id` binary(16) NOT NULL,
  `tasting_id` binary(16) DEFAULT NULL,
  `target_id` binary(16) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `link` longtext NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F11D61A25BC0FE1E` (`tasting_id`),
  KEY `IDX_F11D61A2158E0B66` (`target_id`),
  CONSTRAINT `FK_F11D61A2158E0B66` FOREIGN KEY (`target_id`) REFERENCES `participant` (`id`),
  CONSTRAINT `FK_F11D61A25BC0FE1E` FOREIGN KEY (`tasting_id`) REFERENCES `tasting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
INSERT INTO `invitation` VALUES
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7','\É5?0O¤…€)\\¦ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-17 20:18:32');
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant` (
  `id` binary(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
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
  `id` binary(16) NOT NULL,
  `owner_id` binary(16) DEFAULT NULL,
  `participants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`participants`)),
  `bottle_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_736218107E3C61F9` (`owner_id`),
  CONSTRAINT `FK_736218107E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `participant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasting`
--

LOCK TABLES `tasting` WRITE;
/*!40000 ALTER TABLE `tasting` DISABLE KEYS */;
INSERT INTO `tasting` VALUES
('.¥l5‹¹LnšI½y\Å\ñ7','™d\å9ÿF³œÿ\Ö\Ñ¸·','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]','Domaine Leflaive Montrachet Grand Cru 2016'),
('–J<¸_½Fx¥\Í\ãqÀ§\"','™d\å9ÿF³œÿ\Ö\Ñ¸·','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]','ChÃ¢teau Latour 2010');
/*!40000 ALTER TABLE `tasting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` binary(16) NOT NULL,
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

-- Dump completed on 2024-11-17 20:18:33
