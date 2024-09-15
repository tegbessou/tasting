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
('´\ı\ÂB›óH∫\Î[\·PP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',259.99,'2024-09-15',NULL),
(')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','Ch√¢teau Latour','Ch√¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','æm2\‹#Møåfh\—3[º','France',999.99,'2024-09-15',NULL),
(':(\ﬁ\Ó\Ú!J°Äk[\'{¸','Domaine de la Roman√©e-Conti','Domaine de la Roman√©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','æm2\‹#Møåfh\—3[º','France',2999.99,'2024-09-15',NULL),
('N¥I\Ÿ}#IÑ¶çw™¸\Ã`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','æm2\‹#Møåfh\—3[º','Italie',899.99,'2024-09-15',NULL),
('^¿ë{üF\‰á\÷\€v˚\›\Ù_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','æm2\‹#Møåfh\—3[º','France',1599.99,'2024-09-15',NULL),
('c^Äú™Ø@ﬂÑÉÉœæ,U','Guigal C√¥te-R√¥tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'æm2\‹#Møåfh\—3[º','France',358.99,'2024-09-15',NULL),
('i\nÑsÇØNWíÕëÜ±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','æm2\‹#Møåfh\—3[º','Australie',1799.99,'2024-09-15',NULL),
('{\’]\Û\Â<AÉ§é^Ÿº\’\r','Ch√¢teau Margaux','Ch√¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','æm2\‹#Møåfh\—3[º','France',1099.99,'2024-09-15',NULL),
('ó-L\⁄FAå4S\ı¢\·\È˙','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\À#zO0±àj≠q¥s_','United States',199.99,'2024-09-15',NULL),
('µLØ\ÈCnG§îVajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','æm2\‹#Møåfh\—3[º','New Zealand',49.99,'2024-09-15',NULL),
('\Á\ÚG¶fF@ä\»%\Ó>\Îm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','æm2\‹#Møåfh\—3[º','Italy',899.99,'2024-09-15',NULL),
('\Í¬°\ŸI^Ä‹ì∞∂W\Ì','Vega Sicilia √önico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','æm2\‹#Møåfh\—3[º','Espagne',1499.99,'2024-09-15',NULL),
('\w™√§O\Zå`v∫\Á∑','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',1299.99,'2024-09-15',NULL);
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
('\Û\\{7üL4ö\Á—â\…\Èr','Afghanistan'),
('\‡\€Jl]\'Anø\’R\ÔJT¨4','Afrique du Sud'),
('Yè¥∏oIæ∫\◊?é∞j\≈','Albanie'),
('é\0\ˆ\√!B∞©\„gømì\0','Alg√©rie'),
('oÉ&*AL·âó\Œ^ºè\Œy','Allemagne'),
('O”≠TúDBó∂ëì!\–\Ï>W','Andorre'),
('˚j∂l†ºFÄ´E\‹üçm\n','Angola'),
('\Ë_AõhLÆ\“	ó\n+[\È','Anguilla'),
('ªÜ\–°\ÚA\Ôª\◊k™˝\∆d','Antarctique'),
('åeB¸\€M√Æ”∞60ïû','Antigua-et-Barbuda'),
('≤≥J€∏IIø≥w\Ú˙¡ù','Antilles N√©erlandaises'),
('ô7¢⁄∫C∞©ö|Um?\Ù','Arabie Saoudite'),
('ÆÉÅÅDûE.ª¡ k‚ìöÆ','Argentine'),
('\÷X<¸sgA7≠by°~Æß','Arm√©nie'),
('Ü\Ûfz+BÇüA>ëzR*`','Aruba'),
('Bê\ﬂ(@ºLŸú\\†T§|l','Australie'),
('x\Œ\–dYB`îe∞∏¨?s','Autriche'),
('∞,‘ùX\ƒL˛ªöí≈®áD','Azerba√Ødjan'),
('\Ã˚D§\‚HG•©\◊õtù\„\–','Bahamas'),
('ÉT\◊6QDÿÜ\‹]zﬁû\„','Bahre√Øn'),
('¿\ŒCï¸O±çZæ\Ê¸®†','Bangladesh'),
('\Ávß|D´π\Ú~™~F&Q','Barbade'),
('`F\ÈÂã§O<∞\Â\Z∫\0ë¢','B√©larus'),
('8\¬\Œ\ˆ˝ÆDŸüÖ±†…íóˇ','Belgique'),
('£MB\ÙüOGÆñ^\'û\∆\Ô','Belize'),
('\⁄\‰âQ≠D\0≥Ø\Ûw\–p9','B√©nin'),
('\≈vFXK2DBÄ\·Ö+˙<','Bermudes'),
('¸C~ï N¬≥\n∞-\ÈJ\∆\Ô','Bhoutan'),
(']∞˛èèµC\ÔüT\ƒ{˛©z','Bolivie'),
('#]˙H˘@éåEµ™≥7D\Ë','Bosnie-Herz√©govine'),
('\ŒzŒÄA5ç\Ÿ\÷w\«[\Êô','Botswana'),
('€âßíbpAIí\Í\Ô^\⁄bà','Br√©sil'),
('\€\€\ÁF,Ñjí\\=:˙','Brun√©i Darussalam'),
('?Ä\ˆK@∑LÈ†õf_\·ª\…c','Bulgarie'),
('l$°\‘H–éçƒî5ØC','Burkina Faso'),
('©Ü|Ç:K’Ω\˜N_\∆µ','Burundi'),
('±á-≥!mGÿÅL#\ÃﬂíI;','Cambodge'),
('\ÙS$0Nôñˇ\“z#\ﬁ','Cameroun'),
('´:n6Õ¢JEî5©jö¶2å','Canada'),
('\Í\…j¯p]Fçà;\∆\Ò•P+°','Cap-vert'),
('¿E∑W\rzL≤•N\˜\0\Ê˙\‘|','Chili'),
('\„JV\‘\ÚD\Í™\√º9¥j','Chine'),
('$.\Ì\ÏÆcI0Å°e\Œ^]X†','Chypre'),
('Po	\Ë\‡1A¬ê)d\›\Î8ë','Colombie'),
('Nù\€\‡°DÃ¢T82W¥s','Comores'),
('j?¨Gv•Däñvß\n,\Ú','Costa Rica'),
('◊ä\Î\ËAó≥0Ñ8ª∑','C√¥te d\'Ivoire'),
('%∂g\Ï8EÕπ\≈k[)∞	\Z','Croatie'),
('>©†U\‚E∏+}]dZmj','Cuba'),
('HØ\Ï\n5Dë°\«2\0ESE\Ù','Danemark'),
('\ÈV¯\‰ò\—Do£L/æ	R™','Djibouti'),
('\Ã›ÖÎ∑ßMp°PÀïñ_\Ú˛','Dominique'),
('7è=\Ó	H3•0P}\ o','√âgypte'),
('Y\"a∫sCëíO,=Çnπ','El Salvador'),
('¯u®\‡¿˘Iõw\»\¬)w\·\≈','√âmirats Arabes Unis'),
('\Â\'l1´Lûêh\È1Ÿçh','√âquateur'),
('JJº\›\«A©¥ö\‰)\—1ëõ','√ârythr√©e'),
('¨Vû2ÉiH3®r\ÀŒÅ[\‚≠','Espagne'),
('`∞íí\0£Hwèπ\Í¯E\“+w','Estonie'),
('\ òLç\‰CΩ\Û¬Ç{G‘¢','√âtats F√©d√©r√©s de Micron√©sie'),
('\ÈREÅ?L¿°\‹~\«\„&','√âtats-Unis'),
('zt>uπ	D˘¨7x{G£Z\r','√âthiopie'),
('\·æ_1£G•∂J\÷iDî\Ó','F√©d√©ration de Russie'),
('\Õ\Â\Ó\ÈNC®†bq£\'\–3','Fidji'),
('\“6í%–ÉKí∂\»¸´üë¯Ω','Finlande'),
('\¬F<z!K´“òºI\"\Z\–','France'),
('©3ñ\ OR∫\ˆ.\Ó\≈?\Ê','Gabon'),
('íè\«¸J\ıÄÊ∏´˘îˇ','Gambie'),
('ø£\Ì@\»@oà]ò*\ÑI','G√©orgie'),
('cy\¬\Â\◊\ÃCñå2Ω_µ™m','G√©orgie du Sud et les √éles Sandwich du Sud'),
('&\’7°à\·A®Öã°Æ¿SJ∫','Ghana'),
('ƒ¶2\…\€F∏ô.∞\Îß	g1','Gibraltar'),
('™Ñ°\Ë@[¶@ñb|iß','Gr√®ce'),
('¢ï\˜\Ï]XA<ï≠£¡)\Z&\÷','Grenade'),
('\Œ•}WªGúí+\”Cxô0','Groenland'),
('\'ä:v¨LB∞\Á\Îv∏\Úw•','Guadeloupe'),
('≠™,\È˚\ÃJ¿¨\Û\–\Ù\ \0P[','Guam'),
('iæ\ﬁ@w∑O[Ål1<\≈Ÿà','Guatemala'),
('´k∞[\ÈA!≤˘4ûﬁ°V','Guin√©e'),
('r\‚9·∫åM>Ö7æz∏¯\’','Guin√©e √âquatoriale'),
('ß|\Ï\˜N¶ë•Yäâ%\Á','Guin√©e-Bissau'),
('ßD?àHóΩ\\˙∂Pï;','Guyana'),
('\Áú\’\Û\Ù\ÚIåΩÓåûhòç\','Guyane Fran√ßaise'),
('1%\Ùy˚\√JKæ\⁄A\”Q¸s','Ha√Øti'),
('Vïòc©AgÑôQ\\\"ˇ\œ','Honduras'),
('•/ï[˙&Jò¢¿_r°\»','Hong-Kong'),
('£øNÄAjLäöÑ∏#\Î','Hongrie'),
('\Œ1mnØ\ÃF\ËòS‰Öπ®W}','√éle Bouvet'),
('i¥1\ÿ\–D\'å¿\«*°∆ä','√éle Christmas'),
('\⁄1\Ô¿ÑM»¨\nOMé\ﬂp\›','√éle de Man'),
('\r\Á\r\n§¢Gó]*OeΩöh','√éle Norfolk'),
('à≥Éì\‘\·Nf§\Ë°ug)D','√éles (malvinas) Falkland'),
('m\›\Ù\ﬂ$J3ÑÖ\«>ª†pZ','√éles √Öland'),
('¡\Ã„Å∞(OeµJ\Û9~b\≈','√éles Ca√Ømanes'),
('7\»V∂_3N°á4\"®t	\Œ','√éles Cocos (Keeling)'),
('\…\«g]%BGrñô\ÎPw•<D','√éles Cook'),
('\—\¬M$|%K}≥êπ¨f∑öW','√éles F√©ro√©'),
('¸ê£än@ÔüÑéΩ.±∫','√éles Heard et Mcdonald'),
('a\ˆPáCÂöò⁄∫ ãû°','√éles Mariannes du Nord'),
('V|P\Û/@≈öD6õ\Ê\ŸO±','√éles Marshall'),
('T\ÎVØ\Î•Dñå\ÊÖ\‘\Ú?i7','√éles Mineures √âloign√©es des √âtats-Unis'),
(' \ﬁ˚\ÎeAMêö}é!˛\÷','√éles Salomon'),
(']\ÃOªz\ÍBªd[”®á>\˜','√éles Turks et Ca√Øques'),
('\ÀuF\Ë˝ßHÅÉNT°\€,§&','√éles Vierges Britanniques'),
(']k%SAs•\€⁄ò\»','√éles Vierges des √âtats-Unis'),
('èI\∆\ƒ-\ıI≥å0glJ>\Òx','Inde'),
('\Ô\\s\÷*àFB≤NOﬂ∞êRs','Indon√©sie'),
('T\ÒΩ€π\ﬁJ∂ù{y¨úeN&','Iraq'),
('ã£˘ŒßnAàûjr∂\◊0','Irlande'),
('S\n^\ÎóNAö3TRIì\‰','Islande'),
('ÉÑ˚\Ô\ÏßJêùƒÖB\⁄','Isra√´l'),
('öî™_\Ì)K\ná«êL\Ùˇ\Î','Italie'),
('bruå%I÷çí˝?BØá','Jamahiriya Arabe Libyenne'),
(')^î#\‡Kjª±êV\0©\'','Jama√Øque'),
('áÖT\∆¡EÜ•+\Ï\“l&','Japon'),
('µ@\Î\ÉyG-ª\€HLN†˛','Jordanie'),
('À™FN:B\Û∂\„&\Â.´','Kazakhstan'),
('1xr\›sM⁄™7\ÌØ\À\Ô4','Kenya'),
('ñlÅ˚HZ§pUù0','Kirghizistan'),
('Ïãà¸˝J@¿°\0l{í\”','Kiribati'),
('u)°>\Ú`N\Z®ÜÅ∞	Çº','Kowe√Øt'),
('ò\ﬂ\‡O_Éê/fìß','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('/5\«rÜ0JÑ\Ë>\Ï|‹ä∂','Lesotho'),
('˝ëîéˇèLV±Ç>d\Ã\‹ˇ','Lettonie'),
('\Û≥\ÏLå_O>Ç\ÙÇKWn','Liban'),
('<°`\‘˚L|ßªûÜ#h¶ì','Lib√©ria'),
('¯áù~QiGëøOD¨\Í\l','Liechtenstein'),
('\Ù\'eé\»~LYß¶∏\»s\»B˝','Lituanie'),
('\»\Ù9s\ŒJo¶Ä\Ô˛B•\Ê','Luxembourg'),
('†\⁄qÅ±B;Çóv~:\«\˜\»','Macao'),
('+\n¥\À<C±§5&Ç\ŒS=\ƒ','Madagascar'),
('Ö\√\În{\‡C˚Ø J\nl\ƒ\ZD','Malaisie'),
('Q\ÿª/M´¨DA∫\\','Malawi'),
('v:TIúöO∞πu\Û®)\Ê\‚±','Maldives'),
(':ë\…FÄ\ÔKßï˛∂ª\»]éo','Mali'),
('o•!Ø\€E¶ù:\À`qí\‹','Malte'),
('≠K\"å\ÈÑNDÄ–ß›ù\Êx','Maroc'),
('@ä\◊gM\ƒOP∫º8à≤\Áé$','Martinique'),
('EX∑RKë\Îy{Ó•¥|','Maurice'),
('òq∞7≠Cèòï-˚\¬$','Mauritanie'),
('RU•íäªAP≤9µ•\"H7z','Mayotte'),
('”¨J\\–tH\‰â~£\'üCé','Mexique'),
('¯\◊tâHuG=è:°≥7^Z\È','Monaco'),
('pîÃÖTÆFœÑ]ç“ûäfF','Mongolie'),
('\ÛZmt\”HåßîZΩJíF~','Montserrat'),
('´\»~\Ì‹õC`°ª≤\Ÿ=^¥','Mozambique'),
('ß\'y\‰As¶ä+í\Z€§f','Myanmar'),
('nüQô\Õ\›HU¥\Z\n≤£±l','Namibie'),
('\–Esi\'πA Å\Õ\√O§¿j','Nauru'),
('î∞tecIÄö\√\ˆÑ\≈O>','N√©pal'),
('Ÿì˘\€E3¶\◊Îî∑Ü\Z','Nicaragua'),
(' \”\Ì\cÇJ†Tw¢=\∆\ﬂ\‚','Niger'),
('ò≤ã~OBÆÑõõ™~6','Nig√©ria'),
('ÕóÔ©ôBxÜ√¢+:æ\ˆú','Niu√©'),
('ˇløó\ÈKXª≈∂eøá','Norv√®ge'),
(' >Ä*\„E0Ø^ê‹¶t\‹','Nouvelle-Cal√©donie'),
('$\ÃiHKÄ\Zsˇ@á#\Û','Nouvelle-Z√©lande'),
('¿:U¥FPº˝V\„îG&','Oman'),
('%\’?vö¿Eü±P¸¸;πGü','Ouganda'),
('\ıB\‘\ﬂAﬁîìÖú\ÂyV','Ouzb√©kistan'),
('ñì¶O≈º\‰ŸÜ∂\ÒW','Pakistan'),
('∏B/Q\Ê}@Y∫I	&^\”\Ê','Palaos'),
('ô\Òdèƒ∏FEØ\¬#^9z]{','Panama'),
('ô}ﬂûk\ÀNbÖe\Ïs∞8\⁄}','Papouasie-Nouvelle-Guin√©e'),
('2R¿\Ë7N\\∑éTä˚\r@a','Paraguay'),
('\Ï\Ï||6∑@ Öòd§`(\…','Pays-Bas'),
('\“\Õ\Ú\»PDHß≠2!&\ﬂ¸','P√©rou'),
('í\‘4\œ@£å\"s(ˇ#˝','Philippines'),
('Åª\ﬂ	—ºF¥\œ\∆\÷0∂°','Pitcairn'),
('\€¡\ŒG9H•åí¬≥C}WN','Pologne'),
(' vp9/%Ió\˜â?ΩÖò\ƒ','Polyn√©sie Fran√ßaise'),
('f\Û\“>>Kc±∫k\ﬂH?∂','Porto Rico'),
('\ÔnH&3å@zÜk\◊\r\nnÖa','Portugal'),
('Ç\“\ÿN	EVîÇç\ SêL±','Qatar'),
('¸\\\Ìû\"\ÍO\ÊΩCr\ˆKo','R√©publique Arabe Syrienne'),
('n@°òï\ıNâºw± \ns\›M','R√©publique Centrafricaine'),
('-9á¸4ìH\Ûôò	©I\∆\¬','R√©publique de Cor√©e'),
('!Å˘∂~Lñ7º6\ŒP\Z','R√©publique de Moldova'),
('3Ö\€\Œ\–F¶¶⁄â À°Ü≠','R√©publique D√©mocratique du Congo'),
('§\ˆé!]∏C~Ü\"\\+Z~õ','R√©publique D√©mocratique Populaire Lao'),
('˝oSûNóêE>∑\ˆ\Ì\≈','R√©publique Dominicaine'),
('?çü\Â\ÍáCãó3áèD,','R√©publique du Congo'),
('ŸπV[\Í°@Y•I¸9<<nr','R√©publique Islamique d\'Iran'),
('†q\œMäCLØä3ß8\ﬁ','R√©publique Populaire D√©mocratique de Cor√©e'),
('%9∞\"+C.Ω¬ªØo)','R√©publique Tch√®que'),
('Z/Z¸HH[Ä\'+èrì','R√©publique-Unie de Tanzanie'),
('G\Â\∆\Ò≠gH;ôK∂d≠ó@','R√©union'),
('Uæ\ÀwÜnL§è\\Ó\…\\','Roumanie'),
('∏}\œrE˘ú>\Ÿ«úΩK\…','Royaume-Uni'),
('iÑ\nvµõI’∂\'®≠ë\Œ','Rwanda'),
('Q\ÓI∂\ÎΩIπµ#xDÅˇJ<','Sahara Occidental'),
('\ÒH8ÌñôJ\ÛΩ,\—;\’˛I´','Saint-Kitts-et-Nevis'),
('ô_gVyA˝É\Á\ÿT\‡îDh','Saint-Marin'),
('‹öWHÄFvÅqûo∞§','Saint-Pierre-et-Miquelon'),
('ò\”C[@lF—îcü$º\Ïü','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('\Ûµ¿:P;O°ãÇi:\–=\€','Saint-Vincent-et-les Grenadines'),
('\„m6\„ER¶Y\“\(\◊','Sainte-H√©l√®ne'),
('M4”∞@D\‚ä\÷gi≠Y≠','Sainte-Lucie'),
('(\∆\@\ÊÄê¯\÷.','Samoa'),
('\·cπoèkNtú:\0Ml\“','Samoa Am√©ricaines'),
('\ﬂÆ§°LM∫Ω&/P\Ω.','Sao Tom√©-et-Principe'),
('éA\»9:\»LW¶\∆\“&ir≥','S√©n√©gal'),
('ô∞S¶∂\⁄B\Zπ;áBS)4.','Serbie-et-Mont√©n√©gro'),
('ôP?î¨B\ÔàÉ˙ \"\ÒÅ','Seychelles'),
('P\Òg)TEô»æa\"m\√','Sierra Leone'),
('%™äVMÖ\Ù\Î\Âd]°\‚','Singapour'),
('¨QA{£B>™$^\\û9\‚î','Slovaquie'),
('¨K,ëΩ\„Iì¨\Z\Í\‡q@I','Slov√©nie'),
(':X=`kNjû¢è¶á8\ı','Somalie'),
('a\Á≥\‡dàO¯è?˚\Ô;b\ ','Soudan'),
('4§\ŒU–πFúÔ®≥[3\“','Sri Lanka'),
('\∆\ÙµB∏CE\nÑv˚TÖ','Su√®de'),
('_ë®rAêãF\›z≥ÿî2','Suisse'),
('Hl7¸ìßJ›®˚}\˜\¬≠','Suriname'),
('’æ£!¿@LØ\r#y[MU','Svalbard et√éle Jan Mayen'),
('=¯nüN¢&&)\Ÿáo','Swaziland'),
('ëº%å\'\ÍA¶{pH\◊0','Tadjikistan'),
('Ædº\’\ÃMùΩjl?\Ú\’{','Ta√Øwan'),
('\—˚mU	?Ao•3\Út\–\∆x\„','Tchad'),
('+é$r]N∆Ü¨K\Û\ÿ\»','Terres Australes Fran√ßaises'),
('\¬i`π2F´RÔ•âN`','Territoire Britannique de l\'Oc√©an Indien'),
('ëç¢LRgN⁄äê\’\Èˇ;Q','Territoire Palestinien Occup√©'),
('\"≥SÉ\…J¶æê\‹\n¿°)','Tha√Ølande'),
('ü3†\0¿LB4ûá\’\"ü\÷/h','Timor-Leste'),
('º{]\ÈG6ä £\»\ﬁ\˜˘','Togo'),
('R,Q\Í∂Gì∫P\ﬁ\”\⁄\ÌB','Tokelau'),
('|\•›íA:ñ©Él∂˚TÜ','Tonga'),
('\Èoûp“åO$éüº≤\⁄\»','Trinit√©-et-Tobago'),
('~\Áó\√B°éófßÇ\Êh','Tunisie'),
('G\Õ\ÊR2JGw•¯/\ﬂRÜæÉ','Turkm√©nistan'),
('Ωóz_H\Ï°oÕçT\Ë','Turquie'),
('bQ÷ê\œ\ÌLØRî≤\·m8','Tuvalu'),
('˛G\Ì5s\“Gà™\Ì™öX','Ukraine'),
('\Ï^F™ñRJ\\∞\˜xT“èè','Uruguay'),
('≥md’°¡G»è\œXO\‘a™','Vanuatu'),
('[∑F¯\‰I™∞¥D3\‘\Z™\√','Venezuela'),
('\Ë\ÚjΩ\«\˜Bîn\⁄bÆ§','Viet Nam'),
('\–V™\∆\ÕO7ù\’X¯Zb\Œ','Wallis et Futuna'),
('∑≤d\‘Gå∑\Ôô	\ˆ\n\—¡','Y√©men'),
('[Æ\„∆¢\Ù@ÔóûòàT£Ã∫','Zambie'),
('⁄©∂`\›\ÍA¢î\ -¸ õ∑','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-09-15 09:08:33',3),
('DoctrineMigrations\\Version20240201152951','2024-09-15 09:08:33',1),
('DoctrineMigrations\\Version20240202084749','2024-09-15 09:08:33',2),
('DoctrineMigrations\\Version20240202150901','2024-09-15 09:08:33',2),
('DoctrineMigrations\\Version20240207105701','2024-09-15 09:08:33',3),
('DoctrineMigrations\\Version20240319212437','2024-09-15 09:08:33',1),
('DoctrineMigrations\\Version20240614133504','2024-09-15 09:08:33',11),
('DoctrineMigrations\\Version20240617165906','2024-09-15 09:08:33',8),
('DoctrineMigrations\\Version20240708061729','2024-09-15 09:08:33',12),
('DoctrineMigrations\\Version20240801202153','2024-09-15 09:08:33',3),
('DoctrineMigrations\\Version20240815153823','2024-09-15 09:08:33',2);
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
('´\Ì/iöÆMí©\Ì˙|òVt','.•l5ãπLnöIΩy\≈\Ò7','\…5?0O§ÖÄ)\\¶ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-09-15 09:08:34');
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
('.•l5ãπLnöIΩy\≈\Ò7','ôd\Â9ˇF≥úˇ\÷\—∏∑','^¿ë{üF\‰á\÷\€v˚\›\Ù_','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]'),
('ñJ<∏_ΩFx•\Õ\„q¿ûß\"','ôd\Â9ˇF≥úˇ\÷\—∏∑',')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]');
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

-- Dump completed on 2024-09-15  9:08:35
