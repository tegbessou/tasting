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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',259.99,'2024-10-21',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-10-21',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-10-21',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-10-21',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-10-21',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-10-21',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-10-21',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-10-21',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-10-21',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-10-21',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-10-21',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-10-21',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',1299.99,'2024-10-21',NULL);
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
('\å{¿f\ğO\ë”ùf ‡q¬\Æ','Afghanistan'),
('\0y\ÔÆ¸MLN¨&cB8Z\Z\è','Afrique du Sud'),
('0\İTDj°\Ò\Ë‡i\ö','Albanie'),
('8w\Ï2GTF¾—D\ßIyHŒ#','AlgÃ©rie'),
('€ü\â9Y©C²‹Fyµ£\ï=)','Allemagne'),
('\ã1\ÎI\òOk¿\Ã\Ç\ÇJ=ƒ','Andorre'),
('$nK)WBH¤\Ìe\ïHM','Angola'),
('¦;\ì H¯’8µ\Ú&YY\Z','Anguilla'),
('aG \ìFÏªq|›l','Antarctique'),
('\"j_<M“JØ¯b¯§69\È','Antigua-et-Barbuda'),
('¦Š°\Ê/MÊr\ËRÿ\÷,t','Antilles NÃ©erlandaises'),
('\İ:k³#MsŒu0\"\ï+M','Arabie Saoudite'),
('\ğ\ğ˜\Â_N%¶!8‡|\ÍMV','Argentine'),
('Ù\ÄezJ\ğ‡K]x†}P','ArmÃ©nie'),
('bOC{OEºƒ0{\ö\\Q','Aruba'),
('±„\ç\0ZJIÂ£`˜KJ .\ò','Australie'),
('’\Õ9gK@I—R\õEbÛ”','Autriche'),
('?3$jdüOG‰\î¢{','AzerbaÃ¯djan'),
('X\Í\õ‚l@\'Ã¨Ñ·\Ğ\ñŒ','Bahamas'),
('H¢û\Õ\ÓKª‹\ï\Ô	‚]','BahreÃ¯n'),
('ú=š£jsG\0‹†Š8*.','Bangladesh'),
('¯¬\ÒU4^M\æ½\Ğ\ÔI7','Barbade'),
('©¸Ç‰\ÄA5¨«\áU>’\Ï)','BÃ©larus'),
('h{Œ	\ëƒJü˜cE–Gy~\â','Belgique'),
('\Ò.²W,—A0³m\òy\ÌW%r','Belize'),
('¿\Õ\Éùl5O· (ŠN¼û','BÃ©nin'),
('»Ü©:\Ë\ÂNG†t\Ñ\æGY\Æ','Bermudes'),
('-	hœ–¦Jq™N¤&%\n‘','Bhoutan'),
('Uˆ#\r\ÙC-€\ÎVn±\0_Q','Bolivie'),
('Gj\âGüšH9«½+c\ß1‰','Bosnie-HerzÃ©govine'),
('\ä\È}ùJS³º†\èÿ‡ƒ','Botswana'),
('\ö¤¸²y•G2˜Rd€z6û','BrÃ©sil'),
('\áfÁIo¡Àr£\ÛCI','BrunÃ©i Darussalam'),
('g1*\õlOJ(˜’%š\0=','Bulgarie'),
('\äù=¡·hNl‚·\åA\ë\ÂTk','Burkina Faso'),
('Ô—VMd@\ô‹²UC\Æ\ñ\É','Burundi'),
('—o‚[rA½:6¾°}¯','Cambodge'),
('U\ì¥FÓˆz®\Ä\ÙL1','Cameroun'),
('\æ\ñµŞ…@|‹qÀ\äe.«i','Canada'),
('\î„¯wK™\Ø\ê:\Zı6Z','Cap-vert'),
('n\è\"TGZ¨ƒ«Oø\È','Chili'),
('8K¦t¾}B\â©12€¡\nt:','Chine'),
('=\íùıseIY‹\ïb\Ñ@','Chypre'),
('pE¾d«G¡‡—~,\ï:¬u','Colombie'),
('ÿ:®0\Û\ÏBĞ¦k\r¸¬¡\Í','Comores'),
('Ì¯\Æú½@Mb2»\Ç\æJ\Î@','Costa Rica'),
('\Üÿ¹w;I¡´k£²øf*@','CÃ´te d\'Ivoire'),
('YEù\Ô<Ig»\ÂV\õ*	','Croatie'),
('\Æ&iúAú»\r](˜\İV','Cuba'),
('\r@›ºT\ëBQ«‰ı†\ëO	','Danemark'),
('P„Ù¤D,¹izA’Ÿ·','Djibouti'),
('«EqE#\õNîˆ‚)Ÿ9?K','Dominique'),
('“&5–Ô¨E²«&‚U\÷{l','Ã‰gypte'),
('µS7kA$…r˜I›\Ô','El Salvador'),
('\Û\íš\ïJGâ„œ\Şú‹\å(','Ã‰mirats Arabes Unis'),
('s”W\ÕCX¿hH<\ÃÁo\È','Ã‰quateur'),
('³\\ûŸI£œqĞC\à','Ã‰rythrÃ©e'),
('š¦I8\ÜE\Z†¤:','Espagne'),
('²k~‡½Er¯\âF\Âú\ïq\ï','Estonie'),
('`\áq\î6ŸNZ·fŸ§U”¬–','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('\Ík@/\ÑB¶ˆ¼¾\î\0º ','Ã‰tats-Unis'),
('A†VK›E¤™\ë¿\æÊ\ò','Ã‰thiopie'),
('ı„5_LªŸ¶\ÄtÒ±v¼','FÃ©dÃ©ration de Russie'),
('½S\ÃxM#†‡§m\Ê\å\÷}','Fidji'),
('%	\Ô*\ĞH”\ÖA¯Ô=','Finlande'),
('¶@™\Ï\î/I>”LH\"‹6\í','France'),
('R\0Äœİ“L¼ {I\ì)\Şk','Gabon'),
('©r\ÆB\î³\÷›‡‚\õh','Gambie'),
('EŸ‹\÷iN—¥\Ğa\õQW','GÃ©orgie'),
('?\ç¾n¦NI\÷|\Õ\é¿v','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('\ÈNR²Fp´Ÿ\\\\\Õn','Ghana'),
('5¸‘4m9Jqº-H\Æ\Ú\ÛY','Gibraltar'),
('ùÑ¢G\òCEù˜sÆ«z','GrÃ¨ce'),
('ˆ>\ìD¨¼G^ˆ\0E ˆw+','Grenade'),
('bc›¯–LÈ’\ö®A0¬¿\n','Groenland'),
('\×\ò\n0·-E¬®dO\õkij','Guadeloupe'),
('³¥4\ãw&NTša\î@\ì\ä\ö','Guam'),
('·\\\Ï4aM¬ro\"À¨¦e','Guatemala'),
('Uı\Z@¯M–°U»Ø“Mf','GuinÃ©e'),
('C¼¯OÎµˆv”‚¸h','GuinÃ©e Ã‰quatoriale'),
('û\á›˜\ÔK9¯)ˆÆ¦\\\÷}','GuinÃ©e-Bissau'),
('!\ÕV2\ë@md.\È[ˆx','Guyana'),
('œ`¸5EÙŒ^f0c¿‹\È','Guyane FranÃ§aise'),
('Ú˜É›®nL“‰°\ês\æÔ»¤','HaÃ¯ti'),
('>”\ö7,Fbº\Ñ4€°ü','Honduras'),
('\äv­¸h§MÏ›\öúJ™\äJ','Hong-Kong'),
('F¯Û¯\êmD\ï\ÃCX#$¦{','Hongrie'),
('„\Ó\ï¹\ÆOt¶¸&K±\ó','Ãle Bouvet'),
('\ìK\É\ÜAuG†Š\ÚX\Å$Ğ©','Ãle Christmas'),
('·‰\Ş\åTA\é²ûWœ\Æ\ß4','Ãle de Man'),
('X,É¯\ÜA²¬E\'1/','Ãle Norfolk'),
('\÷E\İl¢C\î’C@Ş½–§\á','Ãles (malvinas) Falkland'),
('†f¦S\ãM(­A•\ê]\ì\÷','Ãles Ã…land'),
('\Ä\Şa´\÷HŞ *ıÕª¯”j','Ãles CaÃ¯manes'),
('e €H\ĞnGHª\íBKş\Æ\É\ì','Ãles Cocos (Keeling)'),
('ªq\r\ñ.TK‰…ø’$Jšr','Ãles Cook'),
('¼„şM<pL±\å5\Ós\Ê ','Ãles FÃ©roÃ©'),
('\í \Ø\ğkJÉ‘¯À]`3\\w','Ãles Heard et Mcdonald'),
('«6\ö:DaH†«V\ò\r>ù','Ãles Mariannes du Nord'),
('{\åJ\Ãr\ÉH›š\ßeÄ¸dJ','Ãles Marshall'),
('\èÎ‰\ô5^M«±\Ô\ÍhDr5ù','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
(']Üˆ´\"ˆ@•œ\ÇtRrø','Ãles Salomon'),
('@¯qs%ŠK„y·ˆ‘','Ãles Turks et CaÃ¯ques'),
('\İ\"E\×\Û@¸º0~¾\Å','Ãles Vierges Britanniques'),
('O¦Š<GC®Á:•\rš\í','Ãles Vierges des Ã‰tats-Unis'),
('T\ß5’eJMŸû²O+ÿ\ã','Inde'),
('-&œ‚&:@Œ 1f\Ã\ns9>','IndonÃ©sie'),
('\núŸS„\ÕA\ê³iAo','Iraq'),
('›\Ò\åø‰oI._\Ğ\É²Z`','Irlande'),
('[_.mAKX‘\"\â\ñ\ÎrO','Islande'),
('\r*\ñOÿEy¢”\ÕR#U','IsraÃ«l'),
('^ \ğTø\æBW®‘«W','Italie'),
('B2‘—dGü´hDıT6_','Jamahiriya Arabe Libyenne'),
('\Êj+\Ó\ÂZN\õ¶\È}l\ôx™ ','JamaÃ¯que'),
('Óµ>\Ú(Mü­¬9W/ş2±','Japon'),
('@\ì]iDµ\Ä_\É\É9¦','Jordanie'),
('\æa•pCOj‹ıN’s)\ã','Kazakhstan'),
('\Zw«vI\óJ%˜9ŸŒ\"','Kenya'),
('8+mü\ÈKq¥·\ÙM™','Kirghizistan'),
('\î“PŒ§LiH—\ÂE\è\à','Kiribati'),
('w¦\ÚQaNş±/\álu','KoweÃ¯t'),
('Ì„³g^³Fƒµhn¸‰—Ş±','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('¹‘|(\å”Ij„O\Ğ.$„','Lesotho'),
('\Û\ğ‚\Ø\Ì\õM—F\òc\á\òy','Lettonie'),
('Ô¹\n$G´ Ã’k\"ı˜‹','Liban'),
('\0\åsVI\õ«›IEt.\Ô','LibÃ©ria'),
('%~!\ãLÉ°ZW³p\È\\','Liechtenstein'),
('VHŠ“d@™a\Ú¡kn','Lituanie'),
('±\ìÔ¥\'¢M\í­;\÷Q­¾','Luxembourg'),
('{mœ|\ğD¸ä«”¹Be','Macao'),
('\ç\Õo‹µIÑ·Q;ş{<','Madagascar'),
('/£±Sm•MM¿¢ùÙ«\Zš','Malaisie'),
('«z&lNùŠ\çØ‹\ä€*\Ë','Malawi'),
('ù\Æ\É)`@	´¥^§&Ë™','Maldives'),
('\ßw2\ö\ÖL“y‹!€…','Mali'),
('½‰¸/Y\ZO°”\Îcù}ø','Malte'),
('=¨¡9\çLÃ©!<¢\ê+\ó%','Maroc'),
('\İc²tBÏ¾<C\ôk\í\Ô','Martinique'),
('	„\È\÷7\nA¥‰\ß\î_¶\æ','Maurice'),
('z¿K°Å¾E³¤\ãÿ˜\Å\ò','Mauritanie'),
('}X–‚b@(¶\Ğ\Æ*\Ç\÷>q','Mayotte'),
('kl6\Ö-\ÍD`ƒk\ñ‰m¹','Mexique'),
('·»\'¬VùM°š\è%_\È_\ç³','Monaco'),
('\÷\İİ¿¤I-‹¶\n\ÊW`\"c','Mongolie'),
('v¬I	L6Aqµ«¢ qt‹','Montserrat'),
('O^gªÑ·B¸s^VAb…)','Mozambique'),
('ª(o»‹F°k	4š\Ï#','Myanmar'),
('~ı¯vüF€Gœ¯Ãº:','Namibie'),
('‘—\ÓoU¾Aa±`„§´``5','Nauru'),
('\ír~\éú„Lf·\é8|\å¹8','NÃ©pal'),
('»	s\åG¿\ÛT\ÑÕ•\Ë','Nicaragua'),
('D\ËD\ö\Úú@•ùiMw','Niger'),
('\Ë+QIJµ`\\7¢I','NigÃ©ria'),
('\ã\ö1±ªMV»¯uÂ—: {','NiuÃ©'),
('¾\Û9wNS€\Ä\éÏ–\Ò','NorvÃ¨ge'),
('[Ï½~™§Oe–eø\òlÏ²\"','Nouvelle-CalÃ©donie'),
(' 	£qI\õ­K ³','Nouvelle-ZÃ©lande'),
('˜˜|‹Fnº,úF\ŞÜ†','Oman'),
('Ø‰|\áFz¨Áº\ğy½¼','Ouganda'),
('TÀ]K%ƒN“»ù\'\ÍYg‚','OuzbÃ©kistan'),
('µZdøJš¾d\õ\â-‹','Pakistan'),
(' (ºIŠK\ïß°ªÈ€n','Palaos'),
('j‹\ójhG\ì˜<1>\ì{G','Panama'),
('Î™\ÊY\÷Jt–¿\à“\Â\\\ãº','Papouasie-Nouvelle-GuinÃ©e'),
('‡3\àG:B¤¶ÒZ\óŸn4','Paraguay'),
(';	K\íE…¼ş\ñUÀn+','Pays-Bas'),
('usJ;•B‰€µG“=¡ş','PÃ©rou'),
('\×\ÈD8»7¯;Ÿœ¸','Philippines'),
('Pn±%\İMy˜D¯û£iı‘','Pitcairn'),
('*g\"\ÆE±²\÷•\ğ\Ó\ë!','Pologne'),
('\Ø\ó\Ç\'\ğ\ĞO8¥m\óQ\ğU','PolynÃ©sie FranÃ§aise'),
('_ø\Ò9ŠHÌ‚\ğ\Ñ\÷Csù','Porto Rico'),
('™$%¼—D’œ¯|\İÿn\Â','Portugal'),
('v¶ffK³¸rF†§<*','Qatar'),
('N«É½\Ó\ÕDš”8\Æ\Ëp§\õ','RÃ©publique Arabe Syrienne'),
('d\äSI¹E\õ¨¡’ª«”\Æø','RÃ©publique Centrafricaine'),
('ÿ2·Q»GÇ”\Ço°u€«t','RÃ©publique de CorÃ©e'),
('’g\Z€iHU½B\Ãr³\ß\Ú	','RÃ©publique de Moldova'),
('·©Î¹B\æ¿ûx¿‡K¨t','RÃ©publique DÃ©mocratique du Congo'),
('}X»û[L›9\ìĞ³\ör','RÃ©publique DÃ©mocratique Populaire Lao'),
('-\ÄYrªI\öŸˆ\Ş7¦1\Ú','RÃ©publique Dominicaine'),
('½\Çæ±ˆLI€^£ÿ\î°','RÃ©publique du Congo'),
('¸a­µI\ãšIz=‡\ãÂ¹','RÃ©publique Islamique d\'Iran'),
('~˜1­\ĞONŒ¾Ó½\Û^\ôd','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('Ÿ\áE1O‰ª\á\ÆHŠù','RÃ©publique TchÃ¨que'),
('L†Ÿ¸O~‰\Ò\ÎcS½¼\İ','RÃ©publique-Unie de Tanzanie'),
('‰®6.¾}EÓ®³²¾p\Ï%','RÃ©union'),
('UhÏ–\Ì/MØ´€\Æ\áµ\õš','Roumanie'),
('?#\ÅŞªNFŸ›f©]7„8\Ù','Royaume-Uni'),
('.Œ\Îq´C€¬‚gb\È\Ô','Rwanda'),
('¿\ò\Ù$vD]ª\äı­\ä?','Sahara Occidental'),
('¢\ë‚\Ê-vFFÀ\ÆF\ã€\ô\ö','Saint-Kitts-et-Nevis'),
('OÀ||ªDK-œ\Ş\Ú$\ãˆku','Saint-Marin'),
('À\Çf\èLOY…R¥Ë\ì','Saint-Pierre-et-Miquelon'),
(' &W‰KV \Öw&•9','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('¥\Z<œwIsŸe—\ìqg¿\Ğ','Saint-Vincent-et-les Grenadines'),
('·\õ³¿^rB~\Â\ç\ä+#5ƒ','Sainte-HÃ©lÃ¨ne'),
('‹Ÿn\õ¬Lc½«&ªPu\Ã','Sainte-Lucie'),
('\Ù\n\õúşÿAy®[#ª© ','Samoa'),
('b/\ë\æq]Eº±7N\ô/$2','Samoa AmÃ©ricaines'),
('.ŒK\ïlN¶Œ›¼\Ì\÷µ\ò','Sao TomÃ©-et-Principe'),
('b\ç/hIBŠ-\ëN–\éÿ','SÃ©nÃ©gal'),
('„ÄkmmN‘“\Ìi«n','Serbie-et-MontÃ©nÃ©gro'),
('Le\éH\Ã\ÆJ‡­¼Áo\ç\Õü(','Seychelles'),
('´Š©\\Ü»Håœ‡:zY]ú','Sierra Leone'),
('Y¬º(ºwFÂ¤1j­)ú·8','Singapour'),
('‰\n¬‰\"\äOŞ‡\ØÛ“\Ì+9','Slovaquie'),
('j¢•(!¬OÃ¨8;~\ÜgŸ','SlovÃ©nie'),
('dg2\æš@Ã€\ÄÈ”zB\n','Somalie'),
('C99§¾L#T%\Û|j','Soudan'),
('‹œç–°Gƒ\÷¨±s¿U','Sri Lanka'),
('ø„û\Ì.wF<šF\Ö]ƒaw˜','SuÃ¨de'),
('—\r`’\ãwI‚¥¨o®','Suisse'),
('\Æ!Y\\L´‡\è›KVV','Suriname'),
('\÷HuJÊ¾X\ÖJ·ÿ(µ','Svalbard etÃle Jan Mayen'),
('1»\ÑE*,@?°ŒLG®—sO','Swaziland'),
('w7‚ù\÷£C=m&¼\èy²X','Tadjikistan'),
('\Ó=;yŒ<D¾\äÎ¿\ÑL\Ü','TaÃ¯wan'),
('@¿_jB•—20\Ùş8?v','Tchad'),
('\Ï\ZS!\ÉC\ç¶izºg	µ¹','Terres Australes FranÃ§aises'),
('X	\ètO«™µØ‹‰m','Territoire Britannique de l\'OcÃ©an Indien'),
('hù\ö«bI¦Ş˜\êr>','Territoire Palestinien OccupÃ©'),
('D-‰ªK’£ˆfµ¡\õ\á','ThaÃ¯lande'),
('\ç\õ‚~Ò¿A\0 :s\\t\Ë\ã','Timor-Leste'),
('£>½1\ÎH# \Ë\ì*\å\ñB£','Togo'),
('\í‡8o\Û\ÉLŸ½µ+\ÅR\Ãk','Tokelau'),
('2\"C.ˆÀE¶’6š6û™','Tonga'),
('	É‚%OÎ¥¾y\à\Ä\è','TrinitÃ©-et-Tobago'),
('¸?%@Hı \Â‹¿œ/','Tunisie'),
('Á±wÎˆLï‰½+;Y¹\r','TurkmÃ©nistan'),
('\Êu\òQ¡M\"½8(¥	v','Turquie'),
('›Ë¦0\ÈbE¸©\óÎ¢¦†','Tuvalu'),
('‘¼ù!!\ÂN\ï’ø<ü¸µk','Ukraine'),
('\Ö	û¦R†N×°c\ĞÆ„)z','Uruguay'),
('oL.°\é=I$¯]V\ê\Äc7}','Vanuatu'),
(';±€\Æ\æGXœ#g\Ï@û','Venezuela'),
('³­º„ŸE´‰\Ş1\ä\n','Viet Nam'),
('Ê„\ç~\ÂK\õš˜H7\n(0','Wallis et Futuna'),
('\ëSŒ\ì\õNOn°\à(Œ\ì\Ø\æº','YÃ©men'),
('×¶%“\ôN§Y¼øù‘\\','Zambie'),
('˜\Û\0n‚²C\r‚ŠWEo)t','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-10-21 19:37:15',3),
('DoctrineMigrations\\Version20240201152951','2024-10-21 19:37:15',3),
('DoctrineMigrations\\Version20240202084749','2024-10-21 19:37:15',2),
('DoctrineMigrations\\Version20240202150901','2024-10-21 19:37:15',2),
('DoctrineMigrations\\Version20240207105701','2024-10-21 19:37:15',3),
('DoctrineMigrations\\Version20240319212437','2024-10-21 19:37:15',2),
('DoctrineMigrations\\Version20240614133504','2024-10-21 19:37:15',10),
('DoctrineMigrations\\Version20240617165906','2024-10-21 19:37:15',8),
('DoctrineMigrations\\Version20240708061729','2024-10-21 19:37:15',12),
('DoctrineMigrations\\Version20240801202153','2024-10-21 19:37:15',2),
('DoctrineMigrations\\Version20240815153823','2024-10-21 19:37:15',3),
('DoctrineMigrations\\Version20240916065051','2024-10-21 19:37:15',3),
('DoctrineMigrations\\Version20240929091802','2024-10-21 19:37:15',11),
('DoctrineMigrations\\Version20241002164506','2024-10-21 19:37:15',7);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7','\É5?0O¤…€)\\¦ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-10-21 19:37:16');
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

-- Dump completed on 2024-10-21 19:37:17
