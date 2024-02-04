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
  `country` varchar(255) NOT NULL,
  `price` double NOT NULL,
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
('\İä¤¹0­I´º‘\ß\ò\Å4','Afghanistan'),
('û\ÉC\ë•AÈ‘|\î\öa\÷®','Afrique du Sud'),
('\ë\ë\Ğı\ï@§\Ã>ŸŒ-‚!','Albanie'),
('h–®F˜~H–ƒ¸RÒŸ\ÅC5','AlgÃ©rie'),
('Zi´>°&LB\É\Ò\Æ%\ô','Allemagne'),
('«wDt`,EÀ‚„\ÒJe©\ô','Andorre'),
(']J\r¸›As¥\ÖVÈ»q','Angola'),
('y\Ú\ÈeyC™—15~zP·','Anguilla'),
('·)ª\Øp¼G¢¤\ôƒû¢ø','Antarctique'),
('\Ù\È\àdSE‰,¬_.ˆ½','Antigua-et-Barbuda'),
('cª—Ó½?L;ªe:\â)vS','Antilles NÃ©erlandaises'),
('„<\õ†Aj \çøK€‹W\Ï','Arabie Saoudite'),
('_Ï•\ÚWE7•\Âr¼$3ù','Argentine'),
('ƒj§RSBÀ\á^\ÈÁºC','ArmÃ©nie'),
('\ßM1ú‘\ÓI•¦\Â\\œ\ğ2»´','Aruba'),
('Ùÿ\ì\ö3Nb½®–«\á\Û1','Australie'),
('\Û.|3tgCâ†•w\ë«zùY','Autriche'),
('Y¿ZID¶˜¯³ëº°\Ìz','AzerbaÃ¯djan'),
('ù¡º|@ˆC…Œ»G¼\Â7\Ï','Bahamas'),
('NŒ«tˆ@Ê³‰\Ím\è\Ä\æ','BahreÃ¯n'),
('\÷\åƒOK\0¥{\æ\"’ƒ1','Bangladesh'),
('\èR…\ZRJ^¢yb\'c\îz','Barbade'),
('ı\åÔ•H	³€V=\Ğ*Á ','BÃ©larus'),
('\îÎ‹€\Î?B*¬Z¸V\'','Belgique'),
('Cv—¨\nLR¸\Z;Q}\0_','Belize'),
('UüJ­\ËJ£²s z™–:W','BÃ©nin'),
('\ö@f\ÒF¬‡\ÌDˆxB\İ','Bermudes'),
('\\I¸\ä\ÚSFª\òº\ñ§ü\÷','Bhoutan'),
('ş\Ñ\Ş\ìGN«Œ¢b|œ@h\É','Bolivie'),
(']\ñ)^[G®²\É\ÔCª\ã7','Bosnie-HerzÃ©govine'),
('N!W˜­«J(„?\éA“','Botswana'),
('\Ğ5Fš\ÇDÁ…K\à’}f`m','BrÃ©sil'),
('c ma\ö@T¶A˜L‡\ï\ğ','BrunÃ©i Darussalam'),
('‘´ÍœµA\"¢‰\"\Ï\'¹q','Bulgarie'),
('\ì\Í\ö\íŸmF#¼š\ğ9\ÂA\Û','Burkina Faso'),
('\à«\Ü>1\ÕH8”j¸¨B·<','Burundi'),
('\Ã\Ù(\Õ@v‰\Û\ÆM¬¿¨','Cambodge'),
('«—_\ÂD=KÁ‚¼»>a\Å','Cameroun'),
('|–\ÅcN¸+N~«M','Canada'),
('”R@\ØB@Ç®\õM\ÓÜ¯\ì/','Cap-vert'),
('€b\ÙBÙ†(\\\îQû(','Chili'),
('\ôK\ìPš\ÇLh„\ì:b&d\é\ñ','Chine'),
('Ş¼\ëŸGH¾°6\Íu¶3','Chypre'),
('M\Ï781Lª\éHF+\È','Colombie'),
('œÁ\"\ZOz•úp™O\Ğp','Comores'),
('\Î\ÃQ\é Jhš\Äz\à\r>m','Costa Rica'),
('(§@¹p\ÅN´I%N\Ğ*\r|','CÃ´te d\'Ivoire'),
('\ç\âV¶½[NW9G862','Croatie'),
('\çK/ Nb“°Ù¥ª\Õ','Cuba'),
('VC8\ôG½H¾˜š”Á\å\×È€','Danemark'),
('É.pùG±zû\Ô:•·','Djibouti'),
('|dœ/˜D&¤\å“Ñ¼Y‡','Dominique'),
('f\ßb¼ÒšG¦€@\Â\Ş½\Õ}','Ã‰gypte'),
('²µ˜…¶I(Œ:—”g\ó\×','El Salvador'),
(' ŠA\"FL-@v4e­\ê','Ã‰mirats Arabes Unis'),
('¥{,€FK,•P¢\Î&zW','Ã‰quateur'),
('¶†•T\ÜNM—¡n\Ó\Øa','Ã‰rythrÃ©e'),
('F\é¹\ë O–š‹\Â{\ô„ˆ`','Espagne'),
(']\ì“\Ê/\İG”¦N\õ>z2¬','Estonie'),
('a\Z>8	J\ì¯`\ß\ëQ€^k','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('K¶Z\Í\ÓcLÉ¡\"d4¥;j\ñ','Ã‰tats-Unis'),
('¼Bº&IÌ½\\­{\09C‰','Ã‰thiopie'),
('Pv\î\"\êA­\Ò\ÕúN\÷JO','FÃ©dÃ©ration de Russie'),
('(Hc¤9\ÃIş°/š¨°7\Ï','Fidji'),
('´›cµùGŒ@@^Q0¾','Finlande'),
('úbQL#½µ\ï²GgP\Ì','France'),
('HsEÀ\óˆIƒúT\ÌLy~œ','Gabon'),
('E´&¥JBk¥1\ÏÁ\ÄF«ü','Gambie'),
('m7\Û\áJ\n«©\Í\ÈPw?\Ò','GÃ©orgie'),
('…Z:`»L3,‘\Ü\ïY\ô+','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('–k¿\ã\ÛE»<!\óaû','Ghana'),
('\Ñ`1û«\ÏB…˜Y«\ë\ÄvF','Gibraltar'),
('š\Ö\÷ıÿ\ÒBG½BÏ†cb£','GrÃ¨ce'),
('\ì°r	HcM™¬„\ZB+x\Ü','Grenade'),
('®\Ï~\ÍM¨´ø+‚UC˜','Groenland'),
('ˆ¼_\ZA·”LZK¤gª','Guadeloupe'),
('~¾\óCƒ£¨bÿŒÆ®','Guam'),
('>b§ DA&€,\ÑX\'&¨o','Guatemala'),
('5‰–±PM†„Zı¾1ü','GuinÃ©e'),
('\ño(xMo¬ì§­šÖš\ğ','GuinÃ©e Ã‰quatoriale'),
('O\ëL3\ÔB$±CÅ¼=Vk¿','GuinÃ©e-Bissau'),
('ùsDaGO§£C9ïªºh\\','Guyana'),
('y\áµ\Æ\ÃjH%©MQ©—\×','Guyane FranÃ§aise'),
('û}­MGo« ¾*¤\ì','HaÃ¯ti'),
('ı\òxc¼\ê@’¿¼|j\ÈR;\É','Honduras'),
('*‚f$œ\ZHx£WøLd :','Hong-Kong'),
('L\Ôc`XDıª\ïnM','Hongrie'),
('¤0MFS°ø\"\Ğ?\r‡\â','Ãle Bouvet'),
('=‡Àc˜GuªÏ“¬','Ãle Christmas'),
('ú\é0L}F\'‚\è0v\Ş50Ÿ','Ãle de Man'),
('”—\'´h\óE\\‰6v¡7ms\á','Ãle Norfolk'),
('\ÔIu‡}GŠ°\òM¨ ´','Ãles (malvinas) Falkland'),
('P\İyª\\\ìM­£g¾pŠŠ','Ãles Ã…land'),
('»sÜ‹&GAa¢´±k\íh\æs','Ãles CaÃ¯manes'),
('\ö³6?7\ÅM\ìˆ/\ò\Ê\ë9‡','Ãles Cocos (Keeling)'),
('· ¾#M(©Ğ­4\ÎL\Ç\r','Ãles Cook'),
('\Õ\Ük	\ÏN™«’3\Ö\Ì\Ëk','Ãles FÃ©roÃ©'),
('0B‹B=ÿA>Ï—\ë/aR','Ãles Heard et Mcdonald'),
('Ú’`\Ü:I¨œ6\Ò\nP‘\Ñ','Ãles Mariannes du Nord'),
('\Ä\æ\ì);\àO\î„½.²’','Ãles Marshall'),
('$¤Ó½zK¯œ0cp·','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('@°´\"J@Î†F}¹¸\ô¨','Ãles Salomon'),
('—ü…¯‘oK¬¹<52','Ãles Turks et CaÃ¯ques'),
('\0S¸´sM>¾\Ô—Î‘­\î','Ãles Vierges Britanniques'),
('1?+\õ`K¸¨§¼š3','Ãles Vierges des Ã‰tats-Unis'),
('\É\Ôf“»šO¿\Î\à6\ãy¾\Ğ','Inde'),
('\Æú\õ#%IŠ‘cCœb\Å\Õ','IndonÃ©sie'),
(' ½%\İAB\÷Šx–w¬¾','Iraq'),
('l¡U\ò~H²€\ç@Õ·p\Â`','Irlande'),
('ÿ\íÌ fAÚ²\ÏN9#\àÎ”','Islande'),
('eÜˆˆ\ÚLw£a™\ÅD.\ñ^','IsraÃ«l'),
('j‹$”\ãB¤ˆúx\0h,©y','Italie'),
('\Çj\ß	¬&@±\ÇM&v/{ƒ','Jamahiriya Arabe Libyenne'),
('g\ôş|–A?©?­\Ã#\Ó-','JamaÃ¯que'),
('î«¿\ØLYFÃ¦¥A±\å±M','Japon'),
('„J”¯(L\Z¦š\ÍJoÈˆH','Jordanie'),
('5»>\ÜPK@’\ZM\'	ù‹','Kazakhstan'),
('g;ZE\è\åBµ·t{\â\Ñ(_','Kenya'),
('\ä³HYÉ†KV­m)á\Ï','Kirghizistan'),
('_\å8!x\öO›¯X¢\Êd\ç$','Kiribati'),
('Z}‚?´LE¹µ¢v®\Ó\ñ¨','KoweÃ¯t'),
('k9¦¼Ì±M\"…¤‘\ÃÜ¯\åc','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('a\Ü\ãÖ¡OL~ŒU½\æ(`ª','Lesotho'),
('\õ£İ„Â¨A\àœ\àwh=û¯','Lettonie'),
('¸g€*GJ|»o©Œ\Æ+	C','Liban'),
('„\Ê\ZD¼‡\ãƒdH²Ñ“','LibÃ©ria'),
('^ù\õH¸O-¡Š!wÖŠ±','Liechtenstein'),
(']N°U\ÃgGå¥¸û¸¼3[','Lituanie'),
('L¨,…\Å@Ø‘\ë[\Íq°','Luxembourg'),
('\ò—wøN\î‚J>wA\òÿ)','Macao'),
('Oaº\äúL‚u\íN.•','Madagascar'),
('»\é°,n0E\í†Kød7j`\Õ','Malaisie'),
(':M–\rFS¹\Ôm‡D\àe\Ò','Malawi'),
('ş¡\Ù\'\ÎiG.UlaC\Óş','Maldives'),
('1\÷ SuD)«¸_™­…','Mali'),
('?cG6.FÖ´”¤û\Æ','Malte'),
('{\æ>[\âªK‹ŸH¾^6‹Œ-','Maroc'),
('%8\âQC\ĞM\õ½;\Ç\êZ¢\÷','Martinique'),
('£4™WDNŠ\Ê\Û\ã\Zv%\Ç','Maurice'),
('\íQJx@²‹¬ÿmúµ[\ó','Mauritanie'),
('{ÿeY\àK\è\İ+·¤\'?','Mayotte'),
('ˆÀ\ğµ\r	JˆN\"i\ë ','Mexique'),
('ˆa:\åKT­6±JdÌ«','Monaco'),
('s\rM‘KÜn+\Í\ÚVj','Mongolie'),
('½¿sÛ’VEÚ‡\ğ\å\ßCt¾^','Montserrat'),
('ua3$¨O\ó¡ty\í\Ø:|','Mozambique'),
('„\nû\æ\ì&N§½Gn]\â\ó¾','Myanmar'),
('µ´–U\ë\ÜL•„X{Ph\é›','Namibie'),
('D\'\Åz9@Ç²O²\èr}\r','Nauru'),
('¨1Ô\ÆM°Š	@ş\ë]','NÃ©pal'),
('@\Òx\ÅjE¹sZ\"hœO?','Nicaragua'),
('8…\ÑyJV¼\Ò:eé­®','Niger'),
('sL\Ãr9FŒ¯Œ\ß6\n@b–','NigÃ©ria'),
('0 ¬‹\Z\ÍA\\—`j\Ç\ë\ÓB\Æ','NiuÃ©'),
('r\Ù\ö‰N½•\ğ\ÅD‚|·','NorvÃ¨ge'),
('o\0\ğ­7CÒ¡†+\Ğ_{–','Nouvelle-CalÃ©donie'),
('\Ó\Â,\ÖH\ÜD®„\Í4]¦\ÚĞ±','Nouvelle-ZÃ©lande'),
('î²‚…xC_¢s€œƒ…¥¡','Oman'),
('M\ö.k7†BHŠgJ¿s\Í','Ouganda'),
(' x‡*M•‰´\Íub7$','OuzbÃ©kistan'),
('µs\ÙE”Iµl\÷Æ‹\Ê}','Pakistan'),
('ÁFª\ğ\ÎD¢Œ	_\\\çŞšI','Palaos'),
('\ë\àHu£N›»lb]\ß','Panama'),
('\ß43ƒ\ÎNÎ«do$\ËÀ\Ü','Papouasie-Nouvelle-GuinÃ©e'),
('›O\Z°\ÅM¢tV\ä^','Paraguay'),
('-ªlNØ‚Á:¿‰l‹','Pays-Bas'),
('\à˜}3]•I\÷‘pErg¿ÀN','PÃ©rou'),
('Ô¨\ô£OGBŒJjU\ÂY©Œ','Philippines'),
('‘À\Ë\å§E\í–! \á\nÜ©','Pitcairn'),
('¿ˆ¾g{O\n”)M\ë£Ì¼','Pologne'),
('\"ˆ±uB„¼5\Õ\åÏ­¯…','PolynÃ©sie FranÃ§aise'),
('[\Ï.HT„@‰\ïs@\Û','Porto Rico'),
('k[0(\ÔC„±\ì\Öf\é\Ó\æ','Portugal'),
('·\ŞbcŠ¹Jµ…][\Ã\Üa','Qatar'),
('¡\Z’\Ê~ÿOÜœ„\ì\ïq\Ñ','RÃ©publique Arabe Syrienne'),
('Í‘‹©4úB\ã‡~¨2ÒG¸','RÃ©publique Centrafricaine'),
('\nÄ²š\0D(˜¢\ÒÑ³\n','RÃ©publique de CorÃ©e'),
('hú\ë¡Hr`\ÍHü¿','RÃ©publique de Moldova'),
('\ôz\â¾S\ãA4›Ol/\0\îc','RÃ©publique DÃ©mocratique du Congo'),
('>f¡3\ÎLX\ÃÒ¹\\•','RÃ©publique DÃ©mocratique Populaire Lao'),
('\â;W¦\ñA+‹¼\Ùı\Ù\önR','RÃ©publique Dominicaine'),
('ûSe1 EPƒ½]Í¬«,','RÃ©publique du Congo'),
('c\ZC»\æM§ª=½’U\õ„','RÃ©publique Islamique d\'Iran'),
(':\ïQ¶YDI	¡Á‰\"m%\Ù','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('C0»W¾E\ñ¸GüR“\İ','RÃ©publique TchÃ¨que'),
('2§K½xKš‘wE','RÃ©publique-Unie de Tanzanie'),
('LP[\ÙZF‰M½Ì¶³›_','RÃ©union'),
('@l2I\ÔAì¬¿	ZªZ','Roumanie'),
('İ®ˆ\0I\ï‘%¢Œ·Š\Ä','Royaume-Uni'),
('E±+ª\ğE\éšNxb&0C\Ï','Rwanda'),
('e¡gLS­\ë\\ú\'¦Z','Sahara Occidental'),
('Êû \Â\óFw˜ª\İA','Saint-Kitts-et-Nevis'),
('Çd€UuG\õ½v\ï\ï„y\Õ','Saint-Marin'),
('\'H<šÊ—H}†@û>\óş','Saint-Pierre-et-Miquelon'),
('!\Ù\Ä9\Â8Cù»\àqœ¼N)','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('ù\ô…\ëù¤D[…\åm?\ÂQT\r','Saint-Vincent-et-les Grenadines'),
('6\'+\nH*LL³¥u\á_\Æ ','Sainte-HÃ©lÃ¨ne'),
('¾\'YıdœO´AÁ%1Gg','Sainte-Lucie'),
('HOaÏª5HÔ³›;\Ç\õLL','Samoa'),
('Z±±O=AIÏ…\ÛqvI','Samoa AmÃ©ricaines'),
('·ªQù\õ\İA{®“\ÓU²\È0','Sao TomÃ©-et-Principe'),
('N\â_\\fDØ”h\Â€\ì','SÃ©nÃ©gal'),
('ü¸!bA°\Ç9r\÷¡~}','Serbie-et-MontÃ©nÃ©gro'),
('s³\Í1\ògCV”š#>Ë«i¤','Seychelles'),
('&b\0\Çu€@\æ‰!(#%zx','Sierra Leone'),
('\é“o~&—B‰®\ç²U\Ê','Singapour'),
('q/“4O^°\Å`		t','Slovaquie'),
('b>\÷ŸM«I\÷\ZF…Yi','SlovÃ©nie'),
('NVµT\ä‹O£LfU©h','Somalie'),
('´4\ö\õK\áDß½\à\ó\nù\ÎI„','Soudan'),
('\ŞmÁ#nF!»\ä\á@~Tˆ\÷','Sri Lanka'),
('¯­D¸\ÛH`œ¤…\çd›=','SuÃ¨de'),
('Á!!\0¿\äF›Ÿ†Òz u','Suisse'),
('\'\rü<K#\Ç;;C','Suriname'),
('\ÓÔš³\ÎMe®P\Í\Í\Ö\Z\ó¸','Svalbard etÃle Jan Mayen'),
('ü\"tHû¸N2·¶}gmÿù','Swaziland'),
('€À\í\ã\ãmO°º|qÓ”\Ğ\Ş','Tadjikistan'),
('Co‚0\Ô@’yPÀK\í\\','TaÃ¯wan'),
('?\å\à\Z±\ËF¢¿wY\ç\Ç ','Tchad'),
('¯²¦HTwNÔ	¿\'Uº','Terres Australes FranÃ§aises'),
('\ò©	D¡O\'‚\ô\ò45‹‰%','Territoire Britannique de l\'OcÃ©an Indien'),
('ı¼.‰kB\ô›\ô\Û\ê³\Ìn\å','Territoire Palestinien OccupÃ©'),
('E\ğ»†\Ó\×KªvUA\ã)&','ThaÃ¯lande'),
('>-J[\ñcOš¨*²«Áù','Timor-Leste'),
('\Â\Ì\ßJ6\ñC!¥î®¯…Ÿbe','Togo'),
('<°–…\ÏM¤Ÿ\ñ^\î\ò1','Tokelau'),
('\ëa\ä\Ã\'LM„\Ëh\\ı','Tonga'),
('\í™ZºTE{±\ÏZ²Â•!','TrinitÃ©-et-Tobago'),
('¿c[Wj\ĞLı´Rlş\î\ë¬','Tunisie'),
('¦\Õ]\roM†Bqj“\â\Ü\Â','TurkmÃ©nistan'),
('3\Ô ¬M7¬=\ğˆszú¬','Turquie'),
('?Ç¸\Ï`HB¯Á„^g\î-ª','Tuvalu'),
('½¾,\ó\ßH2­´\ÌC; ¦','Ukraine'),
('«d™¿\í@ï¾–6/{7\×2','Uruguay'),
('5¼’\\9L¼¬S>2Jİ³t','Vanuatu'),
('¸~@V—Zd‚\rxš','Venezuela'),
('¬?šMGh«KøE\Ì\ÑqH','Viet Nam'),
('¾PFÿF{­ ¹‰\Ù*\É:','Wallis et Futuna'),
('±_‘\å¼{KÁ‰\Â`=\Ê.\÷','YÃ©men'),
('\ç\æ9¾¥\çDâ‘¹¥“\×¶','Zambie'),
('Dr\"‘\Í\×K­\Î\ZG‚f´','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-02-03 14:25:00',7),
('DoctrineMigrations\\Version20240201152951','2024-02-03 14:25:00',5),
('DoctrineMigrations\\Version20240202084749','2024-02-03 14:25:00',3),
('DoctrineMigrations\\Version20240202150901','2024-02-03 14:25:00',3);
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

-- Dump completed on 2024-02-03 14:25:03
