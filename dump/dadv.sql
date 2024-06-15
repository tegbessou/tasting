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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',259.99,'2024-06-14',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',999.99,'2024-06-14',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',2999.99,'2024-06-14',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Italie',899.99,'2024-06-14',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1599.99,'2024-06-14',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'¾m2\Ü#M¿Œfh\Ñ3[¼','France',358.99,'2024-06-14',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Australie',1799.99,'2024-06-14',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1099.99,'2024-06-14',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\Ë#zO0±ˆj­q´s_','United States',199.99,'2024-06-14',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','¾m2\Ü#M¿Œfh\Ñ3[¼','New Zealand',49.99,'2024-06-14',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Italy',899.99,'2024-06-14',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Espagne',1499.99,'2024-06-14',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',1299.99,'2024-06-14',NULL);
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
('XÉT\ØJ£¡rPAÓ¸\ß','Afghanistan'),
('buÓ  A=e\0T¦1ş¹','Afrique du Sud'),
('m\æ‘:ÁqH‘\ÌÿÜ®V\÷','Albanie'),
('-¤{U\÷*M‡¹\ÒøÙ»hF!','AlgÃ©rie'),
('I’ylA\ÏC¼²ˆŒ8C&','Allemagne'),
('$Xº\ótNR€\Ù\Ì\åq:6','Andorre'),
('\0ø€ù\ïeDº \ïJ\õ\È\Ç!¤','Angola'),
('I\ó\Å\ôˆ\íA¹\ê\Ú3LÀ‹¼','Anguilla'),
('\"]À\ÆşƒD-Œ9)70','Antarctique'),
('\èm:pMVL\æ¬şƒ\á\ö$v\à','Antigua-et-Barbuda'),
('Qb+\è]gH»\í\ñy³İ·','Antilles NÃ©erlandaises'),
('+·\Í\ä(\çE\î¾YA\íµû\Õ','Arabie Saoudite'),
('¦Fæ¶¦\åH¾¿\Óç†„x\ä\Ü','Argentine'),
('³e\ßDÑ¹…i\ÉWf','ArmÃ©nie'),
('.ˆ‰û\ÜE|’Áps(#\Å;','Aruba'),
('œª€5\ÎDÀ¡ Feš&','Australie'),
('\ô<\ÏVzN7”\â5„J½²X','Autriche'),
('b~\ç\Ò\êF\ä,–¥\öJ‚','AzerbaÃ¯djan'),
(')@Z´\Ü\ãH0š\Ò$š‹a\è','Bahamas'),
('I4~V“L>§9\Ë9>\ç\ó','BahreÃ¯n'),
('\Ë©\İe\\O\ç¾{S«|W\Æ','Bangladesh'),
('ı^T¡¶HFx™0TA\Ì\ÏK','Barbade'),
('S/˜L/°–µ\óÀu§o','BÃ©larus'),
('\ï$0¬ªA³\Â\ğˆ‡şF','Belgique'),
('„\ö&>L}¡‡\ÉMc\ó\îÁ','Belize'),
('ı-—4{H™I^:¸','BÃ©nin'),
('\é\'fy«>JÑ›¬Wˆ\Ø\'3¹','Bermudes'),
('\å€\à\Çn|N„˜>šÌ†\Ã6I','Bhoutan'),
('`Lx‹AJ¦¦?SC¥‹©','Bolivie'),
('uGÀ\ÛUN`şH£¦ù/\É','Bosnie-HerzÃ©govine'),
('8\ßß¼9M…§\ÉŞ½(M”','Botswana'),
('#•&aiyA\n	ğ¯«¥*','BrÃ©sil'),
('PûI\Ö\ëM\æ\Ş4H\ğ/','BrunÃ©i Darussalam'),
('&Ÿ\ÏDp“¤ I‘\r','Bulgarie'),
('\'[wúLq°“j\nlÀ','Burkina Faso'),
('Û¿ùs;\ÆJ¿­8ª,Y','Burundi'),
('ƒ<\Èuk\áO®š\ny-Áš!D','Cambodge'),
('f\Êv\nC@\Z‡4mßºÊŠ.','Cameroun'),
('´°œ\Ó\n\ÒI¾·\ïd\ÒD\Î0©','Canada'),
('FG©\ÑDFºE\ÕJ‡\ĞÛš','Cap-vert'),
(':š°/Ã¼Ct™\ì\ç\"±7^','Chili'),
('L‚\ç\ãiNÚ…\å,{\ë\Åp','Chine'),
('Fn\Ö\ÔqI£ªŒs\r=-\ïV','Chypre'),
('a\ğ{Z,rLUŠ¯pÓ·ıº\å','Colombie'),
('_¾FE@i¯»\nH\ì\Ùm','Comores'),
('‡Gú\n\ÒCL¼™˜sy\r	(','Costa Rica'),
('¨úş`\İMMÏ\Ş\Ö	%k','CÃ´te d\'Ivoire'),
('I\Ì\ãYK¼¡QEB\ç\ç','Croatie'),
('\É>d†1A;”\ô\æ·‘¶)','Cuba'),
('60”†‚Iƒ_eÇ©L\ZŒ','Danemark'),
('Ú†\à<Ú’LI£¦\ÚTP','Djibouti'),
('˜\ât\ÏÀ\Î@$º€À‹½\á\Î','Dominique'),
('\ğ|ş¬•HH¢±ø\'H\\\è®','Ã‰gypte'),
('\î\ÅR62N‹¸\ï\Îw 1','El Salvador'),
('£î‹½¤\îDÜƒ\ç8¹7•','Ã‰mirats Arabes Unis'),
('ü\ç\'%IiKH”ZB¿~<','Ã‰quateur'),
('ŒKüfU¼M†¶Š¢\é³S\ò','Ã‰rythrÃ©e'),
('vˆ\Ç\î—G}ŠU\İi\Ñ\Î\\','Espagne'),
('Ú·,‰|O¥¸\ÜkJb\÷º','Estonie'),
(']•H¾\ò	DŒ¦RŸ|\â‘;š','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
(' Gf†Ì®G©‹\ÇiŸ9o','Ã‰tats-Unis'),
('şWc¾Lî‚¡¶\çs±\Å\ï','Ã‰thiopie'),
(',\Ïy\ö\óH¯jHm64\Ëb','FÃ©dÃ©ration de Russie'),
('»b\Ï9ûKŸıe\Â:ˆ\Õ ','Fidji'),
('gÌ“?SC\é­J\ÂÙ˜\ß\î\ô','Finlande'),
('	5«q1jI¦(MŠ\å…Y\ì','France'),
('5–µŠMHK\ì#ù´\Â','Gabon'),
('\0®ı½s&BÄ¼\æ}µ\õ*_2','Gambie'),
('o\Û0§\'NW‹ß¬s\ÙTÂˆ','GÃ©orgie'),
('XH,b\òAbŠC»‚K³\Ù\Ò','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('‚¿V‰“OÆ¥@´SÀüÔ¡','Ghana'),
('$Dm\Ù\èD—€T C\İ2','Gibraltar'),
('ª\î\Ü!LG ‰D\á\r€\ã{','GrÃ¨ce'),
('\ğ¡\Ì#·J(‹\Ü\Ü\r®!\Ğ','Grenade'),
('Î”[´VK“¹IX¾&\Ê','Groenland'),
('$[)şN5laˆ¸W‰u','Guadeloupe'),
('BaAdšAO¬Y><ˆ¨ú\é','Guam'),
('\ë\0ë°MB’\ë\Ôr','Guatemala'),
('c&¤\ÍA¥N‡nˆU\ì','GuinÃ©e'),
('7şo½­–NÀ»œ)w\Ç\àû','GuinÃ©e Ã‰quatoriale'),
('\ÕM{§t@	“‰¢¡‰€vµ','GuinÃ©e-Bissau'),
('\Ü@Á’\Û\ïLKœ\ÏÔ–½v','Guyana'),
('@\çµ\ÎoOB¶šz\ğ?\É`\Ë','Guyane FranÃ§aise'),
('57#+|\ãN^©>p\à¦\ÓG','HaÃ¯ti'),
('1\önúDJ“Z\Z‡s\ç¨','Honduras'),
('ı	D‰Gµ¼”\Ò\êx\Ô','Hong-Kong'),
('B5\ßjF)‰#\Ê‡†u\É','Hongrie'),
('©g\ölAE¶Š|bV­\Ò','Ãle Bouvet'),
('¥FnbEZ—\\	’lû\é','Ãle Christmas'),
('FÀbl\éE(©\Ë\Ì\æ¥\Şÿ','Ãle de Man'),
('\êq±b\Û\rKšˆ\ó»\àN%\İ4','Ãle Norfolk'),
('\Ğ ú\Ü\ì\÷F×‰c\Ê\õˆZ','Ãles (malvinas) Falkland'),
('Y‰\r¥)ıDÊ\õ‡C\æ<µ','Ãles Ã…land'),
('+jß²o¶B\é°\Üej\ïv\Ì','Ãles CaÃ¯manes'),
('D’OS\×\ÊAÃ¬u©ˆ\0ú','Ãles Cocos (Keeling)'),
('ÿ$Xú0Dt¤\ökeG\Z','Ãles Cook'),
('Û±0–\ßK£]\Ü\Ã5ı—','Ãles FÃ©roÃ©'),
('3rM¯\çB¬•\\3\ï+e¹','Ãles Heard et Mcdonald'),
('8Ó‘DƒAd—Ü¶¸‹—\õ','Ãles Mariannes du Nord'),
('ƒD8\ÅwD3\àd\n\Ú<\ë','Ãles Marshall'),
('n‘gMÿ\ÔIÊ±©\É:—\÷','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('iKfÁnE\ö“:\÷Œ\Ã5»=','Ãles Salomon'),
('>„0\ÛE«¾`lJ\ÖM¢','Ãles Turks et CaÃ¯ques'),
('¾\Z‘œª\îI¤\ñ\ÕÂ€f','Ãles Vierges Britanniques'),
('O)~\Ğ~J4«*yƒ7#)R','Ãles Vierges des Ã‰tats-Unis'),
('ü©Y\öLt­‘\Õ(€\Ôb\å','Inde'),
('«ÿO\Ô\ã\÷IÏ¯\×,\Ó\Â\ì\Ã','IndonÃ©sie'),
('É«Š|§@	£Y‡\ÖB‹ş','Iraq'),
('\ZÓ„¶<OS®S“P‹ªJ','Irlande'),
('~Ä®IH\İBŞ‘­\åÎ´D\á','Islande'),
('¥\ë\Ó\ã,ùL˜”u¨','IsraÃ«l'),
('Ÿ\Ååˆ¼\ĞMn¼X2','Italie'),
('V\Ù?¶jXH©,Z™µë€“','Jamahiriya Arabe Libyenne'),
('oÀ\ó¥œ\çN\î•AZ\Ş½\Ü','JamaÃ¯que'),
('\\™Ì›…UO…²!mª\"¢š\Ï','Japon'),
('\Å\÷û\İ\ĞL\\Ÿ3\Ç\ÔEXi','Jordanie'),
('²‚¾b>\öH±oH?kş³m','Kazakhstan'),
('Y=AÌ“oLMš,¡ašT','Kenya'),
('ù~\0K\Í@®˜0ã–¾\÷A\Ç','Kirghizistan'),
('¦F½‚y\æM5´\İÀ­~ŒN','Kiribati'),
('<\Ì\ğ\İCú´B\àS5llk','KoweÃ¯t'),
('>’¤\ç¹CM¼\r«	\ï>','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
(' €O® &IH±¦\å“\î„\à‡','Lesotho'),
('‡A\çÿ¸C¯ˆ­®\ê6À','Lettonie'),
('Æ•¢\à\İC\ç¾*_*<\é','Liban'),
('\ç©IY%KY­¨­˜\è\ÚD\è','LibÃ©ria'),
('N\rcÀÿIGı–Y\Ë)q\ï','Liechtenstein'),
('R\Üs{jIš¦\Óg\á_p','Lituanie'),
('+xŸ/\Õ9A×¸‡\à‘¬©W','Luxembourg'),
('\Ô[\ês\ËNš¢ªÛ¼vœ˜','Macao'),
('zV…\'”eEÕ²]\ó\Ê9•G','Madagascar'),
('İ™&\öG°B•ú\×dÅ˜\Ã','Malaisie'),
('(iµ&O»°\ô»WZ1\Ô\ï','Malawi'),
('\ï\ìTk$¼E\Ñ\ï\Æé§©k','Maldives'),
('ªµ#’\æE‹§]fY	§«!','Mali'),
('\ì½v\Ğ6AEQ¹¨Æ™\Ä','Malte'),
('ß\\¡®œK\é¥v\ĞÔ—\è\Ñ','Maroc'),
(')¨\Şn\â\äAVƒº\İú»~†A','Martinique'),
('7»¼:9KMº$.*\õ`','Maurice'),
('ÂŠQ‚³Jp¸£™š\îŸ\ã‹','Mauritanie'),
('S\ë\ğ¥\ÂB°¦›b\Ë\Ç¬:','Mayotte'),
('J<¿IÛ´†\ÚØ±E~‘','Mexique'),
('\á¯\öÂŠIÿ†Ù·G\í\å¤','Monaco'),
('§¬sø\ê@t¹¢‘(T','Mongolie'),
('µ…Ù‡”Kº¶Ÿ¯—?\Zn\n','Montserrat'),
('É\Å \â(J\î\'ş†E\îß','Mozambique'),
('\ê›ø\å\ÆKNW¨E…\ç%\á*','Myanmar'),
('.»¢x tA¯AĞ–d.','Namibie'),
('¹ }\ğDC×¢/\ß ü+[','Nauru'),
('\ö \ÊJ«„&1Y?®N','NÃ©pal'),
('û½\"Ÿü$Bú‚BA,waC','Nicaragua'),
('¤vŒ&w\åBÄ¯\ÊM±E«ø³','Niger'),
(' …™À\×F6˜	 €>^','NigÃ©ria'),
('\÷™\Ó\ÑyDd«*ƒ\Ï\\h','NiuÃ©'),
('‰¼\ß(G•A´¶zi˜\ìl','NorvÃ¨ge'),
('¸!;œK\í¯\Æÿ–«j','Nouvelle-CalÃ©donie'),
('O{I\Ùz\ËOŠ°\õ.Ÿ\Ø$\ÖV','Nouvelle-ZÃ©lande'),
('1:\äg@&¹°üzùz¤','Oman'),
('\ğ\ö\õu•LxœXº½ˆFU‰','Ouganda'),
('ÿá OmKµ¸V)n[¨','OuzbÃ©kistan'),
('p:\Ø¥#L·†*{VVsA','Pakistan'),
('\ïj\ğùL¼…»‹}\Èv\É\ò','Palaos'),
('–\ô¬\å¨7K¸¼®K\ÊS¾o­','Panama'),
('\'dŸljCASšJCn»M','Papouasie-Nouvelle-GuinÃ©e'),
('\í$ÖºŒºG¤µú.drs','Paraguay'),
('¿¶\âM¼!EÚ¦\óü\á4h','Pays-Bas'),
('®]m•ÿ:D-inp\ô\Û','PÃ©rou'),
('\'”Á}¤:Jèˆˆh\õ\ñS','Philippines'),
('\×\Ñ\Õ\ßXúFœ€‰Gƒ\Û','Pitcairn'),
('\Û\ÇG“\ÒMN»BE;\\Jd\Ì','Pologne'),
('ip!š“øLù‚-ÿÍ„\ÍTú','PolynÃ©sie FranÃ§aise'),
('\à„T\ÃI#•]ª	•†Jl','Porto Rico'),
('G\â\']K]½y§\nG´','Portugal'),
('Ÿ*—s\í¶M\ë§İ¹\âo\Õ\ô','Qatar'),
('É£\r²8H\ö¹{Ÿ5ŸŠ±','RÃ©publique Arabe Syrienne'),
('»	„\åAù¼VĞ¤‘K\÷¬','RÃ©publique Centrafricaine'),
('\ó?¥E\\¦\ñ²\Ü+t”','RÃ©publique de CorÃ©e'),
('\Õ\èŸ~\æF‰Á\ö\à‰Ó½','RÃ©publique de Moldova'),
('œà«”@Iáœ\Ø?V\Ç?\Ğ','RÃ©publique DÃ©mocratique du Congo'),
('œd—}\õùI\'®&JMg\Ê4n','RÃ©publique DÃ©mocratique Populaire Lao'),
('\Î\ö¦Á]J\Ç~Ì‹ÿ','RÃ©publique Dominicaine'),
('@z\Åp\ï8LG¹™E›©½ù','RÃ©publique du Congo'),
('~›\n\àKÿAF»LÌ’°\õ-','RÃ©publique Islamique d\'Iran'),
('_Ö¬FDC›¡¢Uº,\Êh¯','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('ƒ€¤U\ãYOa¾9%\ğ\íW\×','RÃ©publique TchÃ¨que'),
('+“\õ\à>‰Ai“6\\0Ü¿\Ów','RÃ©publique-Unie de Tanzanie'),
('l“®\îş\ÚAÎ´©‚S£)\Ù','RÃ©union'),
('*m_¼ J«–½\ò¼˜\Åu','Roumanie'),
('n\Ò\Ñ\Z5´IGŒXß½H¢\Ë','Royaume-Uni'),
('\ò×•\\®@~˜ID\ék\ö³','Rwanda'),
('bT[\äY¯Jä½¿}\Ú@nœ ','Sahara Occidental'),
('‹\Ä7ÅyA ’\å©x¹T\'','Saint-Kitts-et-Nevis'),
('\îJ{Ùª\Â@ˆ `h5\ò','Saint-Marin'),
('\é\"\êLÓ ˆ8QV\ä\ï','Saint-Pierre-et-Miquelon'),
('pT_w“I®«¥q«™k\Ø','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('?‰\åMf¿5\ŞV\Æ\İ%','Saint-Vincent-et-les Grenadines'),
('ú<\Í\÷;9Oİ¤6²\Û)²V','Sainte-HÃ©lÃ¨ne'),
('Iº¬\0&QC“³P=\ĞU*','Sainte-Lucie'),
('i\ËÿFNNa‹£‡\öN\Öúš','Samoa'),
('0˜fœ\â4Jš\ÍHeQ','Samoa AmÃ©ricaines'),
('\ÂL¹{c˜A„¨/L\í:¦ş','Sao TomÃ©-et-Principe'),
('š/#\ÂG\ÎKR–‡_\ÔkÀ¶o','SÃ©nÃ©gal'),
('Š\àN\å?KHb<\×]Tc','Serbie-et-MontÃ©nÃ©gro'),
('\ñçµšûO\ô—lC\é\"O\Ä','Seychelles'),
('s\å©\Ë@HN\ğX\ÏD¬\ñy','Sierra Leone'),
('fµvN+&Iƒ\ìˆ!\0”,O','Singapour'),
('\Ük¯\åfJ}œ¡\á\ê\âŸ','Slovaquie'),
('y^ ‚pO·PA	Xz(L','SlovÃ©nie'),
('’–\ÕP\Ô@O›\ã\Æ6\Æ~\Ø','Somalie'),
('Xka¸¨AÂmº\îA…','Soudan'),
('¢cH?\Ï\'Nc´]\óÀù\r†','Sri Lanka'),
('\ÂmQv~VA?Œ\ËgŒE”\0\Í','SuÃ¨de'),
('ø\è8Jh\ÑNë…¤•v\Òz','Suisse'),
('½a~@3{]!\×\ß\Ìt','Suriname'),
('\õI«\åb\ZHs¼\"“¥!\Äj','Svalbard etÃle Jan Mayen'),
('»-l5OºL\æ†<ù','Swaziland'),
('ı\ò¡)‡J\õ7ùû‘','Tadjikistan'),
('\ğ¹:[ªnJ«\Ì\Ú\àCTœH','TaÃ¯wan'),
(':\\\Ø\'£Hi´&½E¨Q','Tchad'),
('™k\ÃvÁdMe…‹BAÂ½n%','Terres Australes FranÃ§aises'),
('\âxyv¯9EÎ–¸; G','Territoire Britannique de l\'OcÃ©an Indien'),
('§PBA\Öø{á°²d','Territoire Palestinien OccupÃ©'),
('ƒ\ç»Aª•{\àCs\Â','ThaÃ¯lande'),
('¯]ÆšŸ»G‹‰g…¤7W\ß','Timor-Leste'),
('Ú¥z\n²\ĞBÇ„ø¸\r\rœ','Togo'),
('7rR¤w_IÛºØ‡\×\\\Õ\ò\Ç','Tokelau'),
(',f\Z)I”\Ê\í\íP…²','Tonga'),
('\â—\ÈÆ’GĞ¾Ÿ~$ûs6','TrinitÃ©-et-Tobago'),
('pR\0Ó¨½L8Ÿ\"z>³–','Tunisie'),
('¸¶Ë`»LÅŒ\\Ö˜Q¾‘','TurkmÃ©nistan'),
('d\Â\ÙL|M§³J¹¸fI.\ë','Turquie'),
('œ¾¹E@\å¬\Ó³hz»\Ö','Tuvalu'),
('\ì¦\ö¢\ÂI\á˜\ÄUZ\ê\Ş','Ukraine'),
('©¥¬c„EŒv‚\õ%&ƒ','Uruguay'),
('‘ü7\ĞGüEË \Ó6M”ß°','Vanuatu'),
('Ç¼\èù­ÀOw\ôÒ»\ã\Ú\æÁ','Venezuela'),
('60}^\Ì\ÒI£\'N\äÑ‹\öl','Viet Nam'),
('\ô0ƒ\ç\ÏCÏ™\ç\0¸¹F3\Ù','Wallis et Futuna'),
('\Ğú˜\ÃD†FšªIû\Õ\õÁ™¤','YÃ©men'),
('*><¬ú³Mz¾Jü4\ç‘','Zambie'),
('\ï\å\Ç\ã\Í\×Aaº\÷z\Ç\Õ\î','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-06-14 14:09:57',3),
('DoctrineMigrations\\Version20240201152951','2024-06-14 14:09:57',1),
('DoctrineMigrations\\Version20240202084749','2024-06-14 14:09:57',2),
('DoctrineMigrations\\Version20240202150901','2024-06-14 14:09:57',1),
('DoctrineMigrations\\Version20240207105701','2024-06-14 14:09:57',2),
('DoctrineMigrations\\Version20240319212437','2024-06-14 14:09:57',1),
('DoctrineMigrations\\Version20240614133504','2024-06-14 14:09:57',8);
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
('L\Ë#zO0±ˆj­q´s_','root@gmail.com','Root'),
('¾m2\Ü#M¿Œfh\Ñ3[¼','hugues.gobet@gmail.com','Hugues Gobet');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
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

-- Dump completed on 2024-06-14 14:09:58
