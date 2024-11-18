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
('´\ı\ÂB›óH∫\Î[\·PP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','√âtats-Unis',259.99,'2024-11-18',NULL),
(')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','Ch√¢teau Latour','Ch√¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-11-18',NULL),
(':(\ﬁ\Ó\Ú!J°Äk[\'{¸','Domaine de la Roman√©e-Conti','Domaine de la Roman√©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-11-18',NULL),
('N¥I\Ÿ}#IÑ¶çw™¸\Ã`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-11-18',NULL),
('^¿ë{üF\‰á\÷\€v˚\›\Ù_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-11-18',NULL),
('c^Äú™Ø@ﬂÑÉÉœæ,U','Guigal C√¥te-R√¥tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-11-18',NULL),
('i\nÑsÇØNWíÕëÜ±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-11-18',NULL),
('{\’]\Û\Â<AÉ§é^Ÿº\’\r','Ch√¢teau Margaux','Ch√¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-11-18',NULL),
('ó-L\⁄FAå4S\ı¢\·\È˙','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-11-18',NULL),
('µLØ\ÈCnG§îVajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-11-18',NULL),
('\Á\ÚG¶fF@ä\»%\Ó>\Îm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-11-18',NULL),
('\Í¬°\ŸI^Ä‹ì∞∂W\Ì','Vega Sicilia √önico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-11-18',NULL),
('\w™√§O\Zå`v∫\Á∑','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','√âtats-Unis',1299.99,'2024-11-18',NULL);
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
('{\⁄h}ñG\ÏÇ\Ì®D\–\◊\Á}','Afghanistan'),
('¢rI\nù≥K∞πB\\œ\√\“\⁄\∆','Afrique du Sud'),
('˝ZõLÃÉ\ÓRw\Ÿ	\ƒ','Albanie'),
(',6]õ\«<J?Æ\…I€Æ2Ω','Alg√©rie'),
('—ßï§h\ÒN-§$\‰\ÃP\„','Allemagne'),
('\»zl@4}I´£\Zãjπc','Andorre'),
('å¬ù*\À\’F Æ\ZL\'h','Angola'),
('3‹Ö\ﬁ\ÂHQ®N°à2','Anguilla'),
('øD|\ÍMπ©R∫{¨¯{','Antarctique'),
('\‚∫\–eë\ÌD)∑ûeò\Ÿ&†','Antigua-et-Barbuda'),
('õ\ı\Á\›z\¬OãölaN¥R@-','Antilles N√©erlandaises'),
('™¶∫aòH÷á,\0\ŸﬂódU','Arabie Saoudite'),
('PAûXnCŸ™ú|!\≈\Àd','Argentine'),
('ËæÖ˘1G\„™\ EAîõ\—','Arm√©nie'),
('\»˚L\‡ECBâá@ªOÅô\€','Aruba'),
('vM÷ÆOËÖ™\È˘\0@∏','Australie'),
('\\œªπµAA˘∏≤\Â7w~íN','Autriche'),
('Üü2ªKÑGHÅyŸö∞®á','Azerba√Ødjan'),
('|«∞~\ÃEÆΩ\‘w\Z\¬4\','Bahamas'),
('\"og-\ıìHôö\"*≤:\‘R\√','Bahre√Øn'),
('\0\05\¬1@âª\ıû2HW∂\∆','Bangladesh'),
('\\˝\›g\‘*B8£|j»ñE\ ','Barbade'),
(':ïû\·fEã\È\ÕØ\‚Ä\÷','B√©larus'),
('\Ès\⁄=ædHº™*ç\0\÷~ú\ ','Belgique'),
('<ª˝BPDñí\ﬁ\Á\…\ õh','Belize'),
('	M#\ﬁDiè∂-°CÜ\„g','B√©nin'),
('¨/V&<WB∏ê\Ìéo\⁄v¸0','Bermudes'),
('\r`j\˜hé@L∏KyYEâµ','Bhoutan'),
('¬Çåôp¿GiªëO’£','Bolivie'),
('Çc˚\«ˇEÜÄ\Î∞\ŸH\"ä','Bosnie-Herz√©govine'),
('˛É?D©\≈M«ï.\›mò†@\—','Botswana'),
('\ÂM,*PEmùøÉ\˜µ\€\Œ\Ë','Br√©sil'),
('≥P±R|¨Mm¨\ıHC\ı$ã™','Brun√©i Darussalam'),
('k;ÿ±\ÁL\ÈÄW\√¿¡µ','Bulgarie'),
('Hb\Ú ãoJ∑∑®∏¸\Ïm\⁄\ƒ','Burkina Faso'),
('π&h°ºKá¨GI~êåØ	','Burundi'),
('â\ÔåSñEIÿ∏A◊æ>','Cambodge'),
('¿zßyO\ËKµÆ\ \÷Xªàx','Cameroun'),
('zVo\Ù\Œ[EŸ¢Æ[,!˚N¿','Canada'),
('òQ\ \Ì9™F+£s\Œ’Æà\Á','Cap-vert'),
('B*¿ H\Ó†<ﬂú]8ë','Chili'),
('Ä®áZ\–\ÛF[´\Ó-ìSùπ\”','Chine'),
('ùc\ı«å@À•ºÓÉó≥G>','Chypre'),
('÷ó\‚á\·\ŸG\\èH∏\‚	~Tl','Colombie'),
('\ÔdwÉD∞¨Ö\ÿ…ñ,W\Z','Comores'),
('´êJFí\Û¨g≠_¥Q','Costa Rica'),
('\Û´\«\ `O	∑#®47ñ\—|','C√¥te d\'Ivoire'),
('2m¡ö\–Mnö !Nå\ ','Croatie'),
('\Zñ˘\ƒ:*EG∂)dR∫BK','Cuba'),
('«â\˝\ÌDñé\÷ôT2∂','Danemark'),
('åÖ2Y\Íˇ@.öê\n˚®ú','Djibouti'),
('$\‹ÆJè†™8\√.M','Dominique'),
('ªæ∞Ñ¿Fsïqñ\€c\Óé','√âgypte'),
(':˚Vâ4ZL\Zù\÷\‡ü›Åµ','El Salvador'),
('ñ˘õ\»\∆\ÂAâô¨mwöÜDw','√âmirats Arabes Unis'),
('G’ëQ	\nO3°F\Z\‡\·,b™','√âquateur'),
('\Ínú\Ú\ŒF3äf√æv','√ârythr√©e'),
('>]/˘˘\ MÌßÖö\'\ﬂ\„¢X','Espagne'),
('hµ\ÌwzK[à∂9S\Ûj\√','Estonie'),
('†…Øx˘L∆¨>læ¢ŒÅ','√âtats F√©d√©r√©s de Micron√©sie'),
('\—üEA%Ä\0\räOSÄ','√âtats-Unis'),
('r	\‡9\Ù\⁄O}ó0\ˆF\\ÀÖ','√âthiopie'),
('ˇæƒôâ\∆G`Ü\’¢<,ä¿','F√©d√©ration de Russie'),
('\‘\"kzG™B$.)\Z','Fidji'),
('m/E\<˙Gø\Ôß}ç\ı3','Finlande'),
('|D\⁄\ÍÄCIæáñ¸ôg\Î¸','France'),
('s@\œzxB¨≠t\·≥’Ω™û','Gabon'),
('\Án%˛éªN©•|T4u§','Gambie'),
('∑m5åëG§§˚\⁄M\Î«∏','G√©orgie'),
('á\ÀïØ\ÿBÀ•æ-\Ô\‚o°','G√©orgie du Sud et les √éles Sandwich du Sud'),
('î˘KJæ|H\'º€ß\›ROo','Ghana'),
('X	`QìF\ıÖqop/ø\Œ','Gibraltar'),
('\ÌE\È\„eAXÆu\Ó∞ I\“\∆','Gr√®ce'),
('5µJÀï\‰h%Õë','Grenade'),
('\'1l©v†O\ÓÖq*\ŒTz\Ô5','Groenland'),
('ëiˇ$‹∂IJâ\ŸN”í≠Ñ´','Guadeloupe'),
('Và^\œ\ƒDOí≤\'\≈0,÷ª]','Guam'),
('Iáã&\·\ÒNgû\À´g\È\Ã=','Guatemala'),
('É\«N,KyFöãæe‡∞è\\∂','Guin√©e'),
('#\Û\ı\„ªEúÜ&FaC!\Á\Ì','Guin√©e √âquatoriale'),
('Ö•ù%C‹µr4\Ò~)\Ùm','Guin√©e-Bissau'),
('W\√\Ï\ˆME1è\Ófπ	ó.ü','Guyana'),
('s\Ù˝uMƒÑ\'\›ñ.84','Guyane Fran√ßaise'),
('cUHB\Ó¨Bë)Lçñ\‚\À\Ô','Ha√Øti'),
('\Êã˝\”}Nèçpõ\„™<\r\Õ','Honduras'),
('\Ê â\⁄Eûñoº„†¶ò\‰','Hong-Kong'),
('\n\ÎnkSCwí£õ6ˇ¯B\‘','Hongrie'),
('LΩ¯\ÔLÄ∑\Ó\’CÜ¥\Œ','√éle Bouvet'),
('ºõ‰ª§fF¿à©?ŒªU\‡','√éle Christmas'),
('!Øq(uG\˜úJ26\„∞','√éle de Man'),
('’èÆ…îbEΩÖX%r’àÆ','√éle Norfolk'),
('ø+\‡ﬂº\ÒN\„∞H°jL-∑±','√éles (malvinas) Falkland'),
('}eªhßA\È†1≠0\≈I¥','√éles √Öland'),
('z:Å\ÿ{Kè?\ˆ∫‚ãÆ','√éles Ca√Ømanes'),
('{UN\ÁÜA0õe˘†\˜\'∞','√éles Cocos (Keeling)'),
('?Ö∏\Œ\ÔJâî†ˇiq¯','√éles Cook'),
('\ﬂ!\Ã\Áﬁ∂Hºìjå)∂Ç','√éles F√©ro√©'),
(' Ñ+)KöOPägr»§1¿}','√éles Heard et Mcdonald'),
('_∑\«5πãINà-)\Ÿ\\„%:','√éles Mariannes du Nord'),
('ûì¨¡±£D•∏iLÉA\ır\‡','√éles Marshall'),
('\Û\ﬂ$\ÁFô\—Q˙út\Ã','√éles Mineures √âloign√©es des √âtats-Unis'),
(',\»)ÿá\„H©∫Qmì∏\Ù@','√éles Salomon'),
('¨§•\„Bâß\ +\œq\Œ›£','√éles Turks et Ca√Øques'),
('{≥\»TV.Eä∑RBUD\˜®','√éles Vierges Britanniques'),
('˘\Á5@(Ø\˜iiZ!\…','√éles Vierges des √âtats-Unis'),
('\ı26\‚dìFÆ¶•üPÿ•Nu','Inde'),
('Ü\˙\ÓJ«∑⁄∫˚@º®','Indon√©sie'),
('MIôªz¢C¸°y\Ù4z\»\Û','Iraq'),
(' >S\ﬂGÅ}ªQ\\Z0y','Irlande'),
('ﬂÑFkc	HjªÇ¸\Î\ˆØ†m','Islande'),
('{ècvG:®Ü\\ó3¯o°','Isra√´l'),
('K^YßM\–I3∫TEpr∏7≤','Italie'),
('tû\ƒ\„aJ\Ïà\≈f\Ù\›PS','Jamahiriya Arabe Libyenne'),
('\ I˝\Z\ZêB)à≤\Ã_˚\‹:','Jama√Øque'),
(']çc`CïMO¶O\Ò\·Do´}','Japon'),
('\‘k[ßöJ±ºmÑ≠	\Ô\Âp','Jordanie'),
('6\‹sÖ\◊\ÃMõ∞\‰:ƒÆ\ƒ¸_','Kazakhstan'),
('\˜¥œèàLO\Â¶;ga*[ì\”','Kenya'),
('\€ˇn!K‹ûk¸:@\ÁÜ','Kirghizistan'),
('û¥|\’GW£^´\„@Wó','Kiribati'),
('4ˇ2˘J|†˘ åêTô','Kowe√Øt'),
('p\r%3@Pë4 ¥\‰\„ .','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('¨PnxÄDŒº\'\–\‹€°\”','Lesotho'),
('_G\Ê\»Nf≤Sø\\t®Q§','Lettonie'),
('\Ô\re˚\Ó|Eê\\/\nTô','Liban'),
('>ô\ﬂ3˝EAòÒô∂∑Yóv','Lib√©ria'),
('ó˙°)ÀãL\Ëà!˘ù\ˆ\‡\nã','Liechtenstein'),
('*õ∂ô\Õ˘OÉ©1IW¿_\‘p','Lituanie'),
('\Œ\ËA∂QL=âGcyü\Z˛\ˆ','Luxembourg'),
('$é\«a—ë@πí\ÎMZ AI*','Macao'),
('/íºb\÷L>≠\‡\Bã˚/','Madagascar'),
('\Ÿ\‡\Í5B˛@°¶v<∫j\Ó¥7','Malaisie'),
('≥:sC∫â°Ω,®\'ó','Malawi'),
('\Âø\«Ÿ∫çM¬Ç\€k>k\"º','Maldives'),
('≥÷≠1\›F\Ï†\Ÿ∂\ˆ:î\…','Mali'),
('\⁄3ΩN¨@¯î°\…\ˆ¥|Y','Malte'),
('\⁄G\«T1H>ì∂Ωê;÷µ','Maroc'),
('\À\‰\Òò\·N<∏j§\ÚÃÜ0','Martinique'),
('T∏\Î9JoCà¥∫\ÿFLøM\Ë','Maurice'),
('\‚VyD˘\÷LN¢j\'éC(Ç>','Mauritanie'),
('s<+O\Õ\€I9£ãØ\‰ü>~','Mayotte'),
('bΩ\…X˙\˜G\nâ!\‰x∞.\Ú\Ï','Mexique'),
('º+,Pu`Güõ©sáÉ2','Monaco'),
('Eèûv]TJ¬¨!±\€\œ\ﬂô','Mongolie'),
('B\Ÿeú\ÏE–íPi∫¢l•','Montserrat'),
('B	F&ÇLE\„ësoGˇØZ','Mozambique'),
('?\ÙÑ¸á\ÒK	ç\È\Ûè¡Aá ','Myanmar'),
('h®-\‡Q°H\ıºÅ|auh','Namibie'),
('\À\…t3a\‹J†ò≈•>\Ï˚\»','Nauru'),
('\÷\‚,ÄYH∫Ñ\Å\0\Ó•','N√©pal'),
('Dh\⁄^D)û\œrïˇ\'≥?','Nicaragua'),
('\Ús\’kjM\'´˝Xv\œN\√\“','Niger'),
('ü¿U|\·\ÈH\˜≠\«\√ˇ¶M\∆\0','Nig√©ria'),
('±?§ö\'N—±A†i\rì=','Niu√©'),
('?jõ?BBür5ò\Ì~[H','Norv√®ge'),
('¶b:†H\ O\Zºü\"èáµä','Nouvelle-Cal√©donie'),
('8NäΩCfA=π+\"Xg•\Í.','Nouvelle-Z√©lande'),
('—Å\Ì“É2B∞ï†X\ÃW\…\n','Oman'),
('cèÆs[@@ºè8\Ú\›>\¬z','Ouganda'),
('õ\ﬁ7\‡HÖÉs£<Ö\‰º','Ouzb√©kistan'),
('˙\ÔÆ+h˚I)∏\÷f\ŒB©Fá','Pakistan'),
('\·\ÙOO\n>Ivç5Å‘ùå¸Ñ','Palaos'),
('\‡†i\‡ò@I†iì\Ÿ\·\Û','Panama'),
('¶2\«u\»vEÕö:ci◊ñ(','Papouasie-Nouvelle-Guin√©e'),
('µ8nûI©Ö\‚ ¥%\€\œ','Paraguay'),
('nP¡d|\–Iˇó\÷$\œ∑\\','Pays-Bas'),
('˙Aá\Ÿ\ŒM¬ñ\0JbØÑ\„','P√©rou'),
(' \˜V\rüN€•ùCòæ\ÁÅ9','Philippines'),
('\0õ=p!≠DÆ\Œ\ﬂ&\Z¸','Pitcairn'),
('E©\ÓCuFäÜ¨¥\ÌGk)','Pologne'),
('co\⁄¿H5≠îx˙°Ü','Polyn√©sie Fran√ßaise'),
('≥=\‡¨ZD\ZΩ$ò=N¯∫','Porto Rico'),
('ãUA©dpLn¶™¨Äì\‰\Ó','Portugal'),
('\Û\"ÇC\ÁC¿°\ÏókæóΩ}','Qatar'),
('U]BŒÜ¶B“º^&mçFZ(','R√©publique Arabe Syrienne'),
('5@\n≥\….@»§Z&ÖëóB\…','R√©publique Centrafricaine'),
('\rz\«>5Kv¶ê,7\"\Ï\Û','R√©publique de Cor√©e'),
('ÉØ\Ë±zB¬â›à\Ù	¶','R√©publique de Moldova'),
('\ﬂhK¨YJC\r°ÆÍ∞≤äYá','R√©publique D√©mocratique du Congo'),
('8\ıä>Kƒì\€m;& ','R√©publique D√©mocratique Populaire Lao'),
('\ÊC,6\È\ÁC\‰µ\Œ\˜~\”Cß2','R√©publique Dominicaine'),
('q\Í	`N\Ë∫*Ig\ËfÖß','R√©publique du Congo'),
('YµWr®O»ÉD&&QkÉ§','R√©publique Islamique d\'Iran'),
('%\≈iDuKNíF¯ëL\·\Î','R√©publique Populaire D√©mocratique de Cor√©e'),
('á\¬W5úÑN2Ñ\÷\‰ôZº®\€','R√©publique Tch√®que'),
('πq\Òä˚Fiì•¸\‘rŸó','R√©publique-Unie de Tanzanie'),
('Sã8á˚∂J!∫cZ\·Ç\È4','R√©union'),
('Çƒ®\Û\ŒOB“¢B\Èjf\√	','Roumanie'),
('ìˇ»è\≈k@◊ï±ÿé/à]','Royaume-Uni'),
('\0-\œ&™K.°¥\„g~˘','Rwanda'),
('—∂\Ôk∂Eüz47CF\Ú','Sahara Occidental'),
('\”\n4\Á\ˆ.G©ì	\ˆ\Ÿ\Ó\∆\’','Saint-Kitts-et-Nevis'),
('∂∑\Ê8GF\ˆÜADÇ˛/\√.','Saint-Marin'),
('◊ìoh7\Ì@∞à\‚%6V ','Saint-Pierre-et-Miquelon'),
('\‡°7Zö?@ñÄµ)GÀ∫\Íö','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('≤\œ\ﬁ\ŸJKø≤¡ëØ˘b¢','Saint-Vincent-et-les Grenadines'),
('\ÍV2VD◊á\€Y\º\»∑','Sainte-H√©l√®ne'),
('j%\\\≈hMl±˙ÿÜ∞eçt','Sainte-Lucie'),
('\Ÿ\˜è¡\ZC\0î…ÖEoíDï','Samoa'),
('â \Ì\√¸J\nöm\Òä†\À\‡ß','Samoa Am√©ricaines'),
('\ÀacaêD-µ}!ùÉ\÷\0Ä','Sao Tom√©-et-Principe'),
('ñ\Â\Z:/FåèW\‰MìS\ﬁ','S√©n√©gal'),
('{\Ô\r\Â\À!K ∏¨ \˜∞≤D','Serbie-et-Mont√©n√©gro'),
('Y\◊O.É\ŒK\˜£ÄiÇdç5ì','Seychelles'),
('\\£ÄPTF*ç\Í\÷\’gù≠','Sierra Leone'),
('èo~Sç@áö˛Åg\ı','Singapour'),
('ä{ø oˇBû®W\‰≠=x#','Slovaquie'),
('\◊\Ìk@GÖ•§-<2\ﬂN','Slov√©nie'),
('\Œ-w≤q\√Aw¶ø	õ\‡^PP','Somalie'),
('Ø3≥q\ CÉå%ø\—\√&\ƒz','Soudan'),
('.ˇù\Ât\ÿ@mñ*∏\”,q','Sri Lanka'),
('èupcQC˝à\Õ\Ïî≈Å/\€','Su√®de'),
(' è±|Ç8M‘©<*\ŸBôzI','Suisse'),
('¢Zå∫DPÇ\À\“2t,\√','Suriname'),
('™næµô†K~ë1Ü†á2h','Svalbard et√éle Jan Mayen'),
('e\ﬂ\\\…]@J∞~¥∞T÷Ü','Swaziland'),
('=,9\ﬁ\‰8LDõI=ô\È4\È≥','Tadjikistan'),
('\ÔE\›Fè\ÿG?î=\Ã:\Êc','Ta√Øwan'),
('\Ù£ÆD@¢A…âŒùí\ÒcÅZ','Tchad'),
('F\ÊÑ\NRGå¢d0ö^\\≈P','Terres Australes Fran√ßaises'),
('4ÑU\Dì\Ôï\Ìx\Õe','Territoire Britannique de l\'Oc√©an Indien'),
('≥)˝ÿπ¥LFù∏€§ïR\∆','Territoire Palestinien Occup√©'),
('\ÏG.6eî@Öº\ﬂ\È:\È\⁄\Óá','Tha√Ølande'),
('éüà°Q]MˇÜ*Xÿ∂˙ã','Timor-Leste'),
('L#\Ï]vJâ\ˆ\“_Pxø\È','Togo'),
('u&\ BMfK—¨\ÚHtU£\ ','Tokelau'),
('kôòñ\˜ïO_õ4mr\‹\ﬂ\…z','Tonga'),
('5\…	å†SH¡ë±cQ4\„p','Trinit√©-et-Tobago'),
('Mí\ra/C—¥´\Î\Ë','Tunisie'),
('gµL®kßN»π±∑wg\Ïù\ﬂ','Turkm√©nistan'),
('\\P/∑üD¯ó\ÌV˝Ts#Y','Turquie'),
('\¬@^Å\«QHh∑\r˙zˇaåL','Tuvalu'),
('≠CéGáê)Ö_p˝\Î','Ukraine'),
('}æê\ƒJØ¨\‡\'K©aP','Uruguay'),
('\ŸY\È\ì\ÊON∑\Á\Èg^Q•','Vanuatu'),
('™>y\·\ËOÍíí\ËU\»\ıø','Venezuela'),
('ebO\0&˙M~Ç\‰°û8D','Viet Nam'),
(',\‰6\Œ∂M\Á≠“ß0\⁄?NJ','Wallis et Futuna'),
('uÃå;L*πgY˚\€\Œ','Y√©men'),
('\◊JO\ÌY\ÁF!ïÿÆè8/m0','Zambie'),
('¿x>Oî©+ô¡\Â\Òy','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-18 10:33:28',4),
('DoctrineMigrations\\Version20240201152951','2024-11-18 10:33:28',1),
('DoctrineMigrations\\Version20240202084749','2024-11-18 10:33:28',1),
('DoctrineMigrations\\Version20240202150901','2024-11-18 10:33:28',1),
('DoctrineMigrations\\Version20240207105701','2024-11-18 10:33:28',3),
('DoctrineMigrations\\Version20240319212437','2024-11-18 10:33:28',2),
('DoctrineMigrations\\Version20240614133504','2024-11-18 10:33:28',10),
('DoctrineMigrations\\Version20240617165906','2024-11-18 10:33:28',7),
('DoctrineMigrations\\Version20240708061729','2024-11-18 10:33:28',9),
('DoctrineMigrations\\Version20240801202153','2024-11-18 10:33:28',2),
('DoctrineMigrations\\Version20240815153823','2024-11-18 10:33:28',2),
('DoctrineMigrations\\Version20240916065051','2024-11-18 10:33:28',4),
('DoctrineMigrations\\Version20240929091802','2024-11-18 10:33:28',12),
('DoctrineMigrations\\Version20241002164506','2024-11-18 10:33:28',6);
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
('∑-≥\'-àA>ò6Hï;ì1∂','Cabernet Franc'),
('Hñ=n+°AóÆ+Q\Œ\n4h','Cabernet Sauvignon'),
('°á\»0îeLŸ•>oí˘\“	','Chardonnay'),
('{æí9ë\·K\Â©\\'\ÿg9Ob','Chenin'),
(']\ÏÆ<˝TJœ®π\·è	\≈(','Cinsault'),
('Or?`£öH\ıª\Ì+`\n','Grenache'),
('äà»®r@‹¢ì[ª,Cµ','Merlot'),
('w3\ ˘qO\r≠\“\„\ÊA','Nebbiolo'),
('∞chiûC≠£ Z•\„\rÉ','Petit Verdot'),
('Øë\–\Êú\ÙF±´h\ÓDN◊ã','Pinot Noir'),
('é≥¸7QDÖû93ü\–=','Sauvignon Blanc'),
('›∏\Z\·\ÏDQä\‡\â“ºjé','Shiraz'),
('´Pà∞\ÃNu¥|>î±\Ï∑','Syrah'),
('5DYÅI$éô\ﬂ@vÄ','Tempranillo');
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
('´\Ì/iöÆMí©\Ì˙|òVt','.•l5ãπLnöIΩy\≈\Ò7','\…5?0O§ÖÄ)\\¶ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-18 10:33:29');
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
('ôd\Â9ˇF≥úˇ\÷\—∏∑','hugues.gobet@gmail.com','Hugues Gobet'),
('\…5?0O§ÖÄ)\\¶ZDQ','root@gmail.com','Root');
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
('.•l5ãπLnöIΩy\≈\Ò7','ôd\Â9ˇF≥úˇ\÷\—∏∑','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]','Domaine Leflaive Montrachet Grand Cru 2016'),
('ñJ<∏_ΩFx•\Õ\„q¿ûß\"','ôd\Â9ˇF≥úˇ\÷\—∏∑','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]','Ch√¢teau Latour 2010');
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
('\Óo;‘àCæ±˝Ω\À\nl','hugues.gobet@gmail.com'),
('\ËòNE\ÕD‘çB\ı\ƒ\ÊΩaí','root@gmail.com'),
('$m7\»¡ñ@º®®\«A\Ïé:','services.bottle_inventory@gmail.com'),
('œüP5#\ JHº]≈≤_\ı_','services.tasting@gmail.com');
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

-- Dump completed on 2024-11-18 10:33:30
