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
('´\ı\ÂB›óH∫\Î[\·PP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',259.99,'2024-07-14',NULL),
(')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','Ch√¢teau Latour','Ch√¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','æm2\‹#Møåfh\—3[º','France',999.99,'2024-07-14',NULL),
(':(\ﬁ\Ó\Ú!J°Äk[\'{¸','Domaine de la Roman√©e-Conti','Domaine de la Roman√©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','æm2\‹#Møåfh\—3[º','France',2999.99,'2024-07-14',NULL),
('N¥I\Ÿ}#IÑ¶çw™¸\Ã`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','æm2\‹#Møåfh\—3[º','Italie',899.99,'2024-07-14',NULL),
('^¿ë{üF\‰á\÷\€v˚\›\Ù_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','æm2\‹#Møåfh\—3[º','France',1599.99,'2024-07-14',NULL),
('c^Äú™Ø@ﬂÑÉÉœæ,U','Guigal C√¥te-R√¥tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'æm2\‹#Møåfh\—3[º','France',358.99,'2024-07-14',NULL),
('i\nÑsÇØNWíÕëÜ±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','æm2\‹#Møåfh\—3[º','Australie',1799.99,'2024-07-14',NULL),
('{\’]\Û\Â<AÉ§é^Ÿº\’\r','Ch√¢teau Margaux','Ch√¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','æm2\‹#Møåfh\—3[º','France',1099.99,'2024-07-14',NULL),
('ó-L\⁄FAå4S\ı¢\·\È˙','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\À#zO0±àj≠q¥s_','United States',199.99,'2024-07-14',NULL),
('µLØ\ÈCnG§îVajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','æm2\‹#Møåfh\—3[º','New Zealand',49.99,'2024-07-14',NULL),
('\Á\ÚG¶fF@ä\»%\Ó>\Îm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','æm2\‹#Møåfh\—3[º','Italy',899.99,'2024-07-14',NULL),
('\Í¬°\ŸI^Ä‹ì∞∂W\Ì','Vega Sicilia √önico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','æm2\‹#Møåfh\—3[º','Espagne',1499.99,'2024-07-14',NULL),
('\w™√§O\Zå`v∫\Á∑','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',1299.99,'2024-07-14',NULL);
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
('s≥>¶\ÎB_ñ\‘\ı@s˙','Afghanistan'),
('\r\ÀH\Û ;Np®\ı\÷Ji\Ã3\∆','Afrique du Sud'),
('Cü\‚≠\¬I∏í%ä≠\r)','Albanie'),
('ˇcºΩ≤\"LßçΩzˇ<0','Alg√©rie'),
('sù∏	MáÇìJ°z’âØ','Allemagne'),
('÷≤π∂\"iDÅ•õízO\ÿ\Ÿ','Andorre'),
('\Ôu≥Ñ\À˛I\‰§ã!$2ú\◊','Angola'),
('	$çGçáøµ\0ê\Ê\È(','Anguilla'),
(' %\›˘C“¢∏+â\Û\’`','Antarctique'),
('8E∫¨äIAb∂\"\€P£c\Ù7','Antigua-et-Barbuda'),
('K\€v\…\ŒDQêÉ\…\–yN/','Antilles N√©erlandaises'),
('Ç±MSÑã^ÑV1P\ı','Arabie Saoudite'),
('\È\ÌÜ√†\∆B$ór2\Êmãm','Argentine'),
('\„¡\\}ZJßÖ9]ke\0T\ÿ','Arm√©nie'),
('π&ñz\ÌOÆäqyß2˘tx','Aruba'),
('\‚j§\’GCGôæ\Ô\Ê1sà','Australie'),
('ê€ì\√2nA…ñ£Ÿº®E\‰â','Autriche'),
('±xVLÑFh©Uáóñ=5','Azerba√Ødjan'),
('äb\√\ÂgM¢òjZ?\\\n','Bahamas'),
('p]ùm>qDﬂä˛U\√ˇìéé','Bahre√Øn'),
('f≤˝3øyE\·º\ZZG\Z˘Å','Bangladesh'),
('vå¥åEö∏/≥≥y?\‚','Barbade'),
('\ﬁˇ¯òïF≥_öß™Ç','B√©larus'),
('\ <N@éÉU ÜÃÉÄ^','Belgique'),
('\ÌjñÜ\ÕGïÉî\Ï˚gß≠%','Belize'),
('ñ\¡mdM(©¶¡\¬¡W2\„','B√©nin'),
('∂FÕ∫\Î≤Bñ¨U?/‘∫:\Ê','Bermudes'),
('&\…PC\·|E\rê±Z9˙\ÿ','Bhoutan'),
('lr)\·H$A¢ï1é†y¶','Bolivie'),
('¨\ÛJu\nO\‚´Y+ sA\¬','Bosnie-Herz√©govine'),
('0\\Y™∏\·JÅ5à\…\Zæ∞','Botswana'),
('|Ö\‡ùJVæ\œ\’w<(','Br√©sil'),
('\¬k\◊E˝í.’∑Äó','Brun√©i Darussalam'),
('\ÏWü\Œ\ÈqEWâø»ÄI˛\n','Bulgarie'),
('J@\≈\ﬂMpÜ¥ ëa£µ','Burkina Faso'),
('yG\Œ\ÙL\"N©ª=°πà 7E','Burundi'),
('\ı\ÿdl¢5Eaæ\rˇ*\Â\≈a','Cambodge'),
('Gv\Ãq\ÁG\ˆß\Û\ıS†%∞ì','Cameroun'),
('t\‚}\ƒNçR p¶\Û','Canada'),
('º\¬L?Ñ\ÌH–ä¨µ\ÓG©•','Cap-vert'),
('v©\‘¡W\¬O]´¶¨õ®A∂8','Chili'),
('D\n\ƒ,\Ã\»Bæ§ç3,\˜\Ë¸6','Chine'),
('BpÑ\+H$π\¬\·t\'\È\‚','Chypre'),
('˘ë\Ó≤pGkº\Î3\‰#å¡','Colombie'),
('T9£~ågEùπAO\ı^ê+\„','Comores'),
('æh\0!;IE\Úç\Ó¢\Îe8â','Costa Rica'),
('r≠\Ó\Ë…∞CcÖáÆß∂™|','C√¥te d\'Ivoire'),
('?–ä\‰KU§@Gì\n\"	','Croatie'),
('°ø[ãmT@Á§º˛LRp','Cuba'),
('\ \È.UïwB÷ù˘&g{w\€','Danemark'),
('\Z\·[fMJ‹¶§V\ıE\0Gk','Djibouti'),
('	,\Ë?L©Nˇòr›úU\Ìoh','Dominique'),
('ï\ \≈FY®\ÃQh9Ø\Ô','√âgypte'),
('\Ã{≈ä ãD∂πY\Ó§=X†å','El Salvador'),
('t#–âHd†\Ú [\\[_\Ã','√âmirats Arabes Unis'),
('\∆k\ÿ]£GΩ˝”¢ì#xu','√âquateur'),
('\‰\œd2P\œNÖ≤ Çñ\µ[Å','√ârythr√©e'),
('Æ\Ú`º\’\ÃC ¶\”\ÈËΩ£>µ','Espagne'),
('&ª\ng1Oõ≠ßΩV\’6\ˆ\«','Estonie'),
('bô\\‚\ÀL˛øæ˘\Í\⁄+\‡N','√âtats F√©d√©r√©s de Micron√©sie'),
('¸¢i\«`≠Ir±dL£ \0mê','√âtats-Unis'),
('W\∆\ÊÇIJ≠©I\ﬂ\·›¥','√âthiopie'),
('3\»VØJ\'ã:“óOAQ\Á','F√©d√©ration de Russie'),
('ÉA]]\ÎüB^åÑÖ1\Êk¢','Fidji'),
('hÜ\√\Ê¨,F\ÎΩ\'\€/\‡','Finlande'),
('å˚-6\ÔãGl∏Kå\ }ó','France'),
('T;\'U7\ K5±\"â\ZØ\◊12','Gabon'),
('HR`\„◊∑@}¥7bô™\ŸR§','Gambie'),
('4Lìl\÷\ÒM˝øúßTù,5','G√©orgie'),
('lh<(J€éX&B•\∆¿\ÿ','G√©orgie du Sud et les √éles Sandwich du Sud'),
('orI(\ŸH?πgåò,Ñ','Ghana'),
('2j≠t∑G√Ñu\Ëë8€áΩ','Gibraltar'),
('\n\ıLøo}Iå≠bnÖ%X≠8','Gr√®ce'),
('eñxΩjC∫á\·∞\Û≠?\n','Grenade'),
(' ≤X?≥Gú!\ÙCJ6uq','Groenland'),
('›∏\»K≤@#´FF[õ@\–t','Guadeloupe'),
('R\07ΩéJ≠∑KC\‡c|\Ú','Guam'),
('ﬁìÆ›ëØJ*éwúZh≥','Guatemala'),
('jL≠\Êy\0J€ä\‡9~=\Î±l','Guin√©e'),
('ã}\Z;OAF\'øs|\€9=5z','Guin√©e √âquatoriale'),
('r&RF˚\ˆOñ\Œ:64ü∑6','Guin√©e-Bissau'),
(' «∞ù\¬M∫|\ÏYaå','Guyana'),
('5∂xGB\√A∑Ö7Bì$\Î\Ì','Guyane Fran√ßaise'),
('\ÿ9Tû%Dd¨k¿#∏ã\Í≥','Ha√Øti'),
(']Å™vI∞≤2\‚6\√n\ÎQ','Honduras'),
('+\\\Ì˝JAâÜ\“ﬂ£w\’?','Hong-Kong'),
('1H\€K\näG2í¡%SWj¥(','Hongrie'),
('\‡™\ﬂ„é®Oæ\Îuπ\Œ\Ï®','√éle Bouvet'),
('~eîª\ÈE*ñ©\œt`\·ù\Z','√éle Christmas'),
('\\Õ\◊\ÌG\ËH\Ïô?/ï¸2Uπ','√éle de Man'),
('´\œa\"\‡E∂p\‘\‘f\Ùç','√éle Norfolk'),
('$OπˇCBâπB˛\'\◊\ÿ','√éles (malvinas) Falkland'),
('¯x\‹\ÒVñH-öí\…]˘~n\√','√éles √Öland'),
('îqö\'áNπä5\◊(}','√éles Ca√Ømanes'),
('\\ﬁ\÷\› I∑mºÜô\Ù\Ÿ','√éles Cocos (Keeling)'),
('≤\Á\Ìè\‚QH∂π6-\—\"\œ','√éles Cook'),
('ø\ÚL\«lsK á\·&^\Ï π/','√éles F√©ro√©'),
(',´âoWëNºn%™\‘4†c','√éles Heard et Mcdonald'),
('4d9xGç¥\‚v=D\"u','√éles Mariannes du Nord'),
('©É•G\Ïü\ÍsvE‹í\'','√éles Marshall'),
('0ßx\·HK◊´\r∂ÜM?\Ê','√éles Mineures √âloign√©es des √âtats-Unis'),
(' •ZLM˛©zppTel','√éles Salomon'),
('˛\»0¢õFBï?4Üì\Á\Î','√éles Turks et Ca√Øques'),
('?\Ú\◊˛êWO“îO-°x[T','√éles Vierges Britanniques'),
('©\»i-ö¢NÎä∞Q9¡\ˆ\”S','√éles Vierges des √âtats-Unis'),
('U[le+\∆FoÉ]~\”\ A','Inde'),
('\»e\¬¿MgìÀ∫øn}RM','Indon√©sie'),
('\Í:™3˛Bﬂ™1rå<\–\Ë≥','Iraq'),
('\r^\‡¯ïäGﬂΩ\÷qXqΩ\Ÿ3','Irlande'),
('¡≥\›iWGÉ•ø¯\ÌNí','Islande'),
('®C“ÅK@\ıè\Ïn\‰oXˇ8','Isra√´l'),
('\›3çú\ÊJü§•x\Ê\Ò∞¢\…','Italie'),
('\'hg,≈®L&≤w¨ä§pD#','Jamahiriya Arabe Libyenne'),
('\–\ı&qà@\Ì•(\È47†ö+','Jama√Øque'),
('I\ÚÍ¢∏,Nö\—¶7{ú','Japon'),
(']\∆\…o N8´\ıfD\Ú †d','Jordanie'),
('Ü¥à$ZoB_à\’|mu*','Kazakhstan'),
('lÉgªæäI9≥$∏\ôp≠Z','Kenya'),
('\Ë$ÄEF#º˝Zv≤#≥','Kirghizistan'),
('\–,®o\ı∑Iç±M\Ni™@','Kiribati'),
('ä	\—mß∏F±Ä\‡ˇ(Äf\·','Kowe√Øt'),
('mênb6\'LÇçÅF\‚îRx\’','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('≤®\⁄/\›FDÖ;§@\Ûa','Lesotho'),
('r\ÚÅßúAÇäI®ª=','Lettonie'),
('ìg#ØÆµMåî\Â“í∞','Liban'),
('\‡©¡¶¯\«EÄπGzIÀ¶o6','Lib√©ria'),
('\…k≠o\ŸBá≥\\‘˚(|õ','Liechtenstein'),
('vRI>æx@\Ó†uqI≤Ï∂ì','Lituanie'),
('Äë\∆’∞AÕ†›Ω\Õ\ı','Luxembourg'),
('≠V≥M=\rLlÇô™sˇíã','Macao'),
('\Ï3J•ëGÄéW\˜\Ì`\Âúr','Madagascar'),
('\ Q\‡\“–∞B∆®[àÇ\Z≤¸','Malaisie'),
('•pÑ\≈\À\ÂNJ™Z\ nd\Ómç','Malawi'),
('HˇøïIâ[\–i\√\≈E\Ï','Maldives'),
('\Ï^≥ä∏C±õIJz‘Ñ\'','Mali'),
('5\Âo∏µ4LÕ™\\k“º3ˇ','Malte'),
('\Â9{ç\ÏÅH’Ä9\ÀW_ê\Ác','Maroc'),
('9\0Q√§DÇöo˙vk\‹	L','Martinique'),
('\„\nsNaD£\ı¨J`Ø£','Maurice'),
('˘añJrΩ]Uéª2\ÁN','Mauritanie'),
('v:\Ë\‹˛\‹Lî\Õg\‘?E_','Mayotte'),
('\Ì0?XB\ÎDŒö+ÉxÄ£°É','Mexique'),
('N\·≤sNèø˚†,∞^\∆','Monaco'),
('søXå;¨L\\îﬁØ\Í\Ìªat','Mongolie'),
('®\◊\Ëä&D∂§(:≠¸¶ö','Montserrat'),
('î¸\Zè|I*ï¿AÇœ≥á\0','Mozambique'),
('\Îcb•®AÜ©ÑôwëS','Myanmar'),
('\€L3<\ZCÃ£xwò4ûN','Namibie'),
('CΩû\‰\\âLSº5\ˆ¥¨â','Nauru'),
('\«U<öe\\F∞x+≥!H','N√©pal'),
('≤˛¿P\Ú@ÉT\'¶\Áí','Nicaragua'),
('ñZ\⁄Q%+J\ÒÜ\œ\Ë=iZ','Niger'),
('∞óôF1|HÅ0ìs$\‹F','Nig√©ria'),
('˘\ˆüfØAΩ¥@ì;≠˚ß','Niu√©'),
('?Ä/\ŒyH⁄∫\ ¿F7\ƒ\…','Norv√®ge'),
('˚∞x?rN\‚≠\Ã$@?Zp','Nouvelle-Cal√©donie'),
('ªˇp%L◊í∑aΩ_\r\"\’','Nouvelle-Z√©lande'),
('@ˇZ¿k\œBÂ°âY,zÇ','Oman'),
('™Oπ#ÜGò≥D@\Ïæ\›\‘\≈','Ouganda'),
('üù5úJEY™\ÁØ\∆`ˇc\„','Ouzb√©kistan'),
('2\0Ω∆éO\Ïù‡µ¥JY˚x','Pakistan'),
('ìFèâûA\ÒáMr1Éc','Palaos'),
('ª,¬ªdHI•z\Í%_≠Üa','Panama'),
('rFú\ÚpN)æ|ÑVúwp\Î','Papouasie-Nouvelle-Guin√©e'),
('\ÿoº˘X˘K(øu0nßØ˝0','Paraguay'),
('\Ûd}Mëè`ØjH','Pays-Bas'),
('õo]î¡\≈Oπ†Ñ9\˜¡2¶T','P√©rou'),
('I\≈\‚≤\"\ıF†å-\–oñ\—B','Philippines'),
('ó\Âè§M≤õ3d\œ Øµ','Pitcairn'),
('\ﬁˇ\„íLJBÇ\‡\Í°%\Û\·\„','Pologne'),
('D\∆\ÿKLßØÖ˙\Ï≈å+Q','Polyn√©sie Fran√ßaise'),
('Ü£[&£DÀÑ\À\‰6û\ﬂt','Porto Rico'),
('ó#ëä¥E¨¿\˜\ı“ßÑ9','Portugal'),
('CˇI>mE\ZöC>P\„k\n\\','Qatar'),
('y\ÍU,>\ƒJﬁ∏ïˇú\n4\Ò','R√©publique Arabe Syrienne'),
('ewÖ˙PåH\'µ\≈&∂á!\–*','R√©publique Centrafricaine'),
('!ùåF\0Et∏\ÔqF¿2\ﬂ','R√©publique de Cor√©e'),
('\ÿq1ºMUÅk:ué˛˘æ','R√©publique de Moldova'),
('œÆuç\ÛO\‚∫˚\nG\‚@','R√©publique D√©mocratique du Congo'),
('8*Æ\«\ÂA~ØSjˇ\Îbe\÷','R√©publique D√©mocratique Populaire Lao'),
('Åñ\–s5@ì•O≠\Û°û','R√©publique Dominicaine'),
('\Á0\€A\Í≠N≠E!N\\ce\›','R√©publique du Congo'),
('[t\"\0W\√BH¶§|ß$ye','R√©publique Islamique d\'Iran'),
('w\ﬁ`<\«FH∫®\‹\0µ\‰\≈v\Á','R√©publique Populaire D√©mocratique de Cor√©e'),
('lß$≥vB®[îö\0R','R√©publique Tch√®que'),
('˘\‚\È\·°G3£38\rVj\Ó(','R√©publique-Unie de Tanzanie'),
('(¡}\'e\‹@∫ùOMx$8\Â','R√©union'),
('0∑LeDÊüè\‡\\Wºû','Roumanie'),
('9É¥¿ìDΩ4KWª\‚@T','Royaume-Uni'),
('®K\À\ˆˇKô\Ã\Ò\ˆsØû','Rwanda'),
('\ﬁ”ÇÖI\ZB“ê¢\Óã\Ò™Y1','Sahara Occidental'),
('ö˛´ë1I|æ\ LtaÉ©X','Saint-Kitts-et-Nevis'),
('\Ú¯;éè\Á@O∫:^†ã$V\Ê','Saint-Marin'),
('Ç9Öt(Haí(õ\‹\rl™˝','Saint-Pierre-et-Miquelon'),
('qˇ3/2MAåØπ¢<H∏Üâ','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('\›j\Â\ﬁ\ËOF\'Ül2¶‹íV','Saint-Vincent-et-les Grenadines'),
('ÑDu\‘îKå¢àô\Áù06\n','Sainte-H√©l√®ne'),
('ú\‘^e∑$MºØ\⁄z_)*0','Sainte-Lucie'),
('\ÚlΩ	≥wE_ë~π\ÊAnX','Samoa'),
('aîA3•G\‰â$ƒ•ÄçÇ','Samoa Am√©ricaines'),
('|Ö\"\÷aFKù§≥ô	a\€','Sao Tom√©-et-Principe'),
('!ó[•ôFﬁòêu\Œ~C','S√©n√©gal'),
('D$PUx\ËC†z\Ÿ\¬Hí\œh','Serbie-et-Mont√©n√©gro'),
('\Ëª\Êˇ≈Å@Ω¥+\Ê1˚ß\·','Seychelles'),
('0\ılü\‰kA\„™¿õ\'2Ö\Ï','Sierra Leone'),
('\À1?\‚\◊\ËOî\Ãc/Q\Ùé','Singapour'),
('ñ∫ú´˝MÉ†àY\Ì\Ó5y','Slovaquie'),
('Çü\≈˚jDL“ìûêg\ÂT\È\Á','Slov√©nie'),
('\ﬁ¬çé›¢M\Óä›Å9[∑yU','Somalie'),
('^\ÏJQ~K¢§í%¯6\Òr´','Soudan'),
('#Å\–Jv∑FË∏¨%g5Ø\ı\À','Sri Lanka'),
('∏Æh¿\'DG∑c\r\Ù>\r|','Su√®de'),
('\‡x¢t∫\›A¢Ö◊ü˛\Èm<3','Suisse'),
('\∆Àªú\'K@bïï¯`)<#','Suriname'),
('r\⁄\Û\ˆ¡[AzæÑ\‹\‘K6jQ','Svalbard et√éle Jan Mayen'),
('}\ÃrK\¬@P•qD\∆\‚•\n','Swaziland'),
('ó\‘JO\ÂD;ÉO!	©√ª','Tadjikistan'),
('C\Â.ür˛Hcë±\ﬂ{˝›å','Ta√Øwan'),
('\–\’\„õ,hIêÉ@\ƒ\„à$>','Tchad'),
('i∏;á[I%á&äWa\'C','Terres Australes Fran√ßaises'),
('\\ñ\ı\nO\·ºz•™åµ','Territoire Britannique de l\'Oc√©an Indien'),
('&å\ˆ\ÌLL¥á$π6\‚Z','Territoire Palestinien Occup√©'),
('\»\€&˘_NáÉ\÷¡≈Ä\'≥','Tha√Ølande'),
(' \\>8\ÛGÇ∏àò˘í+','Timor-Leste'),
('\–˝\‚\Î˙E\‚ªN\Úê∏˘r','Togo'),
('Pë˝[NØ∂=ú;û!OA','Tokelau'),
('ê˛\Á~\"<E≤Ö|–çINÜ]','Tonga'),
('ASgn™N§oæøƒîT','Trinit√©-et-Tobago'),
('õ\Ë;∞\Â¡FÄã\”YÆsr\≈','Tunisie'),
('˚¨\÷˙vM&é*\ms≥Lª','Turkm√©nistan'),
('ª#?üé}Cbé\Ñ¢u©m\‚','Turquie'),
('\Ô.uSIqFÊ®ôM$îΩõ\‘','Tuvalu'),
('I÷ÆLÉKç&ø ô¨F\◊','Ukraine'),
('ÄÇ\Ï\Ó\‚äFòïü≥Éc!ä¢','Uruguay'),
('C6@Ö\‚åGííDMØC«•∑','Vanuatu'),
('\ˆÉÉ(\Ë\’KóéF¢πpê\Ã','Venezuela'),
('{õt\Ùy\ÚH´Ä£Q2Oæq{','Viet Nam'),
('\0\ÀÛ∂∞âNÿëh*oc\Ù!','Wallis et Futuna'),
('\¬7ùGì§ò?W^\≈¡','Y√©men'),
('\ì\\\ NBá¥tm\rª\','Zambie'),
('Œ∫\Î\ﬂ\Í\rHLÖ∫´\Ò\‚!','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-07-14 19:38:52',4),
('DoctrineMigrations\\Version20240201152951','2024-07-14 19:38:52',1),
('DoctrineMigrations\\Version20240202084749','2024-07-14 19:38:52',3),
('DoctrineMigrations\\Version20240202150901','2024-07-14 19:38:52',2),
('DoctrineMigrations\\Version20240207105701','2024-07-14 19:38:52',4),
('DoctrineMigrations\\Version20240319212437','2024-07-14 19:38:52',2),
('DoctrineMigrations\\Version20240614133504','2024-07-14 19:38:52',11),
('DoctrineMigrations\\Version20240617165906','2024-07-14 19:38:52',9),
('DoctrineMigrations\\Version20240708061729','2024-07-14 19:38:52',11);
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

-- Dump completed on 2024-07-14 19:38:53
