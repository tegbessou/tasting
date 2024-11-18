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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',259.99,'2024-11-18',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-11-18',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-11-18',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-11-18',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-11-18',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-11-18',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-11-18',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-11-18',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-11-18',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-11-18',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-11-18',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-11-18',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',1299.99,'2024-11-18',NULL);
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
('X\ï?şAŸ¾®µ\ç\õ1','Afghanistan'),
('\ğ“1¯	,@1›*‘\ä6G©>','Afrique du Sud'),
('‚w›§ÕºCÚ¤\ë+2\ÄÀ^9','Albanie'),
('†?¶\ÃC¿D¹1ıÔ­\n\È','AlgÃ©rie'),
('üµk-H\rš\ë\n{\ä\ë\Å','Allemagne'),
('\Ë\÷„+\åùJD·»¤\î\ç!ü\Õ','Andorre'),
('	\\Ö‰·\ËN†`á¨©v&Á','Angola'),
('PÌ@ÿ‹%¿\r)TCz','Anguilla'),
('-\æ5¯Ñ¢CŸ©\î»b«/İŒ','Antarctique'),
('\ŞN\ĞxdTJ…œw\'Ÿ\ß\õ­‹','Antigua-et-Barbuda'),
('$\Ç\ğ\È‘Aï¨ˆYš\Ê(Ch','Antilles NÃ©erlandaises'),
('G•\ä\ÏÕ§N¢‰69	z23','Arabie Saoudite'),
('\Ì2\îJD¬\î\'³ÍœH','Argentine'),
('n´k<.)N\é¢\"\ÎcD!”J','ArmÃ©nie'),
('3K	‚\×@›şæ¨¬\Ò¦','Aruba'),
('œ\Ş\ïTOĞ™V\ÉWq\Å','Australie'),
('P¶„mÃµC+¢¡-×›Aú','Autriche'),
('HÍ’ÿC.VvKu,\È','AzerbaÃ¯djan'),
('X\ÆÇ¬K/“¯0R\æv','Bahamas'),
('»9L>x/DF©±\×Y¬\Ğ`','BahreÃ¯n'),
('_>\î\'H·`Y4¢‡½','Bangladesh'),
('‰\0W\ösL²‰wsq«¢ÀD','Barbade'),
('L-j¡0§DU©FB\ë‹>K\í','BÃ©larus'),
('\÷‡<D\ßMBa¿\×pı³\Ğ\ë','Belgique'),
('j\Ó\Ú|\rjN~¡\ñ_€\ÑF+','Belize'),
('\è)\íI5IN[¦]\ö{Ubeq','BÃ©nin'),
('f\ÌD ºWEÛŒ\ì\èÔ«\Õ]','Bermudes'),
('ı^À‰¥@\'‹Œ£\nx‡','Bhoutan'),
('Jc\ÅA§=C†³F~M\ì`“','Bolivie'),
('\×Á\n\İ7[C»¿fĞ¾e\n','Bosnie-HerzÃ©govine'),
('l\Ê\rı(Lt©­\ñT\ähk¾','Botswana'),
('J¹½\áÚ¼G¹SA\âgş','BrÃ©sil'),
(':\áúÚKEº4jª5¦!','BrunÃ©i Darussalam'),
('\0!-—\ĞFYºVÒ•Áhü','Bulgarie'),
('Kˆ*H\îM¥`¬Œ#\Ôp<','Burkina Faso'),
('‘7ZPKB§r\Å#Bk','Burundi'),
('™†£ (H\à¨xHfFŸ','Cambodge'),
('\Ş\ß\ÑY\î¿B~¢7\Ë\"\ì\ñe','Cameroun'),
('=«”\è\ÅL\ñ ÓÃ´Ş£','Canada'),
('\0B5x¶A` \È“\õÁ\ä\ó','Cap-vert'),
('üs0N\ôKû€Ù˜³¡g+','Chili'),
('}·\Zl\ÍAo®½¼¼=|f','Chine'),
('Ã“{\óE¹¡\î¯b>\ò','Chypre'),
('\Øüü‰\Æ\ZA³‰º\n0$i\æ—','Colombie'),
('¡K\ë¹G¨°	\÷3k@»','Comores'),
(',N\å}I0‰‡*üWMX','Costa Rica'),
('uS=û‡FÌº\'\r\ìx\Õxš','CÃ´te d\'Ivoire'),
('—£ ÀGMw­–_\Ë\ru,U','Croatie'),
('m\rp\ö´D\'¿1ª3}p','Cuba'),
(' ø\Éİ¤‘Jx‚“\ŞÇ½\ô','Danemark'),
('™²D:`fN7…WÀaÃ“¬','Djibouti'),
('¡i§ú@Ó¡§\ê¡\è¤','Dominique'),
('q·\Ô4B‡¦É¥gTş—\Ñ','Ã‰gypte'),
('şM\æİ™N‹‰\ç\r\î\ò3ü','El Salvador'),
('&\ë[w)E¸—y‰-ùq','Ã‰mirats Arabes Unis'),
('\àFG\Z\êNª®~\"n*¢Ra','Ã‰quateur'),
('\æ&\Û6‰­Bç‡Ÿ%¬‘Å’-','Ã‰rythrÃ©e'),
('83)M£¡EĞ`\Ûù\ò\ì\Ò\Õ','Espagne'),
('(j\ĞT\\pE2ºœ”à¢¢\à','Estonie'),
('0¿¥–\à\ŞJd‰\ï!\r–\ä','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('·\ã\Ï3LDh˜ \Î\è¢,}','Ã‰tats-Unis'),
('ÿ{Ÿ¤\ßGn–­\'û²]1\ê','Ã‰thiopie'),
('KŒ•\÷C1\Ö\òø\Ú\ì','FÃ©dÃ©ration de Russie'),
('e1\ÙÒšMN£¤+À”\çE','Fidji'),
('ı±$…N6E—µ¨.svš','Finlande'),
('¥d\Øf!\ñC–®\×\ñ6Q ','France'),
('\Ï5H\ÉJˆ©“\â\ãb\ñY','Gabon'),
('#´¼ÖŠ‘MJ¤\Ñë¸—e','Gambie'),
('Kq%•C›•q\Ş\0\\§<§','GÃ©orgie'),
('ú\É\Ş\è“iK?‡c2uUš','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
(' ¢\Ì\è\óO\á›\'£³$z¦','Ghana'),
('>y[—T4@Ø’qG\â\éQP','Gibraltar'),
('³\ö\áûDÃ½šX{~T','GrÃ¨ce'),
('	ø¸º\\ûM¦·ù\Şt\ÌvZŠ','Grenade'),
('$LL@\nlL˜’¶\Õ>\äjp±','Groenland'),
('?mC1CY¸\Ô[(L','Guadeloupe'),
('\Çz\ÏxHz†´\È7HN','Guam'),
('Zf!™\öJù©“©QM+','Guatemala'),
('Ì€s\ã[¦K”ï™X','GuinÃ©e'),
('w\ì„9\0H¥™:Y\àÉ¬‰','GuinÃ©e Ã‰quatoriale'),
('=\Ñ&sµûAN«©}D±','GuinÃ©e-Bissau'),
('w\ó\ò­„M\ó´ÿ\ÏüC2W;','Guyana'),
('Â«b\Ô\ÅB[²¤†ƒK¥','Guyane FranÃ§aise'),
('\ÌGƒ¡7¤Jj\çIˆşU','HaÃ¯ti'),
('v”˜GÛ¨ªPyıŠ©¼','Honduras'),
('ã¥¨\ñ;AÉ½™R\Ş }¾b','Hong-Kong'),
('\ñ›û\ÜVZ@?¬†YÜ¤¨”','Hongrie'),
('Œ\ç^l\áF*¶~\ò	pJ\Ì','Ãle Bouvet'),
('\Æı\æ^\âHª¨Uøa\õqÿF','Ãle Christmas'),
('¥[Jew\óH\ñ”\Û\ØÎ·$B¡','Ãle de Man'),
('L\ë‰\î1QM?¨#‡7l2o','Ãle Norfolk'),
('itÃ„§FŒ‘…O\ÌMG\Ø','Ãles (malvinas) Falkland'),
('‡°!\Èy¡HŸ?Ÿ\Ü\È\ã','Ãles Ã…land'),
('<\'\Ç>U@Ú°\\\Âi\ÏyT•','Ãles CaÃ¯manes'),
('3¾\ß\ğ\÷H8…i(Ğ¡›Y','Ãles Cocos (Keeling)'),
('F\00%ƒ–OÇ–<d\É\ì\õ¿','Ãles Cook'),
('\éf\óZD	»·ùÁ\0','Ãles FÃ©roÃ©'),
('ÿÛš\èIÇš\÷\Z˜u\ô\0:','Ãles Heard et Mcdonald'),
('¾À¦;šB²‡9u)%v	','Ãles Mariannes du Nord'),
('\Ñ9`\ÇK0³\Ó\åC\Ë^\è‘','Ãles Marshall'),
('DUıwXM|²\Ñÿ¡}½\Ó','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('­C\Ñ^r\'L¢¯\Ã{\ë`Q\ó','Ãles Salomon'),
('\ì¯Wh›²N\äƒ‹²(\ó','Ãles Turks et CaÃ¯ques'),
('°¯t©MÁ›ì¼ƒwM\\','Ãles Vierges Britanniques'),
('\Ù|ddUL\'©\ÑqfoB\É','Ãles Vierges des Ã‰tats-Unis'),
('<L\ß\Ô\ö´JÇ…¢\×À\í$','Inde'),
('u\Å3>{M¿9úù>\õ\Ô{','IndonÃ©sie'),
('h™yLA-©¶P\ñ°»\æ','Iraq'),
('\í#ÂŸ\îJ»5l…PÏ¬','Irlande'),
('`¶~¥\ĞD„„Yu;ŒÀ','Islande'),
('\Ô\éDÀbŸD4†øŸ7_^','IsraÃ«l'),
('\'J\ä\é;\ñJ¨´\×ûB	Àm','Italie'),
('\İ#\Û\0C[¤\ÏK\Õ(·','Jamahiriya Arabe Libyenne'),
('$:\Éa´Cu«F.Ø¿B','JamaÃ¯que'),
('‡†!\'gA×–g´\Ï\ô¦','Japon'),
('=\ãPR\òE]°²8t+=ƒc','Jordanie'),
('‹tx~•\ßKÜ“«\Ö\Ì\0+\ê','Kazakhstan'),
('ş\"@\õ\ã\ZH”¥Î¦(>\"','Kenya'),
('\ä¡\éy]DNøüK=3½','Kirghizistan'),
('D›‰ú\ØDı’\Ôıd-MC','Kiribati'),
('ivø\n¢K€wÁ\Êd®v','KoweÃ¯t'),
('š{Z—ŒL6¸bs\æ²\í?','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('¹\í\Å\ÍLÀ¹\'NŠ‚82\Í','Lesotho'),
('\é”\Ä\Ô\Ñ~M*±\ò3{E”q2','Lettonie'),
('\å\Ñu³\í8B £‡0ùS:%','Liban'),
('† š\ÄÿYGh³?Š­o\Æ¾','LibÃ©ria'),
('jİ\ë NAÄ½¶\ÈŠ\ö…','Liechtenstein'),
('”G\ğm\ÌA¢¶ÁY©W7\í','Lituanie'),
('vz¿@\äº	¤›-\ë','Luxembourg'),
(' : \Ë?4Eµ„X\í\ÊW$\"','Macao'),
('u\Ü=©ù\ÌEg¤½<\ßCQv\è','Madagascar'),
('9e\ğ\Ó<JÓù•ş\ÅE˜','Malaisie'),
('\Z\',\İL‡\Òl#]<','Malawi'),
('€4¬•I3¦/<•“}gL','Maldives'),
('Ÿ<Ad\îJ‡¡<\rLÿP¦†','Mali'),
('U,8®|Igœ ­§\ÔÖ‰?','Malte'),
('\Üã¹»µKB¼\á\ËÃ±gY','Maroc'),
('¤Ì„¨˜\ÎK®\ßø¬)\È','Martinique'),
('+\êt¦T\ÊL¹›Š`¬\Ùd§','Maurice'),
('Œ×­LŞ¡D¹‰|ú69N','Mauritanie'),
('hœ\naı\ÇNg¹\ôl‘¾0/','Mayotte'),
('“\Ù\\}n<I8 ÿ\ÃhA¡','Mexique'),
('™\Ê]•˜\×A“°¥¯ni×¹\İ','Monaco'),
('‰\åq‘™)J\ô\ÓU0o4','Mongolie'),
('\Ë£*wRC;\ğ\ÙA\Ş-','Montserrat'),
('\×\Û2Ë—\ßGï‰Œs•\ÚZ','Mozambique'),
('U2• /”@}–ûy6><Š','Myanmar'),
('b„¥‚±\ãMİ˜¡\ÌY\\…\Ó','Namibie'),
('¨6UO—¾~]©\ò‰L','Nauru'),
('q /›nDs\ZEªSı3','NÃ©pal'),
(',œ\î)B\îO‘Œ\õ““y/','Nicaragua'),
('\"e˜½¬$Lû¾f_\Ô\Ù','Niger'),
('\Ó\'\×B\ÜI\æ”\çL%*œTœ','NigÃ©ria'),
('\Ê,\Æ6N^–\rÖƒÈ«ú¤','NiuÃ©'),
('E­>ùK\'®\ì Ì–ŸD','NorvÃ¨ge'),
('eòŸ†ùA‰‰\Êz^kk\ß','Nouvelle-CalÃ©donie'),
('U\rd\áC¼±\ì%.T\è','Nouvelle-ZÃ©lande'),
('˜+~4\÷\õN¾«¯H¡¯\\0','Oman'),
('.»N-CKæ™»\ZF3·','Ouganda'),
('¤\áSo{Iº½H\ËW\÷','OuzbÃ©kistan'),
('³\ìs\Ğ$jCG˜·üİ»¼^','Pakistan'),
('\×&\Ø*\Ğ@· G\ÒiQÿ','Palaos'),
('“’ƒÖ»›FJ‡¢\Ò²\ã\è','Panama'),
('@¦\ï&¾D\n¡e,ErÓ²','Papouasie-Nouvelle-GuinÃ©e'),
('§\ÄU.Ú€K\n‡²\ôw˜<','Paraguay'),
('’\É\ÑB(YA\ç¹\ïu\õFU²>','Pays-Bas'),
('\ÖZ‰m\í\ÑB ¡#\Ç\è@_û·','PÃ©rou'),
('Û¬s$µTJ_²GPvø¥\ÂG','Philippines'),
('\åb\ó\å{G«•\Ë@»Dn‡D','Pitcairn'),
('\õ‚[f@²¨@Ÿ‹¬ş¿','Pologne'),
('%Š{©m\ÃGb›\Õ\ñd­\á\Çc','PolynÃ©sie FranÃ§aise'),
('\n‘Ôš\àK²\ö\ÊŞ±ü4¯','Porto Rico'),
('&Y¡\Ó.\éOÅ³¼\ô<\İrE¥','Portugal'),
('¶MI‘ @?–5±BQy\ôA','Qatar'),
('\ìÒ²`=LÅ™‚¤“x','RÃ©publique Arabe Syrienne'),
('‘\âuDÁ—®§†\ô\Í','RÃ©publique Centrafricaine'),
('q\Ö`EF°—\âÔºše8','RÃ©publique de CorÃ©e'),
('\÷8D7:N€\Â\"Š64?=','RÃ©publique de Moldova'),
('µ^4@F”¿\Øx\à6¶4R','RÃ©publique DÃ©mocratique du Congo'),
('„ƒ1€\Æ\\@‰«r~‡˜¾H','RÃ©publique DÃ©mocratique Populaire Lao'),
('/Š&®7F`’u)”»A','RÃ©publique Dominicaine'),
('’\ÇF€®@‡ŸÚ©G\Ì\Z%²','RÃ©publique du Congo'),
('59+<v›H,¯<Ø¦\öç‹‹','RÃ©publique Islamique d\'Iran'),
('oÄ¿;\â}I€‰\Æjx1¯‰','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('\'\Ìz›,\êHÃš\Î\í\ó`Br','RÃ©publique TchÃ¨que'),
('n*¢Ewœz,.½‚‹]','RÃ©publique-Unie de Tanzanie'),
('»\ÛSÑ¯G«pšL\×¾','RÃ©union'),
('Îº2·Ë€N‚¾%’ÁJ\á\ß_','Roumanie'),
('¢\n\Â6]C\é¡\'wW¸¥?','Royaume-Uni'),
('A\ÊkŠ¸K´\Å\ô\Å\ö\Ò\ä…','Rwanda'),
('Ï»\õ\ÆÂF¢»t+\Æû…A','Sahara Occidental'),
('½;\Êe\ËC2Â‚nE¢','Saint-Kitts-et-Nevis'),
('\ï/\0\n¨\íM¥³b!\Üs5(\ò','Saint-Marin'),
('It\Ì!¯–EÃ„­\íûdŸ\ä','Saint-Pierre-et-Miquelon'),
('û\Ü\ïK-BƒŒ:o}­”X','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('J}\ÚR0\òHG©\ÄV\ÚÚ½\Ù','Saint-Vincent-et-les Grenadines'),
('·F\æc³\æM\'¶\é@½N¾)\È','Sainte-HÃ©lÃ¨ne'),
('³\İ\ĞnJg¨-\Ş †2·£','Sainte-Lucie'),
('b©34\r@û‚¤øJŸ','Samoa'),
('pK¾RE²¯|ÁV\Í\ä','Samoa AmÃ©ricaines'),
('~PT\õ»rC§•\Z\Í\rŸZ;','Sao TomÃ©-et-Principe'),
('i\ğ\Í%§@ø¡\Ã\È&½¼—L','SÃ©nÃ©gal'),
('Ç„Á\çOÛªœš\ìPY\ìX','Serbie-et-MontÃ©nÃ©gro'),
('£c®\÷¥B~»ùP^¤¦¡','Seychelles'),
('‘{\óJ²\ßB½±’\íÀ-\ó','Sierra Leone'),
('É¨\ï:‡EØ›\ã{\'\Æˆ³','Singapour'),
('#`\ò‚\İIç™œFT–5','Slovaquie'),
('§\ö¦\İ<œLi;\ÈC\'…\Ó','SlovÃ©nie'),
('{sü\ÜB“•\ÓıŠR½','Somalie'),
('„Mµw@X¯\õú!¼’\Ê','Soudan'),
('Øºi\Æ8KO†?0¸Ot','Sri Lanka'),
('P„º\à³E\á—\Ì5SZ•','SuÃ¨de'),
('n<f.;\èI©™q\ó\íI \Æ','Suisse'),
('\Í.Ç”\íSL¡•¸\çO\Âz+ù','Suriname'),
('TX£$šN¦1’oI','Svalbard etÃle Jan Mayen'),
('ù\æ6W¸~Eù½®\ä\ğ\åÆ‡H','Swaziland'),
('©\è8\Ïÿ_Lz¡—#¯¨¯','Tadjikistan'),
('d”»\ñ°E¡™?²h`\\\õ','TaÃ¯wan'),
('d­\ô\ëlCs»’€°%‰¼Œ','Tchad'),
('\çE\'+%A0¹Ep¯\Û`\Û6','Terres Australes FranÃ§aises'),
('7C‚¥^XOü§+`øœ\àq|','Territoire Britannique de l\'OcÃ©an Indien'),
('F\\®®¤\íGYˆ)<\à\èt','Territoire Palestinien OccupÃ©'),
('!\İ@-JKd®Çƒ\'ˆMš@','ThaÃ¯lande'),
('‚\ó—›Fwœlù^\Ï\Ş9\Û','Timor-Leste'),
('†—#\ÇGŒ«~)W..j\Ë','Togo'),
('Ï½\äµ\È>F¬–\Õ\Ø•.¯','Tokelau'),
('—cª	\ï\ØMµ½« —¯\'…','Tonga'),
('^²w–}4CO’¸¸\ó~\Ê\ì\Û','TrinitÃ©-et-Tobago'),
('š[U5§,H «a\Z\Zd','Tunisie'),
('²\õM\õøGÉ£q–\ó½=±±','TurkmÃ©nistan'),
('t¶w\r\ÕC¼?«Y8S,\ò','Turquie'),
('M\Ô/o*_LÊ”J/\î\ôy5V','Tuvalu'),
('\ìF¤g¢D\÷¦‰\è\ÊK“\0ˆ','Ukraine'),
('¢\\µ\n¿(G\ó§üRmŸU\0','Uruguay'),
('³s¤Àt@Ö‹r®\0›Á','Vanuatu'),
('$\Ø\n‹\ç\éI>’ù\ê\ŞB\n\Ã','Venezuela'),
('\Ú\'\òO\é£\Í\Öc=^6','Viet Nam'),
('a|A¤‘‚M\'¹_+d1§²¥','Wallis et Futuna'),
('\ñ±•SªINW¦E¨`]“¹\ñ','YÃ©men'),
('ƒ\ö;\å\É\ŞNp¡¸0\ê\ô½\É','Zambie'),
('*¹\×ù¥Oƒ„ø»I_]ù','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-18 10:32:49',3),
('DoctrineMigrations\\Version20240201152951','2024-11-18 10:32:49',2),
('DoctrineMigrations\\Version20240202084749','2024-11-18 10:32:49',2),
('DoctrineMigrations\\Version20240202150901','2024-11-18 10:32:49',2),
('DoctrineMigrations\\Version20240207105701','2024-11-18 10:32:49',3),
('DoctrineMigrations\\Version20240319212437','2024-11-18 10:32:49',2),
('DoctrineMigrations\\Version20240614133504','2024-11-18 10:32:49',13),
('DoctrineMigrations\\Version20240617165906','2024-11-18 10:32:49',7),
('DoctrineMigrations\\Version20240708061729','2024-11-18 10:32:49',8),
('DoctrineMigrations\\Version20240801202153','2024-11-18 10:32:49',2),
('DoctrineMigrations\\Version20240815153823','2024-11-18 10:32:49',2),
('DoctrineMigrations\\Version20240916065051','2024-11-18 10:32:49',5),
('DoctrineMigrations\\Version20240929091802','2024-11-18 10:32:49',14),
('DoctrineMigrations\\Version20241002164506','2024-11-18 10:32:49',8);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7','\É5?0O¤…€)\\¦ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-18 10:32:50');
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

-- Dump completed on 2024-11-18 10:32:51
