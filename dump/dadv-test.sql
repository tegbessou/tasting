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
('\ô®\ó\ß\ßI{¿6h+N‘Kº','Afghanistan'),
('ş\ñl\å†H	¿\îª\öÀıµ\Ğ','Afrique du Sud'),
('¹5\öDK\×KI¨»\ÚZ\"VF','Albanie'),
('\ì\"~%şM¥£U‘nk ¯\è','AlgÃ©rie'),
('/\0Z!pˆFp€+¹2“\Û>Œ','Allemagne'),
(';vÚ‹-ªH—€\ëo\Ü\á','Andorre'),
('\â«‡‚@{ƒ¯’X/\â\Ôd','Angola'),
('\n\ã\ÍomB2o²±­˜\õ','Anguilla'),
('JzcuÀ@ËœR¦55\Ş\n\Ş','Antarctique'),
('‡¬#z\ZO”‘˜z\Ñ\ä\Ên','Antigua-et-Barbuda'),
('{|\Íp(EÅ‰‚{*\ì\à”','Antilles NÃ©erlandaises'),
(',‡\Ç;/@ù‘F:`:j','Arabie Saoudite'),
('gJ\Z\ïF_«Ÿ&\æƒ\ê','Argentine'),
('Y®øbúF‰„\ç_Z\é\ÒE','ArmÃ©nie'),
('\å´uA\ÖBK¿\Ò%\í6\Ü','Aruba'),
('ÿ‰yV+FY½å±—+²I','Australie'),
('$×\\ŠC4§\Ò\ó«B%SV','Autriche'),
('m\ßv–\Ò)A­¢W\ÎsI”1','AzerbaÃ¯djan'),
('\Í\íN7\ßCX¾ES–','Bahamas'),
('J¦’ı\ëtF7¼\×\ÏYd—Á\"','BahreÃ¯n'),
('¿Y,²I‚»\Ïq”w\ã\Ñ','Bangladesh'),
('†\"\Ò?\ÕLÜ¡(`C\\b0{','Barbade'),
(',Àª\Ó>fA#«‡\Ñ\ZX','BÃ©larus'),
('’Y]\Åø\ëDøºwKk]\ãZ','Belgique'),
('\ÇC\nº?2HQ¯Á^Ch™ú','Belize'),
('ø¬$q\éA»¹_°#q´ˆ','BÃ©nin'),
('N}lƒc¹OB‡ÿ¥Â´¦\à\\','Bermudes'),
('\Çrz0Ÿ\nG°“ƒ$L\óû;ş','Bhoutan'),
('¡\èQ@F•²:–\ë.o','Bolivie'),
('7\Ó\èVNF§!.\ÂI•','Bosnie-HerzÃ©govine'),
('b°\Ë{\ëC4†$\Ú@‰¡\ÎA','Botswana'),
('’¤qDÛ‹\É2¯Iœø+','BrÃ©sil'),
('Ã„DL˜\É#\É\ã\é','BrunÃ©i Darussalam'),
('¨\ØÌŠ?Kq·+l´^(\ÅY','Bulgarie'),
('=ûÊ¢\ÚF{ŠùBD¢^\Ş','Burkina Faso'),
('\0\Ò5\âG+Jº¾\Ûf\ÊL2:l','Burundi'),
('‘\ôqJ©C\á…\ô‹9#“g','Cambodge'),
(';®ÌŠM™½1qÁ˜\0­|','Cameroun'),
('cƒ»]@‘˜À\Ü&ı¼S','Canada'),
('¯&\èB\ô¾]7±\"©','Cap-vert'),
('é¶=’\çNkŒ:{\Ö\é2¦«','Chili'),
('B$ª\á…LÄ­İŸÁ„£','Chine'),
('*˜Q£JÊ¨\Í\â¾Yµ\Ï','Chypre'),
('o·¨\×ß…G\ä{¸9¢!','Colombie'),
('9¸5\×LN¸¾—‘\à~\\\"','Comores'),
('nZ\öjq4KE ¯‹9“yº','Costa Rica'),
('‡†!\ÖAM¸2GC\à\Ä\Z','CÃ´te d\'Ivoire'),
('%¡4\ô\ÙqJ\ğˆ\ğ/OŸ7Ë£','Croatie'),
('Y±\É1M³¢„X\ã¥U·`','Cuba'),
('³\è–I+²H¶¡Í”x1­Š','Danemark'),
('ƒRwUG3œ\0\×L\ö_U','Djibouti'),
('\Ñø\Ï\õB:¿©}J®h\ßy','Dominique'),
('›\è\êz\ç7Là«sr\ì›H…','Ã‰gypte'),
('f~\Ô\ß\ÆNÑµpL\0]bh&','El Salvador'),
('—ÁL	\ã$Jµ±\İşlL´®','Ã‰mirats Arabes Unis'),
('\ğ-\É;Í¯@»Ñ´WgF','Ã‰quateur'),
('Ş–Œ\ö\ÛB\î/\ö`O0','Ã‰rythrÃ©e'),
('£\Ø\ã¿IN¡—À0œø†Q','Espagne'),
('\Çbœş¥³DÆ°ƒw%›±{\å','Estonie'),
('¿‡rEÚš|O(*˜','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('«vŞœ«Du¢j\Ïan:·','Ã‰tats-Unis'),
('³^¾t»D†˜şf^{\Îfd','Ã‰thiopie'),
('…*§d©8@/¢ŒF#Y`·','FÃ©dÃ©ration de Russie'),
(',\ÏÁ¤\î\ÙM\\µ\âú{Tt\È','Fidji'),
('\åı±/N\á³×´i­®”‘','Finlande'),
('\Éj\×%YJŒ\Û\Ä:ˆû','France'),
('‹M±NÓ\Ó\õ“\ñ\÷\Û','Gabon'),
('1=Ê\ÈN¦¿»o†3p\Ø','Gambie'),
('<$œu\åO‚¸³º‡-y²','GÃ©orgie'),
('\å]\ğ\rHG²ıƒÇ·øi9','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('¿T²\İ@‘L\äƒ\áX\âA!H','Ghana'),
('£P¬t@\ğ¬?%Q2€%À','Gibraltar'),
('ja= CK\ë·	\Ïj¼GS','GrÃ¨ce'),
('4©¨LLºŒµ\é)ª\n9','Grenade'),
('0°N\Ø0\ÈE¦ \ö\ÏË§R','Groenland'),
('©„®\Ùz‚K”¯ƒ’³·%M1','Guadeloupe'),
('¦<¨\Ä\ñN•ªRl°qn','Guam'),
('²´\ö¢\ÖK·ˆYO\ÉUD\æ<','Guatemala'),
('û\ÎI’?\nH¬Ï¨\Ã¹¨\ô','GuinÃ©e'),
('\É\r\÷f\ÄLÛ¥\Ìz9¢û$','GuinÃ©e Ã‰quatoriale'),
('}¹v.W´A\rœ¨_','GuinÃ©e-Bissau'),
('3\ò JM\Ùm¦/\ÑL','Guyana'),
('«d¶‘\Æ\ÔI]\èw\İ\àm]›','Guyane FranÃ§aise'),
('5£`w[HÓ²L\Ú3\Ï.\Â','HaÃ¯ti'),
('\ì¡\ØJ¿#\ïx8=','Honduras'),
('xZ\Ã\Ùh+Mü*\Ï\Ûê„½H','Hong-Kong'),
('\Ñ.\ñ\÷ÿOÔ\Ü\Î/ú\Ş\çª','Hongrie'),
('›ÿ¾HÖ\rúe\ô<µ','Ãle Bouvet'),
('K>\×oƒGK»«}\è¢ø\Â','Ãle Christmas'),
('­\â\Ùq,\Ê@ß£ûšK\è\Ñ>®','Ãle de Man'),
('WŸ˜¤GÇ ³&\ÏD{WS','Ãle Norfolk'),
('\×\Å.gp•A\ê¿\\Ì¹Y\Ëu','Ãles (malvinas) Falkland'),
('¨\á\Å\ôBJÈ¸\Î¡Fn\Å','Ãles Ã…land'),
('ºµ‡\èH\ö–7\Å1<~$°','Ãles CaÃ¯manes'),
(';¯_p\ÙEp†_Á\ôl\á','Ãles Cocos (Keeling)'),
('\rÍ—†µK7¨#Ï„\Ìû','Ãles Cook'),
('Å”y\ßÊƒJß§ÄX“£#P','Ãles FÃ©roÃ©'),
('\',{P\ÆK²‘‡wgP£¼)','Ãles Heard et Mcdonald'),
('\á¸Q\î¶9F¼™Ln\ä²E','Ãles Mariannes du Nord'),
('¢\Äº\÷HW¥\Ş9B~\É','Ãles Marshall'),
('·\ãù²–\ÖK‰%\Ğ96¢','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('w\Ò\àtÓ’F\æ€^~<N¡\ì','Ãles Salomon'),
('ª*º\nG©A–€\çv\äø ş','Ãles Turks et CaÃ¯ques'),
('7˜8N\ò4L­­\æ\Õ1¤K','Ãles Vierges Britanniques'),
('ı=\Ór¬G>£–\í\ë¶	\Í','Ãles Vierges des Ã‰tats-Unis'),
('\Ñ.¯&BY°Äºl¡\ó„','Inde'),
('£U3W\ÅjLøˆ]¹\Ê(5\ê','IndonÃ©sie'),
('SCvM\ì¦L…®ú^\ÛsKº','Iraq'),
('y‡šD¯‡K~·ş´0>\ï\Ö','Irlande'),
('\Ô4y\ra^D\ä¿Ê¼»\ÙÀ~','Islande'),
('à¢•\ô\àøO†ÿ\0®/µ(z','IsraÃ«l'),
('—b \ZšBÎ–\Ç>4¯\àA','Italie'),
('\ğn\İ\n\ÔI(•UwN¿‰³£','Jamahiriya Arabe Libyenne'),
('¿K$\"úRA5£´`ù}\é-®','JamaÃ¯que'),
('l}\ÅXDY¡cVc\É\ì}A','Japon'),
('z¿¬,NM±\ß‘cï¼ª','Jordanie'),
('[¿\\«T¹@hŒøjù€p','Kazakhstan'),
('\ñ\ÂW€E#I\ó¢˜OÁ°\Ò','Kenya'),
('°†·B\íB`…\â–RıMV','Kirghizistan'),
('QQ\rŠF»¸v\Æ]³Œ','Kiribati'),
('‹\ä¹qn¹Ms­\\B‡¬\Ún!','KoweÃ¯t'),
('‡\ÊAs\rN™x4[RR>J','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('’á¤x\ÆC^‰y\ÄŒF\n','Lesotho'),
('TL–Ëœ\ÊD½«’)\Ë\ßve','Lettonie'),
('D!49\\‹K-‚\æÅ¹af','Liban'),
('¼5\r˜+N“ƒŒ\æ}¨\æ~3','LibÃ©ria'),
('[\ãÃ½8L#¾N,\ê\Ó\Ñ5','Liechtenstein'),
('D+s\Ê\êhA}«¨ƒü†-','Lituanie'),
('\';l\ò”B\\º”ø]/B­','Luxembourg'),
('\ÃQnZ\ìL€0ûºC“','Macao'),
('F€b\ny Cµ‡\Ù\ÄPtÀ','Madagascar'),
(':€U{ş]Mº®©¤B–³¿[','Malaisie'),
('*L¶¸qOù†–/Vfrú','Malawi'),
('øk Õ´A:®e‘\ä¤Sv','Maldives'),
('\éŸed”K‰I€…¦Y \ì','Mali'),
('\à\ö°\æ\ëN§Ÿ5\\ø\îtŒ3','Malte'),
('%Œv=HNÛ™NÈ³o\È`','Maroc'),
('ş ‚®&E\ğ¯yÕ¾\ñ¹','Martinique'),
('½œø\åaK¹$ª(\ß\òVF','Maurice'),
('!\ÓSˆ¡úN˜l—¢u˜-','Mauritanie'),
('\ö\ï\õ;¸A\õ’\×C \Îlx&','Mayotte'),
('\\(C6¿¢zf¦v2','Mexique'),
('¿šdpBO0¿\Ãù’ÿ)','Monaco'),
('5ÉŒ$^L\\—\ìl–+;\Ø','Mongolie'),
('‹xû\ä(4DÑˆS\rì¤ˆ’\ğ','Montserrat'),
('F\Ä9’\ÙzF¥€úF²\ĞS\Õ','Mozambique'),
('©´&”H¼\×\ê\å\ìb','Myanmar'),
('~-\Ãu,I\ó°/É¹*UZ','Namibie'),
('\İ}¯ŠÆE\è¸f?¢ı6ûw','Nauru'),
('\Õ±\Ô`EÄ¨~Î¤qÛ°F','NÃ©pal'),
('E\èTûlNµ¯_ÿ§W3‡§','Nicaragua'),
('2M¡\ÛP´B\"[y\ñ†U\ğL','Niger'),
('¬l\Z#£xE\ô”“Ñ¸}\áÀ','NigÃ©ria'),
('y»4 O\ÑF\ãœ™\òº¢','NiuÃ©'),
('\áRXˆ\Ü!CØ—XMy\Ã\î\ñ','NorvÃ¨ge'),
('—»\Ü.nCu®”X—-','Nouvelle-CalÃ©donie'),
(',ÎµO}K]¼W3„»\ôy','Nouvelle-ZÃ©lande'),
('m\ğ\Ê`	JÄ­\ÃU´YN\Å','Oman'),
('ø?\Û2||H=¿\áGU\Ğıš','Ouganda'),
('Ú¯7\Ö\"Hš¶“w°\á\Ã\"','OuzbÃ©kistan'),
('\Ö$\ğ|GK‰|–hA\ë¼L','Pakistan'),
('£9ˆe|\İF°‡Å¬cM\è\ë\ñ','Palaos'),
('\Ç\ì\çSi@«š\ZX$½\Ñ','Panama'),
('f\Í2\ï´C—›1\"¥~a=','Papouasie-Nouvelle-GuinÃ©e'),
('OeZƒ\ß\ZIh‚\ã\Ş,\Ô\ÚC','Paraguay'),
('\Í\Ì\ÃÿŸ‡E2šÇ²\æ\îş$','Pays-Bas'),
('\â\r1Ø”ûJª‘AI\Äÿ\È','PÃ©rou'),
('Œaµ8‰,OFˆ|ıGƒtˆ','Philippines'),
('1¿‡q¡†Mı—C\õş\ï\åJ­','Pitcairn'),
('à¤‰Œ\nK&›LmÁÍ—','Pologne'),
('7ˆ]™\ÃNRš\Ø\à¤wÁ|','PolynÃ©sie FranÃ§aise'),
('•\ôO\ÙMO,‰H¹”:\Ş\â','Porto Rico'),
('\ğ+\ÒkŸ·Oc‰Ár\Ç\é;','Portugal'),
('\Æ	M¤Ó†AC¼\î\Æz^','Qatar'),
('˜\ï\Í]K¼}nH\ßüÿ\Ğ','RÃ©publique Arabe Syrienne'),
('\ôW\Ê\í”H)«)¹“¿¼7Y','RÃ©publique Centrafricaine'),
('(»É³\n¹Aq¨\ÏrH0y\Ú[','RÃ©publique de CorÃ©e'),
('{Áøœn\çO¿„)›pa|e','RÃ©publique de Moldova'),
(';ˆ¤$M^?\\¶Au$','RÃ©publique DÃ©mocratique du Congo'),
('¶¹em§fAŞ‚\ì! \É\İ','RÃ©publique DÃ©mocratique Populaire Lao'),
(',¬dfY©E\å§\ã[Ã—:\Ì','RÃ©publique Dominicaine'),
('4¨ï€D†¹O»©/k»','RÃ©publique du Congo'),
('?\Ûı‘ŸK€1<98\\\"','RÃ©publique Islamique d\'Iran'),
('\ë­85g¶E*­O\òQ','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('6P\É@\ó†€{Îšx','RÃ©publique TchÃ¨que'),
('\ÆŞœ\ê¥MK$£µ\ÏB*so','RÃ©publique-Unie de Tanzanie'),
('\â¤\ÜIj°G—¯b$¼UK\ê','RÃ©union'),
('9}œ\ÌA\ó»ŒAŞ±c„´','Roumanie'),
('5apªMcƒr–<\ËH‹ú','Royaume-Uni'),
('9£Ù \â[L\â¦\ë\ëCn\Z[','Rwanda'),
(']\ÑşR\ëşBûµ†2£>{\Ì\Ş','Sahara Occidental'),
('\Ûr\ö=\İ\0NJƒ\Ñ\è¹8/µ\Ö','Saint-Kitts-et-Nevis'),
('*Y\êUB»»\0©\õ\ñ7\\','Saint-Marin'),
('	ÿŒ|IH®Š\\\Îzíƒ¾','Saint-Pierre-et-Miquelon'),
('xß¯kŒO~™\îE\Ëşc¡','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('®ú4\ó\ÔFÍ¬•¯\ö\Ë+ü','Saint-Vincent-et-les Grenadines'),
('\ÔJdpIÅ‘\äX\Ê\r','Sainte-HÃ©lÃ¨ne'),
('NC\Ô™HE•>\Ù\ó\\\×\'','Sainte-Lucie'),
('{|{Y\ÛG‹§\Z—‘G\0\ï','Samoa'),
('D.W7§\'L\r…¾|¨³\éA_','Samoa AmÃ©ricaines'),
('s¸[şIÏ¦€\íCAtú','Sao TomÃ©-et-Principe'),
('3tx\ã°EÏ«\Ó\"X3ºU‰','SÃ©nÃ©gal'),
('”/5»BX£“g€\è\ğ93','Serbie-et-MontÃ©nÃ©gro'),
('¶¸ZOS¡\Ã?\Ö¹¢','Seychelles'),
('i‹BÁN\çGx½?”3:\0p›','Sierra Leone'),
('Š\æ\ås{¤K[8ÿ|O”v¬','Singapour'),
('±µ(\ìN1¤\Ön-™\ïJ\r','Slovaquie'),
('ş\r\İ\Ès@¥°\ó\"Y)K\n\Ò','SlovÃ©nie'),
('\\\Üj\Æf\ÒB ¡6\Ë\'\'Y','Somalie'),
('ù\ä:¥\0G-“s~­\Ô*K¥','Soudan'),
('ø&P/w?L¢\à¿\n¤±[','Sri Lanka'),
('`¹\ó-\õºE©Ô³×ƒ=\È','SuÃ¨de'),
('3vsZ\ÚG€,ÉŒù\Üu','Suisse'),
('rC*GÈÔ ø\\}','Suriname'),
('\ßv\ç\ÉJ@›¢m\İ\Í–','Svalbard etÃle Jan Mayen'),
('I\Ê\r\Çg§Bß‚OxL77¹\n','Swaziland'),
('Z%3sG?´p\Óa¬\æn','Tadjikistan'),
('\Ã<\Ó]Á\ÄBş¼l³–E„','TaÃ¯wan'),
('=¯¶lBQ´•3Ÿ\0;','Tchad'),
('\Ò‚\àtMó¾³·\ö®E–¿','Terres Australes FranÃ§aises'),
('²\nœ¹tF«‘\õ\Äp\Ø\Å','Territoire Britannique de l\'OcÃ©an Indien'),
('†A0«\İ\ÆGÎˆ\õ\Î\ßa\n','Territoire Palestinien OccupÃ©'),
('©–\åŸúA\0›‘Ã–6¡¨2','ThaÃ¯lande'),
('N°?\Ì\ŞkG[™\æ\0µs','Timor-Leste'),
(';ÿ®¦R\ÜB\æŠ\ïş…59\ïø','Togo'),
('›ı]6@l±l¾†','Tokelau'),
('\È\ÅR\Ô%NQŸ%ˆC/\Äİ§','Tonga'),
('FZı˜G¦AÅ€=­Ou\Ô;','TrinitÃ©-et-Tobago'),
('xwMU\åG\éƒ¦Us!Y','Tunisie'),
('©iœÁˆ\ÚC“‹¥8 u\ô','TurkmÃ©nistan'),
('\È\í\ÛC€H0‘\÷¿\ŞV‚H','Turquie'),
('}\æc…JEå›¹L2ÿ\ÆD?','Tuvalu'),
('p\İÍ®\ÇG\ñ›UøLpm+','Ukraine'),
('\Í\î\ñ¼—Lƒ†Ù·\Z\àB½4','Uruguay'),
('uV\Íu‹Oä˜¤a–\Ï/e','Vanuatu'),
('2‚>X—šM¿²N\Öšû-','Venezuela'),
('P\õ†o•@L‡\Ş\ÖùW\ó~','Viet Nam'),
('\ã\ÊX—\ÃEv»k\æ‡(\nıw','Wallis et Futuna'),
('(~U\è¾\ÏM¡c\ê(lLœ','YÃ©men'),
('3ay\ÃDIA¸Y\Ô\ßGt\Ê','Zambie'),
('€¦ş\õ\î\ëF‡Š?\æ\Ë\Ş','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-04-12 19:52:00',5),
('DoctrineMigrations\\Version20240201152951','2024-04-12 19:52:00',1),
('DoctrineMigrations\\Version20240202084749','2024-04-12 19:52:00',2),
('DoctrineMigrations\\Version20240202150901','2024-04-12 19:52:00',3),
('DoctrineMigrations\\Version20240207105701','2024-04-12 19:52:00',2),
('DoctrineMigrations\\Version20240319212437','2024-04-12 19:52:00',3);
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

-- Dump completed on 2024-04-12 19:52:02
