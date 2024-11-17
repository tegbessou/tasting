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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',259.99,'2024-11-14',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','hugues.gobet@gmail.com','France',999.99,'2024-11-14',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','hugues.gobet@gmail.com','France',2999.99,'2024-11-14',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','hugues.gobet@gmail.com','Italie',899.99,'2024-11-14',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','hugues.gobet@gmail.com','France',1599.99,'2024-11-14',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'hugues.gobet@gmail.com','France',358.99,'2024-11-14',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','hugues.gobet@gmail.com','Australie',1799.99,'2024-11-14',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','hugues.gobet@gmail.com','France',1099.99,'2024-11-14',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','root@gmail.com','United States',199.99,'2024-11-14',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','hugues.gobet@gmail.com','New Zealand',49.99,'2024-11-14',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','hugues.gobet@gmail.com','Italy',899.99,'2024-11-14',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','hugues.gobet@gmail.com','Espagne',1499.99,'2024-11-14',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','hugues.gobet@gmail.com','Ã‰tats-Unis',1299.99,'2024-11-14',NULL);
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
('1Z=\í\êlM€´œ	®&¤‹M','Afghanistan'),
('W©OM®L\àªG‘Û‹','Afrique du Sud'),
('¢§›^«I”¯\È_}¶9B','Albanie'),
('hZ\Üq°vO–‹[AO\ö‹°','AlgÃ©rie'),
('À\Üi\ÓM»³8œ\0\ğ(Š','Allemagne'),
('A¿Èƒ\öA\ó®r4˜\İj\Ï','Andorre'),
('Uez\ZA¢\çŠ%{*³9','Angola'),
('f¥%\Ğ|JE‹+F&~7d','Anguilla'),
('N\ãÀĞ‹;NV»\"«™ú\rC','Antarctique'),
(';k­{Au¼|šmIœ/\í','Antigua-et-Barbuda'),
('£Mıd™E¹|:„.‡9','Antilles NÃ©erlandaises'),
('\Ê\íˆi\ĞMß©	\ô‚KduJ','Arabie Saoudite'),
('\äº6nq‰@(®@µ>·zf','Argentine'),
('02\ÎxˆIº»“\İ\Ù\Ä^','ArmÃ©nie'),
('\"k‘%…\ÉN!‹\ö­M\é3','Aruba'),
('§T\ë\ÂÒ¥I7‰;\Ïm\Â\Úl','Australie'),
('\Íx“D\ñª&‚\Êc\ìt','Autriche'),
('\Â>\\\Â]*A ¶§EûŠR<','AzerbaÃ¯djan'),
('˜ZjÖŸAI³\ÏRlB¦x¾','Bahamas'),
('µ¬\ÏIaF}œ\Å\İ\Ñ\ëW­','BahreÃ¯n'),
('µ˜*\Ö\ô~O™5\ö(a-\í\Ó','Bangladesh'),
('M­8J–\\C‘G€\ç\ä','Barbade'),
('JÑ”?iOEú¬KÇ5X¨','BÃ©larus'),
('\ğ\ĞWm@R° #¹…\ì‘','Belgique'),
('9n7Aº—\ğZƒ\Ğw£U','Belize'),
('|Œ!ƒjJ¡‹X>;Å·','BÃ©nin'),
('*JzˆrM<Œa\Şû','Bermudes'),
('\Z\ÅÈ®wE‘ˆL–ª.”','Bhoutan'),
('\Z\ò\öÊ‹˜Aîƒ¬­/JH\Ø','Bolivie'),
('\ïiN9 \ÚD¬ª\Ä]\Z€¼','Bosnie-HerzÃ©govine'),
('\n­Ÿ.)KxŸd˜]šµ‚e','Botswana'),
('>	ÿÆŸ@£\áeª7¥,','BrÃ©sil'),
('Nd ‚‡ÀC£¥yI\Éü¾','BrunÃ©i Darussalam'),
('G„\Ü|´LÈ¡Šg°¼U°+','Bulgarie'),
('\r_sMjŸL\ö¬ˆ\'\ê','Burkina Faso'),
('}›ø7\Ñ\ÜE¬»²¶\ğw±\ó\õ','Burundi'),
('„/\Å	CÙ³Ÿg‘\ïGw/','Cambodge'),
('ª§ ]ŒC ½œ;3·\Ä1','Cameroun'),
('L\ó\Ş\ÓQ\ÅC­£M\÷qwkš\å','Canada'),
('\Õ\Ën&jH«»\ÜN\Âiˆw2','Cap-vert'),
('\êe/J>¼GBŸ0şmÊ|','Chili'),
('1>\íaKK‰ƒg1c‰”ƒ','Chine'),
('yƒ)Œe,L¼•LBv\Ã','Chypre'),
('p™i\'\àD…¬\Ôc\ä\ä\r','Colombie'),
('©EPoUD»?A\Ú\ç¾İ¸','Comores'),
('„\è\÷\ğ`?JÕ‘%\è*|\Ü','Costa Rica'),
('s{5±¾·C	\ãX5\Ö<\Ò','CÃ´te d\'Ivoire'),
('\n\ë(\ôÀvE¼¬7\\ dh\Â\ğ','Croatie'),
('CnüŒ¢Eœ\Õ\r\éxº','Cuba'),
(')¼¼\å9@¿0f)ú\ÂrH','Danemark'),
('\îN¹\îš9BÄ•w\"\×ı$\ô','Djibouti'),
('k®ˆ!\ö\óA\à<Hyc„w¡','Dominique'),
('C19\ÊWvDuœ&¶8\ç','Ã‰gypte'),
('›¾˜(­:@ş½ ù¿\é\Ù}','El Salvador'),
('(\"¡ÿ\İD2¡\òNBoŒb','Ã‰mirats Arabes Unis'),
('Á}E°Ş¿M[¿\Ì\áKzJ\Ç\Æ','Ã‰quateur'),
('l\ÛK³*\óGË¨\Ô\ØÁC¨M\Ş','Ã‰rythrÃ©e'),
('\Öu¬)¹\ÇMØ˜&\"K\åŞ¿','Espagne'),
('c=j)‰Büœ­vr;J2','Estonie'),
('”˜‚X}B¿——\öT\÷?','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('±g \×\ä\ÑC²¦ua:QıW','Ã‰tats-Unis'),
('‡\äÿ\ÓQşE?’(J7˜¥\Ö','Ã‰thiopie'),
('„?®\òD—³ø\ëû\ó','FÃ©dÃ©ration de Russie'),
('\÷d\nn\ç+G³\ÆdFni¦3','Fidji'),
('\Â8‹Å©NÔ†u\0†:}¥','Finlande'),
('€J´²C\õ³x¥€–\ÓUN','France'),
('¯r\Ó€YOƒ± \çz\Ä<¶~','Gabon'),
('jl\ö“˜L·›c”A«™','Gambie'),
('ŒÁøqc§JC²\ÂaE\Ù>','GÃ©orgie'),
('ˆA-\ô\ÄG“¤\éÆ¾¼','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('»\ã„\ç\ä4Eš²\öo€D\Ô','Ghana'),
('ı—<8­Me”À\äUB\Ü','Gibraltar'),
('d\îA4\ê\ÑCX†”O\àú\î\Ê&','GrÃ¨ce'),
('\ËdmeÎŒK™¼1Xrûa†','Grenade'),
('\ñ.h\ËD‹—ÿ\Å!\è\öª','Groenland'),
('\à]¿#H›”¤³>','Guadeloupe'),
('\åY\Í\ö\"Iª­4°>ü\"/','Guam'),
('º•ª\Ğ\á®DY,?©‰Áz','Guatemala'),
('‡h2™\Ê@d©4\Ò]s™E','GuinÃ©e'),
('Vi‡€HKS€lN\Ãx\ğ','GuinÃ©e Ã‰quatoriale'),
('œw\öT\ÉuB¹–\'/²|­\ÊJ','GuinÃ©e-Bissau'),
('Bli6¦D$ƒN@Áª>’\õ','Guyana'),
('	ˆ\Å\ÕDE]¡µvÌ³\õ\Ê\ğ','Guyane FranÃ§aise'),
('Òƒ\ğ\Ş\Å%G\ï”\çOp¶I','HaÃ¯ti'),
('D \ìø\ö¬LÇ¿¥kxmX¥','Honduras'),
('yIÉ¹4xBsg2\Z\ä\\¥‹','Hong-Kong'),
('R®t\×H›“@ ;%\Éb)','Hongrie'),
('z%‰~!€IO®û\ê—T?›','Ãle Bouvet'),
('l\ÉyUIÛ†±C•\õGp','Ãle Christmas'),
('#(¤¥}­Bc˜\Æ\n¢\nU¤b','Ãle de Man'),
('\Ó\ØNJbGTµ\æ§.“\Æ','Ãle Norfolk'),
('w\Å\" \ÜG±5©i\Ï\ÄJú','Ãles (malvinas) Falkland'),
('\"3e\ÓN´\áù\"x','Ãles Ã…land'),
('\ã?\Ø\È\Å6F”\Ã*n$t\î3','Ãles CaÃ¯manes'),
('úxùwş\çE°gº\Õ˜3','Ãles Cocos (Keeling)'),
('êŒšÅLF¸‡\Òjc‡¥','Ãles Cook'),
('Tt¹RÔ˜Oaƒºs\0A%','Ãles FÃ©roÃ©'),
('\öt`;<8FÚºi^we]z','Ãles Heard et Mcdonald'),
('‚ph\nrJÕ|ˆdr§','Ãles Mariannes du Nord'),
('n2œq3°@-–8\í¸:\ê*','Ãles Marshall'),
('r¨c²…­EÔœ\Æ\ò7\ãşv','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('W}-*Jù¬6Àpşª”','Ãles Salomon'),
('4X\ã\'\åGZ©¥›Ú•‚\ñ','Ãles Turks et CaÃ¯ques'),
('˜e.Y.@\à([\Éù«‘\Ğ','Ãles Vierges Britanniques'),
('%²g\Û?¦DQ®¦¹eB\ÖŸ','Ãles Vierges des Ã‰tats-Unis'),
('^\ñş±O‹·T.\íıt','Inde'),
('Ÿ¦INZ¼L\ñŒË·Ä±´i\Ì','IndonÃ©sie'),
(' Ÿ\"†\Z;N(¥øucT²','Iraq'),
('€ \ËLË”I¶‹R\ÎV§\rd','Irlande'),
('7Q\ÓxuF%€µ\ö\â0±\ä\İ','Islande'),
('d€|dşµD\0¥7˜\÷Cf\õ¢','IsraÃ«l'),
('}‹\õ­N\è™h–\ïAO/m','Italie'),
('FCX#6A:›S\õú4n\÷','Jamahiriya Arabe Libyenne'),
('l\Ñ$ N\÷“ş¸“ªo,','JamaÃ¯que'),
('5‹\Çy[/K™¯•=P·„','Japon'),
('`IS\ÖúVKl\ä,\î','Jordanie'),
('.›\îG/cHj f\Ú‚>Œ€','Kazakhstan'),
('p;\ôoµB¡‘“—]2©','Kenya'),
('BydkvD\"µ³ûË»lû','Kirghizistan'),
('³\Õ7@-šy]rc','Kiribati'),
('·º|]\ZÁB{©\ö61;…','KoweÃ¯t'),
('Öˆ\0”Ğ»Fd‹üZ\ç¾jU+','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('L²‹#ªJf¼Q>fx<','Lesotho'),
('Ü—!ı H–\èQˆwûD','Lettonie'),
('b%\ç\â4EŸ ›nu7\ç','Liban'),
('\Ö}ÜÁqH\à©ç±½¶´¡¥','LibÃ©ria'),
('•ûI û\ÊM×¿\Ü*:jŒ\Ó#','Liechtenstein'),
('\íV\ÉzûûHkœ^í”¤\õ ','Lituanie'),
('zk,¦¬A7bù\÷`J','Luxembourg'),
('ZƒK³›A©{\ôw¤”','Macao'),
('8ú­‡\ZD\÷²‹\\n¤À','Madagascar'),
('´\0B\'N\æ™\\z\íÜ™','Malaisie'),
('1#«q\Ğ7Lü»\İ\Ñ_/\Ã','Malawi'),
('\Ò!\É\âyD\ó‡ù\Ü\ĞA§','Maldives'),
('\âQD1‰»m°\ìW¢','Mali'),
('\ğq–š SDùŒJr²v\ä^','Malte'),
('‚vEù*DÃ7ø \ò\ÑÃ¯','Maroc'),
('\çş\Ñ’µ@L­³d„GCyd','Martinique'),
('\ÅÓ¶¾\Ñ<E\õ¨\Z»´Ij','Maurice'),
('vµ\ë\'~GS˜2.Ö²´B','Mauritanie'),
('\Ï\ØúŞ¹¾K\ìŠ\à\r\êÁƒ\ÄZ','Mayotte'),
('¢”$IyO¸¬‘[şYù@\Ä','Mexique'),
('º®¶\ì^\ÔJz‰\Ø4`','Monaco'),
(':d1¾\÷CİÒ™\à;ü|†','Mongolie'),
('9}\ñ\n<LB£…	q›:¡V>','Montserrat'),
('j\ÛDLÍ¦^\Ô\ê,\ñ¬r','Mozambique'),
('\í\Øe$SŒBÔ _ª\ï#\Í;¼','Myanmar'),
('\ät\÷¨úL~—Ø®i±¸«','Namibie'),
('\Ş\ğÁh¡´Jš<\ñ\öªn«','Nauru'),
('¥Ó¶!™\0J6°ª\0JÉ°««','NÃ©pal'),
('º3…\ìµKK”œaTz‰ÿ','Nicaragua'),
('°¥\Ø}úD7€´›\å)\ö ','Niger'),
('Ó—Â–&bJ¢Ÿ\Üøk¹†¹','NigÃ©ria'),
('†\nl\ô\ìL–²p\ò*B\ê','NiuÃ©'),
('s§™5QE§‹gšäŠ–','NorvÃ¨ge'),
('¤Š\ĞTMˆE\çµ-nB\È]:|','Nouvelle-CalÃ©donie'),
('y¢‡¢\ÃE\æ›\ÎR‰¼Gûa','Nouvelle-ZÃ©lande'),
('§\ó¨\æAqFÔ“ƒ‚%T','Oman'),
('\õIÔ¢\ì]Ey¡\ÑŞº¥v\Â','Ouganda'),
('\å1œ!O[¿­KZJŒ–','OuzbÃ©kistan'),
('5\ó\Å\ÌK\r·qœŞ­P\Ôp','Pakistan'),
('üF¹\ÈL€š^\×\ëUU','Palaos'),
('9\ÎJ=‘\è\Ø\Ì\ìA','Panama'),
('nn-\ÌU@P†uÎ³\0{†;','Papouasie-Nouvelle-GuinÃ©e'),
('¾ƒ\ìl7:NT—%\ç¯}2]±','Paraguay'),
('•m\ö\í@şC€‚\Íd«lq¹','Pays-Bas'),
('T\á$­\×\ÑBãŒ·9ù‚7','PÃ©rou'),
('LG<¨½R@Â‡\È\ÜoV£\Â','Philippines'),
('oØ…€AGù”#¦†F\ñ8:','Pitcairn'),
('@q¥§—Køµ’\n\Û\Ú4D','Pologne'),
('\ĞÓ‹\ó\Å2KY™±²qLœl','PolynÃ©sie FranÃ§aise'),
('¬–¸°ªM(¨,.\ôL','Porto Rico'),
('x\óÌ…­”MÂ;\å\Ì\æ\í','Portugal'),
('c\Ãm&\ËJ¢\ã‚Ã»L:>','Qatar'),
('\í\ã\É\'Q\ÖI:¿b—hùœ\Ëı','RÃ©publique Arabe Syrienne'),
('UŸS©¿F\å‘û\Ûrh\ó¬','RÃ©publique Centrafricaine'),
('9\ãmvş@X€ø†¦\Ş\Ói','RÃ©publique de CorÃ©e'),
('t\Í¼\ßSB(œ…(\ïH','RÃ©publique de Moldova'),
('š-E`whMO¨eS¸,œ\î','RÃ©publique DÃ©mocratique du Congo'),
('~˜\õ¢‹\ÕOAz8\ów','RÃ©publique DÃ©mocratique Populaire Lao'),
('\ö‡ˆ¾/F›¸\ğ(ù•','RÃ©publique Dominicaine'),
('•\Ø×‹²\ñLL”#\"\ì\Õ|\È^','RÃ©publique du Congo'),
('ÿ*–²Â I}“(\Ñ\Å\ö\Ş','RÃ©publique Islamique d\'Iran'),
('\ë\Ò;¥\ÔMY H¿\ÌA/4F','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('\Å[}ŸqJ\Î%\Ò\å|\ÌE','RÃ©publique TchÃ¨que'),
('\ğM3\Ç3\æL~¢\ï-¸ù\êu\Ú','RÃ©publique-Unie de Tanzanie'),
('\ò=‚w‚Hg–\õ¹\æ!­\å','RÃ©union'),
('\Ã‡K\è\âDŒ†„º\é\Ú§m','Roumanie'),
('o—n\àH «pš¶5&\ô','Royaume-Uni'),
('®\òxM\\Ac‘xÕˆD—)','Rwanda'),
(']Ö¢>ø2JN–\Û\n!¶)\ô','Sahara Occidental'),
('\ä ‚\ÅuJa©\Æ\r´b\Ñ\Ùù','Saint-Kitts-et-Nevis'),
('ı©\èÎŸ\ëHa¶\ËO\\‘„i','Saint-Marin'),
('\Ø\ï#Æ›¨BŞ³\Äa\ØQ$¾K','Saint-Pierre-et-Miquelon'),
('\ğù\Z+%uI…¢¦û\İ\÷J','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('xNˆ¥Jê¡¨!#O \ß','Saint-Vincent-et-les Grenadines'),
('\î\Ì¥UF´ú\ó;·\È\ö','Sainte-HÃ©lÃ¨ne'),
('\ÚX\é@	SL{¨2ŒTf\Ø$\ğ','Sainte-Lucie'),
('0\Èw\ÚCO“ª\çuš=¯O','Samoa'),
('\Úi#71Bÿ\ô0\Ï\ÅF','Samoa AmÃ©ricaines'),
('\Êc|\î\íşC#‘˜\Ö\ó+‘\Û','Sao TomÃ©-et-Principe'),
('H1\äRm3K(¥œ6;\Îlú','SÃ©nÃ©gal'),
('\è)œjAc‘6‡qˆfw5','Serbie-et-MontÃ©nÃ©gro'),
('x5\ÛFÿ±\n”BYB«','Seychelles'),
('‰‡È´ÁAË€\äB=¶\ã«','Sierra Leone'),
('ú\ñÅ¬F±ŒX”øÊ°A™','Singapour'),
(']½\Ö6A6¢pB\ĞD[\ôn','Slovaquie'),
('\"\ñ\âºRREi¾-\ÌA“ø\Û\Û','SlovÃ©nie'),
('9ÿ*Q•D\÷µª<Ü˜R¤','Somalie'),
('š¶\ëS„IÛ®Vs›\0Qÿ\æ','Soudan'),
(' 9³EˆEÔ°_ûˆÏ¡•','Sri Lanka'),
('n\ëE¦d@AË\Å2ŠE,µ','SuÃ¨de'),
('\ğ\åc6`De¢ül<\"’','Suisse'),
('n¬™\Ã@L½¡-À\á\Ú\\','Suriname'),
('9µY=\Ü\êM$¼\ÎŸ		L‚','Svalbard etÃle Jan Mayen'),
('y\ò\ÛI²F\\‹v\ğ×ºı‡','Swaziland'),
('q^-‹ù1G­¾CÉ…\í»','Tadjikistan'),
('W>|\ôF€Lgšj\ÓTı˜‚','TaÃ¯wan'),
('6±ıss\ÅM5¥\æ\"¼WB\ÜG','Tchad'),
('w–l½\å@a¼K )r\ê\Ú\ë','Terres Australes FranÃ§aises'),
('E7\í\Ã\ÅfD—šƒiÌ¤(—K','Territoire Britannique de l\'OcÃ©an Indien'),
('1\öK³\Û@œƒJÁ)8¸C“','Territoire Palestinien OccupÃ©'),
('?\Î_—\ËbCG°\Ä\×\"A>!e','ThaÃ¯lande'),
('‰Û·XlJN±Šû˜³\ô\ó­','Timor-Leste'),
('&h<‰HÑœ™³WR\Â','Togo'),
('wC\à-p\óHè£‘\ñÂ¾2“.','Tokelau'),
('l-I\ö­G!\ë\ËY!','Tonga'),
('‡\é\å@>K“®£\ñg/','TrinitÃ©-et-Tobago'),
('\Ì\ÜÅ«Š@m›\öZÂ¬Î•','Tunisie'),
('\0/„\Ã6\0IdŸ9·†ÔŸ¶K','TurkmÃ©nistan'),
('4µ¾e`şIÌ‹T\Ì$,U9','Turquie'),
('‘j2Ù´ŸG¼:¤)\ÉN','Tuvalu'),
('\×\ïş³ú]D°¦H9^Ôº+<','Ukraine'),
('(—a\é\ÈA!\Ê\Æx\óĞ‡b','Uruguay'),
('\Ù´AHƒ[\ÕF‘®…','Vanuatu'),
('\è\êq\n‰\æHp Orf\òU\Ğ','Venezuela'),
('\Ñ\ï¿\öANÈ\èzÃœp8','Viet Nam'),
('\áfbEøF¥\Ç+LÇ\Ø\Ñ','Wallis et Futuna'),
('SY’\Â?D \ä_ø\"ûKÀ','YÃ©men'),
('PT\èhE ›u\êù','Zambie'),
('¬g:\Ã\àN\'£\İ2•\"|q','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-11-14 19:50:46',3),
('DoctrineMigrations\\Version20240201152951','2024-11-14 19:50:46',2),
('DoctrineMigrations\\Version20240202084749','2024-11-14 19:50:46',4),
('DoctrineMigrations\\Version20240202150901','2024-11-14 19:50:46',1),
('DoctrineMigrations\\Version20240207105701','2024-11-14 19:50:46',4),
('DoctrineMigrations\\Version20240319212437','2024-11-14 19:50:46',1),
('DoctrineMigrations\\Version20240614133504','2024-11-14 19:50:46',11),
('DoctrineMigrations\\Version20240617165906','2024-11-14 19:50:46',12),
('DoctrineMigrations\\Version20240708061729','2024-11-14 19:50:46',14),
('DoctrineMigrations\\Version20240801202153','2024-11-14 19:50:46',2),
('DoctrineMigrations\\Version20240815153823','2024-11-14 19:50:46',3),
('DoctrineMigrations\\Version20240916065051','2024-11-14 19:50:46',4),
('DoctrineMigrations\\Version20240929091802','2024-11-14 19:50:46',12),
('DoctrineMigrations\\Version20241002164506','2024-11-14 19:50:46',7);
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7','\É5?0O¤…€)\\¦ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-11-14 19:50:46');
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

-- Dump completed on 2024-11-14 19:50:47
