/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv
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
('´\ı\ÂB›óH∫\Î[\·PP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',259.99,'2024-07-11',NULL),
(')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','Ch√¢teau Latour','Ch√¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','æm2\‹#Møåfh\—3[º','France',999.99,'2024-07-11',NULL),
(':(\ﬁ\Ó\Ú!J°Äk[\'{¸','Domaine de la Roman√©e-Conti','Domaine de la Roman√©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','æm2\‹#Møåfh\—3[º','France',2999.99,'2024-07-11',NULL),
('N¥I\Ÿ}#IÑ¶çw™¸\Ã`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','æm2\‹#Møåfh\—3[º','Italie',899.99,'2024-07-11',NULL),
('^¿ë{üF\‰á\÷\€v˚\›\Ù_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','æm2\‹#Møåfh\—3[º','France',1599.99,'2024-07-11',NULL),
('c^Äú™Ø@ﬂÑÉÉœæ,U','Guigal C√¥te-R√¥tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'æm2\‹#Møåfh\—3[º','France',358.99,'2024-07-11',NULL),
('i\nÑsÇØNWíÕëÜ±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','æm2\‹#Møåfh\—3[º','Australie',1799.99,'2024-07-11',NULL),
('{\’]\Û\Â<AÉ§é^Ÿº\’\r','Ch√¢teau Margaux','Ch√¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','æm2\‹#Møåfh\—3[º','France',1099.99,'2024-07-11',NULL),
('ó-L\⁄FAå4S\ı¢\·\È˙','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\À#zO0±àj≠q¥s_','United States',199.99,'2024-07-11',NULL),
('µLØ\ÈCnG§îVajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','æm2\‹#Møåfh\—3[º','New Zealand',49.99,'2024-07-11',NULL),
('\Á\ÚG¶fF@ä\»%\Ó>\Îm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','æm2\‹#Møåfh\—3[º','Italy',899.99,'2024-07-11',NULL),
('\Í¬°\ŸI^Ä‹ì∞∂W\Ì','Vega Sicilia √önico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','æm2\‹#Møåfh\—3[º','Espagne',1499.99,'2024-07-11',NULL),
('\w™√§O\Zå`v∫\Á∑','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',1299.99,'2024-07-11',NULL);
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
('\‘\"ñ∑¬çLÀü˛ ™´k7=','Afghanistan'),
('§P°\∆∑BD∏\…\Ì(\Àj\Z','Afrique du Sud'),
('`=É4NïØMŸ©UàI','Albanie'),
('j5R \ÓâLIÇK˝¢ˇàÑ','Alg√©rie'),
('	8(˝zUK¨bmÇ\«<\ÿ4','Allemagne'),
('@í%=\‘C«á:øØmõ8','Andorre'),
('Ÿó±qMF§i¢\‰∂0C','Angola'),
('\√\—Mv©N\Ó±UdEb\Ï]ó','Anguilla'),
('é\ﬁgLò–ï_∞I\r•','Antarctique'),
('¶\Ôks<E¢∑r˝3\”Y\'','Antigua-et-Barbuda'),
('¿k\ÍVl\ÿH∫#˝≥V\Îwë','Antilles N√©erlandaises'),
(';C:Ø†BE∏>[¯ÿª\ﬂ','Arabie Saoudite'),
('a2\‘\ËéF˙èsHû1”Ωc','Argentine'),
('\„É˚káO¶¥J\ÏÙÉÇéK','Arm√©nie'),
('ó‹É\–	Ji£˝)G’àN','Aruba'),
('ö©c\ı\Ù9I¢\Í—∫y[ñ','Australie'),
('I\Õ)\›DC0∫\ƒ\Ú«öô\Î~','Autriche'),
('∫ñ˛]töJï£\”\‡2Ωb','Azerba√Ødjan'),
('\Â®\ÚhÖE\Âè7\À,∫\"ö','Bahamas'),
('\—X\ﬂ\—\›\H∏∫\¬Skí\◊I','Bahre√Øn'),
('\0\ë\Â\ÎHä∑\Õ√î\Ó˝:','Bangladesh'),
('©/ú\“\ÎD†ù©‹Ñzú-','Barbade'),
('É	_ßC˚ám>jq\'\r.','B√©larus'),
('è–¥∞5ÆC∆èÖ~\0´XÜ\Ô','Belgique'),
('á\nî∫\ÍIöìF™h´óµX','Belize'),
('DBx9ZHYé¨`ºN\⁄P\È','B√©nin'),
('.y%\'∞A\ÒÄ¸∞X5[','Bermudes'),
('è±\‡\◊I\Í±j™ü}x&\r','Bhoutan'),
('åYj	.SGõÅ6:ûF\ÒΩ','Bolivie'),
('>0úb %G&á(˚¶bß+','Bosnie-Herz√©govine'),
('\m,>t±NîÉ—êu\Ù\ƒn','Botswana'),
('¸\ıYØ≤QKÅ∫\·ÅV\Ùb)\€','Br√©sil'),
('˝Pï_\ÈßMOâ4U!ˇ\ÏY','Brun√©i Darussalam'),
('1u„öãFßΩ1\\\«\ÍÖ}','Bulgarie'),
('ùÄÖ\”NéG´ê≠µÈ•î©','Burkina Faso'),
('o*\˜øÃ∞AŒóg\‰˝î\Ô∆•','Burundi'),
('?y\ﬁc®Eã¥ñvo√°ê\Ï','Cambodge'),
('≈öã\'O}¨Ω\'qÊé£Å','Cameroun'),
('\≈9?ïÀÆGNê:¿(%òWu','Canada'),
('f©x>O\Ó¥jbõú˘Y¶','Cap-vert'),
('πo\"LAëñ¶-˝\»r™','Chili'),
('¡£†‘Ö£N\·ï\Ô≠,\ıÑ\”˝','Chine'),
('1◊úXz$JÑ∑ów~∑Õê','Chypre'),
('`©q¯§GîôRé\Îj∞è','Colombie'),
('\0`6¨hKí¶\ıXÆa˛U','Comores'),
('é—†≤vbJf¢˛”å&\·M','Costa Rica'),
('W\„Ü7ë\≈Nòﬂâµ\Ùá\∆','C√¥te d\'Ivoire'),
('K_\Õ\\÷MKπ\Ì\‚⁄π\À^','Croatie'),
('≥\ÿ˝¶(DéÆ\—\‘˘','Cuba'),
('\√œ∑9†ÖD1Ö\’X*\Ëç','Danemark'),
('∏¿(\"\¬\–Dﬁ≠aô	ù©+å','Djibouti'),
('íî\Œ\∆=ÄEé´\È^\Ì\Ë*\›','Dominique'),
('H\„}åÇB*ÉH8ùë¡=∂','√âgypte'),
('\›0ö∏µAqÑ*¨¥+°˚J','El Salvador'),
(')Ar\Âx@ç∂\Ê^πÆò','√âmirats Arabes Unis'),
('a˝;kI⁄Æ¨´Å\ƒ\ÿ<','√âquateur'),
('ä\0íMDìHI¨\Á\ÛfZ\ˆP','√ârythr√©e'),
('\—\Át±ÇA’∏˚\⁄\Èˇ\"Z[','Espagne'),
('0@√ú˙HÿÄ\«R[\0\…;E','Estonie'),
('\◊lD\Ì4¿Iºò˝Jx\Û¬†k','√âtats F√©d√©r√©s de Micron√©sie'),
('e˛î3C6û≤\np¿~\«˛','√âtats-Unis'),
('5Æá˛ÃóI7¢}\›U¸\√˛','√âthiopie'),
('a¨\«\‡á*A¶e7â\Í','F√©d√©ration de Russie'),
('(ÉEb¶hG¨±$\ËG\ÂÑ\…','Fidji'),
('ÇdY\Ô\ÛCô\\c«∂\Á\ﬂ','Finlande'),
('QL@\‹d\“C≥πg¿\’p\r¡','France'),
('eL\∆gG0ófg\0ÑG9ø','Gabon'),
('∑ù¸®˝\Î@ØÉC√§è∫üà','Gambie'),
('«º\÷,\r@!¥\÷MO∑õ?','G√©orgie'),
('\Óú:aã∫BFØë\ÌdL\\\"','G√©orgie du Sud et les √éles Sandwich du Sud'),
('®°\˜qDGµ\ﬁ!W§\œ\›','Ghana'),
('öJ\œs\Ÿ	Gì≠án•«ª','Gibraltar'),
('\Âå	ÖKh≠b3fU=','Gr√®ce'),
('˝§läQxOKÉ≥çÉã\“]e','Grenade'),
('¯ükKTºBFªn=X˙¿\…n','Groenland'),
('\ƒ˙\Ê\ÂyK$πra5K_z\‡','Guadeloupe'),
('O\·_\⁄\ŒˇMs∂\Û©9ù`v\‚','Guam'),
('/nó%ÉMeâ)ùtY–§µ','Guatemala'),
('\Õhç%\ÌåE¯™ó©YFX\\F','Guin√©e'),
('ì\Ó¯.\‹AÖë\”\ˆfF\ı\n','Guin√©e √âquatoriale'),
('¶Ω;FPyBoÖ\0rÅ_@\r','Guin√©e-Bissau'),
('\È„∑Ñ\ÚZI≤ñ«±\Œ\"J\\','Guyana'),
('R\ı==ØCÿ∂7J\Ù\…\Ÿ.p','Guyane Fran√ßaise'),
('µ à\›\øI¶ã\"\…-Äv≈ç','Ha√Øti'),
('\»\“–öµôI˛§mµOXÅ≥','Honduras'),
('r*Kç¶K ∫+#C>è\Ô1','Hong-Kong'),
('™!\«\Œ\\OIßßD\‰d\Â\ÿ','Hongrie'),
('|¡q9¶†G\\µ3\Õ\’~]Æ\Ò','√éle Bouvet'),
('ñí\Ã\€OÑÜÏÑåûF8\”','√éle Christmas'),
('\÷\Âj@dmEÜïæ?\ÓGñB]','√éle de Man'),
('≥+£§u\≈CG∫wpOm\Zh,','√éle Norfolk'),
('ˇˇWñõJŒ≤\"ú\Œ*¸^','√éles (malvinas) Falkland'),
('ò&¥	NCªˇ®ç\Ê^>&','√éles √Öland'),
('gO\ÃYi\˜Iπû˝Së-\∆#','√éles Ca√Ømanes'),
('I- m(G4öçrà\r\Ù','√éles Cocos (Keeling)'),
('=u\·ïd@sÑKP]*M&','√éles Cook'),
('\n\Ë∏B\ÛCØ¢Å¶ùPé\ \Î','√éles F√©ro√©'),
('¿¡P]ûD$éB˙ó=xí∞','√éles Heard et Mcdonald'),
('` ™\ÿ\ZMíòü$¢\Úâ\«','√éles Mariannes du Nord'),
('.r\”Jj\“MVîh}ˇ>\∆','√éles Marshall'),
('˚\\\›\Î›ÑI¯úú\Ìç.[\≈','√éles Mineures √âloign√©es des √âtats-Unis'),
('\‚∏\Ó`ç@≠ß\Ë\√\”«≤\Ï','√éles Salomon'),
('\ˆ\næê:H§ºBjz24','√éles Turks et Ca√Øques'),
('sb\ﬂz2+EÆ’ºëX\Ï™','√éles Vierges Britanniques'),
('ïI¿†wø@&øÖó\Å.','√éles Vierges des √âtats-Unis'),
('\Û\Êã@åO@dµ\¬3s¢\Ùß','Inde'),
('\ÎRØ>\ÒF¥πópR\Û#\÷','Indon√©sie'),
('}\Ï\ÿ5n2@¨◊ªTx^A','Iraq'),
('é¶˝\—\Ò@€©*c\ﬁ\"-6.','Irlande'),
('\Õ\¬1\Î!eMfè*Fj\‰æ~','Islande'),
('\ƒ’†πGE\ÛìOëç\ÍÇN9','Isra√´l'),
('>≤¢(Ω±AÅáÀö\"ôøy\Ì','Italie'),
('’Ñx\¬uπHr∞\ﬁŒΩ‚æø£','Jamahiriya Arabe Libyenne'),
('ø^ô>&G~¨3&\Í\‰FV\’','Jama√Øque'),
('ó\‹\ˆ	\›IÑãóu\r\Ã','Japon'),
('\Ãr>ê\»Dñêvï\Ù\È•Ω','Jordanie'),
('âfõ3ö#D”æ¥-g\r_\Í','Kazakhstan'),
('h≠˙˝\0lG¨πn\«“Ö∑z8','Kenya'),
('0¨6≤^LÉô\Ó\‡\’/Rà','Kirghizistan'),
('ENpp¢îJ ¥\Â¯6\Î|\ˆ','Kiribati'),
('V\ u∂m\ÀG›ó\›≠ëQ','Kowe√Øt'),
('\–lM%<E™¡˘q˚O','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('lô\€√ãG[ööS¨D\Óì','Lesotho'),
('â-\’\√\0\ Aó©.\Ã\”6\“I','Lettonie'),
('-w\Í_S\√M5çÅ\Ó∞2\Z?','Liban'),
('\‘ÿí≤KG}Æ¨\≈EÇ$','Lib√©ria'),
('\◊m\\,˝OAÉ\»˚Ç\‰z]\˜','Liechtenstein'),
('JMhî\ \ﬂAßé5ÿâ\€D','Lituanie'),
('®\Ëz)\Z\ŸLB∑:\ÈKπÅTJ','Luxembourg'),
('®[áÇ\€F\˜â.ˇq\„¯ó}','Macao'),
('\Î∫¡W<òD†\ı~\ËcÆ\◊\Ò','Madagascar'),
('DJÇ›ÖeL≠∑\”.Gî´]','Malaisie'),
('Ä\ÃfNfÑ\ﬂC>w\J','Malawi'),
('πG\Û≥\ÈE‹ë\Õ9ø\ˆ	å','Maldives'),
('Ws\ﬂfO∫±¢\'\ﬁkTo','Mali'),
('∑¡~&g;Gà∞e6Å\r,%\ ','Malte'),
(';ë\« ÇKl†\ˆ%º\Û','Maroc'),
('S\‚Up\—<L˝î¸ã\ŸQsf\\','Martinique'),
('YÆ˙kUF\ÌÄBC¬ëÜëì','Maurice'),
('ê„£ÜmFΩÆΩ∫ƒû!ï','Mauritanie'),
('Aö≥Nè\ÁN˝áû5{\·t%\Â','Mayotte'),
('ñ\Ì•¿òNH-•ûñûN\⁄\Â\Ï','Mexique'),
('¿EJú3Fﬂ¥{ëï¶\Ò\Úû','Monaco'),
('N\Z3|óùCΩ≥6ãè5ö','Mongolie'),
('vrïQ˙®Cêñâ∏\⁄5\ıy','Montserrat'),
('ùMá#+C\ÒΩu\Òö\È¥\0','Mozambique'),
('Å\„\ÏJñ\ÕDc∏êg\ \⁄\·ë','Myanmar'),
('8\ŸR™E<Ñù0ê\Á\Zñ\ﬂ','Namibie'),
('¸|ººD>õ~j\Á\˜\\\Õ\Ì','Nauru'),
('\√\ˆ˘%YE˘Ωl˙\–lñõ','N√©pal'),
('\«]\Ïˇ:/E2Ä5TH\Í™8','Nicaragua'),
('d÷¥M?LsßÄw|£%˝','Niger'),
('˘\Ù®X∂DNûÇ\·ìNl≤\÷','Nig√©ria'),
('∑@$ûJNT®˘p|\“\‘u','Niu√©'),
('\Ë75”û\⁄O\Ëú˝\Ã\n}Ch\ƒ','Norv√®ge'),
('”àØCr\ÓF∫ö±L\È“ü\Î-','Nouvelle-Cal√©donie'),
('è\0]∫Måüu˝\Á0\Ò\r','Nouvelle-Z√©lande'),
('˝ø\Ã\÷Ã®M£ªì~\Âidóè','Oman'),
('\»\ﬂ\‘\Ô\ÎkC©ñs´/\ÏSï','Ouganda'),
('≥\Îπiç\ˆH.±uG\‹i\Òl¿','Ouzb√©kistan'),
('£\Ó?M/@DãÉë\˜.ô*Ö','Pakistan'),
('∏R\‘\‚ìm@€ÇC{∏\œ\Ú','Palaos'),
('™	\Â∫Eõ≠ç©\—4@','Panama'),
('7ÜÔ¢®¿O“Ç}ê•\Œ\r\¬g','Papouasie-Nouvelle-Guin√©e'),
('\÷0k)ΩBÜí‘àJßÉ\\<','Paraguay'),
('\Î_\Îπ\›M¿∞£W\Îà[]T','Pays-Bas'),
('\ÁÅ2g>B\rüî¶S~—Éâ','P√©rou'),
('î\»x\»B<D∏∏˙FnQ\rw\‰','Philippines'),
('g…™BWíNß\Èäsˇ`A','Pitcairn'),
('ëSj.û\ŸN2¥\„\È˛\Ó\Î\¬','Pologne'),
('s\≈`Y\ﬂ3J\nû˚\„Ø\Û\‘*G','Polyn√©sie Fran√ßaise'),
('\ÂÆ8.á\€Ciπ-\—_\–‹Ä\Ë','Porto Rico'),
('å%∂¸aàD\Æ¥0µ:\⁄\“','Portugal'),
('∫a”ß∆¶F\r¢5çóC-','Qatar'),
('N)Ö\≈#GMÜä∑ª\€ q-.','R√©publique Arabe Syrienne'),
('\‘Z\"#>ÜJxΩ\ıàÆí\Z\‚\Á','R√©publique Centrafricaine'),
(';˛Ø\‘vFíty7\’Aí','R√©publique de Cor√©e'),
('\Áß\“\÷K¶O”±ú=cv èa','R√©publique de Moldova'),
('ï\Ô_èñLDÑ\Ÿp>ò©øP','R√©publique D√©mocratique du Congo'),
('åº|V¯6@n≥`∫€Ä\Ád','R√©publique D√©mocratique Populaire Lao'),
('˙B\⁄K\ÔwBZúìMX$\”m¥','R√©publique Dominicaine'),
('\∆\‹ˇ&ëJ®ë\“É4\r','R√©publique du Congo'),
('\æ\ÌWLä™õ\≈˘\»\⁄”ì','R√©publique Islamique d\'Iran'),
('µ\ﬂ\ﬂ\Ú˝%JeÅD\Êy9à`\⁄','R√©publique Populaire D√©mocratique de Cor√©e'),
('ƒÖ\÷\⁄(N≤≠\ÏówÖÃπ','R√©publique Tch√®que'),
('k\À\ˆ\ A¸ò5G™\Ï\Zö\È','R√©publique-Unie de Tanzanie'),
('ZnÑ\Óê\‡MQü–ìJ\‚\√sö','R√©union'),
('må˝ÆKóè«çg{ˇá)','Roumanie'),
('¶ß\–eΩL÷π\ÿ\ı6.1p','Royaume-Uni'),
('´ñˇ\≈˘@ø˚Œò\Ï\˜','Rwanda'),
('\Ì]\¬\ÁcDÉ¥\Œ\Áe˚\—gô','Sahara Occidental'),
('ìO≥\∆eM\rï;\‡∆ô∑H','Saint-Kitts-et-Nevis'),
('z‚Æü;#C*•Báø\‰FV\\','Saint-Marin'),
('µ∆ì•\‹PF¬ö(O!	jõ','Saint-Pierre-et-Miquelon'),
('\·Dzá_¡L\\à\„\…˚\ÿÄA','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('¨¡u\€\–DOvÖ>¡ão\ˆ/','Saint-Vincent-et-les Grenadines'),
('íõ!&^E\0ø44\Û*','Sainte-H√©l√®ne'),
('!w\".JJ™&WúV\Ÿ\⁄','Sainte-Lucie'),
('°\È&ö\ƒC\Áñt\"ã\Õ\ˆk','Samoa'),
('\’˛H^S≤L±ãtPZg','Samoa Am√©ricaines'),
('Œ±X∫\˜EIñ\›\ˆU∏Qeq','Sao Tom√©-et-Principe'),
('ïo<ØS®Mn£\Ô!7\‡\ﬂ','S√©n√©gal'),
(':3$_õA\Ôü5\„bå&o\r','Serbie-et-Mont√©n√©gro'),
('¥™I™EŸπ\ÌV™<i™5','Seychelles'),
('æx:§Fb∏în6v|™','Sierra Leone'),
('c7u)∂PF\‡≠\≈+Ñª°(\Ô','Singapour'),
('Ö9\≈\Ì@`ÅK¢k±UU]','Slovaquie'),
('*^\+$\√I<£∞\÷4\Ÿ','Slov√©nie'),
('dö`\ƒ˙YN\ˆé¶\0l\’A\Œ˘','Somalie'),
('J∑\¬bT8Bxî\'v)X','Soudan'),
('∑µU/\ÁcGÂùü\"É°\œ\0','Sri Lanka'),
('¨\„\Îb\ƒVNßïg1∫AfVÜ','Su√®de'),
('—∫¯∂\ZfF˙Ω\◊\·ZÜ\Ì]','Suisse'),
('^#\yX\ÍGáíj+\≈+Kn\⁄','Suriname'),
('@ˇ´§ÑIÿ∑∏¨V\‡C9a','Svalbard et√éle Jan Mayen'),
('l\Ã8Z˛ìN\\•	0gå´W','Swaziland'),
('\"|O\∆DJ\‡ÅƒòF<.|P','Tadjikistan'),
('≠ï€äé|M≤ê@ëí˙™','Ta√Øwan'),
('HØ¨b\Ë\ŒB∫\Ù_ˇ\ÙÇ˛','Tchad'),
('(.\ß“∞C”∏t~ÉîÉù','Terres Australes Fran√ßaises'),
('ät≥\ˆeA≠ãL\‹4ui\·','Territoire Britannique de l\'Oc√©an Indien'),
('\\Ê	-\œhCq∑\Î”≥Ω\'ºä','Territoire Palestinien Occup√©'),
('\"\Ót§\ﬂB`éUY\◊R°\·j','Tha√Ølande'),
('l¡†Ø/9AØ∞˙Ü\0Æ4\⁄','Timor-Leste'),
('@≥g0\ÒyHÁ´Øà@8\"U','Togo'),
('èâ;f∑gL›Å-5\ı@≥•v','Tokelau'),
('\’Sv∏Y\«M∫∞\˜_Tx\Â`','Tonga'),
('ödg),@[ú}\Ìñ\‰\‚m†','Trinit√©-et-Tobago'),
('Æ\ZrR@√ÉK\√q\Zó§','Tunisie'),
('í≥Ñø¥G.Æ˚\Î≤T','Turkm√©nistan'),
('MÆXæâ?G™ê6\ÁíUi 9','Turquie'),
('\ÁÁÉß¿\ÈC±æ≤ò¡»î¢J','Tuvalu'),
('∑¿jòNI∞ß\ı\À4•','Ukraine'),
('å\’G\‡Z;A±’°n,≥ˇ','Uruguay'),
('\Õ\Ó	!q}HZù)\÷\‡\Ÿ\ƒ\◊','Vanuatu'),
('Ωò¬ø ëGxóa\÷D‡ßü','Venezuela'),
('\ÿ	—≠O\\∏c`\ (u\ÿ','Viet Nam'),
('\Î\*äπCMµœè\«\‚:K\“','Wallis et Futuna'),
('MA”Ø\Ë>DÖ©Æá!\‘\‡#','Y√©men'),
('3˚\\ÇJä†]ô\⁄N\»\ÿ ','Zambie'),
('Ø\≈\Î˛ã\ÿC\0∞\ÿ&N’Ωyh','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-07-11 07:29:18',3),
('DoctrineMigrations\\Version20240201152951','2024-07-11 07:29:18',2),
('DoctrineMigrations\\Version20240202084749','2024-07-11 07:29:18',2),
('DoctrineMigrations\\Version20240202150901','2024-07-11 07:29:18',5),
('DoctrineMigrations\\Version20240207105701','2024-07-11 07:29:18',2),
('DoctrineMigrations\\Version20240319212437','2024-07-11 07:29:18',2),
('DoctrineMigrations\\Version20240614133504','2024-07-11 07:29:18',10),
('DoctrineMigrations\\Version20240617165906','2024-07-11 07:29:18',7),
('DoctrineMigrations\\Version20240708061729','2024-07-11 07:29:18',12);
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
('´\Ì/iöÆMí©\Ì˙|òVt','.•l5ãπLnöIΩy\≈\Ò7','\…5?0O§ÖÄ)\\¶ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending');
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
('.•l5ãπLnöIΩy\≈\Ò7','ôd\Â9ˇF≥úˇ\÷\—∏∑','^¿ë{üF\‰á\÷\€v˚\›\Ù_','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]');
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

-- Dump completed on 2024-07-11  7:29:19
