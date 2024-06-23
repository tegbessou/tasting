/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv_test
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-ubu2204

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
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `name` varchar(255) NOT NULL,
  `estate_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `grape_varieties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`grape_varieties`)),
  `rate` varchar(2) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `owner_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `country` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `saved_at` date NOT NULL COMMENT '(DC2Type:date_immutable)',
  `tasted_at` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)',
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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',259.99,'2024-06-23',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',999.99,'2024-06-23',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',2999.99,'2024-06-23',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Italie',899.99,'2024-06-23',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1599.99,'2024-06-23',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'¾m2\Ü#M¿Œfh\Ñ3[¼','France',358.99,'2024-06-23',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Australie',1799.99,'2024-06-23',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1099.99,'2024-06-23',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\Ë#zO0±ˆj­q´s_','United States',199.99,'2024-06-23',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','¾m2\Ü#M¿Œfh\Ñ3[¼','New Zealand',49.99,'2024-06-23',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Italy',899.99,'2024-06-23',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Espagne',1499.99,'2024-06-23',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',1299.99,'2024-06-23',NULL);
/*!40000 ALTER TABLE `bottle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
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
('f[µ\ÓM ¾N”Ov©\Ë\ê','Afghanistan'),
('\êU¶fC\å@½2F7GFe`','Afrique du Sud'),
('=º\ÙtL`C}‡¸\ÙH\'','Albanie'),
('†\ñ\×ùŒO\îŠt”û^2X\è','AlgÃ©rie'),
('\ñ9\ğ¬7\nAU¤Xê¬°‚','Allemagne'),
('f=\Ì\"«\ÎIa›ù\è@S±\Ü','Andorre'),
('z[¯YNª‹3{\İ\Ñ*}†','Angola'),
('¦yfO…K`ƒ\ğB_9\"m!','Anguilla'),
('5\í*{=F,±\Ş\å\Z\â\çœ','Antarctique'),
('\Ç\"Q«\'\ÆD±ˆ³\Õwnz','Antigua-et-Barbuda'),
('†\"\óÆ¬LV«¿¬ÁR`œ','Antilles NÃ©erlandaises'),
('‹Ku¢jDz‚­¬','Arabie Saoudite'),
('i»XTjIù•w·³‰K\Ô','Argentine'),
('.\ÜÇ›\ÉTJqY\çşbc\"','ArmÃ©nie'),
('sû¬2ùÁCú˜<¯·\'\æ/ÿ','Aruba'),
('ı4\à¨4@•x_s\ÕÁ\æ','Australie'),
('\ØÁ\è‰D\ò±!3øšdzF','Autriche'),
('’ø.˜lCh˜(A.\æ>\ë','AzerbaÃ¯djan'),
('%k–¾\Z\ÌG™ÀC”¬\ã§!','Bahamas'),
('5}wŠ)H²6­zA>¶','BahreÃ¯n'),
('Œ†\È\ÒJV„”\â\"ık”‚','Bangladesh'),
('1\ÜÁn¤šNÛŠ7\Ùg¹\Ä','Barbade'),
('q\Ú7\ö¶\æLÆ•%¸·\Ä\Ó\Ö','BÃ©larus'),
('¹\nEiG•­\ò2şT\êp','Belgique'),
('ªºY\rÈ•L]“S\Â1¥¤…@','Belize'),
('û\å\ö\İ\ÆMz’»\ZK\â|T¼','BÃ©nin'),
(';\ë\ê\è\ÎRAÃˆ\è\íY\0#\ê\ç','Bermudes'),
('›\İL*\ÉC]¹\ö‰Áé»½¬','Bhoutan'),
('‘:A\ä¯\Ô\Ë4Q$z','Bolivie'),
('@\õ\Îu­¿I‚»©\0r','Bosnie-HerzÃ©govine'),
('\Zg½\Z«Nãƒ©Ÿ\\Y\ğ\Zü','Botswana'),
('\Å\Û\Ô+\óE*„\ä<\ğ\ì\ç','BrÃ©sil'),
('‡\ì2\rN—«\â¿ûZz$','BrunÃ©i Darussalam'),
('oÿ©ˆjG=Š»¯}\é¹\ßK','Bulgarie'),
('P\Ö<xM*º\ë¬heZ','Burkina Faso'),
('\Ùz»CnHØ›ƒšş`s','Burundi'),
('šL(!!LÉ‹\Ò)H¶#øG','Cambodge'),
('Qÿp?\"Cf®/#a°\ë','Cameroun'),
('HHŒ\ó\ßCË‰Q®N\ë','Canada'),
('*@´\ì\ÂF™ û\Ñ\ë\Û\nŸ','Cap-vert'),
('\ØbH\ã+\èBÉ© f\\°\ìš','Chili'),
('Rb\0BM‘3lŠIÏ°|','Chine'),
('\ç\ãjm \ÛB«\äi%\"\Ú\Ì','Chypre'),
('4³’ƒ8_O\ãŒ.ÁUi5','Colombie'),
('\ã\æ`ÆŒ@V©”6S\ä\Õ','Comores'),
('ÿ;p?‰E\ô²fq\\‹5\Ï','Costa Rica'),
('\â\ñk¾Û¡DŒ‰Q\Ë\Ø1û¡¾','CÃ´te d\'Ivoire'),
('®>“\ôW\óD-¡³qªhmcT','Croatie'),
('¹h\ö\Ğ\Ö^A£²0\r•\Å\åT','Cuba'),
('§a.\çfBL¦±K\Óú?AOœ','Danemark'),
('\ã&Œ\ã©\ÉJ¹«5İ€\òJ','Djibouti'),
('\à&¥Ñ„[DÔ½\n\ñ@7°\æ„','Dominique'),
('\'³¤›5kG«µ\í==”\à9*','Ã‰gypte'),
('\Öš\ÈnJÆµGK\Ä	','El Salvador'),
('CÈŸ\ôItˆ\Çke\Ğ\ß{ı','Ã‰mirats Arabes Unis'),
('#Y­H= IÃ„Y\è-¦9µù','Ã‰quateur'),
('\ÉZ­,š\îG»§Â§ûO\Ğ0','Ã‰rythrÃ©e'),
('\à¥,XL\Õ@d…\r%™a\æZ','Espagne'),
('o×‘?KÚlÁı™m','Estonie'),
('Ò’®ºÚšOj x4Ğµ†¼','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('\ï;\ë\È\ÑE	†sS¨\áA','Ã‰tats-Unis'),
('_@\ìşpBŸ£pE\ÅÔ\÷','Ã‰thiopie'),
('\Ì\ë\ÕD;H×”\î•‚²','FÃ©dÃ©ration de Russie'),
('†™·‹–aHØ– ¡%\ì\0','Fidji'),
('\Í	‘#Ko¶.\'\ÛY2B','Finlande'),
(',•\ëA@‰Z\Ú\ğ\Z_','France'),
('h³RLGŠ|kFQ»o','Gabon'),
('d(W~}Fb’£q®\à¦','Gambie'),
('\ìtR»¦LMX²\ç_ŒÄ½a‚','GÃ©orgie'),
('v.$\àD3­\åÓ~cı\æ','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('‘\ág<L\æ¹b£MÛ‘','Ghana'),
('p\ßı¨L{¶¦mWZ','Gibraltar'),
('ıÅkv-@¬¢¿«^R\í\r','GrÃ¨ce'),
('\Ã\Î\Z›¯CMŸ¿`\ÊC\ZW','Grenade'),
('{YL¡a´Nß¹\Îtv[„•','Groenland'),
('kwP7®H§‹zx\ï\âŸü\ß','Guadeloupe'),
('!¡¯[€RB/´Cj¤\õv\Ó;','Guam'),
('\Ø}¸/*vMP”§i[T\ô\Ë','Guatemala'),
('¨3bgM×‰3³o\Ï','GuinÃ©e'),
('=¨L\òªELh“\Ì@@»^\ği','GuinÃ©e Ã‰quatoriale'),
('\"%\ğ\Û\îJú²°\ö±€{\ó\É','GuinÃ©e-Bissau'),
('\nL¯Û³HÃœ/\ãTn@\ë\İ','Guyana'),
('qY16J-±$ùr\ñJş¼','Guyane FranÃ§aise'),
('\íKp+‹LS±\à*Ù´5\Ë','HaÃ¯ti'),
('\Ã!`\ñ¸gE(°ş´”tš,E','Honduras'),
('\ñµÀ\öÿ˜Nˆ‰;TH\äÅ±%','Hong-Kong'),
('°/\Î$>#F×¼™sû0\ö:','Hongrie'),
('‡\"n\n2GÀ®§/c•=\Ù','Ãle Bouvet'),
('A,€&J†\îW¨)¬ˆ','Ãle Christmas'),
('\Å|c\ì»#A¢[QwE°\0\"','Ãle de Man'),
('y B<BÜ©\Î\Ø\Ã\Ş*Æ','Ãle Norfolk'),
(':d¤!¢GU‰CË³PO','Ãles (malvinas) Falkland'),
('<ÎŠY°CP¥B†vf.','Ãles Ã…land'),
(' ›¸½KÜ’r+³¹Ej','Ãles CaÃ¯manes'),
('?g6\ä	G Š\Ã\ãPûj”¨','Ãles Cocos (Keeling)'),
('qXt¼cEÍ­\âV”<k','Ãles Cook'),
('m\àş\0uK–®G$«¢~','Ãles FÃ©roÃ©'),
('ı»Dˆ @À§°‹\òİ˜Y','Ãles Heard et Mcdonald'),
('2\Å\ß{\ÔKØ~|0D/\ë','Ãles Mariannes du Nord'),
('€\í\íV…ÁN³$$£\Äx\Üz','Ãles Marshall'),
('³£=zW@‰O]ı\ì­ü\Z','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('|\ÆÙ³SKû„«–}@$^b','Ãles Salomon'),
('„\â@V\ÃÁEŒ(\ñ\ßÁa','Ãles Turks et CaÃ¯ques'),
('f¬\0l‹Nã’ª‘(øu','Ãles Vierges Britanniques'),
('Í›e\î‡8M¨¦ˆ\é','Ãles Vierges des Ã‰tats-Unis'),
('\èCŸ+.A¹p\õzùº\å_','Inde'),
('icĞ†P‹DÊºR\Õ3°³%\ï','IndonÃ©sie'),
('{5{\ãN ˜\ÑÜœ­û\î','Iraq'),
('I\Ş\áXKD¢\ã\îv¹Ã»\ñ','Irlande'),
('’hx\År\ZDH¬\äwf\æ\ß,ø','Islande'),
('ae+\Ñ\ÃA)‘_-aK\ñ \ò','IsraÃ«l'),
('²ÿ\Ş+ıL*¡ÿd¥\ó\Ø','Italie'),
('Q\Ê\ÅZ\ëK20†û\êÇ‡','Jamahiriya Arabe Libyenne'),
('Fµ:§\éwL‰¤„-mZš','JamaÃ¯que'),
('m 9‰\ÏEFŠ\n2²$ù¹','Japon'),
('\\°B–\×XGq¦¹n\ÖJ*~','Jordanie'),
('ù›µŸ{G\0¤	c¸\ÉJR','Kazakhstan'),
('ˆ\î§\à¦L›ˆ+ \ß~:%¼','Kenya'),
('ˆúŒ\ÚF=›M!2…û¢','Kirghizistan'),
('¾ú\ZÊ¯H\æªËüµ°\êA','Kiribati'),
(']ş —\"\ÆLPŸ7\Ú\ö1–\ìz','KoweÃ¯t'),
('5ƒú9¥I7½t;n‹\'»','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('N¤O¼YE\ò¶xR¸\r\ôz!','Lesotho'),
(';\0A‡•BI‹¿B\×\íF¶‚','Lettonie'),
('?\ï•|\ĞH\à´e	(IÆ','Liban'),
('³\ìQ\×$K¦¾\÷ƒ¡\æ\Z¶','LibÃ©ria'),
('\ë ş\'+\ÕLqŠ& Jf\÷','Liechtenstein'),
('b\ÏÍ¤F4”\Ç\æ”\ò…\Ä','Lituanie'),
('\Ã+Oş\ğ\åK¥¥…\ò\Óûb','Luxembourg'),
('B­\nıP•A\ê‚F¡3\Øx\è-','Macao'),
('\ã\ï	\ç3°Bq~“ú‘š','Madagascar'),
('*}Iüe!Gsù\ì²g;µ\0','Malaisie'),
('!Œm\ô2KÌ•Ûwµº¨','Malawi'),
('ûıp\ìGA«IŸˆŒª<','Maldives'),
(' ø³u\ê)OH¯’g\à­øn³','Mali'),
('e\âL·\Ü(şŠ}B','Malte'),
('²º»\r¶@»´\Ö]k\'\Ï[\è','Maroc'),
(' X\Ó7V«@Ú³¾*\áp:','Martinique'),
('T\õz¨Gì³´\Ô\ö\n˜{°','Maurice'),
('	³\'b\ĞjAH£%š\Æ\ÃD','Mauritanie'),
('\ÓO\ØwH8Ln³Ï\è{»	','Mayotte'),
('M‰p\Z\ÈJ ®±üM–-R','Mexique'),
('µY\\`SŠM¾‹ş5	\ğ;»?','Monaco'),
('k\ãÚ‡\rOXƒ6ÿƒC\è\ç','Mongolie'),
('¦C·DŠ\n@P‹M¬[§f¹\\','Montserrat'),
('\Ü\Ì=˜\'C¾µ#<\Û\Ï\Ô\Öt','Mozambique'),
('8zZ1\ÈC¤©]‡mz\ó”M','Myanmar'),
('\Ä\ÕP8a­L^¼3§\Ã \Ä~','Namibie'),
('\ÑP\Ö\×JI»\Ç3ÛªJ¬>','Nauru'),
('3,ş\Öÿ(Nr‡\ñ\ô\á\'©!','NÃ©pal'),
('¨¿¥ÙˆHB£Or&¸m\Êv','Nicaragua'),
('¢x$\êEÆŠÿ³fº}','Niger'),
('O¹\Z†Z	FD\ôo©¢ƒ«','NigÃ©ria'),
('I3yeLJ’\éT{‚S','NiuÃ©'),
('+\ÈI“J!³!…Ÿ.','NorvÃ¨ge'),
('§î¨¥\'@z°³H´Ea','Nouvelle-CalÃ©donie'),
('\ÊB_µ|O\î˜?Á­Ø¦¢´','Nouvelle-ZÃ©lande'),
('*\íVİ…¶EÇ¯²& Ü‘ƒ','Oman'),
('+ª?\ï\ã“@¥Vhƒg\İ','Ouganda'),
('Œ¾88IŠ„\\|š¤¨Á','OuzbÃ©kistan'),
('`\ïWQ½|BÅµ4\îYD\ç','Pakistan'),
('C\è<‘­…O4ˆ\ã‚\Ä=','Palaos'),
('‚p6ƒCÄ¬“q>y','Panama'),
('$1\á\ÛK3’VTø«˜¿','Papouasie-Nouvelle-GuinÃ©e'),
('`œ\æ*|FFbŸ	c¼^‡\Ø','Paraguay'),
('qÜs\çZF5¤\ï\î,\ècŒ','Pays-Bas'),
('L½\Õ\Z\ÅMÂ†	w$±ı/','PÃ©rou'),
('ˆ.<˜|@½C}0šy\÷','Philippines'),
('Õ£¨`\ÖeAü‹¨\Í\0ŞÅ«','Pitcairn'),
('\ÓµB˜vEB­\ÊrÿH¥—	','Pologne'),
('¬ \Êİ¬rHÛ‡|C\ÖD,M^','PolynÃ©sie FranÃ§aise'),
('\İ-B‚¡N)†¢\÷\Ë\Ë=·','Porto Rico'),
('„\Ò\æ\0;Iş±+¤\ï\n£)','Portugal'),
('U\ñ§\öµD×™!$GÔ½\æ','Qatar'),
('±lig)M×ºvÖµ\ÂG^j','RÃ©publique Arabe Syrienne'),
('–\Ú\Ó1fN¶\õ\Õ\ØØ´F','RÃ©publique Centrafricaine'),
('\ìˆ:\É\ß\ÎAŸH3\ãı\æ5','RÃ©publique de CorÃ©e'),
('ú>Ó»yO»üE±\ôG§','RÃ©publique de Moldova'),
('BYX\÷‘ŒEg¿¥¾s\ã.=','RÃ©publique DÃ©mocratique du Congo'),
('œJ\Z\â\ĞE\ñ£Gû^\ÏB','RÃ©publique DÃ©mocratique Populaire Lao'),
(',q„y<\ôIŸ§¤¹£','RÃ©publique Dominicaine'),
('\ğ0{±\ó‰JÍ¿\ÏS\è\Äk','RÃ©publique du Congo'),
('kK«\Ô=H˜¾p\Zzk	Ö†','RÃ©publique Islamique d\'Iran'),
('C]fV9D\ó›\Ú\ĞBm‘\Ó','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('Ä„7’EIÿ¯{v\Ö\İ|~D','RÃ©publique TchÃ¨que'),
('°°[¥”oII¾ó¶›¦\é','RÃ©publique-Unie de Tanzanie'),
('€Ì©šKŠH%·d2²¥V','RÃ©union'),
('\ç¦;aNH\å\Èg;\î\"\Ã','Roumanie'),
('?\'\õ\È0KÿŸ¶4\ğhmS\Ü','Royaume-Uni'),
('„k<3FÛ¤3ºÀ\Ñ@V','Rwanda'),
('NA\×û†_Bf¡j#\Õ1<,','Sahara Occidental'),
('Ñ¦\áœ\'qMZº¹›?˜¼\Â','Saint-Kitts-et-Nevis'),
('+°	T4F\ô¨\Ì>›^kZ','Saint-Marin'),
('\n\Ì{M\Û!I¹†ù\Ò\'Ÿ»ˆA','Saint-Pierre-et-Miquelon'),
('w N\Ø:¢CJ‚şJ¶[ª','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('\Ë6Z*jC×n\n~xS‚','Saint-Vincent-et-les Grenadines'),
('\Õ\Ş\öKhB\í¨/ ª—\÷G','Sainte-HÃ©lÃ¨ne'),
('’\Ú)‚@ßŒÇ¤LRƒ_”','Sainte-Lucie'),
('l}ù,\æ@¢™\Ğ5’i-QH','Samoa'),
('-\ì\ÖÒ·–Cb’\å_—C´','Samoa AmÃ©ricaines'),
('\Ô?”Md¯LŒ³VA\ÖMûµ=','Sao TomÃ©-et-Principe'),
('Su}’@Ç®Q²š€','SÃ©nÃ©gal'),
('E°2\ËN\î±t¤_\á¬\áÿ','Serbie-et-MontÃ©nÃ©gro'),
('\íYB› ºJ\r†ıqS;`•\Ø','Seychelles'),
('¿h\ÄWWFÉ°)*S\"\ğ','Sierra Leone'),
('¤—l’\ÇL©·\ô•:«|\Ğ','Singapour'),
('ù\ô…Gy¦4\í\Ò+\Ê','Slovaquie'),
('ø’\Ã?}§AÎ¢\Û\ïSR$›','SlovÃ©nie'),
('\ó”\Î|¢B!£aF\r£\Ïu','Somalie'),
('´\Ê(#\ï\ËI´²ü\Ô\Ø+ø°d','Soudan'),
('2y\ZHlKH+¼\Ëx\ñ‚\÷	','Sri Lanka'),
('ˆhı\âE\ê´*\×h\Â,©K','SuÃ¨de'),
('\Ù6\ÛÁ£rN\á„U5ª\ç\õc','Suisse'),
('n.\ğ¿QJë¯ƒş\Í$\å¬','Suriname'),
('\ö% v\Ê%Bû®\î€C\ß9B','Svalbard etÃle Jan Mayen'),
('ˆ¿ªadqE%¿ÈfK#‰','Swaziland'),
('I„;Ş³KI®şŞ¸K4ûP','Tadjikistan'),
('.G¸VLšµ³•©|?\Ç\Ø','TaÃ¯wan'),
('%&3«N©®%\Õ\Ê=y¬','Tchad'),
('*‘\ÜbE~¼†ˆ’[','Terres Australes FranÃ§aises'),
('\ô–#\ãÈGµH\ñoI\Ñ\á¡','Territoire Britannique de l\'OcÃ©an Indien'),
('\ËBNÊƒ¾Z«F¦\İ','Territoire Palestinien OccupÃ©'),
('–Ûœ\nºF$ M\Ã:‰[·','ThaÃ¯lande'),
('½\'ª MF¤rq“·\÷c','Timor-Leste'),
('‘œ,!\ÄK¤›µ}^µ','Togo'),
('¨Ş»Oi¸?z¨G\r H','Tokelau'),
(']<\n\r.KLQˆÑ‡¸¢“o','Tonga'),
('‘ûH›\ruLÖ™T‰šJ.','TrinitÃ©-et-Tobago'),
('o€\"«WVOĞ“*±Q©\îk·','Tunisie'),
('¾_ùC¯ Dm·–úb\ç}‚\ô','TurkmÃ©nistan'),
('5t¦\âEb‰+È˜€8\Ê\á','Turquie'),
('€8W°ÿI ‡©¤\\_Bdn','Tuvalu'),
('[2Jn—5C¶‰úSUbR’','Ukraine'),
(']\å\ÒX@J±Mq\ÔM±†ø','Uruguay'),
('G\ß;z<A\á\Z•¿%\æ6','Vanuatu'),
('¯´XM–?H‹¤7¨€(Ï˜\Ş','Venezuela'),
(')±o\È\ËG\ô–¸¬{/','Viet Nam'),
('¨\î3eQM”›\èBûú#','Wallis et Futuna'),
('\é\é\'A¦•\ï+\r\ÎDc','YÃ©men'),
('T#&B•¯¢—\Ş”\Ú','Zambie'),
(')ùŒk\ÂHU¶#\Å6ı¦s\Ö','Zimbabwe');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES
('DoctrineMigrations\\Version20240124155119','2024-06-23 19:14:19',3),
('DoctrineMigrations\\Version20240201152951','2024-06-23 19:14:19',2),
('DoctrineMigrations\\Version20240202084749','2024-06-23 19:14:19',3),
('DoctrineMigrations\\Version20240202150901','2024-06-23 19:14:19',3),
('DoctrineMigrations\\Version20240207105701','2024-06-23 19:14:19',3),
('DoctrineMigrations\\Version20240319212437','2024-06-23 19:14:19',3),
('DoctrineMigrations\\Version20240614133504','2024-06-23 19:14:19',11),
('DoctrineMigrations\\Version20240617165906','2024-06-23 19:14:19',8);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grape_variety`
--

DROP TABLE IF EXISTS `grape_variety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grape_variety` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
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
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
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
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
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
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `owner_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `bottle_id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `participants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`participants`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_73621810DCF9352B` (`bottle_id`),
  KEY `IDX_736218107E3C61F9` (`owner_id`),
  CONSTRAINT `FK_736218107E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `participant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasting`
--

LOCK TABLES `tasting` WRITE;
/*!40000 ALTER TABLE `tasting` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
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

-- Dump completed on 2024-06-23 19:14:20
