-- MariaDB dump 10.19  Distrib 10.11.7-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv
-- ------------------------------------------------------
-- Server version	10.11.7-MariaDB-1:10.11.7+maria~ubu2204

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
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `name` varchar(255) NOT NULL,
  `estate_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `grape_varieties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`grape_varieties`)),
  `rate` varchar(2) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `owner_id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `country` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `saved_at` date NOT NULL COMMENT '(DC2Type:date_immutable)',
  `tasted_at` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottle`
--

LOCK TABLES `bottle` WRITE;
/*!40000 ALTER TABLE `bottle` DISABLE KEYS */;
INSERT INTO `bottle` VALUES
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',259.99,'2024-04-10',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',999.99,'2024-04-10',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',2999.99,'2024-04-10',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','\îo;ÔˆC¾±ı½\Ë\nl','Italie',899.99,'2024-04-10',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','\îo;ÔˆC¾±ı½\Ë\nl','France',1599.99,'2024-04-10',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'\îo;ÔˆC¾±ı½\Ë\nl','France',358.99,'2024-04-10',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','\îo;ÔˆC¾±ı½\Ë\nl','Australie',1799.99,'2024-04-10',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',1099.99,'2024-04-10',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','\è˜NE\ÍDÔB\õ\Ä\æ½a’','United States',199.99,'2024-04-10',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','\îo;ÔˆC¾±ı½\Ë\nl','New Zealand',49.99,'2024-04-10',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Italy',899.99,'2024-04-10',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','\îo;ÔˆC¾±ı½\Ë\nl','Espagne',1499.99,'2024-04-10',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',1299.99,'2024-04-10',NULL);
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
('jo{µŞJÌƒ*!M•\ñA','Afghanistan'),
('<vL\ìµK¬K•/\î\ä<G','Afrique du Sud'),
('®U«Ç¤Gç£ŸÀ\àş\Zz','Albanie'),
('Fš\÷\\`I¡y,/Œ','AlgÃ©rie'),
('ŠR\ä\Ë-KÃ´\\Œ&xC','Allemagne'),
(')Uú¨¾D™œ·Û¸D\ò\Ï\Ë','Andorre'),
('\îù\Î\ËB™mM\"','Angola'),
('\îv\ÛÀ‚¸IÀ®P¯¬BškS','Anguilla'),
('n*;­\ÉC?‘u®·’c\"$','Antarctique'),
('œ\ß)H\ï(W\'U¾<','Antigua-et-Barbuda'),
('¿D\á\äÃ¡A>­¡\ì\Î\ÊC\é.','Antilles NÃ©erlandaises'),
('.­#¥\ãA\ê§\ç*°€\æ','Arabie Saoudite'),
('ıµZl…©D¿•ÂºŒb¾\á','Argentine'),
('üb^\öM’§yœ\ÒH[h”','ArmÃ©nie'),
('~…YF$\ÉAZ\ó’+˜q¥','Aruba'),
('v\ñ\ÌZB¢ú\ÃAø1™q','Australie'),
('\Í;T¦DMÔº‡©½.\Ğ','Autriche'),
('E\ÅşhOÊ·a\ÔpV§r«','AzerbaÃ¯djan'),
('²kFT¸6LªŒ\çŒ¯|\È','Bahamas'),
('v\ÓU\Z‡|Gf²\'\è~¹Fº','BahreÃ¯n'),
('›b\Z\ï!\ÉNÑ‘/la\"AZ','Bangladesh'),
('Y³ıúoGÊ¹Pw‡[\')\ä','Barbade'),
('\r\Ù\ò=G\ØF>¶FS \Ò','BÃ©larus'),
('¦\0\ÒwAA¢5\ñ)u¬\í¥','Belgique'),
('d~q;D$°{›Ç¡úš','Belize'),
('F,\"­DÙ§™‰ˆøüm','BÃ©nin'),
('XmD/\n<F`»\á¯xj\Å4','Bermudes'),
('ŒºpvJ’E¬´±ø9‚o=','Bhoutan'),
('\äv­—_J ™†¬¶˜\ï“\'','Bolivie'),
('\ÂL\Ç/\É\îM‡¬\Î1ª®-ùÁ','Bosnie-HerzÃ©govine'),
('€\ó\ß\ÄTD}q3\Ål\âÀ','Botswana'),
('¿;\êT_\ñHR„h¼hl7','BrÃ©sil'),
('8\â\ÃÓ±YF‹§6\İ\æn>','BrunÃ©i Darussalam'),
('\É1NT›\ÎHy¼KY5-—','Bulgarie'),
('±	[Ÿ\Î\åFn©Š×©<','Burkina Faso'),
('Å‰BG6©YÕ §','Burundi'),
('ı¹\ØkF³{nj\Ê\ğ\ò','Cambodge'),
('\Ş\Èk&\ô-OØ¶b\ï\á£ic\÷','Cameroun'),
('\á\äXRV\ÅEi³G7©\Ñ¨¤','Canada'),
('\âµ^JŠˆGrzf[','Cap-vert'),
('=\04$\ë‚MC³Û©\ÈL\ç.','Chili'),
(':¹ÿ“Op£Rlªse³\Õ','Chine'),
('6‰g:<@²h/66d11','Chypre'),
('£\Ë\ä”K¤›\Ğ¢\Ój?','Colombie'),
('@	\é·\çFi‹\è“.\É[','Comores'),
('Å­\ñ“‘@·§w\ÅØ•','Costa Rica'),
('ÁP\éÁ©›DC¡¤\öIG,\àŒ','CÃ´te d\'Ivoire'),
('KÇ¨V\å~N¢ƒ&W\åÚ¸\Ë','Croatie'),
('f:x<@k‘µ†\ë4È“h','Cuba'),
('Í„I¿\ğ\ÙHR²¶\öU¹\õş','Danemark'),
('\á\Ó\íŒJ±p°\×\Ö,','Djibouti'),
('ÁW\ß\ç&G+©äŒªmÁ!¤','Dominique'),
('\ÄRU?°O\êƒV˜MA+¬œ','Ã‰gypte'),
('¥;pCe…F\r¦ÈºƒX2','El Salvador'),
('«:.\Z~\õ@µ‰—©.À','Ã‰mirats Arabes Unis'),
('`\Õ\ÚJš\ÃCz§\Í9]2F¢Z','Ã‰quateur'),
('/’‰8@{(\Â@l\Ê\Í','Ã‰rythrÃ©e'),
('\Ê	\ç\Ã\ÊsI-´dš\Z:R³','Espagne'),
('™ºo@Œ\ËK®´w	F\Õ\Æ\÷','Estonie'),
('³\Ô\÷\æ5O¿ )\ä\åC1r¤','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('t#	\Û\ôI¼š9\Ö\äF\íu\Ş','Ã‰tats-Unis'),
('‰c*¼´EZ·rømFE<','Ã‰thiopie'),
('5\ä¥\n–ƒA5™\Ô1\õ¦d','FÃ©dÃ©ration de Russie'),
('ª\éOˆ\"TE¸˜\÷\ö›D»','Fidji'),
('c{\í\'*L¹¼†½\ô\Ú','Finlande'),
('\æq»–,\äBz»\ô}¼RY','France'),
('\×h×¹O\ò‚:»½\Õ{M','Gabon'),
('ßª·œ\ÂúC™€ûo\ã,ß\Õ','Gambie'),
('%4±TfŒG\ë™GE‚\ğºƒ','GÃ©orgie'),
('”µ0MxE¨ê­„!› ','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('(lu\nn@Îœ_9\òb\É\Ö','Ghana'),
('\êı\ÛHüKx…“\öl)¨µ\Ù','Gibraltar'),
('\÷a\ël­K\ïpgE\Ä;\'','GrÃ¨ce'),
('§ft|\ÇBE9™(!!}`','Grenade'),
('\Şuuc\ÑFı¹\ršâµ²`\ö','Groenland'),
('é–q7Gf– ©Şƒnp','Guadeloupe'),
('FşŒuGLW®\èœ8\Ôi','Guam'),
('IV\ö4{@ùœ1¶´­\É\rú','Guatemala'),
('®4œ rM	˜Ù¸(»?\î¥','GuinÃ©e'),
('º\ÜbT`tAİ²Æe\Øş\Â','GuinÃ©e Ã‰quatoriale'),
('&:ªƒIÎ\n­oQ\Ş','GuinÃ©e-Bissau'),
('Å†uL]O#¹Ã·\r\'\Ğ\Ù','Guyana'),
('!3Ø•$MG¥(…]’\Úag','Guyane FranÃ§aise'),
('¬\r-OL\n‘şl€\õ\â7','HaÃ¯ti'),
(';1\Û\Ø&\ÈKÖˆû ','Honduras'),
('Ä±ˆ\ğD£„,Œ\ç#\ã','Hong-Kong'),
('`u„EĞ³Bÿ””\âl£5','Hongrie'),
('{\Ô\ÍAQA>º{~\éÈ•À,','Ãle Bouvet'),
('’U#gc&F~°ƒ}jı½','Ãle Christmas'),
('üMU§NJY™Ó…Z\Ô','Ãle de Man'),
('øª^¬jB½~;i{\ñn','Ãle Norfolk'),
('½“¿Y	\ÖMS±ZA\ã•~','Ãles (malvinas) Falkland'),
('ı“·\ğ\õCµPÚ»¹q','Ãles Ã…land'),
('–B@pºBÌš\ò\"a@\é†n','Ãles CaÃ¯manes'),
('\î1²bI¨€\n\n.','Ãles Cocos (Keeling)'),
('\Ï]ŠıÇ«J¼ú‘ª±±Bš','Ãles Cook'),
('‹¿t7pAú’OGG\rq\ì','Ãles FÃ©roÃ©'),
('Ä\ÑpÚ£E·\Ñ:V¿û\ã»','Ãles Heard et Mcdonald'),
('\Ó\ß\òFIıNè‘Ÿ™Í¢…£g','Ãles Mariannes du Nord'),
('#\r|\â-\äOb„u1\ÃŞ–Y','Ãles Marshall'),
('ıÿÈ‘Z G™•\Ş\ë&c/','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('JP\àgLF±jf Ï—\öl','Ãles Salomon'),
('+ƒ\Ù\à\'GÍ¼•¾\÷\Â\n!','Ãles Turks et CaÃ¯ques'),
('¹\Ø\à‡ÁGBˆ\Ö\èeØ¿\à¼','Ãles Vierges Britanniques'),
('\Z%¶aù*K ¸¾FDl´','Ãles Vierges des Ã‰tats-Unis'),
('zs\Ü5*Iƒºnü`\Ø^','Inde'),
('_£vÈŠ¡F	¯\n6˜»k','IndonÃ©sie'),
('\ôüÿŠü/IO¥*\ÒK¶`%W','Iraq'),
('p\nN\ö¥M‹´¡\â\ç8k','Irlande'),
('sÿ½\Ù3ª@.ƒ\Ëı‡,\ç','Islande'),
('—4ÕŸ@Æ¢g‡6kI\ñ','IsraÃ«l'),
('Q\Zs›\Î\ÊM°‹Ì›Kµ','Italie'),
('gÛ¼&2\ßBE˜º²\ç\ê\å','Jamahiriya Arabe Libyenne'),
('‚‰ºW”0D#¾Ëœ¸<','JamaÃ¯que'),
('·\'„Œ^Ev¹>»\ËQVÀ9','Japon'),
('¡Ğ‰9FÅ±\ã\óì¾”¶‚','Jordanie'),
('\ì@x\ë/DŸ…	·\å\ğƒ','Kazakhstan'),
('¢„\íeC‘IZ©&$\äH‰\ÊM','Kenya'),
('u½\'±N\"¨„A|›ü(Œ','Kirghizistan'),
('\ÑI@N+NÓŸş\ã·\î­\ìB','Kiribati'),
('eZK\n\ÆN„»0û','KoweÃ¯t'),
('¹\ñ\ã¨ß‡Ko®ü_˜¼¢7´','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('¶®>HX›‚¿=†½I','Lesotho'),
('\'±\ömW¾F½Ì¯Aªµš\\','Lettonie'),
('\õ\ä\"Ù„/NŸ;Kq\Ò','Liban'),
('H\ÚÌŠ‰\ÓLY´r	”s\Û\Ó','LibÃ©ria'),
('2û\Ñ\÷„pF\ç”ş\÷ ·U','Liechtenstein'),
('¹8®‡—A@½­\ç\õ\ÏM','Lituanie'),
('\Ú)Û¿_I\r¿\ãtÕ»”ƒ','Luxembourg'),
('‹—†a¼\êCL•`<^¡º','Macao'),
('ù\äü/HN£\ë\çw¸IS','Madagascar'),
('lù\\L¼B.¬£ZÒfÅ‡','Malaisie'),
('>`A\Ç\ÖMş•\ò_o9','Malawi'),
('\'=³®NJÂªT\ÊwM ','Maldives'),
('(¦Àf¤Bı©ZvÏŠ#\õ','Mali'),
('\Ó95¹$cC½E1\ë\Ù$Ø­','Malte'),
('\Â\ö¹\ÒıHÁ£¦\ŞV]\ì\î','Maroc'),
('‰¨Bl\02E@ˆ+!\Ò\Ò?-ƒ','Martinique'),
('K%\ä\ÜB‡p\í\n½§F˜','Maurice'),
('kN\ÂÅ¸€A\à¤\"Ø›I!\â','Mauritanie'),
('{·¡\"KgüÄ·yY','Mayotte'),
('#\Ã4&BM;XU5ú','Mexique'),
('E;~\Â\'°O<¬¶MLH@ 5','Monaco'),
('˜\Ï+Î€ˆC›²\Õ\Ë)R\ì q','Mongolie'),
('‡Î¥5¦H˜•£Ñ¬/','Montserrat'),
('­\"•¾(‡J8\Ş((','Mozambique'),
('\\	†±SNŠ­¬p\Ê>e­','Myanmar'),
('Fã½’\îL»½Å\Ë\ÄQ\r\ó','Namibie'),
('Zº\ŞÆ½\ñK\è¼KƒY¯2\ë','Nauru'),
('\0hK²\Ì=M8™=¶¥\'\'?','NÃ©pal'),
('9ªš¬\'E«†©ûş]r\Í','Nicaragua'),
('¶x0‹\æMi¢-‡ü\Ì]\ÎÁ','Niger'),
('¬—3ùxEIÃ„ŸZ\ğ.M','NigÃ©ria'),
('WNº\àÁFxƒNı-\ÄXo','NiuÃ©'),
('£7RªFf’£_~\à¯','NorvÃ¨ge'),
('\n\Å\"}LÛ£\ï\ÙD ','Nouvelle-CalÃ©donie'),
(')¥•K¸·n \ô\Ã8','Nouvelle-ZÃ©lande'),
('4ıˆ»B¶\ò©\ÅlL','Oman'),
('¡m\Çu’AúŒ@Aı§cL','Ouganda'),
('\ë—2\÷ş\ìL–¼\n\0\Ïh´\ê\İ','OuzbÃ©kistan'),
('Q¤HTı]NS¡	­D[{','Pakistan'),
('[|€Ş Gi‘Šn7«\Â\Ã\ê','Palaos'),
('!û\Ğ6\'«L¦¾¤b\êp&\Ø','Panama'),
('\öø¦CD™ˆ\×2tÒ©','Papouasie-Nouvelle-GuinÃ©e'),
('bÇ¥“T@	„\ÍC\ë5%','Paraguay'),
('F„qL|t\æI\ß','Pays-Bas'),
('nu\Â\ïœ\ğI€‰s-ú\áÀ}','PÃ©rou'),
('\î\Õ\'ZÛ¯Ah)evˆ9-','Philippines'),
('‹\çœ:N‚n\ôu-¤`\Ã','Pitcairn'),
('\Û(\Ó[\äJ \î\ğ\ßè–ƒ€','Pologne'),
('Ş”˜\ãG®¬›A‚Ù¥X','PolynÃ©sie FranÃ§aise'),
('\è\ÒQK»\Ò\Õ³ˆ[','Porto Rico'),
('\ñ?I\÷¨F¤¢%†9\Æ\Â\à','Portugal'),
('(UUCÄ®\ØwG\à','Qatar'),
('³\Ôq½VKL\ã£\0˜[\Ãn','RÃ©publique Arabe Syrienne'),
('\\B…\õA³@»¸Y(±º','RÃ©publique Centrafricaine'),
('\n<t\\ˆÀLd\ÈOi\å£','RÃ©publique de CorÃ©e'),
('X\Ö\äNK¯„#¸.i­','RÃ©publique de Moldova'),
('¥š#™Í™@n¨tJ`zœù\î','RÃ©publique DÃ©mocratique du Congo'),
('KT³É¡L\õ²sŠxB1„#','RÃ©publique DÃ©mocratique Populaire Lao'),
('l©¤¦K4®\æ™\0m7','RÃ©publique Dominicaine'),
('(V)\ëşAKq²\İ¶ı\ö','RÃ©publique du Congo'),
('\ÈHH€\È\ØL¦²of¨Ó¡\0œ','RÃ©publique Islamique d\'Iran'),
('\æ\Ôw1úF\ç°\nˆ9‹#\×j','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('»\Ø\î\÷„6LF—ù\é\öÇ“G†','RÃ©publique TchÃ¨que'),
('¸&µ¾m\rMÇšXùBz\É=b','RÃ©publique-Unie de Tanzanie'),
('~h\È\×\Ô>G\ô…h%T·¡š','RÃ©union'),
('\é¢\n\Ö\0C\÷­(¿	yšŒ‰','Roumanie'),
('}ü‹,Ow°\Ó\Èj1©†','Royaume-Uni'),
('s=‰úBÀ§›¥\í‚ı\ö','Rwanda'),
('ÿ]B&¡@Q¦\ãdVNOa|','Sahara Occidental'),
('\ëF™½°»Cj‡\Ê*\ĞUŠ','Saint-Kitts-et-Nevis'),
('‚a!:¤|Ey©b]\0·h\Ô','Saint-Marin'),
('m\'\Ç\ä!Jº´²8”','Saint-Pierre-et-Miquelon'),
('¤Ïš\Ö@IS¡‹\Z£2YH­','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('^\à\ä\ô\ô°MŠŸWC\ÚÚ©¤\Ã','Saint-Vincent-et-les Grenadines'),
('\Å\Çp6\×C%\ğÅ¡’x“','Sainte-HÃ©lÃ¨ne'),
('¢wnu\ßGd»”w\ÎÄ\Ö','Sainte-Lucie'),
('Q\Ç-Z\ÚøG¯‘\ÕeBU6','Samoa'),
('t\çş&\ÍAc²\èueÙ›)','Samoa AmÃ©ricaines'),
('¥U/\×\Ä\×O¸½Ÿdul\Ì+','Sao TomÃ©-et-Principe'),
('Aƒ\÷¹ I‘¹Y&ş®\Û\Ñ4','SÃ©nÃ©gal'),
('¾ V‘?Mjœ(˜•ŞPb','Serbie-et-MontÃ©nÃ©gro'),
('*\Ê4!CJ]š¤\Z¦\èg€Œ','Seychelles'),
('v6³®\ïwO ½À8 \Úş\ï\Â','Sierra Leone'),
('¼\ÅÆ \ÃO¤€Œ\í¾\"\İ\Ğ','Singapour'),
('c[Š\ÂH*\ëAD¿n d','Slovaquie'),
('\æ&\ÌO@\ÛEÏ®q\Ï\ò\Ö\Ôf','SlovÃ©nie'),
('\Ú\ôúF]\ÓD¹ |c¦%p‘','Somalie'),
('Eˆ3—\ëM\á¾Í¼3\ó\Ü','Soudan'),
('[m\ö½\Â@¬šú6}\å','Sri Lanka'),
('U\Ó\÷`wjL­§ê¿º\ç\æ\Ã,','SuÃ¨de'),
('O\n@š\Z\ÂNÊ‘\ÓWA\É8\ö','Suisse'),
('\îG,@¶µS\É`EWı','Suriname'),
('\èÙ³NG/ºq0»v‚\öü','Svalbard etÃle Jan Mayen'),
('L;„\îMh¦k¯´(\ÄoQ','Swaziland'),
('\à7xt@! ±-\ìS´','Tadjikistan'),
('\í{°S—dMB†\áWş\Åù\è','TaÃ¯wan'),
('‹8\íXI ©\Ås\ê—\\R','Tchad'),
('L\Ş)0\"qG\ë¸uT©\ËQx','Terres Australes FranÃ§aises'),
('V\ÑeŒu7H¿±ƒ\Õ‘P\Ó','Territoire Britannique de l\'OcÃ©an Indien'),
('G½Ç£N@ÄµÉ¼*\Ë\ö¯C','Territoire Palestinien OccupÃ©'),
('BzsYEÏ O¹å‡\Æ','ThaÃ¯lande'),
('ç“†U$bHM»dûü\ä\ïv\Û','Timor-Leste'),
(':RL\à¿i@¤š\ï\Ùr8Jc','Togo'),
(' +\Îs\ô¦I¬“F\áUy“\İ\Ü','Tokelau'),
('I€\âıP$DY„ut¬¾\î\åŠ','Tonga'),
('w9J°H\rJÏv¼\"@¡ ','TrinitÃ©-et-Tobago'),
('\ë›J\ï\ÈOEIµ2\Ï xo4','Tunisie'),
('\ÔZ)u\ôF¸Yš&','TurkmÃ©nistan'),
('\Öÿ^Q\ÆùB_‡E„PŸÁ\õ','Turquie'),
('eB©!\ÜcGLš´K2Jƒû','Tuvalu'),
('\Ö\Ç3\İ\ÂG¼¹-t“\Í\æ\ç','Ukraine'),
('ˆ\êk}J‹—\Ã_BQûÚ«','Uruguay'),
('B<\Ü±˜B¨¡M¦\Ï\n\à­','Vanuatu'),
('\ï£\ñ\ğ¬<MÙ¯\Ä…r¦\İ\Õ','Venezuela'),
(',§9L\ÏGü´\"*§\\\îd˜','Viet Nam'),
('\ó³¨T½\ÄL™¢C\Ç9+\÷','Wallis et Futuna'),
('c*z\Ç\ÒN`±f	j\Ï\é\á','YÃ©men'),
('s°\ÄŞ›F:¨2¹\r¤\Í{','Zambie'),
('€¥¤Õ“¼Këœ½iĞ®bZ/','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-04-10 20:56:39',4),
('DoctrineMigrations\\Version20240201152951','2024-04-10 20:56:39',3),
('DoctrineMigrations\\Version20240202084749','2024-04-10 20:56:39',2),
('DoctrineMigrations\\Version20240202150901','2024-04-10 20:56:39',3),
('DoctrineMigrations\\Version20240207105701','2024-04-10 20:56:39',3),
('DoctrineMigrations\\Version20240319212437','2024-04-10 20:56:39',2);
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
('\è˜NE\ÍDÔB\õ\Ä\æ½a’','root@gmail.com');
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

-- Dump completed on 2024-04-10 20:56:40
