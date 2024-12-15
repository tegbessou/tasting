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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',259.99,'2024-12-14',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-12-14',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-12-14',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-12-14',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-12-14',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-12-14',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-12-14',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-12-14',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-12-14',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-12-14',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-12-14',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-12-14',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',1299.99,'2024-12-14',NULL);
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
('7½Iy*N?ƒ§P\nLÏ²\0','Afghanistan'),
('§Z #*K\çŸsl„\ÑJœP','Afrique du Sud'),
('B7\ÍDFº’*\×ƒ\â','Albanie'),
('\æJÁD\ïO¯¦z,ø?ˆ','AlgÃ©rie'),
('¼\ê$\ÛK¼–¾\ã\Û\Ë\Ó\ñ','Allemagne'),
(']\'‹Ù«B\rœ®h~>j\Ö','Andorre'),
(':z]\ÃeiA¸\Ûna\Ï\ÙT','Angola'),
('ºJ¡/OG¨3|®]\òo','Anguilla'),
('şQ‚7@À¢B»O0\ä\ğ\"','Antarctique'),
('rv–Ò¥K››\"a”›\â','Antigua-et-Barbuda'),
('\á¬AüM‘„¸œ²~@„\â','Antilles NÃ©erlandaises'),
('6\à‹=µ)@&Ù\ã4ú\Ô','Arabie Saoudite'),
('{0¹	¼ƒB!š¦\ÍÒº|$¼','Argentine'),
('‡®üU¯‹@€p³%\Ò9 \Õ','ArmÃ©nie'),
('/%8aœHY¢!±\Zÿ <\Ú','Aruba'),
(':fP±ŒOC\å®4›­›','Australie'),
('Ì«`\İ\Ã&O¤3€Cy\ï\æ','Autriche'),
('+aÚË²NÏ=G©M±','AzerbaÃ¯djan'),
('’Sbø\ÕJ«&r\ñ\òn§”','Bahamas'),
('™>€¿Ë‚Cê¹¤ê“´nÇ·','BahreÃ¯n'),
('#\ñ\Ì?,\ØLw„\á\ÃW/šo','Bangladesh'),
('Wo%-ú¸KP†\ÂC\n\ğE\ç¢','Barbade'),
('9DI\ÊfI\nµrÿ\÷š\İı','BÃ©larus'),
(' €¢ˆ!F…°«‘\ä½\õ]','Belgique'),
('\Í=;Áh\ÊKş¥;>\ïú…œ','Belize'),
('<\öuÅ–\àE\æ‚\Êı-ssD','BÃ©nin'),
('E—2›[´K(¹\î)Y=.~,','Bermudes'),
('\ĞaÁN\İ?Aü\àœ¾eÁ;k','Bhoutan'),
('I’®\"¬F#ƒ{‰’®\Ø','Bolivie'),
('Ï°zˆûAŠ¥!atA\'v','Bosnie-HerzÃ©govine'),
('F\Ë`–>aAz¾	\ïlŒ\ì¾4','Botswana'),
('L\r`ùmjO5»ÁP:­l','BrÃ©sil'),
('oşÊ+½Fd²¸w‡\Èo[V','BrunÃ©i Darussalam'),
('¶	¼–/L±U¬—­¥*','Bulgarie'),
('F¬,_–Oš¤i‡-\ĞÑb','Burkina Faso'),
('/\óÁnBjA+‘«.¦§\÷\Ã\Ù','Burundi'),
('2K\êj[K,¨¦ı\âº\÷™','Cambodge'),
('X„\Ü3\Ø6In\İ\Ù\ÓpE„','Cameroun'),
('\ô]““\ê\õN‰¢\Ô\õ&p´¢','Canada'),
('‘®*\ï²Lú±@nvBÜ¢³','Cap-vert'),
('I&‡\óµTB“(4]L','Chili'),
('ı]HÎ¬Lº„ù\Z3^›9L','Chine'),
('\â\æ6ùW@¦•$ª\Ä\ZY\'~','Chypre'),
('\Îc´;,MLªÁH œ60','Colombie'),
('­\ÓeLOM’\÷¬ª’\ë·*','Comores'),
('g¤p±Cj²Ïš1\ã“$','Costa Rica'),
('Aû–©¶¾O1–ûmF\ô\È','CÃ´te d\'Ivoire'),
('6’\õ¿d—F–¾\óW\áº8€·','Croatie'),
('?’~†HIˆ¤¶\Æúƒş\ì','Cuba'),
('’ˆy›lpDkµ’Š\ç','Danemark'),
('C\æl\ğ)B8’\Ó¼n','Djibouti'),
('8\æ2PK…’-\Â$\ï1}^','Dominique'),
('\Éi\Ç\ê”NR¬°DO\ò\Ìú','Ã‰gypte'),
('…vü]\ñMp´\Û,j¤','El Salvador'),
('¨\0\õÛN\r“cg:Ú¬\Õ','Ã‰mirats Arabes Unis'),
('@%Ó‚ü\ßBZ¬¥\ô~\òj#','Ã‰quateur'),
('kh\ï\ã\ÜB´‘Fw´^\Z‰','Ã‰rythrÃ©e'),
('\Z\Ø\Ól\âET›;h{\ÉfY','Espagne'),
('ş¶.\ó‡D€·‰9L¢%N','Estonie'),
('p\ĞOF0…¦\Ñq\ï\éª','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('¨@¿\Ã\"¿G}›Gÿ\Å\Ì\ç@','Ã‰tats-Unis'),
('\ÌM@ß·µ?l£Ô®','Ã‰thiopie'),
('›º%\ËKa\éƒ\ê¿]\'\Ì','FÃ©dÃ©ration de Russie'),
('\ê\äá¯,B­¦0x†”Í´\Ø','Fidji'),
('pT¡dZ@0^_>~','Finlande'),
('1·R\ôHØ‘\'£ø¡*Q','France'),
('©	\Ø\ÕgD\"²‘şjh¶','Gabon'),
('MwzLKE ¿¸†\ëÊ…','Gambie'),
('ıb\Û\Å\ĞgH‘¶\İ\êˆüGA','GÃ©orgie'),
('A±fbµE>“B9ÃŒœ}','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('…7h½•G\é¥]ÁøD\0\õ-','Ghana'),
('Gù™Z\ßI¿‰#\Ï\'\Ğ\É','Gibraltar'),
('\ÕNƒ·}qJ¹¼y\ÊPÍµ','GrÃ¨ce'),
('\î\"qì«G%1\ì:«\Ç1','Grenade'),
('#…´E\ÄOœP\é\0]\ÍqE','Groenland'),
('\ÎSABµ‰°p·O\æ¨','Guadeloupe'),
('¢»\î\õ­LÁ\Ù\ÛH\Éu','Guam'),
(' \ğ\n¬L¶³\ó­“\n<¬','Guatemala'),
('\ç\\\ÎF@4`z\ês`','GuinÃ©e'),
('¼ÿUYBB‹oEº7¶i','GuinÃ©e Ã‰quatoriale'),
('¨\íd\âsO‰¬t‰A\Ö\ö','GuinÃ©e-Bissau'),
('„¢Š2ù JÀ³‹Be\Õ\r\İ','Guyana'),
('\Útû]y&Ef¢Æœ\Æ1\\¸º','Guyane FranÃ§aise'),
('\Ó\0•\np@´¹\0YÀÁÿ,\Ó','HaÃ¯ti'),
('§\ãRvD%¼Y8Å‚E^›','Honduras'),
('ÿ’\ğ‡\Â\ÉNì©„‚z«+\İ\ê','Hong-Kong'),
('\Zƒ‚d’Ey«<V\Z1­','Hongrie'),
('»l<\és@¾Q¦J\ó\â ','Ãle Bouvet'),
('\Ò\Ù\Ëc?JB¢«‘t¦)>±`','Ãle Christmas'),
('…Z[E;™”TU\Zq½','Ãle de Man'),
('jsˆ\ÏHº»–^¬R1\ä','Ãle Norfolk'),
('\å\0¬+M:µˆ\"T\Õ\Â^\Ê','Ãles (malvinas) Falkland'),
('ª¬¯V\ÔOª„`%\Í\÷\n\ä','Ãles Ã…land'),
('­¡oOOG6œ†*¹Mx\ès','Ãles CaÃ¯manes'),
('\0(aK\ëDMœ‘X,=\Ô\î','Ãles Cocos (Keeling)'),
('\í‡\\\ZhJ¹°l\â\ê\àü´','Ãles Cook'),
('TÁ\ñAÎQ`&\ãC','Ãles FÃ©roÃ©'),
('ÀFP˜\ŞMŸ¿se\æ','Ãles Heard et Mcdonald'),
('7š »K«Œ\\g Cz\Ê\à','Ãles Mariannes du Nord'),
('*v<\÷	·GÁ‚Œ\æ¨zC','Ãles Marshall'),
('ş£\ÜNo&Ié–±\â‚Ö•','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('mÁd\\,ŠOÍ˜`qjŒ¾','Ãles Salomon'),
('\õX1I\r‘O ıÏ—','Ãles Turks et CaÃ¯ques'),
('W<JŒ\ÄBÈ‹£¯²™‘²a','Ãles Vierges Britanniques'),
('—\Í~FC@½”~´_','Ãles Vierges des Ã‰tats-Unis'),
('§\Ä\Ğ\ßBk•(¬V°±§²','Inde'),
('\ŞDC˜\\>±·\Í\Ø','IndonÃ©sie'),
('5\ï_°gAÄ‰¥É’\ã\ó','Iraq'),
('¢şe7\ò@h‰\î;°\×\ã\0\í','Irlande'),
('“Á)±\Ü\\N\Z»\Â\\4ı©','Islande'),
('\Î]@\×?mClı®\àeO\\¯','IsraÃ«l'),
('\Ä?–`  B·˜†³Å‡¿','Italie'),
('\Î\é¤\ä†J‘¤†&\Õ{a	','Jamahiriya Arabe Libyenne'),
('³»g\òuAü§Æ¶\÷1\Ï','JamaÃ¯que'),
('£Ed\Ü~UAù¨ÀIÁ»¡','Japon'),
('¡²1RDLÑ½\Ù\rµÜ¾¤\á','Jordanie'),
('\Ìi$^I\ZNX¡úªúIşª','Kazakhstan'),
('‘¡\ÖÀkD%²{++]\ö¬','Kenya'),
(' /#HE\ë’]\ß<\'+“','Kirghizistan'),
('La¹¿\Ú.E\õº\ÍÍ¾Œ>U','Kiribati'),
('˜´³>\ÆI­­üÒŠNÿ','KoweÃ¯t'),
('FC†\óNûM\ó›\×\Ò2nB9¾','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('d\ÔN\éƒLJ­Z\Ù\ZX‚J','Lesotho'),
('v\ã³0B[¹¨a3\òn’','Lettonie'),
('-x¸\Ò\÷K€§\÷Wt¯|','Liban'),
('\Ğ\ë\ÉC—£B…	\õ1•','LibÃ©ria'),
(',K\ğG\ïœFÛ¶\ôJYº','Liechtenstein'),
('uÅ›¿\ÊHA—\Õ \Êq','Lituanie'),
('/ˆB\'C!›/NS\ßf','Luxembourg'),
('\ÑF€“©@ÓŠ)z«\ë5\È','Macao'),
('»K‹Q¬B9µP\ê|\Ï\ì','Madagascar'),
('“Qƒ¾\Ï-Ee“µü\ã¿\ÂŞ±','Malaisie'),
('\×ÔR­F\íº\Õc\í\õ','Malawi'),
('ÀÛ¼^vSFÈ–Ÿ½¯L','Maldives'),
('z\Å\Ù!Gø@°—\â,p9\ì&','Mali'),
('8ø­qGÕ„gjP=\Ó\Ä','Malte'),
('Ÿ\ŞVÿ6Eë›¬\ÑFh^V\é','Maroc'),
('›n%«UKD£ü-,šq\n\İ','Martinique'),
('¢z³#\ÂM\r¯¡\É;¦Ä‘','Maurice'),
('B±›;KR¢\í\Ûû\İ\Üb','Mauritanie'),
('ı\Ê\Õ8Ú—@Ê½k\Å\ò\Î6À\ó','Mayotte'),
('«¡_F“˜É \Ü\Ä\ãi','Mexique'),
('\í\è)\ÆJf\ÕDQ§j\ğ\í','Monaco'),
('\ãsvÈ„|D•\ÍF¶qp\Ø','Mongolie'),
('°µ\Ã\é¥MV„dÕ¯t‰','Montserrat'),
('{‰6/\ô“DS™ş—\ò¤¨\â‹','Mozambique'),
('·ıi\òcCØ‰‹\ï\à¼','Myanmar'),
('~\ÏVŸ\0Gqºu\Ô$w•\ô','Namibie'),
('\ĞD(KEÿ«¯é‹¹±','Nauru'),
('H8‡mşM”Œ\Î\Í\Ù\Ï\Ğg\â','NÃ©pal'),
('µ\ã¿\ìII×¦\î6K‹X}','Nicaragua'),
('xµ\â´lWGL©\æI£KH¦¤','Niger'),
('\Ğ\ÍvC¤®EE«±¼’\"v\æ','NigÃ©ria'),
('\Zû\éHLH¶\Ìı}H¡\rZ','NiuÃ©'),
('	\Ä9HBªƒY…‹ûU','NorvÃ¨ge'),
('ß‘Ì€˜FHÓ½\Í\ÉCZ\ğ°\ç','Nouvelle-CalÃ©donie'),
('aHW\åp?Fú’\ñÈ€\ñ:','Nouvelle-ZÃ©lande'),
('>˜œ\öÈ…@C¾RÆœ\Óv\î7','Oman'),
('À\àC\îxC*¹\ía(l\òü','Ouganda'),
('hgkh\ãA\è¼\İİ…\Ì\íL','OuzbÃ©kistan'),
('ªÎ³&\é3E\à¨aŒ\õ\í.','Pakistan'),
('°ˆ¯”J\é\Å7†\ÃD','Palaos'),
(')4#/¢³H¥¥J#\İ	µø\ò','Panama'),
('\Ğ\ÆLL=\ÌBy¶dOJ7,Ó‰','Papouasie-Nouvelle-GuinÃ©e'),
('{³ø\ÑvG·¨\èiƒ°\Ã7ù','Paraguay'),
('\Î(SËŸPL×<\Ì\Øo“','Pays-Bas'),
('s\Êx\n @ì‹‹^\ï\õ\ÏE','PÃ©rou'),
('•tJhM8™´lª¡@\ç','Philippines'),
('°…\ê^D¡†‹¹Ì²l¸K','Pitcairn'),
('\Äw¨v\ÏGXX\Ö<\ÑR‰ˆ','Pologne'),
('•ø\èß‘\ÊA2ƒ\Ê7²\õ¶&','PolynÃ©sie FranÃ§aise'),
('»\ßøD—RF”)O\ì\ÕBz','Porto Rico'),
('\ó‰\0¯–<J^½ƒ\ğ\Äo\Ş\İW','Portugal'),
('­ i\ï‚J2·‡À­BoµJ','Qatar'),
('©›XF\ó\ĞH,¸£„5¼SŸ','RÃ©publique Arabe Syrienne'),
(':Ş¡;¦ıDx˜\Ó?7?Ç„\é','RÃ©publique Centrafricaine'),
('²p€Ÿ5jLB˜cF®ªp','RÃ©publique de CorÃ©e'),
('kù’ıT’L¯±n\å%d\ÖC','RÃ©publique de Moldova'),
('\çdeM\â%H\ğ”¸E²9\Í','RÃ©publique DÃ©mocratique du Congo'),
('T¨¢@\Ù\ÖJyƒ\æHt\ëVQ','RÃ©publique DÃ©mocratique Populaire Lao'),
('ªÔ»\éHË¾V#?ŒÁ\Û0','RÃ©publique Dominicaine'),
('üœ\ï61\ÈCË“\éA\Ş\r\÷','RÃ©publique du Congo'),
('’;»XQA¶e&+T\r\Î','RÃ©publique Islamique d\'Iran'),
('-[WF\ÊüM¢˜\ğ#Ä V','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('\Öc\×\Æ L\íˆ\Ø\Üa1\ßD','RÃ©publique TchÃ¨que'),
('³d‚\ìƒLHRª\Î&5}\â','RÃ©publique-Unie de Tanzanie'),
('G4¤—\âM§­™¿µªV–~','RÃ©union'),
('B\ïtQH´\Û^0ªÿ','Roumanie'),
('§k\ÄZZI|+\Ğ1›T','Royaume-Uni'),
('¬`ú\é\\»M¹®\ïb¯º¦','Rwanda'),
('b\ì\ïz<M¦ƒ©g#i\Ì\ç\Ğ','Sahara Occidental'),
('q\Ö\Ê\Â0eO©€€¸·\rewe','Saint-Kitts-et-Nevis'),
('\ôIV\ÜjIØˆˆ?‹?\Ôi~','Saint-Marin'),
('‚„\äA¸¤E®lhb\á','Saint-Pierre-et-Miquelon'),
('[$GpWIo¤\Ì~½‡¹§','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('¡ˆZEv\İOŞ¦5¨ú¸\É','Saint-Vincent-et-les Grenadines'),
('@¡ \×\ìAe¸|\0´\é\ö\İ\ñ','Sainte-HÃ©lÃ¨ne'),
('#_úøv±Fi†7¶\Û“®','Sainte-Lucie'),
('\Û\ê\ŞQ\ØgN\ä¬¡“Ba@','Samoa'),
('w”V\ÂMŠª\ÔO \ë4\Ån','Samoa AmÃ©ricaines'),
('yN@–\ñ\ßK¸µÇ=J¯ü\İ','Sao TomÃ©-et-Principe'),
('\ì\Ø\Ã\ç\ÍvE\ä¤.gBû\öş','SÃ©nÃ©gal'),
(')²|üKuˆ—\ÕCıÀœ\É','Serbie-et-MontÃ©nÃ©gro'),
('.W‰¥µgA/·3€ƒ4N\È','Seychelles'),
(';¶<\rCÊ„Ë‹m\Ã¡','Sierra Leone'),
('£ºİ \Î\ñ@Œ¼H·\Ñ','Singapour'),
('j\r­Šg¾A\ğ£¬ÿ¹F4\Í','Slovaquie'),
('S\Í\Ä\ëÒBv†\æuD6º','SlovÃ©nie'),
('ÕšŸ\ÜfK©·Ê‘²\"\é!–','Somalie'),
('‘–:üF*Iß€1§\Ã\Ğ\ê','Soudan'),
('\êx<C»B»\åbVÒ\Ó','Sri Lanka'),
('\é\èH\ßgşOy«“W²\Ñu','SuÃ¨de'),
('(\å{fREŒ–¥°@Oˆ','Suisse'),
('Ş\r\ÃF·£¤şN&ƒl\ã','Suriname'),
('Zt|„ı¸O\ç¿N\ßİœh©ı','Svalbard etÃle Jan Mayen'),
('À\Î\é¨?Nbƒ¦D\ò@¿\Õ&','Swaziland'),
('ú‘a®@\ŞA@¬\Î\Ía$¨\ğR','Tadjikistan'),
('\àª8	\İA\\·yp}´\ä\É','TaÃ¯wan'),
('R²\Ï[Gq½®]\é.\Ê{t','Tchad'),
('3G”\îO )ûŸyƒ+','Terres Australes FranÃ§aises'),
('\Ç]V96Nj‡¥®[ƒ\Ì\Í\Ø','Territoire Britannique de l\'OcÃ©an Indien'),
('°‚\×2bO|‹\Äf®¥€·-','Territoire Palestinien OccupÃ©'),
('Wifaş¼J\ğ£ü\×\èÿ]\ÒP','ThaÃ¯lande'),
('µt\Çxœ*I–¼%St­GKl','Timor-Leste'),
('Kw_Ü­Ko¡Ş”ü\ó±1T','Togo'),
('\Ñv\â{%J±°`\Ñ\Ê¯\á','Tokelau'),
('fú®\÷\Ç\ßNıˆˆ<•\Ú\çF','Tonga'),
('·=h[fIš¤Z³ˆ\Û\Øÿ','TrinitÃ©-et-Tobago'),
('•\åƒ~\ÏO±´	V¢\â1','Tunisie'),
('\í1œSBd’|ÿ\Î)\çO','TurkmÃ©nistan'),
('Oxú}G¨Iª–tşm\ÚÚ·','Turquie'),
('-\ÂÀ\ë\ÎH\í…U™\Å~:A','Tuvalu'),
('&{B‡mIĞ²n¸Ô§\Ú ','Ukraine'),
('º\Ïa\äJ\Zœ\ów\\¥©P','Uruguay'),
('ıy›\ãºMKU¥Ü„§\Æt\Ú','Vanuatu'),
('\"\ö…¶9Mı\Æ\ñ>p•=','Venezuela'),
('7Ä†\ÒMeI8¿¨¯«©\ìy˜','Viet Nam'),
('»\árKMªU¾<û#^','Wallis et Futuna'),
('>„hy\0/Ib€„İ9K2','YÃ©men'),
('\å0ü²şÿD\óªL—\ç\İM¬','Zambie'),
('\\G*\nEÓ¨Š\0\Üe\÷ ','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-12-14 20:08:36',3),
('DoctrineMigrations\\Version20240201152951','2024-12-14 20:08:36',1),
('DoctrineMigrations\\Version20240202084749','2024-12-14 20:08:36',3),
('DoctrineMigrations\\Version20240202150901','2024-12-14 20:08:36',2),
('DoctrineMigrations\\Version20240207105701','2024-12-14 20:08:36',2),
('DoctrineMigrations\\Version20240319212437','2024-12-14 20:08:36',2),
('DoctrineMigrations\\Version20240614133504','2024-12-14 20:08:36',11),
('DoctrineMigrations\\Version20240617165906','2024-12-14 20:08:36',9),
('DoctrineMigrations\\Version20240708061729','2024-12-14 20:08:36',12),
('DoctrineMigrations\\Version20240801202153','2024-12-14 20:08:36',3),
('DoctrineMigrations\\Version20240815153823','2024-12-14 20:08:36',2),
('DoctrineMigrations\\Version20240916065051','2024-12-14 20:08:36',5),
('DoctrineMigrations\\Version20240929091802','2024-12-14 20:08:36',10),
('DoctrineMigrations\\Version20241002164506','2024-12-14 20:08:36',7),
('DoctrineMigrations\\Version20241119144432','2024-12-14 20:08:36',12);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-12-14 20:08:36','root@gmail.com');
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

-- Dump completed on 2024-12-14 20:08:37
