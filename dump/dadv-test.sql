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
('«\õ\åBİ—Hº\ë[\áPP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',259.99,'2024-09-15',NULL),
(')R1„ú\ÎN…‚7\ÍP\î','ChÃ¢teau Latour','ChÃ¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',999.99,'2024-09-15',NULL),
(':(\Ş\î\ò!J¡€k[\'{ü','Domaine de la RomanÃ©e-Conti','Domaine de la RomanÃ©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',2999.99,'2024-09-15',NULL),
('N´I\Ù}#I„¦wªü\Ì`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Italie',899.99,'2024-09-15',NULL),
('^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1599.99,'2024-09-15',NULL),
('c^€œª¯@ß„ƒƒÏ¾,U','Guigal CÃ´te-RÃ´tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'¾m2\Ü#M¿Œfh\Ñ3[¼','France',358.99,'2024-09-15',NULL),
('i\n„s‚¯NW’Í‘†±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Australie',1799.99,'2024-09-15',NULL),
('{\Õ]\ó\å<Aƒ¤^Ù¼\Õ\r','ChÃ¢teau Margaux','ChÃ¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','France',1099.99,'2024-09-15',NULL),
('—-L\ÚFAŒ4S\õ¢\á\éú','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\Ë#zO0±ˆj­q´s_','United States',199.99,'2024-09-15',NULL),
('µL¯\éCnG¤”VajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','¾m2\Ü#M¿Œfh\Ñ3[¼','New Zealand',49.99,'2024-09-15',NULL),
('\ç\òG¦fF@Š\È%\î>\ëm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Italy',899.99,'2024-09-15',NULL),
('\êÂ¡\ÙI^€Ü“°¶W\í','Vega Sicilia Ãšnico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','¾m2\Ü#M¿Œfh\Ñ3[¼','Espagne',1499.99,'2024-09-15',NULL),
('\ğwªÃ¤O\ZŒ`vº\ç·','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','¾m2\Ü#M¿Œfh\Ñ3[¼','Ã‰tats-Unis',1299.99,'2024-09-15',NULL);
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
('4¬å¸¥\ØCİˆ<nw.\ï\Î+','Afghanistan'),
(' \Ã}@\âvCŒ®½\é­3c#','Afrique du Sud'),
('\ãi\í«B¡²Ù§\Æ(.V\Ó','Albanie'),
('‰ï¯ƒ\rqG8¤\åÌŠ®ª$~','AlgÃ©rie'),
(';‘V!LN“Y(V\Ñ\ÈÛŠ','Allemagne'),
('e`\ÍY\ÏKLü§\Ñ\Ô6?%z	','Andorre'),
('”0Ì«;Bc¿¹¿v‰\n\î\Ü','Angola'),
('Á\Ëwˆ\îKä¯‘\Éc\ìüI\Ï','Anguilla'),
('Á ¡\ÙK`‚,5ºS·\Ğ','Antarctique'),
('\È+&\èA\\µ¡\í\Ï\Z#›','Antigua-et-Barbuda'),
('.?S\Îú‡K™¦²´\Ì,P\0@','Antilles NÃ©erlandaises'),
('²h‰.)´AL”\0ù­N\ö$','Arabie Saoudite'),
('‡\Ñ\'\Ô@@/œ¦M½Ô˜\Ä','Argentine'),
('\ÈüCY6M·\Ñ\Û¯U‹','ArmÃ©nie'),
('¢ù\æç‰FV³ND«\Ë\ël','Aruba'),
('?º\æ«\ZA‘\Ô\Ì\Ğy½W','Australie'),
('ŸıC3\ë]B½¸iv','Autriche'),
('Y\â–S\ĞC’™Ô¨´nË³','AzerbaÃ¯djan'),
('}¦ogA]Û®‡\Ø0Gv','Bahamas'),
('ÿ­i›½G\ê±˜Nq*{','BahreÃ¯n'),
('ø¯Û¹\ŞKJ“(\ç\Ã_»0\'','Bangladesh'),
('xJk üOAˆ\åT¡\ÓN','Barbade'),
('sr\ô<s=Ngº\÷5\Éj¶¯','BÃ©larus'),
('–‘\ó¡û+IX§ `]u\á¨','Belgique'),
('\òubH…«\ÒÒ›=\ö§€','Belize'),
('\Ù$=_J@¾®Å Z\æ\Ö','BÃ©nin'),
('\\²|ƒn>KË£\Úr™Xg+ª','Bermudes'),
('Tü/\ÆCª€m\íT!','Bhoutan'),
('2T»\Ö\n5C ¸ ¹#°Ih,','Bolivie'),
('Æ€\ô¬\ãL‹y^£`çª†','Bosnie-HerzÃ©govine'),
('\ô‹j¦ü\0E3‚\÷Ÿ„\Éw»','Botswana'),
('\Ø`{ÀH`IÅ¨¤¨­C\Ù.','BrÃ©sil'),
('\ñLch8>Lè¯+@Hş','BrunÃ©i Darussalam'),
('\ÏF\Ä!\÷kLlˆ\à‰g\Åk','Bulgarie'),
('º\öCN®ŒNdª\Æ\Éhsr™S','Burkina Faso'),
('sÚŸo\'7@3¹\Ò4Wn	<','Burundi'),
('\Ô\ÑHÄF\Ì\Û\r&\Æ\è\õ','Cambodge'),
('}\"\ÉK\ÜM¢\ä\È\Ô^N‚·','Cameroun'),
('¦k\ô ÁI›œ}\ï’Ã”Z,','Canada'),
('\Ì\Í\Ï_.\àL…¿\Úı\æ7‚','Cap-vert'),
('©i’+¾NÄ\é\÷ì¬‰m\Ù','Chili'),
('\í*j‚\ö¬A¸Š(“~\Z£','Chine'),
('#ù\æuI¿I™K:¶OƒC','Chypre'),
('6û\íC¿MHX¹\ì}¹cN','Colombie'),
('/­w\É#\ÖHÔ—n`\ÍLª+g','Comores'),
('T´Œ}\ZAİ¡¨^Ç›\è6¸','Costa Rica'),
('Fš¸\İ7Dc¢J«i\ÕÜ','CÃ´te d\'Ivoire'),
(']\Â;\áC9¹\Ş\ãQ\êş','Croatie'),
('\Å,<Æ±\ÅNf™„C\éScL','Cuba'),
('s8ØŠ<II‚«6‹¾¡(¤','Danemark'),
('r\×!QYvAµ–b­†ŠwF\÷','Djibouti'),
('…xWÛ“OÌº„\0\rƒ1','Dominique'),
('·™\écCK&ª`ƒ;a›#i','Ã‰gypte'),
('Xœ¡.úD/˜\æ€\Ä×Š','El Salvador'),
('{kÜ¿5\èL	‘w¸MV\é.‹','Ã‰mirats Arabes Unis'),
('Pã¯º\â&@r€z\ì;\Ù\\\Ù\ß','Ã‰quateur'),
('A\Ç\ZŸ;M^˜e®Ÿ¦-@[','Ã‰rythrÃ©e'),
('\õ[½(\n\ØKe)ß¹.\á\æ½','Espagne'),
('\à\Å&G´aFÍƒ@Á\İÙ†Ç§','Estonie'),
('.Eœ\"sHF’‹\ïˆÈ‹\àÒ„','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('{nZÒ½G\ò”\ò\Ù\ÏÙ¬\Ğ\ã','Ã‰tats-Unis'),
('\á¯OË†ED´y/0k\\»\Ü','Ã‰thiopie'),
('¼-\î+G7·›u\çû.','FÃ©dÃ©ration de Russie'),
('^r\ğdJ®VZYr5\Ü ','Fidji'),
('Œ€œI^CÈµ3ş:\÷\×?','Finlande'),
('‰\ò^•¸H*®]\÷\æ+¿²•','France'),
('|Î‡:\nAs¤L$\Êm•\÷','Gabon'),
('cœû\ö\îIÛŠÉ¡\ßv@D','Gambie'),
('[)¼ªüDÜ«Š1“cV\'V','GÃ©orgie'),
(']\ñP\Ò{­M¦‹#{)','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('\ã3«\òB´®²+\×\ãl×š','Ghana'),
('–\Å+>gA†´¿V§LZO;','Gibraltar'),
('u\ÌX0G¢ˆ–\Â…g','GrÃ¨ce'),
('zE\è\"-@¹’şŒI =¢','Grenade'),
('š!_\àÿ\ÔE¼§1\"\ã¥Ö%','Groenland'),
('\ï[`n·£Dı˜Ü‚m\å\Ê\ñ','Guadeloupe'),
('¿3{¡.@*¦\Ò\ö9\×tn','Guam'),
('Àn\n¬\×\ÆI@¼ly 7','Guatemala'),
('\rübµZLÈ¡\Ï`Sªw8 ','GuinÃ©e'),
('{ÜJ\ì\íMŸ™/.2\ëhg','GuinÃ©e Ã‰quatoriale'),
('Š\ñ\âø\àjB\'¦|k\èJ\Ö&','GuinÃ©e-Bissau'),
('\í<´\ÛHDH¼\ó1†\rs','Guyana'),
('\í1$¨UF%ı\Î\òµ','Guyane FranÃ§aise'),
('\Ë#\ç‚s‹O‡v:,\ç\Ù\ğr','HaÃ¯ti'),
('ToÓ©a¢CÍ‡.ªL1(¸','Honduras'),
('4 ~4G&Œ¥“\ÎWb×“','Hong-Kong'),
('¶Åª,¢@*¨ß°h\0’…\è','Hongrie'),
('7Ê€¹\ÛK\"†zæƒ¿¢ˆ','Ãle Bouvet'),
('©82O\ömN¦‹*ù\ê³)','Ãle Christmas'),
('e/W€dBŞ£\Ğ%¦›xO','Ãle de Man'),
('	+\Õ-d\ãG‰ˆ™©‘\î\ğ½','Ãle Norfolk'),
('_qGkŒmB¿\åªY\îx#','Ãles (malvinas) Falkland'),
('$²	½3‚Ka9\ë!\ÒW \â','Ãles Ã…land'),
('”›“\ë\öuFH€…L²\ÂMùh','Ãles CaÃ¯manes'),
('SQ\\2<M9…|(s±YI','Ãles Cocos (Keeling)'),
('¢m~uNQ¯\õ\Ô\Å\Üg‹\Ó','Ãles Cook'),
('“x\n•~:O\êQµ:\İ5^','Ãles FÃ©roÃ©'),
('\ôG‹V\æL¿=DÂŸµ°','Ãles Heard et Mcdonald'),
('v•]3úBÇ€ùf€J\ô','Ãles Mariannes du Nord'),
('Ld»(E¥»EoÑ‘™’$','Ãles Marshall'),
('À\Ì\Í\å[EĞ‘I3yš','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('W\"\ğ\ìª%Iµ¸™\ÕG½3»','Ãles Salomon'),
('=P§šF8¹d„7¾\íU±','Ãles Turks et CaÃ¯ques'),
('q%\Ò$7H9µj>`Ï™','Ãles Vierges Britanniques'),
('\0\È7j~Oš¢&\È0L\ö','Ãles Vierges des Ã‰tats-Unis'),
('\É\ôı2£zA\æ¿6Ó¾}\Ş[\ó','Inde'),
('‡mHDO3N½¾\Ø8ı\ÍÉ±[','IndonÃ©sie'),
('û5)~ÿ´C‘´x\èw\ë*Á4','Iraq'),
('´şÑ¶OHÏ\Ê\ê:\Æ¶1','Irlande'),
('¬ÿ.\ÈùNı”!˜¥\ô¾','Islande'),
('’\ßD°I«Lªš»ºFT','IsraÃ«l'),
('¤\Ä#rR!H¦ƒ¹P>Z¼\ö','Italie'),
('&\\ÁÚ…@Cµe\ÄtµŠ}','Jamahiriya Arabe Libyenne'),
('Ş¬«½SJˆ›…”ı\âú','JamaÃ¯que'),
(':‹ŒNÈ‹¤şı\÷\0ª~','Japon'),
('I!½p\ĞN3†\ôDÀ>ˆ','Jordanie'),
('\ì	\íX@}Y\î\Ú]d','Kazakhstan'),
('	®\ß\óCˆF‡Ÿ%ú\ZP6\ô\ó','Kenya'),
('\ó]³~\öJÜœe¶©\Äp¶','Kirghizistan'),
(';JhNÎŒ›Ó•{™\ö\Ì','Kiribati'),
('T&v\×Ha¡y~V–\r£','KoweÃ¯t'),
(' \÷°Fº¼L\ã…\â\ÇÑ´,%+','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('\Ô\ãÿ5U…IûÉ€2\\j','Lesotho'),
('ukO„_\ïM@şwÈ  P…','Lettonie'),
('\ÏªnÜI–¨¶’œg','Liban'),
(',jO\Ñ\õG¾·n˜šiuf®','LibÃ©ria'),
('C…B!hH¸¡Dz’‹Ë¹','Liechtenstein'),
('ş»8ƒ­MGš(“\'©\æ\nŸ','Lituanie'),
('v\ããŒO-—\Æ^™\ÏiT','Luxembourg'),
('\èL)ºÙ’E’ˆ§\ÛÀ\ÎÁ','Macao'),
('\Ï\0\İ;­jN€šú\"\Ôÿ1K','Madagascar'),
('3\ÂU\Ñ,˜C\"¼}eü\Ï+]§','Malaisie'),
('.&­YNN¿‡}hzm\ßÀ\É','Malawi'),
('Q\'£K#£À‚N#¯\ô','Maldives'),
('\õş³ÿA±E\ê¥Ì\åC¡$ƒ','Mali'),
('c{¯L`G•°\îùªY/#','Malte'),
('Ad\ät3\àL·¬h¯µ$š©','Maroc'),
('1\Ï7[Cr@¿·!\ñ´\çÖª\ò','Martinique'),
('/\"ˆ¹Lj†’P“7','Maurice'),
('µ›t\Ğ\ĞKNÿ»A\ğd„V','Mauritanie'),
('‡Dg€$(Húˆp<\ËZ…','Mayotte'),
('\Ø\ê-{H|†Á\ô˜\n™úT','Mexique'),
('¦²Vü79I#ˆam\Ş>9','Monaco'),
('Sb\ô5JE7¿\Z\í<œ\á<','Mongolie'),
('´Bø‡¶@ë±›¾0œüps','Montserrat'),
('gD\åHEˆ—\ß\ÛH\Û\Ù+','Mozambique'),
('«\\C+nDO…@En\ñFe','Myanmar'),
('A\ñ›¼E\è„b^Ñ)\ÅK','Namibie'),
('PT\ÔG–wL­£.Àl;a@','Nauru'),
('\ê8nxûJ±(›X\åOj\Ø','NÃ©pal'),
('¹q†D	Y=s\öC0','Nicaragua'),
('@Y\ÏP}Dù“q\Ş`¿\Ğ','Niger'),
('l\à@@\æ\ÜA_µ±C¿~Í‚¨','NigÃ©ria'),
('‚#¢F2@\"x3S\ÔY\Ù','NiuÃ©'),
('m\Âü)\÷½J«¿P|\÷€•™T','NorvÃ¨ge'),
('m´.-Q˜Bª\ÓaqË„ˆK','Nouvelle-CalÃ©donie'),
('	Ha8O\ö¾‰4@gv«','Nouvelle-ZÃ©lande'),
(' ½ÓœGMOµµœ—\×\ös','Oman'),
('q4‘\óšF© {A†¢ƒ^?','Ouganda'),
('»Gu#o†AV\Ì>\å\Ïz','OuzbÃ©kistan'),
('<TWFŒª\Ğ\áhæ™Š<','Pakistan'),
('w¼(£C9€\áMmGqŸ°','Palaos'),
('\â_\ÚAGeF˜­	„‚d\×|','Panama'),
('\Æ\È)³\'ÿJµ\n»\ÏÀ¸ÕŒ','Papouasie-Nouvelle-GuinÃ©e'),
('!2Œ\ØCØ®²\Õ@6\Ê\Ã','Paraguay'),
('.„\à\âq@`¬¹p\õ\Å[\î','Pays-Bas'),
('&+\Ä\è:Cz“J\Ä\óQ44\ì','PÃ©rou'),
('>³\éb@½…)­KX\î½\à','Philippines'),
('\à1L\Ø+\ÅI[’\0\Ï\0\Ì\ä','Pitcairn'),
('Gs<…L2™\÷C`\"Å ','Pologne'),
('\ÜŠ\ò<Iº†imÁ=”˜&','PolynÃ©sie FranÃ§aise'),
('‹]¸GC”#Û¾„\Ï','Porto Rico'),
('.…\Ñx\ÜILi –?\ã$6¬','Portugal'),
(')/[FùNº \çş¹’Œ\Ş','Qatar'),
('{:PN\æºj\Ş\é\Õ\ô\õ°','RÃ©publique Arabe Syrienne'),
('\äˆü#”K¥´6¼p	^\â\'','RÃ©publique Centrafricaine'),
('şV\"³…@ª»Us¥~l\âR','RÃ©publique de CorÃ©e'),
('\ŞZ]2(KÎ—¿	 \äG_','RÃ©publique de Moldova'),
('7M½Ow\áHÿ¼\Ù*–\Øyˆ','RÃ©publique DÃ©mocratique du Congo'),
('¶Qz\ç°\ÙC#®-€o\é','RÃ©publique DÃ©mocratique Populaire Lao'),
('gÀ3\ŞF Ab¢&¡+\n+¹','RÃ©publique Dominicaine'),
('W\Ñ,bsYL¬ùT3‚ş¹','RÃ©publique du Congo'),
('\Õ\õ\È\Ä>G\á¹\Ç=Ú¾\È\å','RÃ©publique Islamique d\'Iran'),
('\Ø5b\ZWNe›\ö‰xr3€','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('¤\Ä:‹J F¥¼m\êŸ\êÑ^','RÃ©publique TchÃ¨que'),
('d$GÔ¸K\ç†r0$½Ä¥','RÃ©publique-Unie de Tanzanie'),
('\ö¥¹ÉƒqH\0®›,ŒEÀŠ','RÃ©union'),
('t\â4\ÅN\ä‘1¼L\Ì9W”','Roumanie'),
('Œ-\İ^CLE´\÷j†\ó\ÙÁ','Royaume-Uni'),
('coU=øEí)i0¾_','Rwanda'),
('n{\Ô*_Oi§û†\Â=w\ò','Sahara Occidental'),
('\0\ß\Ù\ÕhNE£ı®e¥R\íP','Saint-Kitts-et-Nevis'),
('—Œµ”ªH~ƒz\òsœ','Saint-Marin'),
('»\ó\înp¦ER·m(³#?«\Ö','Saint-Pierre-et-Miquelon'),
('\÷©/zML›‰¼Ä“HÀ','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('\Ü	\"P\õN¾r„\å \ğ!{','Saint-Vincent-et-les Grenadines'),
('X@®ş?Di(‰Šü\ç\Ê','Sainte-HÃ©lÃ¨ne'),
('0°i3+\ÏLU‘ü~\òL½R','Sainte-Lucie'),
('ú\É(h\æ’B˜I vZœI','Samoa'),
('—ûª\êC\İMD\Åw\ç:³','Samoa AmÃ©ricaines'),
('š\Ó|\\\æJª¬ˆ [Ø¾#]','Sao TomÃ©-et-Principe'),
('.\n€\õ<B´)ej\ŞU ','SÃ©nÃ©gal'),
('\î¹\Ä+C‚t\0\áb\ö”','Serbie-et-MontÃ©nÃ©gro'),
(' İª\"d7G¸™\æ6q^\0>@','Seychelles'),
('ÖF\ÙI‰™&»™x¹+','Sierra Leone'),
('²´W‹a Gµ\Ù{‹‚\Ã\Â','Singapour'),
('\rú9\Ù\Øl@8²|\Í>,6\ó','Slovaquie'),
('5À\ñfE .Ã¿‚gÁ-','SlovÃ©nie'),
('‚\ö†\Ã`¤F—‡{V','Somalie'),
('JAÿX\ĞXM!¤ş\ÒIQ\ôÁ','Soudan'),
('Š\ÆJ´½º@˜„ÁÃª”\Ó\Í','Sri Lanka'),
('^6¤\Æ\ÅÿK´œ´¡¤\ÖUM','SuÃ¨de'),
('`9\×\ß)J…bªq%¤ou','Suisse'),
('^\0as\öB‡¢\è0i³\áA','Suriname'),
('\õw®\æ£~Gñ™‰˜ÖªN3¸','Svalbard etÃle Jan Mayen'),
('\ÄFœ)X7Iü°ş\Ú%\Ï\Í\Û','Swaziland'),
('Ğ©V)\öAE–#\r\ávzg','Tadjikistan'),
('\ï*\Èq\òH£d|‚i\n/\Ò','TaÃ¯wan'),
('[o\î;&\ÃL!ˆ\ğØ©Sª','Tchad'),
('p[KR\È)NRšŠ\ã\ã¥\õº','Terres Australes FranÃ§aises'),
('9§û¿P\ÏO\"¢i!Î\Å~','Territoire Britannique de l\'OcÃ©an Indien'),
('€œ\ôjJ<—?\ÑU\'},ù','Territoire Palestinien OccupÃ©'),
('€\Ù­È“Jq·Q§¾ƒ\àu','ThaÃ¯lande'),
('y\ÃyR\ãAÙ0\ïP¡\ğ ','Timor-Leste'),
('Y\æ\Ô]mIm’\î^*Š^!','Togo'),
('´\ój|¿B„œ³C\ÓF²1','Tokelau'),
('\õN1QG+z’\ÇG†\å¨','Tonga'),
('\âø©a¹N:ƒ™¡™+©`A','TrinitÃ©-et-Tobago'),
(' ws\r\ëGÑ§¤\È@]\Ş','Tunisie'),
('\'7\ä<MM \àT¤\0\ŞI','TurkmÃ©nistan'),
('£·ü\àAH8¥/›5\Z#\Å','Turquie'),
('I˜ùƒÈ—CE°ı\"Ÿ\ğ•Ô¢','Tuvalu'),
('|€\Ô\ÊJ\ï…`¾§;','Ukraine'),
('CE£A¹†A²ˆúCÅu','Uruguay'),
('ü+’MÍ˜¾\ñ±\n\ì\ì','Vanuatu'),
('Ó¶c¾LN{²Œ}Xc¶','Venezuela'),
('†€\ÍgpM®HmD:*Á','Viet Nam'),
('_s†^)H¦8Î”ŞF¼','Wallis et Futuna'),
('0Fÿi\"D„\â1\òN\×{‚','YÃ©men'),
('>m¶\ö\Î\ÓL.¯n\r4Á‹8e','Zambie'),
('œm¦{[:Ep‰Äqek\ï','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-09-15 09:08:39',3),
('DoctrineMigrations\\Version20240201152951','2024-09-15 09:08:39',1),
('DoctrineMigrations\\Version20240202084749','2024-09-15 09:08:39',3),
('DoctrineMigrations\\Version20240202150901','2024-09-15 09:08:39',2),
('DoctrineMigrations\\Version20240207105701','2024-09-15 09:08:39',2),
('DoctrineMigrations\\Version20240319212437','2024-09-15 09:08:39',2),
('DoctrineMigrations\\Version20240614133504','2024-09-15 09:08:39',10),
('DoctrineMigrations\\Version20240617165906','2024-09-15 09:08:39',7),
('DoctrineMigrations\\Version20240708061729','2024-09-15 09:08:39',12),
('DoctrineMigrations\\Version20240801202153','2024-09-15 09:08:39',3),
('DoctrineMigrations\\Version20240815153823','2024-09-15 09:08:39',2);
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
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitation` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `tasting_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `target_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `sent_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `link` longtext NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
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
('«\í/iš®M’©\íú|˜Vt','.¥l5‹¹LnšI½y\Å\ñ7','\É5?0O¤…€)\\¦ZDQ',NULL,NULL,'https://apps.apple.com/app/6468406309','pending','2024-09-15 09:08:40');
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
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
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
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
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `owner_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `bottle_id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `participants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`participants`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_73621810DCF9352B` (`bottle_id`),
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
('.¥l5‹¹LnšI½y\Å\ñ7','™d\å9ÿF³œÿ\Ö\Ñ¸·','^À‘{ŸF\ä‡\Ö\Ûvû\İ\ô_','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]'),
('–J<¸_½Fx¥\Í\ãqÀ§\"','™d\å9ÿF³œÿ\Ö\Ñ¸·',')R1„ú\ÎN…‚7\ÍP\î','[\"9964e539-05ff-4611-b39c-ffd6d108b8b7\"]');
/*!40000 ALTER TABLE `tasting` ENABLE KEYS */;
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

-- Dump completed on 2024-09-15  9:08:41
