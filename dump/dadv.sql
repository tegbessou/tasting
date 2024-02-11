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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',259.99),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',999.99),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',2999.99),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','\îo;ÔˆC¾±ı½\Ë\nl','Italie',899.99),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','\îo;ÔˆC¾±ı½\Ë\nl','France',1599.99),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'\îo;ÔˆC¾±ı½\Ë\nl','France',358.99),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','\îo;ÔˆC¾±ı½\Ë\nl','Australie',1799.99),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','\îo;ÔˆC¾±ı½\Ë\nl','France',1099.99),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','\è˜NE\ÍDÔB\õ\Ä\æ½a’','United States',199.99),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','\îo;ÔˆC¾±ı½\Ë\nl','New Zealand',49.99),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Italy',899.99),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','\îo;ÔˆC¾±ı½\Ë\nl','Espagne',1499.99),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','\îo;ÔˆC¾±ı½\Ë\nl','Ã‰tats-Unis',1299.99);
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
('/1vM\ÒC=‰\î\ì\Âÿ’ù\Ğ','Afghanistan'),
('š5jÜ½mBË…b£&\Ş/€','Afrique du Sud'),
('“	6~\ä†I\ô¦\ï=\'M´¦','Albanie'),
('.\ô™s!Crˆ,\í@\ôù\Ú','AlgÃ©rie'),
('w‹.YJ1¦]ïŸª¬cZ','Allemagne'),
('uƒ³¸¿\ÍI\é¡.ùİ”¯…','Andorre'),
('3|sKHD‚K\è\õß°S','Angola'),
('\'\0­d+\ÆOL‰ct36\0\æ','Anguilla'),
('\İ\ğ®e-Oùˆ\Zü6h®ù','Antarctique'),
('³]\ÆjN˜‹ ,?B•','Antigua-et-Barbuda'),
('¸«`\æ‰B.®±Ïšš\Õ','Antilles NÃ©erlandaises'),
('$‹ĞƒgsD§º\Ò+\ç¯','Arabie Saoudite'),
('—F¼‹\0˜B`k&°?\çD','Argentine'),
('f—PèŸ—M8–‰š\İ>®t','ArmÃ©nie'),
('\\°\ß[a\ÓC–Mt±-;2G','Aruba'),
('4\æk\â”NCEº–eD€\ÛT','Australie'),
('k$«rú@İ²AJ¸\ÏÙ½\È','Autriche'),
(' ø\Ö4«‰H¡<¢Z\ì:i','AzerbaÃ¯djan'),
('Do \n@ L]¨•\ìm\â\r’¥','Bahamas'),
('rY:¯\×GT£œY\èV$¼','BahreÃ¯n'),
('.4|†>\nL>‡™¡\ÈÉª\Æ','Bangladesh'),
('ùß»×	I‡„\÷PDGtŒ','Barbade'),
('¤p\Åù¶^Fˆ_\Î{M˜¾','BÃ©larus'),
('˜\Ì\Ò\áÁ@C…•¥\Ç\rr˜3','Belgique'),
(')\Å@r\ÖKA\îŠË¶\é›\ö','Belize'),
('8c°\Ú4O±Á3µ.54[','BÃ©nin'),
('À™#¬”8F6 \è\Z\Å/l\ß','Bermudes'),
('\ÈúŒ[\0½M…;lÿŸœ=','Bhoutan'),
('É°\Ş\æKLFÁ¤;pQ’\×m','Bolivie'),
('¦M&€z\ØF8¤vÂ’(6z','Bosnie-HerzÃ©govine'),
('\rœšû\ÛBü…b\İJ=5P','Botswana'),
('8½ü®\ÒÀE/ˆ8‘?O\×^','BrÃ©sil'),
('3…Ò›DJz”6%b\÷~]','BrunÃ©i Darussalam'),
('´­e\İ\ÖNşƒ,\ì\ã¿\Ü','Bulgarie'),
('‹4Á\ñŒ®L\ñ¿\r6\"0]k','Burkina Faso'),
('*ım¥}nMÍ«/Z\ØJD\İ/','Burundi'),
('$­\óÅ™C*\ñ‘1„·˜','Cambodge'),
('\Ë \éP\÷6E\õƒ\ñ,:\0\ë&½','Cameroun'),
('<%±:‹0B0¬U´b$£l\Ë','Canada'),
('30eL0»G¶‹_=x†#','Cap-vert'),
('[Á\0\"OÜ¥¾x¸6\ë','Chili'),
('†!rV-„IV‡ş\Ëî‚§½','Chine'),
('[g+~Hˆ¥nT®5xœ','Chypre'),
('\Üf“javK©hÿ4¸.³','Colombie'),
('cÙ€Ø¹„HÀƒ\Ï\\%\Ä$','Comores'),
(' \Ç+H‡\ãO5“p¢‘¦¿(³','Costa Rica'),
('FŒ5(›C\è·\Ù\ó~\ÍdJ‚','CÃ´te d\'Ivoire'),
('?†M]‰\ÈN\Ä	¾Ä¾','Croatie'),
('i\Ù\ä\êšTM|’©\è\ò7y\Ä','Cuba'),
('T§vû\0Cy±zB¸˜8','Danemark'),
('\'`¸\èGŸÔ¨dÚªEs','Djibouti'),
('“±4j)\ÏN&ºw™q(U†½','Dominique'),
(';d \æ(MŒ€W\Ì-K','Ã‰gypte'),
('KšSû\ç\ÈBş«\ôw?\î‘²','El Salvador'),
('qzKR\ì4GŠ¦‰\Å\È:Ç¢','Ã‰mirats Arabes Unis'),
('\İ\nuk\ÓüAh¡)\ÎO\Î\í\Ø','Ã‰quateur'),
('-1\Ñ:-­K²\Ï\"\Çx\Ùe','Ã‰rythrÃ©e'),
('ø(”ELPµ\à\êˆGª','Espagne'),
('.Y$C—Då—’[@\Ñj\Ó','Estonie'),
('Ol›\Ò\ÈøO\'›JÙ¦(œŒ','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('—½xllIË§\Ú\Ç†\Ç\ñ\Ñ','Ã‰tats-Unis'),
('ú½a¾\Ì6OM‘T:\Í\É\×','Ã‰thiopie'),
('¼#dE\ë\\{MÇ˜¼','FÃ©dÃ©ration de Russie'),
('©ŠN\È]Fu¦I­É©`R¸','Fidji'),
('û\0U©¦BR›\Ê\n(\Ä\Ì\õ','Finlande'),
('·\âL,sF²“u¿AÊ¾@','France'),
('ıG\Åè‡®EÁ¹¤%\Ã\äA­','Gabon'),
('J\"•Á<RI×±$‚H0ˆ\'›','Gambie'),
('\ä<\0ùHML¥¹	~ş\ÚĞˆ','GÃ©orgie'),
('`\Ğü—•J<†\İ\êw\ËH','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('£\ØhJ@¢5v¨WºÆ©','Ghana'),
('ƒ\ö‚¸LIÔ¸¸4…‚Á\ôˆ','Gibraltar'),
('2µ¡\óqºJ{²\÷\ÎI±xŒ','GrÃ¨ce'),
('^\Ù@©\÷6G@…•‚x\r','Grenade'),
('˜¼¹ sCH‹q@!\Ø‘','Groenland'),
('Ë\ĞßŠ\ìI7®73·œİ“\Õ','Guadeloupe'),
('Ÿ\ì\÷\"D\ZJ£œÌ«Íš¦','Guam'),
('jw\ï\÷¼ŸE¨§şŠlÊª\Z','Guatemala'),
('¨Ú¶~x\éL”–\Ì\Ó\Ï1\í\í','GuinÃ©e'),
(',b¯…\Â#Is\Ò £G²\Ç','GuinÃ©e Ã‰quatoriale'),
('\ğHx—pO5·P\n©·\Â','GuinÃ©e-Bissau'),
('\ğ¿\"gc\ÒE? •¾(­sÀ','Guyana'),
('\Èn\Â\õ#@Ÿ§¶‹ø¿	','Guyane FranÃ§aise'),
('¦Y¹¾JV›\Û\Ô-¡P‘˜','HaÃ¯ti'),
('ø\Ğ\ô4ùrOƒ¾Á\\†N\İ','Honduras'),
('¯ûø`«¢C˜†\õ0ffU\Ã','Hong-Kong'),
('_ÀŠ®)B\ô¿|‘\Õæƒ„_','Hongrie'),
('sg\ì-¾1C5¢³!\Ä8Z\Òq','Ãle Bouvet'),
('¼›\ïf:Aƒ¥Š\Ì9Q’\Ø\Ì','Ãle Christmas'),
('h\"\ã—*®AH¢E¨+¯\à&\×','Ãle de Man'),
('“\Ø\ôBªˆ²D\r5\Í','Ãle Norfolk'),
('Q)\ĞZ<J´\ëh/X¡\'o','Ãles (malvinas) Falkland'),
('#>)\ç4´B_Œ6@l]\é¯','Ãles Ã…land'),
('N!lt\0\ö@Ò†49ş7c‡','Ãles CaÃ¯manes'),
('=\Ç0H¸XO´“ofT\ĞÁM','Ãles Cocos (Keeling)'),
('U\Ñ/¿»IÆ‰~`\è\Î\×','Ãles Cook'),
('<+\ìQ{Hu†\ëÀ•B%\Ù','Ãles FÃ©roÃ©'),
('4‚:\÷¿ŒB!—\éŒ\Ë€\Ç','Ãles Heard et Mcdonald'),
('enG@\"Cv®\ér\è…0\'','Ãles Mariannes du Nord'),
('6\Í\á3L\í¯—³­t…\æ','Ãles Marshall'),
('Z¥\Óü.¦MĞ‚~B32f','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('$´‹9l\ÙG¯”¦ªZ\nj*','Ãles Salomon'),
('…sj³z\ÄHF \æ9+®‚\r','Ãles Turks et CaÃ¯ques'),
('\Æıª\ã˜EB©0\Í\ì\öh\Ò\Ö','Ãles Vierges Britanniques'),
('€\åµ\ñ…xM\ìªe~\ßdÿ¨2','Ãles Vierges des Ã‰tats-Unis'),
('A£¦¡ME‘”®rF°5‡\×','Inde'),
('’1’´FLAâ…±\ÌE\í','IndonÃ©sie'),
('L\Ö2A\\[A¡¿Ñ°Ç¦b¡','Iraq'),
('omw€\Ê@\r’\"&$iN;','Irlande'),
('.£\ô¤$Jlº=Ft. \n}','Islande'),
('˜gŸ¿\èE(¨ú\Z°Aeq¾','IsraÃ«l'),
('+\ÅfZO3F¿¹Q™z`C4\Ë','Italie'),
('ƒ|s¶\÷HNTÙ™\\L\ê\Ã','Jamahiriya Arabe Libyenne'),
('K1Iz‹Lİ–úO‹\ñm¦','JamaÃ¯que'),
('”‡f¿\r B)¹M\÷¬\Öş–\ì','Japon'),
('}±ÁaBw»©4³¿;O','Jordanie'),
('[–LS\ö@\n“‡>\ëBz5>','Kazakhstan'),
('«FIcœ2C\ñ­k\ó\îX\÷ƒ','Kenya'),
('p‡\÷–¥“J³²eV¤V3\Î','Kirghizistan'),
('“\ßOh«MĞ™N\ÊZ6\\ù','Kiribati'),
('0É‘„“\ÆOš¤6‡-@¼\Ğ','KoweÃ¯t'),
('¤\Í!KŸ¨\ív ','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('\Ï?³\ÈG€œQ\Ø\É2ƒ','Lesotho'),
('Ğ’\r\æm²K`¡ø‹İ«ı¾','Lettonie'),
('wÀ\\j”‹@FšŒ\È(\Ó¤E','Liban'),
('8*‘!0ABe³\Ğ~¬Ù§\"','LibÃ©ria'),
('4t•kXw@¬\ì\É\rc\ä','Liechtenstein'),
('\É:Z1Ao–#:\ìDi\rz','Lituanie'),
('¦Ñ€.˜?NˆŠ–ƒO\î]_<','Luxembourg'),
('Ş¬S­¥LÅ£R«ùP‚;','Macao'),
('I>\à¬3\ßJÖ¨\î6ş¯l³(','Madagascar'),
('\ZP\ÅW?ÀLš•\õN¬\\w-','Malaisie'),
('8\ö´\ï\ÔLFŒ»\Ğ\â2O¹\é','Malawi'),
('u;,Á\ÉJĞ€Ã³t\Ò@k`','Maldives'),
('‡\â\İ\Ü9cD¦¡\ß\ô\ó\rWG','Mali'),
('k\öÀ	\Ã@¶—\ãr\Zî«ˆ','Malte'),
('\ÚW=\à¢\÷D¶°$›Š(½','Maroc'),
('\Ş\ÍA\ñ»DĞ­s{W^8W\õ','Martinique'),
('È”K\å·H º#BE‘o\É','Maurice'),
('ª”q;G\ì»Â±™£I\ÄJ','Mauritanie'),
('r„.üOEü˜&€_·´','Mayotte'),
('Nf¿üMsŠ‚º©®?ú','Mexique'),
('C±H\ì~F8½:ŸpPœ[','Monaco'),
('=BuID@¿Xl¶N\Õ\Ì','Mongolie'),
('T\ç­_L@¥©˜[ue','Montserrat'),
('’.=\Ç\"M¹••Nns@±³','Mozambique'),
('¾@#~ÀC¡ˆ>\õd;‘','Myanmar'),
('S7E‚H?¸=Èµ\ï\í','Namibie'),
('\'É½6|L ²§‡T-\Öu','Nauru'),
('\ğRê‹”RHİ¥\Ù4¸\×\î','NÃ©pal'),
('p\Éş\Å\Å9IŠ‰¯H0S','Nicaragua'),
('°d8u\äCÛ­‹˜>¥8\ra','Niger'),
('M	FzùN±¤(Xbdg©/','NigÃ©ria'),
('°V$`d\óAß³*\"ü£M','NiuÃ©'),
('#\ã\æ\'V¶Gi¿-š{o\Åû','NorvÃ¨ge'),
('\ä–\É\ì;C‘‚³rSMº\Ş','Nouvelle-CalÃ©donie'),
('\÷q‚b””EÛ—‡´Ó¹\í*T','Nouvelle-ZÃ©lande'),
('”H‚€…\ëE\è@h$Ç–\î','Oman'),
('“¥¾\ën\ÆCE\îb)\ÕUf','Ouganda'),
(';,\ô£\Ë\\OÒ§7-»F7','OuzbÃ©kistan'),
('™XÔ§1FBƒKI2ÁEÕ²','Pakistan'),
('K\Ç>2\õ(EÆ»‹¤j‰(a\"','Palaos'),
('«^‡•ú\ÓC€\æ‡\Î\İù]','Panama'),
('\ëN2q^’G`˜W\õ¾\Õ$9›','Papouasie-Nouvelle-GuinÃ©e'),
('ı=Æ¾D?FHº\á\ğ\Íş\í…','Paraguay'),
('>`\â$µ\õD½•¡~Sg|J','Pays-Bas'),
('0³G\'o³EŸ¦cj\ïJq\ÄH','PÃ©rou'),
('^’n\ØH_—8x!\î£','Philippines'),
('ú”“\Ö\ZA¾75','Pitcairn'),
('	z#X\ÛD½¾–.\ô\õ\'\ö','Pologne'),
('‡µ\Ş[B\å­\ÅQ\à9\Ù-¼','PolynÃ©sie FranÃ§aise'),
(' ­B\Ø/F–\Ê>:tgü','Porto Rico'),
('­Ø™mLÎ“•\İm\áÀp','Portugal'),
('\0K\ÈO–Mµ…}fOe\0\0”','Qatar'),
('(ûg@IRK1“CaK','RÃ©publique Arabe Syrienne'),
('3û\'QAü«\óF²¿øÄš','RÃ©publique Centrafricaine'),
('^\Å,EÕ¸\ÄwD²\è¦','RÃ©publique de CorÃ©e'),
('\è\Ë\ÄSiK\ò°„,0š ª','RÃ©publique de Moldova'),
('E\èLœ´œÉºN4f\"','RÃ©publique DÃ©mocratique du Congo'),
('\á9\ö]‰rMD¢\Ã\à”†J¼Œ','RÃ©publique DÃ©mocratique Populaire Lao'),
('­!/©\êGD\÷¢c\Æ','RÃ©publique Dominicaine'),
('…-~²;k@«¬W\n‚f:Œ#','RÃ©publique du Congo'),
('’šDCD–¨\ö¡ÈœÀûU','RÃ©publique Islamique d\'Iran'),
('\\\ĞUBÑF^–\ô\õ?ü7\Æ','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('\í\ÓùcN¢¸¯Š0„A','RÃ©publique TchÃ¨que'),
('\èkl\ÏB‡¸,¹µøce\æ','RÃ©publique-Unie de Tanzanie'),
('\ê@¾m”A\ç¥ûÿk35†\Ï','RÃ©union'),
('C…•\áL\ã²\Ï]ˆ\Ós','Roumanie'),
('\åû\Ğp4Cƒ«\ö	Œ\ğ@\Ã','Royaume-Uni'),
('N4l!­\ïBÑ\ò¨ºDwN','Rwanda'),
('Œ—\ÜbÀCÌ³\÷H\ÎX`\ê','Sahara Occidental'),
('nÂ¾¶MÄŒ°\É5\Â\İ[','Saint-Kitts-et-Nevis'),
('œ¤\åÓKÅ¬E|f\ÈW\ì','Saint-Marin'),
('©Lµk‚Gù“\Zrƒ\Ê`ZH','Saint-Pierre-et-Miquelon'),
('Äˆ{‘\Ì>Dº¡Dªƒ­ø','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('	¥Y\rŸsK„…p.\Åv±','Saint-Vincent-et-les Grenadines'),
('¼\ï\ÖØ›9N\ê¬/`Á\ñ°','Sainte-HÃ©lÃ¨ne'),
('¥&h¥²M5–P’­)­d','Sainte-Lucie'),
('²š\İA,Nr­\Ä\Ú\òV”‘','Samoa'),
('ü=<\åMß…>XB«=\ã','Samoa AmÃ©ricaines'),
('$\á8G\õG‹\ÂTŒ²\î\ã','Sao TomÃ©-et-Principe'),
('aä­‚D\ğD}¨¤o$8nµ','SÃ©nÃ©gal'),
('N¬ša!Nˆ¤§¹2İ½zs','Serbie-et-MontÃ©nÃ©gro'),
('Xm¡%LX±A’úœ!\Ï','Seychelles'),
('w·w\ÑKA\n‚hAe\ÖY$','Sierra Leone'),
('\Ã\ñh¨J&IÎ“\ëE;\í~Á','Singapour'),
('ş‡çˆ·aH\í¨ûHNX\İq','Slovaquie'),
('}sl/„L˜\Ô\Ù!5m','SlovÃ©nie'),
('ª´³s\Æ\ÇD¨¶„š[\Ôwj\\','Somalie'),
('\Ü8\Ç4uKv¬Üƒg¹','Soudan'),
('he›0\"EÙ€E\ã•<ú-^','Sri Lanka'),
('‚\è\Ì\0\"sI,¼¬{\Ò\Ñ$\\-','SuÃ¨de'),
('\ï}£µ<7H¶m\ê\×\æİQ','Suisse'),
('q³¾×¨½E…1\ß8\Ó\"h5','Suriname'),
('ÕŠ‚\É.B0¢‰p\â\á6Gú','Svalbard etÃle Jan Mayen'),
('ˆlGŒE®\Ó\î¹\ì	\à\ò','Swaziland'),
('œ_\ÖÁ\Ù\nLî¥¡	@-”\ô0','Tadjikistan'),
('04É“W\0C6¬…U\Æ\ã#…','TaÃ¯wan'),
('\Å|l¸™IÚ“ûV\É\î&ü','Tchad'),
('üRJŠ\0Jz¶\ã\Ø\È^0°\É','Terres Australes FranÃ§aises'),
('ÿ‚+V\ÊG¿‹¦Î€š¦h\Ä','Territoire Britannique de l\'OcÃ©an Indien'),
('F\÷a\ÏEaƒQ\ÏMFŠ','Territoire Palestinien OccupÃ©'),
('=Œû\Z-Oá‘²\Ã\ÃÓ£\Z','ThaÃ¯lande'),
('ª·‘¦‹M8„h^‡|²y','Timor-Leste'),
('\õø|\ÑDø³\è\"»~u','Togo'),
('\Î‚\ÕFÍ¡§\ÜqGª@¢','Tokelau'),
('$\É_\Ø B¡“b˜HŞ¤z','Tonga'),
('Ñ¨¸ãŸN©²‰À`\Æ@','TrinitÃ©-et-Tobago'),
('3\ÊY\Ì\åD£²*)Ò²','Tunisie'),
('\Ãq «L@B”\é:”eb;','TurkmÃ©nistan'),
('l\â/ù´F¤£ 6[zX\á','Turquie'),
('\é\È\â.€E•¤¤\óº\ê›\å','Tuvalu'),
('@`\×\ãlFŠ‡\ã¤+„1\Ò','Ukraine'),
('\Ñ\Üt\Î\ó\áL„\0\÷Ö¢\à9z','Uruguay'),
('—]pU #M\ö¨3\ë+µ\ó½','Vanuatu'),
('1\î;Î¸€Dÿˆ«\ŞX\ÛF\ÔX','Venezuela'),
('Bş6K§£\ğs\n»\É \Ü','Viet Nam'),
('»:dj/I\"‘±\î\ña\àW«','Wallis et Futuna'),
('\òª\áIb†J®´Á\â\ğ—/¬','YÃ©men'),
('•ù¿fIz‘†;IŸ0	>','Zambie'),
('«3\r½]<E‚¯•MdO5&','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-02-11 14:30:56',10),
('DoctrineMigrations\\Version20240201152951','2024-02-11 14:30:56',4),
('DoctrineMigrations\\Version20240202084749','2024-02-11 14:30:56',4),
('DoctrineMigrations\\Version20240202150901','2024-02-11 14:30:56',3),
('DoctrineMigrations\\Version20240207105701','2024-02-11 14:30:56',5);
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

-- Dump completed on 2024-02-11 14:31:00
