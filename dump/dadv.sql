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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',259.99,'2024-11-03',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-11-03',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-11-03',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-11-03',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-11-03',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-11-03',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-11-03',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-11-03',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-11-03',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-11-03',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-11-03',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-11-03',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',1299.99,'2024-11-03',NULL);
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
('(\çTu×±LÄŒz§oŠ·¬','Afghanistan'),
('!\ÏDÔ¨sH®‡¿\ê8£s\Ù','Afrique du Sud'),
(';N\è§xNO‚¼C\õŠ[·­','Albanie'),
('Y_7\Ş~G\ë„$B\Ğ{†','AlgÃ©rie'),
('_LP\í\á¼A‘±»(ø','Allemagne'),
('ŠŸ\ò@»@“¶³“ø\ğıŠ6','Andorre'),
('\ìÉ©1C¥¯«E^Õ¶','Angola'),
('r\'®K\'C¦½š_¯£','Anguilla'),
('\ã\ÓAh\õ\'@½©³©´¿Q\Ê/','Antarctique'),
('\â±Š±\ğLÉ‘z\Â(!\Z\Ä@','Antigua-et-Barbuda'),
('\ï=¨\ßfD\r¤t9\Âà¼š','Antilles NÃ©erlandaises'),
('>Z#L™K¦ƒ\öu~İˆW','Arabie Saoudite'),
('\Z|c#@mEó¤¼?‚m\â','Argentine'),
('h–{	rOLÕ¥\Æû5>\÷v','ArmÃ©nie'),
(':\ô&Ÿ\éL  j–ùnƒ','Aruba'),
('\\\ç\å·\ßMXˆ\ë{\ä\Ö\Ë\ZM','Australie'),
('?\Øw¢0=Htµfº·«1şi','Autriche'),
('NRT«HPˆ<~\ö›´\Ú\Ö','AzerbaÃ¯djan'),
('\çMvr¶²D²E6\ó¼)','Bahamas'),
('_\÷]>vEO§5kk_F\ñ¤','BahreÃ¯n'),
('Ç®pS\"AL·\Îú£Ğ¹l','Bangladesh'),
('\Å\Ã\õ½O<œÏQ\é\Ö	\Û','Barbade'),
('|?:\rO¦Œ‚4\óÁÿ²\ì','BÃ©larus'),
('Œ·\÷^¢K7¼¾--	ø]','Belgique'),
('G¿ÉŠ7pJ‚ˆßšHU…eo','Belize'),
('\ãè¤”BvN\í¨\è~¿”4+','BÃ©nin'),
('’VùªÁ\0H¿u8º¸\É\ö!','Bermudes'),
('\Â^¥e€M%\ì\à2v\ò','Bhoutan'),
('H[2Åº0Hi„\÷\î²P]','Bolivie'),
('Ú—š§uM:ƒ*\ã\ä\å¹s','Bosnie-HerzÃ©govine'),
('\Ñ8-ºJ_‹3\Ò\à”“','Botswana'),
('oe4ƒ”GD¬¼ş™µmD','BrÃ©sil'),
('\Õ}=ø™£@#¯ANIo²N','BrunÃ©i Darussalam'),
('+\Û<\Ü,0M¾£\ï©û\Ï^','Bulgarie'),
('6Ø¬œ\Z@¶G=\ãÁ\ó\ì','Burkina Faso'),
('AG\İ\Ïa\ÙH°>5ƒ\Òp','Burundi'),
('\÷}jp rCÙ¶J\àÛ¨\ì²','Cambodge'),
('Jz\òÚŸD§Œ@²ûLŸ\Æ>','Cameroun'),
('<DrCÌ¬ÈšJ&š\ò','Canada'),
('¦;½g\ËA¿¢fF\Õ\Ş=\Î','Cap-vert'),
('©¢\ò¡C\0›—³\ë\ØME¢','Chili'),
('?<@\Ê*Ea©$\Í\Û\Òp\İ','Chine'),
('½\õ\ñBNÏƒ…\ÛÀ²]','Chypre'),
('*L\Î\ÕHIÈ§\æaş»‡%Ÿ','Colombie'),
('\ê\öĞµ\ÙBs‚\íÁ\Ö\ç','Comores'),
('ı‹B#\âFœ¤›_·\Zµh','Costa Rica'),
('š\àÊ†\Ü\\F\è½.4³»l\è[','CÃ´te d\'Ivoire'),
('[~:\ÔHë³¤Ñ“€£\åV','Croatie'),
('J Š¥\ğB\ë\"‚‚Òi','Cuba'),
('£’<ÿ?OE‰³­\à!|]´','Danemark'),
('ˆ(\ò…1F,·3æ«kX¾','Djibouti'),
('8\÷¸M\Ò%H2’Ù¬G<Q\"(','Dominique'),
('‘\îO\ç\Ûu@#€h¥JZÿûY','Ã‰gypte'),
('‚b¨$Dµˆ\Äfƒ>5\ğ','El Salvador'),
('˜JC\á5L®ƒûGZU','Ã‰mirats Arabes Unis'),
('\ã\è\æ&ŸDNÈ´\óŸ*¤£','Ã‰quateur'),
('\ç‚f=8B†\Ä`\ÒŒL','Ã‰rythrÃ©e'),
('\ŞTú7	H¥sÂ©¤u\×','Espagne'),
('m\Ü;Ú’A=†hŸ\Ï\Ö\ç','Estonie'),
('*„¶ŠcBª \Øû\ğ²FX','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('¡\æ\" Hs³jP\ìşmû','Ã‰tats-Unis'),
('¹\Âxá©¾Ae‚v9›8\ŞÀ\Â','Ã‰thiopie'),
('f›‚UM¡„#£Q²ü‘','FÃ©dÃ©ration de Russie'),
('pÙ¹7§AÍŒ?ø\á‹\0','Fidji'),
('…i€\Z \ÌG\ë°m\à9C\ä','Finlande'),
('h\èO\ßF¢‡ht7\Ù4 ','France'),
('\rYR\ë=M¤–Ø’Z–^\Ñ','Gabon'),
(' Z†\æ,E£‡W/ª\Ñ[','Gambie'),
('šnH‘À\òDßi6s\å/t','GÃ©orgie'),
('\'\ÔÄ•PAr€\×\Ñ\æn¸','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('³€¬N´G”½])J/œ;','Ghana'),
('<\ÙV>LÅ©™\Ø,hû\÷i','Gibraltar'),
(')f\ÑÚ‰sEd…8\êªS¿L','GrÃ¨ce'),
('\é–”«Gÿ‚†\Ñ/|A5','Grenade'),
(' “\ê°\ÔAE¾¦^\ÔCs\â','Groenland'),
('¾[b;ÁC\êª2nZ	','Guadeloupe'),
('\Å/ß›Î˜C ¼. \å\Íy\Ü\ß','Guam'),
('¼j]©nO\õ’7f›×©','Guatemala'),
('øY ¿)¾Mœ§\ã«\îvš\Ô','GuinÃ©e'),
('	\õOM”N9OO\áU\Óx','GuinÃ©e Ã‰quatoriale'),
('\Õ»0„=@E›oS\ã=b±¸','GuinÃ©e-Bissau'),
('@Á\æ\õE[¨°¿n€™_‰','Guyana'),
('‹Ÿ\Ø\ÃKC„Ÿ#‹Q€W½\Ç','Guyane FranÃ§aise'),
('m\÷N\ç†L€²ÿ g\ÍM>','HaÃ¯ti'),
('\â~a‘L\å±Uùp@z3 ','Honduras'),
('¡r\ôuH\Û@¢\Ó\Ã)±','Hong-Kong'),
('ÁvÔ›\Ô@S½\ó\Ì!\Åk','Hongrie'),
('g\ÍH3sŸC¿#ÁH\ëÍ','Ãle Bouvet'),
('_ ˆW€M`™¶¼¢¬\ÚÀ\Ï','Ãle Christmas'),
('4?©¨Ä³K·«2»3ÿX]','Ãle de Man'),
('¼»ú	[\ÃH’O\ëßƒ3UX','Ãle Norfolk'),
('Q›i¯\ÃüFŒ¼½w\Ü\Æ','Ãles (malvinas) Falkland'),
('JW{\'úCC ¯¾V\ï8\r','Ãles Ã…land'),
('o†7|]J£’k6À@¬','Ãles CaÃ¯manes'),
('^mú7\Õo@¢ƒg\â§e=\Z§','Ãles Cocos (Keeling)'),
('$FR\à\ŞBË¦ù\ï\æ­M\Û!','Ãles Cook'),
('\ókl}­HT‘\ïo!r<¾b','Ãles FÃ©roÃ©'),
('C\n›±BB_¿\Ä\ÂDù~\Ù\Î','Ãles Heard et Mcdonald'),
('8²I„G¾‘¾—ü\æ8\à','Ãles Mariannes du Nord'),
('­\å|\Ü(§B¤½!yM\ê]Nú','Ãles Marshall'),
('9\É\ÄÄªK\ä¡	¤#yO/g','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('\nf•\Z²Mª•‰R°\áx\ê','Ãles Salomon'),
('nj\õmG«\ß\÷›†\óxM','Ãles Turks et CaÃ¯ques'),
('\å\ÏşÊ°\ÉEÖ«/ÿk|\Â','Ãles Vierges Britanniques'),
('yıg\Ïp\ØLø¥Ã­\â‹Eš7','Ãles Vierges des Ã‰tats-Unis'),
('®\åP¥	\ğJÃ¯U@o…‘E4','Inde'),
(':Wn\òœAˆ×“³\ÔJC','IndonÃ©sie'),
('•ÒJÈ…K–³½\Ú`','Iraq'),
('‹i½\æ\æ\ŞN‚\r&‘€y3','Irlande'),
('™½‚2•OZ‡rxùs½|','Islande'),
('-o¢@M/N¨©L   ','IsraÃ«l'),
('\ğ•\É(2\ØE»³ĞŒŸ\ô\Æ;','Italie'),
('`S\á_Õ•@Â²Q\"p\n ÅŸ','Jamahiriya Arabe Libyenne'),
('Ã¹Æ®nrI«½û\öÑtZ','JamaÃ¯que'),
('i&\ï“R\ãH‘¨1\÷Q	C','Japon'),
('\Ä\İ]QıfBo¾Æ´\õl\âG','Jordanie'),
('\ß&o›LC›¾ a2r€“','Kazakhstan'),
('†Ñ9©\ÚHé®g•˜‚º\n','Kenya'),
('\Ú@<š€EY‡øc»/:£','Kirghizistan'),
('^F³\ÕiCª¹b¹“¨·½ˆ','Kiribati'),
('\"H\ÊP\Ş\âAl¢0¢\ØN¯ƒ\Ø','KoweÃ¯t'),
('\Ø)ÀÃ¤\É@$„\ÌTpq\ó\à','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('6K$ú\ÙLº\Ï¡’\İ','Lesotho'),
('Y‰š´¼\öO[¼.0²o\ÓV','Lettonie'),
('\â i©˜M¬ƒ‡ªVŒ\Ò','Liban'),
('\Ãg9\ñ­ùGíš\Ï\ö$¯','LibÃ©ria'),
('L5\ç§\ïOá‹“\×\ÔT­b','Liechtenstein'),
('ˆ¿\ö\õ(+H&¬\Ğ\ÌÈŒu\Ö','Lituanie'),
('?³¦[eDÔ¾Z\õ\ç\Ğ/K','Luxembourg'),
('	]Œ5”ŸBI¼\'!YW\à\"','Macao'),
('ú%ˆ†ŸŒA›Ÿ²Ì—“¡û','Madagascar'),
('\Ú\n\âÁ›\ÕF$‚\õ”\Î\í&›','Malaisie'),
('ú\è&\ÕüJ†²¶\Ò|\ñ¶T','Malawi'),
('\í+C¦\0\Êm\ğu0','Maldives'),
('ùÔ\Óü\åH½œ›“K.\Úf','Mali'),
('w\ÒwµB\Z„\Õ\'!œ¨\nD','Malte'),
('k–@@”BF\é\Ó\\','Maroc'),
('\ïlq\ô!C‰mÍ„\İu#','Martinique'),
('*\ö¸&\')O\r¸/¦\õW','Maurice'),
('K¡\çdšBI|¼ƒR³','Mauritanie'),
('2\í·‹J/Ÿ\ß\óÁE‹A‰','Mayotte'),
('\îj\ÄlŒaOG¡\ïGN+\â0/','Mexique'),
('€¬¯úµ»K½dwae','Monaco'),
('Ğ,eûI2·g&–…','Mongolie'),
('\Ç;3\ò@Å®l%¹©\Ä','Montserrat'),
('ºJŒ`¾K¿»\'°{t\Ø}','Mozambique'),
('¦(X^\ÇFÌŒ’\Î','Myanmar'),
('\è¡\"YL›?\rü¥\"','Namibie'),
('°¤l\Ô>H¢•Å¨/\ÉD‚\Ø','Nauru'),
('ƒ\ô¥\â‰Mê¨¥\Ú²‹|€','NÃ©pal'),
('©–\õ}¥BØ‚\Õ\÷p\Ê\ò','Nicaragua'),
('¥\İ\'ƒ\Î\çG¾K\öÇ£\Óg','Niger'),
('/İ¸\å»\ÌC‚e\İ\î¬P','NigÃ©ria'),
('~7fWCsˆ\è\Ï\Üi»®','NiuÃ©'),
('\ó\èl¹CA‡oü\Ù\ßsû','NorvÃ¨ge'),
('\\)Ô“\ì›C\n°”²J¬2-','Nouvelle-CalÃ©donie'),
('›?\Zz\ÓN@¥£\è‹Tıp_','Nouvelle-ZÃ©lande'),
('X3\ô\ĞË¾IÎ¬\è\Òe° ','Oman'),
('\ãEµ\ôœmI¹PH)\ôÿ','Ouganda'),
('e\Õ\'\ì>\óK\r½Ñªts0$\ô','OuzbÃ©kistan'),
('‹¤2\ïKGÿ‡8µ#‹\í','Pakistan'),
('s=*ƒ\ğ\ÄK’¦C½£‡À\õ','Palaos'),
('dnB\é‡9IØ†ID\Üs€','Panama'),
('M\Ó+x(\öH‹¤\Æ\èu\ä','Papouasie-Nouvelle-GuinÃ©e'),
('Qû«J\ícH½ll‰p','Paraguay'),
('[\"\ğa‹O·¶š\r7Q','Pays-Bas'),
('ø\"^\ÎEÓJ\Æ!\Ğy¹S','PÃ©rou'),
('2\Ñ%\óJ F—¦›7‹¸\é','Philippines'),
('¤E:6\õwMœÀ·ø)¶','Pitcairn'),
('K¤G~MÏª[»\ßi¥','Pologne'),
('\ÆË’$\óDj›N&=<\È\Í5','PolynÃ©sie FranÃ§aise'),
('gÕ¾y\÷)NL†’\Ï\Ö1\â\Ì|','Porto Rico'),
('x\Ì\Â\\JE¢\n‘§\ô¦ZA','Portugal'),
('¬ª”@mFO«Œ_¸»\ò=hE','Qatar'),
('¿‹\æ\rş_A´†/H\Ş¨‰q','RÃ©publique Arabe Syrienne'),
('%\Ârü­¤O¶«P\ëŸ\ópV','RÃ©publique Centrafricaine'),
('MRSa¡\ÊL)–>>‹y±\×\Ï','RÃ©publique de CorÃ©e'),
('53\î\ğ,EÃ¼©P@»ş“†','RÃ©publique de Moldova'),
('T\É\ã*7°NRºf\ô±mÀ>','RÃ©publique DÃ©mocratique du Congo'),
(' \ê*3q#E[€¨šV:È­','RÃ©publique DÃ©mocratique Populaire Lao'),
('^Œ‹\n¬tM¾<\Í\İ\à\\€N','RÃ©publique Dominicaine'),
('m¯¹¼?YNg…•¿\ê^\Ä\Î','RÃ©publique du Congo'),
('$€\ÖúT¸Fß‰º%0‚ıF','RÃ©publique Islamique d\'Iran'),
('9a)¨\àB2jK\ğ5\ë\ã','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('„Ÿ{@ßºEvˆ0Œ\ÇI','RÃ©publique TchÃ¨que'),
('‘mü\æÚ¤C\ï·ûŒ‹\Ş\ô','RÃ©publique-Unie de Tanzanie'),
('»\æ\ÌS\ĞB¿¤¤?ú˜†5','RÃ©union'),
('“\Ê\Ç\æ†FOÚ©3^\ÂU™ûH','Roumanie'),
('LCù|/RFK§´vWt-iÀ','Royaume-Uni'),
('i$d˜¤D{™d«à³‰ª\Õ','Rwanda'),
('PƒL\ÕÀlO\r€û`\Ã\Õ\â\ó','Sahara Occidental'),
('£y”p\ô‰L®~c\Şy#´','Saint-Kitts-et-Nevis'),
('p?4VkLH€!\Ğ\î)\Z \ì','Saint-Marin'),
('¿¥\Ã\rB0@§¤Ÿ\"G\\s\Ü\'','Saint-Pierre-et-Miquelon'),
('\õü<\Ë\ÔÿF\÷h\åø\Çr\óN','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('K¡\ÜD¼\'@_ƒ\îŠ\É\öB¤¿','Saint-Vincent-et-les Grenadines'),
('\ëX\ïL‘üJc¡“ü\åU…j\Î','Sainte-HÃ©lÃ¨ne'),
('ü=Y\nBJ†ºÿˆhª±\î','Sainte-Lucie'),
('\ñ¨\ÉqH G$ \Ò…\é','Samoa'),
('œmLŸ,F!¸AJ¿_¦a\ã','Samoa AmÃ©ricaines'),
('Œü«\Ì\ÕD–¡ä¡”%®x‰','Sao TomÃ©-et-Principe'),
('™^±h\îD©N\ç\÷!	\ì¡','SÃ©nÃ©gal'),
('É­£»§Ao \Í]„–\àp ','Serbie-et-MontÃ©nÃ©gro'),
('\Ş0°«VkGø¶aX2Ş¸\İ','Seychelles'),
('\æ\ö•¨¾MÈ½\Z~°§\á','Sierra Leone'),
('·#\ñQ\Ú-D˜n\ÆJS½','Singapour'),
('\ÜR\"ø\áO2‹¾¶Bú)…','Slovaquie'),
('\òº5\óJ†¹\Å\Ü?/1D\Ô','SlovÃ©nie'),
('F¦e \ÈE©“a°´¯\Í\Ö','Somalie'),
('\õ«z]@(ŸG;xÿU\Şf','Soudan'),
('5u\ÊWJ	¨\÷H\ã`»\ì6','Sri Lanka'),
('Yo\ç\éÂƒC\ñŒ.\Z\æ\Ç\Ó\×\ì','SuÃ¨de'),
('I.w3Ks«U€\ó¥¹','Suisse'),
('.\îù˜r[D„¶\÷+\á‚\Å[','Suriname'),
('ı\ÍR´6\ÅH“L´€T\É3','Svalbard etÃle Jan Mayen'),
('\'ONQ¾CF†¸¾:G´m','Swaziland'),
('™X\ïs\rAj˜®\\%ÿRY','Tadjikistan'),
('\ÄçŒ‚\é¿Iû¦††~\çQm','TaÃ¯wan'),
('mu\n})E\'‰6\'B\Æ.\÷;','Tchad'),
(']K\ğ©\ÆGG¼¯¿M0','Terres Australes FranÃ§aises'),
('-\ÒGµ»Q@µ˜D','Territoire Britannique de l\'OcÃ©an Indien'),
('Dú-K¬´HÃªd¹†w@º½','Territoire Palestinien OccupÃ©'),
('25z€®Nı—ü·\Ú|B','ThaÃ¯lande'),
('\ZÛŠDNªŠ\0½ÿ§','Timor-Leste'),
('1P\ØBj¿\é=½ÁÔ¿•','Togo'),
('•¢ZE\ğ(N_†C\ö+\Ä*E4','Tokelau'),
(':|¹M«OE3‹\×Å€´\ö\İ','Tonga'),
('¼ø\Æ\Ò\ö B…¾qARŠ…\ñ±','TrinitÃ©-et-Tobago'),
('\Ìz£ÉœºL6„\Ö\ÄK\ë’Á','Tunisie'),
('\àG0\İq@CÔ˜x\èG³\âB','TurkmÃ©nistan'),
('w*my&BGÍƒQX«m¢','Turquie'),
('}Â¸‚Ô‘J”„p\Ö\×1@','Tuvalu'),
('\Ğ\â3\ö©IŸ\ò\ê\n\ä\î¶','Ukraine'),
(':2ÂŒ€JM²\ä\é#®¾','Uruguay'),
('ùü+\Ä\ÃMß®wF\ë*lµ‰','Vanuatu'),
('µÁ\î0¡—I8¯L ©Z0³','Venezuela'),
('\ÏT(%_¦EÒ…¿p\î¢Ë´\Î','Viet Nam'),
('!ƒÁ?§A¤‹,\ò\ñš².X','Wallis et Futuna'),
('[.\ŞC»nD\÷¢‰ˆá¼’5Œ','YÃ©men'),
('İ¿\Ä1ŒOŞ–‰\Ã\0§§t\Æ','Zambie'),
('–w\îdS\ÕJJ±u­Ã·–€','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-03 18:22:14',4),
('DoctrineMigrations\\Version20240201152951','2024-11-03 18:22:14',2),
('DoctrineMigrations\\Version20240202084749','2024-11-03 18:22:14',2),
('DoctrineMigrations\\Version20240202150901','2024-11-03 18:22:14',3),
('DoctrineMigrations\\Version20240207105701','2024-11-03 18:22:14',2),
('DoctrineMigrations\\Version20240319212437','2024-11-03 18:22:14',2),
('DoctrineMigrations\\Version20240614133504','2024-11-03 18:22:14',10),
('DoctrineMigrations\\Version20240617165906','2024-11-03 18:22:14',8),
('DoctrineMigrations\\Version20240708061729','2024-11-03 18:22:14',12),
('DoctrineMigrations\\Version20240801202153','2024-11-03 18:22:14',2),
('DoctrineMigrations\\Version20240815153823','2024-11-03 18:22:14',2),
('DoctrineMigrations\\Version20240916065051','2024-11-03 18:22:14',4),
('DoctrineMigrations\\Version20240929091802','2024-11-03 18:22:14',11),
('DoctrineMigrations\\Version20241002164506','2024-11-03 18:22:14',8);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7','\É5?0O¤…€)\\¦ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-03 18:22:14');
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
('™d\å9ÿF³œÿ\Ö\Ñ¸·','hugues.gobet@gmail.com','Hugues Gobet'),
('\É5?0O¤…€)\\¦ZDQ','root@gmail.com','Root');
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
('.¥l5‹¹LnšI½y\Å\ñ7','™d\å9ÿF³œÿ\Ö\Ñ¸·','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]','Domaine Leflaive Montrachet Grand Cru 2016'),
('–J<¸_½Fx¥\Í\ãqÀ§\"','™d\å9ÿF³œÿ\Ö\Ñ¸·','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]','ChÃ¢teau Latour 2010');
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
('\îo;ÔˆC¾±ı½\Ë\nl','hugues.gobet@gmail.com'),
('\è˜NE\ÍDÔB\õ\Ä\æ½a’','root@gmail.com'),
('$m7\ÈÁ–@¼¨¨\ÇA\ì:','services.bottle_inventory@gmail.com'),
('ÏŸP5#\ÊJH¼]Å²_\õ_','services.tasting@gmail.com');
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

-- Dump completed on 2024-11-03 18:22:15
