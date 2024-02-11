-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv_test
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-1:10.11.6+maria~ubu2204

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
  `owner_id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `country` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottle`
--

LOCK TABLES `bottle` WRITE;
/*!40000 ALTER TABLE `bottle` DISABLE KEYS */;
INSERT INTO `bottle` VALUES
('´\ı\ÂB›óH∫\Î[\·PP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','\Óo;‘àCæ±˝Ω\À\nl','√âtats-Unis',259.99),
(')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','Ch√¢teau Latour','Ch√¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','\Óo;‘àCæ±˝Ω\À\nl','France',999.99),
(':(\ﬁ\Ó\Ú!J°Äk[\'{¸','Domaine de la Roman√©e-Conti','Domaine de la Roman√©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','\Óo;‘àCæ±˝Ω\À\nl','France',2999.99),
('N¥I\Ÿ}#IÑ¶çw™¸\Ã`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','\Óo;‘àCæ±˝Ω\À\nl','Italie',899.99),
('^¿ë{üF\‰á\÷\€v˚\›\Ù_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','\Óo;‘àCæ±˝Ω\À\nl','France',1599.99),
('c^Äú™Ø@ﬂÑÉÉœæ,U','Guigal C√¥te-R√¥tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'\Óo;‘àCæ±˝Ω\À\nl','France',358.99),
('i\nÑsÇØNWíÕëÜ±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','\Óo;‘àCæ±˝Ω\À\nl','Australie',1799.99),
('{\’]\Û\Â<AÉ§é^Ÿº\’\r','Ch√¢teau Margaux','Ch√¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','\Óo;‘àCæ±˝Ω\À\nl','France',1099.99),
('ó-L\⁄FAå4S\ı¢\·\È˙','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','\ËòNE\ÕD‘çB\ı\ƒ\ÊΩaí','United States',199.99),
('µLØ\ÈCnG§îVajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','\Óo;‘àCæ±˝Ω\À\nl','New Zealand',49.99),
('\Á\ÚG¶fF@ä\»%\Ó>\Îm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','\Óo;‘àCæ±˝Ω\À\nl','Italy',899.99),
('\Í¬°\ŸI^Ä‹ì∞∂W\Ì','Vega Sicilia √önico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','\Óo;‘àCæ±˝Ω\À\nl','Espagne',1499.99),
('\w™√§O\Zå`v∫\Á∑','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','\Óo;‘àCæ±˝Ω\À\nl','√âtats-Unis',1299.99);
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
('FOé£B5Ñx¶môw\Ì','Afghanistan'),
('˙Ω\Ê_˚úA€´{Äò˝ê\Úù','Afrique du Sud'),
('\ﬂg©\Z*GØÅo\€+ˇR\“\ƒ','Albanie'),
('L*ïbw˚Bpä2…´ÀÆ£a','Alg√©rie'),
('\Ï\Áã\ÍëAg§<\n^U,ª™','Allemagne'),
('o:∫?JF^©o´q\"\›NÇ','Andorre'),
('\ˆÉ¢˚èKùô\œ\ˆ’Æí','Angola'),
('\Ô\Ó\Z(dPB\r•\È\Îb9RGº','Anguilla'),
('˚[úG#ÜLê•å±ó\«\œ\ ','Antarctique'),
('p4\ı}Aˇék\"œàO%¿','Antigua-et-Barbuda'),
('\˜&¢©^X@áäX\ıc˚Pl','Antilles N√©erlandaises'),
('c\È§\·πDΩï˛OB\r','Arabie Saoudite'),
('∂˚\"¥\◊\ÍOm∏8\Û\Õ\‹4_\Z','Argentine'),
('ñ\n¥ñt\ÔL’óa\ÍB\–¡YB','Arm√©nie'),
('©˘í∞BéÆ`§=$\„','Aruba'),
('\‚.GJW$M\Í°ﬁóV¶%\Í','Australie'),
('ÊºÅ\ﬂ\∆\ÿHÆacst/','Autriche'),
('O4\ˆ˛°≥A™µsy\˜¢\Ÿ','Azerba√Ødjan'),
('\Ÿo#ÜLµFYâ˝ËÖû~[','Bahamas'),
(']\Åì≤oJÜE\∆N¸b-\–','Bahre√Øn'),
('\»˛ÅHKÉØ\0˙cÅ\‡M¢','Bangladesh'),
('=\n£3#EÖµxN\Ë\ŸQJd','Barbade'),
('MmùfÜ\\FìA\„\Î\∆\›','B√©larus'),
('9]ï\Â]öN\ı™J\ÃsàZFà','Belgique'),
('iÜ\ı±◊ºJ5º;¿\ˆ$Eô™','Belize'),
('jò\'ˇ\ÓAä\˜”∫Ω‡•´','B√©nin'),
('\n?¯\ÏVòGñû¡óë\‰\‡:','Bermudes'),
('\Ú\Â6øD*ô1I\"Tô†\Ô','Bhoutan'),
('§¢ë4àA\Í®oõª≠ª1´','Bolivie'),
('∑Hh¢ßYOqºê\√_\Î\”\÷','Bosnie-Herz√©govine'),
('˙\›»à5\—C]ãöµ:\÷B∂','Botswana'),
('\Ã\Zè,Gé§b\ƒxL\»\È','Br√©sil'),
('%\ÛˇéA-B…É…≥Æ\Á-x','Brun√©i Darussalam'),
('¯xQ7\„\‚E\Ùõ\√\n™\ÏI^c','Bulgarie'),
('ô∑¶ú§JàæÑ•m\È\√Y','Burkina Faso'),
('öx\0\Ò$\\BìmD§¢','Burundi'),
('K\n\È\nUgO›≥˛0∞\‡\¬\÷','Cambodge'),
('sX\∆˝cpC—óT{nK@\Î∂','Cameroun'),
('S\⁄.\ﬁMÅ±K3¯\À\08ì','Canada'),
('\ˆñùtß)ML≠\r\˜/Õ£)','Cap-vert'),
('®-Lf4∏IFä:z\ÁJã=Ñ','Chili'),
('ì\Ï4_F‰ûØ¨≠ì\ﬁ\≠','Chine'),
('üúü\‡\ÊK|ßõÖníñü','Chypre'),
('\Œ\ÕFØ…¥Díß9≥ú\«+ó','Colombie'),
('NÖ)¯ºLí†zˇ\Œ$\„ô','Comores'),
('\˜˙\ˆ≥DõÇ•\‹\∆\„‘ï','Costa Rica'),
('§\»\È\Â\Ê$N\0Å¿\–\‡JeM','C√¥te d\'Ivoire'),
('\‹7HFG\‹Oúvkf–∫‘©','Croatie'),
('_ëhqKáÑ/•øNxMB','Cuba'),
('á\Î\ﬁˇ¢eL¨qM\◊=¥è','Danemark'),
('m]ön)Jﬁ¥Cöá\œÆ\ﬁ','Djibouti'),
('µKµ˛nMHá\"0\ﬁˇ\'ª','Dominique'),
('td£*\…@Ä\0{Eà\ˆÄ','√âgypte'),
('\Ó\…¡®ªgK\ˆ¶Ep\‰Œ§Ø','El Salvador'),
('ßØπÉNqÄπX\Ôôo(-','√âmirats Arabes Unis'),
('mü\⁄qè\œK¬á∑	søâ9','√âquateur'),
('\¬s\‹)\0\ÊO¥Ωk+ßàø;ã','√ârythr√©e'),
('_cM\Ò¿F¸å7âñ\◊R\‹','Espagne'),
('t?BÀï,K\Ûü{-k20','Estonie'),
('pª∆µ\'¯Lÿ∞Öò\·I≤†','√âtats F√©d√©r√©s de Micron√©sie'),
('™LaèprK˚≠\ƒm$>cù_','√âtats-Unis'),
('\\[\Ó\ˆE≥ö\–\‡?ükb','√âthiopie'),
('c¿ñ*x\˜I;æ\ mü\ƒ\·','F√©d√©ration de Russie'),
('V˝\‰xn5M±ãck∞π','Fidji'),
('•\À\ÔG˛uJl∑áóëKXô','Finlande'),
('\⁄q\‹Nî≥ÅKfk\«U','France'),
('\ÿw¡.ZB∆†\ı˛raY\Ã','Gabon'),
('\Ù\Í∫GJÇ£\ƒIuâÆúe','Gambie'),
('\Ù\‚†öYMAØ\'b\'OQ','G√©orgie'),
('\·qé©B≈°\‚oe%©â\ƒ','G√©orgie du Sud et les √éles Sandwich du Sud'),
('¸\÷\‰•GÅãH\ZÅn∫\ƒy','Ghana'),
('v\na\ÃK”ñ\Êp*\Óˇ','Gibraltar'),
('ä *\rJÇÇ\¬ÿ™í\Óâ','Gr√®ce'),
('∫\'JëkL\Â¢neíg} \Ÿ','Grenade'),
('√æ»∏πGV£,Ø¡\”e','Groenland'),
('ò˚~\06¯Oôù2C%\ÿ:_','Guadeloupe'),
('\\çº¥\»E•F‘çkÔ±¨','Guam'),
('aùiL\Ã>B>´c?æ9hö','Guatemala'),
('oòR\ÂòFÅÆ˙>ö˘≠úô','Guin√©e'),
(':AJ†¡F∂\·r¨5\“N','Guin√©e √âquatoriale'),
('â\ﬁN<πK≤ø\'Ÿ∫x∆Ö','Guin√©e-Bissau'),
('K.\Í¢G\0E:ô\≈V[\ƒ{Dº','Guyana'),
('73™`K@=Éª∞3g\Œ\ ','Guyane Fran√ßaise'),
('åínA\◊yK¯≠\ﬁ\Ú‘ÜÆéô','Ha√Øti'),
('G≤∫ºH,G’à\Ûy\ﬁdxá','Honduras'),
('I\Â}çp@≠≤\Ÿ6±t\Ùó','Hong-Kong'),
('W¢(\ﬂ I¸∑\n\…r<®','Hongrie'),
('öo\·^úECΩøåò\Né','√éle Bouvet'),
('\r&≠\0àB&™]Ç\Ó	œö;','√éle Christmas'),
('8{#3\˜sD(ô/u\\óf\Ê\Ÿ','√éle de Man'),
('˘\È©+wOæ5gè\‰0ªò','√éle Norfolk'),
('v3\È\\“Eüép˙§`P\Â','√éles (malvinas) Falkland'),
('\… SUø@SÖv\n*}¥\ﬂa','√éles √Öland'),
('\…y˝4â@˝∏\˜ˇ√ï \À','√éles Ca√Ømanes'),
('Ω\€*∂©\ËIáPY\œ_W†\Ã','√éles Cocos (Keeling)'),
('ñl#\·3™DrñWÉÇê2','√éles Cook'),
('˘\'V\⁄\ÀMT™\È é\‹\Èß','√éles F√©ro√©'),
('\Á`˛»∞ I“ø¥\‚)\Œ','√éles Heard et Mcdonald'),
('\ }[¬®\Á@∫ÅQk<^§a','√éles Mariannes du Nord'),
('&áÜ&ÇJ¨≥s\‚ÆVawë','√éles Marshall'),
('3;\ƒpRÉC\Ú°Or\›P\¬','√éles Mineures √âloign√©es des √âtats-Unis'),
('Eé+_4Müñ\˜\ƒ\ÃY˘b©','√éles Salomon'),
('πö\ı\‚v>I=ôY)\ﬂ_I3\È','√éles Turks et Ca√Øques'),
('S\Èö^A*£\√ª\Z√§','√éles Vierges Britanniques'),
('\Û	J\€IHj≠\≈–æl	ñ','√éles Vierges des √âtats-Unis'),
('~˝Q9fB\ëp\ˆ+ëáK©','Inde'),
('\»H<ˇj©M[®á≥Ç •\\"','Indon√©sie'),
('öz\⁄\¬\"\ÏJ\"É\€h\ÌóS','Iraq'),
('+9_ˇ≠B‘Ö¯µˇä˚êj','Irlande'),
('∑\"p4°tKàî!\Ûµ\Á\‘\Z;','Islande'),
('o\"é\"sãO∞\Ò\“aH˛d\‰','Isra√´l'),
('\ﬁ\ﬂS\’\÷$O\Ú∑ñ˝}±{ñ0','Italie'),
('∑J÷Ü¡@rå[tbqØ≠§','Jamahiriya Arabe Libyenne'),
('É^Å’πM˚è∂\Ÿd>Ö®','Jama√Øque'),
('\rﬁû\ÀVóG©=\’\Ò\Õ5*','Japon'),
('`ãiLTæ&\Ê4\ﬁ&','Jordanie'),
('é$RMs\ÕO£•H•ˇ¢','Kazakhstan'),
('âd\?\„\ﬁ@æ\«c\Œy\“','Kenya'),
('ú9\È\‡é$Jç•:\≈J\”+\ƒ','Kirghizistan'),
('ƒï,Ñ¶HóπTDÑ¡é}\ﬂ','Kiribati'),
('{O\ˆBÑBHQÄ;Ö7ë≤\Ú[','Kowe√Øt'),
('ß`\Ào±OΩé\ƒv\Ú\'\ÿ¿ë','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('jxJ\ÁSL¢£m\"©.≠•','Lesotho'),
('\„K\’\÷\ÒI[è≥t\‰h\‚RE','Lettonie'),
('B8B(µúC{òø\ˆÅ\”6+˛','Liban'),
('†8+⁄µxCü™JºΩsë¥','Lib√©ria'),
('GQºp/F8∞á5U96Z','Liechtenstein'),
('Q*ZNñøå_ê\Ã,X|','Lituanie'),
('à©ªã8\ﬁM\ÉJ\ÚS\Ê´Tè','Luxembourg'),
('t\Âî\ÒF4óLo\ÏzEÿ¶','Macao'),
('\Îä\ 2\—NIæ	\–mâﬁ∫\…','Madagascar'),
('Æå\Ì\…\"|L?çãâº)?\Ïl','Malaisie'),
('$ói\«\Õ\·E>Øhc\“ñ\\_','Malawi'),
(']~\nd\√Eûæ\Ïlû\n*','Maldives'),
('9Q\0\“kg@µì¯¢¥\‚£\'','Mali'),
('\√0\'X›ªMH∞t‹èˇµê','Malte'),
('_É)\˜RTC˘à	V‡∫Ω','Maroc'),
('ôªi˘ìNë¨c\–p˙Q(\¬','Martinique'),
('xS†\ÍS¶COª\ˆ_G∑\„\Õ\…','Maurice'),
('\J\◊\ÌFVÉQœ∏\∆Sˇ(','Mauritanie'),
('Ωl\À3BÑªD=j\’X','Mayotte'),
('V\Òò\ÛPSOuÄY∏A“ìi\»','Mexique'),
('fº—ØëO•ç\Ó)‘ô\ÍG','Monaco'),
(']+©yÑôKõ\"/\Ìã1','Mongolie'),
('*æ≠\„°˝Hì©cgπ\˜öXä','Montserrat'),
(';\Úvv>Eû±\„+ã,ô|','Mozambique'),
('g@-÷èˇIàò\∆\„z¥r','Myanmar'),
('ÅC\÷0¯SC6ç\Ô¿(aI◊Ö','Namibie'),
('\⁄?U\Ís\‹O\Z∞¡©J\ k(','Nauru'),
(')™åUqFKôóÉ\⁄\‡Sa\Ô','N√©pal'),
('®0\«\Z+´EyàyYhπN§¨','Nicaragua'),
('\êü|x™J&é\√#d~ß!µ','Niger'),
('pv\≈\®∞C™ΩÖJ\Èöâ','Nig√©ria'),
('πñi\”\ÏnD\r¢\ﬁ\—D“Ω\À','Niu√©'),
('˛=ïInê2qÑ†\∆l','Norv√®ge'),
('3™o)àBûtnΩAi\—,','Nouvelle-Cal√©donie'),
('3Zê`K≠Üa4DQ\·','Nouvelle-Z√©lande'),
('xu\rWÑ\ÀD\ÔäV%¡˝','Oman'),
('\Ÿ\ÊÑ–≠N·ä§îü7≠T_','Ouganda'),
('Kp\0ÑpNzâ¡UÑ @zR','Ouzb√©kistan'),
('p?,˝BqΩ˚\\:©Ø\ÒV','Pakistan'),
('&$∏ì^A=è&\n\ @F–Ñ','Palaos'),
('\÷6†^\Ó†@/°\È´X\œ\‰ z','Panama'),
('èyj∑%Nï¿}=~≠\Í\Œ','Papouasie-Nouvelle-Guin√©e'),
('°^\”5\ÌiDá8\œAŸòï','Paraguay'),
('ö¯e]\ıÄ@\Ïµ8ÄkM©','Pays-Bas'),
('\ŸY¨æVA9¥7\Íòc˝3[','P√©rou'),
('\”Kz#¶:DfÑ\›r\\ø\0ˇ','Philippines'),
('\Â¯îÅ\'NMº∂)—§dJ∂','Pitcairn'),
('yR®\‘\ÓI¢¡ÇÇåñ©K','Pologne'),
('ˇ\ı\Ó_\÷\ÂEô±Z|_+ä\Ÿ','Polyn√©sie Fran√ßaise'),
('\"Ñ\Óì&NŸ≥x∂AîK','Porto Rico'),
('Æ˘>\…0BíÅ˛WBåÑ0ø','Portugal'),
('waö£\\˜Kª\‹\‡\”\‚3','Qatar'),
('ˇ1£w|Kl©]˚c±Ì©∂','R√©publique Arabe Syrienne'),
('8ö\Î¥z9Jyæ\ÍN\’m3ó\ﬁ','R√©publique Centrafricaine'),
('¡è\Ù˝QC.åÃê\ı\„∂J','R√©publique de Cor√©e'),
('ûá=©@í:Ñß\ÿ¡H','R√©publique de Moldova'),
('\ f›•∏Ä@ö≤•	\ﬂ\Á0\ﬂ','R√©publique D√©mocratique du Congo'),
('<\·_NΩ\‹DÄNK\—\‡¢H','R√©publique D√©mocratique Populaire Lao'),
('n\Ò\·(í0O¥™£\\€˝','R√©publique Dominicaine'),
('C\ÌiÄπI\Âòr\ k\—S?','R√©publique du Congo'),
('Î£ΩëÖH_óC¯rµõ\Á¢','R√©publique Islamique d\'Iran'),
('4º®%tºF#í\◊¸\¬\…˘','R√©publique Populaire D√©mocratique de Cor√©e'),
('Å¨\ÍâE◊•è≤P15F\˜','R√©publique Tch√®que'),
('=`Õ´ûâF\˜®\‰|ãP…ö','R√©publique-Unie de Tanzanie'),
('*\"¶\Á\\≤Dê£ÇâQÖ\ËÉˇ','R√©union'),
('h}Kåˇ∂@ÿ™õà¬∏t ˙','Roumanie'),
('æW¨õ\⁄L≠≠i\Âà$q7','Royaume-Uni'),
('è§TWØçC‘µ‹Ø!\œd≥3','Rwanda'),
('\Îè™SâH\\™x\„^1\9','Sahara Occidental'),
('\ÔH\Àf\ÈD∞´æ4´˚Kûé','Saint-Kitts-et-Nevis'),
('W\ÁUB\ﬁ\‰BòøE\'w™:êx','Saint-Marin'),
('KE\÷=Ltßö†_´ÆYü','Saint-Pierre-et-Miquelon'),
('è\Ó\·6&LàØ;æè\„\‡&','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('â \ÿ%\‚\œCïíüª©\¬f\‚π','Saint-Vincent-et-les Grenadines'),
('ºór1\È*Drπ˛h4ùòæf','Sainte-H√©l√®ne'),
('+\˜pWeG±Æ\◊\’\Ú\ı)ê¢','Sainte-Lucie'),
('6Uá´¢ KøìL\\ãSFk^','Samoa'),
('q-d\U^Ad®\˜ÇÇ\÷\‡wª','Samoa Am√©ricaines'),
('C˘(∆ÇqDcø\“OËñû0(','Sao Tom√©-et-Principe'),
('õ:{]L±Oq∂+\m\\rM˚','S√©n√©gal'),
('\ﬂ`\‘\ÔzX@\ôR`\”\ˆp™','Serbie-et-Mont√©n√©gro'),
('O6Z\›,\‡@ªπ\ÿ˝NÇΩ','Seychelles'),
('¶\Âù\'\œB:Ñ$L\Ó\r;rC','Sierra Leone'),
('\œH\ÔvxZI\˜¨˛9£äB=\Ê','Singapour'),
('ΩF<\—OµJ˛¶·ôù¡\Ò§ö','Slovaquie'),
('Ω\Ïs˝ H≠ÉG´\·π\…*@','Slov√©nie'),
('yW®YºÅ@ﬂ•¡§L.\Ã','Somalie'),
('2\\æ?\–H\\é\…I`\Á?võ','Soudan'),
('±ãN\ﬁFÖΩ¶G?üR\Íô','Sri Lanka'),
('tóπ/j-JØÆ\Z(\»\èß','Su√®de'),
('≥né™fBE¥\ˆ|\”NÉ”∏','Suisse'),
('4°©\ËGÜ∫è5öqõ','Suriname'),
('z≤\Ù´nvD;Ωf¨7π\rs','Svalbard et√éle Jan Mayen'),
(',å9$yHUî\„∏Dÿ∞\–','Swaziland'),
('†Bd”§#N¢oUÆwê\Ï','Tadjikistan'),
('`¥%¥\0F#≤\‚∞\ˆ*','Ta√Øwan'),
('\ƒ]%ˇ\–+Bûø™E»≤˝Y{','Tchad'),
('â/	\ƒaEmÅú*iD','Terres Australes Fran√ßaises'),
('∑°à)qN\n´Éf\‹xaµ\“','Territoire Britannique de l\'Oc√©an Indien'),
('\‘\Ò†\„˚sIöéM®”Ö\›ß','Territoire Palestinien Occup√©'),
('G\"Tï\÷H¶±\‘\Ú&C\Ã\∆','Tha√Ølande'),
('±;‘Æ0~BE¥\÷Eo)\‡•','Timor-Leste'),
('/¨¨BNKqñ!8ëFóS','Togo'),
('\Ù\÷#:yñL“ÅK\«\‘\œ\«v','Tokelau'),
('V\‘pwéJ\Ïà\ÎL\Ò	€è\È','Tonga'),
('u\Í\Û)\Jøå¨\ŒˇExk\Ò','Trinit√©-et-Tobago'),
('Ü\ÏÌ•πDââ3Ω¨c\Ê','Tunisie'),
('öÜç&eñLÖ£lp/\‡l\Ú]','Turkm√©nistan'),
('®\Ê°¡\˜™Jé•4f∑£ö%¶','Turquie'),
('e$àï\ıEÄÄ±\ÛŸ¶/','Tuvalu'),
('FU^π(M\Ôµ@äÅ)T\»','Ukraine'),
('z%ë™\ﬂMLäueh\∆7\','Uruguay'),
('¶°∑êL@æ∑ŸÅ™∂i\ˆ','Vanuatu'),
('(jó<Ω H)§2≤-K∞\Ï','Venezuela'),
('\◊\Î©>!ôI‚Üö\”a&¸ó\Ë','Viet Nam'),
('˝\ÒQ¨I´ß\‡ªJ!ñù','Wallis et Futuna'),
('˛πûc_O#ÉŸ•⁄±íä\ﬁ','Y√©men'),
('\‡:\…B¥£X†Nô\‰Ø','Zambie'),
('\Îèg\“E™ëôl','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-02-11 14:35:16',9),
('DoctrineMigrations\\Version20240201152951','2024-02-11 14:35:16',3),
('DoctrineMigrations\\Version20240202084749','2024-02-11 14:35:16',3),
('DoctrineMigrations\\Version20240202150901','2024-02-11 14:35:16',3),
('DoctrineMigrations\\Version20240207105701','2024-02-11 14:35:16',6);
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
('\ËòNE\ÕD‘çB\ı\ƒ\ÊΩaí','root@gmail.com');
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

-- Dump completed on 2024-02-11 14:35:19
