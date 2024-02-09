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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','/images/bottle/caymus.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',259.99),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','/images/bottle/chateau-latour.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',999.99),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','/images/bottle/romanee-conti.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',2999.99),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','/images/bottle/tenuta-san-guido.webp','\îo;ÔˆC¾±ı½\Ë\nl','Italie',899.99),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','/images/bottle/montrachet.png','\îo;ÔˆC¾±ı½\Ë\nl','France',1599.99),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','/images/bottle/penfolds.webp','\îo;ÔˆC¾±ı½\Ë\nl','Australie',1799.99),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','/images/bottle/chateau-margaux.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',1099.99),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','/images/bottle/ridge-vineyards.png','\îo;ÔˆC¾±ı½\Ë\nl','United States',199.99),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','/images/bottle/cloudy-bay.png','\îo;ÔˆC¾±ı½\Ë\nl','New Zealand',49.99),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','/images/bottle/gaja.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Italy',899.99),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','/images/bottle/vega-sicilia.webp','\îo;ÔˆC¾±ı½\Ë\nl','Espagne',1499.99),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','/images/bottle/opus-one.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',1299.99);
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
('DDo¦o¦B‡<úœùıÍ¤','Afghanistan'),
('D \èœCÓ«O!>¿}','Afrique du Sud'),
('+ÿ+S\ß@Ì¥\×jc1QV','Albanie'),
('$\ÛY´F²´\ä+/¨\Ö\ï','AlgÃ©rie'),
('\Ô\òp\ã¯tN}|\Û4j\"','Allemagne'),
('i|ş˜M¨\ğBˆ¾}\ò4','Andorre'),
('Vÿ…û˜3L™ŠÇ©¼\öĞŒZ','Angola'),
('\×\î=:ÂŸF\ö™\ô*¿\ĞbÙ·','Anguilla'),
('g\É\÷\'7E•9±R«‹,\Ì','Antarctique'),
('\ôIw\Öú@ëŠ‰?Á(‰Œš','Antigua-et-Barbuda'),
('\ÉU–—\éªM„š§³Ê¤¥\Øı','Antilles NÃ©erlandaises'),
('¢@\Âş–±MÂ†~\Éy\Êwi','Arabie Saoudite'),
('œ±ş£­ A‘á¡¯ÿ','Argentine'),
('4\ã?4DÀJ¡€8¸R3K\×','ArmÃ©nie'),
('\\¶Ô©W\ôNiˆ‚L…eg','Aruba'),
('’‘¦	³L–µ)\ôµ\è(,','Australie'),
('\0\õ\Øø&µFì•§u\Ü\r‘2v','Autriche'),
('şGyO>šEº¥\ëë†˜›Q','AzerbaÃ¯djan'),
('\õ<ª\ö\Ò@İ‡‹-\÷U\0Nv','Bahamas'),
('L\ÛYv\à\ÅFŠ8ú³«\Û\Z\Ò','BahreÃ¯n'),
('A!S\é@¯D­H9z\Ô','Bangladesh'),
('¯noW\ZF\å\ò\óVjy;³','Barbade'),
('\ß[\\©¥O¶- \ÈyXtJ','BÃ©larus'),
('\îL\Ãjc¬@ ˆà½®³','Belgique'),
('e(2\ôş?C›™†Fg¦E˜%','Belize'),
('2\ŞÁQ¡\ÄL³\Ğ\Ï\Õ\'\Í','BÃ©nin'),
('†hu\â\ÊH°\Í[.?\Ï\ß\É','Bermudes'),
('†ƒ³\îDe¾\ï(nÌ£\Z','Bhoutan'),
('³\÷W\Úh\çGM¤a“©/\èB','Bolivie'),
('\Üx\å1±^L’\÷8üf\ÇØ ','Bosnie-HerzÃ©govine'),
('K”€PO\ã•9vn\ğÀV\Ø','Botswana'),
('\"E\ßÁİ¿L\roR6@,','BrÃ©sil'),
('Iƒ|Â”zF3ƒ\ñ\â²Â¨-n','BrunÃ©i Darussalam'),
('+¬\ò\rƒıJz™‡MES„ø','Bulgarie'),
('º\Ì\Â\ãÈ²Aá¾•-¥V\ÏtŠ','Burkina Faso'),
('\ä9€\Â\ê@¯‚~ƒÎ‚€','Burundi'),
('/AA&L_Œ\Õj\Ì%g]\Ì','Cambodge'),
('cwnµÊ¿M¯§K°£\È{','Cameroun'),
('A4Ú™€E¢¼\İAÏ¶š‹','Canada'),
('ù \í´\Ô@5–,y½j','Cap-vert'),
('6ˆ,7\ßB€š¡¢\ÎH\ÊK','Chili'),
('®\Ê\ç$QERˆ\\\õY\òºe','Chine'),
('\ô\Ó\ÖR„ùE\å€ÁAm¼\íD\Í','Chypre'),
('Q{i\æy»Iù·s¶\Ş\÷\nm\å','Colombie'),
('=,Kˆ¡;D$Š\İfÂ€&\ë.','Comores'),
('`?\Ò.XLH¸\Ù\ò\\^\í','Costa Rica'),
('¯Ç¢}8Kaƒ\ìn´µŠ´','CÃ´te d\'Ivoire'),
(';~N\ğ\Î\ôI0–²RŸP²\Ö ','Croatie'),
('\Ø~øš*_JŠ\í\ã\èD1V','Cuba'),
('{p\ÇE;›?ƒb\Ô\å)J','Danemark'),
('\È\Ô&HØO×”±}(ü\ÙC','Djibouti'),
('£’)\ÌN@²¥!U®','Dominique'),
('¬\0€¿TN¥?\÷m \ÔE¥','Ã‰gypte'),
('1\ëOd,1IÖ˜¹\Ş2|úa','El Salvador'),
('ˆ}u\áı¨IU!ÿ\ó\ö\Ô\è','Ã‰mirats Arabes Unis'),
(' ‰¹:E“h*f\öı\ìE','Ã‰quateur'),
('\éy\ôr˜m@µ—\n3Q\õ&QÀ','Ã‰rythrÃ©e'),
('(¯u\İ\ã5Cš¡\ínc!@u','Espagne'),
('Pƒ¥I†AP¯G´¾\ÎwV','Estonie'),
('×†f´H¢»¥d‹','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('\Úw_9ü!@š®ÿ†º)3','Ã‰tats-Unis'),
('F\âœ7	\îBy†F?&\ô\"<','Ã‰thiopie'),
('‡\\Q¤NN¶¸OÄ‘™ \í','FÃ©dÃ©ration de Russie'),
('¿ø>¦^GÁ¯U¤“/@k','Fidji'),
('cŸ\ö9\ïED»„\â\ÖD\ß\÷¢','Finlande'),
('±\ïTo\ŞTFy)p\×m¶›V','France'),
('W\ì@¼JË«j~½|w\÷','Gabon'),
('\Ùr=\Ğ\óµG¦º7ª\\\Â4\ô','Gambie'),
('\Å	NBµ\ÌO \åC7\Í~','GÃ©orgie'),
('\Ä\ìp?T@k¹¶R\×\×','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('\Ó\Ğ`H²Ğ¼nv¾µ\Â','Ghana'),
('®\0Æ·\ÈN‰‚c¾\ó\îv]','Gibraltar'),
('²;jf)J º¹šB©¡\ç','GrÃ¨ce'),
('–¶^rFC;§M\âT–z','Grenade'),
('k“&\ò|lO# R)­ùml$','Groenland'),
('¨\ëO°“G\Ò\'\Â\âCi','Guadeloupe'),
('>\Åù°L\òNL—¯\Ê4\àL\Í','Guam'),
('ci·ü¿9F	¥gm¡\ó\Ç\é','Guatemala'),
('‚\ï\ZüŒK›«#‹~I?S»','GuinÃ©e'),
('-ı<U\ßHø¹\ê›_\È½','GuinÃ©e Ã‰quatoriale'),
('ˆ4yo™Mz\ò\ßR•–\'','GuinÃ©e-Bissau'),
('%’E\ë\\M©¯<Ú‡e\Åg','Guyana'),
('û\Ôy/\ç\ÈOÉ»]\Ò\ã\÷ûŸ','Guyane FranÃ§aise'),
('\åÁ\Z\r¶¯Lµ¥û=°P\åU¸','HaÃ¯ti'),
('ÀÒ‹”\Ï\ÍNı›®‰…Ul\×\å','Honduras'),
('\ÛKc¢|D\õ«\"/3\ëº\ñ˜','Hong-Kong'),
('%Iû\ç\éqAÙ˜x|\Ø1','Hongrie'),
('\Õ#\Ò1–\àN¿”}º\ìLŸ\ò','Ãle Bouvet'),
('yw]™vB\ä¼^¢;˜Š\İ','Ãle Christmas'),
('Y\ô\"7²Mˆš\ÖZ@f¦ú','Ãle de Man'),
('6µ…@4]Cœ\ÚgAø<_','Ãle Norfolk'),
('\Û(½Ç¥@Ê¦¢z;i¾\Ï','Ãles (malvinas) Falkland'),
('6\å´%\ÕHJ¡¨±@R\Ñ','Ãles Ã…land'),
('J\Úú\ÕGˆ¨(gD-¬&°','Ãles CaÃ¯manes'),
('\Æ.\Ø[\ïCşšv…\Ñ	ºı','Ãles Cocos (Keeling)'),
('IœH¿nC¹»\ÈyÈ¶£','Ãles Cook'),
('¶ª|ù»L:µOn]\n\Å\ì','Ãles FÃ©roÃ©'),
('ı½Œ\ÅşMFå•OG\ìW\ï','Ãles Heard et Mcdonald'),
('·µıŒ[H\ì¾$\Ói\Ç2%‘','Ãles Mariannes du Nord'),
('£i0ü\ägH¡\õ\Ñ\"6 \'','Ãles Marshall'),
('\æ¤#\Z=O?••)-\Òµƒ','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('\Ü’›ÛšC\ô•‰|ŠN&Í§','Ãles Salomon'),
('Hû6;¼K+§(lŸÒ¼','Ãles Turks et CaÃ¯ques'),
('§ı\à•„Gì½’m0)!H','Ãles Vierges Britanniques'),
('\Ğn^üÓ‘@Ş­–©\á7ÿŒ','Ãles Vierges des Ã‰tats-Unis'),
('8\èHƒ\"\ß@Ñ¡$¨¶¾','Inde'),
('`?tŠpK\ë2|¼ˆ0\î','IndonÃ©sie'),
('\Úß»\Ä\Û@$ˆ	\Ûú\ÖÂ¶Ÿ','Iraq'),
('±1t\ä‹DĞŒ»\ë\nš\İü\ç','Irlande'),
('\Ço{\ö$ÀDuªW\ã\ëA[7','Islande'),
('I\â\ô;oH|Y§À<¬ú.','IsraÃ«l'),
(':)\éD\'¯_®\Ó\ìš\ó;','Italie'),
('•‰P\Ô^‘H¿Qz@ex)r','Jamahiriya Arabe Libyenne'),
('¢\Ë\ã\ÜTRF% \ãe¯\ÊÀ–\Æ','JamaÃ¯que'),
('\õq±ENEº\r\ô¥/R\á','Japon'),
('\ğ\êpşCN:…£• »´‹\ï','Jordanie'),
('\ßd\Ü\ñ\Â\ÎM…Yî¬´º—','Kazakhstan'),
('ST\\k\Ë/@2Š6:a¹\Õ!','Kenya'),
('\ØqÁ—\÷Fe›j…NE?\í\"','Kirghizistan'),
('ª\r\â[-XCä–’¨Ÿ‘r{)','Kiribati'),
('\êP	 -On‘¸\Ù3œ \Ó.','KoweÃ¯t'),
('~MùútN\\‡{Ü—J;','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('v\Ñ*M\ö›LŸ®\\v?','Lesotho'),
('[/\ã7ZIÕ«¿\æÑš²ˆü','Lettonie'),
('ım\îCM\"EĞ¦ª;8ŒR\Ø','Liban'),
('O{‡BMlÁ^,œ1','LibÃ©ria'),
('\'\ñ\Ü\Ã \ÇDû¼¥<ú\âi\æ³','Liechtenstein'),
('\Î	\ŞpOb¯*\\t\Üv+€','Lituanie'),
('}{Z\ÒJ½®^	f*s\\','Luxembourg'),
('VWaÒ¸K\õ%¸„~\ò,','Macao'),
('Ñ v\ÙTKV”&F5\â¡','Madagascar'),
('›\à™R¸\óM[­W”XVª\Ó','Malaisie'),
('+Ÿ‘\Ò\ÇM\è±>İÁ\×/','Malawi'),
('\Â\"LM\æ­Al§¥57˜=\÷Œ','Maldives'),
('Q\è‹ª\öIC¨˜”@t\Í\Ê','Mali'),
('\Æ¤\Û}D£€¨;¶µ\Ï','Malte'),
('\nü`\Îc‡LZ—dš£_c\à','Maroc'),
('q\Ã\Ì\ÅD”ÿ3ŒÚ˜','Martinique'),
('V²\×\áo›M¡\è)û\r„¶','Maurice'),
('ú}:3IA®®ªÁ&Ò¬š','Mauritanie'),
('\r\È\ÂÁN(€\ò…O\î','Mayotte'),
('8‰\ÚM<Š™\ğ\×ZÜ‚','Mexique'),
('º0‡HXH‡.\Z¿\î4','Monaco'),
('˜½&\èBf„\ô¨§b\ö·','Mongolie'),
('#{ûH\"AJ`¤7e\é\ğ©lø','Montserrat'),
('-\İ8\è]¦GŸ¾d]ı','Mozambique'),
('\õs\Èû·MÑ™\ĞN\ñ‘\ÉX‚','Myanmar'),
('b=\Ï\0¬M\ô¯w\íb\Ót’a','Namibie'),
('§AaMIØ¤Ÿ¯\Û+	F&','Nauru'),
(')M“\Ğ^cL»j‰†-','NÃ©pal'),
('ş®\Ü\Æ^[Ce‹K~\Åhş­','Nicaragua'),
('D‡M` #O§—i–\÷ø\ñ°­','Niger'),
('\Ğk\äH\ì+I*²v±—<\ês\Ú','NigÃ©ria'),
('/\ğˆ;¨H[…¬xJvª,','NiuÃ©'),
('”3`@’²Mk…ÿÇ¸\ë€','NorvÃ¨ge'),
('\ãsAS\Õ\âOeŒ; \Ç\Õü¬Q','Nouvelle-CalÃ©donie'),
('e\ØAÒIÈ 0o&p(\î','Nouvelle-ZÃ©lande'),
('¾ƒ…sEzCù¥œ>\îD¤H?','Oman'),
('\í\É$€J!°Ò¥;¢ü','Ouganda'),
('x°\0zCÇ«Ü±ø–­','OuzbÃ©kistan'),
('›f\ÑCÀN‰¼3%\ânÃ›','Pakistan'),
('nm\È\É@<£™*_(QØ·','Palaos'),
('dr	¸B}¡!DŒ$œ‰\Û','Panama'),
('€\÷¡\àœF°Œ\İ^˜¨^³‹','Papouasie-Nouvelle-GuinÃ©e'),
('iÁN&Y\ÆJ\é©ÿ-FıÀ©','Paraguay'),
('\É\ì¤\ô\n‡FÄ³J\îw?zı','Pays-Bas'),
('¹’kc\ÂùI²œ\ãh\çJŸ','PÃ©rou'),
('´)IıyH™F\Õ/\Öı','Philippines'),
('dºg\îbO‡‘5f\Ä`E ','Pitcairn'),
('ı<KzŠZzb\Z\åûp','Pologne'),
('j+¼jAM˜„f\'\ğv8\÷','PolynÃ©sie FranÃ§aise'),
('‰\õ\ñ*yLÿŠ5\Ù>‰R-','Porto Rico'),
('\Ï>¸CŸ–GşŒ›\n\î\ZƒŠ','Portugal'),
('¾PCW2!@²”\Z`sBU[','Qatar'),
('‰´\"¿nDF‚ü)!m˜','RÃ©publique Arabe Syrienne'),
('ÒŸ‡¾’¥N~cx9\×m\é','RÃ©publique Centrafricaine'),
('%\ğÃ½\ÉN:›ø¡|”=ü','RÃ©publique de CorÃ©e'),
('\Õ\r?\Zµ@\÷£¯B\ãœ\Ñ\çh','RÃ©publique de Moldova'),
('Sƒe\Øh@\ë†@¹ş2¡\ñb','RÃ©publique DÃ©mocratique du Congo'),
('©²§†¤˜H8™\å¬Ë³\è\n\ê','RÃ©publique DÃ©mocratique Populaire Lao'),
('ü¥l¢²C2›¦\Ë\òÉ‚M','RÃ©publique Dominicaine'),
(' i°/F¬\Ñ\Öÿ\ÇbĞ›','RÃ©publique du Congo'),
('½6\0º\ÊO¡A¡JB','RÃ©publique Islamique d\'Iran'),
('˜\ñ\ê\ÊD¥·ü3yA\õ9p','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('…@ıG\É$J`…1~BXª\ä','RÃ©publique TchÃ¨que'),
('Ô«p\Ü\ßşEP£Ü·z\ìP\ìZ','RÃ©publique-Unie de Tanzanie'),
('\"h\Ù\íWA·¸Ú™o\è\á\Ó&','RÃ©union'),
('uÿ<B]¡K®¤Õ{§Y\ä²','Roumanie'),
('–)¾`Ò‡F\rˆ‘QyÊœ7','Royaume-Uni'),
('hxJúmEØ©Ñµ=6¾9','Rwanda'),
('Ì˜P¯S°D}Š4²fL\ÑOK','Sahara Occidental'),
('3!Ã»Œ–CÜ¢\É[ª«°„\ë','Saint-Kitts-et-Nevis'),
('h\Ë3‚B\áV\Ûs9eü','Saint-Marin'),
('øOª[«HZ“5ı–_ D','Saint-Pierre-et-Miquelon'),
('\ßÚ±jF ‚ ±]%','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('HE/5\Æ\ÛI0•¹*n1ø','Saint-Vincent-et-les Grenadines'),
('>s½5WFl»\Ø\Ô8¬½Ÿ','Sainte-HÃ©lÃ¨ne'),
('hzøš>¡MM£vOI†\"H','Sainte-Lucie'),
('³NA}T^H¯„\Ø3C\ñÍši','Samoa'),
(',ø‡°}EM¾¡C\Ø\Æ±9','Samoa AmÃ©ricaines'),
('N\Û1HW”½a#=:','Sao TomÃ©-et-Principe'),
('He–•J—„¾\ãT±lA','SÃ©nÃ©gal'),
('l­YF\rEC“\ó³·','Serbie-et-MontÃ©nÃ©gro'),
('”	c¬nKGV¹èŸ²ü1','Seychelles'),
('diÿ5\ÌOy¡\ZeHF„\Õy','Sierra Leone'),
('!\ĞH‘™´B*š$g6)¤\È7','Singapour'),
('Q·¹XD«·‰±(E\÷','Slovaquie'),
('\÷øUfK\âœ\Í\ë\î0|','SlovÃ©nie'),
('\Ğ>H\Î2M´eVXSg¼','Somalie'),
('\Z\å%¼D6¦—=#¤;','Soudan'),
('\é-\åı\î\'G\Ó\Å×¿˜-{','Sri Lanka'),
('VwB+O¢O\ó\îü WG','SuÃ¨de'),
('¨D‰1M­C/KÍh','Suisse'),
('\r\ç¡ıykNJ³\Î%\Û\î\í+\n','Suriname'),
('\'b\ÔOÂ ©úSXŞ„\á','Svalbard etÃle Jan Mayen'),
('¹\Ï{\Zu\ÕO˜Š«d\×\"·4\ò','Swaziland'),
('\Z©:\ğ\Ål@Ú­\n½&oª\Ò','Tadjikistan'),
('T01 eyLú;w2![ş','TaÃ¯wan'),
('\0\éQ”]\ŞBª½T\í\Îw','Tchad'),
('•j‚ûB\í6ŠÂ•HK','Terres Australes FranÃ§aises'),
('b¶BüJÀ­½\Ã5 ¬\rH','Territoire Britannique de l\'OcÃ©an Indien'),
('\"(\õ\áÃ¹J¾‘}>5]¬\ß','Territoire Palestinien OccupÃ©'),
('\ìK\ìå’¬D£G\ïL\ó\î0³','ThaÃ¯lande'),
('¿MQù\åLg¡¬0\ì\å™\ßd','Timor-Leste'),
(' \éG„€¼\ô²b•','Togo'),
('5\Ğ\Ñ\÷\Ñ\ÆL\"µV0}­Z\Ü','Tokelau'),
('±`\ñüp\óC`¯ãš\Ê\ì\Å\Í','Tonga'),
('wE)\ô__Co‰<>#…³›','TrinitÃ©-et-Tobago'),
('˜EÁÔ­G\ì‹øŠ‡³UZ\ê','Tunisie'),
('y—2²‰OŠ“8¾9Ô‚','TurkmÃ©nistan'),
('!@\ì„\ÒB›¿‘:e˜\ê','Turquie'),
('£\Îi\Ù7MHµ¥­\Â\î­\Ğ&','Tuvalu'),
('#’D\Z\â;NÒ¦\åÜ«G2®','Ukraine'),
(',j§kkqLV i\àµ^2','Uruguay'),
('NŸ®n\rŸ@“–‡^\ßY\ÓG\ï','Vanuatu'),
('a½I§U\"DW‹¯\ŞF\ğ“\Û','Venezuela'),
('6¿E\Ö\ğG—‹]¥kn³','Viet Nam'),
('9…jüœ8O\ã…S˜LrÏƒ','Wallis et Futuna'),
('ˆ\Õ\ã\Ë	H<±4ªüs\Å;N','YÃ©men'),
('VD\ì\ÑjN¶Œ‘\êÀ\Ô\Z~x','Zambie'),
('ûC.ˆC¨„$\ÊN_v','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-02-09 13:33:03',8),
('DoctrineMigrations\\Version20240201152951','2024-02-09 13:33:03',4),
('DoctrineMigrations\\Version20240202084749','2024-02-09 13:33:04',5),
('DoctrineMigrations\\Version20240202150901','2024-02-09 13:33:04',3),
('DoctrineMigrations\\Version20240207105701','2024-02-09 13:33:04',4);
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
('\îo;ÔˆC¾±ı½\Ë\nl','hugues.gobet@gmail.com');
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

-- Dump completed on 2024-02-09 13:33:06
