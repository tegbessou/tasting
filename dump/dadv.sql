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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',259.99,'2024-11-21',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-11-21',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-11-21',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-11-21',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-11-21',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-11-21',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-11-21',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-11-21',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-11-21',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-11-21',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-11-21',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-11-21',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',1299.99,'2024-11-21',NULL);
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
('\Ì*ù~\öxAU‚9\ÓL\ß{Ê†','Afghanistan'),
('-ÿ—¤`AŠ–vT(\î)\Í','Afrique du Sud'),
('µ*n\çWB·ƒA¢q-\ZÀj','Albanie'),
('·<!{tXC¾¹{¸£–\Ã\n','AlgÃ©rie'),
('sœÇ›\ìEÔŒ¦\òû¹‡','Allemagne'),
('%s¡¯VK³¾¥kb \Û\ë','Andorre'),
('“=\ò\ZÕG(ª\Ùcc/¶.K','Angola'),
('B6ŠÃ©LŸì©¼\õd','Anguilla'),
('¶ŒÈ‹’AQ¹\Ô(©(ı†U','Antarctique'),
('œAq©@Y‡¥«U”$~','Antigua-et-Barbuda'),
('4Qb¬\\MZ¼mÄ¦PxH','Antilles NÃ©erlandaises'),
('Ã¶<:yN ¾‚T\ĞNM‘J','Arabie Saoudite'),
(':\Ü\ã#kA\"²I‡mr˜H','Argentine'),
('\Ç´\×·H.\Öd@\ZüK\Å','ArmÃ©nie'),
('\n\à6\Ç\ØJ\ã¸[\Æ:¨¥V','Aruba'),
('‡gGTGNAˆc¸RT8\ô','Australie'),
('W\ß\Z ‹N¯%\Ö×‚	','Autriche'),
('\ö#¿g\Ø\ÇGĞ’8ş<\òA‘','AzerbaÃ¯djan'),
('@Ù†:J[\Ò\Ûd\ß\nº','Bahamas'),
('¾­u\ãQHA¬™G\İÍ˜','BahreÃ¯n'),
('_{ùÿ‰OP–‘§”ŒIG','Bangladesh'),
('\âM8»£¥Mß§\é’~™á©ƒ','Barbade'),
('6Çƒ¿\ğB¥»L\÷\Öê¸·f','BÃ©larus'),
('6(Æ¸rE¤®n=Y\ZP½','Belgique'),
('g\èk7D‘´Á\Û\É-ù','Belize'),
('\Ï\à‚º\ÄL±–\Ët\\c›¿\ë','BÃ©nin'),
('\n·\r\÷\ò	C†³2}b±ˆj','Bermudes'),
('w\Üy\ó\õF\\ŒBE¯ø\æ','Bhoutan'),
('­Áv…¦IÉ¦‰­…/ş','Bolivie'),
('\êÀúûeBâ‹ªû\í,c\Ó','Bosnie-HerzÃ©govine'),
('@½»¬dHÄ„—+\ßu\ÍT','Botswana'),
('\ÒYšq\éA’›GVp,„:o','BrÃ©sil'),
('«ú< ³BÀ¸§[³‚kc\0','BrunÃ©i Darussalam'),
('fšª\nD;Fœ±\ãi\á7Ÿ','Bulgarie'),
('I¬>MM<™ £‚«’%','Burkina Faso'),
('µM> ¡|M\"‚}c\ã<Êµ\r','Burundi'),
('iLò¡‡E8¢8\ã©.<','Cambodge'),
('\ä:\Ç\È\ã\rL\Z–G¶†C\Ò)\Ú','Cameroun'),
('Ik¨h\Æ6D ‘šp\ñ87\ß','Canada'),
('B6W×±A×½»ùù‰xg\É','Cap-vert'),
('\'\Ù\Ø-B‡@ˆ‰\Ê\Ët=','Chili'),
('†2 ]’ÿMM€a\">VŸ','Chine'),
('aT­\ğY.LE‹\\.X³¦bÿ','Chypre'),
('µÕ€RTvG‰¢1İš\Ù\Åat','Colombie'),
('\å©>œB.M‡›»?â¯ª','Comores'),
('\í‡\Æ\Şw\ÃO·„pN‡\Ã\ò\Ê','Costa Rica'),
('\ÓıFkÿE±@I\ï±\Øq','CÃ´te d\'Ivoire'),
('ûdúk†!Fø®¬(\Ç\ï˜Fj','Croatie'),
('²„Ú‡C\r¦bkZ\àˆf¾','Cuba'),
('0-\ß\Ï}ACO™\Ğ^~\÷¥‹','Danemark'),
('²\'\ì .B„€œ¿•°\Ã','Djibouti'),
('C&\î(¹M[‘\÷\ì\Ö\×ÿ\Z','Dominique'),
('Bw}D¨IšŠs\ÛüC®‡\ë','Ã‰gypte'),
('š9”o3B× \É\Õ\à½~','El Salvador'),
('!E3@\"IJ«f$Ì¶şz°','Ã‰mirats Arabes Unis'),
('.cW\òN\ö¿\"JCü˜','Ã‰quateur'),
('{`B\õD‹ª\ê<œ\Ğ«ÿ','Ã‰rythrÃ©e'),
('\íf£\ß`>CoW9¨”\ó.','Espagne'),
('1\r§RNŠ\Å\öÿ\ïF','Estonie'),
('\ÉTÖ³[HIÎ¨¦D¬`û¿\Ç','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('ü«C5LF‘«9‹»}\İ','Ã‰tats-Unis'),
('¥\ëØ€3KÔš\Õ_4Iû¢','Ã‰thiopie'),
('J\Ä_9¨úJD›\ô‰†Lù\ê','FÃ©dÃ©ration de Russie'),
('\Ê1©Iÿ‡—å©š\ã›','Fidji'),
('\'‹;‹ˆGÖ‚\ëCc``¢\ç','Finlande'),
(':\\W±	GCv·b\ãG¹¿n','France'),
('\ÔF\íW\åuA~›1½\äb','Gabon'),
('«‘N\ÛJQ…*Í¢“JTI','Gambie'),
('­\ğ\İz \ñD·¹×¾d{‡\Ã','GÃ©orgie'),
('\ã\Şdµ/TE¼–C¯\r|\Å8T','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('·xCdBsI6‘\á¸h\0eø','Ghana'),
('\ì7¹4\ŞK¨\ìÁs¯\Ñ\ß','Gibraltar'),
('y\ô5Á;I«šÀ\Ú< £`','GrÃ¨ce'),
('ÿ`×„7ŒLy€[Z…d\ècq','Grenade'),
('—n\\@UºŸ\ë0\ÖÁ§','Groenland'),
('‡\Ä\Ş\\\æsG\ê®\Ê\\\î3ş\Ô','Guadeloupe'),
('{\Î2ú¯\'B\ä—\Z(\rt¤\Æ','Guam'),
('º\Ó\Ã\Õ×šJV”Ÿ|…ot‚ª','Guatemala'),
('˜§Gù\çÿK\ô›úÂ•>ÈŠ\Ö','GuinÃ©e'),
('\ÔşXb;5Bü·\ã\')T\Ñü','GuinÃ©e Ã‰quatoriale'),
('$\õj^JÅ›8\êû\ÏÔ…š','GuinÃ©e-Bissau'),
('\Ï\äh\Æ\Å\ñJ®•Hs\ç]d\Ô','Guyana'),
('³V„OrŸ9\âP’²\Â','Guyane FranÃ§aise'),
('`²\Ã)KÅƒ\\s,BD-','HaÃ¯ti'),
('2\'<²mA‹¯µ3}»µ','Honduras'),
('W})\ÑD@\0ƒ\Ó\Å\às}','Hong-Kong'),
('kúlIM@Ô’kş¾1\ó¸','Hongrie'),
('o`\ÍvCg£KøÉ¼\È','Ãle Bouvet'),
('\âŒÅ¾‚\öMØ›\óf\í\Ó\õu\è','Ãle Christmas'),
('\åÍJ“²KY‹\å\×$e¢\Â','Ãle de Man'),
('LX\Ş\ÌJ\'Nª—[j»\Ô	T','Ãle Norfolk'),
('³¾şŞ‘\ÅFN£†’\ñ*N@','Ãles (malvinas) Falkland'),
('½\Ë\Ğq\õ\ÚM¥‰–R	ûùÛ¥','Ãles Ã…land'),
('\ç\å\Í&LJa¸·I+\ôyc','Ãles CaÃ¯manes'),
('\âık\ÜS\öIBŸuG¾','Ãles Cocos (Keeling)'),
('\âQ‹‘)@w™!%…I','Ãles Cook'),
('.±rQtŸE¾¾n(®Ö½ú','Ãles FÃ©roÃ©'),
('\Ş{\n¡±J¯´\Ìw\ï\Ö0','Ãles Heard et Mcdonald'),
('Ÿi1¨¸FI‹¼ V°h@X','Ãles Mariannes du Nord'),
('Á\"²  ‡L`ƒŠŸ]S	','Ãles Marshall'),
('„¡Y¨DĞ’\Z„Ï¤N\õA','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('gL¨m\Ï Aû±\Ûƒ¯¥','Ãles Salomon'),
('8Mÿ#K¨²\÷\ál‰','Ãles Turks et CaÃ¯ques'),
('\ŞJû\'\ØH,°5ú£¾\Í\ò','Ãles Vierges Britanniques'),
('s{¡¿lFZƒ²Ï¨¸;¿','Ãles Vierges des Ã‰tats-Unis'),
('ºU\İo\ÈB¢½O\ã-eÅ¯\ï','Inde'),
('\ñ³[øSF¬6|u\×0','IndonÃ©sie'),
('c-vüp½JÆŠ&›	Y','Iraq'),
('\È$UZE6—/½GÀ‘','Irlande'),
('u.\ã\î\áOÏ ?A\ñ?®\é','Islande'),
('¹­œ%DF”kŸ\ç?Z=Œ','IsraÃ«l'),
('Í‡ÿŸO9»±´¦u ˜','Italie'),
('(ÂÇ«³KÍ°Û¬½øA›','Jamahiriya Arabe Libyenne'),
('œi\ôú›9A ‡3¥\Øo\Ãû','JamaÃ¯que'),
('\'HP*FBJi¼6\Ûé¥¸','Japon'),
('Ö””\çšJ\ñ¡bvÀ\í\Ö\Û','Jordanie'),
('\Ã\ç\ãS@Œ†§ø\Ëbİ‚','Kazakhstan'),
('\Êjù	oVBà´»…)ŸR','Kenya'),
('T/x\Ú\ë\ÕL£\Ü\Ûkú(\ï','Kirghizistan'),
('œüK\ã\ÊIL\r¼~¾<¯‘U','Kiribati'),
('\í\Ë\Åx\ÄQD\Z„\Ú\Èa\Z”:','KoweÃ¯t'),
('\à‡D¢QøE)«»+¤×–\ò?','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
(':`eGÙ•\Ä\Â\ó1\ë\0W','Lesotho'),
('°¹L>‚I\÷\Õ9uš­','Lettonie'),
('odfpE\\NÄ©^²GF\Ê\öz','Liban'),
('À\à\àûWJz«œ\èK›©','LibÃ©ria'),
('M/k\ŞO‚‰y\rg|[Ÿ','Liechtenstein'),
('\ìU,AOL¡´¶Z/[ ','Lituanie'),
('d•t­\é£Aœ„B\ÒH\õ\ß','Luxembourg'),
('¦ß“ˆ\Å3OWŒoù\"Ÿ«”','Macao'),
('´’\â`©\÷F:­\ĞG»›š9','Madagascar'),
('\Üù\Ì\Ì;Hc‰^_~·\ßM','Malaisie'),
('Z‹{†\çıC®¢¦*\ä®?','Malawi'),
('Ï‡A¤\à\\BJ©\í\ó]\Ó\×\İ','Maldives'),
('\ï¥GŒ˜NT0c4ˆ\×\Z{','Mali'),
('(Ş£±E\ÉA&¸\ò\Ü\r\È|!','Malte'),
('jŒ\Ş\Â+Hj§i4¢}\Ò\Í\Ä','Maroc'),
('\ó^\Ëß˜aC\ö½\ÉSr\ÑL','Martinique'),
('¾e…xIKÛµA \Ş	‘]','Maurice'),
('øAOz7AŸN\íYz\ó\Ñ','Mauritanie'),
('a“½=5^MÜ–E”É£´\0','Mayotte'),
('°\Òt[CEÉ¨7*\í.\é@n','Mexique'),
('n\ò\ã¬\ÉM­”Z<\ÅŠ	§','Monaco'),
(' ‘Õª\á\èHc\î\Æ\Û\è\é\ç','Mongolie'),
('/¢\Ù:ºCE\n±Òš¼','Montserrat'),
('$¸€&N´™U!Œz\ÌÜ˜','Mozambique'),
('o\Ò \ÎIB·°\"Ã•;¼©','Myanmar'),
('!\Ğ\'i\Ü6C½\å°\Â\Ç\Ù\Ç','Namibie'),
('\é¥\ñ\ÓKZŒÄ‘ÎŒ\Øº','Nauru'),
('tL.e4kH¼\0 \n\Úv\Ñ,','NÃ©pal'),
('\öw³\â¯>HÏ¤³_\àcß²','Nicaragua'),
('RKh\'C®P^\Æ \Æ\Î','Niger'),
('£¹œµAB\í™jEÎº4','NigÃ©ria'),
('B\0\r\îFk‡±¼-\ò=\ì','NiuÃ©'),
('	¢Ü„şNb‹\á¸E\ğ\Óe','NorvÃ¨ge'),
('@\î’ùJ¬2\ä#:i.','Nouvelle-CalÃ©donie'),
('1zÉ©Q]K€„1C«\İ	','Nouvelle-ZÃ©lande'),
('K6A,\ÍmL¾½Uÿ‚\ó\Ğ','Oman'),
('kÁ\Zv	WH¥†K|\ä\naÙ','Ouganda'),
('º\Ë\ìJ\íúK† Ë‘>Š\áH','OuzbÃ©kistan'),
('·pVXl¹O} ¢Šı–…','Pakistan'),
('1\Íb§%¿K¢\ç\Û\ß`\Ø\â\ô','Palaos'),
('(\Ë<dm\çO@˜’°¸˜i ','Panama'),
('µ¯šjŠuE8š”l\Î\" C','Papouasie-Nouvelle-GuinÃ©e'),
('n_üp6IG¸y¥P*P\å','Paraguay'),
('Óš?ü4EÈ–\ğbV³c\Î','Pays-Bas'),
('fŒ²qM1PJŒ&¼]','PÃ©rou'),
('H0 ú±H\ô¨5\Ö\ÍÀu…A','Philippines'),
('¬øbA\îA‹¡ fI\ğ!','Pitcairn'),
('\Õp‰\ğ€<M·›UJ˜\Ê) i','Pologne'),
('²‹¦\nG^‰¢\îNv\÷\æ','PolynÃ©sie FranÃ§aise'),
('Tk\îQ»\ÂK?—\âeù¡l\'œ','Porto Rico'),
('c™MA2\ß@´\ö\áıZ\Ä-','Portugal'),
('\íE\ó;“\ÕIˆš†\æ\÷9\Æ8H','Qatar'),
('\Ó\ìAw@o·5\ä$P]\0P','RÃ©publique Arabe Syrienne'),
('K¤|¤TYNY–uÌ‚\ç€K‚','RÃ©publique Centrafricaine'),
('Ï¯–øwLAO‡•<øT@','RÃ©publique de CorÃ©e'),
('\Ür\Õé¤»L\n°\Ça\ç:6\à','RÃ©publique de Moldova'),
('\'\à\ô¡\ë\ĞC>€\ZFÂ²Ç»®','RÃ©publique DÃ©mocratique du Congo'),
('$pùã½Jà¡Ÿh\ñFH\Õ','RÃ©publique DÃ©mocratique Populaire Lao'),
('\Û>\ÎÀEH«ˆ%‚îƒ²','RÃ©publique Dominicaine'),
('•\çK\È\æ(GQ·\Ë\ß\Ü\òûz','RÃ©publique du Congo'),
('=ã³µ•1KO¢‡œ¦h!+','RÃ©publique Islamique d\'Iran'),
('¡\Ğ\Ş\à„±Ob0\Ò;=3 ','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('§1¦FŒ\Îs?+=8','RÃ©publique TchÃ¨que'),
('­\ÃÌ—P\íF³ƒi©gÍ¼\à','RÃ©publique-Unie de Tanzanie'),
(' \Êü\ß@r)\ô\Û\äû','RÃ©union'),
('Áş\ê¤#\ÇE#©¡AŠq\Ò\Ä','Roumanie'),
('\æ\Æ:k€\Ş@d¢«D®','Royaume-Uni'),
('t| \åXmD^²µYy|˜²–','Rwanda'),
('h”šdQK€aš»xer\Ï','Sahara Occidental'),
('Ô™e\ãL´Ÿí‡F±\à','Saint-Kitts-et-Nevis'),
('l\\r\ç\æ›D²I-\â\Ğ>k','Saint-Marin'),
('ğ¶½™\\ıDG²–}İµI','Saint-Pierre-et-Miquelon'),
('AB„j>C‰?Q\Ü\Å\ZÍ¢','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('S\æü7¼@\å‘uù=\Óü','Saint-Vincent-et-les Grenadines'),
('j‹Zˆ}üKW§z²#°,9^','Sainte-HÃ©lÃ¨ne'),
('\Ê\ç`HZ8N¾™š~Š\Æt½','Sainte-Lucie'),
('\Ü\ÄÕ£\'\êBX‰©¸6ú±|4','Samoa'),
('P>\å*\Ø\ßM\æ¾\ŞPz\Ä\Ş\Ùü','Samoa AmÃ©ricaines'),
('\é0\è{\'N¸œ\'\"`ˆ','Sao TomÃ©-et-Principe'),
('b+\Ù\å4IÅ„•\\¸\í:1¥','SÃ©nÃ©gal'),
('\ô«G‘cAÅ†\é>b,ª\å+','Serbie-et-MontÃ©nÃ©gro'),
('w/m“–rCO¼\áS\Ë@„›','Seychelles'),
('—9Œ¼R:Gş«G\öP£¦Ø®','Sierra Leone'),
('\ò„z\ÇmG¸¥\r•A”\0Tl','Singapour'),
('‘°Ö˜F7»\õ\ïI£','Slovaquie'),
('kú9{\ÕBª¶À\åQ>','SlovÃ©nie'),
('d\\ ‘³N›«+L²\0«\İ','Somalie'),
(')™\å5~±O‹©ÿ~€™\â','Soudan'),
('r\rl>tL]§O[;Urû\ê','Sri Lanka'),
('\ã~Ÿz\îE\ò\Ï!o','SuÃ¨de'),
('`\î¦.\ÜtNJ¹®ş9h™9','Suisse'),
('Ğ¹ı€v\ÖMÔ³\r9Tsb	','Suriname'),
('±HÜ‚uA–‘\Û;|µ0','Svalbard etÃle Jan Mayen'),
('²±|\"\æ\ÇN­«\ó\Û\á1U•','Swaziland'),
('3\ĞÏÁ@‘¡\Ã\óP› R','Tadjikistan'),
('WQOMxF”°‹J\ñ¸7²','TaÃ¯wan'),
('\Ù\Ğ&{Á\êG³œ£Ts±','Tchad'),
(',€H\r­@™¡\r±Ï™\ß\ö','Terres Australes FranÃ§aises'),
('\Æ\r!‰x³Aı ‘0Ø°\Ö','Territoire Britannique de l\'OcÃ©an Indien'),
('±\Î\ç¦UB£\ï\â\'\ëÎ©','Territoire Palestinien OccupÃ©'),
('.jT@¬Av‚\Ş\ôKRZtœ','ThaÃ¯lande'),
('\Ú\Õ\'Úª­JÙ”ºZTx,$j','Timor-Leste'),
('ŠŠ\Ğ\×úMB¬^ŸY\ò<’\ö','Togo'),
('E\íni»¹G\ñ»\Òmÿ9O\ê»','Tokelau'),
('¸„\ã»ÿE——\ĞK`— .','Tonga'),
('‚«\Â*\0kC§—ü,\Ò[]\Åc','TrinitÃ©-et-Tobago'),
('0»ˆ8\ÒqI\r¨\ò\ÌP`7','Tunisie'),
('\ğ0\áĞ«M1‡\Ş|P\ÛÆ¾','TurkmÃ©nistan'),
('°O—µ\ÕzD<¦4Ÿ\×?U','Turquie'),
('Á\ËZ5¸xKTµ9\ÄA\Û','Tuvalu'),
('\é\'\ê7\è\èI¶Nù\Ù;¢PF','Ukraine'),
(' +K\Ü]øB¤²AL¥t,Ÿ','Uruguay'),
('~M5k»EN¸§%;b®\Ò','Vanuatu'),
('8¬Š¸,¢GÍ¥\ò/á¢¿\÷','Venezuela'),
('\îAguK’ úût-\ä)','Viet Nam'),
('U¶{LEŠI\ñ¸¡P¬ƒ\í„\å','Wallis et Futuna'),
('ML<2¶\ïFN½\è\Ë1\Ö\İ','YÃ©men'),
('·®\Æ\È\Â\êKG€ª\Æ~´\ÜÇ¹','Zambie'),
('\ç\õI)NJ×¿n©\Ö\ôMş','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-21 20:45:32',2),
('DoctrineMigrations\\Version20240201152951','2024-11-21 20:45:32',1),
('DoctrineMigrations\\Version20240202084749','2024-11-21 20:45:32',2),
('DoctrineMigrations\\Version20240202150901','2024-11-21 20:45:32',2),
('DoctrineMigrations\\Version20240207105701','2024-11-21 20:45:32',4),
('DoctrineMigrations\\Version20240319212437','2024-11-21 20:45:32',2),
('DoctrineMigrations\\Version20240614133504','2024-11-21 20:45:32',11),
('DoctrineMigrations\\Version20240617165906','2024-11-21 20:45:32',9),
('DoctrineMigrations\\Version20240708061729','2024-11-21 20:45:32',13),
('DoctrineMigrations\\Version20240801202153','2024-11-21 20:45:32',3),
('DoctrineMigrations\\Version20240815153823','2024-11-21 20:45:32',2),
('DoctrineMigrations\\Version20240916065051','2024-11-21 20:45:32',4),
('DoctrineMigrations\\Version20240929091802','2024-11-21 20:45:32',10),
('DoctrineMigrations\\Version20241002164506','2024-11-21 20:45:32',8),
('DoctrineMigrations\\Version20241119144432','2024-11-21 20:45:32',11);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-21 20:45:32','root@gmail.com');
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

-- Dump completed on 2024-11-21 20:45:33
