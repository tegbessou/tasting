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
('\◊Pái¸Nœ±˘\û\Ê+C¨','Afghanistan'),
('åØ\Áu∏IÜïiñÉQC#','Afrique du Sud'),
('êª5ASE^òìÑ˛ˇ\√dØ','Albanie'),
('gqÄ\›M\rÅ\‰å\‡xö©','Alg√©rie'),
('sm/\Á\“UC-ñG)ÆwT\‘','Allemagne'),
('zΩì\ËæD¢ôÆ\ÚóÅWQ_','Andorre'),
('&Sø\—$RMîØS\rJN\Èî','Angola'),
('7t5\Û∂\„LxìúëU3)\∆','Anguilla'),
('KZ]ç.iLSù\Z\ılòem','Antarctique'),
('ÕÑ]\ï-KÉâi≠\ÿ˘\‰:','Antigua-et-Barbuda'),
('\‚UJ{03C´Ö	ò	[_O','Antilles N√©erlandaises'),
('\‡≥z\Â\‡Fñå-#@\Ó\ÀHj','Arabie Saoudite'),
('¿Äèh¶nB`å/æN P2\–','Argentine'),
('@!\Ï\⁄\Ì)LîèXb%-˝ï','Arm√©nie'),
('\ÛDæôEûG–ó∆É\»|π','Aruba'),
('rI2o∑H‘Ä’å\≈ \À<','Australie'),
('\‡H;6—ªFî∞a\È/à`\‚','Autriche'),
('ï\˜!jINòµJöSŒé\Î','Azerba√Ødjan'),
('_\’¡ÑN@Ö\œ[¢\Ì\Òò\ˆ','Bahamas'),
('á_\"øLK\ÊÜ.Ø˘JéAm','Bahre√Øn'),
('\\˘n†\≈¸L§Äº£`ì\"¨','Bangladesh'),
('<≥ìJøB ût\…X\"C','Barbade'),
('\ﬁ*ßS\Í$JL± ¨0æ[_','B√©larus'),
('õ¡ç\ÔC⁄°;\ÏÔ∏ó\n','Belgique'),
('±§ok\ˆ\‡@°¶dPÆ°Dc','Belize'),
('¢*X\…!OtÉ\€\’\–*ú3Ω','B√©nin'),
('\Zb{à\ AC§òO`\ÕC\ﬁ','Bermudes'),
('\Í¨+iJæüîT\Ã\‡ÿå','Bhoutan'),
('9\Ã<.còHˇ≠∑^ˇ°7∫','Bolivie'),
('\’v\0uØOÉ≠r.=h','Bosnie-Herz√©govine'),
('‘í\ƒ\ﬁ_A∑¶\ﬁ˘äç\\—','Botswana'),
('AQ^àÉñC\Óµ\¬&ª\≈\Ò','Br√©sil'),
('ñ~™ŸÜ^A!Ç§å.#\Áï7','Brun√©i Darussalam'),
('q#\’^∂\ÍKJÉ\"Rm\\k','Bulgarie'),
('≥«Ä˝\√\»C≈ãb˘,¢\“\’\Ê','Burkina Faso'),
('H¸^˘Ä~GN∑b\Úm6“æ\','Burundi'),
('\◊-ëÉ-N#¢qV¶\pSh','Cambodge'),
('\‹∫¢\√Fà§æ&é}ö©','Cameroun'),
('õîwól∂B\nï¥é˘\Èn\‡','Canada'),
('É\ÿ\ﬂË†´CQÜÇ\ \Ìí\…:9','Cap-vert'),
('fIvˇ≥A>í\ƒ¸û\Ï\‰iû','Chili'),
('∂˛ŸñICÅ˝-áç\ŸL˝','Chine'),
('Tâ£rêM\ı¨Y∏Ç\ﬁÆ≤','Chypre'),
('0Sg\ﬁMgΩ)—â¢\◊','Colombie'),
('¨bÖì\‹O2ú≈ç\‰4◊•9','Comores'),
('r\'~p\‰Nœπõ\«\‹\ƒ\œ\Ÿ','Costa Rica'),
('¶ìüøºó@‘æ?#\Êo∫','C√¥te d\'Ivoire'),
('â\Ô)¶\‚BÀÜ;êËóº¯\Â','Croatie'),
('h\—wåë@ƒço°Ü\Óº˙\n','Cuba'),
('ïY\ÓµC£\Ô~`9x%','Danemark'),
('5\ﬁlw◊ãAUá”ùö\"˙1\√','Djibouti'),
('H\0ÑfÉ\ŸMÀø¯/\…kï\È','Dominique'),
('≥\„tX©ì@€µ1CçßöÉ','√âgypte'),
('joO™6uI∂™\\\Â¬û,^\0','El Salvador'),
('$á¢	p≥E_∂Ü\Ã\H\Â≤\Í','√âmirats Arabes Unis'),
('0™±\Â®B”Ç\÷Õä≠˘B','√âquateur'),
('§á\ƒN\Ú?M\‡ù˘ecc\r','√ârythr√©e'),
('ãœ∏Y/nM4õµÑiÿª§','Espagne'),
('\Z	&°H{B°©m;\‚7¸ªñ','Estonie'),
('w¶:n\’\‘IëÄp=≠IXh','√âtats F√©d√©r√©s de Micron√©sie'),
('˚\„°(ODô?Sîö)I','√âtats-Unis'),
('˘N2≥\ËL;µ®,tê|\ÿ','√âthiopie'),
('q\…\—hBJT±ìg4\‘\‰π','F√©d√©ration de Russie'),
('ApÅ\◊\‚úKäã\’BNoµò','Fidji'),
('Êûâ\Ë\Ù•Jç¥1^iJ]7¶','Finlande'),
('\◊\V/eBíC\Ô ú\Ú\—','France'),
('8M“¢ΩKA¥!>´Ωll','Gabon'),
('Ω§ØpH=úπ*\¬Uw\ÿ/','Gambie'),
('˚íò¥\ﬂGA∑\'-3±ò\'','G√©orgie'),
('°[ª\“LE±Åe∏<$1','G√©orgie du Sud et les √éles Sandwich du Sud'),
('µaí\\H|øˇk¸\ÿÎ∫•','Ghana'),
('ZVx\ÁaA\˜í≥b:à6v','Gibraltar'),
('Ë±Ä≠\‚\ÁJåD9≠M¶','Gr√®ce'),
('L\‰™l\Õ/J\Âì<¶\⁄?æ´','Grenade'),
('^âê.\ÍqD\Ô®\“O∑µ≠Æ','Groenland'),
('Ö\€*\≈’∫MQì7¸ï\∆\ƒ˚','Guadeloupe'),
('\ÔäI^S\«N˙î∫\ﬂ\Z∫7_ú','Guam'),
('˘˘ﬂÖH\ˆEYï≤:\ÈeØ','Guatemala'),
('é_\–¸&qNÃµ\ÒAÅ^r','Guin√©e'),
('@t\È¥\Ò\ÁA¡£˘\Ì\Ÿ=Ä\·\Ù','Guin√©e √âquatoriale'),
('±[\Â	Gáê∂Ä\…\Ô<∑\Û','Guin√©e-Bissau'),
('>\Ÿ¸TkJÖû;õSF\Ï\Õ<','Guyana'),
('\Ú≥zæDM£®-|q\«\Ùê','Guyane Fran√ßaise'),
('Z∫)7æB?∫<¿Üõh	','Ha√Øti'),
('_˙c\À\⁄OQëS*\È≤É','Honduras'),
('sJäyI*à\ÂJ1-ü\rù','Hong-Kong'),
('\◊€º\À\¬$B¨¯ñ6Ñ\Á¥','Hongrie'),
('F™çô´M3ò\ÂO5\˜\…4¥','√éle Bouvet'),
('\ËÜ[0ÇDùà\ÔK6ª	','√éle Christmas'),
('•ë¨÷áIõ≤ÉtÔ´£º\≈','√éle de Man'),
('ºØ\—Fg¥£ŸØ\ÛÅ','√éle Norfolk'),
('!—í˚oF[Öˇm\”>9E','√éles (malvinas) Falkland'),
('†\Î∏œ§D\Ú≥ó*]ö≤•','√éles √Öland'),
('ø^\–\ƒ\ZûNZîëÉb≥©˝E','√éles Ca√Ømanes'),
(';Å˚r\n\ˆK¨ú∏Ø≤-\Ì˘E','√éles Cocos (Keeling)'),
('f\«\Û\Z9ºCAÄH^5à\ﬂ H','√éles Cook'),
('$\·12T\ƒE#´∫[•YQ','√éles F√©ro√©'),
('˘é˙\◊I\nÉÖ°\›\Œ7\Ô','√éles Heard et Mcdonald'),
('*ó¯ç\ıH‘üQHkBΩm','√éles Mariannes du Nord'),
('ë\Ôπ~\ÔéC¢mÇ\Ã›Åx\ƒ','√éles Marshall'),
('\0\‰i—ÉF`Ñ¢\‘¡;wŸå','√éles Mineures √âloign√©es des √âtats-Unis'),
('˛°T\Ú!ÇBóü9¯\ÕP\Œ','√éles Salomon'),
('\Û\Ì39\«\˜Epô.\›\Ì∏¿§','√éles Turks et Ca√Øques'),
('Ø}»á\'@«ö1ôR>®','√éles Vierges Britanniques'),
('≈≥îat5A\„†˛\rî\‘\r','√éles Vierges des √âtats-Unis'),
('Z]∑â∏4E6êdù§_g\Úã','Inde'),
('i_\Á’áDà¥^//≠\Ùzµ','Indon√©sie'),
('§\‚∂©7Nû\‡:èsZ{p','Iraq'),
('3®I\ÍL¡A‘ó>¥v\Ë±~•','Irlande'),
('\Á\Â\ÕZ*:Jß™m•	uâµ','Islande'),
('˘\Ï¿$I\ıï\ıi\Ó¨\È™t','Isra√´l'),
('˛®†\'TºN\Í¥G`H\◊f4','Italie'),
('2W\‘y•\…Dª§¯ˇ?û#\0&','Jamahiriya Arabe Libyenne'),
('ú*#ò|@éß≥k¯ª≥æS','Jama√Øque'),
('\Ûá\Ò¨°K4ïüˇ∑âPwD','Japon'),
('g ÇŸÄÜNQô≤ó˚ròM','Jordanie'),
('ãÇ\”m\⁄D=∫≠\Ùúlça','Kazakhstan'),
('ìr›§HI≤°\ﬂ¡\"xû]','Kenya'),
('\⁄i1Y\”@\'´üÜ¶©3#\‹','Kirghizistan'),
(' KL\ÎzE\ıß¸}Ø0˘V','Kiribati'),
('\⁄O\"Yk7B¬≥Uh,\ﬁ','Kowe√Øt'),
('3íj∂iLyæ!Y\◊Y\·[£','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('\rE°∞¯G5Än_\ÕkÖÅû','Lesotho'),
('\Ï˙z\"jCBñg>\÷','Lettonie'),
('O°\”w1çEú”∫[d=∑\«','Liban'),
('{hNÅ\ﬁ~N–ä\Ò\Ã˛\ {dY','Lib√©ria'),
('›Æ[m>\ÌK~≤˛\‘\È\r=\”','Liechtenstein'),
('%\ÌÆh~Dö¨ï\Ò•tÆ\«','Lituanie'),
('æ\‰®J¸@Ößë\À˘\ÿ\Ú˚\Á','Luxembourg'),
('®\Ùaû\ˆ\…K\Í∫‹≥\Í˛D7','Macao'),
('\—Y\⁄BN∏Å≠ºh%V_','Madagascar'),
('(Ö˚\ÌpúN>â\◊0v\Â•','Malaisie'),
('ú®Ç+dD¶\0´\Ê\ﬂs_','Malawi'),
('é\∆“∫DáHò≠\Ÿ\’\ \Ì*y','Maldives'),
('◊æH≥Ö±Mõêå\Á\Ôbm£','Mali'),
('\⁄˚Ñz\ÚO\"ö\Î\Ú\ÕM¶\”i','Malte'),
('\Ú\Œ¡¿Dt©\·´ˇp','Maroc'),
('^\Ÿ◊∏3I^ù7Ähz\Ûl','Martinique'),
('k\Ú•±ì@ø•mE\¬j˙','Maurice'),
('z\ƒ’ëïçLçùM\”\ËR\ÍG','Mauritanie'),
('eY\€ëO~¶_\Èü.\Ú','Mayotte'),
('^.πìè6D\‰∏\€√°_]â','Mexique'),
('≤ øÆQAD‹≥©Îì¨E\Á\ÿ','Monaco'),
(' º™<P&D^Öt…ô<\Ô','Mongolie'),
('\‰\Í\‘l\∆G—±\Z-yzT†\Ô','Montserrat'),
('ö4\‡òAzÆ5∂h.0ä','Mozambique'),
('º3Y\œOè\'2\ﬂ:\Ó\0','Myanmar'),
('pY\ﬂ€ÑKd¶<5\€5ã±\Î','Namibie'),
('L\ﬁ‘â\ÊªJ\‚¢pi\rX\n∞2','Nauru'),
('\\N\n\“L0è\Ï}µçì\’','N√©pal'),
('#ˇ⁄≥≥E\\Ø\‘ñ\Å\⁄','Nicaragua'),
('W\\‡j>Edù\ﬂ*\ÛOAá8','Niger'),
('\‚ëb\ÒcEÜàò\Ó\”(∏\‘;','Nig√©ria'),
('¨\ÁMtB¯ò¿Pzç','Niu√©'),
('∞˛±èZ¨Mµ´*\À\Õo4ñ','Norv√®ge'),
('¸\ﬂ†\nOÂò£Ö\Ã\ÓgUS','Nouvelle-Cal√©donie'),
('¡T\ﬂmd\ÏM◊ö\Zi5h\ﬂf','Nouvelle-Z√©lande'),
('\—E\Ôè\†LÅçS\ÕOn_','Oman'),
('ˇê≠5B0å©±\n\‚∞','Ouganda'),
('°}\"\ﬂŸ†D≈ò¶\Ú¢p\÷\ZA','Ouzb√©kistan'),
('äl\0\‡JUN\‰†r±s®œôn','Pakistan'),
('îêf†ò\ŒAäíô\Z£\À)n','Palaos'),
('\‰\ÿz0M¶é\Òá˚Jãø\‡','Panama'),
('≤#á6Ö¥D–¢B3ä(-˛','Papouasie-Nouvelle-Guin√©e'),
('?5âò≈øGEÉoÜ;´ë.\—','Paraguay'),
('.”ã8$ÆI!£\¬\ÿ\ÁSæ','Pays-Bas'),
('-tµhLKCΩÒ≥äé∏èq','P√©rou'),
('\”K\"∞•Eyêî¶>\Ú\Í','Philippines'),
('T˛∏\Á*Bù\¬\‹ﬂì\Ô\‡','Pitcairn'),
('vä+ëª∞Oñπ\'®\Ùß\Œ','Pologne'),
('\Ôqì\ÙvM”è@¥óh≥˝','Polyn√©sie Fran√ßaise'),
('öèõ2\À\–G´≤#\Òk|\√¸','Porto Rico'),
('˚ügòâøH¨ä\rj£3@˘π','Portugal'),
('\ﬁ)M úÜI	äÅ2áe\‘\'','Qatar'),
('z±õP\∆NΩ¶\”œã¿\€v','R√©publique Arabe Syrienne'),
('a\œd`H,AÌ¶™¥úg#U±','R√©publique Centrafricaine'),
('?›£\√¡%@¬±ª≈å\Ód\’','R√©publique de Cor√©e'),
('\“jváû6Mdº>\“l§O\◊\r','R√©publique de Moldova'),
('\ˆ¨\\á\Í(C\‰ï\ˆ<F¡D','R√©publique D√©mocratique du Congo'),
('â3\Ù\ EçIæõ\ƒ›ô\Ù{','R√©publique D√©mocratique Populaire Lao'),
('\0ï\\õ\Ó\D\Òç˙‰ß≤èÅ$','R√©publique Dominicaine'),
('\Œ\Õ\‘OIÅõ\Í˚∞åK\ÿ2','R√©publique du Congo'),
('u\ÌXØMeí~∞\Ù\“em¢','R√©publique Islamique d\'Iran'),
('\ \Îrù9¥Kº§<àU∏S\⁄\«','R√©publique Populaire D√©mocratique de Cor√©e'),
('F-¥rhE°û[\¬,∫\›g\Ÿ','R√©publique Tch√®que'),
('\0ck§Ox´îmæèóF','R√©publique-Unie de Tanzanie'),
('°´\ÔæqLz£2\‡?\Î\f','R√©union'),
('\Ë\ˆπn\›Oá•>rR`bª\Ù','Roumanie'),
('\À*\Á\Ì\Á\ÌN©ÖE[î¯#\0','Royaume-Uni'),
('\0\’E}î~MuãD=:gê\À','Rwanda'),
('zˇqõ•¨B<üv\‰QﬁèI','Sahara Occidental'),
('7%\⁄\◊9@„≤≠í#$¶	{','Saint-Kitts-et-Nevis'),
('£RÇAe\ˆM°-\Ï\‚8\Œ','Saint-Marin'),
('ØX\rñœØM\Ùá\\!ìC~Y&','Saint-Pierre-et-Miquelon'),
('´2CSJµà\„\Òé/(˚N','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('\“\Î\„˚B{Ñn\Ûú´:\≈','Saint-Vincent-et-les Grenadines'),
('\‰\ﬁ?≤M\›Lh†\‘:C`9','Sainte-H√©l√®ne'),
('ˇà\Ã–ôùLìöwdTÇ\ÿ¸','Sainte-Lucie'),
('5úG\Ÿ_/Dsø\’Ó∂å¢q','Samoa'),
('eô<wéüIô¨?ö¡\‚6~X','Samoa Am√©ricaines'),
('\ƒ73C\¬EPç\…¯\Áù{æ','Sao Tom√©-et-Principe'),
('&rß\ﬁH<Ç∞ºù62+v','S√©n√©gal'),
('l$4à\ıNHï˘hñ¨\Ú\‡\€','Serbie-et-Mont√©n√©gro'),
('?üI\‡\˜æJñf\‘\ﬁed8\‰','Seychelles'),
('ö™\Œi∞æFüùáJ\ÙN∫©Ñ','Sierra Leone'),
('t_{ÖõMOæ”¶\–\Ó>Ñ%','Singapour'),
('\ÏA9´\ﬁ\ZNéÜ•<ΩäïH','Slovaquie'),
('°3i^gNQïEëÜ∏K\»','Slov√©nie'),
('µa*\”+\·LöÖüf\œgﬂ•q','Somalie'),
('˝èÉìx˝NG∫\⁄#\“!c∑','Soudan'),
('\≈<]ÖMBùº\‘a\˜\ƒn8b','Sri Lanka'),
('ò]\Úí=äE™ó}?ë∂é','Su√®de'),
('>˚	ôWGgå≠kxU\ƒ\\)','Suisse'),
('÷É:\‹˙F•©G\0‘í“πï','Suriname'),
('<M≠∞OÏ≥üxa◊Ñz\ﬁ','Svalbard et√éle Jan Mayen'),
('µ¿âº6J±π\ÿ˘Vá£,\Z','Swaziland'),
('÷ì°\Ó_∏L∞ªfé:B\ÿ','Tadjikistan'),
('\÷\›`\"âN\ˆô!OëM','Ta√Øwan'),
('\∆\r\"I|ñV\ÿcYó\rπ','Tchad'),
('öú\È\Î\‰øMô}Añô¥5','Terres Australes Fran√ßaises'),
('ìÜ¨™\’]IÇ†\Î.*≥\0∏','Territoire Britannique de l\'Oc√©an Indien'),
('˘I\Ú›ÜIHRâöïnè˘Sn','Territoire Palestinien Occup√©'),
('÷îhà\ˆM Ç†/g\ZC\Ôê','Tha√Ølande'),
('¶é\Ò≥\‡O–çî51\‰ﬁò	','Timor-Leste'),
('8?∏\'Fçµ9C\Ã{P','Togo'),
('_\Ì∏6JEô≥QiV\"\ÌW','Tokelau'),
('\ÏV]Ω\ÁEL£òg#íÕ≠x','Tonga'),
('ÇPiU˛F ãª èï\›\È','Trinit√©-et-Tobago'),
('DX\Ï@ArDªÂñ∫ZA\∆u','Tunisie'),
('ù¨±\n#Ee®>ö≤\»\Ù\Ã','Turkm√©nistan'),
('Ç-£D¢\ÈK=¶\ƒ	Lë˘$ë','Turquie'),
('\À¸¶\‰iøDìà´\ı=¸EX','Tuvalu'),
('~F\‚¯î9Jï≥m¢Q\ytô','Ukraine'),
('*$\0ﬁçfA\Ì•3ÜÑ∑ã\Ì','Uruguay'),
('≥\Ÿ\Ô\»˙\“A(ü\Ó[Tc\√\‡\Ù','Vanuatu'),
('®∞\˜\ﬂsE’î™j{3Dü∞','Venezuela'),
('%J\Ú2OºîX\˜\ıñπXn','Viet Nam'),
(']éÇ$Iz•êJ\÷~¯¶','Wallis et Futuna'),
('T\Í\“\»=∏B\‰°6\r\ıú63','Y√©men'),
('˚		äëåD∞Ωõ9˝X5','Zambie'),
('±ôò∞Ç\‡BËäÆ)pπGP','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-07-11 07:29:26',3),
('DoctrineMigrations\\Version20240201152951','2024-07-11 07:29:26',1),
('DoctrineMigrations\\Version20240202084749','2024-07-11 07:29:26',2),
('DoctrineMigrations\\Version20240202150901','2024-07-11 07:29:26',2),
('DoctrineMigrations\\Version20240207105701','2024-07-11 07:29:26',3),
('DoctrineMigrations\\Version20240319212437','2024-07-11 07:29:26',2),
('DoctrineMigrations\\Version20240614133504','2024-07-11 07:29:26',11),
('DoctrineMigrations\\Version20240617165906','2024-07-11 07:29:26',8),
('DoctrineMigrations\\Version20240708061729','2024-07-11 07:29:26',10);
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

-- Dump completed on 2024-07-11  7:29:28
