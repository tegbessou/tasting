-- MariaDB dump 10.19  Distrib 10.11.7-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv_test
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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',259.99,'2024-03-19',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',999.99,'2024-03-19',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',2999.99,'2024-03-19',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','\îo;ÔˆC¾±ı½\Ë\nl','Italie',899.99,'2024-03-19',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','\îo;ÔˆC¾±ı½\Ë\nl','France',1599.99,'2024-03-19',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'\îo;ÔˆC¾±ı½\Ë\nl','France',358.99,'2024-03-19',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','\îo;ÔˆC¾±ı½\Ë\nl','Australie',1799.99,'2024-03-19',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',1099.99,'2024-03-19',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','\è˜NE\ÍDÔB\õ\Ä\æ½a’','United States',199.99,'2024-03-19',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','\îo;ÔˆC¾±ı½\Ë\nl','New Zealand',49.99,'2024-03-19',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Italy',899.99,'2024-03-19',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','\îo;ÔˆC¾±ı½\Ë\nl','Espagne',1499.99,'2024-03-19',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',1299.99,'2024-03-19',NULL);
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
('/±\à~L9G¸…iıB\ñ1','Afghanistan'),
('¶\Ï!\ßtBŒ¡s®\\B\Ã','Afrique du Sud'),
('\ál7H,N\nªœ±\Ü\Æ4\ñ©','Albanie'),
('\ë°“\Í)AŠ‰ \ç\Är\rÀ/','AlgÃ©rie'),
('.ıo\ÑcLHÄ®oN&Ò°\Z','Allemagne'),
('$\ó°\Ì\årN\÷t˜µ\Ã\00','Andorre'),
('\íCh.\Ş?M\èœga>>\è\0','Angola'),
('\ñ•\İ\Ç%mH~\âƒ<1„\rú','Anguilla'),
('1\Ô;\÷šAŸ‰½,¢\Z&m','Antarctique'),
('o>—@fE¤¶3^Y]i','Antigua-et-Barbuda'),
(')‰o,Ho–şF:¹7O©','Antilles NÃ©erlandaises'),
('\\„\Ù	\÷£M‘¿JÁ\na\Äd','Arabie Saoudite'),
('Û“ù}JJ%¥o?\à8Úµ','Argentine'),
('z“—¹²F”¸ÁŸ:|6\ñ','ArmÃ©nie'),
('\ì1Ê¾\Ü;H\ğ©=/I\Ü ™','Aruba'),
('G\âÛœ¡Hşfb˜³­','Australie'),
('ı\ÃOg-\ÎH¾‹ü&k\0\ä\İW','Autriche'),
('E&1}*\ŞA5¨!\ÄØ‡M9½','AzerbaÃ¯djan'),
('¥t¼š\×MJ‘†\ä*\â','Bahamas'),
('E7N\ñ¿O…)\\\Ô\ít','BahreÃ¯n'),
('…S¨¥F_B¹†VY¿ˆ“\ã','Bangladesh'),
('‹c\æ$œDÎ²şº\ëúû\İT','Barbade'),
('\\²\ÍO]²A§ş<I\Ë\0¾i','BÃ©larus'),
('p}{\04WG{¦X (T=·\Ê','Belgique'),
('†>§\ÅşVM.‡‘KOlG\Æy','Belize'),
('€ÿÉ†<MÂ$†µz2´','BÃ©nin'),
('<\ñ\Ï0\r\Í@\Z˜\nl\÷¼dU','Bermudes'),
(':H\nÊ²HxŒ\Ú4\Ğ9‚\é$','Bhoutan'),
('\Ş\ÉB\Ò\à\ñC¦4¹¹Œ»½\×','Bolivie'),
('­µû\Ù\æM­“\ô‹{R\á*','Bosnie-HerzÃ©govine'),
('¡›\'Ğ¦\ÃGÔ¬\Ä\ó\Ê ÿ','Botswana'),
('¼ş4ø…\ÍC]½\Ö\Ø”¼\Æ','BrÃ©sil'),
('˜u„}G\ÕE¨¤Ô¹w\ñ\È','BrunÃ©i Darussalam'),
('f]p\ã G€”\"?z™j\n','Bulgarie'),
('7€YTú§B­†eX¡\ò…\Â\Ğ','Burkina Faso'),
('i-®B\ô¨.Cb(\ÚW`','Burundi'),
('t\"\ÛO\0\öET©hD4‹ *','Cambodge'),
(']À¬\õÊ­N]£OŠ(rµ\Ü','Cameroun'),
('\ãv\çQG¿Ne-\õ¤p','Canada'),
('!N¢\÷˜ÀDùŸv\í>\Îq—','Cap-vert'),
('©5ÉD>H&§D^°Ej[','Chili'),
('\÷Ãº®\æ\íB 3\Ñ\ñ1\Ñ\è\Ø','Chine'),
('rVû}£@i§§+Ë','Chypre'),
('y\ğf\ñ\Ç<D\ñJ\ÂQ\n¤','Colombie'),
('‰Æ“»\âiJ/†\Ó\Û\òè™§ÿ','Comores'),
('z<n[2SJg€Ì NK8Ÿµ','Costa Rica'),
('¾±\àÊ¶N”¶EUKe“@.','CÃ´te d\'Ivoire'),
('U—¤XIÓ«ù|S§.3','Croatie'),
('\á6 Hb\ÔLD³\ë`\ÉOƒ}E','Cuba'),
('@D\ßR!0A`˜\rNl¹±F','Danemark'),
('Ù™.\àAœ¬\ğO¹\Ï.:j','Djibouti'),
('¶\ö¼I\õœDn\îµ.','Dominique'),
('$\ë\È\Ù\0\\Ad¬\Í\àpÅ¹','Ã‰gypte'),
('­\Ş\î\ÒMg°\âNM\ÎÂº\Â','El Salvador'),
('Rq\Û\é\Õ\0D¸Š\ç¼\è%\Ş','Ã‰mirats Arabes Unis'),
('¿q”¦\å/Ja‚7@ƒ%\Ä','Ã‰quateur'),
('I ¿\á†\âJµ;\Ó]\ô¯\Ò','Ã‰rythrÃ©e'),
('\r\ìd¡¿E ²ş˜b\0\Õm¸','Espagne'),
('\Â\İÀ\ĞG/‹@ˆ\\x$\Î,','Estonie'),
('X\Î\ïz«\ÑH·¯	P\èD','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('\n8Z7\ê@Ï˜\à ~Œa','Ã‰tats-Unis'),
('\n\0Á—H[ˆ²‘R9','Ã‰thiopie'),
('«‰†\æ\í¨J´	\â6 B\Ç','FÃ©dÃ©ration de Russie'),
('´-¥iC¥\n¸D°\ô','Fidji'),
('v\å%8}Oµ\ï-^k9J>','Finlande'),
('\ğ.Èˆ•\\JIœÈ™8Oµ\Ù','France'),
(')Œ‰\èvX@¼˜~\Â\Ó\Èg‹a','Gabon'),
('_\rã–L\äµj\Ì\É¢\â','Gambie'),
('Ï¿_cK%£\ä<:Ó¿!\Ó','GÃ©orgie'),
('tl89 Gg«F./²\è>6','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('r7¾T¡K±¡½8.1_‚','Ghana'),
('\Â\Ç\Õ3XK\nµ\Ë\æS¥†>','Gibraltar'),
('\Ó`h\Îc§B¹‘“x¦øoL','GrÃ¨ce'),
('xµ†\è¼L$¼a­AWxZ','Grenade'),
('ş\rm\é9AÖ¾K…\ZŒ1-','Groenland'),
('.¯C\ìF•¼pø4š†«o','Guadeloupe'),
('u‹­y\ì^J´<P™ƒÖ{','Guam'),
('q´\ñ\İ~K´œš±\Ë\ã\ğF','Guatemala'),
('\İ\Í6F³œ\âƒ\íK','GuinÃ©e'),
('\õ\0£\n9KÃ«\ëU\×E„L','GuinÃ©e Ã‰quatoriale'),
('\r\Ê\ìBSNŞ½\à¾\Å/­','GuinÃ©e-Bissau'),
('uFb~\Í\ÛB22,E\Æ\òQ','Guyana'),
('†DF\çú±Gâ³\å\ãºN','Guyane FranÃ§aise'),
('	n6p\rC°\Ğ\Şß´Y\ô','HaÃ¯ti'),
('\Üø\ó`Á\ëEP®k\Ìß«¸\Z','Honduras'),
('0\'7\Õ\ÍB™»%Ö¦J¯\re','Hong-Kong'),
('\ŞjüÖ³wM„®“D6\Æ\n°','Hongrie'),
('\ò¤\Ô?-Bˆ³\'\á\Úm@\ç','Ãle Bouvet'),
('}·“ÍºNœÙŠ@\Ö|ø‘','Ãle Christmas'),
('À®ed\÷zL\ã¬Àæˆ¤e¢','Ãle de Man'),
('š\ë\ë$\öyEU¿\ZG#‹{LŸ','Ãle Norfolk'),
('\Íú«¸¶ºMÎœ­^w\Ós\Ï\÷','Ãles (malvinas) Falkland'),
('§ºts\ÓNk¹\ô‡R\ñdt—','Ãles Ã…land'),
('YH‚\Ìi\ô@¶¶¹ƒ•\Z\Ö{','Ãles CaÃ¯manes'),
('©¡bZczN\ì¨7O\ò]ª','Ãles Cocos (Keeling)'),
('V\ËÎ’\è6C†‘“‰\ÔH\Õ','Ãles Cook'),
('\åD`+\á¡NÆ‡µ%W\Ô\ê','Ãles FÃ©roÃ©'),
('4±\éUnuN\0«3¯ƒ\Ô.v\×','Ãles Heard et Mcdonald'),
('´\òl\İjLE`qB??ƒ','Ãles Mariannes du Nord'),
('\ãƒ’\æ²O\ï™\Ã,R¥\Ò\ö‘','Ãles Marshall'),
('lš\Ø#°O3°.|ı29Æ¶','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('B\Ã¼O«ª¶SC|–\ó','Ãles Salomon'),
('ˆSÃ£\Ş@ÓŒ\Ìu\Z\äøY\ä','Ãles Turks et CaÃ¯ques'),
('¤!\n#¿\Ê@ı’»&D2„\Ã','Ãles Vierges Britanniques'),
('\õ2H\\6M\':W½Lp†G','Ãles Vierges des Ã‰tats-Unis'),
('ú\ö²ı46@L¶t\êØ …','Inde'),
('\İ\\cS¬üK‰\\•ƒ\'P‘','IndonÃ©sie'),
('*`€~g\ÍGÎ³­Îº«G','Iraq'),
('=‚v˜\ÆL\öf(-W¦','Irlande'),
('ß¹\Ó\'\rI¨‰3•·wûN','Islande'),
('“\÷`4ı®L¦½+]@\ğk©','IsraÃ«l'),
('\Ë\á²Å£\çJNŸS}\ğA\ïÁ','Italie'),
('‡…º\Ê\ãGÍ’\ËÎœ¤˜mş','Jamahiriya Arabe Libyenne'),
('dv\Éj¸L¼°u@ƒ¾','JamaÃ¯que'),
('¼\é\ì\Ê-J\ó¥¿\ôt\Zg','Japon'),
(';\Ëo\Â\ğF\àµ>\ß|TFc2','Jordanie'),
('Á;s4»\î@ÃŸ\ä}5–1w','Kazakhstan'),
('»\Ü\ï›sC5€Â¯b«$Æ²','Kenya'),
('\ó\Ø.\Ó\"H\í \É w\Ò\ñ°','Kirghizistan'),
('Q\î\ñkĞ¢M\á›9³5á•','Kiribati'),
('\×\Ç^\Ö\è›N—Œ\õ\Ç¼ƒ^0','KoweÃ¯t'),
('\ñ‚M\ÌDyIî ‡\Ö\'K¯\×','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('oı@\ËAEë¨´£•@´¢G','Lesotho'),
('}\ÎiQB%‚ş†F:F','Lettonie'),
('P]v‹ÿüJ\éªF\ß(\Û\Ú(M','Liban'),
('\Ìql8@¥³UlÀ`’','LibÃ©ria'),
(':E‚k\Ú2N²¹¬€@¹7J\×','Liechtenstein'),
('®›\rÇ…Gß´yè“®qD','Lituanie'),
('+­2\êLüµ´¶0','Luxembourg'),
('½]\ô]ˆFÊ±ÿx]\äZ>','Macao'),
('©xú°\÷FJ•š\ö\Î]2¥I','Madagascar'),
('§b\0\ñV’ADˆ‘}\ò]:','Malaisie'),
('ªn¬@¼? F\È\ÙH\Ï','Malawi'),
('*\×øÁ\Å<L†ÿ·\ò‡\Ã\Ø','Maldives'),
('\Å3£x\×A›:\"\ï`gR','Mali'),
('ùš	4\î:Cı¢F¸„\ß\Ø','Malte'),
('Úš~p\ß@±¯v\Â=\î','Maroc'),
('\ñN\ÉE=´ú$\õƒeA','Martinique'),
('\ò¬MD`†N	‹Op','Maurice'),
('D¶¦0I¥!Ò´T—','Mauritanie'),
('>¯Ò‚iOÈ§\ï©.z\×Ï¥','Mayotte'),
('–LÁ¥iH±GGd×Œÿ\È','Mexique'),
('¦J\ZFy¨Iœ _\Ç\Ó\rs\â','Monaco'),
('q†ƒa\Î\rH¥\é‹>\ìw','Mongolie'),
(']\Æ8)œB³k\åMÁ','Montserrat'),
('y›0I:J·ºí¶s','Mozambique'),
('g¸zı<SO` B‰\İ\î\n','Myanmar'),
('ø06‰b\õM ª\öR§*\Ù}','Namibie'),
('`p¬tD|¹\èL\ŞW‡\ğ3','Nauru'),
('cLÏº\ìJÚ†p\Ñ\Ğ3:Ò¸','NÃ©pal'),
('ª»+L1K\ì›X‚Ü–‰\Ó\0','Nicaragua'),
('.\ónE\ğCJ¥\Ô¸p','Niger'),
('\ê\ÇV\Ão@£°\è\Ó\Æ\Ü}','NigÃ©ria'),
('Í‰1\õ’Fù¹Æ±³;y¤','NiuÃ©'),
('+\ô~\ê9M*ª\Ú_\ğ\ã«@','NorvÃ¨ge'),
('f“\ôxšIk\Î\ä’Œ','Nouvelle-CalÃ©donie'),
('¥aL\r£I·\Ü]$7\ó*','Nouvelle-ZÃ©lande'),
('«\äügµO’¹„\ãl%8\n\ß','Oman'),
('û‰|0=½FY¿İ‘PcB-G','Ouganda'),
('«:B\0¼DT‚j}!\òeoI','OuzbÃ©kistan'),
('›\ë®F,K\0n;œ­\Æ4','Pakistan'),
(' Y£k\í¶H:ˆ\Øn<\ì»hl','Palaos'),
('tš\ìy\×uMœ¸ox¾7\ôX','Panama'),
('¦qb\ÌBıK\ï©`yPg\Ú¨','Papouasie-Nouvelle-GuinÃ©e'),
('ÁŒFbº\ÊKg©kú{K\ÇG','Paraguay'),
('r9wB·M	®¶V¹mÕ­¢','Pays-Bas'),
('ÁÇ‹\áºEM\åºeR°\Ê~','PÃ©rou'),
('½±&P•,@Õ€!—[rv‰\Ô','Philippines'),
('\æp=\×Ù—Ho\Ì%|b¤0›','Pitcairn'),
('[\Ãz19Jdš.Û®\é\ë','Pologne'),
('fh\ğ\ê@;¡‰]¹‚$\ê','PolynÃ©sie FranÃ§aise'),
('\âı\ËmHNıß‰\n°gh','Porto Rico'),
('|™¹\'€[Eu§™\ê‡\íN','Portugal'),
('!f+%>A>™OD ²¿A`','Qatar'),
('Š\ï	™ BH¡\Ğ X\Ë\ô','RÃ©publique Arabe Syrienne'),
('ƒD¡*šDUš›J¢\"Z¡','RÃ©publique Centrafricaine'),
('\éşŒu~D}Š\"…Œ\âg','RÃ©publique de CorÃ©e'),
('L\ó=\ÏJƒ•|\Ô\'\ĞSF','RÃ©publique de Moldova'),
('JJD\æ‹Hº–EPJ$v','RÃ©publique DÃ©mocratique du Congo'),
('&g!8L[E6‰\'À²˜\í\ï','RÃ©publique DÃ©mocratique Populaire Lao'),
('¬\î\"\ñ\ÕK-\à}J\ô	\É','RÃ©publique Dominicaine'),
('O\Èœ\ZE‘„¼‡µ¢†','RÃ©publique du Congo'),
('’u›/rE‹°G_×‚\éa\ô','RÃ©publique Islamique d\'Iran'),
('\0]\à\ÜdE\ó´\õ¢¶a+ª\r','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('Á\Øe¤_LÈ•Š\É[Gøš','RÃ©publique TchÃ¨que'),
('?üÀşÁ&Aá\á\ÙÂ½\ÜH','RÃ©publique-Unie de Tanzanie'),
('¸š°ÍŠ\åG”¾o\ìPÀPœ','RÃ©union'),
('\Ê[‡\Ã%O@C£\Ä2 …a','Roumanie'),
('<l™Ü’BÈ¹lü\Ï\Îk','Royaume-Uni'),
('5_*\ñV\öC\ç¦7¥F&S”}','Rwanda'),
('\Ñúß·\àPFÈ—¢&f¯€Gø','Sahara Occidental'),
('?ûn»«D˜\Ü\ëº0/,¦','Saint-Kitts-et-Nevis'),
('[5W¬\ğDÕ“=eª\Şl','Saint-Marin'),
('¡O‘¦´C”¼_ƒJ	^\ç','Saint-Pierre-et-Miquelon'),
('H\ç‰[\×B\æ©51¾\Ó\÷\È','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
(')\Ú\õzÿDvƒƒ‘g\â\É','Saint-Vincent-et-les Grenadines'),
('d‘\Ê\È\Ì(@Ï¾\ë0‚­R','Sainte-HÃ©lÃ¨ne'),
('\è\'‡¬ E·©I0\ÚÃ‰','Sainte-Lucie'),
('\ókT\ÏSF¾pvA\òD¾','Samoa'),
('£\Z[\äIKĞ€ELPg\ÇN','Samoa AmÃ©ricaines'),
('‡¿W¬\÷\ÂKş¿”\Í\ò-\ì\×','Sao TomÃ©-et-Principe'),
('¡(g¤¯Cšj6˜=\ã\n','SÃ©nÃ©gal'),
('3	\áŸ<LK©·*…„ŸÄ‰','Serbie-et-MontÃ©nÃ©gro'),
('œm\÷`dE‡¹p1Ášw\İ$','Seychelles'),
('\ÉkÙ»c\ÕN’…\÷[\Û\Ğ9>E','Sierra Leone'),
('¼MqrŠ\éCqı\İLo\òG','Singapour'),
('Y[&™GCJ±.Á3EYª','Slovaquie'),
('\ïª\ËB»Hc\àr','SlovÃ©nie'),
('!—\Ñ\Ó\õ½Få»¡*æ¸³\Æ','Somalie'),
('\ïe¤0/OÀšrd\Ø%OB\Ã','Soudan'),
('Xj¯TK\Z¢s^\Â	±1','Sri Lanka'),
('“\Ê\ékD£ˆX8v','SuÃ¨de'),
('‰K\ËN­D%¹n¼¿m³R','Suisse'),
(' \ó\ÒC©½@$Ÿj3€šX\"^','Suriname'),
('V’ø\ÊLÆ§¿x•¥c','Svalbard etÃle Jan Mayen'),
('H\ö\ã%ƒN¹§¯\Õ@8','Swaziland'),
('@…\÷@\èK8´>h\ë	;','Tadjikistan'),
('¯™[©\ë\ìL¼‹\ËÍ‚\rk¼','TaÃ¯wan'),
('\Æ5m`HÃš¬›†­«s','Tchad'),
('—×†ü­Jà£¡±Ü“»\ô','Terres Australes FranÃ§aises'),
('\nÜŒN)‹B%Œ\ÑûRı','Territoire Britannique de l\'OcÃ©an Indien'),
('4p\ß\Ù8!FÑ‘\ä	2ı4>','Territoire Palestinien OccupÃ©'),
(']\Ç1< d@ş‚Ä„/Ö ','ThaÃ¯lande'),
('\åA\ÄLÁ´9½vUo\æÿ','Timor-Leste'),
('e¦Kú»\ŞEN“9p\ãT\Í\ä','Togo'),
('A( vA˜ „Õ³½\è%Ÿ','Tokelau'),
('|ƒ4u{eD§šr{;z.K\Ç','Tonga'),
('­…¤=‹IÕ‡¸€UK\ãÀ','TrinitÃ©-et-Tobago'),
('F/†\\xø@]8Û’ÿ]^','Tunisie'),
('IO\ĞF€\ÅJŸ\ê…j°Ú«@','TurkmÃ©nistan'),
('6u #rKÖ¤£-¤\íA','Turquie'),
('£\á›üOR ®\Ûù\ÆO]\ã','Tuvalu'),
('\æş\"0E½§\î#4\\b¼X','Ukraine'),
('\ÑQ±\È~´E„«\Òÿ`ü€©\ì','Uruguay'),
('\á€$\×D3ƒ\ê€ı\å\İ\æ','Vanuatu'),
('›Z\ÉL\íF”?d\×Û¢ú\æ','Venezuela'),
('¦b^^\áI£D^…˜','Viet Nam'),
('+t~¢\ì\âB=”s/aÀ\Íb\Ù','Wallis et Futuna'),
('8•i\ä¦D¦\ö\È\Ú','YÃ©men'),
('=\à±l?\õD2­ƒŞ™qŸ¨\á','Zambie'),
('·y\\.øjF§\ï˜&|‚\ã','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-03-19 21:25:40',8),
('DoctrineMigrations\\Version20240201152951','2024-03-19 21:25:40',2),
('DoctrineMigrations\\Version20240202084749','2024-03-19 21:25:40',4),
('DoctrineMigrations\\Version20240202150901','2024-03-19 21:25:40',2),
('DoctrineMigrations\\Version20240207105701','2024-03-19 21:25:40',5),
('DoctrineMigrations\\Version20240319212437','2024-03-19 21:25:40',3);
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

-- Dump completed on 2024-03-19 21:25:43
