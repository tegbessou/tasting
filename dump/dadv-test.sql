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
('´\ı\ÂB›óH∫\Î[\·PP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','\Óo;‘àCæ±˝Ω\À\nl','√âtats-Unis',259.99,'2024-04-10',NULL),
(')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','Ch√¢teau Latour','Ch√¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','\Óo;‘àCæ±˝Ω\À\nl','France',999.99,'2024-04-10',NULL),
(':(\ﬁ\Ó\Ú!J°Äk[\'{¸','Domaine de la Roman√©e-Conti','Domaine de la Roman√©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','\Óo;‘àCæ±˝Ω\À\nl','France',2999.99,'2024-04-10',NULL),
('N¥I\Ÿ}#IÑ¶çw™¸\Ã`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','\Óo;‘àCæ±˝Ω\À\nl','Italie',899.99,'2024-04-10',NULL),
('^¿ë{üF\‰á\÷\€v˚\›\Ù_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','\Óo;‘àCæ±˝Ω\À\nl','France',1599.99,'2024-04-10',NULL),
('c^Äú™Ø@ﬂÑÉÉœæ,U','Guigal C√¥te-R√¥tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'\Óo;‘àCæ±˝Ω\À\nl','France',358.99,'2024-04-10',NULL),
('i\nÑsÇØNWíÕëÜ±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','\Óo;‘àCæ±˝Ω\À\nl','Australie',1799.99,'2024-04-10',NULL),
('{\’]\Û\Â<AÉ§é^Ÿº\’\r','Ch√¢teau Margaux','Ch√¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','\Óo;‘àCæ±˝Ω\À\nl','France',1099.99,'2024-04-10',NULL),
('ó-L\⁄FAå4S\ı¢\·\È˙','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','\ËòNE\ÕD‘çB\ı\ƒ\ÊΩaí','United States',199.99,'2024-04-10',NULL),
('µLØ\ÈCnG§îVajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','\Óo;‘àCæ±˝Ω\À\nl','New Zealand',49.99,'2024-04-10',NULL),
('\Á\ÚG¶fF@ä\»%\Ó>\Îm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','\Óo;‘àCæ±˝Ω\À\nl','Italy',899.99,'2024-04-10',NULL),
('\Í¬°\ŸI^Ä‹ì∞∂W\Ì','Vega Sicilia √önico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','\Óo;‘àCæ±˝Ω\À\nl','Espagne',1499.99,'2024-04-10',NULL),
('\w™√§O\Zå`v∫\Á∑','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','\Óo;‘àCæ±˝Ω\À\nl','√âtats-Unis',1299.99,'2024-04-10',NULL);
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
('â>^\Ì ∫Løø¿\¬?m\Ã','Afghanistan'),
('\r|m–≥©I<ß\È≤\ÀP,ﬂ±','Afrique du Sud'),
(')(xÑG—ç\ÔÅgúåì','Albanie'),
('C÷ñ¨/AÇìh±\ÛKu\ƒ','Alg√©rie'),
('¶i˛A\Ù-DŒã\◊\”†≥W˙','Allemagne'),
('ös	∑=T@N∫ørñOm','Andorre'),
('\»«•óK\ˆâí+å¿pΩK','Angola'),
('˛[ôÖHFâ3®w\Èì','Anguilla'),
('\r9Ωî\ÒAˇºI˛\nπø','Antarctique'),
(',8Z™Au°\'\ƒ\Ù\ÌÅ2è','Antigua-et-Barbuda'),
('\‡\Í≤Nê\ŒK†ù›ä5\“[','Antilles N√©erlandaises'),
('p\Î–∞1N¸ä\∆\‘\Œ\ﬁ+','Arabie Saoudite'),
('Ä]\”O\◊\œH\‡∂\Â\0ãº¯\’','Argentine'),
('¢p\Ò4\Á\ÃIØo\n`\Ò\Úñ\⁄','Arm√©nie'),
('¢)\»*Auùî∫\‚C,@\'','Aruba'),
('f\È#ÖK®Öﬁì\«—îµ\Œ','Australie'),
('^^ÕÖó5LQâ\n€πV˛6\Ò','Autriche'),
('\Ë\›*¯ô@ø∏ß∏cI~','Azerba√Ødjan'),
('_I\–e@LêÉ$î\€0\◊4','Bahamas'),
('∫*≤\"ù\ @@≤	é\⁄\Î‘∫ö','Bahre√Øn'),
('\Èî]°<HC∆õM¿≠/{\Ò\„','Bangladesh'),
('1\‚\‹dú\ÚMbà\œr”±hR','Barbade'),
('\»wqéT\ËK\Ù¢p\ˆu\œ\‚¨N','B√©larus'),
('}(É\ÓéJx∏Uú\Ú\÷','Belgique'),
('\ÿ}#R;N¢´\›j6\Í€£','Belize'),
('\„¿És\Î\ÂAòà+\‡ˇLæ$','B√©nin'),
('\›\∆\√4\ˆ]J˚ª®F\ÓM	','Bermudes'),
('Ãâ±˘π:A\Ê≤\Í∞N\Ù}','Bhoutan'),
('z\Âî8Jê≠î\ƒd.ëT\È','Bolivie'),
('N\«!\Â¿ãEDµ\ıâ\◊\“.∏\⁄','Bosnie-Herz√©govine'),
('\œÇM§FA†∂H´n','Botswana'),
('ú©\»œ®uL6ù0\\Ë\Á\«S\◊','Br√©sil'),
('∫ƒ†óìJr†9~\◊ûN','Brun√©i Darussalam'),
('¢›âØ#Nõπñê+h\»','Bulgarie'),
('\“˛RL∏∑õ~\„Uuè\"','Burkina Faso'),
(',yCn∞J◊µ\ˆ¯ú•q\Ì','Burundi'),
('∏\r\Ê\√B\Ùæ®öæ\Â≠n','Cambodge'),
('ßk\Ÿ!\ruOßøt\\ˆ3ù','Cameroun'),
('ˇGˇ[7HB£áæW\ÈLùR\⁄','Canada'),
('Mπ≠iKCêé∏\∆‘ök/v','Cap-vert'),
('T\‚à\ÌªgMûà≥h61à≥','Chili'),
('*ˇ\ƒ,JD4°èRQ*£©ê','Chine'),
('4Œº[B°âùæ\\ûü∑m','Chypre'),
('°gLè\"\ŒB`Ø+Éñ%\Ì\‚ç','Colombie'),
('z˛s\·ŒêCˇÆΩélâ=ô','Comores'),
('\≈U.R5D*É\Ì\‘¯ö\Ë','Costa Rica'),
('S(>äeF9Æπ√†hÉt\≈','C√¥te d\'Ivoire'),
('\Z-÷õ \ÒD\‡≠\Zø\∆]π\ıf','Croatie'),
('ËøÉ\Ëw\"MˇùK\r=√õf\Z','Cuba'),
('\À!C\ﬂ\ŸwG ßÆí\Œ\Ù\Ï','Danemark'),
('ë^\rYdÖ@É≥¥k“íJ\…a','Djibouti'),
('Ø\Ù á\‹˙H\·ì\Ôﬂã\«\Ò\r\‰','Dominique'),
('O§ZåyÜCf°õ\√g)â4ª','√âgypte'),
('\ﬂ\‡TZ∑\ÎJkêñ;,PN\¬','El Salvador'),
('\·*û\’Z_LiÄûùn\Ù•x\"','√âmirats Arabes Unis'),
('\ƒT\Ÿ\«\ƒJ\n¢\Ã\Ò;ä÷É','√âquateur'),
('b)ØË±ÆH€∑MQ≤ø¯\ÏH','√ârythr√©e'),
('\…p\√F\—MìÉ|f0VmmP','Espagne'),
('ˇ\n\"§‘µ@ì∂\Ê≤\«\…Zd','Estonie'),
('5\ˆ≤Iÿ§~\Z\Œ0…øç','√âtats F√©d√©r√©s de Micron√©sie'),
('!ñ∫Ç!Hèóâ_{Om#k','√âtats-Unis'),
('\«uÇ\ﬂ\ı?OO§¸k\˜≤/\⁄`','√âthiopie'),
('u..˙îΩAöÅ™øwáãIp','F√©d√©ration de Russie'),
('\ˆC¢øN˝Å\ÍÇ>¡\—','Fidji'),
('\Û0\“\‰\Ù\…F+ü÷¶⁄Ä\Í\ƒ5','Finlande'),
('I¯¡oõH‡±±fA\Ò\»','France'),
('9÷ÇäÇB\Ïõ}q\r\ÍU\∆','Gabon'),
('bº$æIå∫I)¡UR|5','Gambie'),
('Q´˚zﬁöL¡§˙\ÿ\›\√4','G√©orgie'),
('¢€∞¯L;ì6\'\›\r\¬\Í¯','G√©orgie du Sud et les √éles Sandwich du Sud'),
('0\˙\ `Câ\ır\Õ¸>ˇ∏','Ghana'),
('m\¬\˜dW∂BÆ®\Ú\Ÿ\œ\0\ÛP','Gibraltar'),
('\„É:Iäù\Ù\"›°\»\ˆ\Œ','Gr√®ce'),
('ÄgHSNeø\ﬂ\Ë0¥rGå','Grenade'),
('\È7åíïEªl∞\’7\—','Groenland'),
('„£Éåp:D∫ç\‰	# ˚7à','Guadeloupe'),
('”ââq\ŸEàá\¬Q.¢â«º','Guam'),
('\∆\ﬁç]ÄB7É$˝\ÙÜ\\O','Guatemala'),
('\÷\r\r±EEâV\nô¿öOà','Guin√©e'),
('ø:ÆåR\\NÖª\‡q\Ûûπõ','Guin√©e √âquatoriale'),
('\ˆµqTLò£\Ì\ÿx˛hn','Guin√©e-Bissau'),
(')G*\–.B´ªÃø&˛\Õ@í','Guyana'),
('\Ò›ô\„1B;ô¢W£¯\…','Guyane Fran√ßaise'),
('j~\√AôMCô2\Ù¨E\ÁV','Ha√Øti'),
('_◊º¶ZG¥§Dé.\rë¢','Honduras'),
('\–e©\÷\vIJ≠\Óøa3Z','Hong-Kong'),
('àXf1:\◊EOè/ûi´\0â9','Hongrie'),
('Årò˙ÑßL†ï4\≈FB~~','√éle Bouvet'),
('˝†m∑\Ï\ÙHê∫<G%\ˆ/HN','√éle Christmas'),
('¡ÇZ\ÿq\ZMù}SA“ë3B','√éle de Man'),
('oª™\'SK±˙˙í\ﬁ”©','√éle Norfolk'),
('ì\‡\Ò∂H§B\0∏\Ë80l˙ó\Ï','√éles (malvinas) Falkland'),
('n\◊˛b\˜\Ì@6™BMé[\Í','√éles √Öland'),
('\“\Zÿõ\»DyæI¯|≤\˜C','√éles Ca√Ømanes'),
(';\Ó\'pY+Mºå˛Ñ/\'=Ä3','√éles Cocos (Keeling)'),
('©å¡\ÕB∂©J¶\–ˇFP†','√éles Cook'),
('ﬂºπ~\ËEEç≥N\Ëg3u','√éles F√©ro√©'),
('|E¢ßê@©é∂ã\≈\ˆ\rPí','√éles Heard et Mcdonald'),
('K(\ÌˇXVL√òqØK\r\·kB','√éles Mariannes du Nord'),
('ûcà5\ÓªN.éñTÆ®™m','√éles Marshall'),
('≥Ø\Ë@\ÎLpñΩ?u~\0Ωë','√éles Mineures √âloign√©es des √âtats-Unis'),
(' :P˙ÜG\'±Kexïb','√éles Salomon'),
('x∏˘\ÙS¨@\‡´˘Àà*àé','√éles Turks et Ca√Øques'),
('R˚ºD˛àJ\ÚKA\n','√éles Vierges Britanniques'),
('\’\‹ˇ@@˙Hs≠˚f\‚1†17','√éles Vierges des √âtats-Unis'),
('\Ã\ﬁe1.\ﬂCªÇâ\\gì\œ','Inde'),
('®öIµ69@£ù`_ª®¨g','Indon√©sie'),
('i¨\Ÿ;üK⁄Ø_#\œ\’4ch','Iraq'),
('0;\ÒÉb\‚O\‚†.˙FêD6','Irlande'),
('W¨LÑWK˘†23:´ú.','Islande'),
('Åè’©\œ˝A\˜•\Ù\Ì\ÂÇ\ﬁF','Isra√´l'),
('ÕàZ~M∑\€°\∆X~','Italie'),
('_-\—9Eêsëì¿◊Øy','Jamahiriya Arabe Libyenne'),
('9(?\ˆkGÆ¢A®\⁄\0Ö-∏','Jama√Øque'),
('m}InTJ_É\·ïx\…j','Japon'),
('~\õ\ƒ\n\ÃOéΩ\ƒ_∂AÆ}ä','Jordanie'),
('D¨jã7EB\‚õQ?dumó','Kazakhstan'),
('MΩ∂1d\ÚK≠Ç˘W¯ß+Ü]','Kenya'),
('pÅñ¥\ﬂwOí§\≈\Õ õPØP','Kirghizistan'),
(' 6\Ã_\ C!ßQ\Ô°6R\Á¯','Kiribati'),
('Ö¨6üMkù\ÿ\◊\Âl4.\n','Kowe√Øt'),
('hå˛=(îG£É\ËN\⁄\‹&\·\∆','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('\Ã\„¥y)ÉF6±%1≠˝JK','Lesotho'),
('\ˆ˘9?\ÚA†ÖfVì∞ª','Lettonie'),
('g\¬¡O≥hH\"ø\Œi†Ü-QO','Liban'),
('H\–v;˚2E^≥Uﬁê∂Mhî','Lib√©ria'),
('rh\÷*òH|ÉîØ,ôqÃØ','Liechtenstein'),
('W§”ÖBMù$å\\\'\Ò\œ?','Lituanie'),
('\Œ\—\Ò}äO\‡öQu\Ô˝yr]','Luxembourg'),
('is>sTQHª`xGò\Ê\÷\È','Macao'),
('\‰¸|%L≥ñp\≈\"\ˆ™•','Madagascar'),
(':_\∆\›\ÃEä∞DsDÑ\‘\\Æ','Malaisie'),
('≠zÜZ\„n@≤\«S≠˛-#å','Malawi'),
('˚\Ê\”ÄFöïå˘\»\Ã¯ßf','Maldives'),
('Å¶2SO@á†cSÇA,(9','Mali'),
('Æ^gC“∫á¿\‰è{åñ','Malte'),
('S∞Mó\—Dñô≠\÷\»M\Ò«û','Maroc'),
('XÆô\Ú∑\ÁEúØSEp[O2á','Martinique'),
('5˘ºäJû≤RÆ5M≥ü\÷','Maurice'),
('∏\ˆß\n\÷ZF\Züïî\«≤','Mauritanie'),
('Ωµ2ßEÀ©?9ç“á^','Mayotte'),
('\ƒ?\—L\n¨VµuÄ8\Îˇ','Mexique'),
('b.˚Ç\ŒmGSíó\‹lj®â','Monaco'),
('º†•\0è¯J$îí]\◊˙ñ','Mongolie'),
('ª\ÿhŸµL$¨◊Ü\“*N\'','Montserrat'),
('&¿W¨	Oã≠zD\…H\ÕD?','Mozambique'),
('–ü\'ä\\¡A°ÜC>ÅLI\Ò\Ë','Myanmar'),
('\Zü\ƒ$ÇóLéE\ÿ[v∑','Namibie'),
('∫dˇ\ÿ\'I\ÓÉX⁄üå\Ô2J','Nauru'),
('/ßLdO1ä^\ 1jöp','N√©pal'),
('˘∂tkk\ I…Ç\»\Èô\‚LÆ','Nicaragua'),
('˝úó\ÁeCx¶\Ú´ç˘','Niger'),
('º≥\"≥EL~≠\'_NÉ\n`Y','Nig√©ria'),
('Lo\Î\0eEe©\¬\≈b√∫Nñ','Niu√©'),
('Oñ\\?EeHgñAWI±','Norv√®ge'),
('¨˚\ÛÔ®©Cò¨4.êVà','Nouvelle-Cal√©donie'),
('\Œ˝™W¡GFöq[c?¶','Nouvelle-Z√©lande'),
('\Íï	cÆBÆÅ=j°\Œ\Èù','Oman'),
('lB:\»D¯Éjyde\\/','Ouganda'),
('o’±H\¬M\Áñ\Ûû\Z°Pú','Ouzb√©kistan'),
('êr\ÓX]\¬G–à}Hkc7πà','Pakistan'),
('ío\”U\ƒE\‰óP;è¥=I4','Palaos'),
('öIõ¸\‚ÑFaàk\Ù–í8\Á','Panama'),
('Æñû\‘>E@\rò/&dëX','Papouasie-Nouvelle-Guin√©e'),
('\"\ÕFT%\ÌN6øI9õ|0\ÌL','Paraguay'),
('\ 5\\âOsL<´\À\∆\’@	','Pays-Bas'),
('w/_º8JÄê(\Ú\ÿ8\◊pà','P√©rou'),
('{O\›\"\Â\'Dƒê-\—$H$z[','Philippines'),
('\»R\¬	\Ê\ÚO√ä?©≠<#3Ç','Pitcairn'),
('\\\¬&›¶D‹¢^Õ´ÏòìH','Pologne'),
('\≈0ÇR/hHÿæ\∆]ØÇ\ﬁ¬ê','Polyn√©sie Fran√ßaise'),
('ûG_˝û\’AØ≠ö\ÍóöªQ','Porto Rico'),
('z™\r¢G\nã0 òpkq','Portugal'),
('\…/¨‘úNKp∑ûY#∏©<4','Qatar'),
('\Ÿ\Â%˝`w@ÆÿãÇ8¡','R√©publique Arabe Syrienne'),
('\ˆ~pxÖM˙ûK\⁄\Ôa\"\÷','R√©publique Centrafricaine'),
('ó\Ìk\ÍH=òG)\'œÑ\ˆπ','R√©publique de Cor√©e'),
('ïé©,≠òJ◊üg⁄ùØ¡Ç','R√©publique de Moldova'),
('\„\ˆ\‚}ò>H>Ñ\’\√>Õû\€x','R√©publique D√©mocratique du Congo'),
('@]\"6Mú@É©yyvk\Ÿ.	','R√©publique D√©mocratique Populaire Lao'),
('åÑ \ıòåEáµä≤¡9\'','R√©publique Dominicaine'),
('DùG´±Lyô\˜∏@))u\…','R√©publique du Congo'),
('£\ÁR5pE\Ï∞O\‚X∂\"`','R√©publique Islamique d\'Iran'),
(':3\◊yLÇN,µ\Î¿fP”Ωç','R√©publique Populaire D√©mocratique de Cor√©e'),
('fxÜ\—\ÒK≠\Í@ã-|Å\”','R√©publique Tch√®que'),
('Z\Î“ó\‚\ÂHRñ\r\–	1J\»','R√©publique-Unie de Tanzanie'),
('<ÿå\ \€J;®çTS\Ús%','R√©union'),
('¥8\Ù¯WúKç∞±§S\·7\˜F','Roumanie'),
('%úN7F”üâ˛rmºX\Í','Royaume-Uni'),
('3	G}ûπI\"≤E^î\nF\ÍR','Rwanda'),
('\„˘å\'d+G∞Ω˝âà\„?ˇ','Sahara Occidental'),
('z±+∫\ËPD%±w\Á\«7;x','Saint-Kitts-et-Nevis'),
('∑0\…\‘ëEkÅ\ﬂB\»\œ\Ó≥','Saint-Marin'),
('3h÷∑-G÷á\€`¯ñw\÷\Ù','Saint-Pierre-et-Miquelon'),
('[\›5\‹9gJaú\€%\–\–\‹ß','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('˚	ÇY\·yNIù‹°\€\rnO\⁄','Saint-Vincent-et-les Grenadines'),
('m!π¿k@\næèπWîÑYô','Sainte-H√©l√®ne'),
('\¬WúfäB\Î®\"¸kéTÅ°','Sainte-Lucie'),
('õ\Á\0ªâG•´\‡P7nO\ÒÜ','Samoa'),
('º Øá\ˆ)AßÑc\\\Ì t','Samoa Am√©ricaines'),
('\Àt?p?Hø®7\◊ÿ∑\€;','Sao Tom√©-et-Principe'),
('\ÒV\‚\‹Jµé˚ˇ\Ô∫\˜æ','S√©n√©gal'),
('çA\Œ˙w@\Èº,\ﬁuQ’ä\Ê','Serbie-et-Mont√©n√©gro'),
('Ä∂W_¯uMß©E,3\·','Seychelles'),
('Vä<[\ƒ˚CPöó+98h4}','Sierra Leone'),
('≤ûë`öJòÆí’æ\ıAF','Singapour'),
('tçä\…C2±v_±ù\€w','Slovaquie'),
('p¢2öEBPÆzNÑ˘W\‹','Slov√©nie'),
('ÅÉf\Ì|G\'ô\ÎqO˘\ƒc','Somalie'),
('l;±KªJæ∫¢µ˝I&\÷o','Soudan'),
('{BDwBÍ∂ñ%Rõ','Sri Lanka'),
('nÉ\“co\‚G¨Ωµ}<\Ú\Z','Su√®de'),
('Pü\ƒRµG“Ñp\∆\ÍX´@\Ì','Suisse'),
('\Á˝9,\Êj@B£\ÂºCva±','Suriname'),
('∂@8\»ALGò\⁄\Ï\€)\Íä|','Svalbard et√éle Jan Mayen'),
('x•]\Ì≤N¸äu‰®ïa\Z*','Swaziland'),
('∂Æ˝ï3\ZOùæCr®	bìZ','Tadjikistan'),
('t]x\\\›\ÙC\ê¿\n.t\—-','Ta√Øwan'),
('Eç›∫ÉkKuû@áÆ6\ÓÜ','Tchad'),
('5\"¥õ4\◊E∂Ç-ˇzÑ9	','Terres Australes Fran√ßaises'),
('W∫¸Æ	@4Å¡\ıv<I\ı','Territoire Britannique de l\'Oc√©an Indien'),
('¡n\Ó!¿AIÇ\ZTπl&4','Territoire Palestinien Occup√©'),
('¯\»\…\€eEä∂-`l]\‘','Tha√Ølande'),
('ô{¶R*1J•ø\ {±µ≤ã','Timor-Leste'),
('¢Id0≥De∑Ößu8hV','Togo'),
('SQÅ!&F¸≠?Jsz¥L=','Tokelau'),
('ufù?1πNô˛ZŸÆ#¯','Tonga'),
('\≈\Œ*ëπGDõ™\ÌM\Ù%r','Trinit√©-et-Tobago'),
('∞˛áÇò\÷IF∞+;\Ê±ñQ','Tunisie'),
('˛ã\¬π[Bô\“.89∞','Turkm√©nistan'),
('ë™¥\"∂KÌäôL¨ \0¡','Turquie'),
('	5≠ü¿FU¢bÖ„®±.','Tuvalu'),
('/¶˘æ£BÏöµ~£\”GY','Ukraine'),
('Z\ﬂLA@WAz∑°cF\À÷êû','Uruguay'),
(' ¢\ÍZ\»F3Æ\ˆ\Ê\·\Ò”∫','Vanuatu'),
('/¨î˛J>™˝e\∆\◊y\À\À','Venezuela'),
('dxº\Ûõ¿F$º\’\"¸ô\Îà\È','Viet Nam'),
('ä\Ïl≠\“\ÏB\ÈΩ¸)Tè\·','Wallis et Futuna'),
('\ˆ°y{ãO∫üÆ\‰ñg.Kt','Y√©men'),
('\\∞\⁄@\ Jûå\\ézFZ','Zambie'),
('\ \Z\Z2û˝K◊ûe¢\Ïæ','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-04-10 20:56:47',3),
('DoctrineMigrations\\Version20240201152951','2024-04-10 20:56:47',2),
('DoctrineMigrations\\Version20240202084749','2024-04-10 20:56:47',3),
('DoctrineMigrations\\Version20240202150901','2024-04-10 20:56:47',2),
('DoctrineMigrations\\Version20240207105701','2024-04-10 20:56:47',5),
('DoctrineMigrations\\Version20240319212437','2024-04-10 20:56:47',2);
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
('∑-≥\'-àA>ò6Hï;ì1∂','Cabernet Franc'),
('Hñ=n+°AóÆ+Q\Œ\n4h','Cabernet Sauvignon'),
('°á\»0îeLŸ•>oí˘\“	','Chardonnay'),
('{æí9ë\·K\Â©\\'\ÿg9Ob','Chenin'),
(']\ÏÆ<˝TJœ®π\·è	\≈(','Cinsault'),
('Or?`£öH\ıª\Ì+`\n','Grenache'),
('äà»®r@‹¢ì[ª,Cµ','Merlot'),
('w3\ ˘qO\r≠\“\„\ÊA','Nebbiolo'),
('∞chiûC≠£ Z•\„\rÉ','Petit Verdot'),
('Øë\–\Êú\ÙF±´h\ÓDN◊ã','Pinot Noir'),
('é≥¸7QDÖû93ü\–=','Sauvignon Blanc'),
('›∏\Z\·\ÏDQä\‡\â“ºjé','Shiraz'),
('´Pà∞\ÃNu¥|>î±\Ï∑','Syrah'),
('5DYÅI$éô\ﬂ@vÄ','Tempranillo');
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
('\Óo;‘àCæ±˝Ω\À\nl','hugues.gobet@gmail.com'),
('\ËòNE\ÕD‘çB\ı\ƒ\ÊΩaí','root@gmail.com');
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

-- Dump completed on 2024-04-10 20:56:48
