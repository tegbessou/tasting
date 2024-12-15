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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',259.99,'2024-12-15',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-12-15',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-12-15',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-12-15',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-12-15',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-12-15',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-12-15',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-12-15',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-12-15',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-12-15',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-12-15',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-12-15',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',1299.99,'2024-12-15',NULL);
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
('¯œb[\ĞM\ò‡\Ü\à¡º\Î\Í','Afghanistan'),
('d\ìL‚_>I\ç®}˜\Í\'¢\Ò','Afrique du Sud'),
('Ú‘$£g¿OÎºRG4,\î\õX','Albanie'),
('œKM\"®\ÙF}°Zù\Ò\ÏÿÀ\õ','AlgÃ©rie'),
('Åu¦tD=Ÿ‰\Î\÷¾lº','Allemagne'),
('‘¾&B‚jH½§ı­”ƒ¾','Andorre'),
('@¯¬) WD’w?\÷ú','Angola'),
('v¦\ÛA§—Nî§™S«¡R¿”','Anguilla'),
('9\İw/Aï©©´û\âiù','Antarctique'),
('U\àk\ÕE\÷Lùµª$iƒ\Ê\ß','Antigua-et-Barbuda'),
('K\×#\Î\nK€¨wZ‘\öû','Antilles NÃ©erlandaises'),
('oı\Ù\Ïd\ŞEÕ¿·‘7#¿‚\Ó','Arabie Saoudite'),
('ş\ì\Úº¹NA»\ãLJ\à˜4\ã','Argentine'),
('³„\İ\ÄşDs¼\àKk­|a@','ArmÃ©nie'),
('x®ûF\ÍDt—\ê\ã<-\Ó\Ä','Aruba'),
('\óGÏ K‚³¹Z\ô»I','Australie'),
('Œ\ê,kdCú“ŞŸ€‡\í½9','Autriche'),
('ù3\ë$y@Á½\îÙ´\Ï>^','AzerbaÃ¯djan'),
('y\Ğ7\ğ	jJÔ†U\\Õ¦\ô½T','Bahamas'),
('WÒµ$\ÓÀF\ä‹7®\Ä\n%\Ô','BahreÃ¯n'),
('zb\åXpAÂ¼\à®\õ\Ã\ï<V','Bangladesh'),
('£¹V\Ñ\ò˜GGª\nÓ°@','Barbade'),
('ª\Ş\à]¬9A‡\ÂÊ¢\\5','BÃ©larus'),
('m\ã\r\äÁ\îN²¾ûh\à\õm\'','Belgique'),
('ÿ1‡\É\à\ÊFµ¢Ô¤­—.;ü','Belize'),
('ú\Ø\ÚnzµK=”Å—¯\ö¹Œb','BÃ©nin'),
('xa\í{PD\è²\Èob*U','Bermudes'),
('\Æ\ã >@´º1\ôs\Ó\Ê\Ø','Bhoutan'),
('@~\èL@M”\ÃÒŸÇŠL©','Bolivie'),
('\â\ß\ìb²Kˆ»ÿgz—\Z','Bosnie-HerzÃ©govine'),
('x\æ ‰oZK;Š\ÒaNn!','Botswana'),
('ú\Û\n?¬KF«I]\Öl\ğ\ß\Å','BrÃ©sil'),
('\Ï\ïÁb¹KU±Z!_¹†R„','BrunÃ©i Darussalam'),
('@ş¨0\ó»K9®¬‰t\"\ğ7\ï','Bulgarie'),
('†übú\ÓOT‚³ú\ò5\Ö','Burkina Faso'),
('!uµM¢\çI|‰~g¥e	Sµ','Burundi'),
('ª?\Ë,Nøºu¿øp{','Cambodge'),
('\ñ(2O\ËCşš…¼GgV 0','Cameroun'),
('I\Ì%şi@ºª—2{—\Ò','Canada'),
(':0‘9\Ç\ïB\÷·PÀé„†˜\\','Cap-vert'),
('[}*šDp‹6á¹€ªa','Chili'),
('\ÊN\Ù\Ì>E\ğ›#œ\ä	,\ó','Chine'),
('|4\ë0\İùB«¨³£_+¥#5','Chypre'),
('Ü®!˜AJ¦“SS‚','Colombie'),
('	\rRrŸN\÷©\\C4	»–','Comores'),
('\ÕoŸQe@_‘¡’\\\æ30','Costa Rica'),
('œo3”I¿£…\Ü\'H\Å:','CÃ´te d\'Ivoire'),
('\Ç,=¿®~AU§6-—\ï\ëµY','Croatie'),
('£üHüMJ°k®±…Œ†','Cuba'),
('„š›“\ãhF\æµ\Ã=iÁ©HK','Danemark'),
('ºK\Ì6µªFÉ¿³|\êuµfq','Djibouti'),
('\r?\ñ\á\ğDI¡¤Ú±w¥‰˜','Dominique'),
('c•¡±/Á@¾·Ia”ij\Ø\Ç','Ã‰gypte'),
('=q—U¾bMûˆ\ô9\ÂT\n','El Salvador'),
('Œ\Ëà½¶[GOŠ!·±º¸','Ã‰mirats Arabes Unis'),
('\ñúg?\0\ìAE¯n_\Èy\ò¹ ','Ã‰quateur'),
('\íkœ\õK\î¨\èî¦“ \Zv','Ã‰rythrÃ©e'),
('Z:¯½gGÉ™{W0\n×ƒ±','Espagne'),
('®\ÇfÏ€Nr³ıœù5©3\î','Estonie'),
('\Ğ9†k•JN¤»\İ7Á\âSzw','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('¨SNgEƒ2\Ñ\']\ê”','Ã‰tats-Unis'),
('/³‡Y\É\ğFs—~•üÎ½?','Ã‰thiopie'),
('\Ø\óSANù¬=L4Ÿ','FÃ©dÃ©ration de Russie'),
('?yw\ğ\ñ•F°8E>³“Õ«','Fidji'),
('ÿ–µ§T2O\0‡SÈ¼rd\ò‚','Finlande'),
('·%\Û5\ñB±„}I\ô£\Ä\í\å','France'),
('¢\ÑJ‡OÇƒ1dRøø','Gabon'),
('±ù@+ƒ	I/¬©Ş¨\ß ±','Gambie'),
('»øR\ä\'øCÿ¢(\Æ$K…Ih','GÃ©orgie'),
('Ğ¼<\å\ò«I1´;…)l\Ê\Ú','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('\×<`\ÉsN‹\ÕfŠ\\\0Œ','Ghana'),
('Iµn\ï\È\\C0Á¦`­ps','Gibraltar'),
('°$”\ÚI•5²\Æ:\Â ','GrÃ¨ce'),
('d\Ş84¼@®©û„µš\à©','Grenade'),
('•X\çú!N­¾\öT´¹hŠ¾','Groenland'),
('C\ë/¯—|N¢¶VeET[|#','Guadeloupe'),
('hÛ»\ÂSC–’Or-Û˜W','Guam'),
('‘9\æ½\æC\í‚L\Ìr Zs,','Guatemala'),
('0¿n©Cë¬‡›ÀŸ7\Ö','GuinÃ©e'),
('\àÚ.	L¢B¨ª¢u>/','GuinÃ©e Ã‰quatoriale'),
('Ç´\êZÿN±­N¶\òx','GuinÃ©e-Bissau'),
('Y«A(MÔ‡½\èU\á”&R','Guyana'),
('¢6\Öaú¾F¼ŠI(\Ç@—^','Guyane FranÃ§aise'),
('¯L\Ä0\ãzJ‰¶4p\ä\ï\Ş/','HaÃ¯ti'),
(';\ğ­R\×J€J\ãœ\æ{','Honduras'),
('\÷wJƒË­Oƒxr\×H\ö;','Hong-Kong'),
('\äÿc0\â©H/¶UÁ\èt}#\Å','Hongrie'),
('5jIx˜\Ş\Ü9ÿ™uU','Ãle Bouvet'),
('®L[’\ôXAj´\ßw°(A]','Ãle Christmas'),
('R\ÆSU/¦C	¨\'5\ôÏ—¯','Ãle de Man'),
('\È>\ãU—BB€®\Ä%\Ö{¾','Ãle Norfolk'),
(' n\ã`<G@Æ§\÷\Ò\r\ì3…','Ãles (malvinas) Falkland'),
('B´›–t5CX¦\Í´›H½','Ãles Ã…land'),
('N<p\ÍQH#‚\ô˜¹ ','Ãles CaÃ¯manes'),
('Nüîª»H*¼TLÑŒ‡{','Ãles Cocos (Keeling)'),
('¬:†\à1\æD®±`£$ˆ\ÇV','Ãles Cook'),
('\0¿\Ë\Î)G=Ÿc’f\Ğ<A‰','Ãles FÃ©roÃ©'),
('“\ís‹0G!\ÎRù\ó\ÖÀ','Ãles Heard et Mcdonald'),
('a1»‚\Ä^N¿©]mÿ\Î\è','Ãles Mariannes du Nord'),
('\òFD`ˆGÚŒRQ.\ß\ébx','Ãles Marshall'),
(' ¬dBbH\n¢¤x\'p\ó\Û','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('v}™\ò.Hš\êJYÛ·','Ãles Salomon'),
('NY\öU\ßdHµ²Q¾\âŒF\ÏQ','Ãles Turks et CaÃ¯ques'),
('G½(lYiL©—ü~úo\ö7','Ãles Vierges Britanniques'),
('\"pv‚ƒ¼N\\¹)0Gw§T¿','Ãles Vierges des Ã‰tats-Unis'),
('_-Y\îBL¸‚;—\ÉùĞ»{','Inde'),
('Á,†w¹¼G.€ü\Ø\Û`\é','IndonÃ©sie'),
('¯Ğ¤\Û(M6‰\n=k','Iraq'),
('—Šv\ÌMª°	N\ç!\Ã','Irlande'),
('CW®¿\ÎJ4‘\ÄüG‘¢','Islande'),
('hk³PE\ìMI‡³\Z\ö\óÿY`','IsraÃ«l'),
('‘\ä\î˜\ÅK¡–fÑ®¯\É','Italie'),
('	­MeE_C0¾¥\ì”j\Ã[','Jamahiriya Arabe Libyenne'),
('Ø¯»&\×O‡‰´\Z–§º\ì','JamaÃ¯que'),
('ª)”cL\òŒ£Á\Â\"·¸','Japon'),
('”\Æ\ZqH/´0>P\İ\Ü\Ã','Jordanie'),
('\é\æC²°@Ë­*ˆµvh\ã@','Kazakhstan'),
('\ê\Å{\à¹JFşŒ±\nFZ°·M','Kenya'),
('\÷¥ÿz²\ÅA\0´;¡	·‡','Kirghizistan'),
('w\ğ\åbMD§\ï4_mÈ†','Kiribati'),
(',`\Z0\ËEÉ¢\ØC±©¡F—','KoweÃ¯t'),
('\Ô\ÚQ(D^šd”\ÑG©\ğ˜','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('{‰\ã±Cj¨\æ»[Á\'\Æ','Lesotho'),
('\ë\ñ:@-Hm„q¤ˆ¢„\ö(','Lettonie'),
('¯\Ä@\Ñ4øD9‹MnX(ºJ','Liban'),
('\ó\æ \õe«G‹­ß§ÿ”\ïd','LibÃ©ria'),
('™\ñØ¬\ö–Mù¡\'\óQ\Ö\ñ/','Liechtenstein'),
('\è*Kf»A–˜O\r\ö\Ûp9A','Lituanie'),
('€bÚ­SG‚—\Ê>3·‰','Luxembourg'),
('p\0\ò\Ù\"\äJ~5dÎ\÷l¹','Macao'),
('!¬Iw­\õNù¯5HZj\Î~„','Madagascar'),
('û»N\ÅQONA€\Ç\Ç!RK','Malaisie'),
('\î¯\ÂqmúL\n‘\ØaA\å¿5-','Malawi'),
('\Øè‚®Ñ¿Kß›\Zı‹x	\âı','Maldives'),
('GŸ\æs\î.GVƒ\×\Ù)\ô¤(‘','Mali'),
('¬\Ê\ô\êk\óB»Ë€¼\à\Ü','Malte'),
('yºs\àCÁ–…\âİš‰s','Maroc'),
('wsT4§VN «d\å5›\Î\Ñ','Martinique'),
('D˜—\ÚbAMi°…²¾\Ê&¨','Maurice'),
('\ã!\÷\ë\ĞDŒ£d9C¥\ÖR','Mauritanie'),
('%61\ôş§Bc‡e™;²ˆY','Mayotte'),
('{%Ó¨1±O\ç¿\rœ¹_\öx|','Mexique'),
('i\Õ?C\ÏEC‘\ni{…{“','Monaco'),
('\â·\Ã\ò§Oa¿%™¸­k8E','Mongolie'),
('i©.7U\áI½Ma`À–X','Montserrat'),
('½ûˆÀ©B?ª\éª\×\î‰','Mozambique'),
('kƒ|\ØH\Z–ªc+F)«','Myanmar'),
('Î¸B…4§hŸ¼¢\æ','Namibie'),
('¸uU?#~F¡²\÷EmÀ#6','Nauru'),
('¬Jù;\É-B× —Ô›\è‡','NÃ©pal'),
('\ê\ö½\Ñ@±ˆFˆ:\ì¡\0\0','Nicaragua'),
('0\÷˜»fIŞ®*e& šRŸ','Niger'),
('§%\È\İ=AÍ¤CU ½3:','NigÃ©ria'),
('u{ıÃ®\ÈAn¤q([*\ê','NiuÃ©'),
(',5lı˜2J¥mp•~ú','NorvÃ¨ge'),
('\æ7`K1jMÄ 	N|¦\Ô&','Nouvelle-CalÃ©donie'),
('­W6£\ÈIO¦¯\ärr}”','Nouvelle-ZÃ©lande'),
('6a\ão4\ìB¯\0˜›}½\èp','Oman'),
('\Ò0Û–\r¶Kş­¦º\à{Ÿ$','Ouganda'),
('\ô\nš\Å\ÈFØ»ÿ#\ç\Ó\Ğ\Ç','OuzbÃ©kistan'),
('æºµ¬O…‘\õ¾\ÎF\ì‰','Pakistan'),
('ş\"\á¤wZAÆ³~\Õg»Ş—','Palaos'),
('p\ÔÑ²–N{<\ì\ç\è\Û\å`','Panama'),
(')m®\ß\Ï\íM®5•E•h8\Í','Papouasie-Nouvelle-GuinÃ©e'),
('\Ü\â\Øh…E£¿Ä™„t‡¾9','Paraguay'),
('\óÙ·\ğ\0E‡Å\ÎfF©','Pays-Bas'),
('´nˆw8gF@p\ë(9¯MS','PÃ©rou'),
('ÿoS\r\ÂHCˆ\"³5…A*O','Philippines'),
('!W\ë\Ğ\ñWAŸ‚¤™\ÑA\"\Û','Pitcairn'),
('ºË¸„\Ü\'K¬–¼½yŠ©','Pologne'),
('\Ò:Hµ\ÂECl¶\÷·üR','PolynÃ©sie FranÃ§aise'),
('§V\ìbŠCÿ [¶\Ğ\r\ñ\Íz','Porto Rico'),
('&\İ€BX¡üüR\Ä£~','Portugal'),
('\Ï s¢\0AÉ‚†lV¹g\n','Qatar'),
('¿Æ¨[i²LŞ‹Ê¦¢›N\öG','RÃ©publique Arabe Syrienne'),
('ü	‘NGsK=‹1{vx\âo','RÃ©publique Centrafricaine'),
('~‘)nR O£’\îT¼KÁ','RÃ©publique de CorÃ©e'),
('RX!\n\÷C¹‰\ØV‰\ÄL,1','RÃ©publique de Moldova'),
('Š`u£LD–,Kƒ\Ê4','RÃ©publique DÃ©mocratique du Congo'),
('>eO G=…A“L¸b\0‚','RÃ©publique DÃ©mocratique Populaire Lao'),
('û\á¶Bª†ˆ6®6Ä–ı','RÃ©publique Dominicaine'),
('h\Ìt¡ŒzJXŠqfµ\Û','RÃ©publique du Congo'),
('Ld\÷CHN°œÃ¼\ß\ìk!','RÃ©publique Islamique d\'Iran'),
('Á#Œn¦F/±zÂ¹ş','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('\r\õ$\Ò2¹E%šTZ…Xû\Ğw','RÃ©publique TchÃ¨que'),
('\É9™SDÿ©0øİ‹%i','RÃ©publique-Unie de Tanzanie'),
('…MúO9L„–ş‹0»‘','RÃ©union'),
('\Ã\÷`k\å\ôFé†°³D­ùŸ','Roumanie'),
('<[Ñ³uwF¦²\Îm\ğ.¶','Royaume-Uni'),
('0©,É‰/F\ïÊ„¿o@¦ú','Rwanda'),
('¨\ÇXŒ&KÏ<Tk¸<','Sahara Occidental'),
('1!S&V\"K¶\Ô}\Õ\ã²]','Saint-Kitts-et-Nevis'),
('…›}³NL“\Ønw\ôe­','Saint-Marin'),
('£¥\èk£G{\ÅlOy\n×†','Saint-Pierre-et-Miquelon'),
('à¡¶QEœ\Ç-\ã\è','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('^\ßü\ÆRJ\'…V¼\×x/¼','Saint-Vincent-et-les Grenadines'),
('z¿‚‹Aß\áx\Ó¥','Sainte-HÃ©lÃ¨ne'),
('ık>‚\â\èD¤\à\ğÀ\æU','Sainte-Lucie'),
('¦ÿo%K—™Ÿ,û(¤D','Samoa'),
('~5ùpEÈ¡¯»‚\É_\á','Samoa AmÃ©ricaines'),
('©cı&\rE:†\óg*\'Dù','Sao TomÃ©-et-Principe'),
('“%£LNU‰Dÿ€2’‡','SÃ©nÃ©gal'),
('µ.KQGEe–\Ğ …k~—','Serbie-et-MontÃ©nÃ©gro'),
('ƒ\r7‹½\ÕF°e\è\ŞtF4','Seychelles'),
('4c\ì\Õ;Eû­\Ì\Ş.\èØº','Sierra Leone'),
('z\Ì+—ÀLs¨˜O\Â\÷­\Í','Singapour'),
('¶Ctg%-E„>sú\îØ\Ç','Slovaquie'),
('˜YpJkKn\ë\é\ï[Ÿn','SlovÃ©nie'),
('\Æ4U\ê?BĞ’o=w\õ¶\Û\÷','Somalie'),
('#Àş­<BY£Di2Öµ','Soudan'),
('`š=‚·C6©—\ZGD)\Èi','Sri Lanka'),
('¢\ñ\á\\pK¯\Ä	N´s	','SuÃ¨de'),
('®\ä›l7\ÖA•„d3s«\Ë\ç','Suisse'),
('{<³\r9vKÜºÒš\ß\Ğ\ßÍ”','Suriname'),
('@\Ñ\òxøƒB*‡¥\ör’a\Ô.','Svalbard etÃle Jan Mayen'),
('±\ö\09øL;‚)h£\0Q¤','Swaziland'),
('¹\õ–\Ì\ĞEµ5\÷Ô½s\î','Tadjikistan'),
('ÿG\ï\Ãa\îOÇ±Vş1\Ğı','TaÃ¯wan'),
('¼ÅŸ6rJ±¨82—\Ğ\è\ó','Tchad'),
('Z\æ&¯HI«°’…$Œm\õ','Terres Australes FranÃ§aises'),
('x®+¶N¬¾\ò·7\÷“½','Territoire Britannique de l\'OcÃ©an Indien'),
(' ¶,|	\ÑIpTD\ß„','Territoire Palestinien OccupÃ©'),
('\İ\ñ\ßu\àABş£…\á©\\EEP','ThaÃ¯lande'),
('”m1<\ÛE¸¶\ã\0¯\Òes0','Timor-Leste'),
('Ï‘\å¸\nB\n¦[¶’_4\ö','Togo'),
('\è”ÆƒU\ÄL¬¡\n\Ûi\Æ\Ø!','Tokelau'),
('%Ş‘À£\ÓGQQ¦™-','Tonga'),
('dS¾•‚@¬\ì,\ïš','TrinitÃ©-et-Tobago'),
('\ÅıŸMO‹L	\Íe€„Á','Tunisie'),
('ç‹¡¹\õH•·\rs\Ü\È3*T','TurkmÃ©nistan'),
('n\éEŒ\à!MG¹l\Â{°¿','Turquie'),
('\á\Z\å„@\á³[0~-p\á','Tuvalu'),
('R^o’Mˆ»O¬\ê._','Ukraine'),
('ş³\r\å1Z@’Áno¿”)','Uruguay'),
('\ß\÷YFc¡L¬«É„K\\¥¬','Vanuatu'),
('?–X\Ç\Ú\çJ¡™\ã\Ş>»\î','Venezuela'),
('~\ÖULhHİ‚\Ì\ÏP\é—?','Viet Nam'),
('\òMqO\Ù@B\"ª\É7LŸ\É\÷','Wallis et Futuna'),
('D¶\÷O±F™cC<-˜¿.','YÃ©men'),
('c«¥§€\ÚKÚŒ>.KŒ‡','Zambie'),
('\ö’š\r\\IXŒ\Ò\÷\å6 q˜','Zimbabwe');
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
('DoctrineMigrations\\Version20240201152951','2024-12-15 20:32:31',5),
('DoctrineMigrations\\Version20240202084749','2024-12-15 20:32:31',2),
('DoctrineMigrations\\Version20240202150901','2024-12-15 20:32:31',2),
('DoctrineMigrations\\Version20240207105701','2024-12-15 20:32:31',4),
('DoctrineMigrations\\Version20240319212437','2024-12-15 20:32:31',2),
('DoctrineMigrations\\Version20240614133504','2024-12-15 20:32:31',11),
('DoctrineMigrations\\Version20240617165906','2024-12-15 20:32:31',10),
('DoctrineMigrations\\Version20240708061729','2024-12-15 20:32:31',12),
('DoctrineMigrations\\Version20240801202153','2024-12-15 20:32:31',4),
('DoctrineMigrations\\Version20240815153823','2024-12-15 20:32:31',2),
('DoctrineMigrations\\Version20240916065051','2024-12-15 20:32:31',5),
('DoctrineMigrations\\Version20240929091802','2024-12-15 20:32:31',10),
('DoctrineMigrations\\Version20241002164506','2024-12-15 20:32:31',9),
('DoctrineMigrations\\Version20241119144432','2024-12-15 20:32:31',12);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-12-15 20:32:32','root@gmail.com');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15 20:32:33
