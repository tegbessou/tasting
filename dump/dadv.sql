-- MariaDB dump 10.19  Distrib 10.11.7-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv
-- ------------------------------------------------------
-- Server version	10.11.7-MariaDB-1:10.11.7+maria~ubu2204

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
  `owner_id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `country` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `saved_at` date NOT NULL COMMENT '(DC2Type:date_immutable)',
  `tasted_at` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottle`
--

LOCK TABLES `bottle` WRITE;
/*!40000 ALTER TABLE `bottle` DISABLE KEYS */;
INSERT INTO `bottle` VALUES
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',259.99,'2024-03-19',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',999.99,'2024-03-19',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',2999.99,'2024-03-19',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','\îo;ÔˆC¾±ı½\Ë\nl','Italie',899.99,'2024-03-19',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','\îo;ÔˆC¾±ı½\Ë\nl','France',1599.99,'2024-03-19',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'\îo;ÔˆC¾±ı½\Ë\nl','France',358.99,'2024-03-19',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','\îo;ÔˆC¾±ı½\Ë\nl','Australie',1799.99,'2024-03-19',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',1099.99,'2024-03-19',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','\è˜NE\ÍDÔB\õ\Ä\æ½a’','United States',199.99,'2024-03-19',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','\îo;ÔˆC¾±ı½\Ë\nl','New Zealand',49.99,'2024-03-19',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Italy',899.99,'2024-03-19',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','\îo;ÔˆC¾±ı½\Ë\nl','Espagne',1499.99,'2024-03-19',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',1299.99,'2024-03-19',NULL);
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
('\ß8ŸAÜ³r3\0¬\õvY','Afghanistan'),
('[\Ä~R\õzO\ğŸ¾.@Iû\r','Afrique du Sud'),
('sh\ŞºN…“û7§G”y+','Albanie'),
('û+]Œ†\ÔBo¨m*‹ş\"7','AlgÃ©rie'),
('7I§³\çLÏ€~\êûÌÑ¹','Allemagne'),
('\0W3!‰\ÌH\æ¶f8§—_','Andorre'),
('1\é\á\ÒFƒ¯%%€°df','Angola'),
('\å$O\ÂR\ÇIë€•x\Ó\Ï3','Anguilla'),
(',\İ€%F;‚\ï\ÓP\éc\æ','Antarctique'),
('8ÿ\ñ\ÈLˆ†\ÃCª','Antigua-et-Barbuda'),
('“Ÿ\ò+\ÌgKA—0\Ô9\ôQ','Antilles NÃ©erlandaises'),
('Ha\ñ¦ZŸDz\Ô\æ\Ó\éW\n','Arabie Saoudite'),
('iÆ´+o\ëDLd\ô‡','Argentine'),
('¢|€…W\çCÖ¯\Ù\ô Œ\ó„','ArmÃ©nie'),
('š=\Ğ×‚NT€³Ø›¼\Ò\Ç{','Aruba'),
('\ìBM<C¡Ä–Mü\à\å\ñ','Australie'),
('DK?\ô\èpC´D8ßªX','Autriche'),
('¤5\ä\Ó>FĞ®\ælú51’','AzerbaÃ¯djan'),
('¢WbI¿D0 }`\ä,','Bahamas'),
('\Êù7<:N6´N\Ûm„R \ã','BahreÃ¯n'),
('b¤e\'Do®,Ï¾¼Tn\ß','Bangladesh'),
('É¹¿\ÄJÒ¹\äeZ¶ƒ*','Barbade'),
('\î\â`N\ì\à\Ş?2º©\×','BÃ©larus'),
('E«µ‡Bù³ÇŠ»\ë{','Belgique'),
('d:×­¬uAÓ¹D\Ù5`e\'f','Belize'),
('I\ÒtE\n¡I	¾–«i.y-5','BÃ©nin'),
('«t‡ŒƒAµ¯\ñš¤J\Ë','Bermudes'),
('Ce 4ªiH¶\ö\rÈŒ’\õ_','Bhoutan'),
('\'\í\Ã\ØuG†Qº\å(','Bolivie'),
('\àavı\â IÎŸ’3Jw1','Bosnie-HerzÃ©govine'),
('ø\Ôø£¸MJ »‘_SmÕ…\È','Botswana'),
('±RC=]£G-·ƒ\ë\ãF\Z','BrÃ©sil'),
('¬\â‡\nƒ‹Mıƒ€¥Ê¦\è','BrunÃ©i Darussalam'),
('•Yˆ¥+ŸA®¶ÿ‹}\ìH-','Bulgarie'),
('­«Mş0Jÿ“	¹”Ğœ„ª','Burkina Faso'),
('\Ôn¯h›EÓ¹\ó2\ÓZ\ëú','Burundi'),
('\ék¿€œgO´ù°\ò8†|\á','Cambodge'),
('úD­Š¹@?%Š[úrª','Cameroun'),
('\Ş\È7\ìC§ ~ªMƒ;\åQ','Canada'),
('E¨üùW\nOg‡\Ä@/€E8s','Cap-vert'),
('©Y¾“\ÕO\r”^DT\ôfN\Ç','Chili'),
('1g\Ã\nŸ\ÕIh° ¦š\Ö\í','Chine'),
('Ç‰É’}\\EÔ„³#kÀDvf','Chypre'),
('\íş¾\ßTC	ƒ\õ\Ş!/f¨\Æ','Colombie'),
('AP\ã\ômBs»Daş:µA','Comores'),
('O)T/O*€\î9Po/\Ã5','Costa Rica'),
('œ…7@œ‡\Zz‡eƒ¬','CÃ´te d\'Ivoire'),
('Ÿ\ïÁ>MCR <—š\È\çB\ñ','Croatie'),
('µ\"/\Z¥#KÑ–hk\rof´','Cuba'),
('–q\îv\Z#@]pyo<\ò','Danemark'),
('\ö€´\ğ\ÂyC? 2A¸`ÿ	¦','Djibouti'),
('4=2Q†C@~¯\Ä«º\Ş\ê\'','Dominique'),
('ûù1 e<Bl„o°Lk…','Ã‰gypte'),
('gw\Êø`‹@‡mÚ—+eÀ','El Salvador'),
('LÛ˜šNDŸ³XR2Û«•U','Ã‰mirats Arabes Unis'),
('D¸¸…›ƒD››ÿ$¹V\Z¬‰','Ã‰quateur'),
('\ñA\ïA\Ó}M‹·úœD\ê5','Ã‰rythrÃ©e'),
(':;\äK,\ÄMr¶/ıŸ\è§\í¥','Espagne'),
('ıu\Ç\è¡K±´™ ¬\Ã','Estonie'),
('£)}\â\ÃBù­ªw<³)?','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('(s>2©\ôNr‰\çş¹˜.?','Ã‰tats-Unis'),
('\Øú\ô\\€L«­–\r:;M.}','Ã‰thiopie'),
('Nj0\Â\ÚMŞ¢t¢µF:','FÃ©dÃ©ration de Russie'),
('\ğ\ë=AyCÁ‹\õg£Æ˜','Fidji'),
('z¿lIş‹H\â\Ì\é¢ ø','Finlande'),
('¡¸\í\"ª\ïJa•\ğ4¼\ç¯','France'),
('\ó_\í\'«O˜†\æ}~šF2','Gabon'),
('Å 7Å°MFŒ=ùi†\×}P','Gambie'),
('p|`á„¥M£y\ãh>F\â\ï','GÃ©orgie'),
('\r\ÙF×®ˆI‰–\0\í\ó\n\áÀ','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('\n\ÍVa{KÎ‰vDuşÚ’','Ghana'),
('9@3\\dF\ò–2\Ú\É\Ûp','Gibraltar'),
('rV‘CŠC£D&•©_\Ò','GrÃ¨ce'),
('dŞ€\Â\åŸBÊ°fAŒzC_\ó','Grenade'),
('\nˆI»\çOe…k\Ü9„´\ÓN','Groenland'),
('9/Ssø@Q²tFL.\Ï=','Guadeloupe'),
('\\\çd¼ıûBg¢]\åOú¤\ö\Õ','Guam'),
('\ÖU^Ú¹BºbĞªÿ\ó(','Guatemala'),
('šˆ:x\ôG“¤šl.\åı^','GuinÃ©e'),
(' 6\\\"( F“ŸÊ“©\ÉXc','GuinÃ©e Ã‰quatoriale'),
('\Ò]Ô®½™A*€RJ”\Ê\î\\‹','GuinÃ©e-Bissau'),
('\Z\åŠÅº\éC®m\Ô`\Â\r\è¾','Guyana'),
('µ\ë˜9~C©›H\r†fU\Ş\İ','Guyane FranÃ§aise'),
('«Á<š}O\á‚>G\Ì\ğ','HaÃ¯ti'),
('O®øDH@Œ}\ä{\ì¶\ì','Honduras'),
('I\ĞS­iM¢\ÏF7 \ç%†','Hong-Kong'),
('9]Ag«\ÂCM\İ\Ê30Ü§;','Hongrie'),
('€\\[^zJbn\nÓ¸˜\Í\Ü','Ãle Bouvet'),
('\édx–<O8°\r\éRL\×D\ç','Ãle Christmas'),
('Ø¤p\ñ‘LTœ)¼\á\æŒ\àJ','Ãle de Man'),
('Yş\Ï\ğLKÜiŠn\'x\Ó','Ãle Norfolk'),
('q9Eş¸£\rşNp','Ãles (malvinas) Falkland'),
(',Mo,.­E]¾ˆf¿6³\àT','Ãles Ã…land'),
('¨\Ûï•G­@uM.ZV†','Ãles CaÃ¯manes'),
('ú2dux\ÅB*©CŒ–\ô—','Ãles Cocos (Keeling)'),
('y<5˜\\L•(0îŠÀ_','Ãles Cook'),
('1»²\ÆÀJŒ şûÚ¹bR','Ãles FÃ©roÃ©'),
('+\á\ä’~M@\ìŸş$Œ¥¯#¤','Ãles Heard et Mcdonald'),
('ƒU\Ú<\nJ<µƒ=\"YÀ€','Ãles Mariannes du Nord'),
('–¿¼\ò¿G¬©5\Û7C','Ãles Marshall'),
('\á\0/l5IGO•\×Mƒ»a»','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('’Ù‹\Â\ÅE¿’²\íC¸','Ãles Salomon'),
('Ú¢bøpB”‹\Ğ@—Oƒ\İ\Û','Ãles Turks et CaÃ¯ques'),
('€Ášp–@U¹¾§','Ãles Vierges Britanniques'),
('Ÿ\Õ\âT¶ıMÃ§A\Î[¯K\ĞÁ','Ãles Vierges des Ã‰tats-Unis'),
(' ¯ª{Í€HÜŸ*\Ù\Öu„','Inde'),
('p\ÒA\ğ•CD…Q{:hş¬¾','IndonÃ©sie'),
('†8x\áIÏ³HÉ 8£','Iraq'),
('‹©	KmK;§®\Ä@,\Æ!','Irlande'),
('0(±+Hn“\â*P—0`','Islande'),
('Š\Î$r\îCÅ’\×j7\Ó\ğ—','IsraÃ«l'),
('7o#B›KÊ†\n¦i8W','Italie'),
('\r¦\Ë\Ø*AıÕ¬¯É¸','Jamahiriya Arabe Libyenne'),
('\ì®v8IC\ö£<\ñ7‘\Æ*$','JamaÃ¯que'),
('\íS\İ$@«šŞ©°\Ë\0q°','Japon'),
('\å	\\h\ÏO\r£¿0K\ß\à,','Jordanie'),
('ª\Õ2;E\"‡Œ\È7\Ö^\"','Kazakhstan'),
('\Ê\ÖüKë«‡æ“²ƒ³','Kenya'),
('µ\ru¶H@›]ÿ\èa†','Kirghizistan'),
('G\ß\Zz»@h˜¢»<b‘•','Kiribati'),
('3\Ê\ãÓKJªX\è_S•o¥','KoweÃ¯t'),
('46È v@a–M8Wg\ö\0','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('fLy\ÏjMe¼<øÛ½\ÒV','Lesotho'),
('W7\è©\ö\ãA\íº$\ë¸U\â_','Lettonie'),
('˜û#f@Ê™[µ>k¶Ÿ','Liban'),
('ºn\Ë	»OŠ”\ç\0\Ä\Ú\æÕŠ','LibÃ©ria'),
('‰º\Çtı\'Kâ Ÿ\İø@Z\É','Liechtenstein'),
(',\ğ|?HM@©ƒ‚’‹ü\ï\Ú','Lituanie'),
('†\"bOQA\"¯&\Ø~´LF','Luxembourg'),
('²£\r\åfA‘‚ù‡±','Macao'),
('ÉšŸaG?¤¼:%z…\Ş$','Madagascar'),
('\Òül~5A\ïŠ\Ñ#2\ó i\ä','Malaisie'),
('\éF…\ÜO„¢ê–¤\ß\ô;\å','Malawi'),
('Y\È\Ş5N\ë\æz\Ë\"D¯S','Maldives'),
('a\ß\nwOŞª\Òq$‹\ç6€','Mali'),
('b\Ö\ô£%Kl£,Ë°C\é~','Malte'),
('”Ç½vŠMu»mfxj\÷','Maroc'),
('\"\îR˜]\ÊN»Úˆ\Ù\Ä¸\Ü','Martinique'),
('ß“\ó6|E±»\è4,\Ê\ç\÷\Û','Maurice'),
('++¿ªD—ÿ5\0¹%ª','Mauritanie'),
('\õ\ôü–{Hu‡€Œn\ô\Ãn','Mayotte'),
('\Ç1\îZŒ@\\‹ı™ÿ\Û\"C','Mexique'),
('\ÙşD±Ø¨Iì­’ˆú¢=\0','Monaco'),
(':U›øı@\\ŒŠı#’±‘~','Mongolie'),
('\õ$\à+\Ì\'EÆŠ\Ú|\Ùy23u','Montserrat'),
('\ç²J\\#WG”‰Û…súF','Mozambique'),
('P  (ı\İDK¼Œ8\n¸ùX','Myanmar'),
('\åh„HhHŸ¾l‰ÿµ„Ô•','Namibie'),
('\ì\n¾\ìKÇ—\æf`\ß)`','Nauru'),
('F-@%‰Mù«ı†±û\ê','NÃ©pal'),
('£ıƒG9A“¤#©¼\ËG','Nicaragua'),
('^L²«M]•\Ï*(>Ş†\Ñ','Niger'),
('f3—C\n€sEd\Öft','NigÃ©ria'),
('Ç¨Áf·sE\ö’/\ì\Æ\İ\ä','NiuÃ©'),
('D\å}GD¥„U|št','NorvÃ¨ge'),
('İª-Z@H…À\à\Æ-\î','Nouvelle-CalÃ©donie'),
('Nºt\ò)L¡¨ƒÀhœ','Nouvelle-ZÃ©lande'),
('Wz\×F\åF\îº8…‡‘I-\Ì','Oman'),
('ƒn7Ü¯]F\õ_¤h\àú','Ouganda'),
('z¨\ì$\ÏAª\ÈP£¶“n“','OuzbÃ©kistan'),
('\ğ\êY\ğXWN©\ê8\Ôna^','Pakistan'),
('lp\õ\æ\ó—G×ƒÏ¶Ii\î\'\0','Palaos'),
('ş\ÎpjJo¶\â\óa”K\İ','Panama'),
('\ÅMm”AI¿›b\ïxIX','Papouasie-Nouvelle-GuinÃ©e'),
('øzÄ»SE—Ad¸\ÌZ	\n','Paraguay'),
('\ïÅ€}J”–\Ëcd~»É’','Pays-Bas'),
('\Ñ¯ø8\îC™»	4\õr›f','PÃ©rou'),
('¾\íÇˆ¹\ÃJş¾\ËvP\î$\æX','Philippines'),
('•\ëÒ˜\Í1Dù¨7}\Í\Å#','Pitcairn'),
('hŠ\ñN/N«¼\ê\î«(ƒú\Ú','Pologne'),
('\ã¿\èüšBC§32½\éJ\Í\ì','PolynÃ©sie FranÃ§aise'),
('\ì\ÊK™yFt”J\ç\Ñûk','Porto Rico'),
('¿…½\ô\ÊK™³ƒLK)©d','Portugal'),
('øn¶¯K‰O[š:ùºF','Qatar'),
('\ña˜Y\İ@I[‚\Í\Ç\â	D\æt','RÃ©publique Arabe Syrienne'),
('Ã­³oN\ğ”BÃ¤™Ù¾\ä','RÃ©publique Centrafricaine'),
('s“Š\åıqD\å¥\ìÍ²‹O°','RÃ©publique de CorÃ©e'),
('\Í@\Ò\çBB\"£±9ÿm³\Z','RÃ©publique de Moldova'),
('QÊ‚y\Ö\rB ®£w3\Ø:~','RÃ©publique DÃ©mocratique du Congo'),
('\Î\ö/¸\Î\ïL…œ£yKU”Ü°','RÃ©publique DÃ©mocratique Populaire Lao'),
('›`\í\ÌSON…(¯ \îk]2','RÃ©publique Dominicaine'),
('\02#´\èLŸ>Ôß¤Mi','RÃ©publique du Congo'),
('\ô;\ZbP§C¦<±&® ','RÃ©publique Islamique d\'Iran'),
('\Ãú\è¸(B˜º\ìRü¼','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('\n\ÑcŠ\Î@’\ëa/ü€û','RÃ©publique TchÃ¨que'),
('w7ºØ†DiŸ\Ï\ê\ß/}&*','RÃ©publique-Unie de Tanzanie'),
('«MP«•IA§qøÁ/\ôŠ‹','RÃ©union'),
('³‰°P©¨Jq¥ÿ[\à\Z\ë‡','Roumanie'),
('f™:±\n­A¹Œª\æ1:B','Royaume-Uni'),
('…ÿb3MŒªW¥kpOG\Æ','Rwanda'),
('\óQmU\ØL™Ù­yü\\G\n','Sahara Occidental'),
('&B\"%¦H\è£\ÔøRbV\á','Saint-Kitts-et-Nevis'),
('30$¼ŠMºSIs­\Ì{','Saint-Marin'),
('\ï\ñ\ó…lI\ô¶°\éû¦ª¼#','Saint-Pierre-et-Miquelon'),
('­\â†\÷=<E¼¯z*še<','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('E?\İ5IR‚\ßør\Ö\ÂÏœ','Saint-Vincent-et-les Grenadines'),
('\ë)°®PM—¿¸\ö™S—\ë','Sainte-HÃ©lÃ¨ne'),
('f’ş…:ºDç¡œ\Üv‚%†\Ğ','Sainte-Lucie'),
('ap\ö–B˜~ÿ*]Ö¦G','Samoa'),
('¿À¨\ßRÿ@Ó‚\Æ\ßeV\ò«','Samoa AmÃ©ricaines'),
('\Ù¥z\r†C–TT†\Ê\ë','Sao TomÃ©-et-Principe'),
('P…CK\ØDr“®\n\Ó:~\Æ\á','SÃ©nÃ©gal'),
('\ë\Ç5¹\íTLá…6#Õ·u','Serbie-et-MontÃ©nÃ©gro'),
('K;UM6G¯•	ªm\Ú\Ì','Seychelles'),
('¥\îZŒO]“N“\Î%\ß:','Sierra Leone'),
('…¬M\ë\×\ÃJS‹\Â\Ú8¨L','Singapour'),
('&ùy\ÇgC\÷„|“\Ó\0x','Slovaquie'),
('\ÒÏ\ÍGº·Ê£i	=®\ë','SlovÃ©nie'),
('ı{iµ\Ï\åEK§Ô†–\"–•','Somalie'),
('b\Ô\Ù	5LÑ–\ÖlÀ.½','Soudan'),
('-™ƒ\×\ÏJz°¯XS›\Z','Sri Lanka'),
('–Û	uûAÏM*.‡\Ü\"','SuÃ¨de'),
('?P0\Ò\İKçº»`L5Š5\È','Suisse'),
('šg\ÖcE\å‘\ëIp²>›','Suriname'),
('\Ï[ĞµQ\ÃKKºY›iür\ğ','Svalbard etÃle Jan Mayen'),
('™­®Gf¹Z«Ø¿Á\÷','Swaziland'),
('¬–\ĞkËƒE»«s\Ñ+ [5','Tadjikistan'),
('\éÇº\ÙEe“+™˜-³0*','TaÃ¯wan'),
('pY,\n´\ãLb†A~ú6\ÛJ\î','Tchad'),
('µ¡(5NÜŠ\óRSıÀ','Terres Australes FranÃ§aises'),
(' ¾¢B\ÚN6“h\òŠ®øT\İ','Territoire Britannique de l\'OcÃ©an Indien'),
('\×SŸ°MfœFÎ‰_½\ÚA','Territoire Palestinien OccupÃ©'),
('\é‚\ã/\ëuCd®]\á\ç\÷E?O','ThaÃ¯lande'),
('cEK\ßÇD·‰¾1¸¬ıl„','Timor-Leste'),
('\Óa°\ëE2¢\í9\ÖRCB','Togo'),
('‰3\Ä\Ö0Eù–\Ğa\â€\ïhy','Tokelau'),
(' \×MÎ´F2¢;d}CU\É','Tonga'),
('\ár\ë”œG‹Šz\ä‘%\è','TrinitÃ©-et-Tobago'),
('^¥voG¥A \É\\\Ó)','Tunisie'),
('\ÍJºı\'kF³•Ä¡Iu›\Æ<','TurkmÃ©nistan'),
('¡)\'´IND¶}\ä°Ò¦@[','Turquie'),
('\ÆeV>5MXƒ•n†¿V','Tuvalu'),
('\Z\ãù\ÖKIOBOµ\Ã','Ukraine'),
('\Ş!4\ÊME˜ùaF)=‡¼','Uruguay'),
('Ù©7\ék\ŞD:‘[>*c#\ë','Vanuatu'),
('jf¾,}UE,>¾7b\Ô','Venezuela'),
('®b\Ür—\ßO½•[t\Òv','Viet Nam'),
('´\Ï@şšK1¹\ŞÀ=7\ï\İ','Wallis et Futuna'),
('Ÿ\ÃzF\à®8VDY$‡','YÃ©men'),
('\Æ\ÆU€Kv¿-,d#f\Î','Zambie'),
(',ƒÁF!jG?Œ–\Â²ƒ','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-03-19 21:25:21',9),
('DoctrineMigrations\\Version20240201152951','2024-03-19 21:25:21',3),
('DoctrineMigrations\\Version20240202084749','2024-03-19 21:25:21',4),
('DoctrineMigrations\\Version20240202150901','2024-03-19 21:25:21',5),
('DoctrineMigrations\\Version20240207105701','2024-03-19 21:25:21',4),
('DoctrineMigrations\\Version20240319212437','2024-03-19 21:25:21',3);
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
('\è˜NE\ÍDÔB\õ\Ä\æ½a’','root@gmail.com');
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

-- Dump completed on 2024-03-19 21:25:25
