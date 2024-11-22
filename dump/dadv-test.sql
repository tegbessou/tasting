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
('±\"ScxLM 4\ñ=\ì—\èU','Afghanistan'),
('J`kwwYGß2ZgK#\ñr','Afrique du Sud'),
('»FU9·IHŒ&\Õ\é\ç\Ú\Î','Albanie'),
('ilH‡ŒC\'°œk\È\í ','AlgÃ©rie'),
('9ü“f™Eœw&Yıa\ç','Allemagne'),
(';7o·“KIˆ:°‡\Îm\é','Andorre'),
('\0\ÇÎ­\ÅIÙ­LQz~','Angola'),
('pŞ‹Ø±H\ë¼\ó3Š\Å\Î','Anguilla'),
('\Ê+ıpaB¡&üi·j\ñC','Antarctique'),
('L<\êt\ZH£ıy=\Òn½','Antigua-et-Barbuda'),
('³QQ+)\ôOŒ™E•\å\Ï%‚','Antilles NÃ©erlandaises'),
('é¦“iø­Kú \ÇC\É\Í´·','Arabie Saoudite'),
('}¦ƒ¿‘Hr¸\Ë-Zvü\ß\í','Argentine'),
('>‹ºbqFQ£¼¹h`[¬-','ArmÃ©nie'),
('Œ¶?\ñC¡‘b*Fb¡','Aruba'),
('Zÿ€d\è]@#†\òüÀolKA','Australie'),
('‘\ãyeqG=­½B©ÆŠV‘','Autriche'),
(':y*\ìNâ¨±\ô\ít‰Z','AzerbaÃ¯djan'),
('š\Ã\0Î‚\öH£¿\ö¶\"\Æ\Ş!','Bahamas'),
('†Pú\\.O ¡ntf(œ­0','BahreÃ¯n'),
('pa\"\ÎGA¿û\íÿ“¤jv','Bangladesh'),
('\æ\È$µHf²\÷<ı¶R}','Barbade'),
('¤}…‚\Ø`IÛ…Z\ñ2\Ú\÷ı','BÃ©larus'),
('\ğ¹,^;Kd§ÄšøP:‚','Belgique'),
('y\ìQŒAD¸So)\ì¼aY','Belize'),
('›æ¶­@ÿ t\ãr|¥','BÃ©nin'),
('\Ó\Ï\Ñß°HO¡¬\ß\Ş\õ2¬','Bermudes'),
('\ÊNF\çJşˆ¦O.Y«','Bhoutan'),
('5\Ô\nZ‡;D¶\óıJı0 O','Bolivie'),
('\ã\Ér¯2\ÏM½Š\ß\êId]\ì','Bosnie-HerzÃ©govine'),
(' QMcüEÑ¯\Û5\n/M\Ä\â','Botswana'),
('§Ğµ-GrOx•ˆ¹E	§‡','BrÃ©sil'),
('©	†R²wM\é­—K+1º','BrunÃ©i Darussalam'),
('\àiBÆ \ØFÊ;´^…z³','Bulgarie'),
('ù±³‡†NÈŸ¨w¼¼Œ’¤','Burkina Faso'),
('CŒIF@D†J_ù)Ç´G','Burundi'),
('\İ1D\á_{OÎ”ª{dpü','Cambodge'),
('\Ë\ê£(gWJª¤>dDfD.','Cameroun'),
('iB9¡CJÑ¥£’p\â\Ç','Canada'),
('A\Ü2\ô\öCK\'\'jM\ä','Cap-vert'),
('9S\ÓZ7F½ºz-\ïV\ì','Chili'),
('\n\â \ğL¸‚\áø\Ú\õ†Ÿ','Chine'),
('ş\"\è;@YDGƒ« ?%\0\á','Chypre'),
('.cp\\ÁL­¦b6Ò‰_\ã9','Colombie'),
('…\ÆùjD~š\ÃDW„i(','Comores'),
('\Ï\\\âh\×\ÄE\ì†iu“c6†','Costa Rica'),
('p\Æ{C—Cn[“m`1\ï\Ã','CÃ´te d\'Ivoire'),
('\òt»ÁDI¤Yo\Éşl•','Croatie'),
('Vr|_ÿN´›5x\õkş','Cuba'),
('Ÿp=n¶\ÛAĞ”De\à\éÀ','Danemark'),
('\ôn¥…ÀCÍ«*µ(\ÎZ\\C','Djibouti'),
('\Z¡\Ğe\ÍM£—\Îjwš®.¢','Dominique'),
(')\Ì!\ß\ZBB{ ı­iºù®3','Ã‰gypte'),
('\è\"®•\ÂI. b+¡\ç\Ü','El Salvador'),
('N¶’À)H,­‰j\Ü\n\Í','Ã‰mirats Arabes Unis'),
('Q\ç/[1=E¸H\ZQµœ-','Ã‰quateur'),
('®aV[p‘J|\Ô\È\0Øµ;\Û','Ã‰rythrÃ©e'),
('6à¾¸\Ø\ÔLİ¿S;3Y\ßú\ñ','Espagne'),
('\ã,\ß6‘ÿFW¡\è‰5g¦‰','Estonie'),
('\r€®šKd¿®\ÆonK','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('\Ö¤rŸ\ËD%¤\Ş|QüË¯¶','Ã‰tats-Unis'),
('Á½\ò°8A›¨h\Ô_®Z','Ã‰thiopie'),
('\élq\Í>F\n”\Ê\Ø\åÚ“\Í','FÃ©dÃ©ration de Russie'),
('–ÿ{*Nn‡)~\Ò\êùø¼','Fidji'),
('7w—\ÖgTIŒ\ÄÅ“\ßi–^','Finlande'),
('\÷›Z\Å\ÈLºœ\îs\Êb¬r','France'),
('vº½D²¥\Ë2°\ñ\Æ','Gabon'),
('\Ë\äÿ\"\óA£m\ÛP\îd','Gambie'),
('q\Ù\ğ¯SKÉ€-%±†?+ş','GÃ©orgie'),
('lŸ³|¥³E~«À\Åe\ÛoE\Æ','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('\Î µ©ıN#Š»£]bz','Ghana'),
('l\Z9\ÚCNR¤™¬$!\\§©','Gibraltar'),
('ƒ(y‘[I\ğ°\Ã\æ{\"\çÔº','GrÃ¨ce'),
('~9R§	F\åİgü','Grenade'),
('P\ÂH­\Ã`DË²\â\ó\r†/','Groenland'),
('¢¯EtmE‚–\õ¹®','Guadeloupe'),
('µ7\÷¤+nMV\r\õ\Ürp7','Guam'),
('\ôr\Ó+Ix’\"P0','Guatemala'),
('`:lp@X™b\ëG>|ª','GuinÃ©e'),
('Û”>~¸\ãD‘»`NDD»','GuinÃ©e Ã‰quatoriale'),
('\æ=\Å{y\àJªo—\'','GuinÃ©e-Bissau'),
('ÿ\Ú\îUU\Æ@Ô­)¦…v™‡}','Guyana'),
('\å¦¾8LK‚º\×\\ŸaQ´','Guyane FranÃ§aise'),
('ºQ©\Ç\Ğ$Oß°\õ	s%®','HaÃ¯ti'),
('¡¦¼c\æJşªi\Öû˜u','Honduras'),
('\ï!\ê\İC\\O®f]lR£','Hong-Kong'),
('ttc•½NQ¾\î9nŒ\×\ì','Hongrie'),
('\ò\ëÿ\è¦A¿4~ü\ÎÊ‘‚','Ãle Bouvet'),
('jr=\'a\õK“±Œ\èx\0','Ãle Christmas'),
('³\Ó\ÅQwEª\Èa\Â\í\å\×','Ãle de Man'),
('ÿ›’6qúI±‚<V¬4\ZZ\Ø','Ãle Norfolk'),
('&†9–‹ O…=B#\ÉP\Ş','Ãles (malvinas) Falkland'),
('\Ò\Õ\Ñù\ÂID¢¢™,SŸl4','Ãles Ã…land'),
('Ò’¯\n\"*L’}`=\İUL','Ãles CaÃ¯manes'),
('ˆ©\êş§—H†´+JR\\\\\ê','Ãles Cocos (Keeling)'),
('z9øQ\"Bç¦“>{¶šø\É','Ãles Cook'),
('\ÆE\Åmš\ŞF#½ù\Ùq\ô\öF','Ãles FÃ©roÃ©'),
('\\‘¥¢\Ä.G:±€¼61\ÄÀ','Ãles Heard et Mcdonald'),
('\ğ\\\óK\ôAaƒeÛ†\nsI\Ï','Ãles Mariannes du Nord'),
('’/¿}\Ì\á@’•ÿ\ç‘\Â|9\ó','Ãles Marshall'),
('\\?\÷¶vGÊ‘\ñ\ÏtFm\Ğ','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('\ÓQU\àKÃƒ,\Ú5\êY\Ú','Ãles Salomon'),
('\ŞÿXmL<Ÿ\àOÛ†\õ·\É','Ãles Turks et CaÃ¯ques'),
('\ë\êO‹­H^œ‘q]0/d=','Ãles Vierges Britanniques'),
('\ãâ°¬O\õ¸\0jVÇ™¢d','Ãles Vierges des Ã‰tats-Unis'),
('š<N\İ\ö\İB\í´\nµ\ÖŞ¨7Á','Inde'),
('Áj¬™’E€½\á\Å\Új\Ş\Ş','IndonÃ©sie'),
('\ÖB˜NCI­W»(\Ö&B','Iraq'),
('xu\öm·_@\ó½iU\î2–\îo','Irlande'),
('\ñA6Y¥˜GŞ†&^Œ\Ø0>','Islande'),
('\÷½°8N‹ºÑªnE\Ë_*','IsraÃ«l'),
('!a£\öO\îMí†š\óta \æ\æ','Italie'),
('€ıZ\ÖL­¸`¢[l3k','Jamahiriya Arabe Libyenne'),
('Œ<K\Å{O6¡bF\é\Êl8','JamaÃ¯que'),
('ùG\Ê\×`9N)-\Øqs-3','Japon'),
('J+esšJ‰¬©d=’\Ü','Jordanie'),
('q¹\r\ÛAm W½1No‡','Kazakhstan'),
('$©\âKG„UÔš\à¤I*','Kenya'),
('\Çˆ\È_E@¢¯a ¯@\Ò\Û','Kirghizistan'),
('¼­ªL¨G=¤½W¦E§','Kiribati'),
('V¬¢\ë^Et€\ë´e¦\à','KoweÃ¯t'),
('8N†IJ–\å\æN€\n','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('W:3$\à•E)š[m­Œ\0V','Lesotho'),
(' ‰1>™N)˜ƒe\ØWu\ê+','Lettonie'),
('j.Ap\ìFF‚\Ø{A\ö!²','Liban'),
('\ÅÁ›}F.§RŠ©\ÄT\ö','LibÃ©ria'),
('5ú\ëxúDP‡J\òŸiª\î«','Liechtenstein'),
('mW6¨šyI&µÜ¿\à\ó,\é','Lituanie'),
('šT#ÁIfHt¹¬£%\í\å','Luxembourg'),
('œ\Ê8rE	FB…6?~“\òU','Macao'),
('§,I\õMÀ­\é\ñ\òJl','Madagascar'),
('0Õ¦\Ëj¼@£T«\0ÿa','Malaisie'),
('#Tş6Ÿ\ìL/ Mš\Ö}Ar\ê','Malawi'),
('\ìCÉšU\0\\‰\Î','Maldives'),
('Q•\ó:DZ©a„†o,','Mali'),
('„\ì$\Ü)Ft¿OµøpÎŠ','Malte'),
('3I;…š£H‡’\';D m¯','Maroc'),
('£Â§§K\ÍF€¼l½\Ş0','Martinique'),
('’£g’R@ªˆ\å.\Å\Ì‹!','Maurice'),
('¶Š…Ş¥\âE\\¬C\Ş\ØrFG','Mauritanie'),
('\ê$¸ü\ZA¡¦#^$\ÛE#\Ë','Mayotte'),
('ûŠ¡¸\ÊAË†j\ê/V>WT','Mexique'),
('”ÁÁI\èH©­LÂ˜R\'','Monaco'),
('Cm“~=—K¤…\õYÃÎ¦','Mongolie'),
('\Æ\ÄV\ì\É\æL¶\0y\î\Ì?T†','Montserrat'),
('–\Ù!\ÂúG\Ë&Qı—¤','Mozambique'),
('\Ï\ì]p3ıCHºø³-øİ”','Myanmar'),
('\É+<º\'\nO²¹\ïc¸\×)®F','Namibie'),
('\ôeÀÅ„Ik­\ë|\é$g\Ù','Nauru'),
('O¿I1\Â$D-Š\ÃEP„\É','NÃ©pal'),
(';¹ª@•(i/l~YA','Nicaragua'),
('¢\å½8\ÄyF4›¨¤\Z“l\ë','Niger'),
('î›•´{E­»\ê\í\ğ','NigÃ©ria'),
('m-‡\ä:Lºµi\Â_…`i4','NiuÃ©'),
('\ô2M*Jk›ci‘1b','NorvÃ¨ge'),
('µ\åpA†jNJ«Ÿ\ĞØœÑ—\ñ','Nouvelle-CalÃ©donie'),
('‹1n=\ë-N\Ö\ï2jQ\ğ','Nouvelle-ZÃ©lande'),
('\ï+Gû–$Eú¯†\ğ\Ş?²{','Oman'),
('™4\æ\"(\İG¤™\Ş[İ˜™c\Ó','Ouganda'),
('Qš5\õwIn„^Œ„ˆm','OuzbÃ©kistan'),
('\òbùÑ¸|D{½9»k}','Pakistan'),
('Z\Â\Ğqd\ÔA~’\ãf\òp)\Ğ','Palaos'),
('Y±^\Ç\ÙG}¨iiS\í|%','Panama'),
('†!’w\éœI¬º\÷w.tKH\Ç','Papouasie-Nouvelle-GuinÃ©e'),
('±ü\\EECVƒr@$+\'[','Paraguay'),
('\İN6[*G½¤øg\Ê\Ğ\ó^','Pays-Bas'),
('½l\Z\Ğ©BUµoA¼›ÕŒ','PÃ©rou'),
('p\Â¬\à<@´¦ş‚TY','Philippines'),
('a¿ƒ\á\ÄB°¨¹-\ã\ZqŒ','Pitcairn'),
('ƒ½‹;AÀ¶ u}®\í´','Pologne'),
('\ÈJ`±K^O3…7\á\ç†\Ä\n','PolynÃ©sie FranÃ§aise'),
('e…\Êgû!NX…\à…VN\ò','Porto Rico'),
('¬n¸qH¯L¥¦¶\ëG-«P³','Portugal'),
('J·3-£B¾©ª®Ic1	¡','Qatar'),
('\'M²\ãNt¸\Ğß‹sW\ğ\Ë','RÃ©publique Arabe Syrienne'),
('\Ó\ÒL\Ö\ï¬Jø´\çd`¯/r ','RÃ©publique Centrafricaine'),
('\ÊN\ô\ñ/\İ@Ö¤\"\Ï\ğ¤','RÃ©publique de CorÃ©e'),
('aR]“JAFb‰`Ş‹‘B\Æ','RÃ©publique de Moldova'),
('Ê‰ZuºK~˜\Õ\ó}—*','RÃ©publique DÃ©mocratique du Congo'),
('§7	\èK`¡«ƒb¼]\Ì','RÃ©publique DÃ©mocratique Populaire Lao'),
('u\ÓÜ¹\êEB«û²a·‰Q','RÃ©publique Dominicaine'),
('	E\áÁù,K\ó´P7V¢5¡¬','RÃ©publique du Congo'),
('LRbÖ°¢@ÿŒ°\0*‹]³g','RÃ©publique Islamique d\'Iran'),
('u33ü»8Kœ¯\í_•‡›~$','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('\éL\åg²Ms›¯}—‚W\Ôs','RÃ©publique TchÃ¨que'),
('\Éª\ÃG0€\r—±‘/›','RÃ©publique-Unie de Tanzanie'),
('S¦nü§C³»V1\Ï\ò','RÃ©union'),
('\ÚO½\ëAbE‰\ñÉ¨„\÷8','Roumanie'),
('\åÀı‡KDë²•¦QzL0\Ğ','Royaume-Uni'),
('a\ï\é¢\ÏD»­TŒ\ö3¶','Rwanda'),
('·ˆ n¼Oy•Š:…Cz','Sahara Occidental'),
('«å¤°£@W¢\ñ\Õva¢fÁ','Saint-Kitts-et-Nevis'),
('[	ƒÿ\ëO‹E[\ó™','Saint-Marin'),
('Á%ˆ\æ\"\÷Li¡KS\0¦a?J','Saint-Pierre-et-Miquelon'),
('\ğÿ5e†NÛ•Nùk¼nt°','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('^ ¹\æÿB/½<ªˆ‘','Saint-Vincent-et-les Grenadines'),
('7¾\öOLİ“j¸\ÔO»x','Sainte-HÃ©lÃ¨ne'),
('Z„\È~AÒ–§}L°\ñ\'a','Sainte-Lucie'),
('úßµ\èN0†NwRÿ6G«','Samoa'),
('¡…\Ñ\ï”G¯ƒ\é[yI\'B','Samoa AmÃ©ricaines'),
('Õ¡+‚G¬¶[\Ø9{¡\0I','Sao TomÃ©-et-Principe'),
('t\nV¬†F¤R\Ä,Á¯\î½','SÃ©nÃ©gal'),
('cº\É\â°M”¨]¦v\Ä\÷\r\\','Serbie-et-MontÃ©nÃ©gro'),
('3&Â•g‚O°¡d$=&%\Â','Seychelles'),
('¥‘8!MQ¬¼EkWM','Sierra Leone'),
('6øÊ¤5\'OZªmşpŸ,S&','Singapour'),
('\'ª\ÓRK°¬bPÖ–t]\n','Slovaquie'),
('\ñ\ß\ï–\ÇK\ñ‰Z\É\Ìú \É','SlovÃ©nie'),
('İ…ZEUFCø•bG³ˆ','Somalie'),
('v\Å6š|\ó@R˜\ò¶—A7HS','Soudan'),
('\0E«\â\Î~@Öˆ\r\÷„\Ü\ô.','Sri Lanka'),
('½¦\÷B±º\äg¸°\Z','SuÃ¨de'),
('×ª\Ì\İEr¿:G\Øfg\×Q','Suisse'),
('\'p7\ôC HÇ„\âş—‰','Suriname'),
(':{\ÌÚ€H ®\Z?Q½$\Ã','Svalbard etÃle Jan Mayen'),
('Z¹\r\êJ™¼o\\4¨ƒ ','Swaziland'),
('¾\Z]y£ŸOX¤ FË›J\Â','Tadjikistan'),
(')¢´}MJ¨ù\åÅ‰iT\Ä','TaÃ¯wan'),
('\Ä\ï]\Í5$O\ršµKB\ï','Tchad'),
('\àI„-\0OBšá«œ\'¾s','Terres Australes FranÃ§aises'),
('9²S\ë\İ=G†¨7§š‘sv‚','Territoire Britannique de l\'OcÃ©an Indien'),
('À5Ë¢\í\Ö@7¬\É\â\Zµ³b','Territoire Palestinien OccupÃ©'),
('\Ø)rj Mf› \à\çs|\è','ThaÃ¯lande'),
('f\İÓ²«@„8Pk‡¿\Z','Timor-Leste'),
('\è\Ş?³¯Kl—ŠYs\è\×y\Ú','Togo'),
('I5	A˜3%\å\åb,]','Tokelau'),
('1¢ş/¶\÷FU¢_„\0ş¨sl','Tonga'),
('\ğ…>5+O)»5\ì\Ü\ô\ä»','TrinitÃ©-et-Tobago'),
('2\ËiĞ«FN¨,GS\r\ôs','Tunisie'),
('¼4\Ö\ï\ôK“®´¢½t©\ñ','TurkmÃ©nistan'),
('L\Ù\Ë\èj\ìF€”¸d`&p±	','Turquie'),
('cN[×«Kv˜h\Èı\î<€','Tuvalu'),
('¬\ÌÚ•GIÁ\î\ŞÙ³OLt','Ukraine'),
('û£OšN/…‰\ë\İÉ·81','Uruguay'),
('\Çh°°\ÏJ¾&n{ ','Vanuatu'),
('ˆ+­Dµw—\'X¶P','Venezuela'),
('wøC.\"ÁGç¿³Tv\'qv','Viet Nam'),
('ÈŠ•H\èM°§¶7N(ªù\Ù','Wallis et Futuna'),
('-\Õfµ+¾@‡%!\ñ\é\ïù','YÃ©men'),
('+\â_\÷DB\ğ·n7´‡*ı','Zambie'),
('f¶J\Ùß„G²¤•»¸§','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-21 20:45:23',3),
('DoctrineMigrations\\Version20240201152951','2024-11-21 20:45:23',1),
('DoctrineMigrations\\Version20240202084749','2024-11-21 20:45:23',2),
('DoctrineMigrations\\Version20240202150901','2024-11-21 20:45:23',3),
('DoctrineMigrations\\Version20240207105701','2024-11-21 20:45:23',3),
('DoctrineMigrations\\Version20240319212437','2024-11-21 20:45:23',1),
('DoctrineMigrations\\Version20240614133504','2024-11-21 20:45:23',11),
('DoctrineMigrations\\Version20240617165906','2024-11-21 20:45:23',8),
('DoctrineMigrations\\Version20240708061729','2024-11-21 20:45:23',12),
('DoctrineMigrations\\Version20240801202153','2024-11-21 20:45:23',2),
('DoctrineMigrations\\Version20240815153823','2024-11-21 20:45:23',2),
('DoctrineMigrations\\Version20240916065051','2024-11-21 20:45:23',3),
('DoctrineMigrations\\Version20240929091802','2024-11-21 20:45:23',11),
('DoctrineMigrations\\Version20241002164506','2024-11-21 20:45:23',6),
('DoctrineMigrations\\Version20241119144432','2024-11-21 20:45:23',13);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-21 20:45:23','root@gmail.com');
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

-- Dump completed on 2024-11-21 20:45:25
