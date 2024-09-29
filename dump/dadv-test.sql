/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.9-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv_test
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
  `owner_id` binary(16) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `saved_at` date NOT NULL,
  `tasted_at` date DEFAULT NULL,
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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',259.99,'2024-09-29',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',999.99,'2024-09-29',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',2999.99,'2024-09-29',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Italie',899.99,'2024-09-29',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1599.99,'2024-09-29',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'¾m2\Ü#M¿Œfh\Ñ3[¼','France',358.99,'2024-09-29',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Australie',1799.99,'2024-09-29',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1099.99,'2024-09-29',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\Ë#zO0±ˆj­q´s_','United States',199.99,'2024-09-29',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','¾m2\Ü#M¿Œfh\Ñ3[¼','New Zealand',49.99,'2024-09-29',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Italy',899.99,'2024-09-29',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Espagne',1499.99,'2024-09-29',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',1299.99,'2024-09-29',NULL);
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
('ùt\nø%MbZ\ö§O_\Ã','Afghanistan'),
('\Ìú\Å\Z]G@‘+\Ç9”“,º','Afrique du Sud'),
('\ÜP„Df£@¨xŸ\ò\Ç0\Ü','Albanie'),
('\æFIÀO8Ze\î_•','AlgÃ©rie'),
('pªV\ò‚\ËCj©D\êw\ß {','Allemagne'),
('Ç‡MV	E{\õ\ÕNy[CX','Andorre'),
('Ç¿ø\0Z\ğN‹°a(\Ğm\Z\â','Angola'),
('œ\àú/M*¼¨!7iø','Anguilla'),
('\Z\ÉHx\ÃaCjƒUQ‘•^bš','Antarctique'),
('W€²M~ŒL(“d3‡®ÇŠ','Antigua-et-Barbuda'),
('`”{r¤EB¦’Jb¶<:','Antilles NÃ©erlandaises'),
('­\Î‡O‰½mc\"\ÇU\Ö','Arabie Saoudite'),
('üuj\ÉFNpŠÈ‹û\ì(F\Ê','Argentine'),
('}~®=½FK»¨5d—Ó\ì','ArmÃ©nie'),
('…\â}\Í\nıGØ½@\íµ\Ê\æ\ğ\Z','Aruba'),
('’[\ïP?wE?˜´!\ê;·°T','Australie'),
('}.ÒŸ&DÜ‹¯\à\ò\ç‘l¦','Autriche'),
('!¶´?\nJE8’bµ£TQ','AzerbaÃ¯djan'),
('v@…KfL\r‹u\Ş*\ó^‘','Bahamas'),
('GŒ–?\ÂI®ŒvsºM–','BahreÃ¯n'),
('¾jÎ±\ä\'MNŸÀ\Ò9ÿ\Ñ\Ó\ç','Bangladesh'),
('V\×;\Â\ÍN-±\ï\Ùu\çÿ\rŠ','Barbade'),
(':\õ\İN˜AH©\Ûv­Â€','BÃ©larus'),
('6fz\"B1¸|$\ÕL†Y®','Belgique'),
('\ì™?M\İSB‰!şi“p\Ş','Belize'),
('«’Ù¨»\ÈD\à´\í“H§Ä„ ','BÃ©nin'),
('\Û\ë \ó\Ğ\ßEJ˜™[$›\ğ|','Bermudes'),
('>Fh\íl\ÈF\õ´®›¾aƒq','Bhoutan'),
('\ï\ô­\å\ö´LY›m‰\0!+\Ì\\','Bolivie'),
('\0\Ğ\ôo>¹I«µ\Ô_­’5\ö','Bosnie-HerzÃ©govine'),
('ä‹ª¶QLOH­¯„ˆ_v','Botswana'),
('û_SD¾IÛ†\Ã^u\×f\"i','BrÃ©sil'),
('Yd\Ë1yFEÎ–\Å:À\Æ\r','BrunÃ©i Darussalam'),
('²\Î:Z\\¦L.\×Î­†š\Ğ','Bulgarie'),
('´\Âù²ı\ÓO…¶ùÇ¾TÌˆ','Burkina Faso'),
('›°\é9FØ´C,úY','Burundi'),
(',¢\"®ÿ?EPş\÷\Ò6\è¾','Cambodge'),
('‚L“\Ñ&\ÜH9®w¾=\í½\Æ','Cameroun'),
(')\õ®‘AsD!ªø±ş|Av…','Canada'),
('\ÄLx`N@M³’7®8ŠŸ','Cap-vert'),
('	9{A,!Ou„”\ãuts+','Chili'),
('aL	6rH¬†T\ß\î4\õŠK','Chine'),
('­Ê¤\Ù\æ\òE‹‚Õ’\çú“','Chypre'),
('L\"m\\\Ç\ğK\Zœ\èt\Ñ)•\×U','Colombie'),
('É¬VE\Z\ÔCĞª˜g\ÕV˜','Comores'),
('8±m¿!\ÉIû—Š\é\ÍA†ı','Costa Rica'),
('˜*¹c\àA\õ¥S¸”ÚŸ','CÃ´te d\'Ivoire'),
('Ü™\n¸\òG¹\êTŸn\É','Croatie'),
('@\ïú\ÚO™ªo\È „\ÎC','Cuba'),
('Au\0\ö|eC°—tRD~l¼','Danemark'),
('\à)tGs\ÛGu·™–\ñ\õ2','Djibouti'),
('\\6~O ´<\Î\ß\×“\Ø','Dominique'),
('|^sİ³\ÆM¾œ\ãØ£İ—l','Ã‰gypte'),
('\r4*ÒpA\õ§Ge\õ²ƒ','El Salvador'),
('Yšlœ‘J‚»c´”&‚V','Ã‰mirats Arabes Unis'),
('\é)®4²@¼k‰D¤&ƒŸ','Ã‰quateur'),
('[\Zû’Opª\×\Üÿ9','Ã‰rythrÃ©e'),
('\â\ZmœnEQ€ˆK,¬‹\×','Espagne'),
('¯\ßE¥O\îK~ˆ/8\ë?a‘@','Estonie'),
('\í¬4¹\Å*Ek¥°\Ö„&LE','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('?Û°WCªu~š<?{','Ã‰tats-Unis'),
('İ€\ï\ôúG›ƒ£TJ)JL','Ã‰thiopie'),
('\Åj×ŸuCŸ—M\Å_Ch\á','FÃ©dÃ©ration de Russie'),
('²(z”’ NZ¯\ö\0n\'','Fidji'),
('pptDOÁ¤¯!©_…','Finlande'),
('X…\è©e\òA·ƒFnQµ+…','France'),
('\r!;U\ÜE¡²\ÒDK\rÁ1','Gabon'),
('\ï\Z\Ô0\Â\ä@Z“EB\õ\æ','Gambie'),
('\÷\Óhh£µG–¶K–»_q”\õ','GÃ©orgie'),
('`n#YkDÍœ@?e6;\Õ','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('7\àLÍ¸\åG@øe','Ghana'),
('}W\ÕUv@¦¿(é±1\r','Gibraltar'),
('\áP\Üaù§M;¯J\ÊÍŸø\ò\Æ','GrÃ¨ce'),
('˜\ÔI<EoŸ¿\Ãı…2\ç','Grenade'),
('‘y…\ÇL\î«l²†\Å{\Ò\Â','Groenland'),
('\õNÁ¸Eü±cAœA4\Â','Guadeloupe'),
('G\ÈB\à•zE¼®\õc}Id','Guam'),
('‘\ã\÷\ØM©Šù:(3½','Guatemala'),
('ı“al~@Y‘m˜f!\ó\Ö\÷','GuinÃ©e'),
('\'ú\Zs\ĞO(²\ÎHÿm³O','GuinÃ©e Ã‰quatoriale'),
('\é!\öI¤M\å›&kt6ƒL`','GuinÃ©e-Bissau'),
('\Õ6‰{_KX“l:\ëra6C','Guyana'),
('ø§4:O”¾\í\ö\ë†J','Guyane FranÃ§aise'),
('\Äf¥\äN\ØI†ƒ’q‰¨›‡','HaÃ¯ti'),
('ı”\ğ¼^~HùFg§\é','Honduras'),
('\ñ$øG>tL5 7X£ùk','Hong-Kong'),
('†‡®\Íz}J}[\õp ı','Hongrie'),
('=]l™J\â¹*\Ã¬Znº','Ãle Bouvet'),
('s{JºN\ÏFÒ‚6¤u\Â¤','Ãle Christmas'),
('&*\Ù\ÚP™F\"©…‹#9}P','Ãle de Man'),
('1C\'›\ÍhOp˜µuµw\ç','Ãle Norfolk'),
(')ıNµµLº°\Ú\Z\ä\Ë@¥k','Ãles (malvinas) Falkland'),
('^6\è}KŒ¡T\÷/İ´•\Ú','Ãles Ã…land'),
('Â•\ôšKO\í\Ë\ö\Üi','Ãles CaÃ¯manes'),
(';d7TM_¹#\ñS]/','Ãles Cocos (Keeling)'),
('\Ä\÷‚¥\Æ\åN¿–Fyú%ÿƒ','Ãles Cook'),
('\è—_5L7¦[\Ó\ô(æ©—','Ãles FÃ©roÃ©'),
('\á”2\rKc•“g\õœ³\ğ','Ãles Heard et Mcdonald'),
('JÉœ‰M°Az&µ²B¥…\Ë','Ãles Mariannes du Nord'),
('K$\Ü0MJ‡\ğ8×½.µ	','Ãles Marshall'),
('m³€F\ĞOÅ½\\(‹\Ã%¹;','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('¶P\Ç4\ömGÎ¥Nİ¼\Ã\ç6|','Ãles Salomon'),
('«‡i^Fƒw¼Ä».\ó©','Ãles Turks et CaÃ¯ques'),
('¸z|¢9«LÓ“]ÙšG\Å«','Ãles Vierges Britanniques'),
('\n¹¾üCÍ¬_û\Ú\ê_°j','Ãles Vierges des Ã‰tats-Unis'),
('\òs\Úu?L„j©+\Ï\ï','Inde'),
('‰rU„A³E#¡À}q\év€','IndonÃ©sie'),
('\è\ãGšTuL{q\ágeÉˆ','Iraq'),
('WVDDi@¿ú\ÕoË¥\Ê','Irlande'),
('w\ã\È\Ë|\"FÇ§\Z.<…Ó‹J','Islande'),
('\rnÌ¤DEz„¼[e%H:U','IsraÃ«l'),
('´\Ê\0¡\ÃG9‹\ògT\àP','Italie'),
('(\Z\\üfM(­-IC-˜²¬','Jamahiriya Arabe Libyenne'),
('\\ÁN\'\ZCF¶EH\ìÃ #(','JamaÃ¯que'),
('\å¼ŸûIÚ…\ñ,zƒ¿‰?','Japon'),
('\å\åÄ¤}§LX¯º§\Ëc,\ã','Jordanie'),
('³R©N\ãO•¢qH0o\ÈM\Ã','Kazakhstan'),
('gu\ó$@¢«o~ªQ­','Kenya'),
('\Úy9\çZøGy£\ß\ÎLd\Ã','Kirghizistan'),
('\åµ\Ş\îpG®“\è\äQ[','Kiribati'),
('\â¹sSB\n—\é»ê´¨•','KoweÃ¯t'),
('R\ÑrF:OÂ¥\á\çT\\_‰','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('X¼%ryfLí‚‡D–¿¤\ç','Lesotho'),
('B?j2bM£¯aÎ¡wb;','Lettonie'),
('^1\ìÑ*EÕs\ÈX\Ïx¸','Liban'),
('\ôú\ã³C\ÌC°’Ik¶¼)¾','LibÃ©ria'),
('”Fı·\ÙuAÓ\óQ\ËO\r','Liechtenstein'),
('\Âh9‘‰\ÏN2¶“¡‚Áy\ä\á','Lituanie'),
('\ö\æ\rQ\Ï,H\0¶ß­\Â>E•ù','Luxembourg'),
('fŞ˜\0wBQ–)6>Ì¢m\æ','Macao'),
('\ÈXù\éŒF¶³l¯\Ç2','Madagascar'),
('\'\öi*FkHû¹·.Pùe&','Malaisie'),
('?ZO¢\ò\×G2ºÚY±¼ÿ\Ë','Malawi'),
('×¾.=\ÇI¦ªK\Âm˜¸','Maldives'),
('Ò¤!g½D=‡	+\"\á\ö¶','Mali'),
('K\ì\èuH\ôHÔ«¹…_³+\Ã','Malte'),
('„øvWşAÏ˜\Ï4:x\áG','Maroc'),
('“\Ñ\Ì\Ò\÷L¸€b\í','Martinique'),
('£c\Z\Ü\ÉTF’‹_H\ßB\í:\Ù','Maurice'),
('ı6c\à\ÈkB]¡b\ËÁ\ò\r\Ùd','Mauritanie'),
('»¡\İ[\÷7A–»;À0|\Ü\ÛU','Mayotte'),
('R AY„«’½¹mµ‹','Mexique'),
('/Î—\rD˜©!º¬€\0·','Monaco'),
('\ìc¬1mH¢¯\Ä+c2\Ë\Õ','Mongolie'),
('g\È(%G8º³¢Dh','Montserrat'),
('(C½±\èKÍ©$–i\ÄR‘','Mozambique'),
('váš¸CHDĞµuª;’w\ñ\Î','Myanmar'),
('›Áúƒ\";GS¡A_\'\ÅûªF','Namibie'),
('JA$½9G‹¦c­¬/ËŒ','Nauru'),
('¾\0[¼FK•Â¨\÷%„İˆ','NÃ©pal'),
('e¤0ŠAŞ¨·B@¼}','Nicaragua'),
('\ÊB®\Ñ\öC®©¡§‘L\ÙùÁ','Niger'),
('I´Ğ‰¤@¶ŸÚ¨K\ÛÀË§','NigÃ©ria'),
('_/X\â\0G¼¹ƒ0P‰\Ù\Z¡','NiuÃ©'),
('C2(§½LG‡·Dˆ•=\Û\æ','NorvÃ¨ge'),
('nwa#\ØB‚ƒ¨”‚}\Ó','Nouvelle-CalÃ©donie'),
('š9¹—¦F4¦Œ,r\È','Nouvelle-ZÃ©lande'),
('14G\Ê\nPAU‰2¥nû2~','Oman'),
('\ÕcüN\núEaŠ\'´_NÒ‘','Ouganda'),
('œ\ÈO¸fD\Í­>…3','OuzbÃ©kistan'),
('bEú\ÅU$J‚\ğskªd(','Pakistan'),
('\Ì\á~a#F«R»˜;Gk\İ','Palaos'),
('Ù½Áo§F;’\ö\re5x\Ó','Panama'),
('£û\\u©vI¹\Ô8=5\õ\æ','Papouasie-Nouvelle-GuinÃ©e'),
('BÂ±\ÒFÁ€bş\áR¤','Paraguay'),
('Ë›‚\Ò\Ö/AU­<š.Zø\Ğ%','Pays-Bas'),
('!|\î&9EN¬–\ö0¸5iÆ¬','PÃ©rou'),
('\Ú-tC\õE²•\n”µP','Philippines'),
(' ©C4ûK\Z‡”Œœ®Hş™','Pitcairn'),
('2‰Œ¹/\0L’‚›\ë±','Pologne'),
(' ¤\ãÑšO Z~/\Æ','PolynÃ©sie FranÃ§aise'),
('´Z$\éşH\n¿kxR\Ä\Óy','Porto Rico'),
('b\Åı¾ùEb \nŒ,€V','Portugal'),
('\Ê\ÄegMÂ³‚(¿\'³F','Qatar'),
('ş\ß\İC¥L7[nùLw›','RÃ©publique Arabe Syrienne'),
('š±g•Ff‹Y\r·H\ØE`','RÃ©publique Centrafricaine'),
('L*[¤&-M4–VqsŸ\Zc','RÃ©publique de CorÃ©e'),
('\è\æ_?r@!_P™Š)¬\î','RÃ©publique de Moldova'),
('IÁ\Üá°¿CŸ¼So?Â€¤','RÃ©publique DÃ©mocratique du Congo'),
('\0«\îvu’@\ã°}B†˜!','RÃ©publique DÃ©mocratique Populaire Lao'),
('\ñi@d\é@ù˜\ÎC¦¬>\ö','RÃ©publique Dominicaine'),
('³ [»\÷F\ãµ\ZI\ä+¦˜','RÃ©publique du Congo'),
('\Ü,5z96IœPUc¤\ğÿ','RÃ©publique Islamique d\'Iran'),
('@dø¡\éF=¾×¹Ib\ğ','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('3BÿO±“ÿUz\÷$«s','RÃ©publique TchÃ¨que'),
('u\ò¦iIÄ‚†2>R','RÃ©publique-Unie de Tanzanie'),
('aSs\Ó\Ö\ÓD³\Â\à†’*¼','RÃ©union'),
('[ÙŸ5i\ËG›\ê\í\ï\Ô.`','Roumanie'),
('0‡û–BC/ƒ¾²\İ)R\è','Royaume-Uni'),
('\í\é\Ñ2}üIh¢U\\\ñX<} ','Rwanda'),
('ƒ®·>ajFƒ¼A9W< ','Sahara Occidental'),
('\ö\ëhq¾KP·›Dd‚cü','Saint-Kitts-et-Nevis'),
('\ïc¯z°F³”\ó\ë\ÉE]š¤','Saint-Marin'),
('\İ\ëÇ´¸\0@È˜\õ8·t \ë','Saint-Pierre-et-Miquelon'),
('	º¸\"K¹o”\ÙXŒ&‡','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('4“­\'BŒ„‡AiŸu™','Saint-Vincent-et-les Grenadines'),
('!YuH\ì¬Gø”4\Ó3/Oµ>','Sainte-HÃ©lÃ¨ne'),
('¦\Åí¾›xJ‚½ˆş68','Sainte-Lucie'),
('(p¡\òAJµWA‘\ÚD½\Ì','Samoa'),
(']s\èı–G\r¶\ê\0\ë{ùr\0','Samoa AmÃ©ricaines'),
('\ìfyŠ\à<O–“\Ù\Û5h‰\\\0','Sao TomÃ©-et-Principe'),
('³\è\ß>%©L3««_:\ï\ÄN\É','SÃ©nÃ©gal'),
('İ ¼7Ÿ\ôI\æ b3O\Z8u','Serbie-et-MontÃ©nÃ©gro'),
('Ú¤\Ü}Ac“\æA(I	-œ','Seychelles'),
('\õ\ìx‚@Ø\Î\"1R8','Sierra Leone'),
('1¯ù\âÀG³\ğ>É˜G­H','Singapour'),
('“g8¯GAš¡#9\r;\Î\ë','Slovaquie'),
('\õ‹\î\é@I{Eûƒ¦Ÿ	…','SlovÃ©nie'),
('¹q+´­Dß½\êÍ·˜-','Somalie'),
(' p\r6 cM—\Ø2§_W\Ş\Ö','Soudan'),
('†#±nÖLĞ“s\Ñ\Â­e','Sri Lanka'),
('}•;”GK€\"²ƒ¯ş','SuÃ¨de'),
('\æq¨´W¼A\0Š\r\æ\ÍrySi','Suisse'),
('\î‹\î\ÕJHˆy\Ëb\à','Suriname'),
('\õ³Fÿh\ÈFAÊ¾R¬ˆ-','Svalbard etÃle Jan Mayen'),
('o@1\î\ÈBkƒ\Õ,\Éj¦‡','Swaziland'),
('\İ\ñ5DYDzšm9\Ô\'i\n','Tadjikistan'),
('%§3›ŠıOC¬ûC\âû[=','TaÃ¯wan'),
('y¿\æ|©dI‡—N––Ñ›,†','Tchad'),
('\í¾\ÃzÇF\ñ€\Ö‹\0\Û\êW','Terres Australes FranÃ§aises'),
('T\õ\Õf EA:¯‹ˆA	”°\Å','Territoire Britannique de l\'OcÃ©an Indien'),
('\ÜRª awF¾uGXQIÔ‚','Territoire Palestinien OccupÃ©'),
(' \Åµı‡JZšLYÁ\×\Z','ThaÃ¯lande'),
('E]\Ñ^Nş¾°M5\ğø•9','Timor-Leste'),
('úD§ÿ\\1Nˆµ\õµ€tD','Togo'),
('Ş†šZ>Aß™:“}œk\è','Tokelau'),
('\Íeºj†YIL«	— jH','Tonga'),
('<\'ƒŠ$FÎ¨\èÿ|_ ','TrinitÃ©-et-Tobago'),
('S\İ €Gu³¯[‚&3','Tunisie'),
('%‡;BuDn‰ø\Í/\å#','TurkmÃ©nistan'),
('#\áO	9H]¸‚–Ø±\0C','Turquie'),
('?5­€\ØqKz†eŒyıH½8','Tuvalu'),
('b¦U\Ö\è3Mı\É\ÎùÀ\ô	','Ukraine'),
('M&\ÎgvBz•½\ñY)™©m','Uruguay'),
('R\Øm¹\ÂK-›>QSq','Vanuatu'),
('-4¾> DŞ¸\ñÁ}ù','Venezuela'),
('P\é§3HKĞ¶\ëÚ3\Ú$','Viet Nam'),
('	\ÒúŞ®tEH–\æq˜ÀB','Wallis et Futuna'),
('e²c#…tC\ò%gjq\÷Ÿ=','YÃ©men'),
('{ıˆ\ÕNÊ—\î\0aÅŠ','Zambie'),
('\Ê)¶\ŞoDMµ£‘\áWø+J','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-09-29 09:23:13',3),
('DoctrineMigrations\\Version20240201152951','2024-09-29 09:23:13',1),
('DoctrineMigrations\\Version20240202084749','2024-09-29 09:23:13',2),
('DoctrineMigrations\\Version20240202150901','2024-09-29 09:23:13',3),
('DoctrineMigrations\\Version20240207105701','2024-09-29 09:23:13',2),
('DoctrineMigrations\\Version20240319212437','2024-09-29 09:23:13',2),
('DoctrineMigrations\\Version20240614133504','2024-09-29 09:23:13',9),
('DoctrineMigrations\\Version20240617165906','2024-09-29 09:23:13',8),
('DoctrineMigrations\\Version20240708061729','2024-09-29 09:23:13',12),
('DoctrineMigrations\\Version20240801202153','2024-09-29 09:23:13',4),
('DoctrineMigrations\\Version20240815153823','2024-09-29 09:23:13',2),
('DoctrineMigrations\\Version20240916065051','2024-09-29 09:23:13',4),
('DoctrineMigrations\\Version20240929091802','2024-09-29 09:23:13',9);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7','\É5?0O¤…€)\\¦ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-09-29 09:23:13');
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `id` binary(16) NOT NULL,
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

-- Dump completed on 2024-09-29  9:23:14
