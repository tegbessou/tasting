/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv_test
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
-- Current Database: `dadv_test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dadv_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `dadv_test`;

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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',259.99,'2024-07-14',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',999.99,'2024-07-14',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',2999.99,'2024-07-14',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Italie',899.99,'2024-07-14',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1599.99,'2024-07-14',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'¾m2\Ü#M¿Œfh\Ñ3[¼','France',358.99,'2024-07-14',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Australie',1799.99,'2024-07-14',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1099.99,'2024-07-14',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\Ë#zO0±ˆj­q´s_','United States',199.99,'2024-07-14',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','¾m2\Ü#M¿Œfh\Ñ3[¼','New Zealand',49.99,'2024-07-14',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Italy',899.99,'2024-07-14',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Espagne',1499.99,'2024-07-14',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',1299.99,'2024-07-14',NULL);
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
('â»…n—‹EÉ>Ÿ¨>x\\€','Afghanistan'),
(' \ĞE\ô“Mr¯<°g†r','Afrique du Sud'),
('d†¶.H ¾‡6\È\Ã','Albanie'),
('¥I\Õ\Ä\ĞMCƒ;Á†Ucş','AlgÃ©rie'),
('­¥\ãC†¨+˜Ÿu\\a\Ú','Allemagne'),
('rcc\Ù\õmH	’\Ó ©,\å§','Andorre'),
('|>»\îNqHÙ€\ó\Ê;\É','Angola'),
('Ša¿†\ÏD;½!‹’©','Anguilla'),
('#S\'\ÏUI×«\ß\íB‰,¡','Antarctique'),
('j\ê,\\_Mª£]\ç+>Œ6','Antigua-et-Barbuda'),
('b™–û)A‡“¢¸•F','Antilles NÃ©erlandaises'),
('W=û)O*Œ\n\É\ç¶]','Arabie Saoudite'),
('\Ìl\ßjucAB‹\ß>{&@\×','Argentine'),
('}µ\à¼C½Hš‰@\ô¬3ü+','ArmÃ©nie'),
('À€\å\ó\"Bƒº@1j«\È(@','Aruba'),
('Ch€]Jv¤\é¿\Ø%Œ','Australie'),
('\æ\á\éŸÁ\ÏLŠŸ»±DSi','Autriche'),
('S\Û\É\è(aHî”¦eÈ€¤¿;','AzerbaÃ¯djan'),
('J\ìxùË§G „\n¦c\Õ','Bahamas'),
('G\ä|>L \÷²\Ğ\äh','BahreÃ¯n'),
('t\ó\×UJS¥UYwÿ\ñ^u','Bangladesh'),
('4è¿›\ÌNF¹Ø¤\"\ĞH{a','Barbade'),
('¡\n+U\ò³F:¡¥\n¹','BÃ©larus'),
('\éQ›\õAA¦¥Po]PLn','Belgique'),
('FCj«+\ìCÅ™<hŒ‰\ÓÎ‡','Belize'),
('ÿ½\Ñ\Z¤$N¬¿\àœw·\Î=','BÃ©nin'),
('\\h1@7HNG¨€\ä:T\ò\ğ\Ç','Bermudes'),
('G±z\ğ£©Aà¿ü˜\ï…','Bhoutan'),
('5¸\ÂdW}Av…sj\Çş*·','Bolivie'),
('oVs\Z\ÎK¸*‡Lı\Ä$','Bosnie-HerzÃ©govine'),
('°\×k\ÖÉF]\óü\Ü#‰\Z','Botswana'),
('\àm´\×Y\êJK’_\"\ñ{\Z','BrÃ©sil'),
('$M–\ÙHj»¶2h›k','BrunÃ©i Darussalam'),
('/+\Ç\ÏqgIµ7\å:8€™','Bulgarie'),
('X\ê(ZšE¼°9‰Jı\í\0','Burkina Faso'),
('\á\Ã*$I’b\ÅjpÀ\Û','Burundi'),
('•[È\Ö\ÅKŒ£~ßœ²vb','Cambodge'),
('f\é\Õ@bœOO¦‡¦\Ë¬GF','Cameroun'),
('^\ÓÅ\Í+A\ê„)µ†A','Canada'),
('Fd­\Û\Ï\õF‰‹İŸ\'k\à¬\õ','Cap-vert'),
('­ı‰e]°F‡—¾Ş³VPo','Chili'),
('n„sBTK’\Ï\Ö-?','Chine'),
('¦\ÈY\ë@tˆoÿ\ÍXS\è','Chypre'),
('Á½\ÄM¯eD—y–S','Colombie'),
('\ÇŸoM½»¨B>\ğ\ÛU','Comores'),
('aemøjH©¦SWW\ö®m','Costa Rica'),
('\Â\ìıOCo¯\á½)i^µ»','CÃ´te d\'Ivoire'),
('Q¬Z¿¤/H®°Lÿ>¾\î\åB','Croatie'),
('\èPiAA%¾\ã\Ôf~\ÊY','Cuba'),
('¡®%WtÀGK\õº•{ Ë§','Danemark'),
(',t-JSJ‚Ÿº\0¢û7“ ','Djibouti'),
('¤\è\nû\ï\âAº\ìVCT‘b','Dominique'),
('\ñûù\õJ)Lf\è¨6\Å_T','Ã‰gypte'),
('?8œcBÒ„\ç€˜xY','El Salvador'),
('ú)\Í\ÄpH8Œ‘\É/\×n','Ã‰mirats Arabes Unis'),
(' j¿\ëÇ¯M5‘½\Èk=','Ã‰quateur'),
('zC·UB¾\×H\Ù\÷\ægO','Ã‰rythrÃ©e'),
('\îÀiGV€FxŒho›\Ø;\n\ğ','Espagne'),
('<\×\ïZ\ÊC§¸\íºS_\ÊB','Estonie'),
('š‚\É\Ğ\ÜLI^›\ÙZ\í\Ìëƒ¤','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('x#\öß­eIı¸\\#­¯ş&\ä','Ã‰tats-Unis'),
('~†\èX°\ËH®\r>\ê8»\è','Ã‰thiopie'),
('\â\0gIM´³E\åÓƒE—','FÃ©dÃ©ration de Russie'),
('\\€µY\ó)NÀ«\ë\ãW\ê\ä\ğ*','Fidji'),
('0š¦\Ş\ÌB–¦:‡WZÄ¡','Finlande'),
('^\Ú\êU¸~Bv¢\âtd\ç','France'),
('¥\Ë\æ”…Fü¡\èQh@¤','Gabon'),
('´»l\ÚM\÷=%,]‚O\Ş','Gambie'),
('”¬Ùª†\nO\å¡G>.’B‘','GÃ©orgie'),
('£“x¯Hººi\Õn\Ş%','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('\ê«­@Meª8«ª\Ò\Ê\à\÷','Ghana'),
('<5r\'qT@¿¼\î¨˜p\ô','Gibraltar'),
('\01\ØJ\ğ‚ŒV‚­¶©','GrÃ¨ce'),
('\à–B FPšºJ\àtR','Grenade'),
('–L0I+ˆ\Ú,–«gÀ','Groenland'),
('_6TQdF¶§¥ûG\ì\Ñ','Guadeloupe'),
('7¢Uü\İMş¢4§\ÛW3','Guam'),
('¯¯2’f\ÔH*§\ë\Z—ş‰ı','Guatemala'),
('ƒ\öT€AHí«¥\\HDµV','GuinÃ©e'),
('\Ê™X\åzO…\0ÁS\å²\áX','GuinÃ©e Ã‰quatoriale'),
('n2\åı\ÑKÌ‚ˆÿ<¯’\ñ','GuinÃ©e-Bissau'),
('\Ë\ó€&\İMš‹ª®³9º','Guyana'),
('\\2Á\ÙÌAj\æ¿\0&‹\Ş','Guyane FranÃ§aise'),
('\éM\âlEÔ…\ì/ø\Ğ\Ç','HaÃ¯ti'),
('	!—Ã¹I.’~\n†Y\æù\ï','Honduras'),
('jŸ>¶O\ó´ª%µV\æ¼','Hong-Kong'),
('š\Ì}W\í>I\ò“º\ì–A$','Hongrie'),
('\ğm8W¬I.„Áv\öM\à\ìo','Ãle Bouvet'),
('\Ş(¾\âG\ÕC\ç bª`¼º*£','Ãle Christmas'),
(')£vw€Lc±¬\ï¨\Ø2¶','Ãle de Man'),
('0ƒ8—‘CÅ¦qø;GZ\ã','Ãle Norfolk'),
('™…},‚G˜CK\ós›´Z','Ãles (malvinas) Falkland'),
('\n\è*\Í3\ßE †I¾¾½¯','Ãles Ã…land'),
('†…Î»¿N#¼y³#g.§','Ãles CaÃ¯manes'),
('jDabD\ö|zg1-#','Ãles Cocos (Keeling)'),
('xh\Ô\ê€NP‡¿\Ô0ı}','Ãles Cook'),
('\öµ5k“M¢²I\ë9\ö\â','Ãles FÃ©roÃ©'),
('b`pù‚Iš¢\Í/\à\çt\÷','Ãles Heard et Mcdonald'),
('.\ÍK\ÅAA@‰¬Z9µm·\×','Ãles Mariannes du Nord'),
('‚@œ\Ã\ÇF¶ªs·µù_O','Ãles Marshall'),
('\\S#MpŠƒDn*iù','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('ÓƒHaŸD²¥\àŠÀ1','Ãles Salomon'),
('Ó›\'…-B?–\ÚUµ)\Ó','Ãles Turks et CaÃ¯ques'),
('\ö U±\ğ²H3°CE<+0','Ãles Vierges Britanniques'),
('\ê,¤´\áE\ñ»\õª\ñ\0\Ì+»','Ãles Vierges des Ã‰tats-Unis'),
('Qş\Í\' KË¥\Æ>\ô¦-1°','Inde'),
('e\Ê9\×JHÎ©û\ßiiv3','IndonÃ©sie'),
('h¯j?-@6¢Ÿ\î)\Ã','Iraq'),
('n\Ztƒ“ES!/\ñ\Ï\è','Irlande'),
('…%a¯\ÎMª†\ægøY¹t','Islande'),
('XK>;¥C¦§\r<~\Û','IsraÃ«l'),
('€!\ä\è„H,“µ\ã\0‚\Ş}','Italie'),
('\É\àK\rú„Nø\ò|\ôv£¤','Jamahiriya Arabe Libyenne'),
('0td\Ó_EÌ®©-¦’','JamaÃ¯que'),
('dM¶ÄˆJ¹˜U±Û…\î\Ê','Japon'),
('\ÕÖ›\çKE‘«‡)\İ\ñn€s','Jordanie'),
('x&4u\0½EÆ¼nœsŸo¥','Kazakhstan'),
('@p\ZÚ³K¡œ±\Å\ØG±¡','Kenya'),
('¿\ÙJ%7G”¤\"\ê^²j~','Kirghizistan'),
('¾^\Ã\è¥F‚’TN\ã\ÓSª','Kiribati'),
('r\ëJLıM „[\'‡µ_','KoweÃ¯t'),
('o«}G6•N¢¢\÷\ÕU\Ûú\"!','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
(' bJO2·\ê\ë6şÉ¶¨','Lesotho'),
('¯4K\0F)½û\á¬Ü…f\'','Lettonie'),
('P?‹}ŠKœ%Å‹OH\Z','Liban'),
('°9—lƒ\İHË«\ÒwX8-\nº','LibÃ©ria'),
('0\á‡{€‰I0¶`\Ämq','Liechtenstein'),
('¥3bÁ\í!LÖ¦Qª“G*¶','Lituanie'),
('À\"şµ\r1El¿>£…#WÊ©','Luxembourg'),
('ÅV¨©‘B¢³\Z,Û¿\ë\è','Macao'),
('LQ\ör\àK\ìš\Ñ\ég\å‚ÿ\ó','Madagascar'),
('> \à\ŞX\ÃIÏ½E\ê›\ë»&S','Malaisie'),
('\í„\ä\Õ\ÍN£6Jp\Ô4','Malawi'),
('OQ\ô*·|M?‹\ö\Ø\Üljl','Maldives'),
('F\Ì%|v©N£…\Æ\ÊÕ‹ÁfM','Mali'),
('“i`n\ÕQAÇ­\ï\ágKZ3','Malte'),
('hÀ\ÖÁGŸ4\ÌF°u¯»','Maroc'),
('>¨\ßY‡Ck€\Ã;‹„Y','Martinique'),
('M\ĞÎ‰\İLÔ¦cK\"Z','Maurice'),
('\Ø\ñ\è“GM˜ŒwŞ¤Às¦','Mauritanie'),
('[±.ùGC\ö“\Ê\â\ŞÍ,','Mayotte'),
('W\ÍWŠNë¦´üİ®\ô\á\ì','Mexique'),
('h»)\é2I\ô™<\Ãllº\æl','Monaco'),
('‰¢ÌœO»¹§µe&0\äQ','Mongolie'),
('<¯_G{¿¤\rG©4r','Montserrat'),
('\ï	¯4\ÎGÈ³Š‘•\Í0\Ø\\','Mozambique'),
('¦‹0ú3ŠLC°ÿÙ¸¡#9','Myanmar'),
('-\ò\Ö\Øe/N™_\ã\ïwf¹','Namibie'),
('­TDR©A‹\Ğ\ôYf3','Nauru'),
('Í†‡\ÎAX‡\íÿIKw€O','NÃ©pal'),
('\ã!\à\çXSC9µ9K`Êûÿ','Nicaragua'),
('\í\Ø\õ©¸H¸¨k\ß\Êş\×G\è','Niger'),
('\Şe\ÃXCj¶³\æ´ù\Î3','NigÃ©ria'),
('Ÿ”&=3\ŞBXŠHÀO*y','NiuÃ©'),
('se¿ tWE\\\âq0q','NorvÃ¨ge'),
('\åZDj-O©ƒ#‘ººG','Nouvelle-CalÃ©donie'),
('8/¤n.\àBŠ˜FB\Ñsü¿˜','Nouvelle-ZÃ©lande'),
('\åJd\ì‰<H°”ú\Öİ“³\á','Oman'),
('ª½ß§m0Ob”}˜!vY','Ouganda'),
('`NcR™ªHëŸ¶Ÿ\Ìr\ñ\ğ','OuzbÃ©kistan'),
('Ó´\Æ\ó\\—B\"Ÿ\İ\0=¼h','Pakistan'),
('ºK\äšwA3´®\ï«Åªl‰','Palaos'),
('¼ú­\ò\ØFQ—\åÇ¨´W\å\÷','Panama'),
('ü\ï½\'¹\çK–Œ\à\ö\ö0vb\î','Papouasie-Nouvelle-GuinÃ©e'),
('u#`vlIŒG-»\ó8','Paraguay'),
('Tø\ö/ZoFÿœE[^\Ò\ê','Pays-Bas'),
('xù\Úja\îJ>©\r­9\ï$','PÃ©rou'),
('\Ú;¯®:D8¯,K\ÜY\ê¿','Philippines'),
('/:\ÖK\rG»\ß\ÎÎ¸€6','Pitcairn'),
('m\éœA¾N¼£¨‹WS”P','Pologne'),
('\Ïû\ì«Z\âNà³™Z\Ê\Ûf”','PolynÃ©sie FranÃ§aise'),
('©À¾Á\ÔCx›\áÓ»IdX','Porto Rico'),
('\Ø Ş›uI¾™b9I|\â','Portugal'),
('=\"Éù\ÂCW±s\ÊP]h›!','Qatar'),
('ı\Û\Äm\ĞIe¹0bµ­^','RÃ©publique Arabe Syrienne'),
('\÷\ğ\Ø\È9\ŞIÑ§\Óÿ˜uV\Ú','RÃ©publique Centrafricaine'),
('\ÎH´%Y;N—z\ä\ôF¢\ác','RÃ©publique de CorÃ©e'),
('\'1\áHf/EĞ„\Æ\0“Á†E','RÃ©publique de Moldova'),
('ıÔ«3\n\òCu”Ah\ïW%¤O','RÃ©publique DÃ©mocratique du Congo'),
('‚A„¢„\rIkµ\ñ\ôm[\å“x','RÃ©publique DÃ©mocratique Populaire Lao'),
('³FG6œM\ï†	v»\ŞM;[','RÃ©publique Dominicaine'),
('\äíšªcCØ»,ùon}–','RÃ©publique du Congo'),
('m˜\Ãx¯@İ‰.–f£7#\'','RÃ©publique Islamique d\'Iran'),
('“ÿ¦\Ş\ÒH€\ô”—mh\èP','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('\ŞŒ\òTK@•™2v=€R‚','RÃ©publique TchÃ¨que'),
('\"+<\rgaO\àªú½´w\ì\Ş','RÃ©publique-Unie de Tanzanie'),
('\Ö\ñ±\ÕC8Nß‡w8½j°','RÃ©union'),
('!‹3\õ]D¬´\Ğ5Nš','Roumanie'),
('À•¾®\îaA °`;A(%','Royaume-Uni'),
('\01\È\íI@,?]\Z_','Rwanda'),
('E,ø€c\àG…¸?ºP\à-','Sahara Occidental'),
('f\ä\"egˆC°“\Ì\ÊUŸÿ\ö\Ş','Saint-Kitts-et-Nevis'),
('GÃ¯Hq˜a0\0›°\Z','Saint-Marin'),
('¢xJ‹\ËNL7³©o:;ş','Saint-Pierre-et-Miquelon'),
('ã¢³Z8I­¾8SÏ¾\rF','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('¶1!\0¾sBÎ£D!¦y¶6','Saint-Vincent-et-les Grenadines'),
('8k(G\îD\í»Ñ¼Ÿ\ÇV¬z','Sainte-HÃ©lÃ¨ne'),
('&«\rr¥G;£H\æ=\Ì\\','Sainte-Lucie'),
('\×\äš\ß{@çŠœU\ÌyK','Samoa'),
('W0Â°…J´š;hh_¥´','Samoa AmÃ©ricaines'),
('}¹ÓD\åšA{æ°¼mq','Sao TomÃ©-et-Principe'),
(':¬/ûL¡ª)\ÃLˆ\à¹','SÃ©nÃ©gal'),
('İ–ºÊ¦ OC·]Wv\×Ú€','Serbie-et-MontÃ©nÃ©gro'),
('oV\Ã@Ë \Û6ß‘\0','Seychelles'),
('\ç‹yªTD\à‚mF®d\à2D','Sierra Leone'),
('nùF\ëNHDZ‚%•\ÏIp\â\Ì','Singapour'),
('\à‘£˜/\nHŠ§>Ñ¿sHQ','Slovaquie'),
('.ùÿ\é’\ÉIãŠ¥$”\Øÿi','SlovÃ©nie'),
('J<o¦\"CD\òŒ\äuú/¨…','Somalie'),
('^\ö\ÎB%@İ³3=¤¼\Ë','Soudan'),
('B^,\ÅWiE\ö›“¦Šfÿ¨ÿ','Sri Lanka'),
('\ÑSr\r«\ÏE¢\'T˜fµŸŠ','SuÃ¨de'),
('\ó¼’O\äš@\ä¦ÿW+e‹','Suisse'),
('‚FARkGN;µ\ôš¿¹S','Suriname'),
('\çšÀ‹\íBÄ¨³7u@¹¦','Svalbard etÃle Jan Mayen'),
('\\€ˆ§2aE\å¹\án=”\Åyt','Swaziland'),
('–º#¬E\ÙNâ¯¥~\ôy\ñ‡','Tadjikistan'),
('\ñß±	HFÂ\ÕzX\ÒJ','TaÃ¯wan'),
('»`k+]\ÓEË™\r/+‘‹s3','Tchad'),
('S.i.\ÈDR–¯\'‘ª‹\è','Terres Australes FranÃ§aises'),
('\Ö›KLJNx¢Â¹Á\Î^\ïx','Territoire Britannique de l\'OcÃ©an Indien'),
('r\æ˜.kF\íšE\á\r\ï{<\Ç','Territoire Palestinien OccupÃ©'),
('\í¶R$)<E9\÷µ1\Ï\è','ThaÃ¯lande'),
('Tg=|¥\'J -\ë\Î5©¸\Ü','Timor-Leste'),
('­j&ºI3¡o.\Z»©	\Ä','Togo'),
('yf{Ÿ!A‡f\r‹F†','Tokelau'),
('\É\òzƒorOæŸ¹U,\çpT','Tonga'),
('£Àâ»¾¤@ÁŸ	€¶\ë“ü','TrinitÃ©-et-Tobago'),
(']’•vùD…‹TS#‚}','Tunisie'),
('\ì»Fh]I‡»bk2No\r¦','TurkmÃ©nistan'),
('£vZ\â¾E‹»\"“B\ï)Q','Turquie'),
('TŠ`¼E.D6¶OW6h¼','Tuvalu'),
('ù†!H\ãvAt†$#y7<','Ukraine'),
('k<\Ó\ÓLz©N°\ãÛ©\áe','Uruguay'),
('\é˜\î%rO]€s \ÎÁş\Íü','Vanuatu'),
('1\ëj«şšEi´\rø„À®','Venezuela'),
('x\'”Q¶-KÍ…\Ş\ÃJ\åD1G','Viet Nam'),
('ŠÜ¬JºGV«%—Q{¯¶`','Wallis et Futuna'),
('\âø>®ÿ\"IÉº„{X\Ì\Ç.®','YÃ©men'),
(']ªø>\ÍMKÀ§onOgLs','Zambie'),
('\ğ:v«smF†¸g1\Ú\Ø+\n\Ã','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-07-14 19:38:57',3),
('DoctrineMigrations\\Version20240201152951','2024-07-14 19:38:57',4),
('DoctrineMigrations\\Version20240202084749','2024-07-14 19:38:57',2),
('DoctrineMigrations\\Version20240202150901','2024-07-14 19:38:57',1),
('DoctrineMigrations\\Version20240207105701','2024-07-14 19:38:57',4),
('DoctrineMigrations\\Version20240319212437','2024-07-14 19:38:57',2),
('DoctrineMigrations\\Version20240614133504','2024-07-14 19:38:57',11),
('DoctrineMigrations\\Version20240617165906','2024-07-14 19:38:58',8),
('DoctrineMigrations\\Version20240708061729','2024-07-14 19:38:58',12);
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
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitation` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `tasting_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `target_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `sent_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `link` longtext NOT NULL,
  `STATUS` varchar(10) NOT NULL,
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7','\É5?0O¤…€)\\¦ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending');
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
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
INSERT INTO `tasting` VALUES
('.¥l5‹¹LnšI½y\Å\ñ7','™d\å9ÿF³œÿ\Ö\Ñ¸·','^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]'),
('–J<¸_½Fx¥\Í\ãqÀ§\"','™d\å9ÿF³œÿ\Ö\Ñ¸·',')R1„ú\ÎN…‚7\ÍP\î','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]');
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

-- Dump completed on 2024-07-14 19:38:59
