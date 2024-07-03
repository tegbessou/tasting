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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',259.99,'2024-06-24',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',999.99,'2024-06-24',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',2999.99,'2024-06-24',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Italie',899.99,'2024-06-24',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1599.99,'2024-06-24',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'¾m2\Ü#M¿Œfh\Ñ3[¼','France',358.99,'2024-06-24',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Australie',1799.99,'2024-06-24',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1099.99,'2024-06-24',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\Ë#zO0±ˆj­q´s_','United States',199.99,'2024-06-24',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','¾m2\Ü#M¿Œfh\Ñ3[¼','New Zealand',49.99,'2024-06-24',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Italy',899.99,'2024-06-24',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Espagne',1499.99,'2024-06-24',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',1299.99,'2024-06-24',NULL);
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
('¬\Î\ñ\ÈX@\r˜\\{€x','Afghanistan'),
('\é\ñ\ÅAÃ J’Ü™ª{‚>\ä','Afrique du Sud'),
('´\Ò.\ïú)@q‹h¨”–\î~4','Albanie'),
('T%•\ÜI-´4E/†\è\ÂQ','AlgÃ©rie'),
('‡¨»Q“O•Œ\Ùv6\Ó\Ì\î','Allemagne'),
('at¾hB\ìšL$A‹','Andorre'),
('8k•)aI%Œ§\Ï\æMşmµ','Angola'),
('b\"\Ç\âXAú“\ÆA_n','Anguilla'),
('Z0¤+‰2JŠœQ\\]\ë9Z','Antarctique'),
('\àXÙœO° UE\Ş\ÙGu)','Antigua-et-Barbuda'),
('0´OŒ­Al¹®ƒrmL','Antilles NÃ©erlandaises'),
('\Z\Ìú †\ïNM›¹\Ë4şm\ë','Arabie Saoudite'),
('\ÅL!\0\÷/K››kØ›\ô\Ø','Argentine'),
(';Š(:\ÖÿG1«\ç-ºc\Z','ArmÃ©nie'),
('Ce\Ô`dK·\ôs	~\ÇÅ“','Aruba'),
('\Z+‡9\ÇJqŒqX2\Õ²','Australie'),
('\ÖZÂ¯\öyF•ÀÀ¿9­o;','Autriche'),
('H¹+\ğRO ~³\0)\×','AzerbaÃ¯djan'),
('_™±J]\ÎDj I²\ÄÓ´‹\ö','Bahamas'),
('v’‚¾»I3” ”k\Òuœ','BahreÃ¯n'),
('G	Ê¦\÷`Iï¨…m‘jA.ƒ','Bangladesh'),
('\'\ñ\ÍT\ÑH™FK\ìIˆi','Barbade'),
('d4\åSO›+”\Ì\é\æ','BÃ©larus'),
('\ê9\Ü\í$“CS‹\"’\ö$\Z5','Belgique'),
(' Œ\n;B¥¤™\Î\è_Jy','Belize'),
('\ÂKûÀ\Ù)LÈƒ_“\ÄT\ÊP','BÃ©nin'),
('ªwÕ±~½BB±³\ğ\Ğø','Bermudes'),
('ªŸ\Z-%UI¿¦\Ï#üQı','Bhoutan'),
('CG·N\õDÜ€d|\ÇxÀŸ\n','Bolivie'),
('Â•\ÕkTj@’¹\nùl×','Bosnie-HerzÃ©govine'),
('$Œ\Ù\Ëúù@t¿/1°\÷*','Botswana'),
('ƒL„LD\ì¢|\íÚ†~¶\É','BrÃ©sil'),
('Yıe·^(Jv\æ8-I','BrunÃ©i Darussalam'),
('Ï¶¨L§Kû®\Ì\'ü…h\Î','Bulgarie'),
('3Fj¼\ê(@\'·ÀŠ\ÜDm','Burkina Faso'),
('×¿ÑGI·~5„s\è\÷$','Burundi'),
('š1ìŒN¨Œ¤øhfˆ’','Cambodge'),
('cş\õ±\×\ŞD‡–³~©š¦…9','Cameroun'),
('”qû*œûE—¤´\Êxj\Ç','Canada'),
('\÷oq\åÛ‰HË­qŠBZZN','Cap-vert'),
('‹Ë¿\êš\êNƒ½&^\äœ\Ö-','Chili'),
('\ê\à–\Ä\öK¢ºwf=³¿','Chine'),
('{:Ñ’ø\ÍBN¢\Û\æA`”™d','Chypre'),
('H9\èÀ–HÄŒ\n\Ërp%h[','Colombie'),
('¤<\âd—F¦ª¬İ™®}Å§','Comores'),
('¸Âµ¨G¹\÷\ÊL\Ò}\Å','Costa Rica'),
('­7KnhZE\á™\rpK¬^\'k','CÃ´te d\'Ivoire'),
('\Ì\Ğù–LµCÑ¥-\Ùa\â5\Î','Croatie'),
('¦\n\çt™^@:µIf–&;×‘','Cuba'),
('½šn`H^G°„‚\Ë+\ï\ã','Danemark'),
('¿SEûPHy’¸€\'8EÀT','Djibouti'),
('\éhe.^E\ö³¿|Ş§•Sc','Dominique'),
('¡¶<\Î\é„Fû¢–\ßwr\ì\ö','Ã‰gypte'),
('²±3ÆgB¥o¨Ç¦Ï¸-','El Salvador'),
('5\íeNúbM´º’Œ*\êÀ','Ã‰mirats Arabes Unis'),
('‘A¥‘®vFÇ¯v““{œ','Ã‰quateur'),
('J?«ÀC\ëšÏ‚ú¥[<ª','Ã‰rythrÃ©e'),
('\Í\ò\ë\öI\öAŒ¹0¹\ÈÜ³¢','Espagne'),
('T¥³N.J\÷Œ\ØJL\öl','Estonie'),
('\Í:\ÑM ‚‘š¨B%`\Õ','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('\"w\É(j\ÛG\äšR.¡Tj','Ã‰tats-Unis'),
('\Óÿ©P»¶O\õ®£MQŸt(´','Ã‰thiopie'),
('\á\ñf\õ-`@\ò—ç±JŒ\î\Ê','FÃ©dÃ©ration de Russie'),
('~4k¦‘G¡¾+\ôj\ğ','Fidji'),
('\ñzP›pIe¹¢¦&','Finlande'),
('¶\Å.nC „8µ\ì@\Üd\á','France'),
('yÁ~b\ŞB®ª\í~;…¾Z\Å','Gabon'),
('\İo\ÄÀ\ÃG|¡\ÏÚ·7L\'','Gambie'),
('¯g\Õÿ·EŞ’¸¤H\ìûH\ñ','GÃ©orgie'),
('mqq¤9\ÈI‰	’l±\éø','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('I\ìTZ\à‰Gı—VSg\ë\äDE','Ghana'),
('\ã\ì\ÓÄ‚L­¥ü4\rFÀ\ô\Ø','Gibraltar'),
('šÍ€75M¼¿#rTÅ¥·o','GrÃ¨ce'),
('‰,\Í\ÉDNÃ‡‡\ÅCG\àØ®','Grenade'),
('nK,8ÀA6¼\Í$³jÀ','Groenland'),
('O©Ó­\ÆD±·i+ğƒ‰','Guadeloupe'),
('\Ô{MIEÿ´š?’t\Ù\Ô','Guam'),
('ù‹i\Ö’B›€›¦\ò,¶','Guatemala'),
('W€‡™\ÈDÌŸªNS¤\ên?','GuinÃ©e'),
('A³\Ô}‡@¡w00—;B','GuinÃ©e Ã‰quatoriale'),
(']\Â?<EE€\ÎL;`\ä','GuinÃ©e-Bissau'),
('¦½©kMGø´F0xYŸVs','Guyana'),
('±ü\×xRG†‡şøÓªL–u','Guyane FranÃ§aise'),
('~hZ\ÖtBº˜1xœ†','HaÃ¯ti'),
('ˆ“\ÙŸN“\á\ÎHIœ\"8','Honduras'),
('²\Ë|0L—·r‚R?\Ç','Hong-Kong'),
('7„=‡@Ñ­UüZ\×=^\Ö','Hongrie'),
('\Ú“l¥µF1·‡¤³ƒ','Ãle Bouvet'),
(';E\òƒ7$BB‰rcƒ†','Ãle Christmas'),
('V§)1\÷\ÚBJ‹ü!A£\ó¾','Ãle de Man'),
('}\×tÿt@T—\ÉÄ—øm\ç','Ãle Norfolk'),
('–K\í\ğ+HE @J\î\ñ ?\ß','Ãles (malvinas) Falkland'),
('c‡(V¨E¹\÷\ö!\è4’','Ãles Ã…land'),
('iûù-fG©£®\òü\ë\Ã','Ãles CaÃ¯manes'),
('S\é>¥\ÖmGeŸ\Òb‰=C‹\É','Ãles Cocos (Keeling)'),
('L\ß\Û$¨UJq®‘†\î~Š\å','Ãles Cook'),
('¿:©8#C¯½zp\ÌF^','Ãles FÃ©roÃ©'),
('\ë\òi\óL4™[-\ïL^K—','Ãles Heard et Mcdonald'),
('$)˜i;p@uJ\Ò\ä\í–R\É','Ãles Mariannes du Nord'),
('\ä\é+4›ûFÌ\ö›€\Ù\ã/ü','Ãles Marshall'),
('¥\Åù\ïH$¸IÒ´´Wb\Â','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('°.\ã\Ñ\í‚EÖ¨r}\åÅ”§*','Ãles Salomon'),
('K§}T\ÔMA“M\Z\ó´6','Ãles Turks et CaÃ¯ques'),
('\èû`&¯Ci£\î¾wıZ','Ãles Vierges Britanniques'),
('©08¶\"\öF£¹4«T\îx¬','Ãles Vierges des Ã‰tats-Unis'),
('xN\÷R#†OQŸA`Q\ã^®z','Inde'),
('ú½¯K*¶Ae€ˆ:½w¯mŒ','IndonÃ©sie'),
('Â­®-XF\'µ¼ş^ƒ§>','Iraq'),
('K¿S\ò\ÔI$ mm›','Irlande'),
('\ó\ë\ÅC¾‹I‡Œ\÷c\ñ)\æ','Islande'),
(':†Ÿq#@\ì@tÑ˜>vÁ','IsraÃ«l'),
(')$üv\í¹Mî¬|»®¤','Italie'),
('q*y\öŞ¶C³…W‘\åb)gy','Jamahiriya Arabe Libyenne'),
('\î{%%H‚½:˜\æbˆ¯','JamaÃ¯que'),
('®Bi$TH‚¯|\ÒGMZ3','Japon'),
('¨\Â\Õ,\nM=˜‚\÷š_ù\n\Ö','Jordanie'),
('­A\Ê+KU—¦0\Äx\ñ)','Kazakhstan'),
('Œ–ImøF„¼¤hÒ°o³”','Kenya'),
('·T\ÓDV\ëİ‡\ß\êL\à','Kirghizistan'),
('\Ò5‰\Ç\ÒF²¹:\Í\è{\\','Kiribati'),
('\0·\Ğe	‘H[§\ß_\ìt¿','KoweÃ¯t'),
('–½HØ…‡\énè¯·o','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('\â\å<f	BŒ‘O\àF\÷','Lesotho'),
('¯\İ\Î\\\çœC	¬NırE\Ó5','Lettonie'),
('\Äú­¤N4¾Icúw˜\ô\Û','Liban'),
('_\á\Æ\Ù„C£ª\ÍW31¢','LibÃ©ria'),
('‹›§ R@Ô¬–MÏ\ÏF','Liechtenstein'),
('$›\ÒyšJ@L°­]<	\é','Lituanie'),
('Cª‚‡Æ‘K\ò½½úÔŸ\ã','Luxembourg'),
('I\ÄÎ¨!Eƒÿ$Liv\rş','Macao'),
('v“«-…I`²fÖ¢\ÍN','Madagascar'),
('\'±\ô¥5D ¢x9	\ëû\ôE','Malaisie'),
('\Ï4\óÌ¿Nc¹£>\å\è.«¶','Malawi'),
('zY”N¿”¶`ë»…\Ö\Î','Maldives'),
('I­\ô|L†ƒ\ÊYCÙ½—','Mali'),
('X™h<rJ`‰s\Z¾\é%¶\ó','Malte'),
('\ï\Ã7±x”K6¸`gc\Ña\ç','Maroc'),
('¢<šj½M¯»V¤g\Ì¾•','Martinique'),
('¸\õc¯GÍ“º\óx\Ü ¦','Maurice'),
('¦ª|pNÅœ’\Ú#½\É_\ï','Mauritanie'),
('’a\óË„E·\ò?d\\\Í\0','Mayotte'),
('Ú¡qeEHz P›W¼\ñd¿','Mexique'),
('—”\Ğ\ÍA}¡´¬§\Ét²’','Monaco'),
('ŸRi}D	µ\Ş )¦\æ','Mongolie'),
('’\äº.ET‰ù\İQš£²Q','Montserrat'),
('\êG¨\óiD•“q\å]*#!','Mozambique'),
('Yş)Àª1DB©½kÿ\Ä','Myanmar'),
('º¦^°U*I:¡„ªIv\Â\ê','Namibie'),
('x \ôn8Bo‰	\Úó¡¡','Nauru'),
('\Òüü­\Ã;LÆ\Ğu&\Ò\ë\é\İ','NÃ©pal'),
('\Ì\ëV\rdRAË©?\ä7/ü','Nicaragua'),
('kÁÖBQµ«\Ñ\0½U+','Niger'),
('\0SENµ°@İ©g\r¸‚ƒj','NigÃ©ria'),
('n¹¹ºQE+œû†\Ä_I²','NiuÃ©'),
('PøN‰mHL1‰Ä‡‹×D','NorvÃ¨ge'),
('_\ñH–ŒgO†—™¹V§#@„','Nouvelle-CalÃ©donie'),
('Fu…G‡Ó±+_J¨ù','Nouvelle-ZÃ©lande'),
(',\Ü\÷•\rG‡­/­\ô\Ê-\Ê','Oman'),
('i\ñ~„\'VE†—`\Æ\Î\ã\Ë\Ä','Ouganda'),
('š»P¾@EŠ›,\'+„+Ÿ=','OuzbÃ©kistan'),
('T¶pù¹µK$˜§¨Umo','Pakistan'),
('G6š”NÇ¬·\ÄLı(\ô¸','Palaos'),
('3º¼lÿOz¿ZBe§\ÄR','Panama'),
('Ny\÷E9€L8£ú\ëš\Ò7Ï®','Papouasie-Nouvelle-GuinÃ©e'),
('\Õ\Ò˜>ŒHœ¢!©–Ê»UA','Paraguay'),
('\Ùg]œ\ÖCù”«U%\Ç\õ','Pays-Bas'),
('ˆ9n™‘K¥²\Ó\×‘m','PÃ©rou'),
('’†˜Z4F‘±û—U¬ˆ','Philippines'),
('v£ F™·•\õU ,2\0','Pitcairn'),
('p:\ê\0‘Dr)ƒ±\Ô4R\æ','Pologne'),
('\Îa\Úu1O\â“C­–µ	\Î\í','PolynÃ©sie FranÃ§aise'),
('\ÌÕ‘@%\áC•\0Z[ŒG‰1','Porto Rico'),
('.;\å\ëtDF˜?«úÀ\Û[','Portugal'),
('q2\Ö$@¬e¹Ñ’S¼T','Qatar'),
(']\ã%yF¬¯	\r‘L ¨\Ç','RÃ©publique Arabe Syrienne'),
('\Åş,\Ï\ñ@°²qiozKŒ','RÃ©publique Centrafricaine'),
('ƒ~9NFE°ø©\Ê\ô„\İg','RÃ©publique de CorÃ©e'),
('Ù¬\õ<”2KË±‰&–{šØƒ','RÃ©publique de Moldova'),
('\İ\âz\ËnK\î¬cD\'\Òxg','RÃ©publique DÃ©mocratique du Congo'),
('ˆ³TÁ:\\Ar¼$Y\ó.`H\ó','RÃ©publique DÃ©mocratique Populaire Lao'),
('s\ß.t5H–µ¢³”P\î\ô\õ','RÃ©publique Dominicaine'),
('mˆ{\ZuLg¿\0\ÈE›P7','RÃ©publique du Congo'),
('œ\"Ü’Ñ¾Cu½x~f9—s','RÃ©publique Islamique d\'Iran'),
('.Î˜0Ú¸E]‰ıˆ\È\Í\Ú','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('¿U·\ö‰GA¶¢*¿xÑº','RÃ©publique TchÃ¨que'),
('•Q€f_BÀ‡1»¸¿\êd','RÃ©publique-Unie de Tanzanie'),
('+Á{­gL¢‹\óy¢ø\Õ','RÃ©union'),
(' NS\É\Ö\êGÿ\ï`L\"f','Roumanie'),
('!w9I\İB}“³\ÃÆ¾0\Ó','Royaume-Uni'),
('\Ü\Õ\ó_Nü¶rM\ê\Ñ+œ','Rwanda'),
('m7—}„.OQŒ8œ¢–\ç\İ','Sahara Occidental'),
('4;n,F¨\ì\òY¢<\ß','Saint-Kitts-et-Nevis'),
('\Ú\Ö6§\óM\é¶\Ğy¸£(','Saint-Marin'),
('~\é·ú\0HcE˜\ìş|‡','Saint-Pierre-et-Miquelon'),
('\âş{P_IMÄ—\à\ç”S¦~²','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('û~@à¼”C©’­o\ë\ÚD^','Saint-Vincent-et-les Grenadines'),
('#›û5\0E@•wZ\ßgÂ¥›','Sainte-HÃ©lÃ¨ne'),
('j¹s\ğ€IØ’™¼Š\òS\ß','Sainte-Lucie'),
('\Å\Å.\rxN#•úm\ç\î\êŒ','Samoa'),
('+\Éı;LK@…¢¥#7t','Samoa AmÃ©ricaines'),
('›ù;\\‰K\\Ÿµ\×\ñ‡A','Sao TomÃ©-et-Principe'),
('\0\Ö\â¶V7C¾\ß\ğa\ë\Û\×_','SÃ©nÃ©gal'),
('\çÄ®Ğ¤FQ³øj Æ¸&','Serbie-et-MontÃ©nÃ©gro'),
('w\ØgcLM¾¿Q¨\ó\î>ƒ','Seychelles'),
('\æü2OÁ‡L:ÿ\çu\ß^','Sierra Leone'),
('\ÅÏ·d\ÈyCŒ\ëŠ\æ\â\ÆH','Singapour'),
('\Ët9&Š\ZB¡‡-l\â¢Q—','Slovaquie'),
('ÀS6IÓ‚\Õm\ä]—','SlovÃ©nie'),
('ƒ9©x\ËXB³·_ b‹\Ò*\Ş','Somalie'),
('(Ò‡\ÌtSA\ó½p*5gº3µ','Soudan'),
('¹§µ\ßc\åBœ44«\Ù\Ø','Sri Lanka'),
('9{¢uCFÙ¢´†’M‹\Ì\ò','SuÃ¨de'),
('\ãFN\×NIn‰	‹©´\È','Suisse'),
('\óI^µ@ D‚ª/•lÏ¢ƒA','Suriname'),
('+7/\ÎaFOÎ7\Ä\æ\Û\ï','Svalbard etÃle Jan Mayen'),
(';\ğ­ŠN ¯F)¯•#³\ñ','Swaziland'),
('ùK—‡ˆJÁ¬¿(My[G','Tadjikistan'),
('\êKÙ©5E±Ÿ«Š\ô¦™b','TaÃ¯wan'),
('\Í\Òg\Ï<M½²NCQr@\ì','Tchad'),
('w\àÂ²\óM›…JPSy','Terres Australes FranÃ§aises'),
('!\ò#¯3Ká‘°O§\î\åX\ò','Territoire Britannique de l\'OcÃ©an Indien'),
('T 3Á„£B\Z¶Œo\Z]','Territoire Palestinien OccupÃ©'),
('Öª’\Å\òI]º˜\Ï[T_n€','ThaÃ¯lande'),
('K`?`Ng§¶f\ÌRV','Timor-Leste'),
('YvB\óaœBd—R\Z\'/\r','Togo'),
('1:WTgXAs‘7\Êeúw','Tokelau'),
('\ñb\ße\ÇÀJŒ«\÷p„ƒ','Tonga'),
('v4\ßkq\ZEûµ\ñC˜_‡`\×','TrinitÃ©-et-Tobago'),
('\ÔMú6vF/›ıÀX}\ß\"\Ş','Tunisie'),
('c\ğ\' m\Z@+Š>\ğÂ\Ú\Î\ò','TurkmÃ©nistan'),
('Ê–º#T:KcºØ–f±m\ä6','Turquie'),
('W3sEU¼ø\Å\á\æ!','Tuvalu'),
('C\à”“´DUš}“u‚\Ê','Ukraine'),
('\Î`²D“½\àK¨','Uruguay'),
('?ºø’ßƒEO¹8\0µ\ÕS½F','Vanuatu'),
('¡u\Ó\â\ÎBEy˜½\ó\îMZ\õ\Û','Venezuela'),
('(c”Š~F³ƒ¤\Ód\Ïf','Viet Nam'),
('9‘Æ®UF\ä­TªFŠ\ÓÕ˜','Wallis et Futuna'),
('}z6PWI`½À\ÉjzŒ¹','YÃ©men'),
('p\à*²C\×Iı2N‚{QZ','Zambie'),
('aÿb¦]·Dw \Ñ\æB—<','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-06-24 20:32:29',3),
('DoctrineMigrations\\Version20240201152951','2024-06-24 20:32:29',2),
('DoctrineMigrations\\Version20240202084749','2024-06-24 20:32:29',2),
('DoctrineMigrations\\Version20240202150901','2024-06-24 20:32:29',2),
('DoctrineMigrations\\Version20240207105701','2024-06-24 20:32:29',3),
('DoctrineMigrations\\Version20240319212437','2024-06-24 20:32:29',2),
('DoctrineMigrations\\Version20240614133504','2024-06-24 20:32:29',12),
('DoctrineMigrations\\Version20240617165906','2024-06-24 20:32:29',7);
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
INSERT INTO `tasting` VALUES
('.¥l5‹¹LnšI½y\Å\ñ7','™d\å9ÿF³œÿ\Ö\Ñ¸·','^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]');
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

-- Dump completed on 2024-06-24 20:32:31
