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
('´\ı\ÂB›óH∫\Î[\·PP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',259.99,'2024-09-16',NULL),
(')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','Ch√¢teau Latour','Ch√¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','æm2\‹#Møåfh\—3[º','France',999.99,'2024-09-16',NULL),
(':(\ﬁ\Ó\Ú!J°Äk[\'{¸','Domaine de la Roman√©e-Conti','Domaine de la Roman√©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','æm2\‹#Møåfh\—3[º','France',2999.99,'2024-09-16',NULL),
('N¥I\Ÿ}#IÑ¶çw™¸\Ã`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','æm2\‹#Møåfh\—3[º','Italie',899.99,'2024-09-16',NULL),
('^¿ë{üF\‰á\÷\€v˚\›\Ù_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','æm2\‹#Møåfh\—3[º','France',1599.99,'2024-09-16',NULL),
('c^Äú™Ø@ﬂÑÉÉœæ,U','Guigal C√¥te-R√¥tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'æm2\‹#Møåfh\—3[º','France',358.99,'2024-09-16',NULL),
('i\nÑsÇØNWíÕëÜ±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','æm2\‹#Møåfh\—3[º','Australie',1799.99,'2024-09-16',NULL),
('{\’]\Û\Â<AÉ§é^Ÿº\’\r','Ch√¢teau Margaux','Ch√¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','æm2\‹#Møåfh\—3[º','France',1099.99,'2024-09-16',NULL),
('ó-L\⁄FAå4S\ı¢\·\È˙','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\À#zO0±àj≠q¥s_','United States',199.99,'2024-09-16',NULL),
('µLØ\ÈCnG§îVajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','æm2\‹#Møåfh\—3[º','New Zealand',49.99,'2024-09-16',NULL),
('\Á\ÚG¶fF@ä\»%\Ó>\Îm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','æm2\‹#Møåfh\—3[º','Italy',899.99,'2024-09-16',NULL),
('\Í¬°\ŸI^Ä‹ì∞∂W\Ì','Vega Sicilia √önico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','æm2\‹#Møåfh\—3[º','Espagne',1499.99,'2024-09-16',NULL),
('\w™√§O\Zå`v∫\Á∑','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',1299.99,'2024-09-16',NULL);
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
('Ω≥´ˇ\Ò¢J¡©0âv\Ì','Afghanistan'),
('2\Î	1∞8J©Ñ´:§©l','Afrique du Sud'),
('\◊No∫Gö\Ú^Y∏\ı8','Albanie'),
('.º°>SKYì\0>xSo≤','Alg√©rie'),
('\Õ\–\Ï˙˛∏H(æ,\«TJLæ','Allemagne'),
('\Ës\Ï\\1Ngµ§Q\Œd\ﬁ\∆','Andorre'),
('&ú.vô J0óUIQ˙˛_°','Angola'),
('&Æ$\–\ÔMá°ïï\◊\Áf\0','Anguilla'),
('&™Oä{JØ≤xX^\˜2J','Antarctique'),
(']W´\0ÜG™Æ	Ä:í˘<','Antigua-et-Barbuda'),
('-ZYµ[G›Ål\Û\Ù\Í/#ª','Antilles N√©erlandaises'),
('íÇ\0…ñbJˇ´PeKAM%','Arabie Saoudite'),
('\Ê\Ì16\„{Cw∏y\Ï\·<,5®','Argentine'),
('ÄùrAFπ\\Q\Ê¢2\˜','Arm√©nie'),
('∂sπZ(Gä¨Aã^!™','Aruba'),
('\Û\0sQ}Fhú\Ù+\À\‚\ s<','Australie'),
('n\\∆~I¥¢“πrnò™G','Autriche'),
('πüî\Óñ\‡IZ≥Ñ¢\Ó93m¢','Azerba√Ødjan'),
('oPÑ¢|0J∏Çv4‘ê•\ËY','Bahamas'),
('#/:VK‡±≠v\Ì|;\‰\ÿ','Bahre√Øn'),
('¢øHåx[O˛ã8˝hÜf','Bangladesh'),
('åZñ2¯N◊çAºKC”ïM','Barbade'),
('\›\Ù\’Q\÷fJb≥˚2]|†˚§','B√©larus'),
('¿\‘\Ìâ\€HöõÜê@zqda','Belgique'),
('Å<¬§ÅMMìﬁè\ÂLº[','Belize'),
('6p\Û\»F∂˙lÄ\¬\Ãj9','B√©nin'),
('Whø\‡\ÎCXì\≈e¥]\`R','Bermudes'),
('º\À\Ÿ◊®BLòÆZ6\∏[≤','Bhoutan'),
('øP\’Z@∂í´˘¿3¿\‰ª','Bolivie'),
('b \√¸oìH≠ø}0}Õ∏	','Bosnie-Herz√©govine'),
('è¥\\Dì\rI—¢\rô¢\Óß+N','Botswana'),
('µñ\ÀÀ™:G¥mÅ\"©∂\0ã','Br√©sil'),
('m˚k0y\ÃJÏ∑≥\Œ\ˆâ®\Áh','Brun√©i Darussalam'),
('\’ˇ\Í¢\⁄3LXôCír\€\”v','Bulgarie'),
('˝ÅKS\◊\ L˚ûJìbe˙\Â3','Burkina Faso'),
('NH¿¢A+ÑÄX8ã∂a','Burundi'),
('à≈ÑéA◊º2Ñ¡°K\'\Ô','Cambodge'),
('¨\ÿ\ZπBDÆÉ°ß◊•\'É','Cameroun'),
('ê\ ˘>G\„±*z_\Í˘$≠','Canada'),
('BJö\ÚK<J:ãD˙øí#k','Cap-vert'),
('ß˝Cx6BÜá°˝\Ë–´X','Chili'),
('`¿ïE[ét@¥ú@!','Chine'),
('N-3RArH}π-ç˚\«/4ü','Chypre'),
('$\˜\Ós@°¢Àò˙]3fq','Colombie'),
('\ \«+%\—MFPõ\ÍNdoB','Comores'),
('èóJ\Ú¸I÷øê}SVCò\','Costa Rica'),
('ä“Ø}b @èè/ûA\ıÉõ	','C√¥te d\'Ivoire'),
('D≤\Ÿ\'\'!Iã†<#\‰®	d\ﬂ','Croatie'),
(')D—ü®TL¿≥æ\»jq„ú•','Cuba'),
('\Ú]û	(B¬ã\”#˙M-p','Danemark'),
('\»\ı	¨\˜\ﬁD¥Ω¨§%¶1-','Djibouti'),
('ºøpØ/D†∂˚\Ì≤Lˇ','Dominique'),
('ó;©\ÿ∏@ÿØ\Ã\∆o\√\nûV','√âgypte'),
('\Â*\ÿzS@ñ∫/hI∆ô','El Salvador'),
('Y@ ñ\ˆkK0å|b¿\Ê7v∫','√âmirats Arabes Unis'),
('\ˆè\"ÿ≥\˜Jà¶?±*3óŸò','√âquateur'),
('Íßä@\ÎIŒõù\“\ˆ\ﬁJ%','√ârythr√©e'),
('í$ß\Ë@:∑].ÜA_,!','Espagne'),
('\é:\Ÿ¿CÉ¥/$®\Ê™','Estonie'),
('\»+úB≠\ﬁE»†!ÌïÑ“∏4','√âtats F√©d√©r√©s de Micron√©sie'),
('%õün9\ÊNí†\Ï\‰®4~','√âtats-Unis'),
('ªk4.\‚]O:Éo?yFaó','√âthiopie'),
('˙g\”?\›H∞Ä\À\Á\"∏jk','F√©d√©ration de Russie'),
('YCjd•dH®æå®ã:\Ê8','Fidji'),
('a\Ã\‚Hõ*Ià¸\’K\Ùò∏','Finlande'),
('˘?∏º\Ÿ\ÔNkçr≤áC\€1','France'),
('•0è¯πyJfΩ\ﬂT%èwjF','Gabon'),
('BPè\ﬂDn§U}ê\Œ.Vî','Gambie'),
('˙∏}πh@í§nˇÆÇ\À\√\›','G√©orgie'),
('©7q(EoCÏ¥á\ÿ\Êc˝øÜ','G√©orgie du Sud et les √éles Sandwich du Sud'),
('0˙=†´Ü@\‚¥0\»mÑ \…','Ghana'),
('oV*V±Fèüj\·\"÷∂ì','Gibraltar'),
('`Iπ⁄π\€C¸à†⁄ºÑ9','Gr√®ce'),
('\„¯S7˘>Od∏#L31±C','Grenade'),
('îs{ÇùK/°É\ÁOöu','Groenland'),
('-µx£1ìK”û@\ÓN?ˇkB','Guadeloupe'),
('ä á\À\∆FJç•÷≤CY¨Qm','Guam'),
('GCì˝#ãE∂øÇé\Ú\rú\Òã','Guatemala'),
('A†pBN\‚L+ñ\˜o2æ','Guin√©e'),
('&ºypNÒ∏¢ív\Àˇß','Guin√©e √âquatoriale'),
('#ﬂé¶*\'B†\‰ö/Èîè','Guin√©e-Bissau'),
('ù˝>ã≤@û…•´Æª\‹','Guyana'),
('üFg©LAëÑ¨\·^V∂Ä','Guyane Fran√ßaise'),
('ÇÅ\„¡óÅ@Vò\Ì\r<\„\—£','Ha√Øti'),
('ü\n≠N\÷\ﬂ@<ÖB\Òv\Ù\’fú','Honduras'),
('z\˜°jOï¶\Œ\”\0\ÎPæ','Hong-Kong'),
('c\√4&\≈Jçï\›.π\È\Úõj','Hongrie'),
('í\“Ch‹íF\Îù4æ¯êHà~','√éle Bouvet'),
('⁄¶\ı\«IU≤€ÜSé-U','√éle Christmas'),
('$HzúvOHo±≥@\¬kµò∂','√éle de Man'),
('Ñ\«ºà˘N≥ô\ˆL¥K∏.','√éle Norfolk'),
('∫ö\Ô\’¡A∞ö.rìWF~','√éles (malvinas) Falkland'),
('0¯\‚M*LM†MOfjÆ','√éles √Öland'),
('aØòπ|DªäÜK\Ù\ˆ\“Iv','√éles Ca√Ømanes'),
('´2B•s@ñT\ÿ\Íÿúñ','√éles Cocos (Keeling)'),
('p\Ì∂r+BåΩ•l¿˛h','√éles Cook'),
('¶ÿêüGŸä=_Xá+\œ','√éles F√©ro√©'),
('\”Jñ.\“VO·Öò¶ﬁáw(`','√éles Heard et Mcdonald'),
('¶Oá<hQJmØ\È\Ëry¨)ñ','√éles Mariannes du Nord'),
('*\Œ˝Ló.D∂ÑIY¶Læ/','√éles Marshall'),
('EN\“\◊o\ÿErãpC\Ù\Áá\÷','√éles Mineures √âloign√©es des √âtats-Unis'),
('æ¶\Ó»•(H\ˆ¥ô1Ø¢-\„≠','√éles Salomon'),
('Ém\œN\Ùâ@\‚õ=®j)\‘','√éles Turks et Ca√Øques'),
('\Z∫Mö†XEÆÆù∞\≈4\Ú\¢','√éles Vierges Britanniques'),
('ìæ±›ª\ﬁNëê\·¶r:8','√éles Vierges des √âtats-Unis'),
('§\ˆã\Ù\≈\–I«∫\ˆ¯ê„ïπ','Inde'),
('/ªÑ:2Exä‘áH\ˆ\» ø','Indon√©sie'),
('¸‘óá\ƒtH◊ä\íØTêè\Ì','Iraq'),
(';à\Ï@\…Ckõb\Ïê\‡ï\n','Irlande'),
('\ƒ≤I≈•@f¢\0.Ü≠º','Islande'),
('{\¬¸˚Q®G\Ú§b\Ïº‰µÇ','Isra√´l'),
('∆Ñê\ L-¥&U¢†_%£','Italie'),
('\ﬂ\„›Ñ\Ê∫Cf¶¶\œ0à´:\Í','Jamahiriya Arabe Libyenne'),
('Y\ÿ\ÕzóL¬Ø2\—*g\€\ÌZ','Jama√Øque'),
('Å\Òe\ÚAÄ©H\Ë¨\ı∞','Japon'),
('\”f G\“MHÅP\Ê¥h J','Jordanie'),
('§.\Í\ÍëB˘ëMaÖ<î6z','Kazakhstan'),
('\Í\–\¬I¨K˙ß-\0∫T\·','Kenya'),
('S,\√lˇG ì©3\…|,|¢','Kirghizistan'),
('ﬁé;6≤´J¬ÉΩHõ‘†˛','Kiribati'),
('ÇbÑÿ°Nå¥oìöB(†','Kowe√Øt'),
('$\'^±l~NZ†:Z¥≤\Á\„','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('u–ë\√i]K%£ñ9£\◊”π','Lesotho'),
('å\√˛÷îCù¨Vñ\Ûm≈°.','Lettonie'),
('Ωs_∫˚\ÃN¥´S\À ì\Ì\‘','Liban'),
('±e\Î\ÓÉE†áùA\\’\‡\‡I','Lib√©ria'),
('\Ù\—◊≤\Ï?Fl≥\r\√NÇ','Liechtenstein'),
('üy¬ö\ÁÄGDí1\”¸!\n7','Lituanie'),
('Ä\À(-_DÄòÕîbkìì','Luxembourg'),
('\Îä2ß?B€Æ}y]˙#D','Macao'),
('¶¥\È\ÛmB∏¨M=\–_çG','Madagascar'),
('⁄õÕû\\¶D9Ä\\p\Œ¡%','Malaisie'),
('7;\—Ao\ˆBƒúzß\·u∫´\“','Malawi'),
('π\n-ï©\ﬁLéµµr\0ÖD','Maldives'),
('\n?OU\⁄D™f ≤\⁄¯\Ì','Mali'),
('E£\≈_¡ˇA\0ò:#_\Î\Ó~','Malte'),
('j#_cWVFíë±WaL© \⁄','Maroc'),
(':í\ÓS\¬H¨Ürsr\'C~','Martinique'),
('\Ú\À}mEπåÇX=?˛\Á','Maurice'),
('Ø-pè°\”M∫6jkK\Ì-\Í','Mauritanie'),
('cΩ•îÄRM˝∫˘\œD∫B˙m','Mayotte'),
('$[ÜÖë§O∫ì◊±˘\Ú¡	','Mexique'),
('-ï˛ ∫@aâpÑ˛ÆΩi','Monaco'),
('XgÇﬁçA”πt*A\ı\‹n','Mongolie'),
('\‹°À§O#¨òlAM!\¬!','Montserrat'),
('\ÕhIé\ıND<ÇÃ®˝èè\Õ','Mozambique'),
(' fw\Ù\ÂK\nùP1ç8\0','Myanmar'),
('NYq™°I.∞£\·®*5','Namibie'),
('\∆ãá\ˆ∞Oô°Ä°Rî;S¿','Nauru'),
('ó∫,^õkMyÜcΩ√¥Ç','N√©pal'),
('/;m\”[K®òR$àdv~','Nicaragua'),
('πÜü\Ÿ!oM8°˘õO\”Bó∫','Niger'),
('\Z[êû2ôAΩÅ!:Å\ÔR\„','Nig√©ria'),
('\—6∂™öOp∫\»¸\ BΩ','Niu√©'),
('OﬁèY\ŒkM;òûD\‹æˇ∫','Norv√®ge'),
('ˇE£\„ÖJ®\ıq\·%/0*','Nouvelle-Cal√©donie'),
('Øêè{4-AGÇ\ÎT¿ÅE´','Nouvelle-Z√©lande'),
('dòw °\ÁCì´	ô æfã','Oman'),
('íóä\Ó\Õ\«CÅû\\ª≠Å\ﬁJ','Ouganda'),
('^\◊,\\v@ï0\\\Ù\–%ß\ ','Ouzb√©kistan'),
('y∫∏\ÿ	PFT©ï\ÌP§p0d','Pakistan'),
('u\› sLà¥\\[∫\"˙\¬\Œ','Palaos'),
('è1\⁄¿jLJtë\√POi-','Panama'),
('ë:ß\Âë@@Z±\Ã32Êñªz','Papouasie-Nouvelle-Guin√©e'),
('=$ú \⁄@\\ìZÑ˛)uπq','Paraguay'),
('c&\"x€ùGQëc\¯x\Ò\8','Pays-Bas'),
('µ˚\˜&\◊@Çà8s\Á\Î≥\÷Z','P√©rou'),
('ìæd%âûA\\ÑÇ∂\0\∆ﬂ™','Philippines'),
('ßˇáI*\\H≠äFl5\n,a™','Pitcairn'),
('µ ªπ¢\ıAŒ∫ á∞≤¶\ÍI','Pologne'),
('\√÷Øß$NSé¨2≠ç\À','Polyn√©sie Fran√ßaise'),
('c\ıºF¯ä}O?¨&\ﬁ%','Porto Rico'),
('\Î\Ù˙\ı\ﬂ\ÂA`∂û•Ñˇö¶\Í','Portugal'),
('g¡∏\∆)I¬àmwa\Í\·Ä','Qatar'),
('π>áfòÑH\‰≠\ÒÅ\»R\Ã','R√©publique Arabe Syrienne'),
('º‘£¢\Ã¯ED∑7\rõ%\’˝\ƒ','R√©publique Centrafricaine'),
('S∫*\”bEKCå\ˆ¯ç8','R√©publique de Cor√©e'),
('b˝üJApæ†p\ﬂa∫d','R√©publique de Moldova'),
('Zâ|e*nJ:êh\ \à','R√©publique D√©mocratique du Congo'),
('=\€\Ã\‘\Œ@lôgB\‡\€Ω','R√©publique D√©mocratique Populaire Lao'),
('\”(\›\ƒEwé\‚O+\ƒ%\“','R√©publique Dominicaine'),
('±]ä\'©8@ûò◊†§ä\"J','R√©publique du Congo'),
(';?ä\\iDØ∑Mò\nàô`\r','R√©publique Islamique d\'Iran'),
('mO\r¸C;Bèö¯`ß˛Ñ\–','R√©publique Populaire D√©mocratique de Cor√©e'),
('≥,b\"\ÀdKÜº†d\ÿ@ô','R√©publique Tch√®que'),
('|4ª7\€B\Ì∂`ê2íT','R√©publique-Unie de Tanzanie'),
('\˜%A?\nB›æ¡T!9ú','R√©union'),
('\ÛÖZ*:\ÙO≤öû\\0Y\œ','Roumanie'),
('lJx™(Cwû\ÿBñfy\·','Royaume-Uni'),
('zªs2	Cu≠eπ9x	ã','Rwanda'),
('Ω\n\⁄\œAK\·çG´çÇ\◊n?','Sahara Occidental'),
('p¥£\√j\“M’Øö;=]èñ','Saint-Kitts-et-Nevis'),
('U\‡JO\"D¢ø{/9áK\»','Saint-Marin'),
('ô\Zh¿∑L]∫i\Â\’\ŒFe*','Saint-Pierre-et-Miquelon'),
('[;º\'≠Ne©\€–ÆÜÇ','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('K˘å0N≤£Ç∏áTJ ','Saint-Vincent-et-les Grenadines'),
('0\˜\–?wB,òç)F¿_','Sainte-H√©l√®ne'),
('\◊\“%Æ4\˜Dˇ∂;Ç\…kY\’','Sainte-Lucie'),
('\À\˜,≠L{à&üu_I¨','Samoa'),
('\\\„\‘\Ï\ıRH[º\‰*\‡’ã\˜3','Samoa Am√©ricaines'),
('\—\Á>ªL˝êP\‡”ÅD\Òù','Sao Tom√©-et-Principe'),
('fòwb\Ï\›A:ô\·m\„2x','S√©n√©gal'),
('\\K,\÷}L”´Ze\"ü\–b','Serbie-et-Mont√©n√©gro'),
('\È/\€\‰=HÄæ¨\›=ã\'\Z\ﬂ','Seychelles'),
('<y\"V∏PJ/∂M%PA¯	B','Sierra Leone'),
('à\’»≠iDÿºæÎ∞©QG£','Singapour'),
('¶˝ÿ•:WF-ï\·\‚õkv\Î','Slovaquie'),
('*Nìxi∫N{à\ \Ú6so%','Slov√©nie'),
('â\ÚG\∆&\ŸJvãå¿\◊!1+','Somalie'),
('\Á2{î\·Iã¶a)\'ß','Soudan'),
('.Ñ°	\ÛIbçf´ã\Í†œ∏','Sri Lanka'),
('éQ_0ksMsê$\’˘[]n\÷','Su√®de'),
('\ÊU˝èÆLVß\ƒ!Ü\Ÿ`öé','Suisse'),
('Y≠\În˚M“©f\Ô¿”§f\Ê','Suriname'),
('UY¢N\ZåR\’\·¸\À','Svalbard et√éle Jan Mayen'),
('íï\›\ÀKΩ†&2¡∂˘x2','Swaziland'),
('ï\Z°8∫ÇD•ªí,˚®\Ì©8','Tadjikistan'),
('2\⁄#O5å\„Soπ\'','Ta√Øwan'),
('qóf\ƒEBßÄ\‚\ƒ\n\'∫','Tchad'),
(':\‚!(NrÉ≥}™\ÂöD9','Terres Australes Fran√ßaises'),
('cF\Á*G Hú–πë£ã','Territoire Britannique de l\'Oc√©an Indien'),
('“Ä˛\⁄\€E4°\÷◊à\È\‰\','Territoire Palestinien Occup√©'),
('\‚ëW\‰¸	D§Ç#ô’±h\Ã','Tha√Ølande'),
('h5\÷Uµ\“EÑ¨lí∏]=\r','Timor-Leste'),
('HØG\È\Á7L\„¨\ÔRpÑ0f','Togo'),
('\ﬂ\‘\ﬂ\ı\—HC(ºÜØ∏	S˛H','Tokelau'),
('\Í\ıA(\ÍDﬂ†Öw¶Õö\ˆÅ','Tonga'),
('¸héX¶H∂≤	£∏\"ô','Trinit√©-et-Tobago'),
('°pkÆåM ¨Çß\ÌÆ>','Tunisie'),
('r\0 òS≤L}æ≠∞[$\ÓÑ','Turkm√©nistan'),
('i\'û£∞DuêuëOq\ÈÑ','Turquie'),
('π\˜\·?	A\·±\Î\ZK\Ô´{\Ê','Tuvalu'),
('lp]¢¥E⁄Ñ¶†Y\È¯†ò','Ukraine'),
('L¸∏¿ä¢LÜ\À€™\›•','Uruguay'),
('\«t%\Z˘\ŸIníi\ﬂdÅÑª','Vanuatu'),
('pG≥oXMD™ç¬±\ÿNä!','Venezuela'),
('T#\ÎÇ`2MTíBî£≈ªü','Viet Nam'),
('õÈ•∏/¥KlòŒÜXR:\r','Wallis et Futuna'),
('E≤\-äbLsÇÀ∑˙{ø§|','Y√©men'),
('(x8Z4MÆ\€¨\0˛Üá','Zambie'),
('o\ÙPeO“ñ5ó∫\À\–M8','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-09-16 07:06:20',4),
('DoctrineMigrations\\Version20240201152951','2024-09-16 07:06:20',2),
('DoctrineMigrations\\Version20240202084749','2024-09-16 07:06:20',2),
('DoctrineMigrations\\Version20240202150901','2024-09-16 07:06:20',3),
('DoctrineMigrations\\Version20240207105701','2024-09-16 07:06:20',2),
('DoctrineMigrations\\Version20240319212437','2024-09-16 07:06:20',2),
('DoctrineMigrations\\Version20240614133504','2024-09-16 07:06:20',13),
('DoctrineMigrations\\Version20240617165906','2024-09-16 07:06:20',10),
('DoctrineMigrations\\Version20240708061729','2024-09-16 07:06:20',12),
('DoctrineMigrations\\Version20240801202153','2024-09-16 07:06:20',2),
('DoctrineMigrations\\Version20240815153823','2024-09-16 07:06:20',2),
('DoctrineMigrations\\Version20240916065051','2024-09-16 07:06:20',4);
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
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `tasting_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `target_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `sent_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `link` longtext NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
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
('´\Ì/iöÆMí©\Ì˙|òVt','.•l5ãπLnöIΩy\≈\Ò7','\…5?0O§ÖÄ)\\¶ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-09-16 07:06:21');
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
('L\À#zO0±àj≠q¥s_','root@gmail.com','Root'),
('æm2\‹#Møåfh\—3[º','hugues.gobet@gmail.com','Hugues Gobet');
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
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `owner_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `participants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`participants`)),
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

-- Dump completed on 2024-09-16  7:06:22
