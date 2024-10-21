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
('´\ı\ÂB›óH∫\Î[\·PP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','√âtats-Unis',259.99,'2024-10-21',NULL),
(')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','Ch√¢teau Latour','Ch√¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-10-21',NULL),
(':(\ﬁ\Ó\Ú!J°Äk[\'{¸','Domaine de la Roman√©e-Conti','Domaine de la Roman√©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-10-21',NULL),
('N¥I\Ÿ}#IÑ¶çw™¸\Ã`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-10-21',NULL),
('^¿ë{üF\‰á\÷\€v˚\›\Ù_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-10-21',NULL),
('c^Äú™Ø@ﬂÑÉÉœæ,U','Guigal C√¥te-R√¥tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-10-21',NULL),
('i\nÑsÇØNWíÕëÜ±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-10-21',NULL),
('{\’]\Û\Â<AÉ§é^Ÿº\’\r','Ch√¢teau Margaux','Ch√¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-10-21',NULL),
('ó-L\⁄FAå4S\ı¢\·\È˙','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-10-21',NULL),
('µLØ\ÈCnG§îVajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-10-21',NULL),
('\Á\ÚG¶fF@ä\»%\Ó>\Îm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-10-21',NULL),
('\Í¬°\ŸI^Ä‹ì∞∂W\Ì','Vega Sicilia √önico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-10-21',NULL),
('\w™√§O\Zå`v∫\Á∑','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','√âtats-Unis',1299.99,'2024-10-21',NULL);
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
('Q=S+\’L|πâM\Âéb¿W','Afghanistan'),
('H\Â<\›7wC∏ï\”KèT\Ò','Afrique du Sud'),
('	a¨f¨L=äO˛V…ùC´','Albanie'),
('J\0\Z»∫C¥ú\‚\"x®QH','Alg√©rie'),
('w\n•É≠pLwï\Õø\…cV','Allemagne'),
('≠@’á.pFB≠7N\Ï','Andorre'),
('≈ëá#¢\ÈKwÉ4ëŸát#≥','Angola'),
('	i\«\‹vIßí\Ánπ6\Œ','Anguilla'),
('\Ï\œ~ #ªGz¢J≠X9U\⁄','Antarctique'),
('•VJ\‡ÅHTá(ìe\◊Y\0æ','Antigua-et-Barbuda'),
('\È7\ÁˇF7M£Å;-\ıH¸\È]','Antilles N√©erlandaises'),
('\Zñû]K\ﬁI\ˆ•\÷ô\Ÿ˙∏V','Arabie Saoudite'),
('Æˇs%ßyDÉ’É£í\ˆDô','Argentine'),
('\ƒs›ü\’M\nä©H\ˆÜÉ\›\ﬂ','Arm√©nie'),
('Õ≠≤\ÒJ\ıO\ÓÇ\ŸHv\"Ö®â','Aruba'),
('.I;\œAùÑà\n¶p2ô','Australie'),
('\Ë\ÚÇ\ÈW\ÂAûë\ZT\÷2}\ˆ','Autriche'),
('n\«p\√^N\„∑\Á¥\‡7@','Azerba√Ødjan'),
('˙∑vF¸Iú£§\÷\„©t','Bahamas'),
('0Hèab@b†*åùV%\\','Bahre√Øn'),
('ª><ﬁíM≈É©<nJ','Bangladesh'),
('o¥ƒÖâZF\Òõ;Søâ∏','Barbade'),
('\∆Î¥ä@ùÇ®p\Ó\…','B√©larus'),
('¡\Õ\·\ﬂ\⁄\ÁO+´(\…/XµT)','Belgique'),
('i˝ù∏\”4D{ç$Á™≥s\Ô\Û','Belize'),
('\◊¸\Ù¢\ﬂAŒ•§\Ù±\·¯\ÁG','B√©nin'),
('9<\⁄\Ê\€GE\®W¶FŸ¶ã','Bermudes'),
('\∆51¯ÉåBxçÃØix ™I','Bhoutan'),
('1*ã*G¸´Ñ\Ê@9π!','Bolivie'),
('|b\0∑\Fò≤Ø6ˇé','Bosnie-Herz√©govine'),
('ú™jøïdB@µgâ≤\”Cé','Botswana'),
('&\Ág\÷U@LÆ\nÄº˚\«','Br√©sil'),
('\ÛÖ\ÒS∫M˙øêHΩ•∫]u','Brun√©i Darussalam'),
('\‡D´ß5&K;•Cµò\nq4','Bulgarie'),
(')àÆsíF»É<|9A','Burkina Faso'),
('\Z\ﬁ\Ì\ \œO çaÅ∑Öû˙','Burundi'),
(';\Ë\·±ÃÉGç∫mﬂ∞©','Cambodge'),
('o◊ã\‹ﬁü@ºÄ	\⁄%ßùï/','Cameroun'),
('\ﬁä0Y4DX≥¸2ë»á∞','Canada'),
('≥˝\“\Î{\—D–í\0˙ãò˘','Cap-vert'),
('\Ÿ\È{â.JjähW\"<\Zûõ','Chili'),
('\Ù\Ÿ,U\·\\Kr§\Î\–Qg#G','Chine'),
('ï\ÎâH\‡L]≤ó0Q¸Uè','Chypre'),
('\‰\ˆ6ˇKGØÄ¶<	3´','Colombie'),
('˚\‚OfL\ÕJ\nå¥ñ\‡$\ÕO\ƒ','Comores'),
('å#qÜÆCÜ\ƒ\È\‚¬≥B','Costa Rica'),
(')\\r\Á)DeæV\˜˛@#r','C√¥te d\'Ivoire'),
('îi}\ÿF‹Ω—ãï!ÊÄ¶','Croatie'),
('í%\ \≈\‰dBì≥\ÙG\ÚvTN','Cuba'),
('9º›æõNN“ø4cN\”\√tS','Danemark'),
('/\ˆ`}¬íE¯º\‡+êL%≠\˜','Djibouti'),
('\÷2A∑F¿ï\Í9z:Äg','Dominique'),
('\˜\≈\◊ø`DùA\ƒ\√˝òR\“','√âgypte'),
('v\Õvé±Nµê ¥O\’9\ıS','El Salvador'),
('ö’â%´\◊G¸Æd%\ƒm\Â∂3','√âmirats Arabes Unis'),
('ŸèEÅç\÷@QÑ˘FÅfbT','√âquateur'),
('Iy\"M2Å±\nq®ˇ','√ârythr√©e'),
('æS\√3;@SÖ*Gàl}','Espagne'),
('\ˆ[\“\–«ØH$ï\”03ô#M','Estonie'),
('ˇ}/U5\≈G≤b¡ktaW/','√âtats F√©d√©r√©s de Micron√©sie'),
('EA\ÒY@Ãè±úò$[˚','√âtats-Unis'),
('n\÷0=§B≠\ \…\‡\Ò¯\ı','√âthiopie'),
('\√xq\◊\⁄\€Eâ°`\’gUé¨','F√©d√©ration de Russie'),
('\’46ZO˝ò{|f©\Î\⁄\À','Fidji'),
(',™–∫jíM ∏®â	ø&\œ','Finlande'),
('Üjäß ¸D8å˙§¨ÑIå','France'),
('\È<èõK§%è`Ø\Á]/','Gabon'),
('í˙ò“ö@x¨\Ú\r\—G˚\‹x','Gambie'),
('¯Ç∏ºπóHSú´öaùx^v','G√©orgie'),
('\Õ5¥ü¡uBØ∏0&\\†X7','G√©orgie du Sud et les √éles Sandwich du Sud'),
('@NwÀ¨rOâ\∆dg\·\Ÿ2\›','Ghana'),
(')í\¬A•R\≈¸b»á7','Gibraltar'),
('+w\0NÑ∫•\÷p\ﬂH\ƒ','Gr√®ce'),
('B•/JàNáã˚\≈)(äRP','Grenade'),
('∫\‰…í_ìG¢\œ â8U\Í','Groenland'),
('\0˛TnHœ∫ú0?5\ \…','Guadeloupe'),
('ú\ÔÅ\IØÑú\ ä]Vô','Guam'),
('\œbN\ÏnÜF•ÇVó\Ôñä','Guatemala'),
('j\Õ˚ò\"Cæ c\“\‡é','Guin√©e'),
('\ÛP°\ÈIY∏P˘¨™c','Guin√©e √âquatoriale'),
('ïMH@D\ZΩî$\ÒøYª','Guin√©e-Bissau'),
('&ú™∫\ÈL\nù3\\±¢ùi','Guyana'),
('{ñJ\'\ﬁCóãU\˜\Ú@\Ó\„é','Guyane Fran√ßaise'),
('xv¢\Êl\ƒMí¶\'¢¸\Ô\≈','Ha√Øti'),
('Nj\'B\œ8MK£–ßr\ŸXØ','Honduras'),
('tÑÇ\€NöæzZlµY#','Hong-Kong'),
('êP®†yA\ÎÉn\“\˜6íΩ™','Hongrie'),
('\Èuú\”\Ù\0L≥â\‘Gk™S\’','√éle Bouvet'),
('x]r<u(A-ç?å\ÿ~˛','√éle Christmas'),
('îk1zcD≥î°j~´L','√éle de Man'),
('\Õª¶\‚MÇ∑8Z\«Rà\0','√éle Norfolk'),
('ff\Û]¥ôK\Û£TR\\ì•°','√éles (malvinas) Falkland'),
('˘˛˝ÆI-J#ï|∑\ƒjÜ†','√éles √Öland'),
('V≤Õç±IJáx\Á\ bI˝','√éles Ca√Ømanes'),
('¸\n˘˘	ØF1§™ókt\◊G ','√éles Cocos (Keeling)'),
('M?dIßuCÜÑ\Õ\Ôn^\0K','√éles Cook'),
('\Ù˙8M≤≠5\rååùâ)','√éles F√©ro√©'),
('åªK|∂{Fw∏ieúõ','√éles Heard et Mcdonald'),
('±©πTe&GŒåL»∑=ê\\\–','√éles Mariannes du Nord'),
('\Ú±D\ÁA≥‘®JSÅ<','√éles Marshall'),
('#µ¡Ø9+GŸØºâ~à\Ê\»','√éles Mineures √âloign√©es des √âtats-Unis'),
('\_ç\‹\“E\Ú¢∑çæg\·','√éles Salomon'),
('q\√A¨\≈Kπ±;v†ß,Öö','√éles Turks et Ca√Øques'),
('í\¬\œ1\»NNπ[æv\Ÿ5º\Â','√éles Vierges Britanniques'),
('@≠“´\”\≈H=ê›®\Á>{Z2','√éles Vierges des √âtats-Unis'),
('ÖÉF71Hùú\¬÷Ü\0!CG','Inde'),
('àëŒí\∆F8æ\·•\‘˘ª7','Indon√©sie'),
('\‚ü3]ÜH\Ïç\‚~ïêi[','Iraq'),
('bë(ö\’D§Ñ>Ø\‰Ö>ê','Irlande'),
('n\∆u}EFâ¸i\‡Ä','Islande'),
('$9ÜvÄõF5Å†3ë˝\Á>-','Isra√´l'),
('\»ík˝I0é\Ù¥X¿h_','Italie'),
('\·g°ó)Kùêñå\ÏŸÄX','Jamahiriya Arabe Libyenne'),
('∫Ñáâ\ I»™\Â•cõgP','Jama√Øque'),
('\«\ÕXÉ∂èK€ä#mgòBFI','Japon'),
('D,h\Z\ŸD˛ø<\Ú8Ñ\≈\„G','Jordanie'),
('J\'V∏\Â1CGπ\—$h≤\Ó@~','Kazakhstan'),
('t ó\òKñ]*\›\Ÿ2we','Kenya'),
('ñVb∏©¸H∫†7\∆\Ã8xkc','Kirghizistan'),
('uúì}≠MÅì–≠\Í\‹]+','Kiribati'),
('oT\√b\Ô¶Låû∂(Eˇ6\\','Kowe√Øt'),
('˚î8o/O\ÔÅLV\rj\˜\\ﬁ','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('\’wç\\≈Bïæ°ØQ•1\—\’','Lesotho'),
('\Zç†9 Oáò|Ω[sï\Ò','Lettonie'),
('?¿Z\Ë~ Lóã/\‚Ø\n0˙e','Liban'),
('Å-°9ø\ıNaòóè\·ñ\√cò','Lib√©ria'),
(',íë}ØCLí´9\Õ…°\','Liechtenstein'),
('\‡\Ÿ\“e[D”°\ÚqWU\Ày-','Lituanie'),
('˝¸®\Z∂øA¥í\Z\ÀJù\ÿ7d','Luxembourg'),
('T\Œn\»0HÈ§£ê\'-t=\‡','Macao'),
('\0Å\’mBdKƒ´\◊.	∂ïD/','Madagascar'),
(']ò\€\∆{∞NÉü?]¨A\ı9p','Malaisie'),
('LBèLmK≤ã#\·=úî5','Malawi'),
('ã∂yP	πAñì\ +\ÎGÜå(','Maldives'),
('\Ê\Û¸NC\ÍE˙úÇP\”zdDM','Mali'),
('\Áv\ \‰â\‰F\˜æuØo\€\'ø\Á','Malte'),
('ç\‘G≤\Î@wú,]¨;D\n','Maroc'),
('≠Lp\0Eﬁâ\r\0®gtE','Martinique'),
('ö\‡z\‚N\'¥\œ0fV(9','Maurice'),
('\Ã+\Ëˇ†F›•≥\Í†\ÁERN','Mauritanie'),
('¨”öè´WOZïMâ©\√\‹\÷','Mayotte'),
('Œ≠µ4\ZDLkó\À\Á\∆\‡ô±','Mexique'),
('íêW˝.hOû¥zÖÑ0â\‰','Monaco'),
('W\ÚAÑ¿AÖãê\Ù^\ö\Ï','Mongolie'),
('K3gcëäA@£\0çº≤7','Montserrat'),
('\ı\’[\0x~NgïhW¢\Á[\ˆ','Mozambique'),
('J¢ñ\–\Ë\ﬂMfßöôE0\‚è','Myanmar'),
('X{7\’Leàä7,˙\˜','Namibie'),
('=ó\˜ZπKw¶UÅÁªòi','Nauru'),
('T,\Ú…ÆE¶ú*\Ô^å(\≈','N√©pal'),
('\Ëí⁄ñ@JøORÜã\‹\˜;','Nicaragua'),
('ps~\Úë]HåÆPª+\"o\œ','Niger'),
('˘^tV\ÊyN6éÉóh>d,\·','Nig√©ria'),
('Nmæ8w¨GºøtÔúÄ\Z','Niu√©'),
('πâq\'\»SB\ıô4òº_˘\Œ','Norv√®ge'),
('è\ﬂZ\räM%úN\Z@Qs\'c','Nouvelle-Cal√©donie'),
(',\Âj®ó\–@æ\€zº\"g%','Nouvelle-Z√©lande'),
('(\ﬂ\⁄\÷wJ\ÙêX“Æ:Åx','Oman'),
('[\Ïy\ˆeH\‡∞a\»\ÀC~æ\”','Ouganda'),
('[$ú\ÿ\¬]HNë∏\0ΩÉ\»iH','Ouzb√©kistan'),
('\Ó\≈\¬$ΩJc∏\∑≥çã\Ã','Pakistan'),
('\…ﬂ∞D»≠W_<ê&∑','Palaos'),
('¥õi\Ó0±Aøïï\ﬂ_\\»xj','Panama'),
('¢í*í_æ@ñÄòò3ï≥Ñ','Papouasie-Nouvelle-Guin√©e'),
('\Íc±\œ&F/éF\‰\‡w!\Œ','Paraguay'),
('\≈o4R\Î-F\Ùà∂?p\◊Wt','Pays-Bas'),
('\‘*¿¥\ÛLjµ√∂(í\’lî','P√©rou'),
('\ŒGR\‹NK/íÑ\ÀV?Rk\‚','Philippines'),
('¯xéK´\ŒM:êx\È\˜ã\0','Pitcairn'),
('ixûä`üL¿Ç\÷Y\"jxg','Pologne'),
('\ÒZ§Å¢O8å9«±µ\Ó3∫','Polyn√©sie Fran√ßaise'),
('&\Ì«∂>KOeô\·\„◊ª\ƒV˛','Porto Rico'),
('≤\’5< \nNåÉO\ﬁ3w˙§2','Portugal'),
('©EÖQº\ÏJEõ”èå\€w\Á','Qatar'),
('b`\0Ä¿D√¥kc¿Ç$','R√©publique Arabe Syrienne'),
('q\Ë\◊$-HGJªµ\n¯\ÚP•S','R√©publique Centrafricaine'),
('\ Z\‡\ÔM ∫3∆êGÇC;','R√©publique de Cor√©e'),
('C\ﬂ⁄Ω@úOà±\€\–##U\Ùk','R√©publique de Moldova'),
('\‰\¬8\Zë\ˆGjµËèÉ\Ù\›\◊\ﬂ','R√©publique D√©mocratique du Congo'),
('\ƒ\È≤]ìFU≠!Ω\Ú~\Î˝J','R√©publique D√©mocratique Populaire Lao'),
('\ëRö_J\Ì≠\Ì\’#?d˝Å','R√©publique Dominicaine'),
('gRn\÷y*I\ıß<≠\ÿw\n/','R√©publique du Congo'),
('VEˇ¡O\‡à_vA≤\Ú','R√©publique Islamique d\'Iran'),
('i›Ü∂\ÒC≠ÖD\€5Yﬂ†','R√©publique Populaire D√©mocratique de Cor√©e'),
('SÇõr\Ô@√±H\‹9ˇ\Êû','R√©publique Tch√®que'),
('@2\”WõOô¬≥è\Òr@∞','R√©publique-Unie de Tanzanie'),
('íá€ø\‘\ÚAΩëô}≈âi≠','R√©union'),
('æçDÅ∂MbçG\Ã^','Roumanie'),
('Jvë\‡WLf•†.≈∂≠A','Royaume-Uni'),
('J√Çø±MOIÅ°≥<›íQ6','Rwanda'),
('2ìI†£\ıKáñ\Ú@ \Ì@n(','Sahara Occidental'),
('\œB)\€\ D\n£	\Ë€ª1=\ƒ','Saint-Kitts-et-Nevis'),
('º.˙ïVEúµ≤â∂\ÿHµ≥','Saint-Marin'),
('H4\0$:KˇâT‹πáˇâí','Saint-Pierre-et-Miquelon'),
('\«ml\ﬂJPáˇ\Œ3/G','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('øC7´]ÆE˚í(-¬úæüé','Saint-Vincent-et-les Grenadines'),
('Ö\ÎS∞íOøôø\ı\k˘ª\¬','Sainte-H√©l√®ne'),
('Ω•V8}A÷•\ \’\Ãr\0˙','Sainte-Lucie'),
('\Ô\ƒ%¶A@—ù∏Q\Z\‰\ˆo','Samoa'),
('\nöˇ=´N[õï2\Ê«∞—â','Samoa Am√©ricaines'),
('\ \\éÇ˝\·H\"ë]11âßJ˘','Sao Tom√©-et-Principe'),
('\Ù∆ø0˚ôG*æÅßNÆ\√¡V','S√©n√©gal'),
('£ãf¥(C€ÑZ®ççH\\','Serbie-et-Mont√©n√©gro'),
('Fb\0%OQµ˚\—≥N7\Û','Seychelles'),
('g\–\„˚§kIUã˙ék\Œ>\√7','Sierra Leone'),
('\⁄[ã‘èAdö¡ü_ó\·ù','Singapour'),
('\ÊMEC\ı®EŸîK\Zøü_;-','Slovaquie'),
('Xï¥éGŒíµ\«w\ H\ÓL','Slov√©nie'),
('æs˙Éî@ƒà~@â\À\⁄\ƒI','Somalie'),
('ú\nù\Ê\„Lvô\‚Gœæ+V˝','Soudan'),
('\«mt\Õ\rπ@…©Röá\Ùâ\›','Sri Lanka'),
('â°\ËA√∞¸†,l\Û∫','Su√®de'),
('\r˚E\∆gù@[ñê˘»öπ˝C','Suisse'),
('ê\Z\ƒ&…£E •LëW\Àg0\≈','Suriname'),
('\”\‡ù®C∞îTÅm\÷\◊s','Svalbard et√éle Jan Mayen'),
('ä∏ñ)\n\’MÅó<|züJ.','Swaziland'),
('\ÎGèlF‘†¢%\Òb´ç\È','Tadjikistan'),
('ˇ+\≈\√Jg@\Î∞·ëÅ5v|\◊','Ta√Øwan'),
('p¸0ZHmH\'õ0\'\—¡F\ÔJ','Tchad'),
('?\Òˇ\√\⁄Añµ\Í)\ÓòÀù6','Terres Australes Fran√ßaises'),
('¸Ä©Oü\Ì6\Ã\Ï∂g','Territoire Britannique de l\'Oc√©an Indien'),
('\Õ ¶§Ç3Ebïó«†¡\ÿ≈ì','Territoire Palestinien Occup√©'),
('˝uô7\'H\‰ó\ÔÇér#','Tha√Ølande'),
('\◊86VhñB“ë¢°Aπì¨\€','Timor-Leste'),
('Ç∫<^\Ë\ZJ1£üì\Ò\ Pmd','Togo'),
('y ¶NK¶\Òh\Ú\…Î≥í','Tokelau'),
('º’π∑øíB\‡ú‹òw\◊\'\„','Tonga'),
('\ÈW\·nM‹ôY\Ï\Ù\∆UÑ˘','Trinit√©-et-Tobago'),
('a}xmµ¨K¨ìππK\ÌJ\…˚','Tunisie'),
('\‹bò\‚Híòr\ÍxF0','Turkm√©nistan'),
('ï\¬SúGç±t&P†é@-','Turquie'),
('s	}n¡\÷EV≤¥™*\‘;Ω','Tuvalu'),
('ÅKß7\‹\∆E∞¶|J≥kq','Ukraine'),
('0\ﬁ\rô%S@ßØºlRÜf\È\›','Uruguay'),
('=\‚>-∂D\Áµﬂñ}\Ê\∆L8','Vanuatu'),
('—ñn≥û\ÛKl©,NS\– ö+','Venezuela'),
('4Wè^\Î\ÍI\Íõ˘èøñû','Viet Nam'),
('\ X\Ÿ\≈K°  Çåi±\n','Wallis et Futuna'),
('«ª\÷>\÷aFéâ!#y\—\Êø\√','Y√©men'),
('…∂4\ÔìMCé¶∑9\È∏yØ','Zambie'),
('\Í{VtknL∑à)LÆdÖ\Ì\ﬂ','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-10-21 16:01:53',3),
('DoctrineMigrations\\Version20240201152951','2024-10-21 16:01:53',2),
('DoctrineMigrations\\Version20240202084749','2024-10-21 16:01:53',2),
('DoctrineMigrations\\Version20240202150901','2024-10-21 16:01:53',2),
('DoctrineMigrations\\Version20240207105701','2024-10-21 16:01:53',3),
('DoctrineMigrations\\Version20240319212437','2024-10-21 16:01:53',3),
('DoctrineMigrations\\Version20240614133504','2024-10-21 16:01:53',12),
('DoctrineMigrations\\Version20240617165906','2024-10-21 16:01:53',10),
('DoctrineMigrations\\Version20240708061729','2024-10-21 16:01:53',11),
('DoctrineMigrations\\Version20240801202153','2024-10-21 16:01:53',2),
('DoctrineMigrations\\Version20240815153823','2024-10-21 16:01:53',3),
('DoctrineMigrations\\Version20240916065051','2024-10-21 16:01:53',4),
('DoctrineMigrations\\Version20240929091802','2024-10-21 16:01:53',11),
('DoctrineMigrations\\Version20241002164506','2024-10-21 16:01:53',7);
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
('´\Ì/iöÆMí©\Ì˙|òVt','.•l5ãπLnöIΩy\≈\Ò7','\…5?0O§ÖÄ)\\¶ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-10-21 16:01:53');
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

-- Dump completed on 2024-10-21 16:01:54
