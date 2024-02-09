-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-1:10.11.6+maria~ubu2204

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottle`
--

LOCK TABLES `bottle` WRITE;
/*!40000 ALTER TABLE `bottle` DISABLE KEYS */;
INSERT INTO `bottle` VALUES
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','/images/bottle/caymus.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',259.99),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','/images/bottle/chateau-latour.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',999.99),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','/images/bottle/romanee-conti.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',2999.99),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','/images/bottle/tenuta-san-guido.webp','\îo;ÔˆC¾±ı½\Ë\nl','Italie',899.99),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','/images/bottle/montrachet.png','\îo;ÔˆC¾±ı½\Ë\nl','France',1599.99),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','/images/bottle/penfolds.webp','\îo;ÔˆC¾±ı½\Ë\nl','Australie',1799.99),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','/images/bottle/chateau-margaux.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',1099.99),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','/images/bottle/ridge-vineyards.png','\îo;ÔˆC¾±ı½\Ë\nl','United States',199.99),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','/images/bottle/cloudy-bay.png','\îo;ÔˆC¾±ı½\Ë\nl','New Zealand',49.99),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','/images/bottle/gaja.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Italy',899.99),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','/images/bottle/vega-sicilia.webp','\îo;ÔˆC¾±ı½\Ë\nl','Espagne',1499.99),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','/images/bottle/opus-one.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',1299.99);
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
('¬À  KNŠ¦\â\Â{b‰®‰','Afghanistan'),
('\Ä\Ã\â\Ü\â†CÅ…	Y\\”=|2','Afrique du Sud'),
('==³¤\ğ8Hù¬\ã]1\Í\Üu¿','Albanie'),
('—\Şˆ@NÔ(\ä~Rc','AlgÃ©rie'),
('Qû‹ŒĞ‚I;\ÚO\ã\È','Allemagne'),
('2˜\î\é¹G…cOK\Ïc—_','Andorre'),
('±\ÕL¡R@‹\Â\ób¢¤ù','Angola'),
('$4ù\Ï\÷I—™‰2,£¢\Å','Anguilla'),
('\İJ\Ã\ï\ê\ÌAÕŠ5øG~Æ¿7','Antarctique'),
('i#\n:„BÀ‹¹pĞúK','Antigua-et-Barbuda'),
('\'úW\í\ŞGmš\Õ\ë\í \ãÀ','Antilles NÃ©erlandaises'),
('m$\Ö \îF˜»\Ú:±ı\'\ë\õ','Arabie Saoudite'),
('ªÃ‡\ñIœ“w„™\Ù€½','Argentine'),
('l\ö i’Oq¨\âGû¼','ArmÃ©nie'),
('\È\áX-PüN7—\Ân\ÈI','Aruba'),
('³\İ:R’D¤\á­²nûŸ','Australie'),
('KG»:\ä`K6¹™•\ê6o','Autriche'),
(';\ÈFµ½¾FÅ•–\É`\÷¨\Â','AzerbaÃ¯djan'),
('•-AA®G¦>¯M\nEC¨','Bahamas'),
('\Ê$+\äµ[HÉ‚X‡Q\r\İ\í\Z','BahreÃ¯n'),
('\×[ø\ß.\ÈB4ª\ô\Ü,Û­J','Bangladesh'),
('8\Ãr‰eP@À”\İ~™P\Ì','Barbade'),
('\ë\ï\çvs@Ò°\È-q‹(·','BÃ©larus'),
('\ê\í\Éı\Ğ?N-´¢Q—\ïXZ\Ü','Belgique'),
('b[´›OIV¡.Ÿ\ö©Wû','Belize'),
('\ß\Z\Ì6©\æMß¦™‘\âMp\\','BÃ©nin'),
('?m®ˆ\"A¥˜ûkW(\ÕXU','Bermudes'),
('\"x3\ô7\ÜCÒ´c¶cüS','Bhoutan'),
('43³\æJW°[\ö›7\Âs','Bolivie'),
('´5‹\ßş&I’¹…*!\Ã\Ñ3','Bosnie-HerzÃ©govine'),
('\ç\\\Ë6«B¦¼‚%ša.o','Botswana'),
('u\×AŠ@^¥š\Ù\ñJt\Ö','BrÃ©sil'),
('keş+c0O¨\í\é9\ÏÀ\â','BrunÃ©i Darussalam'),
('@nµ:<@B«›\Î\Ç,:X\Ä','Bulgarie'),
('.M/¢$G¨¿Ş®4\ô}','Burkina Faso'),
('\ãx‚Ş‘!M&†’+\ãÊ†\Æ','Burundi'),
('\÷V¸/(\óH<œ§\ZZ6d\àv','Cambodge'),
('cC²\Ë%J¤‹\Å\'\rIE°','Cameroun'),
('¶«\èÌ¬‘J¶§û”¥©“t‹','Canada'),
('H\ğ×´ƒC–„mÜ”Ç\n','Cap-vert'),
('\ÇQ®º\Ù\÷JM®nX\é?H\Ò','Chili'),
('œ\Î_„\ÏLˆ®|\Ó!q\0›\Ø','Chine'),
('’œş¤OJO\Åb0Wû±£','Chypre'),
('\ôV\ôo·ûFµ\Õ]ÿ\Ü™','Colombie'),
('\É\æ\â¯9D/€\É\0¹tœO','Comores'),
('‡PQ„\n¹Dz†\r†U¤','Costa Rica'),
('\Êpş\0i\ÎNe¤!şR\Ø8a&','CÃ´te d\'Ivoire'),
('ZzSo½KE²nÁ–LvX’','Croatie'),
('­u‘\Ìb‡NGœ\âƒ2\Ê\rŒ','Cuba'),
('\Ø\Ù\Ğs¡\çIaŸ\ánOº\×\Ô','Danemark'),
('L\"\Zq¿K€Š{™¼½“#','Djibouti'),
('*Äª–;F”º\Ò\È@?˜\İ\ì','Dominique'),
('S\Ã.¬:J²¬vU*\Ôd{\×','Ã‰gypte'),
('‹k];F˜«o²w\"y','El Salvador'),
('’üOTß³JŸˆİ¯š¿','Ã‰mirats Arabes Unis'),
('YµA\ÍLg’²¯H—Z´','Ã‰quateur'),
('“Z[CšFÁ¤%\Ó\éE','Ã‰rythrÃ©e'),
('Ÿ …\ó_MM™œjH¤\Ê\Ì','Espagne'),
('\é¤&\ä>Iİ›:\ß\İO)\ğ','Estonie'),
('\Û\İ\Ìû~\÷Eª—Ò®!G–','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('@X ·˜(Eª¼\Ö\Ï^\ßQÁ\é','Ã‰tats-Unis'),
('¨\Ñk\ñ¥@=’\á\êxjZ†','Ã‰thiopie'),
('Â¦A\"ŒF\Z³\íIsØ«p','FÃ©dÃ©ration de Russie'),
('\ãlšúYLF¬½Gƒn©.ş[','Fidji'),
('LûE\÷\ÛFúÓƒ_S\0\Ü','Finlande'),
('U\áK\Ñ,LF…t\İ	RJ4ü','France'),
('kN:\ê\ó+L¬³\å¦[\×ûZ\Ö','Gabon'),
('4 ş)¼D’ªd„‡5sD','Gambie'),
('*;úy‹Døš[\rƒ„+Xn','GÃ©orgie'),
('\Ô\õ±\å%C¹(7Lc\ìİ©','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('™8…\î)J²‘’Hv\Ê\×','Ghana'),
('‘r\á\àEgI½°0\Û	\ã\0%Œ','Gibraltar'),
('|\".³L\İ@(µ9W{\Ì\"','GrÃ¨ce'),
('\ô\ïy\õ©\Â@˜¾\Ê!940','Grenade'),
('\ö´g|ƒNÂ½\ì±ÈŒ\Â4','Groenland'),
('\ò.›º\æNFâœ¨y¥Q¶EX','Guadeloupe'),
('¥/¢=‡¨On¤ust£\Î1','Guam'),
('ùA\Ø)\Ú[Etœ]LÉ¦\ğoW','Guatemala'),
('¢VK\'Eı‚|û5åŒª','GuinÃ©e'),
('£¾½,ş\n@‡¤Ì¸á°…!','GuinÃ©e Ã‰quatoriale'),
(';Q¤[_AŠœ£ ‚¹','GuinÃ©e-Bissau'),
('ºœù\İ<šC‹‡\ì·=\ñµ²','Guyana'),
('ş\Ó)EL½ø¬ÿD?¹','Guyane FranÃ§aise'),
('˜XT0‚\Â@\'¡j\÷¤’ƒ\Ë','HaÃ¯ti'),
('W´‡\ìJ4±O\ã\â2\â¶\é','Honduras'),
('\İK˜\0\àOe¹QN\ò¢B¾#','Hong-Kong'),
('Å³”9¶¶H¬ 4i”›j','Hongrie'),
('œ>vI\î LÇ³\Ìh±\á\åJ','Ãle Bouvet'),
('KœLG·,M\ñ§V\Şe\Ü\Ê\"','Ãle Christmas'),
('“Õ²\ÏW;OL—“\Z¡\è&\È','Ãle de Man'),
('YG,\ò·gA‘i\ñG8	#','Ãle Norfolk'),
('¯\ê\ö\ÌV\ØF) =f\Û\Ğ\æ°','Ãles (malvinas) Falkland'),
('O\÷†\\ˆF şcc{{š!','Ãles Ã…land'),
('\çVSƒRyIÜ¸¬t¬)}\n\Û','Ãles CaÃ¯manes'),
('ù\ó‚\'\ÙIù»Iœ\é„I‰','Ãles Cocos (Keeling)'),
('P\õ~e/K…½¨p\È5\ÉO','Ãles Cook'),
('rQ\Ä\ì\ÎtNh”\ñ™ûİ','Ãles FÃ©roÃ©'),
('F¡®\ŞnBOÚ¶\îÆ‡\ê\ËÆ»','Ãles Heard et Mcdonald'),
('x%’o\ğ¦I}®ª\İ[¬ß¥R','Ãles Mariannes du Nord'),
('úJ‡\âm\ãD\õ‰ e&ı@\à\ê','Ãles Marshall'),
('OB\Å\æz0MÛ¢\ÔEsª¢’','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('ş_9‚•\ÍD+¯\ç\È\ò¹\ÉHx','Ãles Salomon'),
(')v¾\ßGV¥\ñyK2k,','Ãles Turks et CaÃ¯ques'),
('X\0NTCJm´\àN¯ax¿','Ãles Vierges Britanniques'),
('‰½qGÁ‰e\ÃG(`\Â','Ãles Vierges des Ã‰tats-Unis'),
('h•Db¸eOÇ‰\õ=*‹a¼…','Inde'),
('ú\ÒkEeÿJ+£g¥}Z\ñt-','IndonÃ©sie'),
('/QI\0\ÈI\é­ü¼2\ö¦\Ù\ç','Iraq'),
('4\Ã	-f¸Dc‡\èeü\ñœo','Irlande'),
('«µ]¼L|K@‡1h2øS»Z','Islande'),
('ıa¡‚ı\ÅOÉ¸øú~\÷','IsraÃ«l'),
('•¢Ÿ\äh“F\ô¸n\"sc\ò›¶','Italie'),
('\â…ùD\åªF5•c¾.®','Jamahiriya Arabe Libyenne'),
('\Ã\ÆÁBŸ\ÑK«° p\á¯¥\Ù','JamaÃ¯que'),
('$7\ö\ÍMK´/Ô—\å¶C\è','Japon'),
('¥\õù	ş\ñMÀ±„e psP','Jordanie'),
('\é\îNN1š\ÃZœa.w}','Kazakhstan'),
('Q\æY\É_I#» (†¼¤\à','Kenya'),
('\Ùn„’†ùB\ò‰=ƒzi“K','Kirghizistan'),
('\Â\ïƒ\ê;@B§u»+->','Kiribati'),
('{\ïdÏ©H\Z˜\ö?','KoweÃ¯t'),
('=¾o\È\ÏE‡¯ ‘\'\ØOV','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('Òš›’ü\õI\ö\Ûİ—g.%','Lesotho'),
('!\á~\ÎeYM>†pªº‹u›>','Lettonie'),
('x~\å¡/L	’Ù›ç©¸¡S','Liban'),
('\ó²Œa\Ì	@m»³8„ø¬','LibÃ©ria'),
('\Ô{IpºL0š½[d\\!','Liechtenstein'),
('=\ÊT\ç-B\ZºÕ¨«‡\'”','Lituanie'),
('±\î¯\Ç\ÓK—¦P1½“¼¬\Ô','Luxembourg'),
('JHxO¿¯Òid\ÍUN','Macao'),
('\ó„(>&NŸ¢µ\ä\êª','Madagascar'),
('·À°¾hMÏœ‚¶Á­\Ì\Ä','Malaisie'),
('$U,”Gµ¿o\×ŞŸD§\ó','Malawi'),
('¹¼V-\'ŠIÏ’¾\êL¾udƒ','Maldives'),
('C A	œO®²\éİƒ\İOb','Mali'),
('9R)\"gH‹¦’–}¦£\ò','Malte'),
('M$\è³H\ôL ´\æ\ô$','Maroc'),
('\ÄÁ(\è\0E…†ºxq\Â\Ç','Martinique'),
('ÿ)ƒ\ÇHY·\Í\à4\é\r\ß','Maurice'),
('ªq(\ñdû@¸¢­’®,¯','Mauritanie'),
('}I\02+HD„-¬|ú\ó™|','Mayotte'),
('76µ¡\Ó$CtŠÏ‡\Û~\\¸6','Mexique'),
('Ú£°6\Z\×L:µ @‘\ÍqÀ','Monaco'),
('µÀl\ë!A½\ã\ÅT\ß½w','Mongolie'),
('3Ó¹j\ØCe«;v¶VŒ\ó½','Montserrat'),
('n ıVG\á¦/£qa\ó\Ë','Mozambique'),
('½3\Å&dOŠ\ğ¾\"€4p','Myanmar'),
('ù\ìF:h!Jı—V\ŞŠø8','Namibie'),
('‚\ã\ö†€@±¨J˜\ò°7','Nauru'),
('\öo`\İ\óE\ë¶\æ\ö»´%','NÃ©pal'),
('\ÑG¦ş<\ÓKuµb\\\È\ëœA','Nicaragua'),
('\à:n­m\ÇLk¾’\È\Æí‘”','Niger'),
('’ÈšªˆMÛšL¾–H´','NigÃ©ria'),
('1Ä \"¶Hc¦=Ue¢‘›+','NiuÃ©'),
('\ØL\0\ë\÷^KL“>¾³ùg\È','NorvÃ¨ge'),
('\Ò\Şbn¤J¨¦$ƒC˜\õV','Nouvelle-CalÃ©donie'),
('\ÛU\ïNIs‰#E]zk','Nouvelle-ZÃ©lande'),
('\Ğş•\ÒN\óF˜´*2\Í$ı8','Oman'),
('˜^]%ELR€@n','Ouganda'),
('\ã´^‘f$Ly®\äŒx%É”','OuzbÃ©kistan'),
('q•\÷şNø„£ˆ=!¼k\Ë','Pakistan'),
('C¼¿”\ìBş”!©AW\ê','Palaos'),
('®®• sH±‡»b]¯¬Ÿf','Panama'),
('¹uvTOÆ³F<·\Ğ\ÚJi','Papouasie-Nouvelle-GuinÃ©e'),
('Ÿ¥]‹PB	½|§¾\Ì	1','Paraguay'),
('\\4Nc™û(\ö\ï>\õ\Ä','Pays-Bas'),
('5e\ô\ê­F;£KbEıQJ ','PÃ©rou'),
('¨\ñ\Ö(gAEA† hg\ñ','Philippines'),
('§Ï­\ÂQJü‡\ÙDI„\çV','Pitcairn'),
('qsU;g\îGÚ‹\ç8\ÖÚ(\Ü','Pologne'),
('¼(\ZGJœI’><›nˆŸ','PolynÃ©sie FranÃ§aise'),
('\í´TK\İcK7ˆw\Ë7¾9','Porto Rico'),
('j˜GR94Br¬P\õ…Ù±±±','Portugal'),
('4g\')A<Lú<\Z±z\"½','Qatar'),
('Œuc¹Dp<g\Z\ëR','RÃ©publique Arabe Syrienne'),
('¹!\×HFÏ¬NŠ;\Ã\Ìt\Ü','RÃ©publique Centrafricaine'),
('\Î*\éJj#Lj™o\ãDB´','RÃ©publique de CorÃ©e'),
('b—œı¯\ÕE~ˆ!úgN¾X3','RÃ©publique de Moldova'),
('¨‰‰“úF°ÿ\ì \Õ\Æ)ø','RÃ©publique DÃ©mocratique du Congo'),
('\Ï\n\nC¹§G¾s@sJ3F','RÃ©publique DÃ©mocratique Populaire Lao'),
('\ã·\Ù]OyV\Ù#w›H','RÃ©publique Dominicaine'),
('|\ë\é°Dƒœ\é1&™S','RÃ©publique du Congo'),
('š_ú´\ÅGJS„M\Éø3¨','RÃ©publique Islamique d\'Iran'),
('¾\ØU\\E~ƒÀ\áT ','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('t%§®\Ç+F½·\Õ\Â.qX¿','RÃ©publique TchÃ¨que'),
('ªT\ë\éH°@%C\ï[\×\Û\Ã','RÃ©publique-Unie de Tanzanie'),
('L^ıHF¸˜°´@°«','RÃ©union'),
('}…¹\n®A\ó¶\ï\ïoÀĞ¥','Roumanie'),
('†.€fP‡NĞ¬…yûù\÷\â','Royaume-Uni'),
('»j3³Î­CÓ­7	0\ó\÷k','Rwanda'),
(', Ã‹8\ZF2\ÔIÂ¡XjL','Sahara Occidental'),
('‰\Ğ\ğ\Ù.CC\ğ‰\ó#\Ô\ÃtH\ñ','Saint-Kitts-et-Nevis'),
('\ôˆJg\0@“mA%\é\áJ','Saint-Marin'),
('„„YU#C\å•\Ì\Ş\Ë\îws*','Saint-Pierre-et-Miquelon'),
('²\É\ìˆ\ãMLš\Ã^\Ä7\ó\Ô','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('\ÑYKf©B ş0xr¾\Î\÷','Saint-Vincent-et-les Grenadines'),
('=Ş§4FM—kQ>9_^¢','Sainte-HÃ©lÃ¨ne'),
('ÿù¢\âŠøG$¼»[o›','Sainte-Lucie'),
('w™B\å\ÚıEÆ»›)*=\ã\åŸ','Samoa'),
('\Ú0–ù Fı\ò¥A','Samoa AmÃ©ricaines'),
('ŠmjÁ-„H¯‘pRby=\ö','Sao TomÃ©-et-Principe'),
('T-–¡\ÇMØ¯Rç½¶S\Zş','SÃ©nÃ©gal'),
('\ê}ƒ\ÉSKÇ°\İ\õm\Ñw*x','Serbie-et-MontÃ©nÃ©gro'),
('­ˆ³7\Å\É@™r…š\İT','Seychelles'),
('“\Üp\ê±5Gs·¶³±„	•‚','Sierra Leone'),
('Xº-\ĞHq²o\ŞS”Àn(','Singapour'),
('i_i%9\éL°O>\Ï;™o®','Slovaquie'),
('û°Gù\ÄC˜™\Ú.B\â\õ','SlovÃ©nie'),
('B§\ÃOY;Ù„\áÅ€','Somalie'),
('\Ã,Ÿm\ÜBHƒ„\Õb2qC','Soudan'),
('4‰\'AC‹\â‚(:€c','Sri Lanka'),
('ù\Õd\ôSFßˆ\ä«#\ê\õU\ï','SuÃ¨de'),
('D]4\ñ¥E’¬\ZxVO','Suisse'),
('/s©Ÿ¼HM\å—gƒŞ‚â”','Suriname'),
('™ó €‰¡Bã•\Õ_~Šu','Svalbard etÃle Jan Mayen'),
('H\àU øD‹&q\Ç\Îe\à\Ì','Swaziland'),
('\ÖWo¼_Cv¶lù‰Æ¶¬','Tadjikistan'),
('“/\Ï>¬\èJ‘\"nITJ\ì','TaÃ¯wan'),
('\é\í\åÏ…ªB\ğ…MK  ÿ‡m','Tchad'),
('[œE\ÜbEş’\ó¤\Äo\Úÿ•','Terres Australes FranÃ§aises'),
('\'h»-º»BVˆ&<–š\Ï','Territoire Britannique de l\'OcÃ©an Indien'),
('$›\ê:H\ÈO_¦BL\Í4\ÈIƒ','Territoire Palestinien OccupÃ©'),
('ú²Ì·¸G@Ñ˜¿¢Ên','ThaÃ¯lande'),
('H\Ğ\ÒZN–¥¥fOL À','Timor-Leste'),
('‚)Ş¼B¿¨’b=ˆ','Togo'),
(',\÷°cR@AØª‚|\ã¾|‘','Tokelau'),
('Ø¹ƒE®‡m\ök-','Tonga'),
('³\ÕW\Î|Kšƒ³+ø\Ò\Í\òş','TrinitÃ©-et-Tobago'),
('\×p¥l\ò\æNq„~7.Ç„j','Tunisie'),
('s\Ù ’¹F \×,£\ÖA','TurkmÃ©nistan'),
('¸K\Ù\ë,EE•?0½R®\ğ','Turquie'),
('\ñµ\öå›¢IÌ©RD]£a\á','Tuvalu'),
('ş\ÚoOÿƒ§r½\ó´„ÿ','Ukraine'),
('\óz\â¼H{NM¤\Ö9mú','Uruguay'),
('&T\óF|«°P—m34¬','Vanuatu'),
('^(\öMÔ!Ï»³”)\Ş','Venezuela'),
('\0\ÍÀJÙF\ó¿C+6¹±\î','Viet Nam'),
('n°~±@È¸\\p\Zdÿ`','Wallis et Futuna'),
('C\nŞ—WDe¨t=fš\×I','YÃ©men'),
('ÙŒ¯H\0PC\ëˆV\Ñ~³§¥','Zambie'),
('#\Ç(\âVº@}¶fZÄšĞ¡^','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-02-09 13:30:48',19),
('DoctrineMigrations\\Version20240201152951','2024-02-09 13:30:48',4),
('DoctrineMigrations\\Version20240202084749','2024-02-09 13:30:48',5),
('DoctrineMigrations\\Version20240202150901','2024-02-09 13:30:48',5),
('DoctrineMigrations\\Version20240207105701','2024-02-09 13:30:48',6);
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
('\îo;ÔˆC¾±ı½\Ë\nl','hugues.gobet@gmail.com');
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

-- Dump completed on 2024-02-09 13:30:52
