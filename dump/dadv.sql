-- MariaDB dump 10.19  Distrib 10.11.7-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv
-- ------------------------------------------------------
-- Server version	10.11.7-MariaDB-1:10.11.7+maria~ubu2204

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
  `owner_id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `country` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `saved_at` date NOT NULL COMMENT '(DC2Type:date_immutable)',
  `tasted_at` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottle`
--

LOCK TABLES `bottle` WRITE;
/*!40000 ALTER TABLE `bottle` DISABLE KEYS */;
INSERT INTO `bottle` VALUES
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',259.99,'2024-04-12',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',999.99,'2024-04-12',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',2999.99,'2024-04-12',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','\îo;ÔˆC¾±ı½\Ë\nl','Italie',899.99,'2024-04-12',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','\îo;ÔˆC¾±ı½\Ë\nl','France',1599.99,'2024-04-12',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'\îo;ÔˆC¾±ı½\Ë\nl','France',358.99,'2024-04-12',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','\îo;ÔˆC¾±ı½\Ë\nl','Australie',1799.99,'2024-04-12',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',1099.99,'2024-04-12',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','\è˜NE\ÍDÔB\õ\Ä\æ½a’','United States',199.99,'2024-04-12',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','\îo;ÔˆC¾±ı½\Ë\nl','New Zealand',49.99,'2024-04-12',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Italy',899.99,'2024-04-12',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','\îo;ÔˆC¾±ı½\Ë\nl','Espagne',1499.99,'2024-04-12',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',1299.99,'2024-04-12',NULL);
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
('Ja»‚!€G·º<Da‚´','Afghanistan'),
('\Ä\Ü\â—Ü³G“\éºš4','Afrique du Sud'),
('k—ºI\ÑMu¸¹&\Î\ìš\äø','Albanie'),
('¾HU\à‡\çK[²Q\Éø\Ö ”~','AlgÃ©rie'),
('\ôş¶TĞ’A½\ğ~#	œ\Ú','Allemagne'),
('£%P\0™B^„d¾Û„u1ƒ','Andorre'),
('”Z\àÌu@ÅœNü$¿/§”','Angola'),
(']0D\ÈQN*‹s#J¨\×r','Anguilla'),
('iw>P\0BÆº\×!FTŠ\Ã','Antarctique'),
('}àµ¹IU¶[1´ˆ\ZLŒ','Antigua-et-Barbuda'),
('­ş\õŸ\çlET£–Kz­¯','Antilles NÃ©erlandaises'),
('¨\0\\‘\ìF³¸\Üi~‡!','Arabie Saoudite'),
('ûY\Ã{MZœûÿzv\ÅNg','Argentine'),
('\êWvKZ§‘!3ncıU','ArmÃ©nie'),
('\Ï	\Ã\ŞGMä…µ*\nšk\Ò\ğ','Aruba'),
(']¢–»|Oo—q~\ì\Ù\Z','Australie'),
('¶¹\î\Z\ØGÍº–\Ãıw,ú\É','Autriche'),
('\Ô\ÒdœC“~»\÷ø»ú','AzerbaÃ¯djan'),
('¿\ítÀq’N\\8Å‹\Z†x','Bahamas'),
('\n–±uY\îA>†\Âd\ç½ú\Ú','BahreÃ¯n'),
('Œ™U\Î4¨OY˜\Å\Ù*¤™','Bangladesh'),
('o^/\ë3\ïCU¤gZúi‰\Õ?','Barbade'),
('¸‚pD×›K_¸\Ê\0;ş\Óg\ö','BÃ©larus'),
('ı\ãşBY®QksmŸ\í¶','Belgique'),
('¢\Ğ\ê‹MT¶ıPY­¾Š','Belize'),
('\"\ĞMRG`­Ô®\Â\ì°','BÃ©nin'),
('\ôŠ}\ÍD¥G2\ÅÚ‡U\í','Bermudes'),
('ı\å©vC˜H\ñvÆ›','Bhoutan'),
('\ö\ëİ®\ÙF—±V6¹?','Bolivie'),
('ˆrù•FY¸\ê°g\Æ\Ñ\î','Bosnie-HerzÃ©govine'),
('—»¥µeC\r\Ë0›\÷~\å','Botswana'),
('¶{o6u@@»-\Å\ôÇ…lş','BrÃ©sil'),
('$‰¤(¤NF¨\ÂyH ','BrunÃ©i Darussalam'),
('¡\á \×©AÏ—\æwB\Î\Ël','Bulgarie'),
('>S&q™™Fù–½‘´<½\Z*','Burkina Faso'),
('<\ô8_\å@Š—L\â¦`\òi\'','Burundi'),
('\ÏcÁ€\Ï\õA€i\Û\àÄ’','Cambodge'),
('§P²‹¾J\ç\nqRÍ“\r²','Cameroun'),
('\ï\ÔN\Ä4¡AµIº¥}ı\"','Canada'),
('°¼…\"BC”…œl¥©Nú\Ç','Cap-vert'),
('\"Lf|I@‘ˆM\ñşş8¨','Chili'),
('\çQ\×s$Jt¥.\É:c’6','Chine'),
('8S&G\ÊLÿ¼¯‘U=\"','Chypre'),
('@˜a\İvCi‚S³ˆNdJ¶','Colombie'),
('!),\èˆ&H(« \õb\ò;','Comores'),
('\ÚF“Ew“\í4^\à\Ú','Costa Rica'),
('„G\Ú¢O”¸»<¾ˆù','CÃ´te d\'Ivoire'),
('\0z\î°g¦E¢ª‡\è\ğÕ©:$','Croatie'),
(':*60xB¶œ\ÃhÀ¯\Ş\Ã','Cuba'),
('¿\Ğ½\ÍFJ…¼=IT\â(','Danemark'),
('q\r?À œJ«Ÿº¤g8$E','Djibouti'),
('\Å\çâŸ›!AM­µ•‰\Ó|\è','Dominique'),
('\íN@LÀ\ZCÚ£ÿ\n¿oz\õ\Ú','Ã‰gypte'),
('\á.BşAÑŸCjt´','El Salvador'),
('\Z‰ae;C\ñŸz\ğ¨–\ò\Ø','Ã‰mirats Arabes Unis'),
('\Ûa	µ‡˜KZœ€gkfx\É`','Ã‰quateur'),
('nG\ë-H—®\0+úIG','Ã‰rythrÃ©e'),
('Œ\÷	™\ì\îHÂ²6û[e³','Espagne'),
('*C“\à”şBÓš˜Q¬Ş¡º','Estonie'),
('\ìb–œ{Nb‰Zş\è	','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('´\ñS\'˜G,…\Ç,\Èx\Ø\×','Ã‰tats-Unis'),
('\Ø|a B	³Á† \Ñ\ö','Ã‰thiopie'),
('\÷\î¡\öDÚ³š4­\à6J','FÃ©dÃ©ration de Russie'),
('%\0lcÏ…EÖ¤~W\Û\ö;L','Fidji'),
('\ó>\àƒ:\åNC³D:x\èXû','Finlande'),
('^\Æ9ı@Lë‡‹\İvù\Âj‰','France'),
('æ¦§\r8N¨…Qùm\ò','Gabon'),
('\å$‡š;•N•™\êŠAcx]“','Gambie'),
('¤j‡\×¢G·¨Ó¬\0_7','GÃ©orgie'),
('¹‹W\Ñc@\æµ\é9\Ó@»“','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('¦#‚ızC#§y\ìÕjyr','Ghana'),
('8‘R©\ÒH€\å\ÒQdrÛ€','Gibraltar'),
('\åX\"Úƒ2Jq‘‘:<‡˜q','GrÃ¨ce'),
('\ØVS¯B£¦\â®Nµ\â’','Grenade'),
('¶—,\ìL‹¿	\Õe \Å\á','Groenland'),
('ä´»\á.Fn²¯}w¢Bû]','Guadeloupe'),
('ª/„PÿXGg›úikÉ°\Ï','Guam'),
('Î¥\ÂA\Ñ@kµ\ëV\Õ\Ø,\"c','Guatemala'),
('Bu\ácÌ@‚ù¯®\Ïx\ÛT','GuinÃ©e'),
('ûE\Ó\èµ3E\â°-}o-CU','GuinÃ©e Ã‰quatoriale'),
('Y\ßr\Ê\õ\èD€§²4¥ˆXSµ','GuinÃ©e-Bissau'),
('®Àw=}E_½\Òp\ğµú°','Guyana'),
('µ\È\ÂUµM\ã•\ÅJ•\ï’\Ï\ê','Guyane FranÃ§aise'),
('6¥\õÖšK¬±\'©\Ë\Õ\Í\×','HaÃ¯ti'),
('‡z«8\ØC”«±ˆ³\ß','Honduras'),
('WO8B\ËQI¸³?Ä‚\ó“\ë','Hong-Kong'),
('tı\Ì;\êO\è¡FÏ¾\'','Hongrie'),
('\Í ^gB(„\ç1\çO\ÎaX','Ãle Bouvet'),
('\Ì	Jp…iDZ 8\å9\Ş75','Ãle Christmas'),
('R?^‰M™¾‚\äÇ€','Ãle de Man'),
('X^x>SH$‹\ÖØ©¤\Ì\ë*','Ãle Norfolk'),
('«¬ƒG\äB4­\ÃD#\ï\ÖÔª','Ãles (malvinas) Falkland'),
('I\Êbg,K‰¹\åq4qbM‹','Ãles Ã…land'),
('a\ò@\÷³¿I\è˜[¦¿3 †','Ãles CaÃ¯manes'),
('\êq\"\ÙCS£¦\rk~#\ñ','Ãles Cocos (Keeling)'),
('v\"x@\ŞHÂ”Y}7n\Ë\Û','Ãles Cook'),
('u8#_\ã\ÛFä™Ù´2','Ãles FÃ©roÃ©'),
('¯Á1\ÓBK§&\Ò\Ä\Şme–','Ãles Heard et Mcdonald'),
('Bš$$N2º˜1\Ò\ÎŸ‘','Ãles Mariannes du Nord'),
(']t¢\Ò M¡§T›W91>G','Ãles Marshall'),
(':üE­»&C{«OFµg\Ó\"','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('\Ş.·„\îUG¦”\Û\ÓB›\ğ\Ğ','Ãles Salomon'),
('bz%¸\ÄB·±sT\ò–4','Ãles Turks et CaÃ¯ques'),
('2±{\ğúkHİ!½—Yl`','Ãles Vierges Britanniques'),
('\ÊÆ¨p4\æI:“‘\èü!·ş/','Ãles Vierges des Ã‰tats-Unis'),
('\èr¡F¶kRD¶³†®','Inde'),
('½—\íD\Ñ@=’\ó\Îm²e','IndonÃ©sie'),
('@nùyL9¢fReSzº','Iraq'),
('˜O—\ïA‹\ó™\Ú\â¢\ì','Irlande'),
('\ïbv\Ñ|@¾•#t±»œØ‚','Islande'),
('R\å»\Ä\ÜGY Ş‚\ö¡X\Ú8','IsraÃ«l'),
('ey_:¼\×EÕÓ¨‘\Îú','Italie'),
('ql_³œ\×I\Z£² £@ı\ê','Jamahiriya Arabe Libyenne'),
('|1|F¯AK‚\è*\â0W‚T','JamaÃ¯que'),
('\í\Îf\Ê[0Gk²yI?H~WŸ','Japon'),
('‘,<\ÕfC«vh³‡Gt3','Jordanie'),
('üV– †şGB,•¥\"ü.','Kazakhstan'),
('CZB\éczN]¿-=\à|À','Kenya'),
('¡;\ÈA‰FË¾f¢,i\Âr*','Kirghizistan'),
('úFf	«I\è…muúŒ','Kiribati'),
('˜5o¼sC’·ºÿ®¬:k*','KoweÃ¯t'),
('¾±g|\Ğ\íJ[±_GÂ¿D:\Ö','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('\éê”§x›E\ä‡m\ï\Êp8}+','Lesotho'),
('°\0ø	\Ó\ÄEJ†^\à\Æ \Îf','Lettonie'),
('†¸\ÃÉ¼\åF*†1Ô¡gy\ğ','Liban'),
('\ö#>)OIy“Å²uj¦\Ü]','LibÃ©ria'),
('Xd5qgUJÌ®Q*=,','Liechtenstein'),
('·Œ‡kûgAÙ¼/\èüµİ®','Lituanie'),
('‚Ã°\Ço\ÉEâ²\æ\ä5¼T¾','Luxembourg'),
('C\Ö¤RLÂˆ\òúp„\ñr','Macao'),
('\íŒıª´»G(ªLfV6H¶','Madagascar'),
('\ßh\ÂD\óªM\äªŞ´ÙªB:\Õ','Malaisie'),
('‚\Ã7\î\ì¬KÕ‘qÑ”\Äs\Íú','Malawi'),
(' \Ã\êpR\"@Æˆ¸¯,ş>','Maldives'),
('4\Ü9\ä¡=Fú°øaHªºˆ{','Mali'),
('`«gK†\á§\Z‚¿T\Z','Malte'),
('w~„}\æEİ•=\Ûÿ‚}\çú','Maroc'),
('\Z\Ü\Ï\ØÊ½LU€\î%jü\êR','Martinique'),
('G³ˆ\èûRL\õ¦6¿\'Š\Éüƒ','Maurice'),
('¡:½%KÓµA\Ô\ì\ó#¥','Mauritanie'),
('¡¥\ë\É@ÅŠn¡Lrş]f','Mayotte'),
('!‘%¥Q\÷B½ş>l\Ó','Mexique'),
('= z]T@zP*\ö´Q%','Monaco'),
('\\\Û\ô>/M ‚dq©\Â>e','Mongolie'),
('}—\îKG‹¦IhBMÿ','Montserrat'),
('\Èÿ\ÆV\Â\ÆCƒŸ®rƒ\ó}','Mozambique'),
('ú\î\õ“\×Bq´S	²¼\Æ','Myanmar'),
('húhv\Ï{I)Šù˜+À’','Namibie'),
('h\ã\ÛûSI€£¨Rl;\ôk','Nauru'),
('\Å\n­© ¬J¹†± ´8\ìD','NÃ©pal'),
('\÷\ğ\èc@‘³o&û£²F','Nicaragua'),
('\÷¡£ù\æªFA™\Ã)ÿ}Ú–','Niger'),
('\İ5;QJ5¤‡c\ô]Àˆ','NigÃ©ria'),
('Õ¸2\Ø\ĞK¾v€\Ï\ÄQ™·','NiuÃ©'),
('\ä7\Ü\ï[<FFCk©»','NorvÃ¨ge'),
('rÚ‹\Õ\ÄBO•ê¨«{','Nouvelle-CalÃ©donie'),
('>]º¡7B\Zµ)1‡\áQ\Ã\"','Nouvelle-ZÃ©lande'),
('®\"‹½§–A¼ÿ\ÌÔ¤\Z','Oman'),
('T\ËU&\ĞDv NaPd)=','Ouganda'),
('cL\Âab\ÊA1¦\Æ…+\Z¥','OuzbÃ©kistan'),
('\Ùú?14C«a>\æÏŸ3O','Pakistan'),
(':€c\ôN \Ø\òû*\ÉP','Palaos'),
('}\çù9\×qAÆ‹Œ©š5i•','Panama'),
('\é‹.˜\á@<“‘ze¥¼B¯','Papouasie-Nouvelle-GuinÃ©e'),
('Z`Ó¶mF«Ä¼\Ç(\Û?','Paraguay'),
('®‰-5\Üş@r¶l\ç43\öx','Pays-Bas'),
('\÷\'S\'­Bª‡\nh©× ','PÃ©rou'),
('\êN\÷\Ø{O7?‹S}\×B\Å','Philippines'),
('üª\çÛGH;s9úgU','Pitcairn'),
('[6\r£ƒ\ëAr®ùp^F\Êı\\','Pologne'),
('zª·¥\ïWFƒ\n‘uŸ\æH\Ú','PolynÃ©sie FranÃ§aise'),
('/U\Ù7_ŒN>˜tBR†\Ã*i','Porto Rico'),
('¹ø’\×ûVIz¼6iW\Z¿\æ\Ô','Portugal'),
('Šk	µ\İAã „\Ó\Ø\ñ]§\ö','Qatar'),
('Àú\î)\rEÇ½“l\ëÅ¶µ','RÃ©publique Arabe Syrienne'),
('}¡\á–\ÈH›¤\\\étiÒ¶','RÃ©publique Centrafricaine'),
('Á³Lƒ·LKŠ‘\ÌY\rƒ©‚','RÃ©publique de CorÃ©e'),
('\çIş/­A|ş\Ï`‚ ly','RÃ©publique de Moldova'),
('\õ(Îˆ\ĞHP±\Ğ\è\÷¿¤\Û','RÃ©publique DÃ©mocratique du Congo'),
('\Å\ò\ñ®InJË®c‰`˜µ','RÃ©publique DÃ©mocratique Populaire Lao'),
('¡:\ÆB\ñKt´E2m\Ş\ÍA\ò','RÃ©publique Dominicaine'),
('M/n\öEß»\Â„\İ:m\Ø','RÃ©publique du Congo'),
('{ú®‚\Ìÿ@–”S\ÎÆ„','RÃ©publique Islamique d\'Iran'),
('=#“¯Ï¯C¡Œú×¯\È','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('ıLB\ß\ÏCŸ«cXú\"od/','RÃ©publique TchÃ¨que'),
('	n\ç”+‘Cp³“N@¢\Î\ÜC','RÃ©publique-Unie de Tanzanie'),
('MV«`£C|½©\ZC¨t\Ë','RÃ©union'),
('†®\n\Ôg8K[­)N»‰','Roumanie'),
('\Ğ]W—NEm’Æµ·®€»,','Royaume-Uni'),
('­s*®ùC€`	A\Ü\á','Rwanda'),
('¿\Ã\ï\ğMuM¬§w‚\á¹l\Æ','Sahara Occidental'),
('ü¯:²ºBAxŒi\ò\Ü\İVŸ','Saint-Kitts-et-Nevis'),
('DZ ø³±O:‹; «¨\ĞG','Saint-Marin'),
('AO™¤m·Oú¼¯rı.lJm','Saint-Pierre-et-Miquelon'),
('I7\ì\Ò(\ãAÍ P„=Â¸^•','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('*û\åf\Ì$M\å€u[\à”«’W','Saint-Vincent-et-les Grenadines'),
('À½~qûF“¹øuGt-\Ó\õ','Sainte-HÃ©lÃ¨ne'),
('I\ãS\àI=¼u\Öl\Ô{\n','Sainte-Lucie'),
('aW\ïz·\rDƒ˜t¿}Av','Samoa'),
('PG\ÔE\ÆI˜´KH<şm','Samoa AmÃ©ricaines'),
('Á:\æP\'GBƒ–¼×€B\İC','Sao TomÃ©-et-Principe'),
('K\Ï*\Ø@ø€\å\Ë„R´Y','SÃ©nÃ©gal'),
('¦ş`c\î¼Bw\"¿”;;¬¿','Serbie-et-MontÃ©nÃ©gro'),
('›´1}rD°¨©\Ö\r\ØQ\ìB','Seychelles'),
('ÿ\È>\ÛFšzª¬G£a','Sierra Leone'),
('Kv^c\'J.½w’z	*','Singapour'),
('KK\ê…y¤N¤¯™–ˆ—W','Slovaquie'),
(']a¹‡N—D\ï¿S-½','SlovÃ©nie'),
('ÿ°\Z\ÃY\ÆH\0€\ÍG3\Îv\Ñ','Somalie'),
('…Xz7KÂ˜ş\ëD\÷›¹','Soudan'),
('sa\ë?¬Gµ@\Ğx5F','Sri Lanka'),
('\0‹IŸ\'ùLŒ»\æ\ğ\nÛx\ò','SuÃ¨de'),
(']•x­OÃ„ß€Y\Æ@:w','Suisse'),
('ptd…O_´\İo\ÙÆ‡U','Suriname'),
('\0˜.\0vMk‰\\\í\ëS\î','Svalbard etÃle Jan Mayen'),
('²>\Ü\Õ\Z}@\ö…°\ïµ{\àüÀ','Swaziland'),
('G\óCŸkUD|³gc\ñ}”c','Tadjikistan'),
('-	\í¤‚O•±ZÛ‹C¯ˆ','TaÃ¯wan'),
('\ó»X\÷N¨\Ø\'Zvb\×','Tchad'),
('_Ñ„\ò\ĞøDxJÜu\í','Terres Australes FranÃ§aises'),
('£CpÀ¥+LÅ€\òù\Ã\Ë	ƒ\Ø','Territoire Britannique de l\'OcÃ©an Indien'),
('o½7\âJùG³°\â\ÙW\ã8´','Territoire Palestinien OccupÃ©'),
('1¨ß†vAf…\öS\ã\ä\È','ThaÃ¯lande'),
('–›¸\ÎAµ¸?j´\Âı²','Timor-Leste'),
('\å>\ï\Î\Æ)H •%{J±”½','Togo'),
('æ‡œHkRNı©\Ù ûbq´”','Tokelau'),
('x6RT¿iFm€tZ\ã[˜','Tonga'),
('Ùšµ\íK`E@ƒ7|\á~<±','TrinitÃ©-et-Tobago'),
('„wy\ÒuC\\¤j{/\ër”','Tunisie'),
('‡Ã”\éWÁI@µ<ıe\ç','TurkmÃ©nistan'),
('j\ò¿—A½™Ú¥6®','Turquie'),
('2#»t\ô\êI\ñš²®,','Tuvalu'),
('Å•\ê‚ªAa¥hs˜\Şœg','Ukraine'),
('ßƒÙ¬5A®ˆ\ö?¡ü˜','Uruguay'),
('‚ú½­GM\'¸¶$—û]','Vanuatu'),
('\æê‡€ºÁLU’A0\ÅËq\Â','Venezuela'),
('\İ\ğ\\jLC‚ƒ)\ÏE\Él','Viet Nam'),
('cwÀ\ÂşO¬³™:\×\Ö','Wallis et Futuna'),
('ÕŸ¹2±\åCP®£iª\ñJ‚','YÃ©men'),
('ºªi…PNv¼¦›D+\ÌB','Zambie'),
('Ê®¼½\â\æ@~¸‰´\Ú\Ô-[|','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-04-12 19:51:54',5),
('DoctrineMigrations\\Version20240201152951','2024-04-12 19:51:54',2),
('DoctrineMigrations\\Version20240202084749','2024-04-12 19:51:54',2),
('DoctrineMigrations\\Version20240202150901','2024-04-12 19:51:54',3),
('DoctrineMigrations\\Version20240207105701','2024-04-12 19:51:54',2),
('DoctrineMigrations\\Version20240319212437','2024-04-12 19:51:54',2);
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
('·-³\'-ˆA>˜6H•;“1¶','Cabernet Franc'),
('H–=n+¡A—®+Q\Î\ğn4h','Cabernet Sauvignon'),
('¡‡\È0”eLÙ¥>o’ù\Ò	','Chardonnay'),
('{¾’9‘\áK\å©\ğ\'\Øg9Ob','Chenin'),
(']\ì®<ıTJÏ¨¹\á	\Å(','Cinsault'),
('Or?`£šH\õ»\í+`\n','Grenache'),
('ŠˆÈ¨r@Ü¢“[»,Cµ','Merlot'),
('w3\ÊùqO\r­\Ò\ã\æA','Nebbiolo'),
('°chiC­£ Z¥\ã\rƒ','Petit Verdot'),
('¯‘\Ğ\æœ\ôF±«h\îDN×‹','Pinot Noir'),
('³ü7QD…93Ÿ\Ğ=','Sauvignon Blanc'),
('İ¸\Z\á\ìDQŠ\à\ğ‰Ò¼j','Shiraz'),
('«Pˆ°\ÌNu´|>”±\ì·','Syrah'),
('5DYI$™\ß@v€','Tempranillo');
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
('\îo;ÔˆC¾±ı½\Ë\nl','hugues.gobet@gmail.com'),
('\è˜NE\ÍDÔB\õ\Ä\æ½a’','root@gmail.com');
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

-- Dump completed on 2024-04-12 19:51:55
