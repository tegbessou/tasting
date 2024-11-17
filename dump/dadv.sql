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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',259.99,'2024-11-14',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-11-14',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-11-14',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-11-14',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-11-14',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-11-14',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-11-14',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-11-14',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-11-14',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-11-14',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-11-14',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-11-14',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',1299.99,'2024-11-14',NULL);
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
(' ˜\î\ÄAÑ—û\â/\ÙÁ±,','Afghanistan'),
('no\Ì<Ì²D‘›r?§\ì','Afrique du Sud'),
('P\':ºC×¢%\éQ\Ì\İ','Albanie'),
('QT9Œš\×H!¿Ş‚’e#‰\Ø','AlgÃ©rie'),
('“1\ô\áAf³•3±!~','Allemagne'),
('\÷¼>O\ì m\×Y\ò\ëS¤','Andorre'),
('\ÆCq>L·Ÿü<Œ','Angola'),
('\ì5\ó\ØúM\è¹:$À²\Ğo','Anguilla'),
(']\åEyº²¥)4','Antarctique'),
('œV¼VNüB\ë»\Ùú?¨G~\Â','Antigua-et-Barbuda'),
('…¯4\Æ\ê#NÕ°TR\Z\ó‰\Î\Î','Antilles NÃ©erlandaises'),
('\\§¥y@n³\Ş,wYvW™','Arabie Saoudite'),
('©\ñ² F¹ı®¸@É¥','Argentine'),
(' nE¶?Ja‹¡ƒŒc‚u3','ArmÃ©nie'),
('¹,5Å¶gJ¬´Š\Íı\Ã','Aruba'),
('\ö‘…aÁ%M‰\0™\ßXR\ó','Australie'),
('\Ö|\Ër\ZHmŸ¼`¬aş\\','Autriche'),
('spS?;\áO\õ–i\ÆG','AzerbaÃ¯djan'),
('§úùM› DÿÁÅŠ«','Bahamas'),
('ë®ŠúRJG“ª0\ÃüE+','BahreÃ¯n'),
('M5!Ec\ÅJ\ïŒNz5n¦','Bangladesh'),
('y_¯ƒ«A\"˜3[E¡Ÿ•c','Barbade'),
('XK·ùÂ–G~¡¨§\Ï ¦v','BÃ©larus'),
('ˆ9nDI\ßJ\ñ™yqU‰¬Œ','Belgique'),
('\×xı@İG•¦Òƒ\Åq¢[','Belize'),
('Á\æ\ósŞ‚Fƒ²€¢]ø','BÃ©nin'),
('¿\ôxL\0•Lù¾	²¿\ñ\å¼','Bermudes'),
('\ñƒJ´GJ¶\'jt`WQR','Bhoutan'),
('>±¡2I\â´$#’º¡L\Ï','Bolivie'),
('\ÍrP½$mFŸ•$lp\Ó2z','Bosnie-HerzÃ©govine'),
('©+\ç\Z`±G ‚=	\Õ{«\Ç','Botswana'),
('eWg=YUM\ê»DB\ËUE³)','BrÃ©sil'),
('q\ò\Ó*6He“ˆû\Ø	\Ã','BrunÃ©i Darussalam'),
('\ËK¨ksG¬úwª\îşqj','Bulgarie'),
('kUüø¦œK‚£\ruÑáƒ³','Burkina Faso'),
('\0\á3ODªº{DÿHX\Ü','Burundi'),
('şZƒEg‘l}*\Ù,','Cambodge'),
('¿•/›¨4H}€\÷ø\ßA=\Ë','Cameroun'),
('\ãŸ\r*.Ii–\äŸ¡\É\ç\é','Canada'),
('\ï´\÷gCd½Œ,¹ß…Ë²','Cap-vert'),
('`;s\×aM#^\Ç=®F® ','Chili'),
('BşGiE«\ìZ:\n\é\Ë','Chine'),
('½€ıJN$¤e6b¿z/u','Chypre'),
('[4Z	\ÚLD¥;¦7‚û\î','Colombie'),
('¡xm$B0—q\Åt°‘\Û','Comores'),
('1-RTF.‘fv¸›Œ:^','Costa Rica'),
('&–4\Ãû\ÎM\ğ½wË\îl\ô','CÃ´te d\'Ivoire'),
('²\ÛhJ&‚\Z`1}§ú.','Croatie'),
('¡Pa\Ë\ãN–™¸ª7&~n','Cuba'),
('3g¯d\Û\ZJ\é¹Å™\Î­$','Danemark'),
('£$30\Ü:Ic¼ë›¬£\Ü','Djibouti'),
('¤\\İecHÒŒ\è\è\ç[¿ ','Dominique'),
('fù_¥”A ›\Î\÷+\×K*2','Ã‰gypte'),
('\'¼\ïo\0ZAc°<9+I@Œ\ò','El Salvador'),
('¦ƒ7Á>şFˆ†üz¸Ûœ³','Ã‰mirats Arabes Unis'),
('DM#jZ\rN¬“‘A§Mº','Ã‰quateur'),
('-Aù2C»¯\õ¢üÇœ½','Ã‰rythrÃ©e'),
('\ïN\É5A›\êş‰ª ','Espagne'),
('3 ¦†\ÌA†7ş¾\ìå°€','Estonie'),
('\Îùdj\ëJ–¿J‹w\î\ãF]','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('E\÷³\ã. CÁ,\\\Â\÷D›','Ã‰tats-Unis'),
('’Àÿ¤Œ\ÆI]¨]\î…ù¸Å™','Ã‰thiopie'),
('µ\0¡Ã®@M6°ƒ\Æ\Ü\ò~','FÃ©dÃ©ration de Russie'),
('©>“\ËW\áJyÌ‘º\ô','Fidji'),
('\"Ct‘\Ğ\áLt»€\ĞT\ß\Ğ\Ë','Finlande'),
('$ˆ9\İqK…d\×b=\Zn','France'),
('Eœ‰\ñKW+L¯	','Gabon'),
('(\íN=¼Oú½¬µ\×\Ú\Ë\ÈP','Gambie'),
('}ãŒ¡\á@˜›Xµ2y\Ôh','GÃ©orgie'),
('\Û\éywIw„WX\Äáš','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('\Í\ëe(\æ3Ld©¹ ®’—','Ghana'),
('l³·‹}ÁK¹BhûT\íŸ\ô','Gibraltar'),
('\Ï$j\Ú)!K\è‚H—w”\ì\î','GrÃ¨ce'),
('‡z\é¼muGo€@\ŞNl™+','Grenade'),
('oh=\î\ØüJg˜»\nC\\ÿ<\î','Groenland'),
('\Ò\"OaMŸM\ä>\Õ=®','Guadeloupe'),
('H#ü\Ğ\ÚK·“€Á0\áœ','Guam'),
('œoc\ñJ‚I\â€XDG+	P¸','Guatemala'),
('\Ú\õo\Ş\ÊME¹1*\í+Ÿ†\ê','GuinÃ©e'),
('¶¨3\éªDM½Šd\ë8ehß¥','GuinÃ©e Ã‰quatoriale'),
('¥Ÿ†HT\Ñ£Jù','GuinÃ©e-Bissau'),
('¹R=µ¦L“²A\ÛhXHg','Guyana'),
('©\Ä\Ïx\ÒAA˜ˆyo\Ê;D','Guyane FranÃ§aise'),
('¹dÏ‡R K¹x\Û\ßat\å\ö','HaÃ¯ti'),
('¾<5û>C…œ+’\Ç\Ú9)','Honduras'),
('L(\nK\n@È°¨H0‹@À\×','Hong-Kong'),
('p\Şr0Ó†Cë‹„ş\Õÿ','Hongrie'),
('ú\'\ÓWxI&¾‹pŒ\Øk^\Ï','Ãle Bouvet'),
(']ªM\ì\õ@\ï®G]\×ÿ›+¥','Ãle Christmas'),
('&/­\ç|Dß¬\ó©\í§\õ1','Ãle de Man'),
('½s¬SœD;¼\Ü\ÊE©P','Ãle Norfolk'),
('\ô\ñ\Ï\ñ\0aHcˆ`/G0½İº','Ãles (malvinas) Falkland'),
('¥¾\ï™ÏƒG´½4X,\İ\Ç','Ãles Ã…land'),
(';u\Ğ2@e£\Å\çŒ','Ãles CaÃ¯manes'),
('\r)™¥C\âIÚŒ3^ø›Ò²','Ãles Cocos (Keeling)'),
('Ì…>1I»Og¾\Ç3u0\ö','Ãles Cook'),
('ü\'”e?YA«\ÇÛ‚9M‡\ä','Ãles FÃ©roÃ©'),
('\Üà·”\äHMx½á‡¼ªN|ş','Ãles Heard et Mcdonald'),
('N¸©Ap\ÇJÇ§<9:R','Ãles Mariannes du Nord'),
('\å\äı4\ÚDHÙ©\Éuü\n/û','Ãles Marshall'),
('\Ø\İ\Î\nEƒ·F\â\ö~o\Í','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('\'–™D	C¨­\ñg”Ÿ¨\ìv','Ãles Salomon'),
('\æ\Ã\á–\Ñ@0¿N\Ó²{‚v','Ãles Turks et CaÃ¯ques'),
('\\\"\È’AÁ™«nrn¢','Ãles Vierges Britanniques'),
('ƒ¾U\Æ\çLW†•Q\ÃYl\ì|','Ãles Vierges des Ã‰tats-Unis'),
('Z€¬\Ï\ğL8Œ\Û\İ¢•³d','Inde'),
('\×Q0|RIB‰\Êû\Âv¡\ß','IndonÃ©sie'),
('Ãª­A{ŠHŞ£*&t«S?0','Iraq'),
('‚mûWt‰J‹„\Ü\ö`®h\ì\Ó','Irlande'),
('”\Ş*Ê·G’€~.y6˜','Islande'),
('T$4…\ôK)™0¼„]n','IsraÃ«l'),
('a9•ùX?JT—´ş…¹jŸj','Italie'),
('`\ê–\Ø`–M!¸4\Ö\öeü','Jamahiriya Arabe Libyenne'),
('\Âx\ô+¿E/¿hO\Är','JamaÃ¯que'),
('>Œ<eO3®€¿€“ú3$','Japon'),
('\nÂ¥Y@	7}WÔ†','Jordanie'),
('ğ±ƒ¦¥\Ò@}¤p\àıê‚’','Kazakhstan'),
('ù‹\Ù\á/D8ƒ\ÅrÁ¤y‹','Kenya'),
('¶øº‰DAÇ¯¡4´ùZ-','Kirghizistan'),
('!b\ä\äQF)¶£™P\Õ\Û?\ï','Kiribati'),
('…\Ü\Ü;\÷F\æ“\âë¦i\ê','KoweÃ¯t'),
('[&\Z^rMv’:\Ş\Z\Õ\òš','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
(' y\ÚZC£†|?¯\Ú\n°','Lesotho'),
('%‹)¬2!Kı·XŠ/S€J','Lettonie'),
('0ıR:\ÜO\ğ¢ëŠ®	üsl','Liban'),
('N[g\×\"\ğON¥\Ä}a%\ã','LibÃ©ria'),
('MĞºSx\rCÿƒw“„ta£','Liechtenstein'),
('¿98¸GT´5\ì\êo\Å\Õ','Lituanie'),
('‚\ÔBû’0KÑ†¦ P\'l\å','Luxembourg'),
('FZü\Å2IÔ¦Z2\ãÎªf\Ô','Macao'),
('œŞš\ñK¸B ú\Ü\Än™\Ú','Madagascar'),
('PS`KO\âO!±«½”…¤ùW','Malaisie'),
('­n\ĞeANÁ“k\èj—` V','Malawi'),
('\ÆP+A\ĞVIş•mx$\ãE','Maldives'),
('\á]\Ü\ã\×>DÔ‰,o¡\ÔDµ”','Mali'),
('8Š\ß%lEÖ”\Ï\Í®x','Malte'),
('\Ä_€\ËV!Jü•8ÿ0\Ò)\è','Maroc'),
('–D\ò\İjIş¶¡k2','Martinique'),
('\ÓÅ \ñ\×L¬• 0Ÿ©Œ\rı','Maurice'),
('&0\çµWJ¶Œ!Ô¨§3?_','Mauritanie'),
('U\Z\Ù~µB ‚—:`«\Ñ8','Mayotte'),
('\å»G[¥µO‰¿L#\Ê^¤\Í','Mexique'),
('\å‹\Ğ\õ‚\çJq¸†©\ğ\ßdk','Monaco'),
('À;\Çt±/F–«Ám\Ã\İşb','Mongolie'),
('L\ævcg‰A.‹\ÎR-ù','Montserrat'),
('\É!\ÎS3“D5“\Êü\ñŒs“','Mozambique'),
('\Ò‘E¯°Nw¬mµ„ºŠ\ç\á','Myanmar'),
('ÿK\ép\ÉxL‡œ½“3\Ê[ù„','Namibie'),
('\òr:‡Gü£G\â¶0¨','Nauru'),
('½/¿1\ïB\ñ˜\ô¾%{ı\Ø','NÃ©pal'),
('\Ş\r\Ù	z\ãA)œ¡a\Ğ\Ós\Â','Nicaragua'),
('%\ã\ŞN‰Iw†{H…•Àß¯','Niger'),
('%\ÇY6\r”KNµLÛ‰d\Ü\à“','NigÃ©ria'),
('w–³yH_G_¢²b`¥œ\Ö\Í','NiuÃ©'),
('\Ï8I“n\ÃLÏ—ZjS˜\à\ç','NorvÃ¨ge'),
('k\ë±]<M\r£½\×DÏ…\Ûp','Nouvelle-CalÃ©donie'),
('?°\Ï\ïşyC\r«\ÅZE¯§e','Nouvelle-ZÃ©lande'),
('‡)fa\ÉO¡»Ì¤\ËÕ£/\õ','Oman'),
(')\ÓvlBgOØ¦JşOü¤´·','Ouganda'),
('1\ÕC!‘FÉ¸ˆ\éu\Z\å','OuzbÃ©kistan'),
('¨3G\î¥Y%‡F»W','Pakistan'),
('Wv\ï”\èG³¥s\Éh)³W','Palaos'),
('\î¨,\ãOF½Ÿë™D]]V','Panama'),
('\ÊîŸ°™\éG¡ÿ\Ï0)¿ù','Papouasie-Nouvelle-GuinÃ©e'),
('*rm\îÿ@Â¼G,…\Ü1','Paraguay'),
('ş>>/ú\ØF-¾\Î5b^\ç','Pays-Bas'),
('¾º°:\ğ®I>·)]¹\">„£','PÃ©rou'),
('\Í^U\ê·-B§0\õp\Ñ\äu','Philippines'),
('@Y\á\ÛuIp˜Z I%\áE\ê','Pitcairn'),
('\êB¼%_N6†d³Ÿ¯ÿ','Pologne'),
('Ô¹-uºNh“¡w\ã*hÁ!','PolynÃ©sie FranÃ§aise'),
('$Ia±\ÖL©§³Ue{k','Porto Rico'),
('7^WµVI\òƒ*\ïú#','Portugal'),
('0‡* FÖˆ2†&»Xy','Qatar'),
('\÷ÉœKq\ÇN\à‚N´€\÷\ğÓ¤','RÃ©publique Arabe Syrienne'),
('\Ñ\Í\ÅAAÖN\Ñ\É\ï\Ä','RÃ©publique Centrafricaine'),
('\ö°\ÅC¥F‚‚\à\n\à\ò\æv','RÃ©publique de CorÃ©e'),
('!\áü\Ä+#Hı€”\÷‡„A{Œ','RÃ©publique de Moldova'),
('ÁI\È\"B¦\ÎüŞ–‚e','RÃ©publique DÃ©mocratique du Congo'),
('\à=´°@—GÓ»Q²j5À','RÃ©publique DÃ©mocratique Populaire Lao'),
('\Ô\Æzeú›HV¥\ğ\Ì\áNº','RÃ©publique Dominicaine'),
('<W\İ;\ïKG·\ò•\\&¥\ë','RÃ©publique du Congo'),
('\á\ÔOÄ¤I_³·‡\ÌpQ\á','RÃ©publique Islamique d\'Iran'),
('\åo\"PS,L‘`\ö»P²','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('‡!“—3{N„Œ\ÜÀdz','RÃ©publique TchÃ¨que'),
('¼\ÈI8˜PH½š\ôiU\Âû>\\','RÃ©publique-Unie de Tanzanie'),
('\òfs£…GS$G\ñMu','RÃ©union'),
('\ó\n½ú»øO0£Ö”¥?E\é0','Roumanie'),
('we`‡A#ª\r(\Ò\Ê\ç','Royaume-Uni'),
('\Ş#7²É¶MÖƒù0£','Rwanda'),
('5NÃ™\nK7ºRx¸­’˜g','Sahara Occidental'),
('V\\{¨5A&´ho¥«I•¦','Saint-Kitts-et-Nevis'),
('…t+{*ŸIm’8\é\òj@','Saint-Marin'),
('\Ô\ö\",OMN¾A]·eÌ‚‚','Saint-Pierre-et-Miquelon'),
('&B&·x,N“\ÊBs™ÿ\ê#','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('V\ô\Ëk\×IÉœe±\rMS*','Saint-Vincent-et-les Grenadines'),
('4]\è\à[C•…µT=ü·','Sainte-HÃ©lÃ¨ne'),
('L±\é\ÎÏ¿H\\¥z\ÃI¾\é','Sainte-Lucie'),
('\ã{®t\èG¾‘»p(üe¦y','Samoa'),
('\ïµ,…b\ÙDü›\ËyC\ï\ÈU','Samoa AmÃ©ricaines'),
('\õx‡\İûYB¥ƒ[Y¹¦[r','Sao TomÃ©-et-Principe'),
('ÿŠm°c\éHVª`\è¡\ÔU','SÃ©nÃ©gal'),
('d™\îé›D\÷¡C\ï`(v','Serbie-et-MontÃ©nÃ©gro'),
('‡/\ëQ\ÈG\ñ¾(\ãûä®½','Seychelles'),
('ºB\íš¸Gd“²\Õ+c\Äd€','Sierra Leone'),
('k\á\Ã\å@\ÊL´¸\Ümû`—','Singapour'),
('gš‘~ú\ÙK²€>™ol\×','Slovaquie'),
('&MŠ\Ñ>EuŸ‡gÁÈˆw','SlovÃ©nie'),
('^•¾b_hHä“¤”T*l†\Æ','Somalie'),
('\ÍPŒ\è\ÔDX¿A\Éøi»\Ì\ò','Soudan'),
('\Õ\Äø	yıKm«\Ée>†\Ç{ˆ','Sri Lanka'),
('¡Õ®K\Ï	Gy®\ÙÉ·[','SuÃ¨de'),
('«(f\Ñ\ÅG¦¦\ÆE³–\Éş¸','Suisse'),
('\Ñ6\×CM5…’\ßT\õª*','Suriname'),
('\ØFSv”«@_¦ K\çAm»\Ç','Svalbard etÃle Jan Mayen'),
('\à\Î\è\ÜTLq¥\Ì\ç\è%l<L','Swaziland'),
('9A²’\Ê\ËEA¹9\ŞeY‹_š','Tadjikistan'),
('ªv•úGXAF¾\ò†³\\f','TaÃ¯wan'),
('9À²mL¾±\Ù\Å\é:R','Tchad'),
('c²\×FM‹¡†h#gYÿ','Terres Australes FranÃ§aises'),
('ø\Å[>“O{´ Å³;\ë3P','Territoire Britannique de l\'OcÃ©an Indien'),
('\Âv®(\ÜøOt¤Edùz£\"','Territoire Palestinien OccupÃ©'),
('£8\ë\åH\ÖJc­’œf<\÷U','ThaÃ¯lande'),
('{»—\ãvO±¯QbW \ß\02','Timor-Leste'),
('*ü`\Åú‰A’Ü€ET6\Í4','Togo'),
('\ï‹ü¹\Ï\îL¿c±¾“XI','Tokelau'),
('²\Ù\Ï[\rA—¸]‘\Æ.Šª‡','Tonga'),
('¤…])\âJ2»\õ?h\ó ~§','TrinitÃ©-et-Tobago'),
('¸>@_\ìHø²@ŸJ6\à\Öp','Tunisie'),
('z\ñ\ÜyX\ÙO-ƒÕ±¯0/','TurkmÃ©nistan'),
('k\çDj‚aˆ#\Â0','Turquie'),
('#\Ï5!/OUŠ\Õ_b\ôp¯','Tuvalu'),
('%q‚²\à­B\á·ùÿ¹\Ç\0—\á','Ukraine'),
('\Èßá»´Kx¼@/ûÿHE\ñ','Uruguay'),
('şV‚°Q\ÃA@·¶X\"Ø™Á','Vanuatu'),
('®7\÷%JÙ¯œM<QÏ‘','Venezuela'),
('I\Ò\î¦/O\õ²\0ˆ&¿Q0','Viet Nam'),
('\Ô\İÿúSF‘$	ÿ‚´`','Wallis et Futuna'),
('‰‡ÿØªF—¹)b\0HG®E','YÃ©men'),
('>\ò¸ºBç…ŸCü:5q\Ê','Zambie'),
('m—\Ğ\âH\'AĞ¢6\Z\èrù’%','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-14 19:50:39',3),
('DoctrineMigrations\\Version20240201152951','2024-11-14 19:50:39',2),
('DoctrineMigrations\\Version20240202084749','2024-11-14 19:50:39',2),
('DoctrineMigrations\\Version20240202150901','2024-11-14 19:50:39',1),
('DoctrineMigrations\\Version20240207105701','2024-11-14 19:50:39',4),
('DoctrineMigrations\\Version20240319212437','2024-11-14 19:50:39',2),
('DoctrineMigrations\\Version20240614133504','2024-11-14 19:50:39',10),
('DoctrineMigrations\\Version20240617165906','2024-11-14 19:50:39',9),
('DoctrineMigrations\\Version20240708061729','2024-11-14 19:50:39',13),
('DoctrineMigrations\\Version20240801202153','2024-11-14 19:50:39',2),
('DoctrineMigrations\\Version20240815153823','2024-11-14 19:50:39',2),
('DoctrineMigrations\\Version20240916065051','2024-11-14 19:50:39',3),
('DoctrineMigrations\\Version20240929091802','2024-11-14 19:50:39',12),
('DoctrineMigrations\\Version20241002164506','2024-11-14 19:50:39',7);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7','\É5?0O¤…€)\\¦ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-14 19:50:39');
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

-- Dump completed on 2024-11-14 19:50:40
