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
('?\Ëk\éYOuƒwª\áU¤º','Afghanistan'),
('b\Ò2£H\0Jû‰ü\ã\Ğ+“˜•','Afrique du Sud'),
('NBf¡\ÚE\n©\"C†2#\ál','Albanie'),
('}\n/\Õ‹A\é¨l>1t•…','AlgÃ©rie'),
('¨dD\ÃB\å ü\Å\ğ³ƒ','Allemagne'),
('\İÒ¥’o¼G,»›M›ı\Ì\÷\ğ','Andorre'),
('\áR±«\ÎW@X¬\n¿^s\İ\õ5','Angola'),
('ºKÅ®¨(F$¨\ãOGJ','Anguilla'),
('`,1NL”±©`d\æ\ì\Æ#','Antarctique'),
('qØŠ\Ô\nG\ï…¤•ùZ\Ö\÷','Antigua-et-Barbuda'),
('\ç½”LÀD¨®\Ó\â\æš\ä9','Antilles NÃ©erlandaises'),
('$¸×±±ŸC9”=|ú‹«7','Arabie Saoudite'),
('°O‰\à&¦JV´\ÙAû\ò~','Argentine'),
('cš\Ô\äMI:\Æ\×\İ\r?¹‚','ArmÃ©nie'),
('pzF¼H®£a´J\ÎJ\ÉT','Aruba'),
('P\Ò8<q–LN ˜†jªL˜\ï','Australie'),
('D˜ü\Ù\ÉA{¸, ¶§.\Ø\ß','Autriche'),
('\0¼d_\ØÁCZˆE\Òx¦Os','AzerbaÃ¯djan'),
('\ôQ2–ùC|™ˆ2|(ş\âª','Bahamas'),
('\ñ§ø½’@R§mø·\Â\Ú','BahreÃ¯n'),
('œ6œ\ÖH\ÅM¨\Üş>‰„\×	','Bangladesh'),
('…q ¢MOH¥Lw…¬\Ê','Barbade'),
('\ì&H†ƒFDŞƒ—0‰W=\Ze','BÃ©larus'),
('\õ±T:MÔŠ{»úŠs2','Belgique'),
('¤´\Ğ(\nKƒMN¡+¹','Belize'),
('\ğ&o’Bd»°²rƒ\â','BÃ©nin'),
('9=ù§ÿ€IÊ»^ Šˆšb','Bermudes'),
('\İ\Ê&üQF\n›\é¬hH~£¾','Bhoutan'),
('şªE¾uJ\õš\áRI0\"','Bolivie'),
('³L\Ã\×\ÌIÁŸw\õ{”2\r\Ä','Bosnie-HerzÃ©govine'),
('mì±¼‘F³¦š=¶(«5\Ç','Botswana'),
('\ï\Ú[\Ô\ÍA(«R/½t¹s\Û','BrÃ©sil'),
(',®3y2tCe»`;Š¾3°','BrunÃ©i Darussalam'),
('\ÙP`e¥LŸ¤wr8™\0‰\Ş','Bulgarie'),
('Ë’W¥\îNET˜R°Æ˜\ã','Burkina Faso'),
('\ç†\÷TP\ÇEè«‘\õ’\ìD	x','Burundi'),
('\ÌV\Ğ9LMøŠ\Ã\ô\óCa(T','Cambodge'),
('\Îş\Òi+H|¨\÷€\Õ\Å\ñ^<','Cameroun'),
('%_\Étƒ‡Fe¢©&{\í%','Canada'),
('®Ê \Êo\æI°+\Ç$n\Ô\ÑQ','Cap-vert'),
('øf\éT\Ä\ÃE/ª;g¯¼\Z\Õ','Chili'),
('&I`\åJ\õ²Ó\İ%œ´\Ğ','Chine'),
('\ó\Étrj\äFf—¾gF•','Chypre'),
('§ùÿ‹\ãAh˜#W\ÃwK\õR','Colombie'),
('n{\ô>sAH’šâŒ»V²\É','Comores'),
('\è­\ìyŸ!AĞ¯ÿÎ¢#Jsº','Costa Rica'),
('zE\áFø&D‘¢ú\Ã,¢','CÃ´te d\'Ivoire'),
('3¥z\"\ÛFÿºªÿ1œ\õ','Croatie'),
('Ù‰0•ıAT^e}\Ò\Õ','Cuba'),
('n?§šPrF!¤Wù\òR–\ö','Danemark'),
('d	\ë{y|D^½Šÿx³‰\Ñ','Djibouti'),
('Àr¨™ü|IL¦U„w¼_\Ş','Dominique'),
('IƒS\×LÜ°Ÿ\ï°eQ\ä','Ã‰gypte'),
('\÷u8L\ÉM‰š}¦l_]ı','El Salvador'),
('\õ—Z•´\ÕFgƒ\\¡!\Ì\"\òw','Ã‰mirats Arabes Unis'),
(',Á\ŞU\é’C®ˆ\ÅaP\Ş?•','Ã‰quateur'),
('\rH\èÓ¨H§•4¬Çˆ\"','Ã‰rythrÃ©e'),
('g€¬c‰Bx¤®­(Ì´\ñ','Espagne'),
(')f¶´OI¬k¥¸Q¦l','Estonie'),
('šŠ”¾\ÄHKÂ¥Ub¡:`05','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('…\n+\å}\íH=±\İN®\è‹EX','Ã‰tats-Unis'),
('\Ş§*½GV‚6\Çÿ6z¯','Ã‰thiopie'),
('8\Ù{Ó¶\ÎNµ\ô?H°§«°','FÃ©dÃ©ration de Russie'),
(',\ÒugŠF´§rC\ñş:H\Ú','Fidji'),
('KÜ©O8M%\é\Ç\ô)\ê3','Finlande'),
('*Å´~n\ÓM‘©‚˜?\n\å­','France'),
('\Ìú\â@\÷B›¥lAG','Gabon'),
('\"?\õ—¶BÂ†\ì\ÙÂ‰`İ§','Gambie'),
('\É|\äHD»+J\Ìû•','GÃ©orgie'),
('u@e\å²\ÊHı¦»¿\ÓßV','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('\êÀSµyMØ½4dE\Õ0','Ghana'),
('d:t…g\áK±\ôŸß‚g¯6','Gibraltar'),
('%3\ä_BÃ ÿ\öOeù\Í ','GrÃ¨ce'),
('Y(0şC¹\Ğ>˜u\âz>','Grenade'),
('MnØ¨LKu€•ÅŸD‹HN','Groenland'),
('aU%\0\0sFAŸ:> BuNœ','Guadeloupe'),
('\ß\÷\ËŞ‹\Å@-†:x7\ö\Ã6','Guam'),
('«€\Ş\r§\ÜEÇ„\ê\â‡\"‚r','Guatemala'),
('\Şy\Ç\Ê\îO#´9\Ò\Ëk,W)','GuinÃ©e'),
('K±\ßÃ©\æJ¹–ú:½\"\ÇÇœ','GuinÃ©e Ã‰quatoriale'),
('Æ\ë°\ËH\ğ²…)¨X¬¶\'','GuinÃ©e-Bissau'),
('ª~&?\ÈÿF9‘\àaÊ”¨ª','Guyana'),
('Š\ĞwX\éI\æµ\Í7ı•Bc','Guyane FranÃ§aise'),
('OZ\Ç\ÜBEN°€hŠøe>¥','HaÃ¯ti'),
('„ú$\ñ•%G¥·\İL¦a}²\ó','Honduras'),
('*\áùÉ‚M\ó¿\ĞbF\ÕSb³','Hong-Kong'),
('a b\Ûu\ËH¸¶AR\îz^tø','Hongrie'),
('±Ó´3¥\ÆB¸£\ï[‹¡G3','Ãle Bouvet'),
('?švQ\É]I‹^n\×\É^C','Ãle Christmas'),
('S^?€Å›M‚“\\¬x-\È','Ãle de Man'),
('‘µ†üeFÍ–\è«*\Ü<','Ãle Norfolk'),
('Lc5Z„QE³¼w\Âù)	','Ãles (malvinas) Falkland'),
('¹¥+¨]%@«¶\Ğ>k\ö\n‡','Ãles Ã…land'),
('‚{¦QLÅ”Zj/‰a','Ãles CaÃ¯manes'),
('+\Õ\Â1ÿ½K—©\òyu¤Gy','Ãles Cocos (Keeling)'),
('\Ì\ã.7G|‡Á\äyI‘:	','Ãles Cook'),
('l\Ìx\äGN¿‡ÿŒ?_','Ãles FÃ©roÃ©'),
('„\ê\õošB\'½Ú¯b\ß@Á','Ãles Heard et Mcdonald'),
('°“¼%‹¹Lˆºƒ5;\r\ëy\å','Ãles Mariannes du Nord'),
('3¾†LE”\ì‚q\ÈZ1','Ãles Marshall'),
(':£C§\ğK\õ²®\ëÄ¨','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('û†>zFÅ¿\ÓmY|Ã–','Ãles Salomon'),
('\Õş\"(IDi¡¸D\äÑ›\ç','Ãles Turks et CaÃ¯ques'),
('›\ã6$ÀBı}x\å<’€ ','Ãles Vierges Britanniques'),
('´™³Æª\ÒF:Œ$R|g\Úh ','Ãles Vierges des Ã‰tats-Unis'),
('·2~ÿi5M¥\í¶s]e\â\Î','Inde'),
('vD…›€7Jş‡¹¦Š„k³','IndonÃ©sie'),
('\îb\ËrMyºw\Õ\â’','Iraq'),
('¥`+tŸ\ÙDÇ“ƒX*ü\Ñ\â¼','Irlande'),
('\Â\ØĞ¤ÓD9¬I\éºxJ‰D','Islande'),
('vhd%+OO°3\ĞJ\ê©','IsraÃ«l'),
('sF´8QL,´b]¾<','Italie'),
('ªZK“.\0?mPŒ\â','Jamahiriya Arabe Libyenne'),
('¶\Í\ö>øLE*\É:pj','JamaÃ¯que'),
('—°Ü¯\Ü\ô@\â‘X\ãc—Æ¥','Japon'),
('‚o\í\ğ#!Cg¤(\ÔÛ£¬ C','Jordanie'),
('Í±\ÜIZDª\Ğ\0\ä\óš','Kazakhstan'),
('¼%\Ïo†ºM‚«\×1\ê\ö“','Kenya'),
('S\0‡»¹³L<–N\æhŠ\ô\Ö1','Kirghizistan'),
('Y‰ÿaµ\òL‚ˆ\ô\"\íØ ú','Kiribati'),
('¯‘øT¬Dx¹e¨x\ö7>Œ','KoweÃ¯t'),
('¥œ{\ó’aI\å¯x,t\÷¶\Ü','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('˜h­7(0O\ğ—£\ŞS\à,','Lesotho'),
('\ç\Ù\Ñûv\èK\ç±p>\Ğ,H','Lettonie'),
('™‚G B`d¯_ß†\É','Liban'),
('_Ÿ\ßp¬(Ie¢}>/\÷HG\Ë','LibÃ©ria'),
('LÆµÿ¬\'F}³[\ñ¯8sPw','Liechtenstein'),
('E4$bE†X²·§–<','Lituanie'),
('¥4n]\ó3JP·H<\ËU85—','Luxembourg'),
('  )Oµ5­\ÓA\êú³','Macao'),
('{]š¤D\"Š&³3\önT\ì','Madagascar'),
('&\Ô\àŒüF+»¿\n\'‹9','Malaisie'),
('s»™G{?DË˜™[Š\Â\Æ\\\Ó','Malawi'),
(':¥\÷• šN\n¾G}\Äª','Maldives'),
('j?Q\Ç&I\ñ¹lÍ','Mali'),
('f¨\ÖJŸ\ìI\ä°\â,\Å\å¬\ö\È','Malte'),
('\ĞjšL‡\ÌKq§\İ\àÀ\âF›','Maroc'),
('A>O\ËkVGU¬#vic','Martinique'),
('7´¾\ã\åK…\Zi´›	ù©','Maurice'),
('u Ö‰J¸–·*\Í5','Mauritanie'),
('rS“ˆ5F\"°Eù#†·w','Mayotte'),
(':f†,û Db¿oˆÄ¢FK^','Mexique'),
('\Ôÿ\ßC—&O\n¸†\ïÂ†ª\0','Monaco'),
('p©k4G\ÄE\n†DC)şT\ç¹','Mongolie'),
('LK\Íc‡/NM¦o¸$D\'7','Montserrat'),
('kD\Î¦A¢–útGø\È','Mozambique'),
('8T\é/ı\ÓJb©¡{™›À ','Myanmar'),
('\Ôı\ã\Ñ\öDñ…ƒ¦_2\Ã\İ','Namibie'),
('O\í=OKH†™KNR&{\è','Nauru'),
('/®¾OD¸E±f%78:','NÃ©pal'),
('€²±e°Muƒ 4¾\âf%','Nicaragua'),
('=Z\ö\î`µN3¯\çİµ\ÎCR','Niger'),
('1ÿmH#CÅ<\ë$©','NigÃ©ria'),
('a}\ÍË¹bJ¤™¼»=!\ô/','NiuÃ©'),
('\òN»œ\ñiA|—\õ\ŞU5@','NorvÃ¨ge'),
('\Ï²ReHÜ¹Á\ÔM<.','Nouvelle-CalÃ©donie'),
('\ÛÑ²W=#F1´ˆ/±\ÈÖ§\å','Nouvelle-ZÃ©lande'),
('Œz\â;J<E\÷‘)GV\î	','Oman'),
('q”Ï­Hwš}aü-†\"\Ä','Ouganda'),
('\Â|ı\å8”D\ğ²$/–^‹+8','OuzbÃ©kistan'),
('œÇ›\ÌN—\ß·G4ø','Pakistan'),
('\Èè¥»\Ê\ÙF®‹˜I³\Õ\"\é','Palaos'),
('¯|o‡¸NÈ¶\õ|®\ôzÎ','Panama'),
('_ã·˜\ÛO¬§Ñ”K\ã\ë|','Papouasie-Nouvelle-GuinÃ©e'),
('™†4\Å5Bİ%@\ö¦°','Paraguay'),
('\ÈF\Ô\Â%O\ç¶\åY¨)/5ú','Pays-Bas'),
('¹\ö½“\ÑI¡–V4\èL\ñ','PÃ©rou'),
('\ê\ß|m\ïF³¢ß°\Ø`','Philippines'),
(',\\O,0LW…\r¬¯”“','Pitcairn'),
('F»\r„\íNh¸t\ğ!Y','Pologne'),
('3\ß\õ\rú\ôKÉ¾\Ú\0Ç—{\'>','PolynÃ©sie FranÃ§aise'),
('“ll”I‰8‰1]8¸\Ü','Porto Rico'),
(',\Zcg Jrˆ\ä\ì©xE¬','Portugal'),
('\Å\è__\Z=M¦¿\Ò¢˜Ô»','Qatar'),
('{\Ö6‹©LÍ\Ë ™8Î¸•','RÃ©publique Arabe Syrienne'),
('L¢Ue¦K¹C\ã–O]~\Ò','RÃ©publique Centrafricaine'),
('1\÷¿ˆCkK´N€W–g','RÃ©publique de CorÃ©e'),
('\×\\,\"©@¨\ßÀEÄ°','RÃ©publique de Moldova'),
('/I«\Z¨OR¸<\ÍE{\ö¼ø','RÃ©publique DÃ©mocratique du Congo'),
('EM\è\n@J¿•¼#\õ\ßb¸Œ','RÃ©publique DÃ©mocratique Populaire Lao'),
('\È\îµPDÃ–§rR¹A','RÃ©publique Dominicaine'),
('ÿøTµ\Û}H‰W\òH#J‚–','RÃ©publique du Congo'),
(')–™‘\çBwbN&¸v','RÃ©publique Islamique d\'Iran'),
('wTU\r¢)Mx˜v€Ç¦Qª','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('r¸\Ö*&‡DÜ‚nˆ\0X§~','RÃ©publique TchÃ¨que'),
('T\ÖÿT8\ËB±•b®”\÷\ğ«','RÃ©publique-Unie de Tanzanie'),
('B´j˜M\é¹\êÎ›>\Í}†','RÃ©union'),
('\Ã\ì İ±KÑ§¾±\æXi¢\ê','Roumanie'),
('ş(fW\÷\ÑH›°5—\îI?˜','Royaume-Uni'),
('y\İıM\"€ø\ÂA@K\å\r','Rwanda'),
('=4úCX«\ÊNeƒuD','Sahara Occidental'),
('\ó)œkZqE¶£¸bk\ÈùËƒ','Saint-Kitts-et-Nevis'),
('\Ó=uN¸vAd­S­X-\â','Saint-Marin'),
(',…\Ì!6?NŒ\è\Í\ã(•³‹','Saint-Pierre-et-Miquelon'),
('t]\÷±£G¶­°\ï>-•','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('\ğU\Ëk\\\0E7š7§(ª%®\ï','Saint-Vincent-et-les Grenadines'),
('$\ÉGdC@Ë´\ÜX\ç\á\ó];','Sainte-HÃ©lÃ¨ne'),
('|*ı¸\Ú~KV™!…TÙ›À','Sainte-Lucie'),
('HrR•i°MV¾–ß­v«9','Samoa'),
('2|™{ŒGî¦ª¹U¯};','Samoa AmÃ©ricaines'),
('*\ŞÀ_K³\Ïmšc\ç;','Sao TomÃ©-et-Principe'),
('y@{C	£Cm[Dı\äš','SÃ©nÃ©gal'),
('=Í| \n@ßšú\÷\Ñt½','Serbie-et-MontÃ©nÃ©gro'),
('\è¸6\r“@\é\İ;A\ÔU\"','Seychelles'),
('±B²¡Á–D†·Ÿ‚y\à.','Sierra Leone'),
('}™”\ç¼øB1@CQ«','Singapour'),
('[Èm\nEd»s\ö\ï¨\ÛI','Slovaquie'),
('±ª¢«n\áNÕ–Œ\Í-G(•','SlovÃ©nie'),
('l8l}EŒ$=¬\í\éV','Somalie'),
('¨’ÿ¢`Mƒ€L?VM¡\ï','Soudan'),
('e\0LaQ’N@¨%e\ö§a\Ş','Sri Lanka'),
('®a\\®9\ĞAÀµ\î\ŞO…x:+','SuÃ¨de'),
('k%C¤EB#˜u¯×½oÿ','Suisse'),
('\ê‹€‰KAŠ°ZmEh','Suriname'),
('H¡“|}DÅ¤M02\í\ê','Svalbard etÃle Jan Mayen'),
('†0[\è{O=´\Í\Ğ\öYZ\×','Swaziland'),
('³E`’\0D\ç™\Î\Ì]FÉ­','Tadjikistan'),
('%–G\ê\ã;BÍ²B´\òkq	','TaÃ¯wan'),
('¾\ğ_0˜\ËI|œE\n‚²\ô\æK','Tchad'),
('_V\ÉAì¼šmG1´U','Terres Australes FranÃ§aises'),
('„\ğVQpHo­œ\Ídª','Territoire Britannique de l\'OcÃ©an Indien'),
('\Û%s\r¶H\ñ£¬¿\ô\é\â','Territoire Palestinien OccupÃ©'),
('—\á\İ\ï\ôBW—!\Õ?-µ²','ThaÃ¯lande'),
('uRÿ„\Ã3F_ƒµ6fµx-','Timor-Leste'),
('\ÎTI“;I5šÛ³G8\Ï','Togo'),
('\öPü@š*A§‰.\Zµ','Tokelau'),
('A^¥\Än\çBB‘²ød\Ü$®','Tonga'),
('\çŒ%%œFÔº¡³¡F\\','TrinitÃ©-et-Tobago'),
('i¯°^AË½)\Í\ç¸,\Â\í','Tunisie'),
('şÁ¨¬BWLÁ‘mø\ã‡•','TurkmÃ©nistan'),
('\àp\Ş\İ[BÍ«©˜œ8°¿u','Turquie'),
('@5Œo€\ĞLW¬\öDgk«','Tuvalu'),
('\Ò\É_AEgG\Zœ\'v\ñ\ö|','Ukraine'),
('|²v\òDvœ\èBEx¨','Uruguay'),
('C\ä\İZK-¯3\Ñ\ôO_«‡','Vanuatu'),
('B>\ÍoIK)‰3\â?\âü\"','Venezuela'),
('¢\Í\ÃØ´F-«˜©Ÿ\'û\Ô','Viet Nam'),
('cL‹qPCÑ¸{Ğƒ\âŸ*Ÿ','Wallis et Futuna'),
('ùù’°(Fß²ª“cÙ©¥\ã','YÃ©men'),
('º‡¨ |@¯\ó\÷V®Vr0','Zambie'),
('ş\"¿\ÅH€š8yO\×¸','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-22 20:33:13',3),
('DoctrineMigrations\\Version20240201152951','2024-11-22 20:33:13',3),
('DoctrineMigrations\\Version20240202084749','2024-11-22 20:33:13',2),
('DoctrineMigrations\\Version20240202150901','2024-11-22 20:33:13',2),
('DoctrineMigrations\\Version20240207105701','2024-11-22 20:33:13',3),
('DoctrineMigrations\\Version20240319212437','2024-11-22 20:33:13',2),
('DoctrineMigrations\\Version20240614133504','2024-11-22 20:33:13',10),
('DoctrineMigrations\\Version20240617165906','2024-11-22 20:33:13',8),
('DoctrineMigrations\\Version20240708061729','2024-11-22 20:33:13',11),
('DoctrineMigrations\\Version20240801202153','2024-11-22 20:33:13',3),
('DoctrineMigrations\\Version20240815153823','2024-11-22 20:33:13',2),
('DoctrineMigrations\\Version20240916065051','2024-11-22 20:33:13',4),
('DoctrineMigrations\\Version20240929091802','2024-11-22 20:33:13',10),
('DoctrineMigrations\\Version20241002164506','2024-11-22 20:33:14',5),
('DoctrineMigrations\\Version20241119144432','2024-11-22 20:33:14',9);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-22 20:33:14','root@gmail.com');
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

-- Dump completed on 2024-11-22 20:33:15
