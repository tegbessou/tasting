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
('üµ´k@E˜Dµª9I','Afghanistan'),
('m¢É®©oLS„•:½’\í','Afrique du Sud'),
('l\óÇœ\éJ0‹$^\Ï\ê04','Albanie'),
('eqZ\ÚCÄ¿\ï\ÉY\Ò\Â','AlgÃ©rie'),
('\÷¬S|”<I7›(\\Ëµ7','Allemagne'),
('\ìĞ³¼ \\D‚T´7ú\å\Ü','Andorre'),
('\÷Š©\â\öLÿ¨¸\Ôz¨\ì\ÃV','Angola'),
('€\Ï\ö\öO›\Ö\Ş=”(hı','Anguilla'),
('2z»SM˜¢º¼“\è»','Antarctique'),
('\Õb\Î\n	—HC®™\Ó\Z[ü|L','Antigua-et-Barbuda'),
('*?Ãœ¶MJ“l\ßSk','Antilles NÃ©erlandaises'),
('¥üÜ¡²\ÌN+µ.0\öOŠ0','Arabie Saoudite'),
('-M&\ñ\òNåœ…e2£kv^','Argentine'),
('…\à9MOFd”h\Í\ò2‘¯a','ArmÃ©nie'),
('uû«\×]:@ü£\ö	\Ó\÷Í£„','Aruba'),
('ƒ±¬}\÷!@Ë‡¤2ÿ‚\ó\ß1','Australie'),
('?·9ß©AMªx\Ö!Ì·_','Autriche'),
('9•E©‡ªH\ğ±µû\Øh]ª','AzerbaÃ¯djan'),
('\×[\èVf\ÈIE‘q\Õ0\åNi','Bahamas'),
('´„(0\ìWEÑ„qé²¶\ÎE','BahreÃ¯n'),
('“\äş¥$FK’]°0¶I?','Bangladesh'),
('6±Ù²$LÏ·vû\ïI¨@','Barbade'),
('n¡\í\ò\ÎC\\‘q<ú*=&','BÃ©larus'),
('VŒE!¤5]	\İú','Belgique'),
('\'W0L¼¾HC¢wb•\Ó\ß','Belize'),
('ú59–¶Bdı&\ğsQ{\Ş','BÃ©nin'),
('°úÿ”\ìHM´Œÿ‹ı.¨­','Bermudes'),
('\éDqt\èI1&e‹´‰','Bhoutan'),
('IA\æ·\ÏM_\ó\rË6','Bolivie'),
('E™™‡A\á¼m\÷¨¸š)','Bosnie-HerzÃ©govine'),
('™\å\0\ÏE%²4b:¼¯','Botswana'),
('Í¹®/EO¯€\ñ)µt<','BrÃ©sil'),
('xÀ/Æ“EM\n§Wƒ¢\0h','BrunÃ©i Darussalam'),
('\ë‡(\ÈeFJf‚\\5\ôMÀu','Bulgarie'),
(':]Ø”\ï–N\î“\Ô\Ø\á½~Â³','Burkina Faso'),
('C19mM&E˜¦\Énp\ä„Ì”','Burundi'),
('MN\ó`^I\ô¼W±/=·\rI','Cambodge'),
('ƒ,{ÀN¬CÇ†\ÅÀ|>…\ç','Cameroun'),
('’‡\âAP\ÅK¨«ù\Ø\Ï\Û\Ç','Canada'),
('O6•fªJ·©}›Tr\óK\Ì','Cap-vert'),
('\í\ò\ã\êoE«¼›‹(\ô\çK','Chili'),
('l\Ø;\ÔDF¸²`\öƒf','Chine'),
('!‹\rŠA†…~›\Å\Ûr-e','Chypre'),
('§…()@¹¥¶¥ºÇ¾-','Colombie'),
('\æ\İÅ©\çGm‘¾\ã\ñl\\\Ú','Comores'),
('\0ú—\ŞK1Šº.\Ó\ç:û','Costa Rica'),
('§*	ŸO/µ«Ë€(mŠ','CÃ´te d\'Ivoire'),
('«ä¢¥4D~”€¬S\ğ&_*','Croatie'),
('%À\æ\ÍG\ÉM1Ô«\ê\ÇŸ\×','Cuba'),
('\åÀK\éª@\íJ\î­\Ó ¼\İ','Danemark'),
('\Çù[7iùL\nƒIıEM+š\Ä','Djibouti'),
('·¦\ÉFŠ\ÃL±F\â~	?øù','Dominique'),
('^\óLª@a€\Z:0¸‡','Ã‰gypte'),
('¿’L\ÚßµH“®(\Z\ö\ñ=j\İ','El Salvador'),
(']{Š\ÎB®² \0W¸ÎŠ','Ã‰mirats Arabes Unis'),
('7i\Z€A7Cv®UüO…¼ú','Ã‰quateur'),
('Cp±‡#G²\ç\Ş\ğ\ÂE','Ã‰rythrÃ©e'),
('\Í\ìü38\õO¬°8ø%E—+m','Espagne'),
('\á\Ş\Ò`aMÖœ‰\Â3”*\öš','Estonie'),
('\ö¦p\ÚIü›¼©#B\È','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
(' ¿7\ãN™º\ç°<‰Tˆ','Ã‰tats-Unis'),
('¤IQŸVŠJU–\Èú¸!\Ö|U','Ã‰thiopie'),
('-4¤\ÂdOM§\"•ú“¦ú\Ä','FÃ©dÃ©ration de Russie'),
('2Tÿ\İ?A\ã¬>Z®\\·±5','Fidji'),
('O•\r)\Û\éAŒš\'Ø¬S\ß^£','Finlande'),
('s=Î–\\A™‹wŒQ^T','France'),
('\ãn@z0JÈ˜Í¹„nrÂ¹','Gabon'),
('¢|\×\Òa@-°x\ô_l£A^','Gambie'),
('\è~G\0!Hè ¯…k¨­¨','GÃ©orgie'),
('€‹\î…\å4El©O¾´A\ë7','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('.y¸‡?¸@>ˆ(ÓµúO\Ú','Ghana'),
(')@F¸ÇªC\ï¤IZŠ“oJ','Gibraltar'),
('¡}\Æ†FÉ½”ùÀ\"\Êo','GrÃ¨ce'),
('CN±’=A¨¿\ô}5?½S\İ','Grenade'),
('»&\Òhk,I°‘\Zù<Evf','Groenland'),
('\n\Ã\Ğ‰EJQ§\Ì\Şì¯ª','Guadeloupe'),
('\õ\ä¡U<Lü¸\Ó-{û\ğq','Guam'),
('·;AX\'®H¼»Ã¸].\Ö','Guatemala'),
('‚A¹}9(E‹\ô\òa\ô‡@','GuinÃ©e'),
('\ò5Idw\ğKu´smFùµ)W','GuinÃ©e Ã‰quatoriale'),
('\Îk\Û\Ä\â\â@8£i¢˜Y\Å','GuinÃ©e-Bissau'),
('H\Í{\è\ÛB)A\â`’ 1¹','Guyana'),
('Ga’›L›G7˜\Îi¼\ÌùpY','Guyane FranÃ§aise'),
('p€\Ã\Î \ËNû„•{k\âoM','HaÃ¯ti'),
('€°\È\ò•AG‡Ö•8/¨)','Honduras'),
('‰£9F\Â[@<¡\Ôwp2\îÁ','Hong-Kong'),
('£¼$¡Ba¹^ ›\ö\Ù\é\Â','Hongrie'),
('Œš»7\Í\ëIq¹Òªût\ô','Ãle Bouvet'),
('­È“‡“eC¿\Ë`{#\Ô','Ãle Christmas'),
('8²L¯¶C²6?qO²9','Ãle de Man'),
('wG\ã™@Úœn\àr\ÓC‘€','Ãle Norfolk'),
('ŸŒZcd¡A—¡’FQü©Ö­','Ãles (malvinas) Falkland'),
('>Á#¤¿\ëD‰œ\öÀ»\ë\Ã3k','Ãles Ã…land'),
('\Ùzl{\ŞAP˜YXd:g\×_','Ãles CaÃ¯manes'),
('\ğMFú½˜Ew®R\'\0ı_ı','Ãles Cocos (Keeling)'),
('ß©nÈ\Ï@¹9f\"(q[','Ãles Cook'),
('\ÔdŠ][ÿ@¦ˆÚ\è;Ğ¤','Ãles FÃ©roÃ©'),
('(¨?·1mFÇ¯C\Ñš\×\Ô','Ãles Heard et Mcdonald'),
('\Ç#\Ó0\àL­Š?`b\ñ4_…','Ãles Mariannes du Nord'),
('Zn/\Íw•MıŸ­\n;/MD','Ãles Marshall'),
('ƒ‘|†\ÛDN±¿¨¹»2\Òz','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('Nı“cI@AJX\ä\à~ ','Ãles Salomon'),
('G\Ï<ùCDEb§@Kú‚ı','Ãles Turks et CaÃ¯ques'),
('‡\n‘J\ĞE+¨\æ‚Y@h9^','Ãles Vierges Britanniques'),
('\"\"¢¸\òºJK¾@ú·\Ã\Ş','Ãles Vierges des Ã‰tats-Unis'),
('N‰N\\\Ã\×K•¸ı\æe^\×','Inde'),
('¦Y?i\Å\ÓG$€Õ‹7L\Æ)','IndonÃ©sie'),
('3F\Ö\êL²\á0g5”','Iraq'),
('(¦‡{¤Mc¼iÇµš>(\Ì','Irlande'),
('\ëy©š\ÕJ^«Ñ·\Ñp‰x³','Islande'),
('X¥ß«›JÇ\Ìh\Ù\r','IsraÃ«l'),
('\ã§G’\n\ÇDÁ’E«<î¬™','Italie'),
('#4}~\ÈH‚\Ín\õY(%','Jamahiriya Arabe Libyenne'),
('\ó8§g&HÊ¸KùŠ\ã’','JamaÃ¯que'),
('ÁÁKt]‡BÀ¡5\0\é\\\á9','Japon'),
('\ÎĞ³x§\ÎMˆ–úÿ\ñ£–Gû','Jordanie'),
('##qå‡“J\ğ‘\È!yÅ„\Ì\î','Kazakhstan'),
('gØ¡lrAh½¸iŠ\Ä','Kenya'),
('¾\ó·Ñ‡‚N­\ñ\õ´ F¡†','Kirghizistan'),
('<6F{VK\ñƒvQ‰—‡’','Kiribati'),
('4\Ù\ñ@i\ÇI»¹‡c.:û','KoweÃ¯t'),
('£¯8ù_\õIh½\à\Ì\ßh¸\Ş','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('\0+f\rŸA6Œÿ­·K–6','Lesotho'),
('—¹3šG‘£5TVzœ','Lettonie'),
(';U£\ÜD»B·»zùY%Wù','Liban'),
('gyŸJ\ØKI“e{Œ%X¿Š','LibÃ©ria'),
('­	\0™PCIj–\çù\\MT','Liechtenstein'),
('ş³¥dmMJ½9¤\0?)%b','Lituanie'),
('{\Ğ¯l@‡¾\ë#<\Õ','Luxembourg'),
('}|%-\ÈOiÊ·…-«\ö\Æ','Macao'),
('’½R)L(A”’À\ÆÃ‚‡','Madagascar'),
('ühu%†;D}™\á\Ú\ÎB(2V','Malaisie'),
('„d\Ï?-\ÊDB”¿\Íø’F\áŒ','Malawi'),
('1&[Š\÷^M{§ Ò}V\ËL','Maldives'),
('fr\Í¿UF´„‘r›š','Mali'),
('\Ü\Éü$\÷©I–\äÿB\ä\ç','Malte'),
('•W#6¦\r@¾´ú¥\çÿ%\Â\Í','Maroc'),
('©]®$¡jNÊ¶¿}Á^PC2','Martinique'),
('<«F’\êEm \Ç0fg\r','Maurice'),
('b‰`9E4‰œ‰t¼Ô‰›','Mauritanie'),
('.*\Û\È{6Ol°g\ævQ\êx','Mayotte'),
('”T[·²\çCZ›	¤\ô\Øl¿©','Mexique'),
('\ç™w´s6N\ï¯&\ğ\rdù\ä\ç','Monaco'),
('\ĞJ\ëu§C·¹„\ß\öKš\n','Mongolie'),
('•İº E¢¢nø\ÏCxI‹','Montserrat'),
('o¸¢Ä¬\ÖL²˜Å·.ú,Ğ·','Mozambique'),
('J£Y\ÄDh…Ÿ\ö\ã´ú','Myanmar'),
('Wv\áŠLR\Ëq\æÑ¸§','Namibie'),
('\ä¬\Å7XC\n¨³\èND\ê_','Nauru'),
('5\"RŠI\ÔCÜ¦]‚kD¿0','NÃ©pal'),
('3\æ„üA8¡Oc¤‚Y6W','Nicaragua'),
('\ìˆx\Æ\ĞIFx‚rUªC¾k','Niger'),
('­)\'ù\öBÆ®m\æº.n½','NigÃ©ria'),
('\Ë\ï\Ñ\Æ\ÌL‘\0W¦–\ñŒŒ','NiuÃ©'),
('Jû`~|\ÃB \ç\ï/7\Ş}','NorvÃ¨ge'),
('L(\ç\ÄaB§‰ü\ìs\íÍ©U','Nouvelle-CalÃ©donie'),
('\Úm\Ó\ØÃ—N9´\Öhş\ÂY','Nouvelle-ZÃ©lande'),
('«.µ\à¥\ÒDˆª\Ùd›‰2','Oman'),
('˜\ä¨AgˆX\ZvÚ“/','Ouganda'),
('	b5P0I€™G`<&ƒH','OuzbÃ©kistan'),
('1®F+\éL³\Şf ‹®lY','Pakistan'),
('Ü>`\ÄcF»z«\Ù\Â\nz^','Palaos'),
('½¼\ìaF=°\ömjÖš¿','Panama'),
('i¬± #¡AK…j–Á\è<','Papouasie-Nouvelle-GuinÃ©e'),
(':¸¿a\'J\ç$KÚ´\ÇF\Ú','Paraguay'),
('\Ê‚Fo“B–©)\ZWC$…4','Pays-Bas'),
('Ø\ÚmXI™ˆ|›\'\Ó\àd','PÃ©rou'),
('& A[·\0I[†0,J\öB1','Philippines'),
('D\Ü\Ó\÷#\ZNMš.\Ö\È\ô\n\İ\Í','Pitcairn'),
('{«HŠp\èLĞ–*°\ß_Á`\Ö','Pologne'),
('\à2t\í6\ÏI»µš#‰f6t','PolynÃ©sie FranÃ§aise'),
('mü\ê\ï4FÉš\é	U,\\','Porto Rico'),
('v>·\Ï\ÚDEfº\á¨=BNG','Portugal'),
('?*\Ê\Âü“J¨­\óÉ¡‡¼j','Qatar'),
('Ãµ	…+Bƒ\ÒO%\0FQ','RÃ©publique Arabe Syrienne'),
('6»\Å!BÂ¯J­H³^B','RÃ©publique Centrafricaine'),
('iÅŒ\öDÄ¡e$qo©Ÿ','RÃ©publique de CorÃ©e'),
('›*¦unJ¡\Õ\rrÿÕ·¼','RÃ©publique de Moldova'),
('mMXF\ØEW­¤}ü˜Á5¨','RÃ©publique DÃ©mocratique du Congo'),
('CcŸnk0JX¸œj¿…`©\Z','RÃ©publique DÃ©mocratique Populaire Lao'),
('»Hˆ\rFX–jY{P\ÖZe','RÃ©publique Dominicaine'),
(']\Íÿ\ÍX\ÍM[¿2i·@NË‹','RÃ©publique du Congo'),
('&“\ã\Ï8–F†‹~q`vg8','RÃ©publique Islamique d\'Iran'),
('h‹º\ã\íI³£…l0\Ğ','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('r\Æ\íšsNV‡f\09&FŠl','RÃ©publique TchÃ¨que'),
('SCO¾¥£@7ªF“uM\à4\\','RÃ©publique-Unie de Tanzanie'),
('\õ±de„C*n{n[Z\Ì','RÃ©union'),
('l\ÏZJ‚¸¢Â‹Ú‹\Ş','Roumanie'),
('A¶«VT\ĞKi®…€KO±','Royaume-Uni'),
('\Ûe^ºrNe½\ã¿_Ã¡Y','Rwanda'),
('ÄŒ\Úp\ñG\èw£[\ğ\Ò\Î','Sahara Occidental'),
('ªvùŸù„Mß \õ\èŠx\÷—\Æ','Saint-Kitts-et-Nevis'),
('	¯ND\àIÌ¡Šy2…‡','Saint-Marin'),
('\Ú\õBrüşNT“;\Æ\î“_','Saint-Pierre-et-Miquelon'),
('›\ß-³„Kü‘B\ògH\Ó','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('*\åwûUJz£C/d|Jw','Saint-Vincent-et-les Grenadines'),
('\Ø#M\×@\\”\\\Úo*‘\"œ','Sainte-HÃ©lÃ¨ne'),
('ºŒˆ\ìRwIZ)~\ñ«w¯','Sainte-Lucie'),
('ùû¼nM‘¤=\Ë(-Ñ','Samoa'),
('rp\\U3\ÔLÈƒ*H\ÊL\\m','Samoa AmÃ©ricaines'),
('\Ñl\êeaA¸ƒR¡[ÿF\Ü','Sao TomÃ©-et-Principe'),
('Ó³\ó\ÆAO[»\Ém§ˆ\Ì\È','SÃ©nÃ©gal'),
('\è¯Õ£\îJA”\'›\Ç\ëXc','Serbie-et-MontÃ©nÃ©gro'),
('0­zXI_‰1$›\ßû\ğ\å','Seychelles'),
('*=,<a†C5 y™ü?²P','Sierra Leone'),
('‰Ë„z KÑ¦I5´X”n','Singapour'),
('A\ä\ÅrR‡@P¹®\Ö*›½\ó¼','Slovaquie'),
('\ê¦.tO™§lgSx\ç/L','SlovÃ©nie'),
('\à\öV`¡©Fy¯úq}>e\Ì','Somalie'),
('+•h	6]D‘„¤@À¾ù','Soudan'),
('‹Ÿ\Ò\Ë\ĞCÔ»¿¹\Çt\Ï','Sri Lanka'),
('U~•\ì`\ÕLzª</†Q\ğQ','SuÃ¨de'),
('\Ï\ãh\ä !B\öŒœ…\ìS|\É','Suisse'),
('\Ë¥( Gœx¼şq\æ','Suriname'),
('6ÿ\ö¾K\ñOc°\Èdÿ+','Svalbard etÃle Jan Mayen'),
('<_ ·BOú®\Å#J™\å ','Swaziland'),
('MT*\ÌûIN¼\É\âÀtş$\í','Tadjikistan'),
('\ğmbQ¿N:—gšbÄŸœl','TaÃ¯wan'),
('\È\Ó\Ï\ÊQ\ÉNÙ†aa\öEM','Tchad'),
('y`Z\ØŞ€BÆºjº»/B4','Terres Australes FranÃ§aises'),
('°¨\ã&.Ma’\årb•ü*','Territoire Britannique de l\'OcÃ©an Indien'),
(']Ğ§¥KoXŒ¬`\Ä','Territoire Palestinien OccupÃ©'),
(')L~°LR²]Á“ÿƒ','ThaÃ¯lande'),
('`Š\à\Ï\ÇIy©)µ\éª\ôƒ','Timor-Leste'),
('„}’\Ä%E6»`×˜\ÏC\ì','Togo'),
('„\"*d\æBz¿gl\æ™c\İ\Ö','Tokelau'),
('L}\ä\á<DY‘Á³±….','Tonga'),
('n—u¢NÇ\ó™$\ójU','TrinitÃ©-et-Tobago'),
('Ñ\æ–\Ü^D ‚‰9\ÂQş)','Tunisie'),
('Q\ç	”ndF\ó¾\r‘+\ĞÚ²\'','TurkmÃ©nistan'),
('4O•^×Œ@¿wMş E’\È','Turquie'),
('\ØC¢{Õ‘MVƒ¿ü†Á\Í\É.','Tuvalu'),
('›ıa\ëL\ö¦³‹ ‡µ\Ğ','Ukraine'),
('\î£Iy™>\é[\Öp!D','Uruguay'),
('>\"\ìıøEÙ¶R3–\ë‚@o','Vanuatu'),
('’\ö¤J¬µ¦\ì\ê\Ö@D','Venezuela'),
('d\ñZD\ÆIq†n|Q\Ò\å=Š','Viet Nam'),
('3Ç²IZxAJ”Ë¶^C­ª\Ó','Wallis et Futuna'),
('Æ‘Ä²x\Ë@İ¹\rù\Ì','YÃ©men'),
('45\ÆHÑµG0½rr|\í\Åbb','Zambie'),
('\ô\È\Zn\ËBÅ†@i\Û!O','Zimbabwe');
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
('DoctrineMigrations\\Version20240201152951','2024-12-15 20:34:46',2),
('DoctrineMigrations\\Version20240202084749','2024-12-15 20:34:46',2),
('DoctrineMigrations\\Version20240202150901','2024-12-15 20:34:46',3),
('DoctrineMigrations\\Version20240207105701','2024-12-15 20:34:46',2),
('DoctrineMigrations\\Version20240319212437','2024-12-15 20:34:46',2),
('DoctrineMigrations\\Version20240614133504','2024-12-15 20:34:46',11),
('DoctrineMigrations\\Version20240617165906','2024-12-15 20:34:46',9),
('DoctrineMigrations\\Version20240708061729','2024-12-15 20:34:46',13),
('DoctrineMigrations\\Version20240801202153','2024-12-15 20:34:46',3),
('DoctrineMigrations\\Version20240815153823','2024-12-15 20:34:46',2),
('DoctrineMigrations\\Version20240916065051','2024-12-15 20:34:46',4),
('DoctrineMigrations\\Version20240929091802','2024-12-15 20:34:46',10),
('DoctrineMigrations\\Version20241002164506','2024-12-15 20:34:46',7),
('DoctrineMigrations\\Version20241119144432','2024-12-15 20:34:46',12);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-12-15 20:34:46','root@gmail.com');
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

-- Dump completed on 2024-12-15 20:34:47
