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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',259.99,'2024-11-03',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-11-03',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-11-03',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-11-03',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-11-03',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-11-03',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-11-03',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-11-03',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-11-03',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-11-03',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-11-03',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-11-03',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',1299.99,'2024-11-03',NULL);
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
('/\Ò50€`L]®l®\0À\ñ©','Afghanistan'),
('/\àf\ÕzLº\Ùûš|qx\Õ','Afrique du Sud'),
('5m\ØFŠ‹A¡¢^R±²f','Albanie'),
('u7}BGß£h\n­‰>\×ú','AlgÃ©rie'),
('l\ßv\â6\åJ#Š5~\Ã@[@','Allemagne'),
('§¤-ä£ŸM¿([Õ¯²\á','Andorre'),
('ú\0è­¡C™\Ò+\Æ6m\Â','Angola'),
('ú±ŠCOf—\ã\õˆ\ö\é;¿','Anguilla'),
('5]ˆşG<²BŒú†¸q\Õ','Antarctique'),
('K¡v¯L˜J\0œ\ÛWp’yX','Antigua-et-Barbuda'),
('ş\ß\óMF\õªøgµ\ç‹\éW','Antilles NÃ©erlandaises'),
('Eš”ƒ\ØF@œ} ‰,m£','Arabie Saoudite'),
('±!²I|C\"˜>–Œ•“','Argentine'),
('1¹~_F$bW\Ô\ô\ØÏ±','ArmÃ©nie'),
('ù\Ö*K M’\ê|sGPn\É','Aruba'),
('nX£_„½MT¡WbËª “>','Australie'),
('w \ë¿8F	¦\ñ¥EÃ´\÷q','Autriche'),
('<’ˆ(«J\÷¡‰\å\ö\èN','AzerbaÃ¯djan'),
('\ãv¡\á\ÃFB¹inŒ\æ$','Bahamas'),
('tş…\àlRLq«ˆ”¨™¬l','BahreÃ¯n'),
('Á³\"K€¤.\0`$','Bangladesh'),
('y¨Ô°\rL±…b€u“ã•','Barbade'),
('P…g$g\ÃC‰›^aQ7üµ','BÃ©larus'),
('NQ\ÉRNŒN\ò‡Q\äşş`\Ã','Belgique'),
('¹Y^2\ÄJÊ‚k&jvŸ\ŞX','Belize'),
('\ğ\á›\Ş\ÖCJ\éD\ç\ÅjG$','BÃ©nin'),
('³v$993M,¨/O~\Éø5','Bermudes'),
('T{hfIÏƒ\öd\0\Î\Ø','Bhoutan'),
('E;:`NIœ˜”\ÅO—ƒl¢','Bolivie'),
('®Š*vQ)OL§©dz9 ÿ','Bosnie-HerzÃ©govine'),
('-)EOÈ¦´\İ\Ë`p','Botswana'),
('¡‡zIúEº´yNcÂ°\"','BrÃ©sil'),
(':\â`>ÀD\èˆX=‹J\Í\Ü','BrunÃ©i Darussalam'),
('\ó\Èk\ä\Ø\ÃE1Š#Fú-\æ]V','Bulgarie'),
(':²üJ\ö	G¢¬°£\È\Ä\æP','Burkina Faso'),
('!9Ş„cJ¨¤‡¬\Ìbù','Burundi'),
('¦%©\nUAi¯G,¹Z','Cambodge'),
('¯\Ê\Ñ\ÌX\\J¹k,)®G°¶','Cameroun'),
('98y^H™>>š\Ë<\äÁ','Canada'),
('\ğÑ—L¶\ÑA8¬¸€\ñm','Cap-vert'),
('¡\\`º@›–T¥je','Chili'),
('ä¤»\ê\âD’qvªR©…\Ê','Chine'),
('x¥.\Ä\ĞOÈš\Ø\íOƒúL','Chypre'),
('‡\÷\ä¼\ÍyEˆ¬\Õnüş\Ë\ri','Colombie'),
('¥X1›P<LŞ¤Xµ¥¶šs','Comores'),
('\nŒ —ƒAF¿©WÜ”Ÿ¦','Costa Rica'),
('¼I)\ì¼\nKü‚x#°fE','CÃ´te d\'Ivoire'),
('{I\ÒÄ¼iFÎŸr\Îsj','Croatie'),
('†!™\Æ9]FZ§Ar·¹\Ç;','Cuba'),
('š´?o\ÒoJØNR‰Á‹©','Danemark'),
('G\Ã?«¥~H4„G\Éf\í\ã','Djibouti'),
('f9&\\ßŠF‘·&4\\L\ÇCŸ','Dominique'),
('”½¡·FÓ‘u\Æ\ğ+T','Ã‰gypte'),
('\è…´\Ö\ÏBŞºúUx\ò','El Salvador'),
('\0\ßÈ·O{Ok±‡\Ø}\0ø,','Ã‰mirats Arabes Unis'),
('‰3L| #IÈ¿>“M,','Ã‰quateur'),
('ªf›$…\ÌG[\"\Å\Õ\çù\Ú','Ã‰rythrÃ©e'),
('×À\ÊK°©_\×\èŠ:8\Û','Espagne'),
('\ßea\ß_BOM¾\×c\Ì<ˆ\ğ','Estonie'),
('\ÆPa@“LÉ´yo>H)\Ôk','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('t„§·8A¬z…\É9p¢9','Ã‰tats-Unis'),
('’\é;–ÁrLiŒÿt\Îl\Ç\â','Ã‰thiopie'),
('Lø\ÛÀWOT‡<6O‡M','FÃ©dÃ©ration de Russie'),
('BVY4\Ü]K(…\í\õ¦ÿ_‰','Fidji'),
('	\Ï\İ\×tIc‡¹\ÍP\\nC\Ï','Finlande'),
('¾W\Ô?F\ÔJU˜£\ñ$(¼,','France'),
('}û©a\ŞM6¿\å×†ù	€','Gabon'),
('“ŸŸEqO_’ †‹\ça','Gambie'),
('\ë\ÛU\ğĞB„¶\ZÆŸ×‚Ï­','GÃ©orgie'),
('¦)“¨\ÔB\'£>Ğƒƒ«<ú','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('kdú½MLM\ó…ŸÃŒE\É\é','Ghana'),
('Ç´\"½T@İ¦ej1¯Ë\×','Gibraltar'),
('…\ãD\ã<\ôI¾£­ü=8\î£','GrÃ¨ce'),
('\Ù\ÎEU\ö)M¨°ww0NX\Â','Grenade'),
('U¤\Ó\ßE‰ªùÀ¹^´','Groenland'),
('‘Â»eI\ìŒ\éu\ñ‡\óŒ\ô','Guadeloupe'),
('\ïŞ«\æ\òL1\İ~\Ü!','Guam'),
('Ü¶ºB\Ü:C°²\å\ä\nh¸„','Guatemala'),
('‰SIN¼\'O¾ú7§]@q','GuinÃ©e'),
('\é\Å&\î$G~¹E=m\Ô~','GuinÃ©e Ã‰quatoriale'),
('`™ˆˆ¤B\'®/uSm\ËT˜','GuinÃ©e-Bissau'),
('jWf\"¿DGÀ”¦us‰¨Š','Guyana'),
('_²3œ€EGKƒ5S_{¶\ë','Guyane FranÃ§aise'),
('š\êbxkKœ\ğ\îE\0cC','HaÃ¯ti'),
('QÜ¿¸¢\óHù‰İİ½z¡ƒ','Honduras'),
('\ÄJ»ÚºjA.£\ãz\ìÖ§\ï','Hong-Kong'),
('|‡j\ëDhš[,Í€V','Hongrie'),
('£g\ä8WJ,¾	+ùy\÷','Ãle Bouvet'),
('fş\Ê\îN!K”ª©¤,@[\Õ','Ãle Christmas'),
('•TGhÿ Bø¯Š†œÄ†','Ãle de Man'),
('±K²©ˆB)­\0šl\òFª`','Ãle Norfolk'),
('cƒ\Í\İ}AI™\ÄE\\aˆ','Ãles (malvinas) Falkland'),
('“ŠŠ\Ç`dF¢§w^o#e*S','Ãles Ã…land'),
('t\ã@6B\ãÀP\İù~7','Ãles CaÃ¯manes'),
('WL\Z\×\ëF}»\Õş<û,*}','Ãles Cocos (Keeling)'),
('%{\ã\ÈIø•<\éşg<)u','Ãles Cook'),
('ùªÁPJCÃ”\İR=l','Ãles FÃ©roÃ©'),
('\ÔÁ\è-ıAŸ\ëWŸ.­\Ü','Ãles Heard et Mcdonald'),
('œVø\á\òN²±X‰\ô\âr«\æ','Ãles Mariannes du Nord'),
('‹§\Í%¼\íJ\ï¯\ÓÑ£®','Ãles Marshall'),
('Šı\å\ôıH‚€Ü›{h\è','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('i\n¿\ÅO«ı\Û','Ãles Salomon'),
('¬Ö·)B‹ªf>\r0˜','Ãles Turks et CaÃ¯ques'),
('ªr7²\"¦Jkµ\ç1îº¯f','Ãles Vierges Britanniques'),
('O\Ñ\ÉAœ2ú\Ğqd\Í','Ãles Vierges des Ã‰tats-Unis'),
('¹y\ì\ä-B\à™\Îo\áÌºDL','Inde'),
('‘Û¶™\ñ\áDu\r\â\óh\ö>','IndonÃ©sie'),
('ªÆ•[úJCÁ‘±\Öb”Oƒ','Iraq'),
('\ö\ô­YK¸€­\×M\È\Ú>','Irlande'),
('pwba’–KVˆ›tR\Ñ\ò>\à','Islande'),
('·4\Æ\r…BY«j½„\r¤¨','IsraÃ«l'),
('0¿|nF*º\Ú\õ6\ÎÚ','Italie'),
('F\ç·:3J\í¿gn™U\\Xe','Jamahiriya Arabe Libyenne'),
(')\Ä5E—E	;.Ô“~\õ','JamaÃ¯que'),
('G\"r\ÕOk™C7ú–]','Japon'),
('G„\r°J¼I\Ö\ÊÇ°L<','Jordanie'),
('¥D¯H~•E°+du\ô~¸s','Kazakhstan'),
('\É(S/\ŞF„ª\Ñ5$w\Ê=','Kenya'),
('Pş·	M\0—ªuK¯³±','Kirghizistan'),
('>DÍ7N?¾ª\Õ\ò­\ñ\Ü\å','Kiribati'),
('y`_o¹C`Ÿ2\ÙĞ‡vÀv','KoweÃ¯t'),
('\ÑX‹i\áNp‘t½\rĞ‡\í','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('Á°\ğ‡^Bj#<\"¡\ğ\Ú','Lesotho'),
('?\Ñ(qZM¢ \rı','Lettonie'),
('\â:\Ø\0\â`O¨Š\'¾S&tS','Liban'),
('\ñI…ü\Ù\ZLø¤¹\Úb\ë)','LibÃ©ria'),
('\Õ<)p¯Iœ©\É\çN¶y‘','Liechtenstein'),
('1´l«DÊ¨rG7\ô\Ë\á','Lituanie'),
('\É;fXG\á–r9¢\0¤\'','Luxembourg'),
('ƒ\à.\'CÁ†`E^©F\ñ\å','Macao'),
('\éµ35\rL+°tH\ÃO€\Ë','Madagascar'),
('=œŠüO›·m54Aı','Malaisie'),
('?J[%F@´N«s\Ùs','Malawi'),
('\Æôƒ¾™\ö@4˜P\n—s\Ğ','Maldives'),
('”«C\î\Z•JT’\ğWp™\å','Mali'),
('\â\Ò\é\ëo\èJ\\¬XKp›\ó','Malte'),
('\Ç	_MO\êNĞ˜kİƒ¬]]³','Maroc'),
('£\ÍnDtAw±‰h\ãTü¶','Martinique'),
('\0\òLl>F\nœ\Íÿ‡™¹½\İ','Maurice'),
('dr6«³H\r€«v(Jı','Mauritanie'),
('€Æ‚‡@‚\Ù…\r\ôt','Mayotte'),
('\Şn\'²+\ÅM’\İb®\ä½','Mexique'),
('Cšgm™A[—cdrÁ„±','Monaco'),
('¦—§s†B²ü.‰µ4\İ','Mongolie'),
('\Ñ\÷pııAA—İ¿y5§ª','Montserrat'),
('\\\áj»bEy€»\Ñl“r','Mozambique'),
('\í‘ƒoDE·¼©@*Cÿ','Myanmar'),
('¡½=A\×HJ®ª[~\É]\â\ò','Namibie'),
('ˆOº©C\åªDÄ˜‹:ú','Nauru'),
('Á†q­¤\éB\à¸Aa\ğÌ·aŸ','NÃ©pal'),
('<Á\nM“\Ò\í\ÙX¯\ğp','Nicaragua'),
('\ğA\å$I¥A×¬ÿ\Ì2z','Niger'),
('˜\åDy¾uyr«9','NigÃ©ria'),
('\çş¼™3\'F½‚KB3wm”V','NiuÃ©'),
('´S\ò\\·FÚ‘ª„]‡\Z','NorvÃ¨ge'),
('¾šOb&\äC››\ä\nG\âd','Nouvelle-CalÃ©donie'),
('u\"‹Z\ÉGºˆŒ¾\ì‡\Ü\ïE','Nouvelle-ZÃ©lande'),
('5Õ¿Ã«\ÌI\n†-l\ğ(6','Oman'),
('+uc·(D}¶­SÈ§','Ouganda'),
('C(ƒ\ÚxJM™ßˆ#!\ì','OuzbÃ©kistan'),
('”ÿ\Ö\Â(\ÂFR—¥¥»&\Æ\Z','Pakistan'),
('\"\Ù\Âg\ö’M%²@µ9;Ge','Palaos'),
('|\Z{#GmMo²’\â˜Ö\Ö|','Panama'),
('Ka\òÁ¬4L-°X,_\â3”','Papouasie-Nouvelle-GuinÃ©e'),
('r­\ô0\ç¨HÔ®\Í\ò@\İm\\','Paraguay'),
('ZPw,&Jøš¿~£‹û\Ú','Pays-Bas'),
('\0´aK\ÃgMÙˆ\È\\<”\Ì','PÃ©rou'),
('¤8©¼MY…V,\Ûf¬','Philippines'),
('$\Æ*¾¹J\\¿QZfgs£\ì','Pitcairn'),
('\Ñ\ò•‚\09E\r¸l9†\'À0E','Pologne'),
('I\î‡K\çDù¨HoA\è´i\ß','PolynÃ©sie FranÃ§aise'),
('‰ªo\0\ñ4E\ö²³U\Ö\ö^#','Porto Rico'),
('\×T‹ši°IÆ¶†²|\Z†\î','Portugal'),
('ct\Ä\ëFÑ¹Ob¹~hS','Qatar'),
('\ó\ö\ëeRD§U\ãúl¨:','RÃ©publique Arabe Syrienne'),
('\ö>pµ\÷IÛ‚V†ül6¾','RÃ©publique Centrafricaine'),
('É¾\Ä\òOBI¡\î\\@µ\î©^','RÃ©publique de CorÃ©e'),
('\'®—Gˆª†™ui‚\ê­','RÃ©publique de Moldova'),
('S\Ù\âÅ›¿CB¶†b\êˆf\r','RÃ©publique DÃ©mocratique du Congo'),
('»\Î\å\ğ\\?NT”6Â¾\Ş\Ğ\È\ñ','RÃ©publique DÃ©mocratique Populaire Lao'),
('=¬¬=©@G¡°>:q¹Y','RÃ©publique Dominicaine'),
('’.Gm\äƒH{†\Ï\0”3fj','RÃ©publique du Congo'),
('©w\×VşL®%K\İ™i\÷','RÃ©publique Islamique d\'Iran'),
('c2,ø\ØwNƒ\÷u]T­ÿ','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('l—Urˆ<C=”ø\è','RÃ©publique TchÃ¨que'),
('$¿ıª\íOÈ²U\ğ°g<©|','RÃ©publique-Unie de Tanzanie'),
('hZ?La!G’®\Ë\"§C¤ ','RÃ©union'),
('\Ü;]¸$¢F¥•Ás\éVı','Roumanie'),
('G´¾ˆQšK¾‰\ë:\Ì\Ó€X','Royaume-Uni'),
('…F\Õü­‚H‹‚\É\×Œ£—','Rwanda'),
('\êd\Ğ.\ßlLİ•-??Q©','Sahara Occidental'),
('z¼¿ù­—MÖ¯K¦\ì\äJ“','Saint-Kitts-et-Nevis'),
('Ÿf\Ü\Ì\ŞF§—\ç9Ì”¶Çœ','Saint-Marin'),
('v\à:\Ó+\íHe¦«Ü¬f\ë\Ì\ñ','Saint-Pierre-et-Miquelon'),
('·ÉŒ¥ªB©š¡\ÓP\Âı­V','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
(']v‘5\Å%Il­¥0O%\à/','Saint-Vincent-et-les Grenadines'),
('\Çt\ÔlLz¨k& S','Sainte-HÃ©lÃ¨ne'),
('!\É[ù¿°M\í¸\ó\r/RM`','Sainte-Lucie'),
('\ô\òHSº-šI \\\â¹','Samoa'),
('†Brï›–H¦x^\ğ\Õ\ñnL','Samoa AmÃ©ricaines'),
('\ï\óNo\ÅA8Õ•É+\å','Sao TomÃ©-et-Principe'),
('@	ˆxEú¬\÷G¾N­','SÃ©nÃ©gal'),
('N\ä|W\ìB´‡<\ß\"ƒ\ä\ä¿','Serbie-et-MontÃ©nÃ©gro'),
('\å¤\éj\'M\ëƒĞŠˆŠ:@¹','Seychelles'),
('\ög\ÚB|+J;«­ «M;¤£','Sierra Leone'),
('@e\Ô*GGg€f ¾Nº.','Singapour'),
('r3(k	ı@›¢D[\ò¯\Ï','Slovaquie'),
('ªüg8¥JP¤\ßQ>\'{T','SlovÃ©nie'),
('S{%Ë’M0 \ó3\ë}\Ï\Ë','Somalie'),
('Y\n­\ì\ğN²\ãû\nµld','Soudan'),
('¸®S=W´Eoš\ï\Ê\æ\ÙA‰','Sri Lanka'),
('Ü£kŸC•†\är\ã5ı\ë','SuÃ¨de'),
('ü\Â%HSBY®\õGÊª@úZ','Suisse'),
('+Ï­CICo€g\ñ+\ÜO†','Suriname'),
('H*\ÖD.@\ïM\èP>¦$','Svalbard etÃle Jan Mayen'),
('§\ï\Ô\n\ô9DÓ˜^!ÇµØ¿ù','Swaziland'),
('F\à¯\É9kDÔ¢³_¶\ñÎ™','Tadjikistan'),
('Äf\×SC»Dvı5g8','TaÃ¯wan'),
('w\ôø\È\ô\×IÄ¹‘\İ]i\Ë\ö(','Tchad'),
('&\ëz\ìAØ™ M°U¤z§','Terres Australes FranÃ§aises'),
('\í°}ù\È\ÚL\ğ¥´ü\Ù\ö','Territoire Britannique de l\'OcÃ©an Indien'),
('5™s\ç\öN`Ÿ!Æ­E\r','Territoire Palestinien OccupÃ©'),
('\ÙŞ©a›Jjœb\È+\ÎO,!','ThaÃ¯lande'),
('\Ú+=MNGŒ¹\ğ’\0’','Timor-Leste'),
('P0»7)I7œ¼³\ó\à\Î\ò','Togo'),
('’Gœ±`DªŒsÌ®\Zc','Tokelau'),
('H@\Ğ\É•Eƒ§h\ç\ã§\Ãú','Tonga'),
('S\ï™.\ÌO‘\ÓQ¨ù™~','TrinitÃ©-et-Tobago'),
('\\	\n.OÕ—\Ñ´B','Tunisie'),
('2Ó´a‰I™¿¶¢_\öq¤\Z','TurkmÃ©nistan'),
('P\ÔıFG\é´JX¢\à©','Turquie'),
('\ò\ç >D[O;´®–¢\õºµ','Tuvalu'),
('•‡-\ß\ÄÁGœdo ÍŠ‚','Ukraine'),
('\'d YjJŒ–\ØCÁƒkh\ä','Uruguay'),
('\Ä\à3Š=KĞ¨U}\òûb','Vanuatu'),
('·\ëÉ„\ÃMÕ°(‹ĞY','Venezuela'),
('\ôvOeúNJºgJ\Ö\ÔD\Z4','Viet Nam'),
('}+IO\îEÂ«\çt\ğmy®g','Wallis et Futuna'),
('Kp½4P¾A¾n£G\ÖD\ç','YÃ©men'),
('ş\É\È\õzJÇ½w\×c$+‹™','Zambie'),
('0uˆ³Gÿ¡	U]\Ç\"','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-03 18:22:23',3),
('DoctrineMigrations\\Version20240201152951','2024-11-03 18:22:23',1),
('DoctrineMigrations\\Version20240202084749','2024-11-03 18:22:23',3),
('DoctrineMigrations\\Version20240202150901','2024-11-03 18:22:23',1),
('DoctrineMigrations\\Version20240207105701','2024-11-03 18:22:23',3),
('DoctrineMigrations\\Version20240319212437','2024-11-03 18:22:23',2),
('DoctrineMigrations\\Version20240614133504','2024-11-03 18:22:23',12),
('DoctrineMigrations\\Version20240617165906','2024-11-03 18:22:23',9),
('DoctrineMigrations\\Version20240708061729','2024-11-03 18:22:23',12),
('DoctrineMigrations\\Version20240801202153','2024-11-03 18:22:23',3),
('DoctrineMigrations\\Version20240815153823','2024-11-03 18:22:23',2),
('DoctrineMigrations\\Version20240916065051','2024-11-03 18:22:23',4),
('DoctrineMigrations\\Version20240929091802','2024-11-03 18:22:23',11),
('DoctrineMigrations\\Version20241002164506','2024-11-03 18:22:23',8);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7','\É5?0O¤…€)\\¦ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-03 18:22:23');
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

-- Dump completed on 2024-11-03 18:22:24
