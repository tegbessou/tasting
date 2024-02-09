-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv
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
  `picture` varchar(255) NOT NULL,
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
('\ï–\í\ä»L—¢—Ì“\Íbø\Å','Afghanistan'),
('Ô‚®\êDFIšVÿP‰^j€','Afrique du Sud'),
('{ø4~G±½\×ú\ô\Êx-·','Albanie'),
('\rk„\ÂB =\"µ8“\\','AlgÃ©rie'),
('&8%D\õAX“Ú§$‹\ä\òˆ','Allemagne'),
('~·l\ô\ĞF\á¬[º“\Ñ','Andorre'),
('Á\á~³`E€¡¬$™8\ë','Angola'),
('³—ù	şvOR´3M\ä]C','Anguilla'),
('\ÈÓ±g˜E\î²Àj\Éé¶¶‰','Antarctique'),
('°V_½”\ìG˜X^û€\'F','Antigua-et-Barbuda'),
('­¾W\ßr¥M»hrP3¦\Ê\Å','Antilles NÃ©erlandaises'),
('\íU\Òpu‡OC\îHS6_ƒ','Arabie Saoudite'),
('\\\Ô\æ?\ä!DU§À­‡\rÒ³','Argentine'),
('w_Hj ¡J²V\Ú	VBL','ArmÃ©nie'),
('rÁ|]C0‡\õL—z\Ç/','Aruba'),
('8Ô¾\ÅQ!Mı°¤Jmr','Australie'),
('\ÊÌ§\"\ò\ÙG‰œ\ò€Çº£¿','Autriche'),
('?¼0\äHü€ZC½\â¦ÿ','AzerbaÃ¯djan'),
('~ScX\ÏFÏ•\Ë\Ç@\ö¿[','Bahamas'),
('‚\ô† OÇ¥\Å\â0z\Ãq\Ò','BahreÃ¯n'),
('™ŒY\ë¦\ÖGQ¢§lÎ¥\ô‹¸','Bangladesh'),
('Š\Â2J¨«ß,\ñ*#','Barbade'),
('…¥\Ü—\ÙA£B7\á¹d±³','BÃ©larus'),
('¿\ŞXxHÏ…\Æ\nÚ‡\éCú','Belgique'),
('\Ç\Ò\Ã\ÚsB|½§!ÿ&\Ås','Belize'),
('	\Ç%³©B|‹\Ä0Q‹^g\Ñ','BÃ©nin'),
('\ÖSu\ÅZ>J9“Ãœ\í^%`´','Bermudes'),
('©rUHZA\'•\Î>¥w+_T','Bhoutan'),
('ß¡\ã<[¡E§|\nC×›£','Bolivie'),
('\ÕÂ¹0½\ÄIF™¬\Æ[wÿ—','Bosnie-HerzÃ©govine'),
('x:Z—\ÄE\ÏT\Õ;','Botswana'),
('\Ö6\ô«-\áH#¼#ª\\\ËıO','BrÃ©sil'),
('`e{ hB®©\õ›IL\Úü\Â','BrunÃ©i Darussalam'),
('o±\Ò\êoO½¸z|°=CP','Bulgarie'),
('´}ÿ:ş.AÁ†	\æ¢\"uO','Burkina Faso'),
('œE%œJ:³¨Š-<­,\Â','Burundi'),
('N\Äíº€Cl¬_„p„cl·','Cambodge'),
('¯<ƒ\ãz¸A¶²¡\Ì\Ó!™','Cameroun'),
('Án©ø¬\òOş›\Çv\èC€\ÅA','Canada'),
('\öt\0/\óI—…Èşd\ÑÛ¶','Cap-vert'),
('…w3lG\ÅA$¥§\ÙW>R\ì\ö','Chili'),
('\Ğs\Äù¦®G)›ºIM“Ô¤‹','Chine'),
('”\"u¨\ò\å@Ç„‘VÕ ¬\×w','Chypre'),
('^\ğ\Öb\Ü@\åº&\Z\×e‚³','Colombie'),
('\Z{+g…@Ñ”/lJ](4\Å','Comores'),
('\Î\Ær’G\è¿~O›‹-','Costa Rica'),
('TÃ¬\ß>H¹¬ [.¹ùT','CÃ´te d\'Ivoire'),
('\÷EY\ä‰vM“„2*','Croatie'),
('1¬l¾®JĞ¬»\Ú,\ÄÜ‡','Cuba'),
('$šø²Õ´KÙ©€m%Ñ¦1\Ø','Danemark'),
('%Q­€G_Š\Ñ|U§±4','Djibouti'),
('€ø GH”†’L+\ä‘','Dominique'),
('w\ËQš«·By°ƒW–0)X<','Ã‰gypte'),
('\æL\õüjDû£cş¥iŸ','El Salvador'),
('‡b [RII­1—\Ä\ÃJ\å—','Ã‰mirats Arabes Unis'),
('\ã¹@<wªB—‚ \r»uÑˆe','Ã‰quateur'),
('¸\àª`øÿG\å§Ì›	GrY\ç','Ã‰rythrÃ©e'),
('\r	>3HH¥£9¢}\Ôı','Espagne'),
('Îa\à^…FÁ®ƒŒ•x¡,‘','Estonie'),
('¨üE\òD–‹s¤anš<','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('‘AËšÀVCü‡1\İC','Ã‰tats-Unis'),
('°p\÷~\ã\ÂHI¤y‡\Ì\á6¼','Ã‰thiopie'),
('P\ëK‰•µJ§—“À\ÜG¨š\Ô','FÃ©dÃ©ration de Russie'),
('*˜\ğ\\UvEÁ·i\Ú™­','Fidji'),
('bN´ 9Lù¨\ÒMY\â€A','Finlande'),
('ş\âx6Oø”‹¤\àBË”','France'),
('`\Ë!y\ZcO\õ§’•A\Ú\÷','Gabon'),
('\ç\Î\İÖ›UN+¢ˆ\Ï4\Z[','Gambie'),
('@DTcûM@¦D|“‚\Zp=','GÃ©orgie'),
('´ùJ¬AK‘¼…šÿÙ›','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('Á¶_]‡$A²“œÓ“\Ãÿ(\ç','Ghana'),
('¹U@übDÂ‘\Êd\Ô\Ì\Ç\Ùl','Gibraltar'),
(',N\ĞßŸfA?ƒ\Ã{Ä¯\ê8J','GrÃ¨ce'),
('+7\ôl\ÊA2°\ß!\ÎB','Grenade'),
('{ì˜ˆzAŠ²nÿq·D','Groenland'),
('H:©­›YHŠae§aZq','Guadeloupe'),
('0\ñ#™Ş’GZ“sa\ñB\âW','Guam'),
('`–§¾prD\n7£Ÿ¥\Z\ÂZ','Guatemala'),
('€˜\0ƒWEB–‰\Ø\î\ó©\Â','GuinÃ©e'),
('½~=)ˆJœšÉº\ô\Ï\Ôv','GuinÃ©e Ã‰quatoriale'),
('lº6´aK·”ro\ÑRWº','GuinÃ©e-Bissau'),
('¼\İ\îK\çJÎ«pß¸:_','Guyana'),
('H…QUùBE‘`´y9\Ë','Guyane FranÃ§aise'),
('qw®j$L›‚$‘:ı_~','HaÃ¯ti'),
('\åÀm«ŠB,»k»#~G\ã','Honduras'),
('1‹×¼(5F\0s.\éI°—','Hong-Kong'),
('Š\ÑO=\ÉfER¯ƒ©»~R','Hongrie'),
('FŒWM\ÙB‚£µ\İ\òdŠ,','Ãle Bouvet'),
('lÔ†¡1\ÕF¸¸ ³À\Æc','Ãle Christmas'),
('m\ë‡:ùM†¶J\éİ•·Ÿ9','Ãle de Man'),
('\â¥ªF—¬\Í\åg\Ğa©','Ãle Norfolk'),
('\ì\ŞùT0N_·\'†\ĞKc\õ','Ãles (malvinas) Falkland'),
('rÅŸzOOa¨®…®O‹£W','Ãles Ã…land'),
('”2‹V$?L¢•ÑA`ÁÀ','Ãles CaÃ¯manes'),
('Ó‹e\Ù.K¢¦\"®T\ÆR\éi','Ãles Cocos (Keeling)'),
('­\ÖuJ_I\r–¯H\n[‚7','Ãles Cook'),
('3Rú\İÿ‹KÇ¯oŸ\İ:Mû','Ãles FÃ©roÃ©'),
('û\ã}º-\äEeŒ«hXU[Á','Ãles Heard et Mcdonald'),
('78jºS\åH<¹şqY\Ç?\Æ\\','Ãles Mariannes du Nord'),
('¯›n(ºD©ü+\Ï\ï','Ãles Marshall'),
('+H„\Ë+Ht™ˆv­¥¥\ò','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('ÂŒA£\àA€½o\İ;1S','Ãles Salomon'),
('\'\êş2³Gl¾s™\"¥ùø\ß','Ãles Turks et CaÃ¯ques'),
('\ÅSƒ\r\İD{€$”?y-','Ãles Vierges Britanniques'),
('Tş7\ìÁ”Hk•\Õ–ª\ß\à','Ãles Vierges des Ã‰tats-Unis'),
('\ŞCD9AE–\õ\âQD@¶\×','Inde'),
('m\ë\'\÷†\ÖMJ…\Ã\ê4j\r4','IndonÃ©sie'),
('xÒ‘ˆ>E.»\İM¦H2ÿS','Iraq'),
('\ô£7\è6$F¨“\õ\ö;Gr:\ò','Irlande'),
('‚y]úsRF©\İDAŠØ¿\á','Islande'),
('fF…\Ó\Ò@k¹\òO>x\ó¼','IsraÃ«l'),
('sÆ·Fæ§·˜\Ö0Ë‡¢','Italie'),
('V$u\"1\ËL\Z²{©\ë‡èºŸ','Jamahiriya Arabe Libyenne'),
('|\ô„\õ?AW…\Ôo„×„','JamaÃ¯que'),
('\é\î\ÛLGŠ°\ÑY\ï 0','Japon'),
('\î\â¥u\"Nû£ıœ›ƒ\ç\ê¸','Jordanie'),
('´\Ö%\ÓSO¥§\Æù°˜e\÷','Kazakhstan'),
('`	¤™Œ\íB±«ÍŸ°','Kenya'),
('ÿ9V\nFT¦ûNKÉœ:\î','Kirghizistan'),
('ªAV\İuGE@†\ô¤E\ñ\ğ²','Kiribati'),
('O/¨\ìJ›J±·¤ş®\'¢‹®','KoweÃ¯t'),
('ıùU\év¡CXƒ\Ğ\Ò\ÃAC—w','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('_±ù¾û”HÇš^£\Ô8*Oc','Lesotho'),
('ÿ TR¬G­°\İ+TÁ”·','Lettonie'),
('ı\ÜÚ‘JPEwO	$eû­b','Liban'),
('bŒÊ¿.AL z<\Èu\Ø','LibÃ©ria'),
('x\Äx\' \ÃO7ŸFs#ƒs8','Liechtenstein'),
('%\óY4Hòš”·\Åi{§¨','Lituanie'),
('\ò*–fù\çHB²œÃ¾ù6','Luxembourg'),
('\Ö:O7VI\ğŠ˜jç‚§','Macao'),
('™Ot\Â3F¶˜\È4\ğÁM\Éÿ','Madagascar'),
('8ßƒT\ÑI(½#•\Æ\Ùq9\Ğ','Malaisie'),
('\È,`‹’¼Oºº¦Kç¦‡','Malawi'),
('®{“’9\ñA_ jŸC~¢N','Maldives'),
('Z–Ó*@Œ\Ç\'mÜ›','Mali'),
('H\ÅÿF\àSIÄ€ß§v”£şy','Malte'),
('ª\óO4$™H­•\ÒÙ¤¶z¯','Maroc'),
('%\æMM\ÃN\ã˜zO\Ê\rüıe','Martinique'),
('N©Ìœ† B_ŠªU\Ä{³@\÷','Maurice'),
('\ã\÷IT|]L\ğ‰‹\ÖO\ó\Õq','Mauritanie'),
('f[“\Ø*J{·¹™ÿÊ>\Ô','Mayotte'),
('C¯©\Ç\rE˜¡\év¯”\Ò\á','Mexique'),
('Wz\æÀT„NŠ‹\ôoÙ”ÿ\Ç','Monaco'),
('^A\ï\ÂLF‚;ÿï«­','Mongolie'),
('ùœdZIŠ¥•²ma\İ\Ó\È','Montserrat'),
('¹Tt:³Aª±\Ó1\Îo','Mozambique'),
('šÖ‚H}Oš\Ç\'\Ìy‹','Myanmar'),
('•>X\0\Ï9CÎš ¢4np','Namibie'),
('Ì¯OJ¿F³¿„X—‘\Ò','Nauru'),
('#‹6j\÷Hnµ—!%\Î™\0','NÃ©pal'),
('\0!\Z›J—]6_¯','Nicaragua'),
('ŒùºA,¥B¯¯\ÚO!XFØ©','Niger'),
('2\"\ôÑ²F±¤\ôP™cp','NigÃ©ria'),
('\É#HÃ©B~¹º\Ø.	ß‰','NiuÃ©'),
('	D\è}LG¤†}‡\õ£\ß','NorvÃ¨ge'),
('\ä\ärû\ŞJ«½h3*\ì>«','Nouvelle-CalÃ©donie'),
('Gh‰Â¸şAÄ†Š¶º0 F','Nouvelle-ZÃ©lande'),
('\ÒE©M3š|‰û§Ä„','Oman'),
('„fš’	Aƒ:DO£Lz','Ouganda'),
('\Ş3(-4|CÂ®À¯\nptø','OuzbÃ©kistan'),
('`#†1\ï\è@Åª¢d¹\ô]o','Pakistan'),
('’0³¡8AÕ¼\Å3u/HV!','Palaos'),
('ªÂ¹dYmKGDE² 2d','Panama'),
('5½@oFF¡»Â†‹\ÖL','Papouasie-Nouvelle-GuinÃ©e'),
('«Çµ_E\nEÆ˜ú\Ú!\ØÉºk','Paraguay'),
('V™ Ù“F\é\ZgŒ-Zx','Pays-Bas'),
('µŠÀ%HiºD¬\Ó\\b\Ï\ß','PÃ©rou'),
('ÿ\çQ‘\ÈE%„ú¾5\ÑFk','Philippines'),
('\ÉWh…\Ñ&B©ù<R~\ò!&','Pitcairn'),
('\"A\É \İ2N˜^\nÉº','Pologne'),
('‰5Ê¨	NO\ç¥¡P\ÓF\Âü','PolynÃ©sie FranÃ§aise'),
('\ÓË‡ŸŸ³JŸ\×b\ÍÜ¼«\Ë','Porto Rico'),
('i\õ¼©\ÔKº²\ö™2','Portugal'),
('\æ\Ê|¦eIŠ¯¢²q *','Qatar'),
('!{£f²H	«ûag…¶','RÃ©publique Arabe Syrienne'),
('\Â\Ç9:\ÚFš5§ˆ\ò\ä]','RÃ©publique Centrafricaine'),
('H´§Š¶BR¿9;¹D\İCD','RÃ©publique de CorÃ©e'),
('R\äi§­G¨²û3«Û“y','RÃ©publique de Moldova'),
('NF\ÌºA¢Ã…VPW','RÃ©publique DÃ©mocratique du Congo'),
('Ü½ûSX\×G†¦E-z\æ\í\à–','RÃ©publique DÃ©mocratique Populaire Lao'),
('†°>	6F/–bjÌ³–Œ','RÃ©publique Dominicaine'),
('\\\íx\õ¼YCÄ·\'Á®\ïK›','RÃ©publique du Congo'),
('NeE2\ËoGN“‹1û\îo\ö,','RÃ©publique Islamique d\'Iran'),
('\é»\á3½Hs˜j´Á‚\ât','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('ø\Ü\ÈA\êDj\Îüÿ\ö$','RÃ©publique TchÃ¨que'),
(' J\0\ßK¢\nÿ)YB®','RÃ©publique-Unie de Tanzanie'),
('\Ë4C6)DÖ¬0cE‡\Ç1','RÃ©union'),
('Æ”\Û2ø%O¾}w\Í&“z','Roumanie'),
('.’x\0sGÚƒ-†]Š\ÛR·','Royaume-Uni'),
('qº¤ ”WF¼\r±}.x\Î','Rwanda'),
('Q\ğR7GÔ½.V™Cv','Sahara Occidental'),
('q5\nT\ç\Ê@ˆŒr–XV²','Saint-Kitts-et-Nevis'),
('~\\¸è‹±Fœ—Ä¼\é/²\ç','Saint-Marin'),
('$v9\ó\ÏGP‘QY¡gdÀ','Saint-Pierre-et-Miquelon'),
('kp%GB\áƒxv\â§\æW','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('ªy,j¸LF¯R\ò\ñ\àÁ','Saint-Vincent-et-les Grenadines'),
('!\ÖÇ¥K^µ\ëPµ˜\ÛQ','Sainte-HÃ©lÃ¨ne'),
('Bµ¶\Úv\ÆJ¨P\Ç\Â\ã\ç‹','Sainte-Lucie'),
('}€‹<O`D@¶\Æq\÷\ÙX\Ò','Samoa'),
('ú#¼\êGu±R\æ\í\Ú8\à›','Samoa AmÃ©ricaines'),
('9\ÎSø\nC\é§z\óA‚	','Sao TomÃ©-et-Principe'),
(' k4\ĞNÇº\ËÈ¦{‘-','SÃ©nÃ©gal'),
('´‹œ¯\×M\à¡M\"t·^','Serbie-et-MontÃ©nÃ©gro'),
('\"\Ø\Z\"¤Gºx\ñ\ÎÛ¸øx','Seychelles'),
('sı\Òø\Øo@ š\é)!w	Š','Sierra Leone'),
('P˜\Ùp(BJ9‚\È~À\ÔB^¹','Singapour'),
('¸R¯\ÉUEÈ–\ågm\ès','Slovaquie'),
('¡”4\ĞTD£¿0\é','SlovÃ©nie'),
(' L­Ş±A±`®\ËWO‰\É','Somalie'),
('\rY?\Æ\îLŒ‚ıhù#]—R','Soudan'),
(',\íL’\n›S\ë\Ö','Sri Lanka'),
('šnqwHB¶/\ÎK¹0{','SuÃ¨de'),
('Ÿu\ğ¾³CF\r\Ì\Ç3=F','Suisse'),
('2\ØIq\Ô\ãH\ö´W\èÀw0+\Î','Suriname'),
('v¨7\ÈC¥?=„ªt³\Æ','Svalbard etÃle Jan Mayen'),
('1o\ãs\ï¸GÛ—\Ñ\õ°2\İ','Swaziland'),
('T®rŸgL!bƒO%:','Tadjikistan'),
('\ñ±Š\á\õFU‰j\'UZ£™','TaÃ¯wan'),
('t£všO˜¸u»TÌŒˆ','Tchad'),
('•\è\nRD…!ªÌ²R','Terres Australes FranÃ§aises'),
('q¹Œû\ÊI9¸||ª\ĞZf\å','Territoire Britannique de l\'OcÃ©an Indien'),
('³&\é\'pOİ¤\÷[`hD\ó','Territoire Palestinien OccupÃ©'),
('\Ú/w‡²CˆØCÿhv','ThaÃ¯lande'),
('°;Z\àJ†\Øc61z','Timor-Leste'),
('I>‰¶lE¤º/B\à\çD¯¦','Togo'),
('\í\ÔAÁ\ëI±´ÿ±0S—g[','Tokelau'),
('¦X8ZJ<„4­\Í4±«','Tonga'),
('\à\r\İ\r\Ğ=F\å¸6Š+€Š\Ú','TrinitÃ©-et-Tobago'),
('²Z\ñ\ŞB\á§k8mÜ¼`','Tunisie'),
('>Y\ì\ÊOG?“Ç•ÀR\Í-','TurkmÃ©nistan'),
('Š©+L\'H¤”cy49ş1','Turquie'),
('û\È!N©JK´O\nš–\Ö\Ï\Ê','Tuvalu'),
('`&¤~bG.¸P‡\"’4\Ş\á','Ukraine'),
('\á±<K\ÚbBê sŠY€U','Uruguay'),
('XÔ¥\Ú;B”¢;\Í\÷†\á\İ:','Vanuatu'),
('Ğ’<û\Ê=A5¯Pû;‘j$','Venezuela'),
('o\Ø}o\ôşE\ó­½ù[b“£','Viet Nam'),
('%\ì>™V\âDş´}›¸\õ„\Ã\Ø','Wallis et Futuna'),
('uùÀK\Z™@½¨–`K]Õ±','YÃ©men'),
('\Ö|ş±\×EÀˆ:|¹i\"\Ñ','Zambie'),
('Áa\ï/±EşH\ã\ï\ëBM','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-02-08 13:42:32',33),
('DoctrineMigrations\\Version20240201152951','2024-02-08 13:42:32',3),
('DoctrineMigrations\\Version20240202084749','2024-02-08 13:42:32',3),
('DoctrineMigrations\\Version20240202150901','2024-02-08 13:42:32',3),
('DoctrineMigrations\\Version20240207105701','2024-02-08 13:42:32',5);
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
('Or?`£šH\õ»\í+`\n','Grenache'),
('ŠˆÈ¨r@Ü¢“[»,Cµ','Merlot'),
('w3\ÊùqO\r­\Ò\ã\æA','Nebbiolo'),
('°chiC­£ Z¥\ã\rƒ','Petit Verdot'),
('¯‘\Ğ\æœ\ôF±«h\îDN×‹','Pinot Noir'),
('³ü7QD…93Ÿ\Ğ=','Sauvignon Blanc'),
('İ¸\Z\á\ìDQŠ\à\ğ‰Ò¼j','Shiraz'),
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

-- Dump completed on 2024-02-08 13:42:36
