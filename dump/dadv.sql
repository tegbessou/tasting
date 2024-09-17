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
('e\›¸cèêLCû^:%s\rs','Afghanistan'),
(')~0\Ì˝I9å\ﬂ[º\ÙtH¸','Afrique du Sud'),
('Ö\"˝òyK£∞õ¿˛\”¸','Albanie'),
('XhÇåêB\Ëû`≠o≈°˘\Ô','Alg√©rie'),
('Jãï®F6áQ\ÓrR\÷À¢','Allemagne'),
('\Ë\Â˘)\rªOÅïFà\·\‡&(±','Andorre'),
('{C.˘\\@üÑ∏`ÅId\Ù','Angola'),
('$3\Ï\ÊJkº¯çôíÉ\ÁÅ','Anguilla'),
('-Wvû\”)Oê7ânîøG∑','Antarctique'),
('.D)0≈ªM	ô©15 (8*','Antigua-et-Barbuda'),
('\ƒ0PTaOûπ;jÑ\ˆ\'x','Antilles N√©erlandaises'),
('´(Ø\Ó\”FõhTkh˝8','Arabie Saoudite'),
('´gD>IäN<ªπkô \›\⁄','Argentine'),
('z\Ëñ\¬\ÙMMXã&Ö?\œC+ë','Arm√©nie'),
('\Ú_•o\◊>L{êO∑ΩìàW','Aruba'),
('\ﬁ2vT∏LΩü\÷\Âö\r&ˇ','Australie'),
('ü}†`ú@√á®\ƒÂãÖ ','Autriche'),
('¨R>5LæpÅ\Ë7ù\–1','Azerba√Ødjan'),
('·•Öí\rA?µQ)\Ò\Z9','Bahamas'),
('\Â\«\ÊµhDêêΩ\ﬁ2≠©\\','Bahre√Øn'),
('ã/d\«dL\Ú¢˘ú2w\Z\Ò)','Bangladesh'),
('ªi|_<B\·∞\“ÿ°Åë\Ÿ','Barbade'),
('I`t-°CCéßÄPJ/','B√©larus'),
('|\”3G\ÌFõ°nmF˛ö°','Belgique'),
('\›î†*CF\‡ñàÖ\ l≥\Ï','Belize'),
('M^™π\–@Bç÷£o\nrº)','B√©nin'),
('e˙`∂gMf©\∆7á±\œ	','Bermudes'),
('Gπî\‘üB\Úöô9q∫ræ4','Bhoutan'),
('\ÚHs>VóJ-≤n[§\’&∞\Í','Bolivie'),
('+\‚\’J…â∏x{\ÙåGb','Bosnie-Herz√©govine'),
('\»p\n*¿\≈A †J?æàvt','Botswana'),
('\€\Ù§2õæBv∏–∞\∆\Î>5{','Br√©sil'),
('w≤\È\∆˛âF≈áK+ú\÷o™\∆','Brun√©i Darussalam'),
('q\Á@±NLÎåΩ#†äjG','Bulgarie'),
('\ˆ#?^q¸O©ú[Ä\∆\›^≤\Ã','Burkina Faso'),
('\Û#$Ü!D›∑\“a\rù8)','Burundi'),
('Ü{9Ç¢ΩE0êûb_ßµ∞','Cambodge'),
('q∞@Z3F;•óÔ¶Üe\ƒ','Cameroun'),
('Aä\ÏÆ\ÎFbòD%¨Hñò','Canada'),
('éÄ:C«∂M´^aÖ•B','Cap-vert'),
('w\ÏòßA Ö≠?/^me\Œ','Chili'),
('ó\‚7K˘Éº\Î\‡AN','Chine'),
('QÜ>†-rIØ∏*†?©••\…','Chypre'),
('µgAö˙\‡I¥ß\“\Ï]≠\À3 ','Colombie'),
('á\ÍÉ\0FOMÄkÆô\‡\¬\œ','Comores'),
('\Ú)qºè]Hüôj#\ƒ3∏W','Costa Rica'),
('\ıáΩ~.•JøP/±~A\À','C√¥te d\'Ivoire'),
('2•P\ZN1Oåµ_Le;\Œ4\Û','Croatie'),
('£\Ó¸–±G>Ç∏Æ[ô\Zí\\','Cuba'),
('&Bªa{\nBpç\√ˇ\ \Ï|ñK','Danemark'),
('ïV(∫K\˜ö\rƒπ{6R5','Djibouti'),
('([8\‡\ÊLjäÿé\r/Vi','Dominique'),
('o#VRN?º@\ÃZª•','√âgypte'),
('ñ}uP\ˆ\∆Bvñ\Õ\0\ıó`!d','El Salvador'),
('í&1[ã\—G\Ìú’Å\Á\Ëç\ˆë','√âmirats Arabes Unis'),
('qãg\Ú\Ã>@iämµH!∫◊ä','√âquateur'),
(')\ÿ|<MEIóäÄ=\‰ë8+W','√ârythr√©e'),
('*…ÜÇ¯.Dõß…¢\ÔiZ\√','Espagne'),
('V\¬‘ßjæK$¥G\ZO7\Ò/\Ì','Estonie'),
('	∂~\ÙIb≥ºÜÆ¯£Å','√âtats F√©d√©r√©s de Micron√©sie'),
('+ÆRT{†JaëûZ>+\Õ<','√âtats-Unis'),
('\n#e\√ NlÆî®\“\”e\Ë','√âthiopie'),
('∂5\œ\n\ÎdGπ†&\Ï+åé¶)','F√©d√©ration de Russie'),
('§R\0nˇFæ4\Ú»≠v\Ù•','Fidji'),
('€≤†∑JDáØ|≠¡)<','Finlande'),
('≥ü\ÂèLKh†“ö±˚o\ ','France'),
('¿Uµ;d\ÔOﬁ∞1\Ù!\∆88','Gabon'),
('Dâ∂ZáK_Ω∂=ï…°\"','Gambie'),
('h/ˇ\ˆOC\rèkØx\Œ2\0','G√©orgie'),
('\÷e4*}Fè•\Í…ª:','G√©orgie du Sud et les √éles Sandwich du Sud'),
('ª?´Ö± DSø9+ôh','Ghana'),
('mØ∂\ÈœóI•§i\÷6\Œ˛\»','Gibraltar'),
('É\ÔRGπ\Ÿ\Â8}fW<','Gr√®ce'),
('\·\ƒe£NèÜ»è\–g._','Grenade'),
(':\«a\◊TMà!(\ıP:.','Groenland'),
('√ñ\0IZgC\Òâ∞k7˘\«@','Guadeloupe'),
('âESé\»\ÿBkêúxÄdp¢','Guam'),
('à\‘¯E\–G&Çw‘™gYZ','Guatemala'),
('b¶å\Ôû¿OÎã¨ üÅg\ËØ','Guin√©e'),
('yY\—\Œp¨J˝éÆ.ï;','Guin√©e √âquatoriale'),
('eê¥CXπüPå\›E∏','Guin√©e-Bissau'),
('ìl-d˛\B‹ì¸\ﬂ\r3Z\‹','Guyana'),
('i∑{\“\‡(HÃ∂òÅGû∫\ÓK','Guyane Fran√ßaise'),
('\Ão\ƒN∏\„Lo≥=\"∫\∆\’4\ÿ','Ha√Øti'),
('mvƒßkE›£¡q\Ã\nOR∞','Honduras'),
('Oñ{Ø\ÂRN§ìoëk“ò','Hong-Kong'),
('7K≠Hµí˙ë¥\Ê\Èwö','Hongrie'),
('g/\ı\‚K\Ùê\∆júê#É','√éle Bouvet'),
('ncQ≈©Lﬁæ\rgˇÉüù','√éle Christmas'),
('æﬂâ‹∏+DcΩ™\Ú˚cuQ∫','√éle de Man'),
('M/ÃÇ\\GRÅÖæN\Ï\ÍÑ','√éle Norfolk'),
('\≈\n\Â\„~Hz≤\–lLÜ£\Û','√éles (malvinas) Falkland'),
('ÄaãçIL∑c`%˛Üßò','√éles √Öland'),
(',#¿\Ã$EÃÑ[Wæ¨\Û¶','√éles Ca√Ømanes'),
('\‘1\√8á&NS¢\‘\'\–\ [x\“','√éles Cocos (Keeling)'),
(',L˝Ñ¢\‰Iù\Z∫\ÿ6O%','√éles Cook'),
('y¿6BtI¥]îﬁæ§zG','√éles F√©ro√©'),
('	9Ä\Ów˛M¯§\ZÅ\ÈÉ¯c','√éles Heard et Mcdonald'),
('@QB\'[E\„ásV ¶\√*?','√éles Mariannes du Nord'),
('∏d\ÒÄ\ˆ0B]ÆoDú\„Ñ\ˆõ','√éles Marshall'),
('è\Ó,\Ï,úF:ªq¸\ÕDE\–','√éles Mineures √âloign√©es des √âtats-Unis'),
('ã\„Åj\ÁBN¢ç®\Ó\«6∂.','√éles Salomon'),
('°ÜfG:§6F˘Ç\ÓSÉ','√éles Turks et Ca√Øques'),
('ö¶@\⁄\–Nw∞æsv:\’`\Ë','√éles Vierges Britanniques'),
('XW°îM5Üõ)\’3“îÜ','√éles Vierges des √âtats-Unis'),
('C.\ÿ\Ò\∆%I3ñöTác\ıÇc','Inde'),
('B.\ÚAÄ\ÙE¶∞ß#ú\√¨','Indon√©sie'),
('ánÉvÆM◊§W®Khï\0','Iraq'),
('<˙\Ïë0_B\ÊèSéøHÅE','Irlande'),
('w8apsD\Í°÷æy¥rF*','Islande'),
('\Òo•yˇ@™âõ¨†,é','Isra√´l'),
('π\‹>ìåeC¡©ª\¬S\≈2∞v','Italie'),
('*8\ˆ2#AERΩ*\'[\Ù\◊Z¯','Jamahiriya Arabe Libyenne'),
('\“Q\œ\Û{~L›áâI3H','Jama√Øque'),
('˛∫Ê∞•,Eæ∫X&«Éó/','Japon'),
('üãµa¿\·Mfüyñùæ7\Ôö','Jordanie'),
('òòs\‘A_J\nÖ]\'#Hπs','Kazakhstan'),
('Ä\Òq\>§B∂ãxVÅw≈û','Kenya'),
('-0∏$oE’ûabÑ=\√Lx','Kirghizistan'),
('iì\Ê\0\◊\ÎJ\ZøØlãwä\"','Kiribati'),
('\Í{m\÷xBáØôåF°n','Kowe√Øt'),
('ùW`plN6§wÆ™©\ı&','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('¨T∏F\‡öFmI\Â,#G','Lesotho'),
('Ohº∂xAöî¶µ/Æïé','Lettonie'),
('#ΩI©üãF›¨Cz/i\ÓTw','Liban'),
('˚G’¥yC\ÎÑ=xèü\\l¥','Lib√©ria'),
('≤2)\ƒhJ€∑T^|8rpö','Liechtenstein'),
('\Z\"Q\ÈLAö≠¡ù⁄æª\≈2','Lituanie'),
('\ÿ5ÆNmàG^µ9\∆\Àrf\À','Luxembourg'),
('\Â ∫\ˆ\ŒK≤§A;bR\Ë\ﬂ','Macao'),
('Vo©\◊VöFÚüó¨\Z\›/e','Madagascar'),
('eL•æB\Ù¶Z≤â‘á˘™','Malaisie'),
('Cò≥†|Lˇç∏\Ú:7\÷M','Malawi'),
('rHÆ\÷4\ﬂK¯üFPûwM∫','Maldives'),
('6…îèXnDBç\«\˜Ms\»!','Mali'),
('çLvãhîHt¥\Û\¬\“\”<Q','Malte'),
('\—(8\IÖí¡lW~yd','Maroc'),
('{\÷˘¯UëE‹™\Ï6øcE','Martinique'),
(':ç?Hæµç&\…5©m','Maurice'),
('∏ï˘!\œOfõHª\ÎK\n~\Â','Mauritanie'),
('	f\Ó<\‰NF»Æ\Ô_t!Å^','Mayotte'),
('vP\Ï>ÄªDêàp\'\rT7∑o','Mexique'),
('`\≈\Z\∆\ÃFF•µ4\˜\«Iq','Monaco'),
('I\’\‡Ñ\ËL@Åñ˝èú@f)U','Mongolie'),
('\ÿG\ÀC êK©î˙å©°Ñ','Montserrat'),
('bêv&$NŸåæ˛Q\Ò7ò','Mozambique'),
('ôr\÷Yu\ÀN5≠≤üF\Œh≤','Myanmar'),
('ßw\Úµ\Û\ÛL˝ì\∆\¬õãΩ\Ã','Namibie'),
('ô\n\„ñ\◊CE8∑†\Á%$C','Nauru'),
('G%l\÷TMä∂\…vdõP:N','N√©pal'),
('Y\»\⁄\˜J\0K@Ö\—<\ﬂnU!','Nicaragua'),
('\…3\\\ÙACπè\‘\Ë\√\⁄G/','Niger'),
('ß\Õ\Ò|≥UE¬°\’\€Y\ÏÖCC','Nig√©ria'),
('j)D˝PúHeøgˇ§\‡3!','Niu√©'),
('\Ù)\Íe7^L.ë\„\Í*Ç€¶}','Norv√®ge'),
('ˇÅõãlñD|≥≤lOF™iÉ','Nouvelle-Cal√©donie'),
('\‡öÖpO;õ\Ê\ˆ\Ô@\€\…','Nouvelle-Z√©lande'),
('ö#\‘]qCOKåæ£áaÄ\Ã','Oman'),
('2˛?\∆\Ê.O9∞FI≠yT\≈','Ouganda'),
('Dè¡˛î^E.±\⁄\Ó≤âø','Ouzb√©kistan'),
('Wa\‘0B\‡ß\\‚ê-≥Ñ','Pakistan'),
('o@3\"üSK¥ß©F ¶\ﬂó','Palaos'),
('R\ﬁ\’\'/\ŒA©ê`ô˙\≈B','Panama'),
('CÖMy\Õ*N@Å¨/\˜™jâ\Ë','Papouasie-Nouvelle-Guin√©e'),
('Ωº\Ó#pHDã\«\⁄={¡v','Paraguay'),
(':ã3@\„DÉá,ô%ü\n','Pays-Bas'),
('\„É¸\¬1Mëõ#ß\€\Àoo','P√©rou'),
('-µ_\‡‘ªH…®\≈K#Æ3H','Philippines'),
('+Bú‹äMˇ™m‘ì@∏','Pitcairn'),
('z\‰•aÿîBR∂®\Ì\Ò\Œ\·a','Pologne'),
('\Ùµ\»M€¶L¯π8{\Ÿ./;˚','Polyn√©sie Fran√ßaise'),
('r\Ò]!¸Kç:’°\0\«\›','Porto Rico'),
('Ø(\Ú\…75MW¶~H\ÍD£≥','Portugal'),
('w%£`Boø±êK\r%\','Qatar'),
('Jç•\Ïk@üB/\È∏','R√©publique Arabe Syrienne'),
('•\ÚY|;≠Fàõ¶@´°ùî˛','R√©publique Centrafricaine'),
('\–\ƒkê\…CBåån∑\022\√','R√©publique de Cor√©e'),
('\nõ\0x™@õÉB˚:íwˇ\Í','R√©publique de Moldova'),
('y˛*\ Løæ±\Ù1NlX','R√©publique D√©mocratique du Congo'),
('U\r\rFRª\0ß#\’ªH','R√©publique D√©mocratique Populaire Lao'),
('	ál\Á*µIyç¸°\Àÿ¢≥\Ó','R√©publique Dominicaine'),
('\Ã]_∏^˙Faü\Á\«˚\Ê\ËI','R√©publique du Congo'),
('\ˆéIU-H¢ºd\È\·qü¢˚','R√©publique Islamique d\'Iran'),
('˘´ëDfJIq∑!\«o\€Dï¥','R√©publique Populaire D√©mocratique de Cor√©e'),
('\Ó%à†©Mπ†\Èhã}£åj','R√©publique Tch√®que'),
('o¶W\’B◊ç*\˜vcb\r','R√©publique-Unie de Tanzanie'),
('ô\·˘\"úKòîZ¥OÖ0','R√©union'),
('„ïì\Ïø\‡FπÜ¿f˝£\Î}\—','Roumanie'),
('ùÄnH´\ÁF≠â<#\‹\›\Ì@','Royaume-Uni'),
('a@®v\¬A⁄ï5+\Ÿ\0T\Í\Ú','Rwanda'),
('ÅÜEZ~~C_≠\Ì2\…\”i|','Sahara Occidental'),
('vQYˇ\ﬁB9ª\Êz\Ò≤\\Â','Saint-Kitts-et-Nevis'),
('\«gmzè[@ßòê˛¥\1Ke','Saint-Marin'),
('\»5p2\ˆïC™Ä£õ≥Xb','Saint-Pierre-et-Miquelon'),
('\ \Ù\ÿ\„ Mîü•É,°\‘i≤','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('ë#9¯ô	J∫≥öXæ\ N¬∑','Saint-Vincent-et-les Grenadines'),
('\›\Ù\—xpgCöL§<Bê','Sainte-H√©l√®ne'),
('>º\ÁHDö¥\”}¨Tî\¬','Sainte-Lucie'),
('©\Ì-\Ú\„\\G±è\'/3ô\œ{','Samoa'),
('¶´rJµ@Cπ\06p','Samoa Am√©ricaines'),
('|¿dôØMM≤(îæ:\≠L','Sao Tom√©-et-Principe'),
('\»\»z}\’LHÍ¨≥óE\ÃiDV','S√©n√©gal'),
('aW\»uKjå}Z∞™q','Serbie-et-Mont√©n√©gro'),
('Us•X)C\Êê\ÎÇ@Hi\ÏC','Seychelles'),
('a¿og\ˆ¸Hº\ÃeÉ,•Å	','Sierra Leone'),
('\Ë…á\ÓL_ÑC⁄Æö','Singapour'),
('ZTzahqI\Ê∏[\Î	\Z02','Slovaquie'),
('õA<˘üB—Ña\”˙?<\‘\ÿ','Slov√©nie'),
('\Ú•Ü\Ê\ËBM®ZE\÷\“f\ \Ÿ','Somalie'),
('M(YHπïCsÆG~,Ä{\ŒB','Soudan'),
('(V\ÿ;33O™¯Ω[\“6\ÏD','Sri Lanka'),
('≥pöQhIöè¶U\\\›M','Su√®de'),
('i>\«\"?DùπáW2sM!i','Suisse'),
('\Õ#eò¢£JA•\Œ\Ûbåï\n','Suriname'),
('\0I:\OˇûèÉ•ê∑\„ë','Svalbard et√éle Jan Mayen'),
('R±ÄÕ≤ûC´§˝\ \ˆO\·/\"','Swaziland'),
('ÜyAü\ÃH\ÈívÑ$E˛T`','Tadjikistan'),
('¯\‚`ò\„\ÌI›ß`âOv[0','Ta√Øwan'),
('´6~\Ó\ÊEÀÖÿñÄ¥$òõ','Tchad'),
('ÿ±üï\rG\„ï\ˆW.bÉJK','Terres Australes Fran√ßaises'),
('+j7.˚IV†\‡2\Ê\Î\Õ7','Territoire Britannique de l\'Oc√©an Indien'),
('VËª©J<¶\€bìó;\◊','Territoire Palestinien Occup√©'),
('\√J|\"ì≠L¨*ƒîy','Tha√Ølande'),
('áuc†\ﬂJ;ö	nR|m','Timor-Leste'),
('\ÎQ≤øgM@∫ÜÉ\ÈR™Õ∂','Togo'),
('P\Ÿ	ª\»\ı@\ÍÆ]EΩW§0]','Tokelau'),
('\–\Ï\ÈkKœ≤ò\›\…≠c\È','Tonga'),
('\Ú±.∑úIS´?\–\"\Ò','Trinit√©-et-Tobago'),
('¨Æë\n\⁄\—E&äòá\0\…E\È','Tunisie'),
('\0©ÅU	øC¸áPàvîÇ≥f','Turkm√©nistan'),
('9Æ\Ô@\∆/I∞åw\'[ºM˝ò','Turquie'),
('à©1(7/H2≠aç§ì\ &','Tuvalu'),
('±H†\Â`\ÎAã¢1∑Äã2\‡=','Ukraine'),
('\‰~m•y%J\"Çq\DïeZ','Uruguay'),
('m\‹&@NçØh˘∞\‹f\—','Vanuatu'),
('K^¥¨\ÿ@vπ≥ëâõ\÷–ã','Venezuela'),
('\÷<\Ú\Ùù`IàïV;ï	\ﬁNY','Viet Nam'),
('=˝\ÊõÄHIÇõò¶sπ','Wallis et Futuna'),
('∏£¡ì5\·@TÅ◊å£üz','Y√©men'),
('§›ª\ﬂ\ÌGüqƒè\÷¿∫','Zambie'),
('[n0 \ËKêÉ\ƒélC/','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-09-16 06:59:47',3),
('DoctrineMigrations\\Version20240201152951','2024-09-16 06:59:47',3),
('DoctrineMigrations\\Version20240202084749','2024-09-16 06:59:47',2),
('DoctrineMigrations\\Version20240202150901','2024-09-16 06:59:47',2),
('DoctrineMigrations\\Version20240207105701','2024-09-16 06:59:47',4),
('DoctrineMigrations\\Version20240319212437','2024-09-16 06:59:47',2),
('DoctrineMigrations\\Version20240614133504','2024-09-16 06:59:47',11),
('DoctrineMigrations\\Version20240617165906','2024-09-16 06:59:47',8),
('DoctrineMigrations\\Version20240708061729','2024-09-16 06:59:47',12),
('DoctrineMigrations\\Version20240801202153','2024-09-16 06:59:47',2),
('DoctrineMigrations\\Version20240815153823','2024-09-16 06:59:47',2),
('DoctrineMigrations\\Version20240916065051','2024-09-16 06:59:47',4);
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
('´\Ì/iöÆMí©\Ì˙|òVt','.•l5ãπLnöIΩy\≈\Ò7','\…5?0O§ÖÄ)\\¶ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-09-16 06:59:48');
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

-- Dump completed on 2024-09-16  6:59:48
