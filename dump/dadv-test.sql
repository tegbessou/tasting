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
('´\ı\ÂB›óH∫\Î[\·PP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',259.99,'2024-06-24',NULL),
(')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','Ch√¢teau Latour','Ch√¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','æm2\‹#Møåfh\—3[º','France',999.99,'2024-06-24',NULL),
(':(\ﬁ\Ó\Ú!J°Äk[\'{¸','Domaine de la Roman√©e-Conti','Domaine de la Roman√©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','æm2\‹#Møåfh\—3[º','France',2999.99,'2024-06-24',NULL),
('N¥I\Ÿ}#IÑ¶çw™¸\Ã`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','æm2\‹#Møåfh\—3[º','Italie',899.99,'2024-06-24',NULL),
('^¿ë{üF\‰á\÷\€v˚\›\Ù_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','æm2\‹#Møåfh\—3[º','France',1599.99,'2024-06-24',NULL),
('c^Äú™Ø@ﬂÑÉÉœæ,U','Guigal C√¥te-R√¥tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'æm2\‹#Møåfh\—3[º','France',358.99,'2024-06-24',NULL),
('i\nÑsÇØNWíÕëÜ±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','æm2\‹#Møåfh\—3[º','Australie',1799.99,'2024-06-24',NULL),
('{\’]\Û\Â<AÉ§é^Ÿº\’\r','Ch√¢teau Margaux','Ch√¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','æm2\‹#Møåfh\—3[º','France',1099.99,'2024-06-24',NULL),
('ó-L\⁄FAå4S\ı¢\·\È˙','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\À#zO0±àj≠q¥s_','United States',199.99,'2024-06-24',NULL),
('µLØ\ÈCnG§îVajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','æm2\‹#Møåfh\—3[º','New Zealand',49.99,'2024-06-24',NULL),
('\Á\ÚG¶fF@ä\»%\Ó>\Îm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','æm2\‹#Møåfh\—3[º','Italy',899.99,'2024-06-24',NULL),
('\Í¬°\ŸI^Ä‹ì∞∂W\Ì','Vega Sicilia √önico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','æm2\‹#Møåfh\—3[º','Espagne',1499.99,'2024-06-24',NULL),
('\w™√§O\Zå`v∫\Á∑','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',1299.99,'2024-06-24',NULL);
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
('\Ûæ†`i\›J\Ôí\"\ÊPA˘Y','Afghanistan'),
('@\‚¬¶*\’N{ª\Í£P(\ÒD≤','Afrique du Sud'),
('P^\÷LeH\Ùßì9\…9P\ı','Albanie'),
('æ.S]DB≠∂Øö°Õ∏$∂','Alg√©rie'),
('ä2M˙éMé≥L´\Û\nQ•\€','Allemagne'),
('G6º)§SMÇíW¶Nu\Èî','Andorre'),
(':ô9P	{EÜÇ\'€∫∑æ','Angola'),
('õ> \‚\0zGö¶#%ô¯˛Å','Anguilla'),
('\√\‚Ûëé∫CkΩçæ§∞g-g','Antarctique'),
('õaçúô@Àíîö–öy\Ÿ','Antigua-et-Barbuda'),
('\◊AõV‘•M˛∂\À\Á\¬|±˚','Antilles N√©erlandaises'),
('I\Â\n˘C\"Øã	©\Ÿ1','Arabie Saoudite'),
('\Á\ﬂ\«£HqéRÖøxÆk','Argentine'),
('Moö\›O=Ω\À\€¸\≈\Œ','Arm√©nie'),
('\ËZ°ΩΩßC)æ#{Kdî°','Aruba'),
('`\∆\…~\”B:å\ÎsV\Ôzs\ƒ','Australie'),
('qA]k∂∞Jü\œ\≈\0_Q˘∏','Autriche'),
('\œ~˘NãÆ\Ó/öÉ(A7','Azerba√Ødjan'),
('\€3‹Æ0¯H\ÍêR∫\Ù≤Ó§Ü','Bahamas'),
('º∞TÑ®%@5É.\ZaŒó±\Û','Bahre√Øn'),
('Æ\œXã@N|¥	xQº','Bangladesh'),
('\Â/W±\¬VKJº\Õ\À+\È\«','Barbade'),
('\ı\œ¿ôãL9∑	á0™\0\06','B√©larus'),
('∫¸-ùïHΩí®< L\Ó\˜I','Belgique'),
('¢º\‰\€s<HπöU*®ágáˇ','Belize'),
('¯¬ë/<ATïáYì\Áév','B√©nin'),
('LS\Ÿ\Ã\–BÓú™∫±ß4-S','Bermudes'),
('øíwqòNÆÄw$ã\r','Bhoutan'),
('¡Mñ¥äRM}©]ÆB\"','Bolivie'),
('ux´÷≥L\ˆ§Ö\‡\Û\√d;ø','Bosnie-Herz√©govine'),
('Öé´Ö&™M—çø¯´\Í','Botswana'),
('?1áèR•G}ØUQ,lJ~','Br√©sil'),
('W,\Ÿ\ˆI\ıC∑≤\Ò%T¨o','Brun√©i Darussalam'),
('üt^ç¶GôÖp\«ﬂ™˝π','Bulgarie'),
('=ì\Ú¯:CCû≥E π˛J','Burkina Faso'),
('to»ß\rMë≥#«å>ï\Õ˛','Burundi'),
('\Ïrˇ[æ˛Cç	\–º>X','Cambodge'),
('¥M\–\·äSM1ªúo¥Ω\‡ª','Cameroun'),
('ø4I∂9(HÜØez\Òh´','Canada'),
('2§x˙&Fo∂a\·\ıµ\»6{','Cap-vert'),
('˝>°{<Aﬁß6\räG\«','Chili'),
('9Pûg≤}E÷âº\Ó˙8∫','Chine'),
('´ì˛¢\Î≤N‘áè’ß\Í∫”å','Chypre'),
('˛SÖ˙\Óó@W∏ífz%z]\¬','Colombie'),
('qcçò˘MﬂÅk\‡E\◊&Ø','Comores'),
('\€A=$\ÂqC\ÁÉ\≈U\⁄\ZØ','Costa Rica'),
('\ÙÜ	8\ÒäG\Í§¸Å\rô\ËL\ƒ','C√¥te d\'Ivoire'),
('\¬\ÚíÆCM’Ñ¥\ÿ\Îl∞R','Croatie'),
('¸FÄ∫\”Bç\—∂\Í.\‰\÷','Cuba'),
('ç\ÏVÉù±N˛•\ˆG∞•+ì','Danemark'),
('\Œ~V7I.ù\"à.\◊¯â','Djibouti'),
('ŸæÑäÄFº7mç\Ú+SS','Dominique'),
('ß@\Z=oTOAÑ≥~\≈\–Œ¢','√âgypte'),
('\„ IãÜ¯E±í†\Z\Û∏p±','El Salvador'),
('≠\Î†\Ío∂E–Æ7\ k™Wè','√âmirats Arabes Unis'),
('ã˛=ˇCÉNBñLXæ	ßïa','√âquateur'),
(';¨óÄû\ËL≤¶\÷q\ﬂ(\ËŒû','√ârythr√©e'),
('©ëCéö¯LùÅ¯\„Q\·\‚ß','Espagne'),
('r\“\ræõ\ G÷ÄULJÆ\»','Estonie'),
('ÜN\Óì\€yH\Ô¨\næ;(_5','√âtats F√©d√©r√©s de Micron√©sie'),
('∞\ﬁoéa\ B\\∏∏ò\Œ\‡\·Q\√','√âtats-Unis'),
('Cß\ra˘òG£ãY{√¥j\√˚','√âthiopie'),
('§-á;\—@AàD5Å¥™Hü','F√©d√©ration de Russie'),
('˙∑ò\ÔÉ_Jg©\nW≥V¥(¨','Fidji'),
('¿Wê^oÖLj≠ñ\Û˚\÷«Æü','Finlande'),
('X˘\›o7¨HmÖ\Ë\Í\œRQ','France'),
('0K∞kôåOΩÉ¡l¿5˛','Gabon'),
('˙\œ\“n{$G2øiÅq∞!:','Gambie'),
('è\˜˙£*°Cî∑®\√H\‘Í≥â','G√©orgie'),
('lã\“;\„ìD˘¢í-MH&\›','G√©orgie du Sud et les √éles Sandwich du Sud'),
('\”ﬂÜ\›RkF	òÜ\·∫^≤','Ghana'),
('@\—kæ≥\¬A\Ïí\Ã\≈TfÎ∑Ω','Gibraltar'),
('ˇêÑ_¢®O∫∞áiY)∑¯§','Gr√®ce'),
(' Æ/&ìK*µ-\Œ/\ˆ9\Á\r','Grenade'),
('yB≥\Í6N™óù∏iG\Õcç','Groenland'),
('¨fÑâ\πI*π4ÄDèP\e','Guadeloupe'),
(':áq^ÆeFÑ\Â\ÙGa0','Guam'),
('c˛ØGä9D\÷$\\\›','Guatemala'),
('\»D\Ú\ÛLFPï¸ÅMG∫ã\ﬁ','Guin√©e'),
('çv!M\‘FÇäV˘e|P\\V','Guin√©e √âquatoriale'),
('∏±q<\‡)J˘¨Ÿ§.´Tê\‰','Guin√©e-Bissau'),
('y\Õ%l	\ŸB|ègbóŸÉ%','Guyana'),
('¸ªàXUI¶üíîW>\·','Guyane Fran√ßaise'),
('îøâ\”B\Ìï\ÚﬂÇ\√	`','Ha√Øti'),
('∂\√™\œB\Ôë\ÂûY\Ò≤ß','Honduras'),
('∞%Ö¥ôçC7¶O	hìà\⁄','Hong-Kong'),
('\Îp\‰ì,AÖ∫\‚ñcπ∫$','Hongrie'),
('%π\‘ALò∫‹Æb\·lL','√éle Bouvet'),
('\‡\ÍÆJóIUßè\ˆ\˜Æ\Ô ê','√éle Christmas'),
('àá™˝ZYMlâz]_òß','√éle de Man'),
(',ò	ó\ÌA\·¢qΩ˙\…>','√éle Norfolk'),
('∑0˚\"hKêb\Ï‘Æ\Z','√éles (malvinas) Falkland'),
(':Ü\¬r\‰Oà®7¶Cñ\˜˝','√éles √Öland'),
('ò}¯ª*CﬁâGê%ì˛D','√éles Ca√Ømanes'),
('≥^Q\ÈãB–ç\˜áæ,\Òß','√éles Cocos (Keeling)'),
('Ω~8RQAAﬁôIR\√\Ò\›','√éles Cook'),
('<åñ\ﬂE\˜í&Qpp¢]','√éles F√©ro√©'),
('\–\ \ÍuvLGbìªˇè¿/ÉJ','√éles Heard et Mcdonald'),
('≠\Z\Z9\r•Ja¥^K\»8\Ï\œ','√éles Mariannes du Nord'),
('\´?\Ê0BŸµTw\ÚHr\Õ','√éles Marshall'),
('7_}˝\ÊKÉ§±˝∂!u5\n','√éles Mineures √âloign√©es des √âtats-Unis'),
('`í\Ï]ö¯A”•oW!\‰ûh','√éles Salomon'),
('•uQ÷Ä\–O%í\Á\Î≤+¥i','√éles Turks et Ca√Øques'),
('˘Øm&†\˜G˚°_\¬\Á“Ñû','√éles Vierges Britanniques'),
('\Û?πsB˝ú§äG¡2˝	','√éles Vierges des √âtats-Unis'),
('€Ü\Ô \ÈéF9ôCóeéJ','Inde'),
('£\ÒçU%\”AÆçH=\÷D≤','Indon√©sie'),
('7\ÕR¡çQBú¨\ÒzJ9®','Iraq'),
('\ıÆ^\Ë~H8ò\Ûo\¬@á<','Irlande'),
('\\O9*\“KKº\ÁiNü⁄°=','Islande'),
('\ﬂy\◊\ﬂrJ·òâ˝\ˆ\„0ï','Isra√´l'),
('10\—0O\∆CR≠9\Á}`Ef≤','Italie'),
('PE˘ö\‘X@\ˆ•¥õ¡S\Ì','Jamahiriya Arabe Libyenne'),
('ãX´\·(G≤µ®ÆÅ≤\›','Jama√Øque'),
('æ\rêu.L™Ñ¶≈õ^j\”','Japon'),
('u\È \ˆ†Däô|w~\Î¶','Jordanie'),
('O∞7!\Œ@\‰Æ/\"D\›\ÓB-','Kazakhstan'),
('\«XuwÑIPç\„+Mfr','Kenya'),
('˝í«Ç;G:â\‹ZÜÖº\Ã','Kirghizistan'),
('pÀ•ªùWJ”≥5\ˆ£2´\ŒC','Kiribati'),
('(\nF\nÇëF\Ôøo\ﬁ{ï)¨P','Kowe√Øt'),
('\·&¸`\ŸK\\¥î¸\‹\r\‰»Ç','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('kC£¥\…BÁ¢ê\ [¨\›w*','Lesotho'),
('Y˘Ø°KÏ≠ÖõKg\ÿ\Èì','Lettonie'),
('VÖhEéõB⁄Ç\«K¥˛®\Ÿ','Liban'),
('˘xtZn6L7ê≠í`SQc','Lib√©ria'),
('D\‰ë\≈¯N1ñ© ú\·~°0','Liechtenstein'),
('ö`\‹\ÌUG≤π\÷˛xÇ_ÅF','Lituanie'),
('8¸MΩæD˝µL%\ı;\Ò\Úa','Luxembourg'),
('\“\n\”SóFé\ƒ\Á/\Î´85','Macao'),
('H?|¶ÑI€öP\∆T+¨','Madagascar'),
('\˜v}Y4H‰µâc˝uÄ\«j','Malaisie'),
('Qp\ÙZWH\ËßPî{\ÛU\‰','Malawi'),
('ß˝^&n°Ky≤G≥övH≥\Ú','Maldives'),
('tcx#ùLnê¯J\’5\À\«o','Mali'),
('ñíêIOCBé:¢ïz\-Z','Malte'),
('\ˆ+\„¢K9∫ì±g2)à','Maroc'),
('\≈Ã®q,≥I∆æªB\ˆà5u\'','Martinique'),
('c\‡¥ÇúN¶äºM\÷\‚\Ì≥\≈','Maurice'),
('\√Àö<\Ê\∆A˛ï¶ÇfR\ˆ_','Mauritanie'),
('ô™\Ÿ\ﬁH¿B˚±€ìtˇ\0®4','Mayotte'),
('`\Ë\≈{ÃÅCø\·|π\ﬂ','Mexique'),
('åYéWßGi®f±˝˛P','Monaco'),
('m\‡®‘ö[E¥¨ú\–7X','Mongolie'),
('öü]\Òa)Ggòø∂\\L˘','Montserrat'),
('\‚Ç\ﬁHK1¥\Î.ò\(','Mozambique'),
('\ L\≈\mG•¢õ&\Ï\ﬁ\„F®','Myanmar'),
('by\Ô\◊˘∂Avµ”é+∞1òú','Namibie'),
('œï\"ªe\ﬁG\"ú¥ììo16/','Nauru'),
('0\ e¢\”Mp≤µ†\ƒQñ!K','N√©pal'),
('\-\ˆaJ\˜K øå∂Q√°_','Nicaragua'),
('é\ıa[\ÕyGÄû£D\”£','Niger'),
(':\⁄s	<!Kî£\g]\Áß\"≥','Nig√©ria'),
('x•M ÅBŸøõ\‰â\Ë\Ë¸','Niu√©'),
('e•j=t\ÎE\rØ\Ï§_Y\Á','Norv√®ge'),
('\Ë,\ﬂ\–|˛N)∏¯ T#Ç\‘\„','Nouvelle-Cal√©donie'),
('(\¬Lî%Gkª1\Ûg\‘\Ú∂','Nouvelle-Z√©lande'),
('kPïﬁßñNü\‚L\Û\‰Ff\\','Oman'),
('\ÈÖ/)ñdF.í\‡ZrJ°','Ouganda'),
('Oì2tN@º∑∞jl˝°—è','Ouzb√©kistan'),
('\·£TØªMS•eÉ(Oò~\œ','Pakistan'),
('gB:\ŒA°\ﬁKCΩ\0<ú','Palaos'),
('\ÿ„ò™\‘l@∞¢˚=5º>','Panama'),
('˛£|∆∫öM\„ß_\œ∆°Ñ\"\Â','Papouasie-Nouvelle-Guin√©e'),
('\ËÆu‘ëI(∂y@\‰Ü\È\Ë	','Paraguay'),
('~)˙T\»wH€π£\Î˛≠|E\Í','Pays-Bas'),
('ôÂßôJÀê≥\˜U\¬?π','P√©rou'),
('P\r\\\–lVO\Î≥Pπ¯˚¶','Philippines'),
('\Û-ú\Ò#5Gw¥j\Ô\‰Ü\√¿î','Pitcairn'),
('vh\Á\‘\Ë,LOìU$\Û3\–i§','Pologne'),
('˙R\Á:sˇF˘î˙K\”H˚	ì','Polyn√©sie Fran√ßaise'),
('\·S\Ìˇ|ïFéñ\n˝õ\Œ“ó','Porto Rico'),
('\Ï˘ÑuàC»ô\Óz\Œ»é\Â','Portugal'),
('ù⁄ÖH-\ﬂ@\Ï•\Èâ †\’!','Qatar'),
('!\∆sTâE±ôl`\€˚î¯\"','R√©publique Arabe Syrienne'),
('\∆\Ë\»\ÈtôKNå8\√[f\Ú\nÆ','R√©publique Centrafricaine'),
('µ∑b\⁄\ÙéHàÄÜ\„à\Ã\\\√','R√©publique de Cor√©e'),
('\ˇºH∫¢G-Æn\Ê	A¨\È','R√©publique de Moldova'),
('~±¿+\Ò@ößZ\‘ˇÆD˙z','R√©publique D√©mocratique du Congo'),
('9b∆∏#0Kﬂ®>\⁄\≈e0´','R√©publique D√©mocratique Populaire Lao'),
('\·ˇå\‰@}¶àª%+B\rC','R√©publique Dominicaine'),
('\·x9sJ\◊E^öÓâò6t\—n','R√©publique du Congo'),
('#3kΩ›ôFèä8\Œq\Í[Ø\„','R√©publique Islamique d\'Iran'),
('u\Ÿ\ùœÖIC¶u∂U18','R√©publique Populaire D√©mocratique de Cor√©e'),
('\Ù^ùEïì\0ß`n7ë','R√©publique Tch√®que'),
('réñé\÷lA\‰¨¶o\‚2\"i','R√©publique-Unie de Tanzanie'),
('TæD\ÕvAØ≥n\ÒvßAä','R√©union'),
('\›\‚\‡\Œ˙E›ü\¬)©ˇ∑\¬[','Roumanie'),
('[\‡\\\’\"äD“îò˙µ\ı∂õ','Royaume-Uni'),
('\ÙzXGΩ\ÂK)µY0\ıFç\Õ','Rwanda'),
('tß<DM5î¯B_•Ü','Sahara Occidental'),
(',:-»º9D°ù¥¸÷∂˛','Saint-Kitts-et-Nevis'),
('\ÏK©\⁄NÕÄ∏\ƒ$Ñ˝ó\’','Saint-Marin'),
('ºº>\ÁUØHœäF¬§ˇ\›\¬','Saint-Pierre-et-Miquelon'),
('6ú\Û\Á0ñKgÜ	\≈aÉ\˜∫ ','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('ïØ/Fº´Bº∂\› ¥\Íu','Saint-Vincent-et-les Grenadines'),
('C\·µt\–LM≈™∏`_Ö\˜','Sainte-H√©l√®ne'),
('Æ\÷\◊˙≠|CJ≤GF\Ãm|`q','Sainte-Lucie'),
('¢RVàÆ?Fb´I\„<˛©','Samoa'),
('Ñæì|∫O{©ö^¿A1è','Samoa Am√©ricaines'),
('\◊f\‡ä6G\Ó∫!s˘r\÷~','Sao Tom√©-et-Principe'),
('ç˘~\ﬂtGØJ\–[H∑â\»','S√©n√©gal'),
('\‹1Ø\ÿ\ÙLëÄòæü4≤','Serbie-et-Mont√©n√©gro'),
('NÇy∂8\‚Ow™\nâVJØHÖ','Seychelles'),
('XªqjúwE∞ˇE[=†∏9','Sierra Leone'),
('ÉÆ,WxLëïµªìIB2','Singapour'),
('%v¢âM|ç\÷pj®|¸','Slovaquie'),
('\≈i*”§7DÂñëá5ãa9','Slov√©nie'),
('ïTx\Z{Ex£òä\"ïdM\◊','Somalie'),
('\œ—¢-a\◊DD¶ß:\ÚŸΩ2.','Soudan'),
('P\˜/\0`CNπ˘\≈V\≈\œ','Sri Lanka'),
('\Ày-lÉO≈•6ê∂◊ï','Su√®de'),
('Ü\…`\‡\ÃG\ÒÑ6q\¬!´\√','Suisse'),
('@\ıTvtB˙àR%‘≤/\r\Ô','Suriname'),
('©l˛P\Z:L.ìV6\‡⁄∏\ŸY','Svalbard et√éle Jan Mayen'),
('∏\e	\–MO\Í∫\ÿ\·cfÆ\n','Swaziland'),
(' \ıOAB@ïnπ\ÙD•\—M','Tadjikistan'),
('L2PH)\ˆKC¶∂Ua\Ô\·n','Ta√Øwan'),
('@≥\ÈØC\ıô\Ó\«, B\ƒ\n','Tchad'),
('4{~†íH¥ä\Ã\ZOüÉ','Terres Australes Fran√ßaises'),
('J,f`\€NÅ\\V\À/˛','Territoire Britannique de l\'Oc√©an Indien'),
('a]\ÌFq¢\œ«¶G•⁄ï','Territoire Palestinien Occup√©'),
('\0åYV©?Eø∫t?õ\‚]æ','Tha√Ølande'),
('\È}RIÕ´Më∞¶j71a\Ò\r','Timor-Leste'),
('@ã\ÂJ@L«ÑóB\ƒ\Û$¸','Togo'),
('9ã¿≥>\ÌF“ß¨°°e\„\’','Tokelau'),
('éJ1≠DAùú+\È∞1ö','Tonga'),
('IuÔ¨≠JtΩù¿ˇ©6x∫','Trinit√©-et-Tobago'),
(';}ë^dëHNØ(Ü†&\Ày©','Tunisie'),
('ó\Œ>gSA/ñó`?\¬','Turkm√©nistan'),
('\ˆ\ƒ]\“.¨H«π•* â\‡—ç','Turquie'),
(',Çü\„o\"F´®\⁄¿¥iåè\Ï','Tuvalu'),
('ø@\J\rä°rQø°\˜','Ukraine'),
('\Ïm\◊jÆ¨Cjê\rÑwNYçD','Uruguay'),
(')8\ËHiâBnú\œ\⁄a8à˚','Vanuatu'),
('N•K@5ò¡9ZæO,]','Venezuela'),
('(\ËDC\ÿBlÇÇCj[¶','Viet Nam'),
('Wu\Â-\ÂMΩ¢Ñ|à\œ\›i','Wallis et Futuna'),
(' \ÚF0EAF≥d0.\–`Ö[','Y√©men'),
('n|—≠î≤@ïá+ûBL-','Zambie'),
('q{ó\√\”@\Ù∑Â≤¶j8Ö-','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-06-24 20:32:39',4),
('DoctrineMigrations\\Version20240201152951','2024-06-24 20:32:39',2),
('DoctrineMigrations\\Version20240202084749','2024-06-24 20:32:39',4),
('DoctrineMigrations\\Version20240202150901','2024-06-24 20:32:39',1),
('DoctrineMigrations\\Version20240207105701','2024-06-24 20:32:39',3),
('DoctrineMigrations\\Version20240319212437','2024-06-24 20:32:39',1),
('DoctrineMigrations\\Version20240614133504','2024-06-24 20:32:39',12),
('DoctrineMigrations\\Version20240617165906','2024-06-24 20:32:39',8);
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

-- Dump completed on 2024-06-24 20:32:41
