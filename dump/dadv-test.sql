/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv_test
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-ubu2204

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
('´\ı\ÂB›óH∫\Î[\·PP','Caymus Vineyards Special Selection Cabernet Sauvignon','Caymus Vineyards','red',2013,'[\"Cabernet Sauvignon\"]','++','caymus.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',259.99,'2024-06-14',NULL),
(')R1Ñ˙\ŒNÖÇ7\ÕP\Ó','Ch√¢teau Latour','Ch√¢teau Latour','red',2010,'[\"Cabernet Sauvignon\",\"Merlot\"]','++','chateau-latour.jpg','æm2\‹#Møåfh\—3[º','France',999.99,'2024-06-14',NULL),
(':(\ﬁ\Ó\Ú!J°Äk[\'{¸','Domaine de la Roman√©e-Conti','Domaine de la Roman√©e-Conti','red',2010,'[\"Pinot Noir\"]','+','romanee-conti.jpg','æm2\‹#Møåfh\—3[º','France',2999.99,'2024-06-14',NULL),
('N¥I\Ÿ}#IÑ¶çw™¸\Ã`','Sassicaia','Tenuta San Guido','red',2012,'[\"Cabernet Sauvignon\",\"Cabernet Franc\"]','xs','tenuta-san-guido.webp','æm2\‹#Møåfh\—3[º','Italie',899.99,'2024-06-14',NULL),
('^¿ë{üF\‰á\÷\€v˚\›\Ù_','Domaine Leflaive Montrachet Grand Cru','Domaine Leflaive','white',2016,'[\"Chardonnay\"]','++','montrachet.png','æm2\‹#Møåfh\—3[º','France',1599.99,'2024-06-14',NULL),
('c^Äú™Ø@ﬂÑÉÉœæ,U','Guigal C√¥te-R√¥tie','E. Guigal','red',2014,'[\"Syrah\",\"Viognier\"]','++',NULL,'æm2\‹#Møåfh\—3[º','France',358.99,'2024-06-14',NULL),
('i\nÑsÇØNWíÕëÜ±*J','Penfolds Grange','Penfolds','red',2008,'[\"Shiraz\",\"Cabernet Sauvignon\"]','=','penfolds.webp','æm2\‹#Møåfh\—3[º','Australie',1799.99,'2024-06-14',NULL),
('{\’]\Û\Â<AÉ§é^Ÿº\’\r','Ch√¢teau Margaux','Ch√¢teau Margaux','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\",\"Cabernet Franc\",\"Petit Verdot\"]','++','chateau-margaux.jpg','æm2\‹#Møåfh\—3[º','France',1099.99,'2024-06-14',NULL),
('ó-L\⁄FAå4S\ı¢\·\È˙','Ridge Monte Bello','Ridge Vineyards','red',2014,'[\"Cabernet Sauvignon\",\"Merlot\"]','=','ridge-vineyards.png','L\À#zO0±àj≠q¥s_','United States',199.99,'2024-06-14',NULL),
('µLØ\ÈCnG§îVajH','Cloudy Bay Sauvignon Blanc','Cloudy Bay','white',2019,'[\"Sauvignon Blanc\"]','-','cloudy-bay.png','æm2\‹#Møåfh\—3[º','New Zealand',49.99,'2024-06-14',NULL),
('\Á\ÚG¶fF@ä\»%\Ó>\Îm','Gaja Barbaresco','Gaja','red',2016,'[\"Nebbiolo\"]','xs','gaja.jpg','æm2\‹#Møåfh\—3[º','Italy',899.99,'2024-06-14',NULL),
('\Í¬°\ŸI^Ä‹ì∞∂W\Ì','Vega Sicilia √önico','Vega Sicilia','red',2011,'[\"Tempranillo\",\"Cabernet Sauvignon\"]','--','vega-sicilia.webp','æm2\‹#Møåfh\—3[º','Espagne',1499.99,'2024-06-14',NULL),
('\w™√§O\Zå`v∫\Á∑','Opus One','Opus One','red',2015,'[\"Cabernet Sauvignon\",\"Merlot\"]','--','opus-one.jpg','æm2\‹#Møåfh\—3[º','√âtats-Unis',1299.99,'2024-06-14',NULL);
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
('¶™H¥JCƒã\Â≥\ﬁ\ˆ\Ù\’','Afghanistan'),
('U\È\Ÿ\◊A\ıäük®™{\Ã\ﬂ','Afrique du Sud'),
('≠S$e\Ù\œN!ønX\‹G[_\“','Albanie'),
('è/u\’BiGü§8-∑ü[∫\Ú','Alg√©rie'),
('\‰|c8K¢≠ÜÅ¢â=','Allemagne'),
('P&U\œgIƒè\«^cs3∏','Andorre'),
('é›ê›Ω\˜N2ºÖ\ı\«˝;','Angola'),
('t˝¯~>O»¥\—\ÁPÜñ\‡','Anguilla'),
('Z\«/◊Ω\Û@\‡≠,Ir2ß\„\ ','Antarctique'),
('JllìyK+î´,n/•\n','Antigua-et-Barbuda'),
('?Y5d\‡Nöòs¶^ê˝\»','Antilles N√©erlandaises'),
('\Ô$scT\nM®Ø\√\“>¢\œ\‰™','Arabie Saoudite'),
('\\\Á\ »®DRï8+\Ù','Argentine'),
('1,)àL◊ëd\∆Dy•','Arm√©nie'),
('õØúhFìC\¬.©\n','Aruba'),
('Q≤\ \ÚΩKŸó\‚\\˙\·¿n','Australie'),
(':3ã_™Lcé ’õ7a%\‹','Autriche'),
('^ú\Ù≤M]K∫≥\œF\Ó\Z\≈˝','Azerba√Ødjan'),
('e™\˜ò\ÒK∑\ﬁEñ7\Ìàw','Bahamas'),
('ÑÆ\“=¥MjÜN\¬\ﬂ^?\Òø','Bahre√Øn'),
('\Û@!0?A{ê\ı?ˇ\Ù#∑è','Bangladesh'),
('~˙z9wF˘®d|\√/=\\','Barbade'),
('$/Ä>\⁄$J€ñ\∆\ƒ˚CRE','B√©larus'),
('<õ;\”>ØA∂Ø\'Z(\¶\‚','Belgique'),
('√û\"83L’Ø˛>FCJt\„','Belize'),
('\ıêF\"5\ÎMi°\Ôq\ﬁq/≈ë','B√©nin'),
('\Õ\ı\ÏÄR∫@óú|S\r\’g','Bermudes'),
('é#™3]I‘∏>V/ë\Ÿ3R','Bhoutan'),
('\\\Ò2m\ÃwJÅîâN\«ÿºr','Bolivie'),
('\˜îA\t\'Cgé\Ì\Ë\⁄v}d','Bosnie-Herz√©govine'),
('ò.ô≤ó\—D,∂\”\”%\nø.a','Botswana'),
('\Ò∫Ωs\ˆ$Aûø\Ó¡î\‰ °','Br√©sil'),
('\ı\Ù}:Ñ\ÎG˙û\"\Í1esW\„','Brun√©i Darussalam'),
('\Œú%I\Íå(†∏è\Œ\r\ÿ','Bulgarie'),
('W(ÇP-Fbëã&•\∆Rà\◊','Burkina Faso'),
('}\…\‰\ﬂ\\äDíâq3OÄm','Burundi'),
('¶í\÷9\ÈpC|ç˛>§Äœ•\Ë','Cambodge'),
('\Èëˇ\≈^H®ë;\Œvµ\r\\','Cameroun'),
('ÖSuoL\—HMî\ÂtäI´$.','Canada'),
('s6\Ë~BÉMÈè©3B•\«\Ïu','Cap-vert'),
('ƒúEt°GÎéõ\ÿ\Úà95','Chili'),
('cX)\Èz|Btµf%Y\"JR','Chine'),
('µº\ÿ[$2FFîàï\‡W\·∫','Chypre'),
('?ë\◊xNáLΩ8k\Ûˇ ','Colombie'),
('PøªZM¥Dîöuï°ô\“;','Comores'),
('Rµl\˜g/Cs•£\ÙèM\¬2','Costa Rica'),
('.¡≠ƒãB∑ìÑ^´a\“]¿','C√¥te d\'Ivoire'),
('cYTe\‰\nDœñm\ıU\Ì´','Croatie'),
('\”@{\“z\ÕAqª\Ê\·D\—\ﬂ','Cuba'),
('®ì\Ï\Û@°F¢º\ \Ùwˇ\ﬁ\ƒ','Danemark'),
('\÷\‘([†JEÑàñë»æ—£i','Djibouti'),
('ú	96¢C—ô†\Ÿvv`','Dominique'),
('òªVSEJ$´F\Ó!\·e\Ô','√âgypte'),
('\ ˘˚\Ô¥L¬µK¥ø\Î¶\r','El Salvador'),
('\Ô?π3iA\nç?eÉâ=\⁄\’','√âmirats Arabes Unis'),
('–ú\”d2Nú°R•ë†e8','√âquateur'),
('¥v\œ\œoJtÅÅ]9\◊Iä','√ârythr√©e'),
('n9Éõï\⁄J´úÑΩ%\Ìm\◊','Espagne'),
('\À\Ï\ˆ∑\ÂtJ}á\Õ\“\¡±~','Estonie'),
('9f≠®|Mß≥\ŸW@\ﬁ/','√âtats F√©d√©r√©s de Micron√©sie'),
('\Ù\”\–ô\\G]ù/¥\Á6','√âtats-Unis'),
('4f˛\€aµAdÇ8Xø\Ï^É','√âthiopie'),
('\nH\‰yI!•è>,pá∑ø','F√©d√©ration de Russie'),
('\‡å\¬√ØLΩàâ\Õ5∞','Fidji'),
('\'1yµB@\0í\·\'\…j\r','Finlande'),
('\‡\ÕRÜÖbC-îVÑz\—\'¥','France'),
('7DÄÜ\⁄HÍ≤æ†ä\‡1\Ï','Gabon'),
('¸ñc<TÆB\Ù∂≤\« 5˙hñ','Gambie'),
('®¢=fq@ß∂\÷+^\∆','G√©orgie'),
('¯\c\’u\˜H„Üí\‡öG#5)','G√©orgie du Sud et les √éles Sandwich du Sud'),
('y\Òê\Ï7\ÎE\Ê∞\ F\ı≠\Ê}º','Ghana'),
('X(%U^$BÇΩΩñ\ÚªzF','Gibraltar'),
('l{\0\HòD<•Y\ﬂg+ø\˜','Gr√®ce'),
('d\Û%AEü;\–\Ê.§ù\ÿ','Grenade'),
('z®7p˙¥Bâõ∂zAŸê\ËX','Groenland'),
('±§ç\ÃcùFÄû\\ø•¯¿kã','Guadeloupe'),
('\«?B\Ùæ\◊N≠¢H\Ï±\Ê?','Guam'),
('∑ø4\ﬁ\Ã@céñ0/`\ÌoV','Guatemala'),
('8\⁄˝\'BJ§†w¯Z∂ê\∆','Guin√©e'),
('î\€*±MEpû^8\«\\°\”','Guin√©e √âquatoriale'),
('˛a\ÒW1OBï6øU)e\“¸','Guin√©e-Bissau'),
('1\‡\\\›p@AÑµU±Lr','Guyana'),
('π{_\ÈE¢cã£Jf&','Guyane Fran√ßaise'),
('\Ï0ÉåpF&†\√h;\€','Ha√Øti'),
('¯ ≤!õ\√J°ºûÉ‘ê\È\⁄','Honduras'),
('\"1grØB@è:1û˝\Zó','Hong-Kong'),
('zp\ƒ\Û!íGºàúTØ\ﬂ\∆\Ò-','Hongrie'),
('`\Ìu.\ıAFí\”œ∫ocm','√éle Bouvet'),
('RØÉêmK±πD\“\Z˘˙\Ê¯','√éle Christmas'),
('JE	E\–3IJú\À;íë†!','√éle de Man'),
('Ø\Ÿn2tBÇ\ÍvàGyG','√éle Norfolk'),
('\0¨\’=ìÜH«è/\‹<\\§∂','√éles (malvinas) Falkland'),
('4Nëh-M˙æ\⁄\√\◊\ıL\Û','√éles √Öland'),
('î\‡)¯¯JFÆê$z$o\“*','√éles Ca√Ømanes'),
('\01ó¢@úBWÜ1\Z#>\ÿ\Ï\œ','√éles Cocos (Keeling)'),
('R>†qhEµëjú\Û∏Eq}','√éles Cook'),
('9 /FFºñNéù…ã\¬','√éles F√©ro√©'),
(']i\È\ÓWI°\Zßdƒ∏;','√éles Heard et Mcdonald'),
('KA˝áHáã.\˜ab#j','√éles Mariannes du Nord'),
('\‡\”@,≤5K“∏#\'#|1\Í','√éles Marshall'),
('b\ı\·]%Bmï)&1J©ù','√éles Mineures √âloign√©es des √âtats-Unis'),
('¡è\‡T©ãGdô/\“\Ós5\·\Ê','√éles Salomon'),
('∏\"\Ï\ÕXH…ú\Ï!,^Q¶[','√éles Turks et Ca√Øques'),
('\ÏÕç\„FìZ’ü\∆,?™','√éles Vierges Britanniques'),
('\Ÿi)\„Nﬁ≤\ˆk\ÊœÆê','√éles Vierges des √âtats-Unis'),
('˛e1ì¬§DÓ•à05µæ\‚d','Inde'),
('ü\Â\ZØQ}@%é\Õ/ñZf\Ó\Ã','Indon√©sie'),
('ç∂i¯`N?úÇ+∞Knl!','Iraq'),
('\∆©\ˆ\⁄\ŒKéàªê\Á¶Æ\Û','Irlande'),
('åb,nö\ıMœîìLH(<(','Islande'),
('Ωî•\'CÃë\Ï2\–\Â\"Z','Isra√´l'),
('∏-ÖL∑\ZM\Ó\›pã\Ì','Italie'),
('+\¬\Ám¯úO[§!¿/\ÙN.','Jamahiriya Arabe Libyenne'),
('\ÌGö˚GVCïó\«\0=˛ñWá','Jama√Øque'),
('ç2;~™RGô¥s\·=í7\“','Japon'),
('gY\ÃJ\≈}F\rá)6T.“ã','Jordanie'),
('YGô\È∂\ÛHpîVD\◊\»ö\Õ','Kazakhstan'),
('\‘\ÒàºUNFì£Îüíy-\\','Kenya'),
('ve√∑L¿®ÜêÉ\Û†vD','Kirghizistan'),
('.!Ü\ÿ/°E¨†r_0','Kiribati'),
('\Ï|k<\ÚN∞∞;o˝±£w-','Kowe√Øt'),
('_\\È(S\≈Cm†,®™7\Ïñ','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('ÜπÖ\Ÿˇ\ÚLêÇ\Z~\Ôã-⁄æ','Lesotho'),
('5c\¬IG:ü\”˝¿PE','Lettonie'),
('Ñ\Ê/Ω-¸Cm®¨B%\›\ˆH','Liban'),
('#l>¥P\˜Bñ¥5\"AÑ\Ò†4','Lib√©ria'),
('q†ˇ\‘\'\∆O2ÜSûû\Ÿ0Æ','Liechtenstein'),
('c\Â≤l<\‡ANπCf¸Z®Xg','Lituanie'),
('â$\Ó7YuC4Åˇ\ﬂ< ¡]','Luxembourg'),
('U^õ\‡fMIá¿8\ﬁF©ci','Macao'),
('ì\'`æq¢CSª)õo\›7\Ï','Madagascar'),
('\"\ÕgìîE∞\‚¡\Î\√\Z\¬','Malaisie'),
('…Ωà\“ARä\‹\»\»›Æ\Ÿ','Malawi'),
('°|\ÿ˝ú\∆@™áé\\\Á\Íó˝','Maldives'),
('∞a¡uD\ÚOkúëäQ∫\’y∞','Mali'),
('#\r\rJëH@ÍÉ≤ãX¶\√YD','Malte'),
('ßihíxBGë#ÆSES\“\À','Maroc'),
('r\”U∫_Kü∏Ü´≤6\0\ı\ﬁ','Martinique'),
('X+ƒí¥hB=æÉû˙\˜[\¬\”','Maurice'),
('I\Ÿq$∑˙G…ÑFTrÉÍ∂Ç','Mauritanie'),
('D\Â*ç†H≥öArI≤eú','Mayotte'),
('\Î\‰\ÚkØJEïùù\Ò\Õ¿w','Mexique'),
('\Ô	\·è\ﬁ)Aø…Ü˚G|Y˘','Monaco'),
('ø˙áîê\ıKà´≥Nä˛/','Mongolie'),
('¥\”@[JÖJ…áæó	+LW˚','Montserrat'),
('9|h\‚B\Á£Lu#ˇ\≈\‘','Mozambique'),
('	y}R\Ì¥@¨\‹<ö2ÂôÑ','Myanmar'),
('\Ÿ⁄†2EIFﬂ∂_\≈}^\0q','Namibie'),
('˝\Ÿx*0íEπ° ˚\Ãµ\«K','Nauru'),
('õ\ƒ]\n™\rJvéI-\–O¸Æ','N√©pal'),
('◊£ßHµìHz¶\—¿$\Z\Ë\≈y','Nicaragua'),
(' áY2HwF¸®àe<\ÊΩ\Ù','Niger'),
('@AÑ>ª@∫≤)ì\Âÿé\ﬂl','Nig√©ria'),
('4ºí%\«\ZLO©B®Cx†±\ˆ','Niu√©'),
('{\€Å√øH∆Ñd\\éÖe∂~','Norv√®ge'),
('eE@¸ßB(Å\ÿ&≤\Û¸','Nouvelle-Cal√©donie'),
('\ÒK_~®§I≈ï|¡Hc\≈F','Nouvelle-Z√©lande'),
('Ç¸)ˇCÔäïz}±,\∆','Oman'),
('Å⁄≠óeN\Ûù°&\›e®±\Œ','Ouganda'),
('»Étµ¨\ÔBê\ ø\ \ÌiM','Ouzb√©kistan'),
('\Á\Ês\‹\ŒLzça[°=\”\Ôñ','Pakistan'),
('ûe!vßTJ@ì\ÿ)∂\Ó\\0\Ó','Palaos'),
('#áç:ÑHﬂúæ\”)˙\ƒ¯\·','Panama'),
('∂ÅÆë\˜\ÔB\n£\\:>\Zò£','Papouasie-Nouvelle-Guin√©e'),
('ò≤öUEí∞}8?kì','Paraguay'),
('9\Í\Ó§(E\nõ≥K<:Ç\0\Ê','Pays-Bas'),
('†}ü´WnMöº\ƒ‡≠ç\Ïâ','P√©rou'),
(',´G/õEGéüQö\⁄','Philippines'),
('ƒ≠à¨∂AM∞πF\ \÷u*@V','Pitcairn'),
('N∞oï\„gOf£á¡Ø§]<','Pologne'),
(';\Û,!\Ê\˜C⁄†©c\Õ_à÷±','Polyn√©sie Fran√ßaise'),
('\—…ëkG`º6\ÓhﬂÄqâ','Porto Rico'),
('=Å∂NL@g®ÄO\Û\Õn','Portugal'),
('L^¶KzLIè[p\\{C\Â','Qatar'),
('f\Á	ùEµEïº\÷~%\∆u','R√©publique Arabe Syrienne'),
('¡\€`1πH÷ÇÿÆ§\Ìw1$','R√©publique Centrafricaine'),
('\Ûâ»ºsª@Ü±\'V}ø*p','R√©publique de Cor√©e'),
('†tiûµ\∆@∏Æ¥\„+#ãr≠','R√©publique de Moldova'),
('A˚\ceKN∂∑\\\Ó\—|\‰\”','R√©publique D√©mocratique du Congo'),
('*˚*\œx∑MÂ•àònº%\0~','R√©publique D√©mocratique Populaire Lao'),
('\ÏI[í\rJî¿+*ø%<','R√©publique Dominicaine'),
('Ç7ßìlCsüòA≠eYπ','R√©publique du Congo'),
('UD¿±>@ú≠ÆæåUöY_','R√©publique Islamique d\'Iran'),
('Fcc˝\«I ©û\ﬂ)õ\n\—¯','R√©publique Populaire D√©mocratique de Cor√©e'),
('q\‡°râ¿O*É˙??ë≤+k','R√©publique Tch√®que'),
('`T}\Ë?H/õ\÷\È*\„T4','R√©publique-Unie de Tanzanie'),
('ä\ÀâøBo≤Hi;“¥ò','R√©union'),
('¡j¡\√_xMKÄäÇ˙\÷¬≠\Ë','Roumanie'),
('¨`_ë\ÙNöÆ≠.\÷K','Royaume-Uni'),
('†>\Á<D±ãéo˙5®\’','Rwanda'),
('\ÚQXó\÷\ÕL4¥ﬂ´\ÈUfk','Sahara Occidental'),
('=[hYzBìó∂\⁄ \≈4\◊','Saint-Kitts-et-Nevis'),
('\Úò@Ø¬≥@⁄ª…ïçƒ®b]','Saint-Marin'),
('7\œnXöK¶Å!\≈\n\‰˘.†','Saint-Pierre-et-Miquelon'),
('ä\ÿg_˛óO›äUC¯\rí\Íà','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('|ü\ ^\√VJPü\—:\Ê-e\“','Saint-Vincent-et-les Grenadines'),
('\⁄ˇÇß\ÓëKﬂ°\ı©n\À˘}','Sainte-H√©l√®ne'),
('ìJ\‡}+¢L˛∫î\\÷4Fëß','Sainte-Lucie'),
('|•[áNßí#{†h\d','Samoa'),
('•te\Q¿O>ΩJw.âV|´','Samoa Am√©ricaines'),
('~≥˝°¸B\\Ø\•˛}\ˆ\Ï_','Sao Tom√©-et-Principe'),
('_\Ì)fI∞â´t\ŒEãw\…','S√©n√©gal'),
('ˇ9g¥≥L◊ÜQc8v$','Serbie-et-Mont√©n√©gro'),
('\'0å\ÔDx¥\0{ñp>î`','Seychelles'),
('j\«\“O5ÜGçä©uJ\ƒ\ﬂ˛','Sierra Leone'),
('™\Ù(\‰¨G$ìÉ\r3J','Singapour'),
('ª?\Œˇ\„¶DbÜ/\ˆ\Ë\'\Õ\‘','Slovaquie'),
('pÖïv\È®E™S;îô;¨\Ù','Slov√©nie'),
('1á\‚⁄∂MêóH\Ÿ˝∂ök ','Somalie'),
('\Ÿ\√,ﬁ¢ÉHF™à4\ﬂCJôW','Soudan'),
('H=\„h\ÀM]Çò`!÷∂±','Sri Lanka'),
('Z~ãˇOCß\◊›á\¬C','Su√®de'),
('\ÌUB˛_\ÛG>ªO\…A\Óê¸\”','Suisse'),
('ã\„©zH\œD˚Ω)öÇ]á¥','Suriname'),
('p+\Î\0N◊≥A\'ô\ˆ\‰î','Svalbard et√éle Jan Mayen'),
('.L§o\√\¬Gû≤®^<\ÔõA','Swaziland'),
('w6S#˙EïÅ§ïÉüû*','Tadjikistan'),
('f…Ü·∫¨Iüô-∑\‰|£','Ta√Øwan'),
('\¬o\Û7#¯M#Ñ\ƒ\œ\Î\·oò','Tchad'),
('¨AD\ÿ˚ˇ@∞ﬂêó®z,ç','Terres Australes Fran√ßaises'),
('^{$\ƒ9[H≈ñ\”2@+]≥:','Territoire Britannique de l\'Oc√©an Indien'),
('A4GëçHáù\ÓN”Ωhè','Territoire Palestinien Occup√©'),
('\◊!eœìE\˜ã]ãwpêz','Tha√Ølande'),
('\ÈPåGØ.Bvß	\›T|9\”\’','Timor-Leste'),
('ûré4-C\'π˝<>)Rº;','Togo'),
('\Z@;CA`@»Ä√∂h¶å','Tokelau'),
('Ö*øÇ•\ÎI±≥Q\r•Ø7\Ûs','Tonga'),
(';\Ótó\ˆ\—FOÄ0c\Õ$\ÿ','Trinit√©-et-Tobago'),
('o\–D5K¬∂≠ïÑ≤\‘\Ê','Tunisie'),
('Ü∞bc∞C\·∂[l~r\‡e','Turkm√©nistan'),
('7†•¯±G(∫\\/\ÿà\¬','Turquie'),
('õ\‡!.n∫@\'Ñ± \Ï\∆*','Tuvalu'),
('\Ïå\\'\ÃK§ã0\¬\Òc®?&','Ukraine'),
('ñ‹ûÂèîK¶º°o\˜\›\Ú≤|','Uruguay'),
('Yfræ©\ÿLSçrú[µ\ﬁ⁄´','Vanuatu'),
('®\Í*`E\'ÅR.§,+g','Venezuela'),
('F\·ªﬁ¥πCö∫B\ÿ}çuÆù','Viet Nam'),
('\Ó\›3h]âAyô	A\Úö¨','Wallis et Futuna'),
('#cˇ¨õ†FãùVvR∞\ƒ\r\Œ','Y√©men'),
('\Â@ë\ÁNL∑ÑV\Û4¥b','Zambie'),
('\—\ŒjÆ´ïNç†˛≈∞\Èˇq','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-06-14 14:17:18',3),
('DoctrineMigrations\\Version20240201152951','2024-06-14 14:17:18',1),
('DoctrineMigrations\\Version20240202084749','2024-06-14 14:17:18',1),
('DoctrineMigrations\\Version20240202150901','2024-06-14 14:17:18',1),
('DoctrineMigrations\\Version20240207105701','2024-06-14 14:17:18',2),
('DoctrineMigrations\\Version20240319212437','2024-06-14 14:17:18',1),
('DoctrineMigrations\\Version20240614133504','2024-06-14 14:17:18',8);
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
('L\À#zO0±àj≠q¥s_','root@gmail.com','Root'),
('æm2\‹#Møåfh\—3[º','hugues.gobet@gmail.com','Hugues Gobet');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
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

-- Dump completed on 2024-06-14 14:17:19
