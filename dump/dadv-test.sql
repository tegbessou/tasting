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
('‰InPHÈŸf!¯\÷)C‡','Afghanistan'),
('À9±T\ÄuM\Z—X\óÌ¨ø1','Afrique du Sud'),
('é€® E-¿¡²Pi\İ','Albanie'),
('\ÚfQ {\ÜOÁ€|YX¼\î­','AlgÃ©rie'),
('©\î(:Œ\nM¸F\çÿÈ±û\ì','Allemagne'),
('\Ùm\ÓÉ0N\êŒV@£•t','Andorre'),
('¢Yqk|\ËA£ª4ÿP%-\Ğı','Angola'),
('Ø¢\ç¼Oš„=9S‡ ’…','Anguilla'),
('°<\çı\ØN\ï\r®J…~a¥','Antarctique'),
('ü$ø—;\×F“¾B·wü˜R','Antigua-et-Barbuda'),
('ÀggS\Å\ÓEN‡\Ğ~k\é\Ús','Antilles NÃ©erlandaises'),
('\Ã\Ì;œ\íúHb•r2ry›\ç','Arabie Saoudite'),
('g2\Ø2O8¸\Æ|‘¡…Û','Argentine'),
('³^ş\Ê\ìO˜²6+_RVI','ArmÃ©nie'),
('’Õ‚O¶¿B—ü™\ê.¢‡','Aruba'),
('k\×M}•EMŒ\"EU­\Ø','Australie'),
('‡U¬«­aIÇ¬JY:©Ó¦ƒ','Autriche'),
('ŒS\Äj´úJS›‡–£…5Ú«','AzerbaÃ¯djan'),
('İ¨\öH\É\ÌKA‚Ê›\ãu¥³','Bahamas'),
(';FXWAHT’¾›Nqş','BahreÃ¯n'),
('\'4…|I+©€t\ÔR•û','Bangladesh'),
('\êQ:\ÉAnh\İû\Èb','Barbade'),
('\å\ë\Çe\ñO-»\n\æOV\Ù\r','BÃ©larus'),
('±\Ã9\Ë\rNP§\ÄÑ¢ø+œ–','Belgique'),
('?FÿU\äC\îŸ\öBÓŒc`','Belize'),
('k\õšSH\ë½Å¬~V:\î^','BÃ©nin'),
('\ÌÙ\0JW¨ ĞƒHK¥{','Bermudes'),
('\ØÀ?\è\õEš™\Ò5‚\ÓO7;','Bhoutan'),
('•_D\ÑIı€nl\ÑFş\ì','Bolivie'),
('`ºÕ¦\0³B ŠFd‹b_‰','Bosnie-HerzÃ©govine'),
('\íB\æ g\\Ds¥Áù˜†w@','Botswana'),
('¦}´\åaDü¡*”Õ¿\Ö\ğ','BrÃ©sil'),
('û\Ã,½?C¾…\ëa˜ß\á','BrunÃ©i Darussalam'),
('§QÆŒ¿L¬K\åM\Õ	¶','Bulgarie'),
('›»®Ó†C•‚\î¥yo¨)','Burkina Faso'),
('/<E{I/¹¡\ÕZ™™~','Burundi'),
('­]<\ê\'Nµ\÷qœ[6','Cambodge'),
('¦/}üAø\Óø•87J','Cameroun'),
('oN\å\éx—K½úVi®\ñ','Canada'),
('2Šf<X¨HùE\ò\á:\Æ;1','Cap-vert'),
('®,.°g¡N=¿b\Ú\â +','Chili'),
('o.|\ó?şG¿€\Ù\"zW\ßş','Chine'),
('–Ó˜ˆ\n@`¬\é#Q\é\á','Chypre'),
('¥\÷Ê§OMß’V#(¢»z','Colombie'),
('°\ã€_GHÃKE\rä±ª','Comores'),
('I˜w¨u\ÖEÍšX\ÇXr\õ»','Costa Rica'),
('”¯ü\0\ÉNN¶\î<@`+WX','CÃ´te d\'Ivoire'),
('ı%7Œ9NÂš\rM¤j-¯U','Croatie'),
('‡q‘\â8zIí†¾*N\Û\Öc\è','Cuba'),
('ye»\î\ôLpƒ\Ñ\ğù\İüLI','Danemark'),
('B&8Z7K+’~\ëº$ÁÑ¼','Djibouti'),
('\\|‰kÀmBd˜›²bø\Z\Ş.','Dominique'),
('d¦Ş›&\ÖO§¾\Znù\Ì8…=','Ã‰gypte'),
('AfµüøN“¢y\'ıD‚\ì®','El Salvador'),
('Š¾\"\îV}Kı„\ÏA,‰ı?','Ã‰mirats Arabes Unis'),
(' \ğYZúOÙ¼u?À‡h¼','Ã‰quateur'),
('Gf\ÌJXC\Z°\ÕY_\àw¸Š','Ã‰rythrÃ©e'),
('š\ŞU•Fı•¾ŒxÚ±\'ş','Espagne'),
('\ä#`\Ò;GÔ¬’\öCvR\ë§','Estonie'),
('¼Ù¯§¿_I¶\r\Zc\'\õE	','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('Da\õŠ¢MB~WÁ”\É\ñ','Ã‰tats-Unis'),
('/«\ÕL\Î+MÏ¾¥;¨OD/','Ã‰thiopie'),
('\ì^N\ÎV\ÅM£¨\à*,°TO~','FÃ©dÃ©ration de Russie'),
('\éVkU¦KÑ½\é˜[\ÑüF','Fidji'),
('\ö\ÂD]¶Gt€„\0¤5‡','Finlande'),
('\ê^‘:…\ëO\ïšj\×Q„\ğ‘','France'),
('É›]±š\ëLX‘H3ú\éX\0','Gabon'),
('/®\ñW)G#¨\ï\àj\Ü\Ğ','Gambie'),
('\çi‚\àƒDÕšfS›7¡','GÃ©orgie'),
('\Ó\ç\Í KÕ€E\Ó0\Õ03\ä','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('\êXû_&@ú‹˜UX\ö','Ghana'),
('™\ËH§¥‰M«‡\ò5½o\é»','Gibraltar'),
('D¾¢Ó•Iª³W\'¤±I','GrÃ¨ce'),
('h\à\Ñ\×+\İGAºø\Æ[\"','Grenade'),
('S$YM\ôL²†sEiŠ\ä','Groenland'),
('ˆ1\í]P/A›¥\Ş\Â\nfX','Guadeloupe'),
('md,t°\ÖD™»4®\×\ôšp','Guam'),
('˜ˆh\Ğ~K\ï‹rvš\Ü_¥','Guatemala'),
('ş\ZA\Å{HœŞƒ\à\n(\È','GuinÃ©e'),
('\'\ã¶ÂE{»T\\\İZ®‘l','GuinÃ©e Ã‰quatoriale'),
('ˆ\ì“1\ó‚JK…Œ•½:–','GuinÃ©e-Bissau'),
('•³	CG¬ ”¤y\ÒS','Guyana'),
('\ô9—nİ—O\ë¶\"\É\rn}Ä¬','Guyane FranÃ§aise'),
('³\Ü®_L6«\Ép¥\íH\'','HaÃ¯ti'),
('\ß`„°1Gšƒ¯|ONXK\Ö','Honduras'),
('ù?¬J•\÷MQ„E «™','Hong-Kong'),
('¤T\ğAz¬ş6v\õ;\Î','Hongrie'),
('C’ijÕ»@’¶Şµß ‰LQ','Ãle Bouvet'),
('‘\ÃG»—NÁ­‹¤J1¹—','Ãle Christmas'),
('ø‰ªupM\r®R\æİ»z„\ï','Ãle de Man'),
('±;¯~¤-@˜“\Û>Ê”l','Ãle Norfolk'),
('²ÀÂ™OS·Å‚µ´š\Ò\Ñ','Ãles (malvinas) Falkland'),
('¹0“\rIHK~­«€‘-‚¢','Ãles Ã…land'),
('“rmH5F! :j¥;\"ıa','Ãles CaÃ¯manes'),
('½UR\Ç@ŠA]º²\ZA†\ÂÀ¦','Ãles Cocos (Keeling)'),
('?#Eƒi0N±’\Çb‘®','Ãles Cook'),
('r’yuE½œŒ8\áBƒ\"','Ãles FÃ©roÃ©'),
('1ÿ©•GNÎ¤\È$5Ò¤¬\î','Ãles Heard et Mcdonald'),
('\õU/\ğµş@\"†%\åÜˆ','Ãles Mariannes du Nord'),
('‹¬ù\Ó5E‹”1û@À¸k','Ãles Marshall'),
('Àe\÷«\ÔCF£\Ù\÷\õtw«Á','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('¹\ö\â\Ş!F‚\ß.	¡’','Ãles Salomon'),
('š­v#dM@ƒ¾\Z3\r\Ê\å[','Ãles Turks et CaÃ¯ques'),
('\È\ïG¸À¸I3“\ßS»\Ü)\"®','Ãles Vierges Britanniques'),
('_¼Ì¥\ÊE\îƒ‡OV\ß-ş','Ãles Vierges des Ã‰tats-Unis'),
('\×Bm*\Ù^GƒŒlœ\Å\"H\Ç','Inde'),
('ŒE\Å\Ø\õO6Œ\Ä\Èw¸ÿM','IndonÃ©sie'),
('¯=q\0K’\0I¸\åQz','Iraq'),
('#—ªKJÆ¦4 \ìQ\É\Ì','Irlande'),
('X\ÄX—9\õGÓ´j\Ü\à¢u\nT','Islande'),
('Òˆı=V®L\â€\ãŸ=Y¾','IsraÃ«l'),
('1khD}¯_\"y\'5J?','Italie'),
('df&Ü•7I¸¦9ÀkI{','Jamahiriya Arabe Libyenne'),
('n:üºúK’6fA³C\Ê','JamaÃ¯que'),
('”±$šœ@}™§Ğü\òŒC','Japon'),
('¹m\áÍœ¥GÁ\'ÿßƒL\Ô','Jordanie'),
('\0ˆ²a¦şC/©tıQ¤¬~','Kazakhstan'),
('(¥3[\ŞzG\î°qQ§hˆ \ñ','Kenya'),
(' ‡şLaB§À\è“µ\Ä\r','Kirghizistan'),
('“¢”^XN¨Ÿ­lE¯\Æ','Kiribati'),
('\ØtŒ\íÁL‚R\0şhœù','KoweÃ¯t'),
('#¶\Ê~»L®ˆ\ç„14›”','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('¦8 7zLª„\'%\ÑŠPs','Lesotho'),
('¼\'ß‘†\ÄK?¦\Ùù\"Æ§\É','Lettonie'),
('/ sDŞ”1\æ§Y»›]','Liban'),
('{<o\ÄûD0º\óÀ«|©f','LibÃ©ria'),
('\àP®+)<@5½‡\écÄ¡','Liechtenstein'),
('‚tm²\ØzC\ò¸Á-O\ó\É\õ','Lituanie'),
('§L{MN‚–:\Şu\ØP','Luxembourg'),
('vı–ı7­LÆŠ\rxm\0LJZ','Macao'),
('`\İ\Ğ\ãU\ÚF¥\Ò\Ú\Ü(ÿg','Madagascar'),
('\Õ\'’@ ¢NP´\Í.\Ø\ò\Ã_W','Malaisie'),
('\ß\æ®=_A ¸Ø ¯ hşR','Malawi'),
('S–ß™0vBQ¦HZ\í•t','Maldives'),
('	‚¢­\éHGŸ´\ôu¸—Í»','Mali'),
('±É”5C\êšşºK/KL','Malte'),
('zZ¦\ZÁG®‡5i7£6','Maroc'),
('\îÊ£¸‡­C/’“O\Åh','Martinique'),
('\Õ] \ïûaF\nŠ“\ò.±;;X','Maurice'),
('\ÙJY5N±›jCFU†U\í','Mauritanie'),
('&6{±_BÆ´$ø\ğ@Áy','Mayotte'),
('>·½\çH£N\î$¿\ÆÁC','Mexique'),
('Æ¼\Â;\"cO\ò ˆ\ô5¶4\í\ò','Monaco'),
('2\Ñ1%\Ü\æGÛ‡x\İq‡\ì','Mongolie'),
('hSe›\ËMtˆv\ÄÁ\á|i,','Montserrat'),
('\Ö\ä\İa\òpL;¯–\É\ØıÀ','Mozambique'),
('JYpVH>‚úş¤\Ü\Ü\Ä','Myanmar'),
('ppH‹¹\ïLK\ÑO“§\ò','Namibie'),
('y»–-\nBh¿³5.|²‡\ì','Nauru'),
('3’\åO\ôEA²¸\ã\õ¥½)™','NÃ©pal'),
('·kg\ŞÀNM1¢\êŠ\éş\âR','Nicaragua'),
('M€¥\ÈI—eœ`\æ\î','Niger'),
('¨toz|\ÚN\æ·UÿeR\n','NigÃ©ria'),
('&IÁ‰A‚³\ÏU\ó»E','NiuÃ©'),
('Nº\ï=\çG9°\Å\r@','NorvÃ¨ge'),
('E\Ü[N\ÌL\âºH\Òqš§\ñ','Nouvelle-CalÃ©donie'),
('Z\Æi\íYA³¯t?\äLKŸ','Nouvelle-ZÃ©lande'),
('\ÄTI€ºQB\é­|Ë¬n\Ü\\\ì','Oman'),
('€\÷	@¯“ŠÔ£\óp§','Ouganda'),
('2Š\óü\'J¬ÁI™\Î','OuzbÃ©kistan'),
('\ò\Ë8ı\'C©·\Èr€‡¹c\á','Pakistan'),
('C\É\Ö\Ù\ãE“µ²|~M\Æ\×','Palaos'),
('p”\Ä\éqI&ˆz7R	\'\Ş','Panama'),
('\÷2¦(ıAD‡·M`v=¯','Papouasie-Nouvelle-GuinÃ©e'),
(',£{yI0F\à§\ì\ÏtM»¿','Paraguay'),
('ÿ=¬\â¬BKù‘1ª\óıš?','Pays-Bas'),
('\ë\÷³\Ñ/\ÊB™­ŒBbœ´','PÃ©rou'),
('w«=\áW/G³›¡\ò¬Ò»\Ã','Philippines'),
('\\}pk?\ïNl¬°ş>\õC','Pitcairn'),
('½/Ôœ*?F›ƒ\Å1ük_Í¤','Pologne'),
('¡\"²\õV\0Bª¨»\å>\Î4\Ï\İ','PolynÃ©sie FranÃ§aise'),
('`n:ƒ\ìAf˜§Z‡nHº','Porto Rico'),
('\Ò\à3=dE¬”C£Ê‘\'Ë¯','Portugal'),
('\ä\ãÉ¤.CW©Sp4}M','Qatar'),
('\Û]r\îß¾NB¨[^0B2\ä·','RÃ©publique Arabe Syrienne'),
('d{\ĞUıDB‚†s,K\í\Ñ(','RÃ©publique Centrafricaine'),
('Ô¯vElE=©\0cœ£M','RÃ©publique de CorÃ©e'),
('\Ù\n/WNú°–¿ˆ‰kP','RÃ©publique de Moldova'),
('\îŞ¨m5N¼i{NE\Ğ#a','RÃ©publique DÃ©mocratique du Congo'),
('œ–)¢OMU„\ÇSŸx=\÷\õ','RÃ©publique DÃ©mocratique Populaire Lao'),
('76‡­AtŒ¬²\'\Ù\É3','RÃ©publique Dominicaine'),
('°}€£LË‚\É)€H%&¸','RÃ©publique du Congo'),
('l}[bMË§·¹W\éÂ…\Ğ','RÃ©publique Islamique d\'Iran'),
('\à\İTZVKS’»ş!&¥\ë','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('\ÜÊŠ3\Ó\'H3¶|\Ô\ñ=\ñ\Ó\Ü','RÃ©publique TchÃ¨que'),
('«Gpn\ÎJP¿°n\ñ\Ë=v`','RÃ©publique-Unie de Tanzanie'),
('¬…‘w @!£*ybb%cu','RÃ©union'),
('_ùZ—Nh•>’Oê•«œ','Roumanie'),
('\ĞeD\rg˜G*±@ü+Í¤Ì','Royaume-Uni'),
('u\ÄwRSL¸©\ö\ôGı\ê]\è','Rwanda'),
('¬‘‹x	D«\n\Ñ\òı','Sahara Occidental'),
('ûiu”˜BQ±\Ï+\òG’û','Saint-Kitts-et-Nevis'),
('V;«\óL•£m\r½S	','Saint-Marin'),
('£\ñšuB‘©(u\ê\ìE‡','Saint-Pierre-et-Miquelon'),
('w\Ù\Í(`EW·‡Œ\óúÁ\÷','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('tû\Ø]zIª¸;£·!|£W','Saint-Vincent-et-les Grenadines'),
('”!³A=¥B?•«©ä˜Š¿·','Sainte-HÃ©lÃ¨ne'),
('ü}Y²\ÑIœ½kfJ','Sainte-Lucie'),
('Š/¯\æJ\à¿PÿŠú\ï\ÜQ','Samoa'),
('€\Òm\è¥\àB‰¼\ÄÙ•?ª\ò','Samoa AmÃ©ricaines'),
('i\ò3\'\å\×@Ûˆ\ğ\å©\É+¸','Sao TomÃ©-et-Principe'),
('(_ •½RB†\ò\n%\rÁXH','SÃ©nÃ©gal'),
('\Z\àœ5°¥C}±Ò«Ñ‡B\Ì','Serbie-et-MontÃ©nÃ©gro'),
('·¼YN¤T\ä,…¬ (','Seychelles'),
('ŒV[\ŞN×¤dHuµ\Ğ','Sierra Leone'),
('šal\ôO»œÉ¦\è-\ö','Singapour'),
('U\âv\Ï3/I²§Š³;(*‘','Slovaquie'),
('D\ìmmL\íƒ\ÏVX8½e ','SlovÃ©nie'),
('×º¯‚[¸E„’Yf\Å%6I','Somalie'),
('†D`*4ıD´8»2\ìù]~','Soudan'),
('ƒ\×\ÄM\Z»1©\nY\ä€f','Sri Lanka'),
('¡½\"’\àJÂ®N9\ÖŞ¨4','SuÃ¨de'),
('\\z`²\ÙüO[©­JD\òM\áq','Suisse'),
('\àYp…»sJ’©ZP…\ôµ¼[','Suriname'),
('q\âÒMù‹ƒ?•%0\í','Svalbard etÃle Jan Mayen'),
('\ZUª3\åLªı4\Ítu','Swaziland'),
('¤‚\"40F„°¬¢\'Er8','Tadjikistan'),
('+”¹\Z\ërL½|_N\ÉQù','TaÃ¯wan'),
('\ï\Út¶JGø‘½a!³´À','Tchad'),
('\áHr\Ú\Ğ@-—\Úg\rŸühU','Terres Australes FranÃ§aises'),
('jŸ‡\È\î\ÖGø¸2qqBŸf','Territoire Britannique de l\'OcÃ©an Indien'),
('\à\Ãe¯pA…–@N\áß‚3','Territoire Palestinien OccupÃ©'),
('ûjBl8Kd§|¸§c«','ThaÃ¯lande'),
('¡½ü\ó\ÖüH\í—Ó«\ÉmLx','Timor-Leste'),
('©Ê©\Z¡\ìOj—ÇŒ¼·³™','Togo'),
('°9\Õ+l\àD¾‚œÔ„’R','Tokelau'),
('oS«¼[C±€\ß|4²@Ÿ','Tonga'),
('!\ÌNRuDJ.”~\ËV\ò\Ä','TrinitÃ©-et-Tobago'),
('¼J[\ô\äfB7…i”¬E‚¡\Ñ','Tunisie'),
('	N\Ê\ìyÁL3ƒ™{¼*\ä¾o','TurkmÃ©nistan'),
('½´­…ªA\ï’û~vTL	¶','Turquie'),
('.˜z\ÒDb_\nŠ©½','Tuvalu'),
('CÖ³:\ÓFØ¿.\óUŠ ','Ukraine'),
('˜8³5ÁúF¿¬¦88y\ë','Uruguay'),
('\ÔD\í\nøMÒˆuKV^‘˜','Vanuatu'),
('Hk´#¦_FÕ©\÷q Tø#','Venezuela'),
('®£`\÷[KU¢>}Pœ-6\Ú','Viet Nam'),
('P±‡+k\ÉC]ƒ¨l\n¶>W','Wallis et Futuna'),
('Œ4\×rh«EK“€Sb¡','YÃ©men'),
('¸\ÙSÙ«§K,›Á°¸dQ½','Zambie'),
('&û\õ‰Hƒ\ÏB\\³Nû','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-12-14 20:08:44',3),
('DoctrineMigrations\\Version20240201152951','2024-12-14 20:08:44',1),
('DoctrineMigrations\\Version20240202084749','2024-12-14 20:08:44',2),
('DoctrineMigrations\\Version20240202150901','2024-12-14 20:08:44',2),
('DoctrineMigrations\\Version20240207105701','2024-12-14 20:08:44',3),
('DoctrineMigrations\\Version20240319212437','2024-12-14 20:08:45',2),
('DoctrineMigrations\\Version20240614133504','2024-12-14 20:08:45',12),
('DoctrineMigrations\\Version20240617165906','2024-12-14 20:08:45',10),
('DoctrineMigrations\\Version20240708061729','2024-12-14 20:08:45',15),
('DoctrineMigrations\\Version20240801202153','2024-12-14 20:08:45',2),
('DoctrineMigrations\\Version20240815153823','2024-12-14 20:08:45',3),
('DoctrineMigrations\\Version20240916065051','2024-12-14 20:08:45',4),
('DoctrineMigrations\\Version20240929091802','2024-12-14 20:08:45',12),
('DoctrineMigrations\\Version20241002164506','2024-12-14 20:08:45',7),
('DoctrineMigrations\\Version20241119144432','2024-12-14 20:08:45',14);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-12-14 20:08:45','root@gmail.com');
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

-- Dump completed on 2024-12-14 20:08:46
