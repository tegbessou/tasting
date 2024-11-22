/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.10-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv_test
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
('\ìh$\îA_ƒG\Åiú\é•x','Afghanistan'),
('\Ü9\óA|THÎš4/X3ø\Ô\ã','Afrique du Sud'),
('—7@\òs\ÜC‘‹‡am¨{lU','Albanie'),
('\àùr\Ñ\ÔA¡Š•JÈ­f¿³','AlgÃ©rie'),
('A;”’®‡J\"½.\Ì>\r0A','Allemagne'),
('/\å0«ÁI¾°´U¸sZ`!','Andorre'),
('¢ÿÇ‹[E%‹\Ø\Ì\Ñ\0‡\Ğ','Angola'),
('Ÿ3G¹FvB¯¿Ä’ –\İ\ñG','Anguilla'),
('\òo€\èZ+M\ï†{\Ş2\ñ\Û','Antarctique'),
('r\Õ\0d2£LC½¿’\Z7>¸','Antigua-et-Barbuda'),
('4ü‘]>(K\r‹\ÇQ¤T\Å\Æ\í','Antilles NÃ©erlandaises'),
('qzAKÆ‰\Õg\é\r6\×','Arabie Saoudite'),
('€tı\óCÓ†\å\Õ\ö¬','Argentine'),
('Ï¨p¦Ÿ>K«¶\Ü×Ÿ¬U@','ArmÃ©nie'),
('G¯dIAË…f½?	t','Aruba'),
('dÿf\ÆGG²Fl½¡JH!','Australie'),
('µ½\ÏlœWK¯\Ó\ì\Ş\ĞO','Autriche'),
('\ğb:>©Oµ»\îc \Ò','AzerbaÃ¯djan'),
('³e*ş\ÃgHE¢˜«„›ü±','Bahamas'),
('\×\ò\í>-@n|ú\ç)\Â\á','BahreÃ¯n'),
('ÁIN\ÍXOF\Zš\É>up{','Bangladesh'),
('|~0L)²Hı63\Å)','Barbade'),
('X‘¬\ê\ğD=ˆFIGÀ\\”P','BÃ©larus'),
('Tÿ›\ÚC‡2*zÛ†‚\Ì','Belgique'),
('OPC­\çJø©+l—†Á\ë','Belize'),
('\È\ÔÈŸ\æ“M²s…+\ÛHÊ¥','BÃ©nin'),
('5\ë­\Å_N\ç™\ô\ç\'3\n»ü','Bermudes'),
('\÷t\É]LvGÂ´—.\É\×~','Bhoutan'),
('™¢xR\ìAÕ¡¦\Ù[aL»\Ë','Bolivie'),
('œŠÍ®NQ˜>\'\Ï\\\æe','Bosnie-HerzÃ©govine'),
('l±\Å\nØGV‘B¦»®È¢B','Botswana'),
('I\ëùjb£B$c\è\Ñøt\ê','BrÃ©sil'),
('˜t©\ÑÂ¤M}€=%ú\Â?‚,','BrunÃ©i Darussalam'),
('zm~M¯·r&X3Î˜','Bulgarie'),
('„U\ó\ïT\ßG¿pW\ZN|?','Burkina Faso'),
('µ…v¢W’IÓ¹G\ng\Z-','Burundi'),
('q\İXc\ËK7‹Ÿ°#09<','Cambodge'),
('µ|	K\r@7¸¾>\â%\ä­','Cameroun'),
('‚\ÑµsN8†1\Ï1\Çm;','Canada'),
('[`:^\Ø\ÏI6½\Ì@ÎŒ\é\0','Cap-vert'),
('©ù™ƒ\ÉH\õ¯qE¡ ++„','Chili'),
('¾¢´\ĞûCØŒ\Ä9úJú±','Chine'),
('\îpÎ·«\'E\"ˆŸlÇ¯\ğ€1','Chypre'),
('\ÉZ‰zV\nL‰Ÿ6¥PÕ¿S|','Colombie'),
('u½r@¿™ƒÍ¹Ç•','Comores'),
('\íavªb<H€¯ª\å®ú','Costa Rica'),
('9	6\áC,½+¡Y¯\ñ\Ù','CÃ´te d\'Ivoire'),
('\Ö?\äi,HÄ¿B\ã&û;S','Croatie'),
('\×{\ôG …v~{1','Cuba'),
('…½DHÔ«¤7IC¿\Ó','Danemark'),
('^½=\è3F¹šYW¹\Üc\Æ','Djibouti'),
('H‰\0\×\r²Ly°E0bI\r','Dominique'),
('À\ï@¸hYAÄ¤\ó\×C—‘\Î','Ã‰gypte'),
('À\İuùKÕ®\ÍUsT\ôAf','El Salvador'),
('dVæ¬š\óB=\Ö\é–.Æƒ','Ã‰mirats Arabes Unis'),
('=z \îEÔ…©¦sÄŸ\"\í','Ã‰quateur'),
(',ÉJ¢Nsª¨­;\Í\"\áE','Ã‰rythrÃ©e'),
('û\âSg“PLÊ¬eèœ«X\\¶','Espagne'),
('J§u[\ÙIÅ¥™E_\õg\"','Estonie'),
('\ó\Ş\ç\öOl°yİ‡RT\Ò','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('#r\é•\ë9Dø°‹€pk¯','Ã‰tats-Unis'),
('%\åe$°-B0³>O_¦)','Ã‰thiopie'),
('\ôÀ|²7I7š\ÍœT\ç)','FÃ©dÃ©ration de Russie'),
('Î¬¬\×tBu\×tfrºH','Fidji'),
('„µg/ûOC¡¶½\Ô-p	\Ï','Finlande'),
('}qªùbGE’Ã®Ÿ-@²','France'),
(']!\â\à!>EW”)E{y\ÄS','Gabon'),
('¯1Z?‰L£¡\äª¼–š\"','Gambie'),
('\Ç!o‚3D.£ûl\ã:\ì	\Ã','GÃ©orgie'),
('¸œE\ÌLDTVùz=³\Ù','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('HHÈŠDß‚)UÂ¥6}','Ghana'),
('\Î\ÍÁ3BË‰\Ïbµ\æ\â\ÅB','Gibraltar'),
('†Œ\Ò+A?Š…\Ùı \ö','GrÃ¨ce'),
('d}1\ÎbH¸ƒ*\ô\ñc?\â','Grenade'),
('.Wi³\ÏJ&º\Ñ`¿\İ\Z \Ç','Groenland'),
('\Ñ\í<J\'@L®b½L\İz\å	','Guadeloupe'),
('\Ñhn-†øK—¨<¾O%ø@','Guam'),
('k\â?\÷®¼IŞµV†\ñş\Ó','Guatemala'),
('\î(£\îD\àƒ‡Zƒ\ò¼','GuinÃ©e'),
('(o\0x\nBç®a$','GuinÃ©e Ã‰quatoriale'),
('\öeµ0I/¹%‹R\Ûng‡','GuinÃ©e-Bissau'),
('Œü@-fN\å²yz>M\å\àX','Guyana'),
('\0ş|S3±KË€(D²\\˜­;','Guyane FranÃ§aise'),
('\îM»GÚ•¥µµ4½','HaÃ¯ti'),
('FLÉ–ŠJˆ®O‘ÁF|+^','Honduras'),
('ª?\ĞH\ÉZLs¢\Ïi–n»`¸','Hong-Kong'),
('IG¾µFC\ó¿ IJQ¼Á','Hongrie'),
('\Zş+\Â_XEu¥\ßDY=4','Ãle Bouvet'),
('Š	¯\Ğ\ğ\rDf¶\ÚÁ¬œ e','Ãle Christmas'),
('´„F\Ø\ß:KÕ§^z#mK\ç½','Ãle de Man'),
('kN€³…uLa¢H	\Å\âûiW','Ãle Norfolk'),
('\ÕL«Di†\Éún7apœ','Ãles (malvinas) Falkland'),
('Îš¢\ísG«¥VJ&;Á\Í','Ãles Ã…land'),
('z{2½G‰‘^*a»2O','Ãles CaÃ¯manes'),
('LM\î.\ÆfFr—fi\\ŸŒ9','Ãles Cocos (Keeling)'),
('¬2\Ûk8\ÚM µŒ”ıP','Ãles Cook'),
('k	)œeJ›S²R™7 ','Ãles FÃ©roÃ©'),
('+~gZ¡oC‡¶bt\'}§Ö›','Ãles Heard et Mcdonald'),
('‡X€<\÷\ÈF‘–c‹\ñ#\Ïv','Ãles Mariannes du Nord'),
('‘\ß\"˜$@q°-37:¥(','Ãles Marshall'),
('^\â\ğ\r\ÄCÒ˜u›E«´\ñ,','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('Jfü\åm8A\á„\\\ñR\å\Æ<Y','Ãles Salomon'),
('W^J[YIJ©¼\×q\Î~p¾\İ','Ãles Turks et CaÃ¯ques'),
('FŒk\ö\ËB…‡œ‹l–°8','Ãles Vierges Britanniques'),
('‚İ§\è\ãBÊ€#¼Gpü\Ä','Ãles Vierges des Ã‰tats-Unis'),
('ş\ã\Ş\"\0C ˜…2\Ü\á\Ã\0','Inde'),
('Ú¨\íŞ¡[N\'©ciR','IndonÃ©sie'),
('¢^d®B}ª\õ)\r\ï0<\Ü','Iraq'),
('d!_\à~N“‹$Œšy½','Irlande'),
('\æR1;DØµ\Ê>C\õ¹','Islande'),
('¬‚V M‘·$9¥vD1½','IsraÃ«l'),
('Ã‚uKKI^’–\æ@\Ñ\Ét','Italie'),
('\ê4ˆ¥\ßG0¾‘_\ó\Û\İ\Ô\ã','Jamahiriya Arabe Libyenne'),
('qş\áùÁ\öBW­\÷‰\âÀ©-','JamaÃ¯que'),
('İ¼\ß\Ö\\J¨£.|U\ìl\Ü','Japon'),
('¡Ë³ü\Ï\îMFƒfÜ˜ú\\/','Jordanie'),
('jH ”F³¾Ê¹cJ^}','Kazakhstan'),
('¤b’ 0\\FX€ù\Ø~ú\ÈQ','Kenya'),
('³3¥KD‘¬€\Äø+¼$','Kirghizistan'),
('9?\òI›\÷G°Á•]f¯½','Kiribati'),
('\ß\Û\÷\óUÿA„±k°3c»','KoweÃ¯t'),
('.vV\Ü\Ö\İD¶ˆ‘¬ı;o\Ø','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('dc\÷\ò\ÙMı˜“\ñ+6ıª)','Lesotho'),
('mXiHpCŸA@XªR²','Lettonie'),
('\ñ\'a¦ª\ĞL¿”ı*i¥\Ø ','Liban'),
('›:\ä³H&®Å¦ü^\"i#','LibÃ©ria'),
('¸fy[\ŞFº\ßA\'ÿ#}\â','Liechtenstein'),
('(/6f+>H´~ı„5»E|','Lituanie'),
('D\\†ƒ–ÁNG°!9ˆ\Ñ\ğQW','Luxembourg'),
('\ô¥¶Í°zN¢Á>SkÀxj','Macao'),
('uJ¦\ÒC¾±ş\×\ì\Â\Ş\ìt','Madagascar'),
('\á\ñÄ¸G‰·7\ñ\õ=°\ô\Û','Malaisie'),
('1·\ÏKB«H;©ºMœo','Malawi'),
('²yC\çPfBÄ¨\ó°$\ãrƒ¨','Maldives'),
('aœ\Ö1—\ĞGƒªu€?£€=','Mali'),
('{¸“5˜\ÙI¢ªÊªfoe³','Malte'),
('»MX’Në®ª;/¨\ÊP~','Maroc'),
('tR–?›\ÛNE¿\'f²\Õs','Martinique'),
('?\ì:^I„›	sÀ\ä\ãª\Ğ','Maurice'),
('\Ñg\n\âV®L˜Œ‰\ÛÉª\İ\Ë','Mauritanie'),
('LE;<GBL’ı\â\nE\Å','Mayotte'),
('Â©\Ñ;b\âF®‰\ç?®\ö§t','Mexique'),
('«€’5=Gª›ghV;\ÂU','Monaco'),
('>ª¶D”HÉ—\É/\Ò\÷','Mongolie'),
('‡°A.ÖDš‘i“\Ğ\İÿ8e','Montserrat'),
('ş±·6\ÖA£\ôû1','Mozambique'),
('acO\Ò\nK\á¿H½b¶¹JA','Myanmar'),
('\n\çQ\çY¯La–\á\0\ìL*I','Namibie'),
('Ÿ»\å³H6“pš\"<Ó¨l','Nauru'),
(':q¥z¨\ÆO˜\î\ëÿ‚|Ä³','NÃ©pal'),
('\Z‰š\n `Cˆ°\èc\ğ+2eI','Nicaragua'),
('7\ñ\ÎN\Ï\ØIÖ†\ãW•Z1','Niger'),
('Qaj\Æ{\'Eş–a\é\òi/V\ó','NigÃ©ria'),
('¨‘+G¤N§8šø?-ú','NiuÃ©'),
('$-–8\Í\íNš±×Œ\'g·²\Ò','NorvÃ¨ge'),
('\åmšª\ZDĞ¢L¤\Û/\ëøY','Nouvelle-CalÃ©donie'),
('Á\ïo\İCÎ¿ı\Í\nG²\İ','Nouvelle-ZÃ©lande'),
('\ŞıŠ\áJÆi\õbb','Oman'),
('\Z(\Şs\òN£ŠŸÖ\ÜÆŒ','Ouganda'),
('€¬E^¼J­šmFa:\Õ','OuzbÃ©kistan'),
('8 l\ãKŒ˜ªÏsY','Pakistan'),
('\â\ã&¨A¼\ô<\â\ÚÉ”','Palaos'),
('¨\è¿\ÙWL3¦’7u¾Jt','Panama'),
('1½\è­4FÖ–Z/ì¹³¶','Papouasie-Nouvelle-GuinÃ©e'),
('£_DÈ¦@K·\Üp\Ù?ØŠ','Paraguay'),
('†\Â$LxBŒ®\àT\Â[jme','Pays-Bas'),
('ùq\Z¼¿Dë•¿\Ô\Â\Ï','PÃ©rou'),
('\ö8\ß\é­C´di„)\ê','Philippines'),
('k¿j!CÌ½GnB\îbo¢','Pitcairn'),
('ç®ŒOƒD´‚K–Í™²','Pologne'),
('+Š-Q‚Ig°+AJ\Ã}','PolynÃ©sie FranÃ§aise'),
('›Ò¹»	—O‚‘g¤\Õ\ÉmW£','Porto Rico'),
('7a\Ût\ïEß K±$YOYm','Portugal'),
('N\ó9\Ñ\ËO@[–úGû#n','Qatar'),
('W\Zi¿\ÕA‡8pˆ¿%','RÃ©publique Arabe Syrienne'),
('©ş\á\ä—\ÌN¨\ÜÓ¦J\0¿¤','RÃ©publique Centrafricaine'),
('¾d\íWB.ŒMm4šs','RÃ©publique de CorÃ©e'),
('aÔ’\×\ÅB«½A?!\Ô,Y`','RÃ©publique de Moldova'),
('ùıj\ÈNŠDt™\á%·)†','RÃ©publique DÃ©mocratique du Congo'),
('üŠfOB=£Û¡-‘\Ú','RÃ©publique DÃ©mocratique Populaire Lao'),
('#	\÷\ğ@\ôº\ã,Ÿ¹R\ğ','RÃ©publique Dominicaine'),
('99\Ø¡_@Z£2\Õ?\î','RÃ©publique du Congo'),
('\Æü\ê\å\Ï\ÌO\è¼\ç\ä\Ú\Í\ãe2','RÃ©publique Islamique d\'Iran'),
('‡p‰Qn¹GN˜\íš\ä\Å~•','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('Í£\"w\ï)KJ²W\"±)¡«E','RÃ©publique TchÃ¨que'),
('a©iI\'™L€˜\Åni—\ô\ë','RÃ©publique-Unie de Tanzanie'),
('l\ÎW\ÊN|F¨–‘\Â!~','RÃ©union'),
('eü\êAB¨©6\é#ƒ\ìˆq','Roumanie'),
('DŒ\Ğ\à·QLY»\åo?X\á°','Royaume-Uni'),
('˜…¹\îHK¹I€¾úÖ°u','Rwanda'),
('\Ü\ã¼qÄœI¼È·\ÛIzkw','Sahara Occidental'),
('¶’*İƒE}¨ˆš¨8\Ì','Saint-Kitts-et-Nevis'),
('\"²ªÊ§¢DŞ“ûNÁ\áy','Saint-Marin'),
('\0AŠ±D”M¯¸\ã\Ù\Ù\Â¦','Saint-Pierre-et-Miquelon'),
('\Z2V¥¶DD”1\÷†V\"v','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('\ï]\ğ^1\ÉC\õŸ†Ì\Ş\Ï','Saint-Vincent-et-les Grenadines'),
(',\ì~C\ÃhB—ƒ­XVù','Sainte-HÃ©lÃ¨ne'),
('¶\Ê¯\ÒH8¼(™şÒ·\ê','Sainte-Lucie'),
('T€]V%•JV´Ef@ªMiˆ','Samoa'),
('JZm\Õ\Ö>IW­QšD_<\òŒ','Samoa AmÃ©ricaines'),
('\n§SUŠK…\0\Ûã‘°4¿','Sao TomÃ©-et-Principe'),
('¬\ñŒC\r°³«\àK…\ô','SÃ©nÃ©gal'),
('H¸{>pFd¬š\Ä6\å:V.','Serbie-et-MontÃ©nÃ©gro'),
('F&\ìmgwFaœÀ®„\Ïiˆ\Ç','Seychelles'),
('wÂ³pLÈŒĞ£m$*µ\ì','Sierra Leone'),
(':Î­…CHK‰¿´\ny[\òO³','Singapour'),
('Jœ¨¼\ömO¸ˆ­}\î¶@\ä','Slovaquie'),
('>—¯D\õM¶­1j','SlovÃ©nie'),
('…Hú\çN‹§>K…\äEºk','Somalie'),
('\ãFüŞ©´Eb¡\Z\ô\Ñdú\Õ\÷','Soudan'),
('@j\ï…@Ø·\÷#\Öa\ÈD','Sri Lanka'),
('ı«1D>°]s4\0g™®','SuÃ¨de'),
('QaÜ€Q2G:€\rœ\Ô9d','Suisse'),
('\ÚÀ\ÈK¹Gˆ(N¨‰\ì','Suriname'),
('\ô‡#ü3BS³?ÿÕ zb\n','Svalbard etÃle Jan Mayen'),
('H”\õ¨\åJZªr\âÿQ\áe“','Swaziland'),
('4\n‡\ÈhB\íƒ(o\É\Õ\Ì','Tadjikistan'),
('\ï+ş)$ŸN¥…8\ÙN¹=','TaÃ¯wan'),
('¯w\ê‰6¤Cw­\äşK\Õ\ò\Ú','Tchad'),
(' ¯ÿ)¢F&¥3Ã´’\Û\Z','Terres Australes FranÃ§aises'),
('˜m~I@²8eW\Å','Territoire Britannique de l\'OcÃ©an Indien'),
('«\ÌÆµƒsCŒ&Ç§Ÿ\Üø','Territoire Palestinien OccupÃ©'),
('!d“o:\îHŠ˜—i\ò>\Ê','ThaÃ¯lande'),
('\Ó\Ì“-\ØEG…ü\ó–£\ì\ök','Timor-Leste'),
('!¾\êZYCA£™U\0ŒS1\Õ\Ü','Togo'),
('H±dˆûCi¦»³„=\'','Tokelau'),
('bC	@Lş§›tV\Õ0_','Tonga'),
('\ãXdÆ·ÀCÈ€\Ñ\"R?O','TrinitÃ©-et-Tobago'),
(' -\æø²F †(‡ºym\Ş:','Tunisie'),
('¶\ê JBpA—ì°™p\íh}','TurkmÃ©nistan'),
(':f\rı­tHD•\Î-(¿t','Turquie'),
('¹ƒ„H_\Ñf\Çø7','Tuvalu'),
('½Y“®«O…‰\Ì\Ì8¢—\é{','Ukraine'),
('U(iRE\ò·¼µZF}','Uruguay'),
('€³\ìı¯KˆŒ¦y\ÄA\è\ôb','Vanuatu'),
('ˆ¶\Â\\{H#±8\ğK\àw\ê','Venezuela'),
('®Ë±H`!A¸\ğÆ¨A\õ¬','Viet Nam'),
('cÂ€u,²Cl– V\Òä¼¹','Wallis et Futuna'),
('\n) \Æ\ÙEO]–\ö\Ú	‰\Ø	','YÃ©men'),
('¦ƒŠO¥¡‡u\É\Öi7','Zambie'),
('80\à©g\ëL\'Š\÷yt¸\ô','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-22 20:33:20',2),
('DoctrineMigrations\\Version20240201152951','2024-11-22 20:33:20',1),
('DoctrineMigrations\\Version20240202084749','2024-11-22 20:33:20',1),
('DoctrineMigrations\\Version20240202150901','2024-11-22 20:33:20',1),
('DoctrineMigrations\\Version20240207105701','2024-11-22 20:33:20',2),
('DoctrineMigrations\\Version20240319212437','2024-11-22 20:33:20',1),
('DoctrineMigrations\\Version20240614133504','2024-11-22 20:33:20',7),
('DoctrineMigrations\\Version20240617165906','2024-11-22 20:33:20',6),
('DoctrineMigrations\\Version20240708061729','2024-11-22 20:33:20',7),
('DoctrineMigrations\\Version20240801202153','2024-11-22 20:33:20',2),
('DoctrineMigrations\\Version20240815153823','2024-11-22 20:33:20',1),
('DoctrineMigrations\\Version20240916065051','2024-11-22 20:33:20',3),
('DoctrineMigrations\\Version20240929091802','2024-11-22 20:33:20',9),
('DoctrineMigrations\\Version20241002164506','2024-11-22 20:33:20',5),
('DoctrineMigrations\\Version20241119144432','2024-11-22 20:33:20',9);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-22 20:33:21','root@gmail.com');
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

-- Dump completed on 2024-11-22 20:33:22
