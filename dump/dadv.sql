/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.9-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv
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
('r\ïw\åyNv>ª\å\ítµ','Afghanistan'),
('‘1S\Âc*MJ²M›~\÷·\Ôp','Afrique du Sud'),
('E–\Õ\õ\öLJ’º“±_\ó2ƒ\Ğ','Albanie'),
('N+\Ü-F­.œvh¤ú','AlgÃ©rie'),
('\ë‹;»L<€.!\õ\Æ+7','Allemagne'),
('œ\å³20hI&š¯F\èP¶\åD','Andorre'),
('\×\ÅD¥\Z@G»{XÀiaP','Angola'),
('eü~zŸM>²;jvN¿±§','Anguilla'),
('¬§–k`Iù­œ«;x\Õl	','Antarctique'),
('†g\Z\rgŠJ>™TGÓ5g','Antigua-et-Barbuda'),
('\\Ø˜øH„©±$\é X','Antilles NÃ©erlandaises'),
('KE%f™H‰“Œ«\è³X\ó','Arabie Saoudite'),
('2\â\Êj³1HA·\ß•\ã','Argentine'),
('	pü\ëQ\"@¸¡Y¿\Û\Ö)\î','ArmÃ©nie'),
('\ßù\àLŠB%©\æ-%\îT­','Aruba'),
('<p¸\ÖBDM«\ò[\Ûy','Australie'),
(' 9`\åœG\ò­ÿµP\ÏQ','Autriche'),
('²Tû\åsE\â\ÖJ\Ò²<','AzerbaÃ¯djan'),
('T¿|L@\òµ³œ^j\õ¥','Bahamas'),
('\òbŠ¹Z‡CH¸o¶£ƒŒ','BahreÃ¯n'),
('âˆª\ßb°DØ— Š9\Ì ','Bangladesh'),
('©`\ê4­@¯>i²Ûƒ\Ã','Barbade'),
('\×c+®N³vtì±•','BÃ©larus'),
('Û’FÍ€{N×™QÀüA\ë','Belgique'),
(')£(f»\êKf“»Rc\Ä¸','Belize'),
('lzU\ò	KÏ½¡(\Ñ]\Ğ\ë','BÃ©nin'),
('°€ƒL­uE¬<\Ï:¼+¢ˆ','Bermudes'),
('.~´—F\éN„¾tBv^¬4´','Bhoutan'),
('\ÕV\ì\é\ßM1ŸZ\ôq¢/>À','Bolivie'),
('\é\õv?¿\ëCOŒ¡\ÆD›','Bosnie-HerzÃ©govine'),
('¬oEE5†µ¼—7‹ \Ô','Botswana'),
('\å+‡\×ÿ=@Ô x#ƒ“-','BrÃ©sil'),
('\é¸\÷UI\éŸÀ\rùTa','BrunÃ©i Darussalam'),
('Œº	§EC™²\î17£ı','Bulgarie'),
('\0>8ş`Jy¯g\ì\ÙØ«¶','Burkina Faso'),
('s\Ò\÷l®B>Š~pac·`½','Burundi'),
('¯\ÒN›\Ì\İOA…\Ï\ò\å\îú','Cambodge'),
('\áMÖ²\ÂIØ”6\ó\Øf5²','Cameroun'),
('\ò_5¯dDÂ’ »k\0P;i','Canada'),
('|5—‘wKØ¦O³’\Õ Á','Cap-vert'),
('X¨\É8:I:’\è‡\æºm','Chili'),
('\'\ó‡YŒ\äEJ³\ì‘‘™','Chine'),
('\ì\Úˆ-KÎ“jTœh	I\×','Chypre'),
('¦¤Úš¤Dı™\ô©Ûƒ\Ê','Colombie'),
('J\à}\Â\ÔKH¨™y¼Œ\äP\Ä','Comores'),
('C\0®\ÔC\0¸w˜\àef¶\Ş','Costa Rica'),
('\İ. J\äMI·©Ë˜-^ø','CÃ´te d\'Ivoire'),
('J¤¤¸J?‚\Ê\ÊUŸ§‹$','Croatie'),
('7<´¦N€]\n°\îšm','Cuba'),
('j\éù¯K9µT\É^.ú','Danemark'),
('o¯¦C|’Oƒ\ÎTŒ\\~xO','Djibouti'),
('‡o†,›²D“‡\å^\ó\Ğ\×\Ã\Ç','Dominique'),
('š?&V´®O¾¨PWé¯±g','Ã‰gypte'),
('\ÑgDhÿ@G°• 7F','El Salvador'),
('uy~¹C„•—\Ë[œÔ›','Ã‰mirats Arabes Unis'),
('\ái\ç\ô{K\ZªpÈ•<\è`L','Ã‰quateur'),
('c\ÇÍ¥W­J‘µ[1³\ÏoO/','Ã‰rythrÃ©e'),
('\é\â\È+\öE\ã–K<lÃ¶n','Espagne'),
('M\é\ãfŠÁ@\î› À0ÿ','Estonie'),
('UÉ­É²²G¹¼Ø»Zşø^','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('y«4\Ú\÷\õNÉ\Ï+\É\ÒlÃŸ','Ã‰tats-Unis'),
('«\Ì\ğ\è6Fp¦½m²¶\r)','Ã‰thiopie'),
('\å1Œ\ä6Aƒ½)İ­\\Tƒ','FÃ©dÃ©ration de Russie'),
('¹G!BI\÷J²¬‡R:\ä,g','Fidji'),
('büaıMe…Fk²_Y','Finlande'),
(')NıQ/}C\ğš\É}\é©C¸','France'),
('\î²*B7I(‰µŠ\ß\Ësú\Ù','Gabon'),
('¸Œ­ÁŸGµˆ2Ò‰°Y\İx','Gambie'),
('³†Ç½¢C‰´~\Ú\õC','GÃ©orgie'),
('™·¶@Í”¶Q\ñ­4 ','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('Ã¯A&CRL¨”±q\âfšB','Ghana'),
('‰ˆ¯‘\æFÜ»Fw…_\ìû½','Gibraltar'),
(' \ô\ÍUM¼E~·£ü\Ö\'\é','GrÃ¨ce'),
('~¤\Â`\ßAº¿]Â€q¹','Grenade'),
('d†\Â\ïcD\êÛ·\Ùÿ@hg','Groenland'),
('ıv@‘g,HA·\Ä3h\Ê+§','Guadeloupe'),
('J\ê\Åa\ïEªš<2\é‰N\ì1','Guam'),
('–\ÚEƒ`F»¥\Îvy\ÜN\n','Guatemala'),
('‚Oˆ5\æC£½2\Å\0\Ñ°','GuinÃ©e'),
('?Nv…\ÚI$‡\Ğëƒ¥)\Û','GuinÃ©e Ã‰quatoriale'),
('±[ N–»¯\÷º\ĞZM','GuinÃ©e-Bissau'),
('»F1\ÉkG«“d›½\Å\ê„','Guyana'),
('·9-Á@Ì›¡…6F\Õ9','Guyane FranÃ§aise'),
(',uz\n›G$–>b\ë3\Ó\ÑC','HaÃ¯ti'),
('\éª\ö*\æNXº2\éN\0|','Honduras'),
('²( \ö\Ò@Á²e¸\İ\Ù\ê}','Hong-Kong'),
('¶9>2Ï£I\'†(\È¡\õ\Ê','Hongrie'),
('ƒ\ï°rFmA$\r€†\óK\Å','Ãle Bouvet'),
('\×\0P\Ñ\ö´H6¨¾P\nœ¶4}','Ãle Christmas'),
('` >,º\ÃBø°Š¨\ò%“','Ãle de Man'),
('QSÑV›GB¥7\ZuÁn\Æ','Ãle Norfolk'),
('\å‚r\æKTƒz¼³\êl\Ó+','Ãles (malvinas) Falkland'),
('ı¼3\ç †@Í§P\Î5™¸','Ãles Ã…land'),
(' j/z\êÿIBU¸/-¡N3','Ãles CaÃ¯manes'),
('\ôıQC\È\èD8\Ï\ÇlY\Î','Ãles Cocos (Keeling)'),
('e(w<\àxEÖ‹™ù6wÉ•','Ãles Cook'),
('‰lü\Ã\ÏA@Ê\ÑE7:’','Ãles FÃ©roÃ©'),
('Œ©ŒIŠA×‚@RÅ¬†','Ãles Heard et Mcdonald'),
('‡v\í\îL œ<\ß\r­*\×\Õ','Ãles Mariannes du Nord'),
('{¿\Ì[³I¸ƒDF°†x','Ãles Marshall'),
('G´\óE\çº\ó»™Hw','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('9v·–OÃº\İ\Í/\Z\\ ','Ãles Salomon'),
('\â¢\0\àA`˜f\ôœ	M*','Ãles Turks et CaÃ¯ques'),
('\Ëı:T\ëEÀ—ZùŸ„>\0V','Ãles Vierges Britanniques'),
('eo4¢|GD™\Éc\Ü\Ó\ß±','Ãles Vierges des Ã‰tats-Unis'),
('œ•\é\ö\áC6½û\\‹™}a','Inde'),
('bŠ\'º\íKb£Ÿ^€½\é','IndonÃ©sie'),
('w\ÄšJCìƒ‚)¹\î&','Iraq'),
('\0;ødK8™W»y2±dQ','Irlande'),
('\âO[ŸC\òEYƒ\áyVü8<\ô','Islande'),
('o>\\\Ë\àIÏº\ógŒ¿\\','IsraÃ«l'),
('\Ö\ík6\Z!E/•tˆ·\ï\÷\Ü','Italie'),
('W@NS|¥Jü¯­©øcgÍ˜','Jamahiriya Arabe Libyenne'),
('ªk¬,u˜M\ó¢Ä§š\ÃS\ÛB','JamaÃ¯que'),
('şd\ã\à‰ F0”Z=\İÈ– ','Japon'),
('\Zmûº\òJo¼\Õbx\à\ä\Î\Ş','Jordanie'),
('\ÙD±Pˆ\ÆH•¬{	\ß\òË³','Kazakhstan'),
('<d1MD†£%üT\ÍBy','Kenya'),
('\ÑL²ÒŸ\ãM¯·c0h¬','Kirghizistan'),
('\à\Z\Í\áMIP\å\ìŒ\'\òú','Kiribati'),
('\0†­p/JŠ´#2\Í\öxú','KoweÃ¯t'),
('¾Y\Ç\ç\åG(­=ttRÁl','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('Q½`€\Õ7M>±Ê‡Ô£P5•','Lesotho'),
('ú”s	BS¤\Z\ÑCM\ä¨','Lettonie'),
('®İªºM£ºw\0¨\Ş3','Liban'),
('\È%«t­[GÚˆ\Í\É[˜`\ÄJ','LibÃ©ria'),
('I\÷•…Á—B\á¹z7ˆù\÷«','Liechtenstein'),
('“\î\ìÈ±“CL¤\ê\nB‚ş','Lituanie'),
('„mK\÷[1HW´\È\ç–\ã»>1','Luxembourg'),
('\ïü/F¥Nx¦‡p»¹\ómŠ','Macao'),
('s\é\'Æ¨Ij‘·*\ì³\Ë\Ë\İ','Madagascar'),
('Íƒ~x\ì\Ó@	¥\í\ï\ÕSF','Malaisie'),
('\ãuK\äCOÙ°\Ãş\Õ(®h¦','Malawi'),
('\ëQ\Í\Û!qL‘O\æ%\ğ9','Maldives'),
('\ëf\ÓoF\ÚCV½ú¢\Ü~¥†','Mali'),
('™T“†nLÃ;o$´º<','Malte'),
('¹F‚\Æ\æM“T\ÍÔ›¦\â•','Maroc'),
('À¿¬Á$GK´+RŞ•\ô\ñ','Martinique'),
('AZÈ\ÏD4¡§[};·s','Maurice'),
('V\Ş\÷*\Z;DN–V‹İ°×¬}','Mauritanie'),
('£°F\ë²PLµŒ\ì,\äH¦m','Mayotte'),
('¡WŠQ<Lƒ¥º™_º\Z+','Mexique'),
('\\±N\ãOF5™`µi!','Monaco'),
('\ÇĞ­\åW\çO¾_\à¡/4u','Mongolie'),
('¾\è!£mG°Š\İù7','Montserrat'),
('‹m”Z»Hn½\Í}9\Ğy§\Ñ','Mozambique'),
('j`J‘\×N¤¡ÅŠ \æ','Myanmar'),
('5\Ç/B(FÎ¾¶)µ½yŸ¯','Namibie'),
('¤ªš\óÄ”MD«ˆgŒ\õC','Nauru'),
('\ÔÌµ¹DM²\'½P\â\ó\Ø','NÃ©pal'),
('\äT5¿¿BT’•\ÛüL&g\Â','Nicaragua'),
('‹>cŞ»CÔº¹´€\é:','Niger'),
('sñšªG\á·4k×¢}g','NigÃ©ria'),
('A\áœÇ—Bß€û\Ãt«4f»','NiuÃ©'),
('\ó\Ã\ÃÀKqŠ«\Ê\ÏIv¹\Ø','NorvÃ¨ge'),
('£\Ä\æBú\äE±kd©HI§','Nouvelle-CalÃ©donie'),
('º!#Yú@G-†\ã«\r”e','Nouvelle-ZÃ©lande'),
('W…_ºh]H‹¹|¶\Ğ#v\Ê','Oman'),
('°g- ¥ÿND¹Qû^­\ç\Ç','Ouganda'),
('C\ë¨ºOŒz˜\Ê\Ûw','OuzbÃ©kistan'),
('Š^\0kú\ÕO\ó…¾\ÎE›£¬˜','Pakistan'),
('ù\Z\á@)N-‡R\ès‰¦_ş','Palaos'),
('\0L\È)™ZEÍ«¢\Ï\Ö\×','Panama'),
('\ñ@\ßÚ”A,½)¾¿£\nª','Papouasie-Nouvelle-GuinÃ©e'),
('\Ñc¸\Ê\ZK|¸ıY§x©G\É','Paraguay'),
('\ÃÆ²‹—Gm¤yx˜hT','Pays-Bas'),
('º¢5(gDÒ…u“(u','PÃ©rou'),
('|\Ê\06ŸjK±\í\Åd­›ú','Philippines'),
('(¹›\ìOH¨5D.u\Ì','Pitcairn'),
('qsy»QDŸ7Ì­SB´','Pologne'),
('5\Ó}\Ø!šHÉ‡oU”5','PolynÃ©sie FranÃ§aise'),
('\İ×¤\ò³şC¦G&ˆƒE³®','Porto Rico'),
('/…A˜>M+‰&½A{','Portugal'),
('q\Ã\\€\Ë\Ô@Y±\ólÅ©\Ü\ö7','Qatar'),
('©2ê‹“\éMj²©Š¾\Ï>™7','RÃ©publique Arabe Syrienne'),
('<lR\Ö\æşM`¹ˆ\à\ägù','RÃ©publique Centrafricaine'),
('Tå‹‰Iù©L\æ5z$7p','RÃ©publique de CorÃ©e'),
('\Ó4U\ÅSOÓ˜\ã	½¦#','RÃ©publique de Moldova'),
('†; @	¿ohú\Ëú7','RÃ©publique DÃ©mocratique du Congo'),
('5ê£‹Lµ§¢\ÎE,t[\ô','RÃ©publique DÃ©mocratique Populaire Lao'),
('Å®­,vPN‚ª‘VÆ‚\ì','RÃ©publique Dominicaine'),
('kX¶ù›B´±“\é\ñ{','RÃ©publique du Congo'),
('0\Ø=/VMoŒ\óé«˜\÷@°','RÃ©publique Islamique d\'Iran'),
('j%\È$O0º\Ø	t\è','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('\"TP›^M/¥P¾\òV\àt','RÃ©publique TchÃ¨que'),
('UıD¤‚)A1\É\ÕKW\ì\Å','RÃ©publique-Unie de Tanzanie'),
('\Ş$c**\"KkŠ;:\Ù\ä#kˆ','RÃ©union'),
('–`\ÍYş\nE\ç…\÷\Õ[ûd','Roumanie'),
('\Ú!\ß\×`JÌ’OŒ8ZcG2','Royaume-Uni'),
('q\Öu\÷\ÍM+·j\ï«)\ñg\î','Rwanda'),
('µù%–1ˆJ$µJ\Ê\Ü){£','Sahara Occidental'),
('\ï¤\Å\Ì4Aµ‰{PO\ã­0','Saint-Kitts-et-Nevis'),
('ˆ	Qš=\îCk„5·\é\Ö1\Ú','Saint-Marin'),
('i\ÅJI?M‚”\ò	#C´@','Saint-Pierre-et-Miquelon'),
('j\ÔdšwIxŒ<r_ŞŒ','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('\ÂıøÔ¥\ÆN„X\Ëm\ğ%','Saint-Vincent-et-les Grenadines'),
('\ÄP¨ G”˜‡”É‰ß€¢','Sainte-HÃ©lÃ¨ne'),
('£G¼Ë”XL4#Z{;\0\ò','Sainte-Lucie'),
('%†—N\ãO‹›@\"4¬QJ','Samoa'),
('\Û\Ù\ìU\ÛD]Œe‚LD>»','Samoa AmÃ©ricaines'),
('\ó\è\r\éB’Bo¿½˜ù\İJ','Sao TomÃ©-et-Principe'),
('¹V*^\ÜG±¶W\÷Ÿ\Ù]','SÃ©nÃ©gal'),
('ªzT>DQ£Q\öº\ó¶…','Serbie-et-MontÃ©nÃ©gro'),
('\ËD\ãtD\ã«,\ØÜ»ü\ß','Seychelles'),
('‰_.D>G”4QŠ\ëü™','Sierra Leone'),
('#m©\å\ñD|¾sø5ŒU­','Singapour'),
('5q\Â-]N¿§\ë3$³O·','Slovaquie'),
('\óÒ¹µWšC=™l]Z†û3','SlovÃ©nie'),
('@¹\ğ\â†bN\õ„Sû†g¤\î\ó','Somalie'),
('°\õ±şUsNI³\0\ñfz­Á','Soudan'),
(' \ÖnX F]½\×\\e\\\0_','Sri Lanka'),
('¥dno\\\åNv¼P‰8î©ŸD','SuÃ¨de'),
('b\Z\ßŞªA+‚iNœ\Î,BD','Suisse'),
('/\íÌ›¿J‘’”\ğ/¿¢','Suriname'),
('ü;·JfŒF Œ‚Ú£D--','Svalbard etÃle Jan Mayen'),
(' 2©+GEû¦\Ó4ªŠ¬l','Swaziland'),
('R\ÚÇŠ¢Fı¼\ïûVš\Ê','Tadjikistan'),
('BV§\åt3OÓ¬œ“§ù¤š´','TaÃ¯wan'),
('üA\õHLg­¸üR\æ+re','Tchad'),
('AĞ­V‰Nq•eO~°”^','Terres Australes FranÃ§aises'),
('PÓŸ77ŸJk½\rM¹7“·','Territoire Britannique de l\'OcÃ©an Indien'),
('U@»<Gƒ¤=·;)<','Territoire Palestinien OccupÃ©'),
(' ×ŠB‚H=Œü³µØ¡\ìµ','ThaÃ¯lande'),
(')Á\î\İAW˜Â‚\ì›!6M','Timor-Leste'),
('m\í\ğÜ‹Fù‹\ÜF\Î8 ','Togo'),
('$K€r\ÌlAÇ‚D¡|{€k','Tokelau'),
('\Z#2N.œ}\ğZ©Ø„\ì','Tonga'),
('\Çb\'Î¶\Ã@ú%.»\Ñ\äB','TrinitÃ©-et-Tobago'),
('O!f\×\×OÀˆCtz€+\",','Tunisie'),
('\Ì\İ\åAF\ÑMSš–M\í£h','TurkmÃ©nistan'),
('ÅµCR¦@œ\Ñ\åv^\É','Turquie'),
(':\í6$\Ú{O«¥‘\ö[_','Tuvalu'),
('ı\Çr¤\n\ôNøƒk/½;:°“','Ukraine'),
('$¥ˆ\é!AT¥vx¨\ß','Uruguay'),
('\Ø{‰6IÀJù¨N\Ò\Ø\Ç8\Ğ\Ò','Vanuatu'),
('\Ê\rBU\ÊJŞÁ¶—©','Venezuela'),
('8-’wOI£‰³X Ÿ@\÷£','Viet Nam'),
('	ˆ\áû\Õ5Iƒj\ÇŞ±”D','Wallis et Futuna'),
('LÁ¡‰7aKËŠ\Û+¶ß§§','YÃ©men'),
('–oü`nLV›Ÿ\ß\ÅY¢”^','Zambie'),
('\Ñ\åj\ÍNEh†Hş>ˆnƒ','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-09-29 09:19:15',2),
('DoctrineMigrations\\Version20240201152951','2024-09-29 09:19:15',1),
('DoctrineMigrations\\Version20240202084749','2024-09-29 09:19:15',3),
('DoctrineMigrations\\Version20240202150901','2024-09-29 09:19:15',1),
('DoctrineMigrations\\Version20240207105701','2024-09-29 09:19:15',4),
('DoctrineMigrations\\Version20240319212437','2024-09-29 09:19:15',1),
('DoctrineMigrations\\Version20240614133504','2024-09-29 09:19:15',11),
('DoctrineMigrations\\Version20240617165906','2024-09-29 09:19:15',7),
('DoctrineMigrations\\Version20240708061729','2024-09-29 09:19:15',11),
('DoctrineMigrations\\Version20240801202153','2024-09-29 09:19:15',3),
('DoctrineMigrations\\Version20240815153823','2024-09-29 09:19:15',2),
('DoctrineMigrations\\Version20240916065051','2024-09-29 09:19:15',5),
('DoctrineMigrations\\Version20240929091802','2024-09-29 09:19:15',11);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7','\É5?0O¤…€)\\¦ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-09-29 09:19:15');
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

-- Dump completed on 2024-09-29  9:19:16
