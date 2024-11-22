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
('¡¼bG‡\ö\ÌCˆ½(¯','Afghanistan'),
('\à’UªD\ÇIæšú‚½Š‰','Afrique du Sud'),
('Zy\Ö§F¤»h7R\Z~ ','Albanie'),
('\êĞ½*ÀFa¥\ñš\èÎ©»¨','AlgÃ©rie'),
('z\àı\\¢BŠ‹\n\Ş|ˆ','Allemagne'),
('6>ª\\\\&EÅ±oX]Œ\î…','Andorre'),
('\Ïa1LI‡\ì\ÍHşg','Angola'),
('`\Òj½lKù‡\÷{‰\\ \Ş','Anguilla'),
('U\ÊoCF@i¯D[Nû´\\','Antarctique'),
('\Å«\ë¯I†½`²\ç€ÿ\Ù','Antigua-et-Barbuda'),
('\ÕÁ\ïÆ·\êM…Yú.\Ù×“','Antilles NÃ©erlandaises'),
('\é5\ãsaªI(—*\ô%ª±\Ø','Arabie Saoudite'),
('\Í\n\Ğ\ï”J}‡iC\áú\'\à\Û','Argentine'),
('Aü»\\»¯F[€zI•\Ì9»','ArmÃ©nie'),
('º3NM\ÛC>‚z\ÊC\n¡™','Aruba'),
('Á–f}KÆ•§§\õüj','Australie'),
('’¹“z“O‘øRùªq7','Autriche'),
('LI‰€\ğ@Ê¥\Ãh\ÆĞ§','AzerbaÃ¯djan'),
('\ç\Ï$i‡F[ C{$V\í','Bahamas'),
('m\è\é\ëNß€C<ùK','BahreÃ¯n'),
('{ -[\ÛB\ä±\èd)s¤k','Bangladesh'),
('\ç\Ïşm.\ŞGcTA\äÿjœ','Barbade'),
('zˆş\íF4€K²@{\õŸ','BÃ©larus'),
('\"\ä\Ã*Y\ÎC,œ´\÷}\îr>','Belgique'),
('Rµ&t@j‘P\÷Iƒ½E','Belize'),
('¤\İ\ôJ\òEüµ\Ë\ŞM°\Ş\Ã','BÃ©nin'),
('Êª¹úC·Ea£’¼ÿ?','Bermudes'),
('s¶qEP@=¢	I\äu?','Bhoutan'),
('\ÖJ¥ıˆ\ğK°«\Ø\÷ÅŠ#','Bolivie'),
('p\óOr¯Fœ˜\ç“ @\ò#','Bosnie-HerzÃ©govine'),
('F\ÅÀ8°~M%ºIÀ\Ú\ó\ÊG','Botswana'),
('@^~	œ\nI<‚ƒ{ù¢\é','BrÃ©sil'),
('-:LO5]OG³\÷\îD\åü±\Ê','BrunÃ©i Darussalam'),
('\àD¼\ì8$G¬›v‹\Üp\èLº','Bulgarie'),
('<\Û\ó\ìEG ¢j Ğ£ ‘#','Burkina Faso'),
('/¥ŒQr)H\ï‹,fFw\ëq•','Burundi'),
('\ï9¹	QM²¿€g!YQ_','Cambodge'),
('ŸU\È\á”!FC6+ün.P˜','Cameroun'),
('_j\Ô/†½Dµû,_­\èQ','Canada'),
('1uU©\×?A<ŒUV¦<t\ö','Cap-vert'),
('\Z“ VC°`²û\ìB‚','Chili'),
('˜\Ş{±E\ÈC}ˆ\ñ¯}\ï#Ô','Chine'),
('­‘\no;–C\ğª`$tKJ\âZ','Chypre'),
('¤\âP?»qL\ğ¸\Ó\Ût	\n\Û','Colombie'),
('¦e;pBE‚Ì™TX\r','Comores'),
('!¼–DXª\öAº¹\İK','Costa Rica'),
('\æ\ç„\à5O\õƒœ±´‰\ä‚o','CÃ´te d\'Ivoire'),
('\çMD\0\òaNK\î\ÅC”r','Croatie'),
('º\çÎ²\áDŸ´j\ß+e\Ôd','Cuba'),
('XKøX.O\÷¶\ë\ÛúL\n\ô','Danemark'),
('¡½g\ædL@¨yv‡RŞœ','Djibouti'),
('Á©Œ#FO`¬€<\í×›ˆT','Dominique'),
('³..\æJH\÷†¨\ë\ï* \é','Ã‰gypte'),
('¢tq7QOE“®`=û\Ğ<','El Salvador'),
('§vi B0¢(\Ëhˆ‚','Ã‰mirats Arabes Unis'),
('.s7*T*CN­ï¸¿\÷\ëI\í','Ã‰quateur'),
('¯½T\ÍB—ŒøC;\â$~','Ã‰rythrÃ©e'),
('Œz‰M«\Ç\ñÂ–\Í5','Espagne'),
('M\ÅS¨\'B\ó™2}X-u\×','Estonie'),
('L“UĞ¹J­=\ÑT\ËÊ±','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('py\êœ\à~JŠ¼\Ævs?\ïŠ','Ã‰tats-Unis'),
('6oŠ2Cº§X›ƒ[\Ó\Ä0','Ã‰thiopie'),
('|¢Œh\\L²¹>C\ì²-™','FÃ©dÃ©ration de Russie'),
('@‹6\äµJK	†°\\\ÑZH–\ß','Fidji'),
('!,Â†$¦F$›\ÎSˆ:…','Finlande'),
('¬v\Û\ÄANGŸH\ö|x','France'),
('“\Ó[\Ô@K‰\'-°O\ÔM','Gabon'),
('À™ûfJ¾—\Ì\á¼\Ï+','Gambie'),
('”\ÙYL\ÖFH–‡ùP†/|','GÃ©orgie'),
('r½U\àÆªIØ©úI*•;\÷8','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('W\Û\öÊB5²VO\ô<£','Ghana'),
('H-HÁ\ÅJV™·\Î<>™R\Ë','Gibraltar'),
('[.E˜\ñ1I(¹¿\÷\â»\É','GrÃ¨ce'),
('½%5t—>GÓ¨1\Æ\Í=³ÿ\Ë','Grenade'),
('GUn\ÊPVFî˜«•Y]0E','Groenland'),
(';j…I)µ\"¶v\×i','Guadeloupe'),
('\ï]…$q©LH€¼Ò]og\ğ','Guam'),
('I©Î³\ÎMú.×Š9\Ã','Guatemala'),
('DŒ%%úMûŸ#\ĞkO\à','GuinÃ©e'),
('c\"û\ïªOYµ\Ùg¬$~','GuinÃ©e Ã‰quatoriale'),
('Åş¨™‚Iç®ŸşÊ¡b','GuinÃ©e-Bissau'),
('WW·MF4 \ñ°\Î!_','Guyana'),
('\ì<øBŒJiº²³\ñ†\ó\Ä','Guyane FranÃ§aise'),
('g\Z\ózBDı‘\Ã\È&s','HaÃ¯ti'),
('\ğH\ë\ñÄ†DC¨â·L*','Honduras'),
('\Ä$CÕ“\ÜOÄ¿F½mC²µ\à','Hong-Kong'),
('³;:\öÙ¹M¤»\Ñe\à\æf9','Hongrie'),
('ÁU@¤\ëJC<¯¨·\ãG','Ãle Bouvet'),
('{À\ÌnH!›^,#\Ä/\Ö','Ãle Christmas'),
('8\î”Nİ¯O—\"whÄ¤\ÏO','Ãle de Man'),
('h‰«Tƒ•D\n•\Øq_\ê\İø\r','Ãle Norfolk'),
('\é!©\Ğ‡EÒ…¡b«^\n\ò','Ãles (malvinas) Falkland'),
('k\0ú\ÅA¥Ó*ì†«\ë','Ãles Ã…land'),
('b¥%„\ì\áN:‰\ÉsXZHO','Ãles CaÃ¯manes'),
('(30\Ó\0RCL±…Z\ÕÑ‚eO','Ãles Cocos (Keeling)'),
('E\"2)ÁM†‘L\ÂÇ˜¢_','Ãles Cook'),
('¹‹F6¡a`xx\ñq','Ãles FÃ©roÃ©'),
('V\÷rn‰M¢°7b(Àz~','Ãles Heard et Mcdonald'),
('!›x\Ü}F70E‘\ÙFL','Ãles Mariannes du Nord'),
('O05D§J»\ëg\óı*P','Ãles Marshall'),
('gºg\ÚyK~”;\ãi\ÌÚ´–','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('\ã{\å¡\Í\İC\n…\å\ÜjJ','Ãles Salomon'),
('è¹™ o¼C%ƒWX$t\íq','Ãles Turks et CaÃ¯ques'),
('\ìú\êWk9Aœ»/•“;•]','Ãles Vierges Britanniques'),
('\ÓøFnZ¦@µH\ìn¾X{','Ãles Vierges des Ã‰tats-Unis'),
('\â˜\Û\ô\'\ßNÉ€øCG8¹Y','Inde'),
('\İü1\õEEÈuA<\öSl','IndonÃ©sie'),
('\ÆL\æÛ‚H>Ÿ®Y\rû','Iraq'),
('eH™YKL\ÈH\çOR˜','Irlande'),
('9(«B\ÔK	‹\ğRoºŸ\õ','Islande'),
('2ú¼EÀ\Òş´\Â!\ó\à','IsraÃ«l'),
('\ğ\ØIŸ@aŸ–\Å(_3†','Italie'),
('$­ÒµH]F#‚ ÿ$9}\÷€','Jamahiriya Arabe Libyenne'),
(' \îF”a”O¢#G\\n£Œ\Ú','JamaÃ¯que'),
('ü\Ó©•F@‡¤‘ş<ÿ','Japon'),
('/º¼#0A\ç˜¿Eÿ.6','Jordanie'),
('®$lP\"Gµ„>¿\ÊB¿M','Kazakhstan'),
('\É\ì\Ã1+O|§R¦ß¶»','Kenya'),
('Š\í‹’@Ø”Zq\\›H™\Ã','Kirghizistan'),
('“¯‡!$§E³•¶©<½ŸPú','Kiribati'),
('e\ì2\Õx3IÅ¬•¬Wá‚ ','KoweÃ¯t'),
('2¸xÅ ¢HÑ}c¸\÷¦','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('Â¯{§€EÌ\ò›c\n]‰','Lesotho'),
('\Êp\ÑEM¿EI¹°\ìWg=','Lettonie'),
('Z|d@N™\ôU·b\ÙÁ','Liban'),
('yL{[<D¸IX+¹h\0$','LibÃ©ria'),
('¯}\\ ÕK «E\Ç\ÄxS\÷','Liechtenstein'),
('tz¯ı\ïN€±u±£´¬–','Lituanie'),
('¯\éı;˜pO£ƒ\êP.\õˆ!','Luxembourg'),
('\Ó+*)\Ø~Do¥yi–´¾','Macao'),
('do8š\Ò\\GKŠÉ¶ş€B\ì\Õ','Madagascar'),
('\÷¡¶6H²›\òÍ«\Õi','Malaisie'),
('~\ñ|\âÀL$¦^Á\Ö\îüd','Malawi'),
('~C‘c\n&@\÷¹”ˆ´&]¤Z','Maldives'),
('8L\0«Lƒ¦,q¬ü”','Mali'),
('¤.}‘§L¹G‡Å²Yœ','Malte'),
('‹q\óv¨JÉ–ıÊ”v»','Maroc'),
('\Íz\Û\ï¶3HK¹<»\ÚI˜ ','Martinique'),
('Šçºª\ĞE²iN0\ËV#\Ã','Maurice'),
('\Z\öFoj²C¡”p@\İ\Õ$\ğ…','Mauritanie'),
('Õ£l¬~lAµšx»\ÑW’k','Mayotte'),
('irš`DC¬i¶´VSÕ£','Mexique'),
('k@\n\÷\ôA¤\Üw\È\ÅV”','Monaco'),
('\Ûr´ü˜\êGÇ¿xh*ÿË€','Mongolie'),
('F´`\àAş©xx\Âr\Ï??','Montserrat'),
('€»=±«I\ö·[G\ÂU›','Mozambique'),
('\0,+•ªN×»Œù\ğ\03Av','Myanmar'),
('«P¢¬wBÔ³r*§n“','Namibie'),
('ÿ_€\Ò9>AÃ²n\ÑkÀ¢\Z«','Nauru'),
('ÿúƒL…“\n :•j—','NÃ©pal'),
('ƒ\Ğ7¾\ÑB´º\ZBø\nAI','Nicaragua'),
('€7‚\ÔÚ‰AÈ¢|§|ºZ\ß','Niger'),
('X¸¸\ëjA\ê¯dc‰\ãŞ¥Œ','NigÃ©ria'),
('®\ÄzD!rF|¾Á\É;A†i','NiuÃ©'),
('\Çü°5\Ê@EÏ†\ï\Ş\Ã\ĞU\âI','NorvÃ¨ge'),
('\öFK¿›˜Jm£¹€×¥B\Ç','Nouvelle-CalÃ©donie'),
('/\é\ö\æ–\ÒF•¦? Sc\ès‚','Nouvelle-ZÃ©lande'),
('v*98G\ÂC\à¹J\Å\ÒPb\n\'','Oman'),
('µ\Å\Ğ\×:C»\Ô\ì\è\ã\Ø/','Ouganda'),
('·\å\Ø;w™D\ğ‘‡N\ÃS','OuzbÃ©kistan'),
('¦\äÙŸ\ÓD{¨<W1\ÂÕ±','Pakistan'),
('\Ä\Ş?Z@iƒ\\X\ér\Z7|','Palaos'),
('Ò¬³\r\ŞO\÷¯f·/‘ G[','Panama'),
('·8\Ú\ßmLÑ‰›‚0\Ó%)','Papouasie-Nouvelle-GuinÃ©e'),
(';K~\äOOU‰}fSFrˆ','Paraguay'),
('k_dtE£r?;£\î=ş','Pays-Bas'),
('\ÛwÔ\ÕKC†ÁM\İ\ñ.m','PÃ©rou'),
('\Èã´­¹™B^‘Z\ÃD«Õ ','Philippines'),
('4¯*MCØªt\ó±D*\î\n','Pitcairn'),
('¢²tŸ!C£¬–¼L¦A77','Pologne'),
('” \ä8²O4­@°?\éE\Ûı','PolynÃ©sie FranÃ§aise'),
('M\äÓU‚Mí„\æÆ2n2','Porto Rico'),
('A—I…D“:x\\j\à\Â','Portugal'),
('\î\ñ¥³\Æ)Jä·„ıhƒ	¢','Qatar'),
('›9K\ïD¡†\ÒL¤\î\Â\õ§','RÃ©publique Arabe Syrienne'),
('\öz_C.¯»\Üc\ğ†À','RÃ©publique Centrafricaine'),
('\É.\àDF¹q\ãYK{©S','RÃ©publique de CorÃ©e'),
('ZE¬ä–¦D9Šs-˜·Ÿd','RÃ©publique de Moldova'),
('\å\Í?É“C¯§ŠaÅ„o?\Â','RÃ©publique DÃ©mocratique du Congo'),
('-%ú°N€@m©T…+ q','RÃ©publique DÃ©mocratique Populaire Lao'),
('z\Øp-g¢N\æ°P\Í\Úa-U','RÃ©publique Dominicaine'),
('\n\ŞB\"5ÿBi±D\ÄK\Ï\Õù\ì','RÃ©publique du Congo'),
('»3ªJb@\í¾¬\Ä]\ğI','RÃ©publique Islamique d\'Iran'),
('—˜¿X«@KŸz\İæ°£])','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('T\äZ\êªL·µk”~\é\ÕA','RÃ©publique TchÃ¨que'),
('\ğLı,\ñC0’\Z\äi¼x','RÃ©publique-Unie de Tanzanie'),
('¸‡Ì›øO!¢b¢¥—½','RÃ©union'),
('”1\Ó\Æ\ò\çE´‚<\Âß„r\İV','Roumanie'),
('\à369˜\ÂBÉ˜ \Z\ó\ær','Royaume-Uni'),
('\â\å°L©œ•x]Ÿ','Rwanda'),
('ÿ•‚Ä¹C	¾Â³i5Üˆ%','Sahara Occidental'),
('6–Äl\ÖHC¶;\ê\rD¢ƒR','Saint-Kitts-et-Nevis'),
('Õ\×!<\Ğ@û•e\'\ñN\Ë\É','Saint-Marin'),
('untGAY­C‡x•®\Ü\Í','Saint-Pierre-et-Miquelon'),
(' \ãJt1\ãIL•á‚·PZ·•','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('½‘­#~FN‡4†…\ÚÂ‘4','Saint-Vincent-et-les Grenadines'),
('9l\ñ>üBN‚X¥¯\ZD\Å','Sainte-HÃ©lÃ¨ne'),
('¨\Âa¯­FLB¥®¨<X£','Sainte-Lucie'),
('™y\È\Úg2A(•¾Y¼·\È	','Samoa'),
('›\Øuw_MŠ”\é\â<hÌ','Samoa AmÃ©ricaines'),
('™7D·\İúJyƒ\Ñ\äT\Çı','Sao TomÃ©-et-Principe'),
('“f¾v;CA…²\ó\è˜\ã|5','SÃ©nÃ©gal'),
('c*4\é‘J°¦è¢ºL\ïS°','Serbie-et-MontÃ©nÃ©gro'),
('V\0D¥¸ALt†¡\Ì!ÿ\é0','Seychelles'),
('l•9[\ÊK7ˆADx¥','Sierra Leone'),
('…«o©\Í\öJ-\Ø%Ó—z','Singapour'),
('&,˜G\ò´F-½[\ä€¶š','Slovaquie'),
('GµtˆA¯À\ô•Ã»µ\n','SlovÃ©nie'),
('SAÇœ\ÖFëŠ¤\ìI¾x\ñ','Somalie'),
('‚\Ü-£IH¡A\ÎWš¾6¸','Soudan'),
('\öSŠ¯Li´¢:‰We','Sri Lanka'),
('(Â·ºEşLŠ¦ˆÒ¯(`\Êd','SuÃ¨de'),
('z\õ¬\ËKr—\Â)$&\Z\ã%','Suisse'),
('B=©\Èj;@›¶m½²\ó’(','Suriname'),
('†½\\r¦L6³-S€M™\î','Svalbard etÃle Jan Mayen'),
('\Ø~”\à\êFK=†\ëÿ\ë\'¦\Ã\ã','Swaziland'),
(' S§Fb^FÓµş\İ#','Tadjikistan'),
('\'\êDS\\\çO¯£o\Ø\İ#\Û\à\Ü','TaÃ¯wan'),
('¼zŠ~QGÛ›5ÕpH(','Tchad'),
('k¨s*\äeBG‘À\Z=º¤“\Ã','Terres Australes FranÃ§aises'),
('‘f“×¸O³-FyˆBM','Territoire Britannique de l\'OcÃ©an Indien'),
('\Ûû\Ì\åBE\æƒBˆ\öpt\n','Territoire Palestinien OccupÃ©'),
('h\ê}6H„º!\Â·Ñ³','ThaÃ¯lande'),
(';i0\Ò:A†¸\İ\ìœflJ','Timor-Leste'),
('\ôOiÀĞ JH›\nˆé®\Ö','Togo'),
('V\Ú;G\ö¼\ôªlİ¶•','Tokelau'),
('|w†ù%®L¤ˆ:r/3±','Tonga'),
('€)^;@²@\ë\Î&©\Í[!\ñ','TrinitÃ©-et-Tobago'),
('e•\ö€B±Ÿ×‡<”f§1','Tunisie'),
('e#\0\ÉLDª²«\Ğ\æú\ô\Ö9','TurkmÃ©nistan'),
('\Z\æ\Ù\è™@ª\Ú0)c\ÓEº','Turquie'),
('§\Ûí¡¥\ÊG?¥&\à&\àtl‘','Tuvalu'),
('‰\nXv\óC\ò¦Ë®¼†£¤\Å','Ukraine'),
('À@ygS\ÅD†¸Â¶û†¯u','Uruguay'),
('\ğ/\ã\à\òEºù~$>§•','Vanuatu'),
('Ê¼º€\ÃUL\ó©$¢y(‰! ','Venezuela'),
('‚]©\â¢@`¾&³¬}p','Viet Nam'),
('\ÙZ\Øû‚½Cj®\"+Wˆ\ö\Ò','Wallis et Futuna'),
('\ÔW7¨•şBCµ\õŒ5\n¼Ÿ','YÃ©men'),
('\ÆQV@#‰+‹\Òs\öC—','Zambie'),
('\é{Ë˜^G¡‰jÊ‹\ï\É‘','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-22 16:40:45',2),
('DoctrineMigrations\\Version20240201152951','2024-11-22 16:40:45',1),
('DoctrineMigrations\\Version20240202084749','2024-11-22 16:40:45',3),
('DoctrineMigrations\\Version20240202150901','2024-11-22 16:40:45',2),
('DoctrineMigrations\\Version20240207105701','2024-11-22 16:40:45',4),
('DoctrineMigrations\\Version20240319212437','2024-11-22 16:40:45',2),
('DoctrineMigrations\\Version20240614133504','2024-11-22 16:40:45',10),
('DoctrineMigrations\\Version20240617165906','2024-11-22 16:40:45',8),
('DoctrineMigrations\\Version20240708061729','2024-11-22 16:40:45',14),
('DoctrineMigrations\\Version20240801202153','2024-11-22 16:40:45',3),
('DoctrineMigrations\\Version20240815153823','2024-11-22 16:40:45',2),
('DoctrineMigrations\\Version20240916065051','2024-11-22 16:40:45',4),
('DoctrineMigrations\\Version20240929091802','2024-11-22 16:40:45',11),
('DoctrineMigrations\\Version20241002164506','2024-11-22 16:40:45',7),
('DoctrineMigrations\\Version20241119144432','2024-11-22 16:40:45',11);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-22 16:40:46','root@gmail.com');
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

-- Dump completed on 2024-11-22 16:40:47
