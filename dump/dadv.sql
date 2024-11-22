/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.10-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv
-- ------------------------------------------------------
-- Server version	10.11.10-MariaDB-ubu2204

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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',259.99,'2024-11-22',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-11-22',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-11-22',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-11-22',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-11-22',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-11-22',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-11-22',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-11-22',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-11-22',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-11-22',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-11-22',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-11-22',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',1299.99,'2024-11-22',NULL);
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
('Hr–p´£Ht’JH™sCqG','Afghanistan'),
('nv¬…­Dš½f\é\åV','Afrique du Sud'),
(',.7?~´K.™f„^\ØC\í','Albanie'),
('€ y-Dš¸2Ÿ\Ö_A\ìP','AlgÃ©rie'),
('¦©‘M\ò1DÛ¢U\ZU•','Allemagne'),
('\îD· MO˜l4)\áÅ´ù','Andorre'),
('L2MÆ‹bH ¨J2','Angola'),
('\'fÒ±}¹J?˜`™^xQ','Anguilla'),
('2]\ÙúJÃ‚\ô€\ç3\ì1c','Antarctique'),
('{^@\ğK\ä¤6¬\Äş(‡0','Antigua-et-Barbuda'),
('\åM\êTADšI F²º¦ ','Antilles NÃ©erlandaises'),
('+¼\é¸úNt³\ÆXi\í','Arabie Saoudite'),
('\É³³¾\äAÒ“w†\Ñ\'“U6','Argentine'),
('\ä=À/#EÜ©øzVl\\š','ArmÃ©nie'),
('\Zÿ¥\ÈK=”\Ï^`û\í\à','Aruba'),
('Ê‹\õw\ÜqA¹U\×^cRI','Australie'),
('w7²qvH€­	\î4V°±','Autriche'),
('«\ZlB\ôJŠ´2\ñ\õ\nh','AzerbaÃ¯djan'),
('\Ï\ÌdRJ‚«r®”[-¿\Ò','Bahamas'),
('­PºdP1GØ€afz>·\Ğ\Ù','BahreÃ¯n'),
('­›¬D†Œ\ãY³Øµ2ø','Bangladesh'),
('sş\0e†\ÚLI¬Ş¤Bıüƒ','Barbade'),
('\Ç\çR²{TM%°\ÆJ‘*\Z(','BÃ©larus'),
('0~\×\Ö\óBNµ¬ToR¼¦','Belgique'),
('\Ç\ÑDv.-B:£J,7‰I','Belize'),
('bB>†£\ÔFj¯\\„\ÓhM','BÃ©nin'),
('\éd@7XFƒ¢>\'zqVVq','Bermudes'),
('9>\Û\ğ H¶¥\Í&4¦?y','Bhoutan'),
('¾`\ä;F¿I6¶1\÷	\ô\õ	Š','Bolivie'),
('v\å¢Ò«\çI\òŒ0jã®©ü\Î','Bosnie-HerzÃ©govine'),
(';¤;lµM‚s.\Æ,\ì\n','Botswana'),
('9“\ÔDX\ÉF%€¼ŞŒ\È??','BrÃ©sil'),
('P`—i\ÏOŠˆ»s0ş%n','BrunÃ©i Darussalam'),
('B×‰wÎ¥Oi«I2Œ\Ñ5~','Bulgarie'),
('ûø€\İ\å¿C6¦dG~,/|t','Burkina Faso'),
('f® ?–@Ü \íÈš!ø\é','Burundi'),
('·ƒ\Ö$ÀF)ƒ\á\ä[¬±\Ø\õ','Cambodge'),
('o”™\Ñ\ÍE\é²ı[\Ø.yH','Cameroun'),
('\òQ\Ö\ÏÿcEª´·\Æix¶«','Canada'),
('¬8\â=ƒD“zE}^+™?','Cap-vert'),
('5¢¢\õ9J—¬\ò¿\ç_ªk','Chili'),
('˜½pN\æ¬X±ˆ™¸','Chine'),
('\ÕE\ğš^¦L\ò³4p\Ñ\àb\É','Chypre'),
('F\é³\\r\äGqˆ´ÿK¾n\×@','Colombie'),
('’»Ç¬\ã®G{Š\ğIG\"¸\ô','Comores'),
('EK¼\Ô@å«”.\Ú\ò\ÊAû','Costa Rica'),
('NŸ¨¥‚GÏ”+6mÁ!®','CÃ´te d\'Ivoire'),
('K\í-:\ğ“F4¥Š„ƒ\Ã3\Æa','Croatie'),
('(¬zA]iI“¶,¿\Ú\Zv','Cuba'),
('}ú ¸!\ÑO¥¬zÛ†','Danemark'),
('ø&\Ã\É\ğşL\"—1Ï•¡&\Í','Djibouti'),
('\á$)GøDÊ’7Â™‰!i\Û','Dominique'),
('J\Şü‰\êMü§S€y-¡Ë´','Ã‰gypte'),
('}\0_\õ:¶C\ë…\Ä¦\ÈM4ù','El Salvador'),
('2\'ÍD\ÉMÃšjÿd×€|','Ã‰mirats Arabes Unis'),
('M\ç¥\ËıM\ò\×\Ø\ô\'\Øz¨','Ã‰quateur'),
('\Z\Í\ëpŒ\áDY²¯\Ñ\çÃ’5','Ã‰rythrÃ©e'),
('i˜\rFÄ‘L¬\á…½C½','Espagne'),
('Imk\é^G®-\ïŞŸ–Ìº','Estonie'),
('ÿ:\Ù\Ã\ÇN\çµ\Öf±£bS\Õ','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('\ÏGu\ğ¸>Iº\Ğ\÷-V£”','Ã‰tats-Unis'),
('·\nL˜\èD ¦ÿ1®—\×O\â','Ã‰thiopie'),
('3@[UgJ©¡%Ã¦\Èww¬','FÃ©dÃ©ration de Russie'),
('`^:L0AJ„\Ô`\ÊU','Fidji'),
('P¸F!ı¯C<¼>^\ãN——','Finlande'),
('\éù\ß\\\ôE\r—\ÚRü\Ñ\Z\r','France'),
('¿…˜“ªC×…­ua¢*','Gabon'),
('Fuu|AQ©8¨\×P\\¨','Gambie'),
('\ó\÷Éº§\÷HÚ¿w%\ë¯\n¤','GÃ©orgie'),
('_¨œª–Gù†Q\Êb\î£„','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('´rY\àOPŸd™\Ş','Ghana'),
('®™•ZYpI1°¦’jXŠc“','Gibraltar'),
('A&®²«¡I‚²\"RA \Ï!','GrÃ¨ce'),
('Ó…`z\í\ÑA|·¯øú¶{½','Grenade'),
('8(£\Â\Ä;Ox¶ø“\æ¤EJ·','Groenland'),
('M”!ÿù\æC¾˜X¸?CŠ#z','Guadeloupe'),
('Íœ¹‹ O´\r§’)?\'^','Guam'),
('‡}*\ÅÈºAÕ\'°bh¾','Guatemala'),
('z·ƒX¶eCo•6{\Ş\ãšŠ','GuinÃ©e'),
('\Åèªƒ³\îK\îˆ\Ô\Ø{ \ğù3','GuinÃ©e Ã‰quatoriale'),
('Á\×\ão1\ÖCÒ°º¤{Ò»eU','GuinÃ©e-Bissau'),
('L\÷¤ùÀTHB¼OB£y~«;','Guyana'),
('š\í\Ù›A\"‚\çEaş\'Ğ«','Guyane FranÃ§aise'),
('º¥’‰\Ç)L­£›j\Õ\÷}p','HaÃ¯ti'),
('pµq8\0YKz¥²9Y§','Honduras'),
('˜‡\ìª(F\'½/½\Ñ-¶\Ô','Hong-Kong'),
('\ç\Ñ\á#8IY¨–Eƒ\÷Ù‹','Hongrie'),
('Fj—\ÇÊGeG:GL¾#','Ãle Bouvet'),
('Œ1Uø‡\ÅH5»¿;b–W½W','Ãle Christmas'),
('´\Çm\ômI‡a\äO4N\n','Ãle de Man'),
('?€Xƒ@‹†°¸‰}İ­','Ãle Norfolk'),
('d¶;\òü\0K˜Pø{«¼','Ãles (malvinas) Falkland'),
('\Ùcrø¥B£Ooeeƒd','Ãles Ã…land'),
('\n\ÈĞ¬Eê¶•\\’¶\Â\Ê\\','Ãles CaÃ¯manes'),
('©qù‰I†¶Ï»S¨','Ãles Cocos (Keeling)'),
('\Ê\Ô\ÔŞ¿N#\Ô\÷)x´o','Ãles Cook'),
('\ñpVŠ8Fš´½_4','Ãles FÃ©roÃ©'),
('XE—\ç\ŞJ:¶q€XŸ¦_','Ãles Heard et Mcdonald'),
('á‚ˆ¬\óI\ï‘\Z¨\ÎpY\Í\Ó','Ãles Mariannes du Nord'),
('Sù“£‘D‘ŠIƒU:¸®$','Ãles Marshall'),
('HS8\ß\ÔFÏ¯©NX§˜V','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('\0¿Ú›\äeC¸û\Î\Æ\İI¢\á','Ãles Salomon'),
('*KM\ËN¢œk/bŒ\Ã\È','Ãles Turks et CaÃ¯ques'),
('$W7\Ç\èƒCÎ‹\äg“\à','Ãles Vierges Britanniques'),
('%Øºš¾C\ô¸ï¶˜¨ù\ğ\Ş','Ãles Vierges des Ã‰tats-Unis'),
('e–\á\è·J-¸\0‹\Şm£ú','Inde'),
('›ûr¼š\ËAb†\åÀ\ò“','IndonÃ©sie'),
('´,\ÈE{DPœÒ³m\ôDS)','Iraq'),
(',\Í\Ã}˜Ob€G/Á™A','Irlande'),
(',\Ã6\÷ûVEÜ²­À-N­˜\Ñ','Islande'),
('–7~Œ+\éC ´+¤¾cı','IsraÃ«l'),
('–¯QC§’´\ãú—+³','Italie'),
('!\rdµ<=F¶Ö…±8Á<','Jamahiriya Arabe Libyenne'),
('úªgOŸ½\Æ\óI\Ğ1Ÿ','JamaÃ¯que'),
('t{pk\ô”@\'Ÿ\Ş}\Z^ø','Japon'),
('\Ô@\æ&\"HH]«–;×¦\Ñ','Jordanie'),
('?`ß‰,zE‰_7\Ìz—{b','Kazakhstan'),
('\Ú\ö\è|s\ÑA ·\òxÀ ”T','Kenya'),
('JÁ6C¯§HŠ\Úpm7\ó','Kirghizistan'),
('}ƒ©kŠD (\í±\á\ö\é','Kiribati'),
('p\\¯\÷\'kIÉ±iX†\ñŸ\Ã','KoweÃ¯t'),
('\ğ¬\r‹\nK:¸t½¡ˆ¦','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('˜\Z\ö\ğbEI•š.\ó=]O','Lesotho'),
('Ÿ&“.@¬IÒ¶™Éº\Ï\ÕLı','Lettonie'),
('\İt8²G¸<\"\ÍA¢8\Z','Liban'),
('\ìß˜\Õ\İJµ‰td••ªf','LibÃ©ria'),
('u3X@EV¶ß¿„•q7','Liechtenstein'),
('\ö\î1¼¨\çA½\r\0Fv\öˆ','Lituanie'),
('R;³\å\îHI—±ln\r\Ú^\Ïd','Luxembourg'),
('u&<ù¢VK	‚	È¢^\Óz','Macao'),
('sy˜\r¦BGÖ™}RÀ1v\Ü\ë','Madagascar'),
('\ÃI¾fK´·¬³`·\Õ[','Malaisie'),
('6\â\Ù\ógE7—šø–³4%','Malawi'),
('±\Ìûf¾\ËKR¥pKo]N¸','Maldives'),
('.½L€¬\nDÂ”¬S#†H','Mali'),
('\ïŸMaF\ÌD\ô§U\éQt\å','Malte'),
('\ôº¸¨\ÚJ­¹¼wş ','Maroc'),
('\óDw[P\ÎE\ç¢\çs_\õD\Ò','Martinique'),
('n×ŠnM\ÒA¹\öOtŠ\"m)','Maurice'),
('\Û8HNF¾\ë\ó”yÂ','Mauritanie'),
('e\è‰…3G\0¼\é(\\£','Mayotte'),
('\ğ\ä\â\ï\ÖM©û&b\Üfü','Mexique'),
('\r‚\r`nƒB+Œ\Ü\ZTam¶•','Monaco'),
('\'1	T\ÏFºà³•\ìE”c','Mongolie'),
('y\÷5\êyBC¥.x\ÛÂª\ÙX','Montserrat'),
('\àwF­¹D{·±ƒ\âj·¨','Mozambique'),
('D\ÅDÖ‚½LIŸ\÷G_\Ìw','Myanmar'),
('ÿ dB®F: Xax\ä:','Namibie'),
('\Ã\ÈŞ²Y\Ë@ ™\\\Z‚V¹I','Nauru'),
('I\È\Ô;Ce±G¤My','NÃ©pal'),
('P\ğ4¼‚M	¿Ô¬\0¹¬','Nicaragua'),
('ÁŸ\\\İ@D}ˆ‚)û²r\÷H','Niger'),
('F\ñ.Ÿp+Cú•?ª\ŞJt4‹','NigÃ©ria'),
('„Oo«A[º)\Ğ%^2¼k','NiuÃ©'),
('|„xZ1œIã—²O\Êm,e)','NorvÃ¨ge'),
('c\ÔpV(/E¯¶\ÉÀ\n]\ç<\ô','Nouvelle-CalÃ©donie'),
('Pg \æ¯ZLD²\ğÜµC`m','Nouvelle-ZÃ©lande'),
('\íÓ£ÿN¯Šo\Ñ1\ë ¯','Oman'),
('\Æ\ÛÃˆ\ê\îAL‘2ù\'$','Ouganda'),
('K\"Z“\ÚHi™Ê†…øqU ','OuzbÃ©kistan'),
('‡5\"Š¨\òK£µº‘›<A','Pakistan'),
('µ…’ºŸ L}±c‚\ë/Q\Ş','Palaos'),
('‹;A;§†EJ¸ˆ\Ş\Û$-¯k','Panama'),
('™3‰\à\0PE—‰mj/¦)˜','Papouasie-Nouvelle-GuinÃ©e'),
('Æ»-µB¨ovc²O¦0','Paraguay'),
('\Ø\í_ÑŒ\ÜH1¡\Ü\íd\÷[','Pays-Bas'),
('}QjyJ’\ô7‹\ÙÀ#','PÃ©rou'),
('_y\ãr€M\"\ğ\ñ`¹\Å','Philippines'),
('\åQ]\nMû¨\Ô\Ñw¯‰','Pitcairn'),
('\ğ\ÕD„ K`¡é³€\0(~','Pologne'),
('£®¶ıN™·\"\ö˜D\ÒI‚','PolynÃ©sie FranÃ§aise'),
('“¹1l\ñI†©¶´¶\ö¥','Porto Rico'),
('0\r:\×øŒAx©\É\âŠg\çD','Portugal'),
('…½ªsµD³›kjo¹IY','Qatar'),
('¦23\ÔB\ëD—”\×\æG%	','RÃ©publique Arabe Syrienne'),
('\å\çÑ±s0E\ğk\r”*\Ç\Ğ','RÃ©publique Centrafricaine'),
('¬Ÿq\r\ö\áH¯™\ãùA±ú','RÃ©publique de CorÃ©e'),
('‡¦gû\ÈMQ¸6Q‘1¼\ß\Ë','RÃ©publique de Moldova'),
('Z6\Ó\ÙùºJ1µ6?Ê©µ^a','RÃ©publique DÃ©mocratique du Congo'),
('\âzm\n7Hc©C\'k§˜X','RÃ©publique DÃ©mocratique Populaire Lao'),
('ƒW\×FB\ÌK £U…!¿*','RÃ©publique Dominicaine'),
('qd\Zs\r8@«„§¼˜v5»9','RÃ©publique du Congo'),
('~gk\\¯GY‹O`\ëè–†E','RÃ©publique Islamique d\'Iran'),
('B\Êu\Ò-œ@œ•u³\ÔM\éx´','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('\"\à\ækœ”H„‘\\ù>– /','RÃ©publique TchÃ¨que'),
('Q\í`¯{K˜µ(\ÑÎ¼º‹v','RÃ©publique-Unie de Tanzanie'),
('Âœ\à\Ë\ÓA*[ııû‹Á\ö','RÃ©union'),
('ÿ²–-§G‘¼+\Ú\ò*\à','Roumanie'),
('\Ø š\à.EQŒ´&\ÕIk!3','Royaume-Uni'),
('<6¨=QMŸ–T…\ß2ü]\n','Rwanda'),
('ª,\êF4\ËI.ƒV]Ü = ','Sahara Occidental'),
('\ñ8“\ÖUMF‰ã‹°\Ë\r…\õ','Saint-Kitts-et-Nevis'),
('¥Ÿæ»´¯I¨„4ş\İ~˜R','Saint-Marin'),
('‡=Ü¥F>\öú\Ãs\Ù','Saint-Pierre-et-Miquelon'),
('­¾]eO¯‹o¹ÿ£kš\Ì','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('¸\Ş\Õ/À\îKÍ‹r_e¾\éG','Saint-Vincent-et-les Grenadines'),
('\èJ[\ñJ¶‚•Ï•\Ä\"\ó’','Sainte-HÃ©lÃ¨ne'),
('±\Ê\ïQJÁºş”˜\Öv','Sainte-Lucie'),
(')©\ìH¼\è0@w\Ö\Z','Samoa'),
('Wz\Æ\Ò\×lO’,úJ@|D','Samoa AmÃ©ricaines'),
('ŠM27\Ğ\ÉE.²<\Ò \Ë\Å','Sao TomÃ©-et-Principe'),
('\ò:\Ê\ë\ëBvZ-—\å@#','SÃ©nÃ©gal'),
('E\ÏÈ…­B\ä·G*\nµJd','Serbie-et-MontÃ©nÃ©gro'),
('\Ó\nfV\ëLÃ‡¨\ÍIg','Seychelles'),
('‹ªOAiEÓœ‹\ÏR)\Ãú\Ü','Sierra Leone'),
('¨èˆ†EŠ\çıb\Ğ\É\Ø','Singapour'),
('\òcÀg‚‹O\n™v²¾I„K’','Slovaquie'),
('\× †£\Î\çKı¥\æ:cÏ•','SlovÃ©nie'),
('E¼=R?AŒV†*\Ë2q','Somalie'),
('e”oRvuL§¡\í5®oÂ»','Soudan'),
('™¼?%BB¢¥\ïäŠ\ì\Ì','Sri Lanka'),
('_ÿ­\"}BÃ±²V6\àÆ¦','SuÃ¨de'),
('\â\÷¿gJG“vrÚ¨¦‘R','Suisse'),
('°OW¡§K„†\äD~\Ú´','Suriname'),
('\æ\Ü]gNn—c[$g|B','Svalbard etÃle Jan Mayen'),
('¹\ğ\ä\ó]›Iå¾Ÿ€j\ñ+','Swaziland'),
('»I\çÿ9@ü¶×š?\á\ñÁ\Ç','Tadjikistan'),
('t T\Ö\äıLz‡uk\ñ9tš','TaÃ¯wan'),
('w‘]smCb¡-ªU\Æı8z','Tchad'),
('Ëˆns\êONq¥#xO\ê','Terres Australes FranÃ§aises'),
('¯ \Ó\Ì^ÀGjš¥\rU\0\ñ0','Territoire Britannique de l\'OcÃ©an Indien'),
('ÀÄ©\Ã\ôDO§œ\ë\Ä\Ín6<y','Territoire Palestinien OccupÃ©'),
('1\ç°,@pGú…\óú]K;ÿ†','ThaÃ¯lande'),
('¥$Áy|¹Iv¸\êšjwlI\È','Timor-Leste'),
('\Ö$nˆ\ÄMÉ¬™g§\'£“','Togo'),
('ŒÏ³‰£\ÍN%ŠÎµ¬\ì','Tokelau'),
('\Ï\Ü \'¡\ÎH-¤v]\ì1r','Tonga'),
(',xÚ58J¡{\â)\Ø\è>S','TrinitÃ©-et-Tobago'),
('\î\öVÄ³Cì´\Â\Ç\Å$G¶','Tunisie'),
('rex\ìªHY°\\«Œv\ß\æ','TurkmÃ©nistan'),
('Šd¾\ğNÜ™%\ï~\ïf','Turquie'),
('»\Z\Ê¯\öFeš”\÷JQ\×\Í','Tuvalu'),
('4r\r‚N¢IÏ¨\Åm`‚•–','Ukraine'),
('-c\Ì\ÑB\ŞL‡“\Ã6Ãª$','Uruguay'),
('\Û\0Et\Z\ØE9²\÷‚V·‰\Ã','Vanuatu'),
('U¿HùnB™§Á\í\n´¤l','Venezuela'),
('5\Ä\Û\Ü‹J,ƒWx ”\ï\ç','Viet Nam'),
('Ã£BQ&»Gˆ­Q\Í\×K[','Wallis et Futuna'),
('¼¼ş\ØP<J\"¤[gq˜‡','YÃ©men'),
('p9\à\ÙBŠº\çD‘‚—+\Ş','Zambie'),
('\×Kˆ Iœ+\Ó>\áškŸ','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-22 16:40:33',3),
('DoctrineMigrations\\Version20240201152951','2024-11-22 16:40:33',2),
('DoctrineMigrations\\Version20240202084749','2024-11-22 16:40:33',2),
('DoctrineMigrations\\Version20240202150901','2024-11-22 16:40:33',2),
('DoctrineMigrations\\Version20240207105701','2024-11-22 16:40:33',2),
('DoctrineMigrations\\Version20240319212437','2024-11-22 16:40:33',2),
('DoctrineMigrations\\Version20240614133504','2024-11-22 16:40:33',10),
('DoctrineMigrations\\Version20240617165906','2024-11-22 16:40:33',8),
('DoctrineMigrations\\Version20240708061729','2024-11-22 16:40:33',11),
('DoctrineMigrations\\Version20240801202153','2024-11-22 16:40:33',2),
('DoctrineMigrations\\Version20240815153823','2024-11-22 16:40:33',2),
('DoctrineMigrations\\Version20240916065051','2024-11-22 16:40:33',4),
('DoctrineMigrations\\Version20240929091802','2024-11-22 16:40:33',11),
('DoctrineMigrations\\Version20241002164506','2024-11-22 16:40:33',6),
('DoctrineMigrations\\Version20241119144432','2024-11-22 16:40:33',11);
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
  `sent_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `link` longtext NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `target` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F11D61A25BC0FE1E` (`tasting_id`),
  CONSTRAINT `FK_F11D61A25BC0FE1E` FOREIGN KEY (`tasting_id`) REFERENCES `tasting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
INSERT INTO `invitation` VALUES
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-22 16:40:33','root@gmail.com');
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasting`
--

DROP TABLE IF EXISTS `tasting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasting` (
  `id` binary(16) NOT NULL,
  `owner_id` varchar(255) NOT NULL,
  `participants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`participants`)),
  `bottle_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasting`
--

LOCK TABLES `tasting` WRITE;
/*!40000 ALTER TABLE `tasting` DISABLE KEYS */;
INSERT INTO `tasting` VALUES
('.¥l5‹¹LnšI½y\Å\ñ7','hugues.gobet@gmail.com','[\"hugues.gobet@gmail.com\"]','Domaine Leflaive Montrachet Grand Cru 2016'),
('–J<¸_½Fx¥\Í\ãqÀ§\"','hugues.gobet@gmail.com','[\"hugues.gobet@gmail.com\"]','ChÃ¢teau Latour 2010');
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

-- Dump completed on 2024-11-22 16:40:34
