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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',259.99,'2024-08-02',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',999.99,'2024-08-02',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',2999.99,'2024-08-02',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Italie',899.99,'2024-08-02',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1599.99,'2024-08-02',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'¾m2\Ü#M¿Œfh\Ñ3[¼','France',358.99,'2024-08-02',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Australie',1799.99,'2024-08-02',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1099.99,'2024-08-02',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\Ë#zO0±ˆj­q´s_','United States',199.99,'2024-08-02',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','¾m2\Ü#M¿Œfh\Ñ3[¼','New Zealand',49.99,'2024-08-02',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Italy',899.99,'2024-08-02',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Espagne',1499.99,'2024-08-02',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',1299.99,'2024-08-02',NULL);
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
('6Ln½\ØBÍ‡>˜\ô8¢','Afghanistan'),
('ÿ~~G\à†Zvûit','Afrique du Sud'),
('\ĞO™ E²Bwƒn\\2™\ìBv','Albanie'),
('\Ì\ô\Ô\ëp@{ª½\÷•ˆM[b','AlgÃ©rie'),
('[Š\íhŠG:…4!R‚x','Allemagne'),
('v\õ03—NN“\'a›_3\ä','Andorre'),
('\é\Ë>a¦BÌ· x•²7','Angola'),
('§_³5Ù“M=›g,9mÌƒ','Anguilla'),
('\õ\Z\ñ»[ˆMÒ”Êq\÷x\Ñ','Antarctique'),
('Ÿ\ö!¶!EU›\"ÂœCl(\'','Antigua-et-Barbuda'),
('bx~\å3\ëH\Z¦\ß6°™','Antilles NÃ©erlandaises'),
('½\êU)ÿBOß„§DŠ\rVS{','Arabie Saoudite'),
('e\Ï\â¶\÷xF¦¨\ÄgE¨\Ï9¤','Argentine'),
('YU\İ*‰”G½…\Ë\ÔgÙ›—','ArmÃ©nie'),
('›_\ZsG\çªE\Æ>şœ“','Aruba'),
('Â¦\Ûş\ÖN£dx/\Òw\n£','Australie'),
('\ZdwSA\Ò@»\İf¾H:','Autriche'),
('È¾¥|\ÔGÁƒ 	˜ûg','AzerbaÃ¯djan'),
('|°lXH\ÚM`“«n\åW›ş\Æ','Bahamas'),
('|°—	K8¾“–ûG#','BahreÃ¯n'),
('İ®#mI½Yº—','Bangladesh'),
('†c¨1Q|KJ°¤\Ô=j“–','Barbade'),
('z‚’§_H­QÙ¦Ğ‚…\ò','BÃ©larus'),
('cØ’wF6œ\â\äV!\ô{‡','Belgique'),
('…g˜øú\à@È¶s\ô®±EC®','Belize'),
('²\îW\êGo={\éV\×','BÃ©nin'),
('G<TE0‘¹8%X×ƒş','Bermudes'),
('\àYtt‰OÔ¸A\Íç€³Ÿ\ô','Bhoutan'),
('v‹\Ä~_KÊ®˜¨\érˆ','Bolivie'),
('ZG5e©²I:¬Œd	¼h\Û','Bosnie-HerzÃ©govine'),
('Å«\Ê¤\ÈJÙŒ¥\ÂsCg€','Botswana'),
('šs5tC\÷Ÿƒª\Í]\ä\ï\Ê','BrÃ©sil'),
('\ëÇ‰f‘\ÍE–¸‰’Î¨\ô','BrunÃ©i Darussalam'),
('À].…\ÂE‡>µ2ü-','Bulgarie'),
('\Æü0P3Kz 5¤‰\õ›}','Burkina Faso'),
('·Â¸†Ae=c|2…Œ4','Burundi'),
('\Ñ\Ä]ı\Ğ\ÒBœŒ\ZI„%­”','Cambodge'),
('\Z’J\ìGÖ‘¦¼\Ç\Ú\ç1\ö','Cameroun'),
('&¼TCw¡M/³g \ï\r\Ã$.','Canada'),
('\î~µKP—d®:\Í\é$','Cap-vert'),
('™=7\ò\ÍHm–‡OU†#s.','Chili'),
('„´@€\å„I¯º^jP\ÕÀ','Chine'),
('” Í¤8B´¡SV“+$j','Chypre'),
('l-w<Ô´F¶‡\î\Î\\pR','Colombie'),
('h³\İ8DAª¦\ó\Ä\Ïb','Comores'),
('4·\ôI•\ÎN<ÙŠü:·º','Costa Rica'),
('®_\Ëc{¼D8¬W6\ğÔ»+','CÃ´te d\'Ivoire'),
('ÅœaY{E\Z­Wùf\í\×p]','Croatie'),
('-\ì\ì„F–Mˆ\éü›Mwm','Cuba'),
('Ñ¸\Ñ\òFÀJ¨¯©k ','Danemark'),
('\ö\÷âš€Ci¤\÷À£#c\Ô','Djibouti'),
('F§F¥;\ÓH…¡fq;s‹Á','Dominique'),
('˜\Î1ˆ=ƒH¡¶\ÉÏ½V.4\Ü','Ã‰gypte'),
('‘¶\ÜJ)\ïA…¶µ`u$Ue¦','El Salvador'),
('²,ÕŠ£G§™‹:ú6\Å','Ã‰mirats Arabes Unis'),
('~qF¼“•Bk¤oşF¾Cq','Ã‰quateur'),
('lm\ê\Ò7¸C”Ÿ\ZjjG‡\ï¿','Ã‰rythrÃ©e'),
('\é\Î\áŒ?WIPª j°fÇ˜','Espagne'),
('a\Õ\Ä\n\Å\0DÆ‹?\nlH\\','Estonie'),
('R\â\å\âJî¢«(\ÓUE“','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('«Z\Ò\ÆGK>¿›d\ÅKJ›','Ã‰tats-Unis'),
('(U\ä:\ë>A3‰\Ø.y\ç=\â','Ã‰thiopie'),
('\Î\òı+‘B‰¹ˆe\"\Ãr','FÃ©dÃ©ration de Russie'),
('\0”»œ•E/‚}¤\Ü;\Ã,','Fidji'),
('\0]$ÅŠ¾H6±´O\Î{','Finlande'),
('OB ÅœDH»üX$i8','France'),
('C\Í\í\×\ÎM|¶Q¹\É\Ôwú¼','Gabon'),
('mr¶%\"\ìApª\Å\íœ\É#','Gambie'),
('pvqcJ”…\É1\ä€\åK','GÃ©orgie'),
('VGT[YÿG°\îz\\\òVl','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('¨BT\ïMB€†W`y”šN','Ghana'),
('.‚¬¹ÜšJX»sx#NŸ¬','Gibraltar'),
('ˆT‘\îs|H`–j\ï\r[Ç»','GrÃ¨ce'),
('T(\'\Ì\"pM_–IÀK¤\á\Õa','Grenade'),
('\Å=¾ \õúLü³;\ö6!°\Z','Groenland'),
('¬o ©\ÅC¾\Êÿ\İˆ¾\Ó','Guadeloupe'),
('Ùª\ê7\nID`¦‘ØœŸµd','Guam'),
('V\Ú\"—AKŸ\äÁq	}\"\ä','Guatemala'),
('!´\ÆVs\äA°‰Yœ\é;\03','GuinÃ©e'),
('Á`™\ÕBhµo\Ä+k¬\å','GuinÃ©e Ã‰quatoriale'),
('Ö•\õ\r.G\í„$\îNn\Z€h','GuinÃ©e-Bissau'),
('€Šş`FL®n(ÄŸş','Guyana'),
('\Z¢?ü‹[M\ó–Ì’N€o','Guyane FranÃ§aise'),
('bÒª\ÒcH¶±—·\r‹º>º','HaÃ¯ti'),
('v_8\Í%LGŒ=‡®6O','Honduras'),
('\Æ\n\ÑmG¦kC\ã\Éú	©','Hong-Kong'),
('<­@#\âI\å†\ñB¦ş…\Ó\ê','Hongrie'),
('œ¯½5À§Nù…œ½\İ-²\Ï','Ãle Bouvet'),
('\ö<\îTË‹FC…#\æ\ä·À','Ãle Christmas'),
('Î•\÷\ç9¿G¶‚¾s¯\Ã`4L','Ãle de Man'),
('G\İuE¸Dµ7UqEP¨','Ãle Norfolk'),
('Ú¬’\Õ\ZBJÇ³¤!\ë£','Ãles (malvinas) Falkland'),
('Iq;œûCGN®2\÷±)\\‹\Ï','Ãles Ã…land'),
('\åú‚|EŸI‘-a4¾£\Ød','Ãles CaÃ¯manes'),
('\ìA\Ú\÷\âºLµ\î\r!³\â2','Ãles Cocos (Keeling)'),
('\ÓN\Ú\óUNÔ·€{–~M[L','Ãles Cook'),
('›U\îûY¹K?Ÿ­o\ßZY','Ãles FÃ©roÃ©'),
('·\\³\ÂÚ»KE†.\Ég\Ø\ñ\ñ','Ãles Heard et Mcdonald'),
('d \ËÉO 7f®e;¯\É','Ãles Mariannes du Nord'),
('\0¬2\Ğ\ÍMÜ…û\ÉøµI\å','Ãles Marshall'),
('­$=©†4D¹Á\ŞS\ïnú','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('W4W\íP\ÉIÍŒú_ T\'','Ãles Salomon'),
('O\ã\ñ1G—\ğ|\á\Ü×q','Ãles Turks et CaÃ¯ques'),
('Lø\ñBzTDxaF]o¼yG','Ãles Vierges Britanniques'),
('\ó\õ´iŒ}@…\Ş\Ï)ÿ$Æ¨','Ãles Vierges des Ã‰tats-Unis'),
('¯QE\ÍH\õB*¾\ŞQJ¥Ïˆu','Inde'),
('«\× øXI^¨®L(6¹','IndonÃ©sie'),
('<\ò\Z¥\ì\ZK\ì¶6\ĞTz¹Ø·','Iraq'),
('\Z‚ˆ¨\í\ÏF\ëi®!]\ì¨','Irlande'),
('œ¬ ²\Ù\ãK…Š±±J­FH ','Islande'),
('¯\Ñy <tE“›µ_7','IsraÃ«l'),
('Á;\"\×G œA)Ú¥','Italie'),
('”¡\ïşF¶£\ó\ë6©','Jamahiriya Arabe Libyenne'),
('›n¤NgK¶€½\ÍB„\ê&','JamaÃ¯que'),
('¤ş‹ŒÉµJxœŒc\÷<>6š','Japon'),
('	8{GıE\"‚–p§‡Ì£<','Jordanie'),
('\Ï\ë¾(\åBc\í\æî›','Kazakhstan'),
('\ê9:·`…B”œÕ»\í\æøl','Kenya'),
('o{¦¿pÀNŠe\nÍ«\ã\Ñ\Ó','Kirghizistan'),
('ˆwKu1G×¬.\ä\"ªƒ°','Kiribati'),
('zN‚¯W<G•€ü~\É,H\ÂP','KoweÃ¯t'),
('ƒs\ÑKIL\ë©_\é^l\n³0','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('ƒs8¦iLL!¡?5‰\'','Lesotho'),
('<¡YFf\ÕAI¥\â=¨_’','Lettonie'),
('N´4\×\ğFfEƒ¡’ù','Liban'),
('€MØº‹\ĞA,½`«ytO¥','LibÃ©ria'),
('°pü1\ê\ÉM2±\É,´/‚','Liechtenstein'),
('K\Ş\'\ä\ÙNªA._\Ã\ægQ','Lituanie'),
('»˜w\Ô8I¤ûtVˆFe4','Luxembourg'),
('²ë‚‹1A0¡^+q<\ä¨1','Macao'),
('bx\Ü/\ïXM•¾dl¿ \â','Madagascar'),
('Lb}Dv¶\ğ\Õ\Ä4×­\î','Malaisie'),
('«\ËP\ÎÇŸL\\º¯a¦r3I','Malawi'),
('ÿ‚ƒ‡»ƒG#†‹\Î\ÑBR‡','Maldives'),
('no§À+‚AºbKi<];\Ç','Mali'),
('\Íw\å¼ÁE{ŒQÊ†cr3','Malte'),
('·\rh?¨OÒ¹t\Ô\ÎÏª\Ã','Maroc'),
('|}ª\Ù)1OÃŸ†µ/}E\ê–','Martinique'),
('«Iœ¦Z\ÓA…ˆ\İI\Z™”\ÕX','Maurice'),
('®úA\Ø\rHÃ©ü\é\ô³a¶\'','Mauritanie'),
('\ïL(\ó\ÖFA¨\é.¸\'\Ş','Mayotte'),
('.qo¨D\ãŠPˆµC\íV','Mexique'),
('oD\Ò5\Ö\ÆFÂ•\È,m\\ç‚‹','Monaco'),
('„(K\ÌKE¯!Y‘GH­º','Mongolie'),
(' d\ÆÉƒLgŒd#£y?\å)','Montserrat'),
(' ¹sX!H:¿½Ş	•F','Mozambique'),
('\è\È\Î/C¿§‡\Ğ\å\Ö¼k','Myanmar'),
('p(¶À\ó Iÿ°9ı\ì53Sú','Namibie'),
('L€v\ç}O\0¼g\ö\nî£¬','Nauru'),
('\á ƒ ûLO‡ºz\Ğ\'l\Û','NÃ©pal'),
('\ó’W¹Š8N´Ÿg\Z\ÆÎ®>','Nicaragua'),
('±\ç©pNM\n­\ñs|¥‹','Niger'),
('ú\ïz¡F\ö¸Ö¾Á\÷Uk°','NigÃ©ria'),
('ì ’œH\äˆ\Ü].ª\è','NiuÃ©'),
('|¿ı\ÛW\õE†ÅšŠQ=d','NorvÃ¨ge'),
(' ·²b\ÌMr‰LTl\Z\ß','Nouvelle-CalÃ©donie'),
('€k\ê…A¬B\óŠ´v\ó\î>\ë|','Nouvelle-ZÃ©lande'),
('Z4ª\Ü\Ò\ÊD\ã«\ïÇ§\ôO+\ğ','Oman'),
('º‚¯8Å IC©\'“¯8$','Ouganda'),
('”1W|vN¥­şfeÁ\Ì','OuzbÃ©kistan'),
('W\â\ÕÎ—µB‡\ò\â\é\å<hx','Pakistan'),
('Á$\Ê\'\0\ÂK ‰lş¨x·','Palaos'),
('¨`•\ÔMSŒ7\Öü\î¥','Panama'),
('#š¡V\àG¥˜k\å¬Ê›J9','Papouasie-Nouvelle-GuinÃ©e'),
('\à\Ù<\ğgJ+ª?*\ã\ÑC¿','Paraguay'),
('C_P&UFFšn]\ß«','Pays-Bas'),
('·‰bE\î§S³º\í','PÃ©rou'),
('Ídg†G›¿W‹\í\Ó\0W','Philippines'),
('×·u\âTE:®+ş\'Á	¬','Pitcairn'),
('\Ğ Ó’qPK”¯\\(”b‘	p','Pologne'),
('(\Ø7I^²\Ñ\éx×›\õ','PolynÃ©sie FranÃ§aise'),
('ŒCiB7\ÄJ`…\É\"v\ê,F\Æ','Porto Rico'),
('C \0½L‹qm)hú','Portugal'),
('y0³´L\ë©{şL\ßÍ¢o','Qatar'),
('&\ï\ñ®B©DœW\ì[>\â\ó','RÃ©publique Arabe Syrienne'),
('’-1KüGŠ£VIC@»','RÃ©publique Centrafricaine'),
('U,67”Bs·”«!* \í','RÃ©publique de CorÃ©e'),
('j6®?\ÌüKe¤\É´5)µ','RÃ©publique de Moldova'),
('ºcL²7\rJkŒYWr€','RÃ©publique DÃ©mocratique du Congo'),
('\÷UJµOL—¯É›6Ş2','RÃ©publique DÃ©mocratique Populaire Lao'),
('œ\ôp_\Ï\ÑI©ƒ\Ş<Î¾8','RÃ©publique Dominicaine'),
('&–>’¦¨GqŒ¿\á\ã#hZ','RÃ©publique du Congo'),
('\ó–%¨z\É@ª›ª@v¿–\Ù','RÃ©publique Islamique d\'Iran'),
('*\ğdAù¾$8\È\Ø\÷ûH','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('(jü@\æ8@ç› pÀ¯ø\È5','RÃ©publique TchÃ¨que'),
('\è4\ë\ÄAJ\ï¢\Ñÿ‰ƒ©','RÃ©publique-Unie de Tanzanie'),
('ùhƒK\Ô9B³ÿ‰b¸¢ ','RÃ©union'),
('\Ã)Á³l¿K¨”Y\Ú\İS\Îp','Roumanie'),
('»Y\Ç\÷[Bc³:¼`Xp','Royaume-Uni'),
('uLµ%DG«´}€™[$\î','Rwanda'),
('\Ïi´Cø’H^€ëuª—','Sahara Occidental'),
('@\ß\Öq\Ì0L:¦\'ı)\Â','Saint-Kitts-et-Nevis'),
('Œò¢•¾OÜš\'ş”uŒ','Saint-Marin'),
('²[şƒZ˜K\0¹\ÆU¬f\Ö·','Saint-Pierre-et-Miquelon'),
('G\àh\\\ŞM|´œ\ä?–3','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('#\Ú^ß—WKRƒ¦Ğ«¿\é','Saint-Vincent-et-les Grenadines'),
(';iÀ½Hš±‘X­]<\Ö_','Sainte-HÃ©lÃ¨ne'),
('™¢_¼3Fú·df;*/›','Sainte-Lucie'),
('¹\Ê,GûKÕ •§et(h','Samoa'),
('£µCƒ$À@=‚’\ğzû«u','Samoa AmÃ©ricaines'),
('>—x±:5L\í±\n>\n¤·•','Sao TomÃ©-et-Principe'),
('İ¹Å¬šƒHi¹­İ¼@²I\à','SÃ©nÃ©gal'),
('P£\È+#\ãFÀQf¼$\Óm\Z','Serbie-et-MontÃ©nÃ©gro'),
('_·	¨ş\ÛFDo{^“l','Seychelles'),
(':\ê¿\'KM^Ÿ?¢¾º“\"^','Sierra Leone'),
('*§\r§\ìM ;\ñÏ‚À4','Singapour'),
('\í9°şF>¿º	*ˆ\èD¿','Slovaquie'),
('\Ïo\éxqKÄŠ¬k>`Üº­','SlovÃ©nie'),
('œE\æq¶QOØ…AÃœG\â\\','Somalie'),
('Œ6R\ñiK`€\'–ˆ„Ş¡9','Soudan'),
('v\îMjÁ@Zƒ’\Ö‚\ì>','Sri Lanka'),
('&¤¤\òuC\"¶– Hw—\Ö','SuÃ¨de'),
('ûk2Í–EH\á‘\Ü>“|\ë\r`','Suisse'),
('\ÂDM·E[µC\ÚB6\'\íG','Suriname'),
('|Z\Ú\ÂN—HÛ¸p¸‰\Ğ\Ï\Ñ','Svalbard etÃle Jan Mayen'),
('! H^=GÅµ‹\×msÜº§','Swaziland'),
('×—qÿlfO–’ ¯¬L\Ï\ö‘','Tadjikistan'),
('€ÅŒ\ñ+DEˆ~ªÖ–\õW','TaÃ¯wan'),
('u~\èíŸNÂ‘½ŸŸ{hK','Tchad'),
('¶\î¦Ş>Ne‰\ã\Õ+\\i+ş','Terres Australes FranÃ§aises'),
('PP¨A¹›\Åq\í	¢','Territoire Britannique de l\'OcÃ©an Indien'),
('@2\ôú­O²‘0´¾$\å5','Territoire Palestinien OccupÃ©'),
('\Ã5o¾YJìª–\Ğ_\ç\Øş','ThaÃ¯lande'),
('ˆ\0€\ÂMØ²š\àoV\ï','Timor-Leste'),
('½&p\÷`VFŸúZ\ÖÏ¤','Togo'),
('\'[\r`´LƒµB8\ÃXlQŒ','Tokelau'),
('bj\n\ò“H´„?<–m9[','Tonga'),
('G\áz\ğCM|®=¬™ú­\ÓF','TrinitÃ©-et-Tobago'),
('Ú™\Æ\÷›\ÊFj”Ú•¡\í\ßFa','Tunisie'),
('£\r$\Ø\ğ@…‰“lC\ã­','TurkmÃ©nistan'),
(')g•0\ãI}©u·e†¢s','Turquie'),
('l­¥¬@<ª\ö¦\é‚W\Ğ/','Tuvalu'),
('~Ì¼¿Í²M²(8IÉ·Ì´','Ukraine'),
('F\ÕÀn£gI°‰€\Ì\Ç0\åL','Uruguay'),
('\Ò\Ãi¬k¡Mw«•\0fn\Ø#\Ö','Vanuatu'),
('iB \ÑFZ„\Ò\Ø=\Ùz\ÉD','Venezuela'),
('ºı*\':N•\Í6\"„\ß','Viet Nam'),
('BXc©ƒ\ËLµ€.›¦Uşs','Wallis et Futuna'),
('\êS\ÒWa.J_­m#\ñ(\Éı','YÃ©men'),
('(„\Ë\nMLİŸ\ï\èu0','Zambie'),
('-Œ\õË¯I\ñ¡\ñ’@B','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-08-02 19:19:31',3),
('DoctrineMigrations\\Version20240201152951','2024-08-02 19:19:31',3),
('DoctrineMigrations\\Version20240202084749','2024-08-02 19:19:31',2),
('DoctrineMigrations\\Version20240202150901','2024-08-02 19:19:31',2),
('DoctrineMigrations\\Version20240207105701','2024-08-02 19:19:31',3),
('DoctrineMigrations\\Version20240319212437','2024-08-02 19:19:31',2),
('DoctrineMigrations\\Version20240614133504','2024-08-02 19:19:31',12),
('DoctrineMigrations\\Version20240617165906','2024-08-02 19:19:31',8),
('DoctrineMigrations\\Version20240708061729','2024-08-02 19:19:31',12),
('DoctrineMigrations\\Version20240801202153','2024-08-02 19:19:31',3);
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
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitation` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `tasting_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `target_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `sent_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `link` longtext NOT NULL,
  `STATUS` varchar(10) NOT NULL,
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7','\É5?0O¤…€)\\¦ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending');
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
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
INSERT INTO `tasting` VALUES
('.¥l5‹¹LnšI½y\Å\ñ7','™d\å9ÿF³œÿ\Ö\Ñ¸·','^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]'),
('–J<¸_½Fx¥\Í\ãqÀ§\"','™d\å9ÿF³œÿ\Ö\Ñ¸·',')R1„ú\ÎN…‚7\ÍP\î','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]');
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

-- Dump completed on 2024-08-02 19:19:33
