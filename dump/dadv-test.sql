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
('À\İ}ŸhMÇ‡Ë S\æCÙ†','Afghanistan'),
('ÁE³\ÌO•³*€¾^\Ã','Afrique du Sud'),
('Yûÿ\ëÈ‘Fš;\ã0I«V\à','Albanie'),
('^\Éeh„E…¡\Ñ(f\èı','AlgÃ©rie'),
('¸ŒY\ÒJ˜q_L¥7\Û','Allemagne'),
('\Ü.„J\İJÑ…Y^=\æ†','Andorre'),
('Lp‰±ˆO»š\0œ)Z\ï¬','Angola'),
('\Zt\ğ+\Ô@LM‘nqTº\Z','Anguilla'),
('¼%\ê\×gJH‚\Ñ\ä¯0Z','Antarctique'),
('QL­\õ\ZHk¸¬¢:pœ^','Antigua-et-Barbuda'),
('–V\á_IB³\ö§\ó€\ê£','Antilles NÃ©erlandaises'),
('ûšS\Ï5\à@©Î–Át9\å@','Arabie Saoudite'),
('\ÔfOnLÀŠ\ne*ıû\Ì~','Argentine'),
('Å·\Ì }DŒ¥¸\Î\'\×;ş','ArmÃ©nie'),
('\éy\n<^\ÚJ¤w\Ó\è1•Á','Aruba'),
('Ò¤=µuM\ë‹ù¹\ÒP\à|¶','Australie'),
('mdV†AJ\05\ì‰d','Autriche'),
('\È\0şB:LL¦\Çj\óÛ±`%','AzerbaÃ¯djan'),
('¹É©¬\ÒVHÌ…†¾\ñ\Ñ\÷[','Bahamas'),
('/a<\ÇœJIš\àDÓ„œµ','BahreÃ¯n'),
('\ë\î\å…nLÅ‡\é¶\Ñp','Bangladesh'),
('AvJV\0¼NÎ§-¶SG¤U\á','Barbade'),
('\Û4I \ğI›~2IgX\Ã','BÃ©larus'),
('€A¯vJŸM{…RŒ¿\î)\í?','Belgique'),
('[`Z\ÈA\ë´.¦„W*','Belize'),
('9 ú&H˜D¾ˆe_0\Ä','BÃ©nin'),
('<º\á\êEAŠ;#\Äa\Ş','Bermudes'),
('{É€ŸŠ\ËCß¦5Í¦a','Bhoutan'),
('&İ•\êxF<Š%¶KUt”½','Bolivie'),
('1œL\è\òsI·—6®œ\Ûi¬','Bosnie-HerzÃ©govine'),
('\ö¹\İ0x\ÄEÛš‰L“¿\0','Botswana'),
('Áø\ï\ÑzÿOhƒ°¬½ı{\Ã','BrÃ©sil'),
('0(\õLK2`\ôŸ‰','BrunÃ©i Darussalam'),
('\÷9ù#pIµ7…Fı','Bulgarie'),
('_\ÃNuœ\öK3˜±4\äG\Ê\Ìş','Burkina Faso'),
('\ò&1±ûK°¦mCÖ†V\Ù','Burundi'),
('Ú…u=!GÇ˜&˜ş]%Ñ¡','Cambodge'),
('‚°RØ¯8DŒ»\öŒYªz','Cameroun'),
('\×\ß Q\ÒC5½»\ÓyÇ‘K','Canada'),
('¥y_ø±A¼¼L¿rü!f¯','Cap-vert'),
('{\Î#Aá«¦Ì”U\È\Ù','Chili'),
('-\à\Â{·Kš¢Û…6¤‹pg','Chine'),
('l–rŒP@ \r@i€n‚','Chypre'),
('] \ôR\ÔNj¿R2œTX\Ö','Colombie'),
('*OE\'HC^Œ)»ƒ²>8U','Comores'),
('syµk}@Ü„\07\Úû¸±','Costa Rica'),
('L3§Æ‡I\æŸxûD¨\äS','CÃ´te d\'Ivoire'),
('¼\Ì\ò5gC—+\örŸ\r\\','Croatie'),
('&]’Â±WDş®\è¶;û\ónQ','Cuba'),
('Pµ%\Ì\ÆM³E\Ö!ø\Ìÿ','Danemark'),
('Z\Ä\Â£®Læ\Ì¤%§}','Djibouti'),
('\àp©3–€O—F\\\ë>”k','Dominique'),
('S/\É«A¨\ğF¤\n¸\á½','Ã‰gypte'),
('\'%Ò­¸½HJCEA\äm‹','El Salvador'),
('UK\ÍŸI‡¾»³\î´','Ã‰mirats Arabes Unis'),
('¯’\öü¡J´¦Áz©q;','Ã‰quateur'),
('*t8sBGß¥Ÿ\ß\ä$\Ô\r','Ã‰rythrÃ©e'),
(';„®–O?·|`;G\â‰\÷','Espagne'),
('¾iY\åVC_„ü\÷\óøA.','Estonie'),
('<6o¾@\ë±1q{¢ÿ\Óf','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
(';\ó\r\ÎXHÒŸP\å¥U\Ö\ö¦','Ã‰tats-Unis'),
('›F×…=œ@E›DT—\êÁ\ó','Ã‰thiopie'),
('¬t\ô\ğJi¡Ll§“\r\Ä','FÃ©dÃ©ration de Russie'),
('£¾\õ’XIc MHK\é\Z3','Fidji'),
('•eFO\ñ¯CC­w¢€ûS˜F','Finlande'),
('j@ÀE}Lˆ´0\×\äŞ \á•','France'),
('\Ì_Ê€G\é˜xt»ƒü\à†','Gabon'),
('\í+‘˜!K¡Š–³l{û\Î','Gambie'),
('v½n 	kAj•½†!ş~®','GÃ©orgie'),
('\å—Mt­xÅ¦)|=©','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
(';\ãD°xMÌ¶{\n\ğ“$•','Ghana'),
('•”¸¶1K\âˆW\ä\Ó/X1','Gibraltar'),
('\Î.+OD¼½…*\Ö\Üü','GrÃ¨ce'),
('2\È\Òr¶Eû±BMM\á','Grenade'),
('ú¯pf\ÕAˆ‰:\ØB‘\â','Groenland'),
('YSß°CÀ£{\é [wµ','Guadeloupe'),
('\íw&\ôEH=–@š\Èg/F','Guam'),
('{\0\"/\íE	•5 m¥&','Guatemala'),
('eTa¯‰_O²¹5x\rx\Ë','GuinÃ©e'),
('±8ze9@Ó“\"c„K0»','GuinÃ©e Ã‰quatoriale'),
('¨\r”cO$¨3­2H6n','GuinÃ©e-Bissau'),
('d¤•T\Ë!@=£–zJ\êh€','Guyana'),
('\ì=8D}¬1ù=b\ác›','Guyane FranÃ§aise'),
('6Á\ÉÈ¨L•®¼Ö²£E\"','HaÃ¯ti'),
('O°q¿\ÂMU«\ã“O®…o?','Honduras'),
('\Ø?n/9£Ib‡\Ö:ş\ğe\è\Ë','Hong-Kong'),
('f|\0\çÔ”E+\ğ˜³6\Å\ò','Hongrie'),
('\ã.g™©°H5šVÑ–·\Ê8ø','Ãle Bouvet'),
('y§>\æ:eLAªhAXk.¡','Ãle Christmas'),
('\Ø\ï‚B+\ÕCO¿˜ºg\ö\Ì\ì','Ãle de Man'),
('ıd‚j6ŠJÚšKv¡û\Ê','Ãle Norfolk'),
('©¨D\ÔuAF‹¾\ÕK!Œúş²','Ãles (malvinas) Falkland'),
('™¿\×s\íGH˜Yˆ\Ô3\0‚','Ãles Ã…land'),
('`‚ù\î—O‘¯k~$\î*/','Ãles CaÃ¯manes'),
('\æ’1!~D‘á°„\é¯n\ö','Ãles Cocos (Keeling)'),
('u¼`\Å{¼Lu¸Eº\ò–\ö\ÊY','Ãles Cook'),
('\rRªjZL\æ”6ø[³Å¥]','Ãles FÃ©roÃ©'),
('GgˆxÚ˜@úˆJ\Ñ\"Š\ä44','Ãles Heard et Mcdonald'),
('¢\ì…\Zøq@€“|N™ºLŒ','Ãles Mariannes du Nord'),
('³gº\Ó\ïKä§œ-»0¿¨','Ãles Marshall'),
('®®\Ë\ÍÀu@\óN\ï_>Z\É','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('\İŸ~\Ì\àD\öœ\Z|°-”+','Ãles Salomon'),
('~^\ÂÁV(Cr¡b\í‘L-T','Ãles Turks et CaÃ¯ques'),
('\Ä»RE5»3INZˆú','Ãles Vierges Britanniques'),
('U’B—B6º¢™h\'\í>\Ï','Ãles Vierges des Ã‰tats-Unis'),
('£5\ßQ\Æ\İD€\îH†¦—‰','Inde'),
('©\0@±\Ö\ÏMü²B{r\ñÊ‹Y','IndonÃ©sie'),
('F\ö\'ü*sG¯¾\n\Ø\"—º','Iraq'),
('œ\Z«“\ÜGCØ­Ú«¯9','Irlande'),
('^‡\Å\ôLDÛ“ı‘&\ã\ğ\Û\ì','Islande'),
('?^s\ÂÈ’M¶·’ŸR\Òú.–','IsraÃ«l'),
('W¼>³VN¦—\ò±ü•\ô&','Italie'),
('!» @,­B—•©“\å\ä¿û','Jamahiriya Arabe Libyenne'),
('(¤:\öS°Cšyb•‘­\Ş','JamaÃ¯que'),
('\Ú\Ñ\Í\\vL_’…64Vhûi','Japon'),
('\æQt§L\ñH¯‰cIHƒ„Ä‡','Jordanie'),
('’\Ï$üfDÎ”/¤\\3wK','Kazakhstan'),
('=¶E{\õLT“zıÁ\Å*\Óf','Kenya'),
('!(\ØhIKzµZ©\\\õ\Şc','Kirghizistan'),
('JJ‡t}¢D¹Ş•–ˆO±—','Kiribati'),
('9\Â×«š\ÚOÄ”\ô!y’','KoweÃ¯t'),
('\ÇFK“D/s	\êI\å\ß\÷','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('…ø\Ìù„¦D­‚\0}\Ó\Éµ)','Lesotho'),
('{nêª–HVªÏ´£\íHZ','Lettonie'),
('gFgk”\ÈJ¨ _úvO?\İ','Liban'),
('¢7‰U\rK7µ•¢°À\ì\Ò','LibÃ©ria'),
('2İ’­\ÙFp²\Â\ñ)¨\ğÙ­','Liechtenstein'),
('\ro\ÅUJ\ÛLO·¦\òe8’A','Lituanie'),
('8\Øh,6FD’\è³ş\no²k','Luxembourg'),
('¬ |³\ôQK¤\Ñ_5…‡O\õ','Macao'),
('\İn]ncApª\Âºs¾UM','Madagascar'),
('…\ô:FÁ†;\â—O`Bı','Malaisie'),
('Ÿ$\Şp4CS\ñùŸ°','Malawi'),
('¸\Ödf¤G\'¬|‚\Ïm\Z','Maldives'),
('`\æ™\ÚmBVª\ãÇ¡\Üı»','Mali'),
('\Â\ôÍ½jN­ƒ!6F\â[?O','Malte'),
('7zZ|\í”ITŒ;\ó›\ğE9\×','Maroc'),
('3²]H£¾¢ıGY\â','Martinique'),
('º¨‹•½\îBk¿Á˜\Ï\Ë\àø\æ','Maurice'),
('\Ü\í+\óNMqŒ43r@\Í\ô','Mauritanie'),
('¹L¬	I´‡«D\ô›¤','Mayotte'),
('\ñ°b\ÎgF&®GW\â\á;p\'','Mexique'),
('MA3mAüD”ø²Ÿ6\óI','Monaco'),
('iß—.\ÑG+ºiÁ °£}F','Mongolie'),
('R’DGK¹›mOüÁ 8','Montserrat'),
('\ä‚Bÿ\êsH\ã·!.1˜\ò\Â','Mozambique'),
('¸9‰ûù8@\å\raFK\Ê\Ö','Myanmar'),
('3+³\ÎE_š8™Ÿı/','Namibie'),
('[¥>y¹L\î¨\ôÁ³±%\Ù}','Nauru'),
('x ¤¢•M\æ\Î\ä*\rµ%\r','NÃ©pal'),
('6\n\ğWú\ÎA&‡\Øä‹¦q¬\ï','Nicaragua'),
('ª\ã\ó_\êD+‚­š\È‘Ë','Niger'),
('<\å’`A%Šo\0\á4†‚','NigÃ©ria'),
('¶‹xY\ô“Dg¤\æ?\×W­','NiuÃ©'),
('²\ÉùÚ¼\'IR€‰Jpf\É\Êû','NorvÃ¨ge'),
('#‚„l7Ci\à>kj','Nouvelle-CalÃ©donie'),
('q‹€Ÿ\ï7J…—\à=“’','Nouvelle-ZÃ©lande'),
('\Ù`Æ“XCÜ´ \ŞA%Š','Oman'),
('üR·\î¾\ÄO»¾F³¦m\Å\õS','Ouganda'),
('¼©*ª?\ñD©3ˆN<½V','OuzbÃ©kistan'),
('„Á¹D\ÎJ\0J¼\îE%\Æ\á','Pakistan'),
('Œ-kLŠ\\\ì/j†w','Palaos'),
('Zz\ìS+Gš‡^=œ¯º¾','Panama'),
('6lVE<\ÂK«	ÔŒİ”\Ç','Papouasie-Nouvelle-GuinÃ©e'),
('Ÿ`:gkcJ\r¥{’\ãT¤','Paraguay'),
('@€*ºVC3°»S¦\Ín²','Pays-Bas'),
('§wq•©¯GUš”—-\÷\÷|L','PÃ©rou'),
('ƒ—(º\ÛXN ¹\ïş	û·','Philippines'),
('\n\åJ\Ñ0\ğJ®`\nP˜•','Pitcairn'),
('®YmA­d\ê\ß_§','Pologne'),
('b”e¬\Ñ;Méºi¯-\áË²','PolynÃ©sie FranÃ§aise'),
('PÇª°¼oB.Š¯c\ò-ş†\à','Porto Rico'),
('o\ŞxBsú>D\òj£\ò','Portugal'),
('cCÿÿ@f¤N…m†\ì\"','Qatar'),
('\Ó\Ğ=\Í¨B´¿\á:%ª_','RÃ©publique Arabe Syrienne'),
('s\éd{ºBÔ‘¨¿¦4','RÃ©publique Centrafricaine'),
('js¡\ö¯A¬nk#\Ï\ã','RÃ©publique de CorÃ©e'),
('×&c–HƒŸ\Ğ\Ì¡¯	ø','RÃ©publique de Moldova'),
('\îèŒ…FFŸ‰\ê\Ù\í\çøSx','RÃ©publique DÃ©mocratique du Congo'),
('¾-ú1\âJ-›s£¹\æ:t','RÃ©publique DÃ©mocratique Populaire Lao'),
('©û®-vM’º³\å\Â\é…f','RÃ©publique Dominicaine'),
('!P´_¸–E9‹;|¶\Ê;S\Î','RÃ©publique du Congo'),
('0E\Ì˜Kœ»8´U¸€Ö‚','RÃ©publique Islamique d\'Iran'),
('i)\ÖJ)FH³h“8ŸÅ§','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('h\İÎ‹\ß\nI¥Šâœ­‹\ê:­','RÃ©publique TchÃ¨que'),
('/y<\ÑWF«¾\õy6W³j','RÃ©publique-Unie de Tanzanie'),
('ŸDiı9Jå–•Q3İ»ü','RÃ©union'),
('Bz~=ÀeJÃˆ´\Ü1ú\àÃ','Roumanie'),
('úb<¥~@&®v™%“7È¼','Royaume-Uni'),
('§M²ÎJ»‚1lÁ\é(Á','Rwanda'),
('TŸEipO%µø³\Üÿ\Â\Ü','Sahara Occidental'),
('\ê+6\×@’qCu\Û\Ó{;','Saint-Kitts-et-Nevis'),
('\ä\ÕP\Öp+L2—\Ü\æ\ã¯À7','Saint-Marin'),
('H\å\Ì\ö~J%HiS\à\äÁ','Saint-Pierre-et-Miquelon'),
('/¿r\ğ\ã+I)›W$qªB\åd','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('Ò¦?¿[\îD*‡}®\ğ\ËA7\å','Saint-Vincent-et-les Grenadines'),
('\Éx£#@€\Ï.Ò“ûz','Sainte-HÃ©lÃ¨ne'),
('’\Û\Íz J¥µi,˜em\÷','Sainte-Lucie'),
('\ê˜af\ØqE²€H)&œ±\ÃQ','Samoa'),
('&r`A}¦ÁH\Ô_\Ù\á','Samoa AmÃ©ricaines'),
(' ü!¾\çBAp©\ê9©mÏˆ\ä','Sao TomÃ©-et-Principe'),
('ku)³¼H—‚\ÈIM_®l\Ø','SÃ©nÃ©gal'),
('g¡U]I›Œ”_>KlŠ','Serbie-et-MontÃ©nÃ©gro'),
('\ä\ß^Ag¦ú©Ÿ','Seychelles'),
('\ö·—eBH”“\\¨q€„YI','Sierra Leone'),
('\Â\Å7º^OÂ­D\Æa‘q‰z','Singapour'),
('À\Ü\Î\õ\ãıC@¾\ækµ\äD','Slovaquie'),
('¤\Ìj7¶\äL½£6Q|\Ú(Kµ','SlovÃ©nie'),
('¤\Ï@®{\×Az¾Û°6z \×','Somalie'),
('G„\çúY@>‘hY‘?\÷_','Soudan'),
('o\÷0°K—Ÿ˜\Ò\ŞVzf','Sri Lanka'),
('‡`Ê¨ttJÖ€c«<†@q','SuÃ¨de'),
('\0\à\ÜX)2MÈ£\ô\Éù/¿\r','Suisse'),
('‡ÿúKJ£³†f\ğƒ¾u|','Suriname'),
('°\âû\ÇÃ™G¹·Y>‘\õ!²','Svalbard etÃle Jan Mayen'),
('lP¿6qŠG€agü:\ë­','Swaziland'),
('§C—ü\ñ&FŒ3\ğ\à³\õ«\Å','Tadjikistan'),
('9ø\Î\Ä	½G¾·×£\Æ?]','TaÃ¯wan'),
('»Rh\÷¡Aİ‰\ÑÆ„ŒS‚','Tchad'),
('=\î=,26Iq¨È­úÖ','Terres Australes FranÃ§aises'),
('{½‡d«C\æÿ\Ö³Gµƒ','Territoire Britannique de l\'OcÃ©an Indien'),
('E‡ùA@EÓ¹k\Ó\Ë\àZvm','Territoire Palestinien OccupÃ©'),
('J`\ÂN¹\İKÂ–4cÙŸÕ»€','ThaÃ¯lande'),
('¿\Úı×œ@\ãŒ[N\á[qœR','Timor-Leste'),
('G;±·\èD\\¡$mXbØ•0','Togo'),
('ÆœVIH‹R\ëqYÎ«¤','Tokelau'),
('5\æz¢1K±–¼%Œ{}©','Tonga'),
('ªM\0aA/˜ztuM\Ô\È','TrinitÃ©-et-Tobago'),
('2ŒÀu²\ÇB›B\Ê\âdª½','Tunisie'),
('ÿ¶\ÆP?JD¶š\È\ô–M£o','TurkmÃ©nistan'),
('Qü,D9…°\áA\õBHF','Turquie'),
('Ur\ã|‘°E\ê Å°Œ\È=Ú˜','Tuvalu'),
('»Ô·\r£„I5ª©\Ş\Ñş\'l','Ukraine'),
('V\ãL\õ\ÖIW‡\Ã<ı\\¨\é#','Uruguay'),
('\"¸ø#(MT¿\Ä\Â&ûg¾ ','Vanuatu'),
('\æ·NK£\ğ\'û\Í!','Venezuela'),
('\Âû¡\Û@$Iû·\î\õŞ¥]\Şv','Viet Nam'),
('0lJNG®¯6`™','Wallis et Futuna'),
('f\È\ò^¶L¨†\ì0ªÄ¤','YÃ©men'),
('\Ã*\Â!EA´§T2‘\ï','Zambie'),
('Á›\æh8	IJ¥\ëZ´½x\÷s','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-02-08 13:43:18',9),
('DoctrineMigrations\\Version20240201152951','2024-02-08 13:43:18',2),
('DoctrineMigrations\\Version20240202084749','2024-02-08 13:43:18',4),
('DoctrineMigrations\\Version20240202150901','2024-02-08 13:43:18',2),
('DoctrineMigrations\\Version20240207105701','2024-02-08 13:43:18',6);
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

-- Dump completed on 2024-02-08 13:43:21
