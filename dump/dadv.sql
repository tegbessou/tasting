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
('´\ı\ÂB›óH∫\Î[\·PP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',259.99,'2024-08-02',NULL),
(')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','Ch√¢teau Latour','Ch√¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','æm2\‹#Møåfh\—3[º','France',999.99,'2024-08-02',NULL),
(':(\ﬁ\Ó\Ú!J°Äk[\'{¸','Domaine de la Roman√©e-Conti','Domaine de la Roman√©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','æm2\‹#Møåfh\—3[º','France',2999.99,'2024-08-02',NULL),
('N¥I\Ÿ}#IÑ¶çw™¸\Ã`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','æm2\‹#Møåfh\—3[º','Italie',899.99,'2024-08-02',NULL),
('^¿ë{üF\‰á\÷\€v˚\›\Ù_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','æm2\‹#Møåfh\—3[º','France',1599.99,'2024-08-02',NULL),
('c^Äú™Ø@ﬂÑÉÉœæ,U','Guigal C√¥te-R√¥tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'æm2\‹#Møåfh\—3[º','France',358.99,'2024-08-02',NULL),
('i\nÑsÇØNWíÕëÜ±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','æm2\‹#Møåfh\—3[º','Australie',1799.99,'2024-08-02',NULL),
('{\’]\Û\Â<AÉ§é^Ÿº\’\r','Ch√¢teau Margaux','Ch√¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','æm2\‹#Møåfh\—3[º','France',1099.99,'2024-08-02',NULL),
('ó-L\⁄FAå4S\ı¢\·\È˙','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\À#zO0±àj≠q¥s_','United States',199.99,'2024-08-02',NULL),
('µLØ\ÈCnG§îVajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','æm2\‹#Møåfh\—3[º','New Zealand',49.99,'2024-08-02',NULL),
('\Á\ÚG¶fF@ä\»%\Ó>\Îm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','æm2\‹#Møåfh\—3[º','Italy',899.99,'2024-08-02',NULL),
('\Í¬°\ŸI^Ä‹ì∞∂W\Ì','Vega Sicilia √önico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','æm2\‹#Møåfh\—3[º','Espagne',1499.99,'2024-08-02',NULL),
('\w™√§O\Zå`v∫\Á∑','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',1299.99,'2024-08-02',NULL);
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
('\…S/m˚3Cï.\‡\Ó§Aå','Afghanistan'),
('Éyã.kDB€®pQ∆†º~\Â','Afrique du Sud'),
('\r-‘ü\ÚB§ñ•T\Zƒüc\‰','Albanie'),
('Àï¨\‘BF±	oÈâÇ=','Alg√©rie'),
('\∆%˘f\ÔLWçgsK\ÌZm?','Allemagne'),
('æ∂É\Ô\Í\ŒBÇΩf:ò∫\·\Í\Ï','Andorre'),
('˙\ı9”ú\∆LçßøeœØé!®','Angola'),
('˘|\ﬂ¬á@hë\‘\Ù6Z¢a','Anguilla'),
('¯\Ë~qª\rO,∞fB\€\r(i','Antarctique'),
('\Õ\„ê\€nC\ÔÇ,rzdÖºá','Antigua-et-Barbuda'),
('≤I\÷4ÖòJA°˚¿B¡1ï','Antilles N√©erlandaises'),
('\'¥\ÛcãE‰ùác\Ó\€k\’X','Arabie Saoudite'),
('MP\Áû\\≈@D≥˘¨\€	\”','Argentine'),
('ïô\‘t?In¥\‚^Õü8b','Arm√©nie'),
('Ç\·>L@ óS`î\Ùl','Aruba'),
('z0∫åFGAÜª\R∂:\€','Australie'),
('5¢˘\ıI>édG\ÈÅl\’','Autriche'),
('¸Ñ\∆Q®CÃ°Ü#~æΩπ','Azerba√Ødjan'),
('\Û	D<I¢LÑü\Ò\Ù*çk\√','Bahamas'),
('+£{bÜ\rC°ùí5H\¬\Û¢','Bahre√Øn'),
('ñ\rô\‘xAÅº\÷\ÛU\ﬂ\ŸC','Bangladesh'),
('µIw\0™wOg∂\ƒUÅÕÅ5\Â','Barbade'),
('\Ê)\ı\ë\‰Kã¶~7KgR','B√©larus'),
('Çx\ı6\ﬂ@\‰Å\ƒ\¬Eíj','Belgique'),
('\˜ç\⁄óCﬁ¥w2⁄ß±r†','Belize'),
('âÄ\«¥ºI–òàM¥é!I','B√©nin'),
('j].@U\rA˝≤7\”œÄ9\Õ','Bermudes'),
('-\—Gó\Œ\∆@Yî\È\ﬁ!/\"\”','Bhoutan'),
('H^\Èk≥SBAéÅÄFj<\"','Bolivie'),
('Ñvèê!\›K˝õ_H.~Éú','Bosnie-Herz√©govine'),
('◊úÖ^Mù\0â’æ3c*','Botswana'),
('+ôß)L1Ö%\ræ˛\’e','Br√©sil'),
('g_¸LbAÄí±\ƒ\€\„\Ú\›G','Brun√©i Darussalam'),
('U¶\'S±M≠•≥a\Ëèb','Bulgarie'),
('vwBG;LWÖª\ b9µ\Õ)','Burkina Faso'),
('\‘Àà≠+=M®O\"yê^\Ï','Burundi'),
('S≥LxtáCOøm.øü@$\Ÿ','Cambodge'),
('qî\ﬁEF]N›Ø\ÊZ\0Ÿäï','Cameroun'),
('Ω!§npJ\nØ\Ú\÷6\œ','Canada'),
('7¨\ÏΩFANÕ†\€Æ4∏Ç','Cap-vert'),
('∆Ä˘\Ëj/G¡ª\“\–\œ\Ë¶','Chili'),
('ì≤¥©\ıEªé´⁄Øb\…#','Chine'),
('(Cõ=§ GÆó\·m˘Å\⁄TÜ','Chypre'),
('µÅhï\Ó\ÈA∞π†\rX≤4','Colombie'),
('\Ÿ	\‹{çOaûi∑-%G{','Comores'),
(')\»Oìg@ÇÖQ\„)-˝','Costa Rica'),
('\Ë¿cHH:IYìπ≥)\0T','C√¥te d\'Ivoire'),
('¢\0=å™fD:ï7\Z\‰mÄø','Croatie'),
('ò®*\"DF?ôCß!áD\Ò','Cuba'),
('\⁄\ÔÜbS\ÊO⁄º°\”&U\Ót','Danemark'),
('\"∂\”%º±BKµ§Ñ+™w','Djibouti'),
(',h^ãÜ®K’ª≠∑\√aWï\«','Dominique'),
('@?h∆ÑÉE\núc_2r¥—¶','√âgypte'),
('˙\«/äª@e™\Á¸ˇ\¬>\œ','El Salvador'),
('\Z|¿_%nFﬂ∏\rœ∫-É£i','√âmirats Arabes Unis'),
('©=∏âIJ¶õ	KÆAï','√âquateur'),
('\r\Ê˝Nÿöä\Ã!\Ú\ZñK','√ârythr√©e'),
('ˇ{Öã†4M”á\Ï—¶ø&±','Espagne'),
('ÖqA.•Jåe\Ël\ıã','Estonie'),
('\À\Z\\\‹2!H	ùu\Îô\˜pïà','√âtats F√©d√©r√©s de Micron√©sie'),
('-ANí+A%ò%u\Ûµ®\„','√âtats-Unis'),
('Bö\\VØòJ}π9\Ùk¿ºg','√âthiopie'),
('ô:¿\ÀK∂Ä¢3¡\\\Ë%','F√©d√©ration de Russie'),
('aÅ&\ıA≥øÄ\\∞úó','Fidji'),
('˛±“©•\ZF&úπf4ñ¨','Finlande'),
('†\ÛµeiK πgª§x	S','France'),
('%’¥\«{O$Ø\Âôè\◊j\Ù','Gabon'),
('k®ùµMñùÆ\Z\Ú\Î\≈','Gambie'),
('°1M\—z\"B7Ç__\„µ','G√©orgie'),
('\ÓìyMz\»J˛óg4»¶\Ô\Ùº','G√©orgie du Sud et les √éles Sandwich du Sud'),
('¿•t@~AQΩø\Œœä#\Zé','Ghana'),
('p}\’\Ú£DOô\—¿≠\ƒIÖ','Gibraltar'),
('A¶aÜ\\÷E˙Ω˛C^.\ˆ','Gr√®ce'),
('\\\œ_nò.K-•´«éπòÄ','Grenade'),
('Ç©˙&@ó3n¶x ãõ','Groenland'),
('y°jª©BÓ©ºolúXs\–','Guadeloupe'),
('°A©©∂õEx¥\»oopO\ˆñ','Guam'),
('ªÄãd!O&≠Jr\0ù|7\r','Guatemala'),
('®s!KD@Lj•H\0}I!','Guin√©e'),
('\‡x◊á\»$Aó≤íŸ≠eæ\‰\ﬂ','Guin√©e √âquatoriale'),
('yñ§S,óKµòü\«\‚˝¨Eì','Guin√©e-Bissau'),
('Æ[\‚°\Í\ƒHŸÆ\˜\›éå','Guyana'),
('¯¯wò=êJ\ÊÜ4w\ı∑Æâ','Guyane Fran√ßaise'),
('\ŸsE\ÔYL\Â¢a©\ﬁ\ÒkQY','Ha√Øti'),
('s\\˙˚\–eOÄ\”R\0M\"∞7','Honduras'),
('¿\∆QØ¡NZ©øG\‹,F\Ë\–','Hong-Kong'),
('ü\"kÄP4Mê5Ç\Úy	\Ùh','Hongrie'),
('†\‘\Íi_NÜ∏ª[\‡h','√éle Bouvet'),
('BI\Í\Ó\˜Jâ©;\Î\Zi\“\ﬁ','√éle Christmas'),
('\Í[\÷\ﬂhO\ÁâXóñ\—\“\œ','√éle de Man'),
('\ﬁ\ÀoÖMë-N´\ˆæ˚¢','√éle Norfolk'),
('wsäf\Ê˛OÀò\Ê|°y¥\”\Á','√éles (malvinas) Falkland'),
('j\÷\Z•gC à~É§\È\∆}','√éles √Öland'),
('\Ÿx.J^¶r\Òc.\‹','√éles Ca√Ømanes'),
('>π\“®I;´Ru\r\Û∂\√','√éles Cocos (Keeling)'),
('^∫\ŒDzK\0†ÇäiÉO\œ','√éles Cook'),
('\√}\Z≤\◊\n@võ\”v\Ê\ÔQa','√éles F√©ro√©'),
(',*\‡ÜÑöDm°»∏v-\»','√éles Heard et Mcdonald'),
('m]~\‹8@rÑiò_Ä4T','√éles Mariannes du Nord'),
('§l.0@LîV3#û\◊_\n','√éles Marshall'),
('>ae\0%πBì„®ùM\ﬂ˘¡','√éles Mineures √âloign√©es des √âtats-Unis'),
('¯€≤\‡HE»ù1PêS\nÆ','√éles Salomon'),
('Ø#òèLL.Ñ\"{@ù\»+','√éles Turks et Ca√Øques'),
('¯W¶>\\HLŒ°≠ªÀÅh#','√éles Vierges Britanniques'),
('¸gæ\"DÅD\‡\Ú\˜ô','√éles Vierges des √âtats-Unis'),
('»àÆœà*HaÑ°Q\ÿ\"~','Inde'),
('g•⁄ï£M∑—¨ﬁé\\@\√','Indon√©sie'),
('√õ˘†å\«Cí£\√‘É ÄJ','Iraq'),
('OWS\ÙªD?íPÇ˘\Ÿz[£','Irlande'),
('añπ\ËF≥éå∏@\˜\–\Í','Islande'),
('8du˘\ˆˇOTé=∏2ü\›[','Isra√´l'),
('+y\Z;@∫ú§˛˘jjR]','Italie'),
('\ﬂ$5òBÆW^pI\Ârï','Jamahiriya Arabe Libyenne'),
(')é¯\‡iI&π˛ãh\ÓÉ','Jama√Øque'),
('‘£dæF’ú≠\rÑ¸V\Ë\Ÿ','Japon'),
('í\ÔõU˝E/•W≠xyí5ô','Jordanie'),
('ˇAP\◊\ÀJM|ß\œm(ÆOK/','Kazakhstan'),
('\√a\›s\"ßO\'§\Ë¿\È+ª\0ù','Kenya'),
('ëpª\ÙH¿ùõ\Ò2\Î¢\ﬁ;','Kirghizistan'),
('9\ÓL\ÿrÉF£ì\Ùìxé','Kiribati'),
('ª•*I\ÒáC6ø\“O=','Kowe√Øt'),
('6z≥ï\∆Nÿô4P\\ú\Z˚','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('ﬁâ$!{Lõ\ÕHvw\–','Lesotho'),
('mYå\ŒG\'ã\œ˝8¥Å?\»','Lettonie'),
('\˜£\\Ë!N	õ\ıXd!\‹','Liban'),
('S*\ZΩ%ªM˚Å[aH›á=O','Lib√©ria'),
('\‚C\·\€§A∏êaAm\nà\Ò\ﬁ','Liechtenstein'),
('GR#Ö\"íG•ãO>á\Û¢e','Lituanie'),
('*–ìò\À=LŸ°◊Ü\Â?Ø\‰*','Luxembourg'),
('˝\’\‚:-Ní∏&z¸\œ~i.','Macao'),
('\»@ìxs]Oa£\ﬂ/ÄÄBâ\¬','Madagascar'),
('ÖX\Ÿ\Á¥\ŒMU∞âg>tÑ\÷','Malaisie'),
(')\"Jß{G\\ÜC\Í\∆&qÖª','Malawi'),
('\ˆøòs¯O†e9?¸!\ˆ\Ï','Maldives'),
('ò jÉ˙Byöö¢˘˙','Mali'),
('\„lì\r\Ó\„IêÖJE\‡ï','Malte'),
('Ü≠\∆\Û-dCµê47\Á{B','Maroc'),
('ˇl\ﬂ\Ô˝5I˚ØíR	\Ë≥EI','Martinique'),
('c\\\„~\œ\ @»â∞ö+™¿\ˆ\·','Maurice'),
('ù\¬m\Û\ﬁqL±ó^DC}\À','Mauritanie'),
('Œ≤£Ew§Dæë<\Ï\„\“˛ï','Mayotte'),
('E\nmûWLb•∑6ó\Îz_\„','Mexique'),
('hL˚\ﬁb\ÀBqú¡1B*kã{','Monaco'),
('z\Ÿﬂå¥L7Æ\Á\Õ\—*?V','Mongolie'),
('V\‚,ÆL,á\Åé\‘A\n','Montserrat'),
('˘\Úåo\ÎáD∏\ﬁ¶¡•≤','Mozambique'),
('Ç<|ç\…[C:Ñ2\‰¨\’\ËX','Myanmar'),
('hß\‡\r∞∂N§Ïãü\ }\ÃK','Namibie'),
('ó\Èõ|0Jø=©;S-¥A','Nauru'),
('}ÖÉXu\≈I‘†>\Ê\È+3æb','N√©pal'),
('åaCÜJé®®Ñàï3X\ˆ','Nicaragua'),
('˘]®\ƒ+\’Iªè#@>å^∫','Niger'),
('î†,U+≥@∞âZG∏˘†\¬','Nig√©ria'),
('≠{¥`Ç\ŒI(ê˘!2ûf˘?','Niu√©'),
('Ñx\œN\ÈQF*≠éˇµ¥^\Ó∂','Norv√®ge'),
('oÇ\◊\›\Á8N{∑\Ôh\≈dfO','Nouvelle-Cal√©donie'),
('\ˆ\‰ΩZTLÇ¶yä@:bô','Nouvelle-Z√©lande'),
('iV]\JEwÜ-±ú˛\n\·','Oman'),
('â/ªKALW£∏1OH\€\◊','Ouganda'),
('J}\œW\ÿUB¶§´\0Ä\ÓSI','Ouzb√©kistan'),
('\–uC$BN:Ä˝.\Ÿ\⁄\’\Ã','Pakistan'),
('´\Ã¢\ÃKIîª1M49a','Palaos'),
('?b´ÜIGIkªCìÏáª\Ú\Œ','Panama'),
('ZùÑØ\·\ÀG∫ëi=G\Ô\ıvD','Papouasie-Nouvelle-Guin√©e'),
('\«IÅ@˝NôäA,eO@\⁄\‰','Paraguay'),
('+§p1\€O1õk«≠Ïôò\Z','Pays-Bas'),
('R\Ÿb˙-PEïì\Á\"ï\0`∑∂','P√©rou'),
('ù\ﬁi\’K5ëÉa\‘Vx}','Philippines'),
('p±~\«\ Bò\…\0\∆K\Úé\Ë','Pitcairn'),
('\¬óhkIqâO8EΩ•˛f','Pologne'),
('/≥~éJ§áß∂\›\∆\€˙&','Polyn√©sie Fran√ßaise'),
('˘\\{1\\;OÍΩçv∫UpÇ•','Porto Rico'),
('¸Q›êÇ´Aß4^¬óOp','Portugal'),
('\ÛR`Y!D\·ñˇow\ÿ_;°','Qatar'),
(',ó]X\÷Ciå©0a´-≥\◊','R√©publique Arabe Syrienne'),
('a\€óÅA˚†|çüT\ÂB\“','R√©publique Centrafricaine'),
('Å\rA;\‡D\Ô£mΩ\”y®\ƒ\Z','R√©publique de Cor√©e'),
('V\ı\ X˚\ƒCù°F\Ûud…º','R√©publique de Moldova'),
('=\ﬁ\Â\ŸPwH\ÙØ#c#\‡˝','R√©publique D√©mocratique du Congo'),
('ø˘\‰\Ó.>O\È∫\’…ºL–∂P','R√©publique D√©mocratique Populaire Lao'),
('c\ÀZacE\ıì©^æƒü','R√©publique Dominicaine'),
('#∑›ã«≤GÊû≠r±ùÕü','R√©publique du Congo'),
('köäN+M¬Çßüõ\’	\—','R√©publique Islamique d\'Iran'),
('\–\ˆ\ZVπNò®¶\Œ°Jy','R√©publique Populaire D√©mocratique de Cor√©e'),
('≥Yî∫ç6OZπë√ãÅè','R√©publique Tch√®que'),
('¸ãd&\‰HI´ªhKÉµ(\Ïº','R√©publique-Unie de Tanzanie'),
('˝ª\≈\Ô˚M\Ìã\ÔWù±˝5','R√©union'),
('§˘>\"\ŸFµ±R\È9˝ˇ™¥','Roumanie'),
('*\Á(A≈•Jƒ∞j@Ys','Royaume-Uni'),
('∫†5VÃªN›é¡öY\”\√\'É','Rwanda'),
('Tº\œ˘B8ïu˙*±°4','Sahara Occidental'),
('XroHvØO¥´\≈¯àCf¿\ÿ','Saint-Kitts-et-Nevis'),
('\Ò\ÀL9\–O]™ —§c\À/','Saint-Marin'),
('\‰#I%ˇ\nE\Ë§y?˘≤eì\Á','Saint-Pierre-et-Miquelon'),
('\‰ü\€WâD8®Ä\ƒµ{πb','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('ƒ§\Î\ﬂF…®ï∏«å	Mî','Saint-Vincent-et-les Grenadines'),
('Dëﬂá\◊ˇO\ZÖÅ+á¸\—','Sainte-H√©l√®ne'),
('\¬I¢\‰Å;M†í¿iëö`»Ç','Sainte-Lucie'),
('¿\ﬂO\‰}\ÌO˘æ\ı\…˘n≥c','Samoa'),
('†ü\Á∞\ZMp∂ªà¶˛´jz','Samoa Am√©ricaines'),
('9{\ÔwOÀã9we†R\Î≥','Sao Tom√©-et-Principe'),
('ñ\Ôé\·\Ÿ@ø\Ìä\ÎT®\'','S√©n√©gal'),
('†<å\ÊK\‚π}◊∂\Í§','Serbie-et-Mont√©n√©gro'),
('3í\È≥2&O-Åù$™kØÅú','Seychelles'),
('[\ﬂ\ı\‡Aöî\ÿX∂&]*','Sierra Leone'),
('¡tì∂ENÇß{2åYÅ','Singapour'),
('˝\ﬁß?\“GàØk\“\’åég','Slovaquie'),
('\'Üz\ÁcID;£\ƒ˝F‘è\ˆ','Slov√©nie'),
('ìB:qü\ÎJ_†\›\Â)jNör','Somalie'),
('\0\ˆ=;ÖK˚í\ÀN•è\‡}','Soudan'),
('\◊\n\râN\ﬁK√∏qµ\Ÿ\Â\◊i;','Sri Lanka'),
('\Ï˝\Õ\œ48@X®∏\\ño|!','Su√®de'),
('2\ŒA√âêD\'§>=Ióv','Suisse'),
('¯™∞\Á/Dk™\‚¶\0°\n:]','Suriname'),
('\Õ\ﬁ	˙\ÿ,N√ç|\Z8ºØI','Svalbard et√éle Jan Mayen'),
('•G];jsJ∂¡\—˚≥1\‡','Swaziland'),
('\Õ\Û¨~˙6CÔì•¥ìVS','Tadjikistan'),
('\ˆ\ruqøA”Ø™µJ','Ta√Øwan'),
('°I6\€qûNÿ®ñ~Áóáç\0','Tchad'),
('\È»ΩZz\\Aoú)éW`\Íß','Terres Australes Fran√ßaises'),
('g÷´S¢:Oàå(3Ωà\∆\Ÿˇ','Territoire Britannique de l\'Oc√©an Indien'),
('¿ò„§°*NÓåã\‚Vú∂¥','Territoire Palestinien Occup√©'),
('o}$ÜRrG\Î´/mG´_\«H','Tha√Ølande'),
('\÷\ÓsÆ\›!N√°@\Œ(ºç','Timor-Leste'),
('ÛÉöÉ\ÏBQ®ÑC\Ã.{J','Togo'),
('b≠e	g¢Iì{`V	\‡ ','Tokelau'),
('\Í\ﬂ$¯¨@oåg¿\“FÄ\˜¸','Tonga'),
('ì¨çfp\ÕE\Òãi±_\"ÅG','Trinit√©-et-Tobago'),
('}è\Úù\CL≥™ö/@ktâ','Tunisie'),
('põ ü[<G¡æC\ˆlò˘˘\ÿ','Turkm√©nistan'),
('\‡\ÓÑv•K@§ªpwö\·','Turquie'),
('∞ÑynINOmØ~ﬂ™¶¡\Z\◊','Tuvalu'),
('ÁÖ†\ÀF9O©î(&â yü','Ukraine'),
('Vã\\]Aiãv\Òd\Û`\◊','Uruguay'),
('\÷	ò\·K\Ó™S—ùâÇö\”','Vanuatu'),
('s\€X\¬8DúÆõ\Í>≤T¢≤','Venezuela'),
('\”¡g•>\“M÷¥aOΩ\#∆ì','Viet Nam'),
('V%s!\ÒH∫Ø\—¬å\¬Ã≥C','Wallis et Futuna'),
('ã¨O®oDh†3\‰æÀâ\Êå','Y√©men'),
('\‘{82YIü¨F†\√IWÃå','Zambie'),
('˝\¬˛MGàÖÅgçyºöπ','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-08-02 19:19:25',6),
('DoctrineMigrations\\Version20240201152951','2024-08-02 19:19:25',1),
('DoctrineMigrations\\Version20240202084749','2024-08-02 19:19:25',2),
('DoctrineMigrations\\Version20240202150901','2024-08-02 19:19:25',2),
('DoctrineMigrations\\Version20240207105701','2024-08-02 19:19:25',4),
('DoctrineMigrations\\Version20240319212437','2024-08-02 19:19:25',2),
('DoctrineMigrations\\Version20240614133504','2024-08-02 19:19:25',12),
('DoctrineMigrations\\Version20240617165906','2024-08-02 19:19:25',9),
('DoctrineMigrations\\Version20240708061729','2024-08-02 19:19:25',12),
('DoctrineMigrations\\Version20240801202153','2024-08-02 19:19:25',4);
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

-- Dump completed on 2024-08-02 19:19:27
