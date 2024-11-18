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
('´\ı\ÂB›óH∫\Î[\·PP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','√âtats-Unis',259.99,'2024-11-17',NULL),
(')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','Ch√¢teau Latour','Ch√¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-11-17',NULL),
(':(\ﬁ\Ó\Ú!J°Äk[\'{¸','Domaine de la Roman√©e-Conti','Domaine de la Roman√©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-11-17',NULL),
('N¥I\Ÿ}#IÑ¶çw™¸\Ã`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-11-17',NULL),
('^¿ë{üF\‰á\÷\€v˚\›\Ù_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-11-17',NULL),
('c^Äú™Ø@ﬂÑÉÉœæ,U','Guigal C√¥te-R√¥tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-11-17',NULL),
('i\nÑsÇØNWíÕëÜ±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-11-17',NULL),
('{\’]\Û\Â<AÉ§é^Ÿº\’\r','Ch√¢teau Margaux','Ch√¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-11-17',NULL),
('ó-L\⁄FAå4S\ı¢\·\È˙','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-11-17',NULL),
('µLØ\ÈCnG§îVajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-11-17',NULL),
('\Á\ÚG¶fF@ä\»%\Ó>\Îm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-11-17',NULL),
('\Í¬°\ŸI^Ä‹ì∞∂W\Ì','Vega Sicilia √önico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-11-17',NULL),
('\w™√§O\Zå`v∫\Á∑','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','√âtats-Unis',1299.99,'2024-11-17',NULL);
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
('Rï)©óFgó~°N^®I','Afghanistan'),
('Ö\≈\Á¨\ÎOo¶°\”Ci\√C','Afrique du Sud'),
('±fô\ÌY\rCD•nûKê¸#','Albanie'),
('c\„∫z\„CÑÖ\Â\¬‘ö\Ï\”I','Alg√©rie'),
('?>(k\Ó\≈JY•ûΩØ\ﬂ\‡ee','Allemagne'),
('´]\È¡ªOÇ\÷=a´¡øL','Andorre'),
('ñRÜ{ä\ÚC\ÒÇ/\Ë@7n/','Angola'),
('\“—õUØCûπ©&ò-%æ','Anguilla'),
('x!∞°;mH´∏\Ë5j\÷\‘\∆','Antarctique'),
('§˘I[\ \Z@h•£Xºa','Antigua-et-Barbuda'),
('.ˇ8âG§©\◊Tà+G\Ù\‘','Antilles N√©erlandaises'),
('ªÑl\’5\¬EÔüáä_[$\Û4','Arabie Saoudite'),
('<x\"ΩG\ˆ≤∫ú	\ÿLã','Argentine'),
('°\Ó%VµâD\Îû\Ú-©ˇ±\\','Arm√©nie'),
('Ä\Óh CáMµ\Á:ßΩ\”\'','Aruba'),
('¸DB\Ë\ÊC}ã\Ïµix.”æ','Australie'),
('È¨Ä;d\ﬁFîôc¡¸\˜É2¸','Autriche'),
('\ÁŒ∫?Ø\ˆKC´[\ı]±\Í4','Azerba√Ødjan'),
('AbBouFPòV>ù≤\ˆ\Ô1','Bahamas'),
('˛˙∫%YJHó\Ï¢\‰T%','Bahre√Øn'),
('#iúLG\‡Ñ∞ì	\"\"Fg','Bangladesh'),
('∏cå\–F>°˘e\‘UI9','Barbade'),
('At\5ê\ÙM”öG|Øß\Â\Ó\≈','B√©larus'),
('\‰GäzH\‡üåâE{\Ô~','Belgique'),
('©è\Ëñ\⁄Aæ∞F\Î.\Òàæ','Belize'),
('¿óÀü$µ@û¡ãUß]\Ò','B√©nin'),
('w\n\„∏8PA†âGR\˜€Ñ\‰£','Bermudes'),
('˚8\0\˜\ÚB∏æ\Â(Ω¡8c','Bhoutan'),
('\€tAH8¨NtªJ\ıòñ\«\’','Bolivie'),
('a-\Ó&JñL3ü¨D%\\M\Ÿ','Bosnie-Herz√©govine'),
('aˇÇ\Ô\'DEº\ eq_hjµ','Botswana'),
('S*z\Ù\Õ6Kå´≤æ1ÅùQØ','Br√©sil'),
('fGú/MaÅSBòJ+sµ','Brun√©i Darussalam'),
('(\”\…:q:D˛°\¬\‰\ﬁa›†','Bulgarie'),
('äå|˙A@õΩ≈ß+)tu','Burkina Faso'),
('†Sé˝1Cºí∫f\Ÿ˙≤','Burundi'),
('ém€º˛ÉGï1ï\≈!£','Cambodge'),
('wv\’˙µDOñ;òµ≤\‡0','Cameroun'),
('ôB∞Wë˝@>±æÅ\ƒ^,','Canada'),
('\‰\≈\ŒŒÑ@vá\≈PΩ\◊,8','Cap-vert'),
('≤õ\√¿\"Lÿ´ï\›˙≥i\Œd','Chili'),
('\Ù˘l˙@(§$(ï]/$','Chine'),
('åníg\∆@Éò7˝/\·\Ò4≠','Chypre'),
('vzñ\‡ìNàõ@Å\‹Â∏Ω','Colombie'),
('\nZ®_5\–H7§¶$˘_\Úï','Comores'),
('TJÉ9\ıLÆ™&ÄH}}B','Costa Rica'),
('ú\0\Ë=À≤HCØ\Ê:oS\ƒ','C√¥te d\'Ivoire'),
('¶^µ\“\Ì\ÍO§ü\ˆIb¿T\Õ','Croatie'),
('\Z€º¥\ÛsEõà\”\n›π\'{\\','Cuba'),
('≤\Ù>ÜEπè£X#K\\é\Ì','Danemark'),
('\"t\√Œó?Lû\‘v5˚\”\≈','Djibouti'),
('π\ˆΩ\‰•jL ß©õPä7','Dominique'),
('\‘^3ÀüLë\ÕuÄøC\Ì\”','√âgypte'),
('\ﬂ\“Cú\…Ká\À]E\ÿ8À¥','El Salvador'),
('≥≤ûågjCeû\ÎP9\Ô•\…1','√âmirats Arabes Unis'),
('\ÏN\⁄\ÒJFB_∞Aîù≤Ç	:','√âquateur'),
('é_Vñï°O\nπ#yn\ˆ\Ú','√ârythr√©e'),
('µ*\ı\ÔH˝É6Q\Û¨˚i','Espagne'),
('¿\Ÿ˘QoºJ◊®°S\Û\ \‚V','Estonie'),
('∞˝Ü›ïJ\Zù™≠á.\':5','√âtats F√©d√©r√©s de Micron√©sie'),
('R˙6;ûG6≥î\√z¨æpö','√âtats-Unis'),
('\Ôt[RºyNΩΩ\∆¯%lRí','√âthiopie'),
('â\Õ;ØEFîúá7∑f6+','F√©d√©ration de Russie'),
('ﬂ°Åx\„C⁄´4è¶\"j[','Fidji'),
('_VD≤Dtà∑ÉLÖ\˜)','Finlande'),
('cPmì\Œ¯E¡óÑ˚‘¶≤Øˇ','France'),
('ô\∆v\’RôEﬂΩ≈å	°åä\…','Gabon'),
('\ﬁ;\’jy@BF∂»º\ﬁ–à,˛','Gambie'),
('\ÍŒÆ-∫éC†ê\Ê\\\.\Û±','G√©orgie'),
('\ÔT=ÖAKé\'\›A{)GZ','G√©orgie du Sud et les √éles Sandwich du Sud'),
('¶Ãí\ƒ˘*LC´¿\'˚\’¨','Ghana'),
('\Â∂uf´ÆKÅ∫óuI|','Gibraltar'),
('>≠3´J≥oN\ı@\’\ƒf','Gr√®ce'),
('Pë\÷VsIÖA¬∂ùL','Grenade'),
('˝5H7\˜G1®\\Âmfß¥','Groenland'),
('RBó#ﬂÇAGõ	m>‘ùdπ','Guadeloupe'),
('±ÉVµ©E8´÷è`eò\Á','Guam'),
('Ω\˜≥(ﬂìF˙âa¨î4`˙','Guatemala'),
('~\ﬁ\È¿\ƒ\ﬂEéç∏•5é~=r','Guin√©e'),
('ãm˙\‘òJió\◊Qs⁄πl3','Guin√©e √âquatoriale'),
('Üs∂\∆\nCKç¶m6ó\ÊId£','Guin√©e-Bissau'),
('®É4Ø™L@ïàö±˛\ˆ)ê','Guyana'),
('\ÓFï§HXJn©	c	?Ä>\Ó','Guyane Fran√ßaise'),
('ùm\«qkäAvøuC/è◊∂','Ha√Øti'),
('˘\0Oø˛\›Oò.˛(Å\Â\·\–','Honduras'),
('\Ãk\ÿ\‘\Ô@C´~\0¶68','Hong-Kong'),
('˛PAk*\ÏO*µΩãoVß™','Hongrie'),
('8î\Ã\ı)hJ›æ\ˆ¯◊µL\Œ','√éle Bouvet'),
('yÍπØDòå/Ø\…lt','√éle Christmas'),
('d\ÿ-±1±@˛ó‹π\Ó[Ií','√éle de Man'),
('Øè\ƒ\ÚØM…Ñ\˜,°û\È)\∆','√éle Norfolk'),
('õì\·˘{&@h†¶®íQ\‚-\Ô','√éles (malvinas) Falkland'),
('R∂Z\Ÿ\ÍHió†ûa\ƒ\Ù6','√éles √Öland'),
('9Kæ\ÿ√ÇG\'¨4¨∂\Ú\ıMQ','√éles Ca√Ømanes'),
('\„ñ\Z¡ˇNπ§`)\~‹©','√éles Cocos (Keeling)'),
('3¶b\ﬁ=E—òwÑ\Ã\–\“~ü','√éles Cook'),
('L^íbXQL˘ø⁄∞\015&\…','√éles F√©ro√©'),
('ÕÑ\Î[Oõπ\ˆw¯BãsL','√éles Heard et Mcdonald'),
('î	=:i	E¶ô\'∞Ü\‡\È','√éles Mariannes du Nord'),
('\¬¿ü!©HI¿∞,r\…:}\—a','√éles Marshall'),
('\‘jâäK\0N?•[üáß+Ü','√éles Mineures √âloign√©es des √âtats-Unis'),
('™™kkD\œM∞µë\€\"\'&','√éles Salomon'),
('P∑fK\”CF≥ë\0¬çq\Ó\≈z','√éles Turks et Ca√Øques'),
('á˘∂*…ÇO[íØ\…bá$','√éles Vierges Britanniques'),
('±õ4yìB~®\Îà\¬j.ê','√éles Vierges des √âtats-Unis'),
('UzÇ•¸AÇç5\ﬁAà\È\À','Inde'),
('∏©\'m®I\ÎÇ¸P\‹Œµ>A','Indon√©sie'),
('ì˛%%1EÕôj}| à ','Iraq'),
('õ\0Mò†2≤ç”£\Õ','Irlande'),
('DædpåN˛û\…5qæ§˛','Islande'),
('Ñ	zv\ŸcM+£`\–Fø•6è','Isra√´l'),
('1Ìéò\ÚkM∂®\Èµ`ì\ÈBN','Italie'),
('-\ı0\‚ã(DYÖ4\Í26P.','Jamahiriya Arabe Libyenne'),
('åtU%≠F\Ë†5j_;\Á\›l','Jama√Øque'),
('mê£\∆OÍµ∫{•Nä˘d','Japon'),
('à\ÙÄnz\‰E∏é\Ô\Ë\0zë\Ô','Jordanie'),
('eìô,\”K§\÷\◊p\ﬂã','Kazakhstan'),
('Z1‚£ùüB\ÁöS\Û∞é\\ä∞','Kenya'),
('\«O\ﬂ:©L®ûø˘ò~\ \€\·','Kirghizistan'),
('+*<X\∆O®â≤≠å2ßÇ\¬','Kiribati'),
('vé\'b\nëM†ùk\'u´+\√','Kowe√Øt'),
('}\\X\ızú@Cß!_k:\‘\Ã*','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('ÑN˝£\Œ˙F≈π\Û\ \‚+!\“','Lesotho'),
('\\QÜJlKÉøO\«Uk\⁄','Lettonie'),
('\/lÅnÅJgä%/\–\"%','Liban'),
('\ﬁWo¿î¿MŒè\⁄\◊\›\…\‡\œ ','Lib√©ria'),
('?\Ôl√øN\È¶\œ\«j\Í+','Liechtenstein'),
('\—^3•rK\'∫q≥9eR]\»','Lituanie'),
('Å&ZÉ\ƒH\Ûêc\Ó\Z\Z\” \ÿ','Luxembourg'),
('\ÓŒôpo\∆C9ã`∫G4hÕ•','Macao'),
('T2wØ|hLÖ?˛\ ndz','Madagascar'),
('≤Ox\”HC—¢u°\Û\˜⁄ÜO','Malaisie'),
('˚\Âí:mBõ¨\r\ÿê¶ˇ','Malawi'),
('⁄∑O\Ò©F\Ùø\”y\ﬁ\˜*	','Maldives'),
('B1HMµH≠\ZQ^a\r$/','Mali'),
('\MWEMåG¨´HwóE’ÖÇ','Malte'),
('îü∞6)\ËFz™|∏]\Î:k','Maroc'),
('26TPD¯º?3ï¢N]v','Martinique'),
('0lã? Axì†$_{\»h','Maurice'),
('\"£uj\∆5A.æâ\„õ\Òy\«','Mauritanie'),
('\—lp\ÿ@U@S™s\‡\ƒwk\Œ','Mayotte'),
('\"\ÀZÜoãM∑\Ô\“\ròUñ','Mexique'),
('¥†h2\€EHîªπë|®ñˇ','Monaco'),
('¸\›\Ûó\≈vL\Ôç˚\Ì~`0A','Mongolie'),
('\…bƒ∫DI∞o\Z.\€¿∫','Montserrat'),
('\‰-Q#ñ\ŸJÕÖ]µ\€¡®nì','Mozambique'),
('F/$\È\\A¡®5JÅ~$®','Myanmar'),
('C\œ\⁄,6@∏å\«u¥P\ﬂ','Namibie'),
('ô\\^•sN\Âßa\Úävi;','Nauru'),
('g\\;àè\–G(¢¯É5üU\‹\‡','N√©pal'),
('$Ø$k[D\Ô¥\ÒK\ÿpT»≥','Nicaragua'),
('îz~≠ùEX≠~˛∞\·6Ü\È','Niger'),
('∂ñ\”\À>\ﬂH¯©\ÈK}\Ì$õ{','Nig√©ria'),
('4›õ/GGõ\ÀFl 4t','Niu√©'),
('\0v\ŸVØF(òë$\Ú\»Zå','Norv√®ge'),
('Ω/E%∂\‰F“á¥+¶\‰ë*ø','Nouvelle-Cal√©donie'),
('	\n\‚e\»M\˜∑Xõ]™\ÕBè','Nouvelle-Z√©lande'),
('\ÙÉæ\’\∆fKiÉl\ﬁ<6a(\0','Oman'),
('9\Èt\Ã\ GYë\\†7Ø∂G','Ouganda'),
('\Ì\Èk\A¢î@±\ˆ$˘\\\'','Ouzb√©kistan'),
('\’_∫\ÂIó~\Ó0u∑Ç\€','Pakistan'),
('≥z•ÅIËÜ≥,≥?K','Palaos'),
('ì∞eºG\Ú£ª\Û@6R','Panama'),
('§°à\›O•ø\ ûch','Papouasie-Nouvelle-Guin√©e'),
('\∆\ÓM\ÈjLt°ÇÉE¯\∆','Paraguay'),
(':x	\Ìú˙@\Î™U-ì\‘¬∞ê','Pays-Bas'),
('R¨9Ø\ ¿EÉéf\ÎM#ou','P√©rou'),
('\∆\ı\Ÿ\ﬂ=\H5ë.\ÂB‘ó','Philippines'),
('ßIL\rç\÷È¥û∏-','Pitcairn'),
('l\Ï9\ÌìJA⁄Ç˝@KXf™','Pologne'),
('\€\Í£˚\…\\G¢éi¸$	É\·','Polyn√©sie Fran√ßaise'),
('ø4Eî˝¡AÍ∂æóösa—ï','Porto Rico'),
('\÷g’∑\Ÿ-Kd§75	“™=Ü','Portugal'),
('ìØ0ñ\ÔWLë∏8$!\÷[\˜','Qatar'),
('é#ª4\¬3K4∫úºŒ∏`˛\À','R√©publique Arabe Syrienne'),
('\œXY1Z\◊@^πD˝\Ï>\œ\…','R√©publique Centrafricaine'),
('Ç.\‘\„Fâæ\ÕU¯ôl','R√©publique de Cor√©e'),
('\‹\“\—~W≤L\'úÄ\“\‡¯t\'','R√©publique de Moldova'),
('iu•\Â\Ò @§ßsÉïÃ´q\‹','R√©publique D√©mocratique du Congo'),
('BvW©IBdè\Õ?§\ \Õ\·','R√©publique D√©mocratique Populaire Lao'),
('|˙˚∫JtF˛ã\Ò◊µA\Z<','R√©publique Dominicaine'),
('{â\Ôn6BÄc7	\ŸE©˚','R√©publique du Congo'),
('∫D˚\œ\ı;Iw®\‘\÷\ \‹;™Ü','R√©publique Islamique d\'Iran'),
('çN}¨^ãE£:\·D¿\\"','R√©publique Populaire D√©mocratique de Cor√©e'),
('˛\Z¡O©J\Úõ˚ 4¶gñ\"','R√©publique Tch√®que'),
('<\≈\0Y;dEç¢\‹AÅa•','R√©publique-Unie de Tanzanie'),
('\ÁLç®µAOë\ÁÔ¨ãü(®','R√©union'),
('-•¡°\∆GOmèµØ\ÿ\\Ñ∫\','Roumanie'),
('Ãêg[çìExêí∂9U©iX','Royaume-Uni'),
('”ñ®\È\·B‡æåÉõ¨\—¢','Rwanda'),
('Ñ\n´˙p\ÃFFèê›Øc¿\¬\ƒ','Sahara Occidental'),
('’êf\ﬁQ@«Ç{8¿πJ2É','Saint-Kitts-et-Nevis'),
('7\ÕÊ®åèL	èePè±¨æs','Saint-Marin'),
('Ä–ï∑î^G{òGÜüç?A','Saint-Pierre-et-Miquelon'),
('\‚∂S÷ã,E ö>Ç\„\Zª','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('&åDzR\÷Dr©\ŒOè∫1}=','Saint-Vincent-et-les Grenadines'),
('\\\ﬂ\ﬂ\–.Dré:\Ã¸$y','Sainte-H√©l√®ne'),
('\⁄\‰üvP2ObàØ ≠\Ôu@','Sainte-Lucie'),
('Ç\‚\„jV\ÓOòM˙¶	4\ƒ	','Samoa'),
('ó~åë@©π`\ﬂAØπ7','Samoa Am√©ricaines'),
('ñ’ïπ\∆DÑ\◊hÅ','Sao Tom√©-et-Principe'),
('Ω\Ã\–Z\ÛM⁄î\÷ ì\…Rπ','S√©n√©gal'),
('3w,%]≤Ie™+\◊\Ò4ñt','Serbie-et-Mont√©n√©gro'),
('@to\˜\ÏE•¶L˙i5/','Seychelles'),
('_ñ≥∏bÜD\ròÅ∑RHr´¨','Sierra Leone'),
('Iß\‘LC8O≥íg\‘?Uüµ\\','Singapour'),
('\‘\n\◊ÖπJ\"Ü\∆\Î\◊Œ´¡~','Slovaquie'),
('uﬂ´vT0Cqµ¶Ä™F7','Slov√©nie'),
('π\ÃK%z¶M®ìqm◊°','Somalie'),
('\"âT¢#GWä˙X\\\Ïù0','Soudan'),
('Ωö”∏ï\\FˇïuB}Ñ\‰','Sri Lanka'),
('òTæ\◊A ûçk\”[\∆K','Su√®de'),
('¶DF{Y\Aøí∑\ﬂJ©\À\\','Suisse'),
(']πvr\÷J*Å\Õj/õ>ï2','Suriname'),
('u¥e|\ÁúCØY™åì£Å','Svalbard et√éle Jan Mayen'),
('ÄÉGi˙E\ˆ≥(¡∫6u¡Ü','Swaziland'),
('±p\·∑a{DÖúyú(\Á','Tadjikistan'),
('aN¯æ@\\I™∏î1=N','Ta√Øwan'),
('-è\ﬁ\⁄˚EµòÏ´í2K3','Tchad'),
('aL^ƒ¨ÑHQòÄW\„q]D?','Terres Australes Fran√ßaises'),
(' Æﬁï®A˙á,2H˝,h','Territoire Britannique de l\'Oc√©an Indien'),
('G~v\ﬂ:û@I™\ﬂ«Ä\‰ãŸ∑','Territoire Palestinien Occup√©'),
('ào@\ÿ\∆DdåJÜõe6¥_','Tha√Ølande'),
('1◊ó÷æJ.∫,òa4\ÏL≥','Timor-Leste'),
('›∂™O\Ïép¥Åg\'\‡\Â','Togo'),
('\ƒóî\Õ@P¶¿U\„> 9ë','Tokelau'),
('.¡\ÚB°±\”\œ êét\Û','Tonga'),
('ë\"\ÒïF®à(\ﬁ\Í˘a¿','Trinit√©-et-Tobago'),
('p\»ÕújI≈óÒøäúN\·C','Tunisie'),
('m^\œU•FA8£P\ﬁ6\«@\Î£','Turkm√©nistan'),
('>‘Ω9é™D·ªΩÆãNﬁê','Turquie'),
('«¢ö]\‹OL5∞Wì®Ç˘~\…','Tuvalu'),
('shû\ r>K_±õb¨.ÖÇ','Ukraine'),
('ù\‘\ÀJF|≤±Ø¥\√\œ#í','Uruguay'),
('9\Û0H\"I_îJñ\ !KÖ$','Vanuatu'),
('∑µ\Ù∫J<∂ç∞îÅ%','Venezuela'),
('Z1G™üFHK¢ûs§Gìx\ﬁ','Viet Nam'),
('Ã•çpµFÇ±SApJu','Wallis et Futuna'),
('\Í\\<\˜1∑EìºgG(∫Dù','Y√©men'),
(';\„…ö!\»Fõ&{#\‘Àò','Zambie'),
('ÇlJøJ√±:4C|XéF','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-17 20:19:04',6),
('DoctrineMigrations\\Version20240201152951','2024-11-17 20:19:04',1),
('DoctrineMigrations\\Version20240202084749','2024-11-17 20:19:04',1),
('DoctrineMigrations\\Version20240202150901','2024-11-17 20:19:04',1),
('DoctrineMigrations\\Version20240207105701','2024-11-17 20:19:04',2),
('DoctrineMigrations\\Version20240319212437','2024-11-17 20:19:04',2),
('DoctrineMigrations\\Version20240614133504','2024-11-17 20:19:04',8),
('DoctrineMigrations\\Version20240617165906','2024-11-17 20:19:04',6),
('DoctrineMigrations\\Version20240708061729','2024-11-17 20:19:04',9),
('DoctrineMigrations\\Version20240801202153','2024-11-17 20:19:04',2),
('DoctrineMigrations\\Version20240815153823','2024-11-17 20:19:04',3),
('DoctrineMigrations\\Version20240916065051','2024-11-17 20:19:04',3),
('DoctrineMigrations\\Version20240929091802','2024-11-17 20:19:04',11),
('DoctrineMigrations\\Version20241002164506','2024-11-17 20:19:04',5);
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
('´\Ì/iöÆMí©\Ì˙|òVt','.•l5ãπLnöIΩy\≈\Ò7','\…5?0O§ÖÄ)\\¶ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-17 20:19:05');
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

-- Dump completed on 2024-11-17 20:19:06
