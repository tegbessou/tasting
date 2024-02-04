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
('\ğùª\0,J¯È’|Udi','Afghanistan'),
('µ0[\É\ÔG!›¹—q…AD]','Afrique du Sud'),
('§\ç\é\ËUA¢0M‹\Ö\Õ','Albanie'),
('µ>m6\í\ãN\ô±·Si‡ŒÁ','AlgÃ©rie'),
('\Ç\ã¢\Æk-CÂ‰‚aU\é¼où','Allemagne'),
('V’O°D­¿«\ïX\Ï@ú\ß','Andorre'),
('’L\æt-L¢gE\Òmv','Angola'),
('\óş\Ô2HùŒ£¨£h-','Anguilla'),
('x¨½\î\ÄG®¥Óƒ\Ñ \â\ö','Antarctique'),
('\ã\Éú¿\à§C…ƒm™5b@“ ','Antigua-et-Barbuda'),
('O\Ş\×VuOL\á‡Ê’Øƒ','Antilles NÃ©erlandaises'),
('D)\êºønG\òˆ3\ç\õF1+','Arabie Saoudite'),
('DÍ‹),EK;‡Ş‰D','Argentine'),
('dû 4€I\n‡š¡]oÁBµ','ArmÃ©nie'),
('¨\ÖÊœ H\0ª\Ñù\î¼¯','Aruba'),
('4w0£cH“\ô\Èd‡—','Australie'),
('\Ğ\ÙH\ëˆJDÛ»f\ÒgÙ·™«','Autriche'),
('-ùŒ¹ŸMV¢[I\Éµ3…','AzerbaÃ¯djan'),
('\ôpC\ÛAÀ©-?g?ø\ÉO','Bahamas'),
('j°ÿùK@¼P­–¥_®k','BahreÃ¯n'),
('»E\Ãg J^‘t=˜N\î','Bangladesh'),
('™™&|\ŞcD ’~Ø‡\ët´','Barbade'),
('yŒ\Ø\ÈJr l9ÿ‰†=','BÃ©larus'),
('²”\Ø\ô¢\ĞK&——è—?¾','Belgique'),
('¶¡îµ§OG+NuhW7','Belize'),
('\Ø;\08.AÆ…Z\0†[','BÃ©nin'),
('»û\ğN‹M¾J\Ã\ó5ú£','Bermudes'),
('6c4zCPL‘”Œ…\Z>˜¼\Å','Bhoutan'),
('»fZ\ôinA—µÁ\ôq#\Zƒ','Bolivie'),
('\Øú«\İ@j·_`p\Ê\Ø','Bosnie-HerzÃ©govine'),
('Cş©\çPNÙ§k\åN \ï','Botswana'),
('bŞ¥\ÆQ}Muƒ\Ú/©\ì\ò\ç','BrÃ©sil'),
('o9&—\ÜM=²¼B´V²','BrunÃ©i Darussalam'),
('…¾\ĞWš¶M²¨1¯<XŠ-%','Bulgarie'),
('\Ù4\ÊrJ¼¹²˜^\Êv\í','Burkina Faso'),
('R@O›“\İI\æ—Àkú\õ\ÈV','Burundi'),
('\Î{¾­4A‹.–ü¤\÷\Ï','Cambodge'),
('J„:\ÍN\ZS\ò\Ïüà¨™','Cameroun'),
('ü»’©^\óK?Œ4/ÀQŸ’','Canada'),
('ˆKŸ/\óıL\ğ¬Qg¤]\ï	','Cap-vert'),
('\Èá°…¡L¸²\Ñ\ñ3ˆ6','Chili'),
('`3.\ótPG@•³–«^o7','Chine'),
('guŒ±CHUŒ\ÃL\éYgF','Chypre'),
('9-‘hHÌº`qQ¹¿G','Colombie'),
('Ï†ı!\Ä\æEa®\İ\n4A\é›','Comores'),
('\á©~\Ù¿@Ô¥`“	“l','Costa Rica'),
('|ƒO…­ªi‹\Ø\ñR','CÃ´te d\'Ivoire'),
('9N8µcH¾¤ÿ‰\Ö\îb‰','Croatie'),
('\÷¦N*9˜Bû„œY„\Å','Cuba'),
('\Ù\Ä\ëyH®›2üW','Danemark'),
('#\ÌgO\ìµ\0YDü‡t','Djibouti'),
('?\á2Ö¦HA‰û‡®ŒMz','Dominique'),
('s¿Ç€~J\î´ı//t\ó.­','Ã‰gypte'),
('gº3\Ì\ä³DC•\ë\Ğ\r7<ş\Ø','El Salvador'),
('7„\õ\ËB] \óÖ‡r:‘\n','Ã‰mirats Arabes Unis'),
('\ÑvNpœ¯MgŸL76ˆ³\×\İ','Ã‰quateur'),
('\èŸ\ëLÁD0¡\Üf(uÍ#','Ã‰rythrÃ©e'),
('nP1w/J(‰:[‡3‰','Espagne'),
('¾7Q¶upF>“\ÏŞº\æ=','Estonie'),
('­S_-€H	’F;\ô§C','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('”İ²f¦vE–k1„\Û\Æi9','Ã‰tats-Unis'),
('w\\Y-GNvƒ\æ	&²\÷%','Ã‰thiopie'),
('dg¦®ş0GJ³\è@©±\İ\à','FÃ©dÃ©ration de Russie'),
('#\ZbcM¨\àÿ:.+’','Fidji'),
('½ûnüK¼¼\æst	<¿w','Finlande'),
('\ÈhvCJŒp7Î‘\Ó','France'),
('”ş¤P\Â\ßF\í·\É\Û8g\×D','Gabon'),
('®\ÛJg¬KC¥µMŸ,”\0\Ç','Gambie'),
('¸#„\èN¶¹Ìvz¯\à','GÃ©orgie'),
('\Ç\ÜQ‚¼LXœ8U™®0«','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('rl\È\\Lú”q\í”kY¤','Ghana'),
('zr­©\òmHù´‘˜½.\õ}b','Gibraltar'),
('p«’\÷\ÑCJ«ˆ\Z\æ\Ê\ïA\÷','GrÃ¨ce'),
('¯­K+\ÙHH§\ÛU\Â=µ@1','Grenade'),
('¿x-“	CÉ‚\Üû¾Œmg','Groenland'),
('|\ÊÎ\ÏO³“™Gˆ\àt:','Guadeloupe'),
('a´\ÜWtD$‚E‡¬\Ée–','Guam'),
('%)¯\ô\ÚM’–]k\í%»zt','Guatemala'),
('\õ[\"ÉI)°‚ƒ\î.ˆ\\b','GuinÃ©e'),
('\È\ğ\Z\ê5O¡Ni¶Q—1','GuinÃ©e Ã‰quatoriale'),
('Œ.w\Ú\"}G\éŸ\İŠ\âp','GuinÃ©e-Bissau'),
('\ó¼S1+C•\r\ä3|0\'u','Guyana'),
('ø\Æ2:F\n‹Q€<W°û','Guyane FranÃ§aise'),
('\ô\Ïc{\"\ÃFM—²\ğ™\ñ\İ&j','HaÃ¯ti'),
('vWWbm‰F\ö‘‘i\n²ûŒ','Honduras'),
('BsDM,©Á z®2','Hong-Kong'),
('|\ô\è#\ÉA –\"¡ÿ\Üt­','Hongrie'),
('š\ähxœKÉ£Y‹\ÂÉ\Ëş','Ãle Bouvet'),
('›rN‡=KY‰5\Ù\á\äœ6','Ãle Christmas'),
('a¤\î»2FU@5†xr','Ãle de Man'),
('p\ö\ö’\Õ,F™¬\n€Á\ì‰2h','Ãle Norfolk'),
('Á”\ã(0F ¢ic£¿»\è','Ãles (malvinas) Falkland'),
('C1‚jB\ó±‡\Ú>€„\Ç\Ü','Ãles Ã…land'),
('\êA\î\æNœ•ƒˆ¹t}<','Ãles CaÃ¯manes'),
('`M\'\ÄBOŠRùi\Ü\â\Ë','Ãles Cocos (Keeling)'),
('\Ç`ZMŠŒ­b	\n\ñ)²','Ãles Cook'),
('aÿ¼şU)MÚ°¾\ôÜ»H5H','Ãles FÃ©roÃ©'),
('^_\Å\ëLOŒV\ã·\Ù\Ü','Ãles Heard et Mcdonald'),
('\ğ&&j\Ì\óA°º\Çn£²j\Èf','Ãles Mariannes du Nord'),
('\Ù\Ü\ö.inDH‡\É·%‘:K','Ãles Marshall'),
('|\É])\öNs C\'}U,n»','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
(' ­+\×PFP‘ly0l\õ\Ş7','Ãles Salomon'),
('F{{¶…‡FÔ´}}¿À…Z2','Ãles Turks et CaÃ¯ques'),
('£\É}0-L\è·K–\\@½Z\Z','Ãles Vierges Britanniques'),
('\Ü]\ö–\ÃD ¶\n6¹B!#\Î','Ãles Vierges des Ã‰tats-Unis'),
('\Î\ôª’B¨ªÁ0qT\Ò`','Inde'),
('’\Âş¬3«LM\Ãy9\r-1ş','IndonÃ©sie'),
('\Ê\ô\èF*­ª\'\İ<\ñ\Ò','Iraq'),
('\ç\ß*)\ãO´\â¤\ß\ìs','Irlande'),
('š|‚§F›µ>¥eU8¿\ì','Islande'),
('\İa)FM3’\"¹–]µ09','IsraÃ«l'),
('\í+vdJ\õ¸‰\é\êT´—z','Italie'),
('œ1€4Ÿ¦Iü”~!sµ’Ö¯','Jamahiriya Arabe Libyenne'),
('ıNu°G	¦>c¨\Ü\Ù','JamaÃ¯que'),
('0Ÿ\ìû^@\â´0j™{\ÉC	','Japon'),
('Ÿ},m‰ˆDk­\Ğ.4´P','Jordanie'),
('\ÃN\ÛXOEOÅ¡}k\é+b[','Kazakhstan'),
('\ÈD¹\Ì\îL«°}E;r¶;','Kenya'),
('n6>xD¹•û\r UB>','Kirghizistan'),
('È¢‹ø\ÊpK­_&]¸˜\İ','Kiribati'),
('O™ı!\nHÎ¿~+–cÈ§','KoweÃ¯t'),
('	K1o\ÚM\\¼º)y~\nq','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('B°\Ò\ë¨J{«.\Ñ\Ö\ñºi','Lesotho'),
('³\ÆeE*OÑ¼1\î\Ó\ÜL','Lettonie'),
('À^·x>Ij¦‹Ù›qT¼','Liban'),
('Àsšš~C‰µù\ç6%Ş¼','LibÃ©ria'),
('~‹OrcFú‘itb8R=n','Liechtenstein'),
('U$‘UAB¦\ß%\ô\Ğ\Çd','Lituanie'),
('m\å™K\á\ÔI·)mPf\ê_X','Luxembourg'),
('—œM£tVGÇ\ä\rc\ê\ÌZy','Macao'),
('Ã¼\ÆCİ„\\faŠ\É','Madagascar'),
('ƒ€?GvII\é­ÿG\Íy@\Ğ','Malaisie'),
('M`^¬¿bHÇ«ˆ€ª—\Ğ\Ç','Malawi'),
('Cfm\òq3I¼µt@¢1','Maldives'),
('Á[\î\Ó\æF‘¤C¢“','Mali'),
('qC=D\ÜOmƒ6•z\Î\ÒQ™','Malte'),
('c\ÏSE¥\İV­<p\0','Maroc'),
('\ÈOÕ‹\é4K]˜?{Í <Ã¯','Martinique'),
(')hµG’¹AÓ°7f\Âc\ë7','Maurice'),
('EBn„@m—kEHL\Î','Mauritanie'),
('…¯5@\ãGŠš•\çH£}kO','Mayotte'),
('^/\é`-N¾“\æW±ÿ_|','Mexique'),
('¯k\á~û¶J‡jQ%ÁÁ','Monaco'),
('\'&£3\îFLŸ¸b§ı22ª','Mongolie'),
('O¸¢y¶Ev®Qú„¬j¡','Montserrat'),
('—n\Ãç™‹B`‘Ÿ\Ã(\ÖeKÁ','Mozambique'),
('²^Cø¥\ØHS‰Õ€xI\Ú\àN','Myanmar'),
('\ğ\ï\àWKµMz\ôİ¦\Ó\÷','Namibie'),
('ûw³\óZAÊ¡0\'\ÖPf\Ği','Nauru'),
('ƒŠ\Æ\ğ\ØN.œ\ÍH\ó™¡\Ó','NÃ©pal'),
('\õ’‰b A3€x‰\Ú*ü+”','Nicaragua'),
('0cş\"\É\ÇJ„›ŸØ¢\';\Ü\ô','Niger'),
('X\òû %úHÆ¶Gb[\Ô','NigÃ©ria'),
('@N4xkIQ´\ç©ip\Ü%\ñ','NiuÃ©'),
('5\Ë*ŒƒDIš\0,™!','NorvÃ¨ge'),
('\×©S Hı–)a*m­\Ì','Nouvelle-CalÃ©donie'),
('¼)¤\ã\òFI¼?°‚•‰û','Nouvelle-ZÃ©lande'),
('\ñÁ{ûBøLs›xQÀ‹Ø\Ï','Oman'),
('DLü™KO‰\Úùˆ&,\Ğ9','Ouganda'),
('Ù™7\ñ8G8©<»§v«–','OuzbÃ©kistan'),
('«G\ËÕ¢*O­\îª\Æ4G¦\Æ','Pakistan'),
('øNÿ×¼FL{»ø,±\íyŒ\á','Palaos'),
('Èƒ¹ˆNNHŸ»‚\É4ÒŒ\Z7','Panama'),
('‘»\Å39@d³v\ö œ`','Papouasie-Nouvelle-GuinÃ©e'),
('Ş®V–ù\İHÛŒ†\Úä° j','Paraguay'),
('>]P*;LÙªj5o\Ó\âT','Pays-Bas'),
('W‡,\ÍùI\ï§,Ag\Ò\è˜','PÃ©rou'),
('\á´[ì™MMª…£^T\ã\è','Philippines'),
('™%fzSlNt‚Õ¾CÑ™’','Pitcairn'),
('š\×4³d–N:Š\àü\ÌZ','Pologne'),
('‰şÁR,™@¢L\Ï\Ş\é5€X','PolynÃ©sie FranÃ§aise'),
(')jø5d~Je¨\óA\÷¯q','Porto Rico'),
('Øµÿ‰N\÷\à¬\Ğnf','Portugal'),
('\ŞM\Ø\è\ÑKS¢ş\İ\ö[7«','Qatar'),
('»)¡\ÒE\ÍOŸ·½I³\Î\éF=','RÃ©publique Arabe Syrienne'),
(';\Ò\Ã}¼´Dá®„¶\Ú\ô°H','RÃ©publique Centrafricaine'),
('‡˜\Ú<A*¯Q\Ü\íÕœ\ì','RÃ©publique de CorÃ©e'),
('y •\ÜNƒ¬„\\<…ÀØ¤','RÃ©publique de Moldova'),
('‚e\à\ÙC1º˜–# Pv\î','RÃ©publique DÃ©mocratique du Congo'),
('e\Ñ*BrK)Š´\Ğ\èkL\Z','RÃ©publique DÃ©mocratique Populaire Lao'),
('\Âb—\r’D\n¡U#a¹Ÿˆ','RÃ©publique Dominicaine'),
('c¤\ë9yEó ™UŠ\ôß€','RÃ©publique du Congo'),
('-Á£\n1\ÉLd¬+PşÊ¼C','RÃ©publique Islamique d\'Iran'),
('!„\ôk{F2ª\ĞD?•sb','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('XÒŠˆÂ½F¡¥©›2(·Yû','RÃ©publique TchÃ¨que'),
('¦xOŠ\Ğ,D¿°\ğA\õ\Ü>','RÃ©publique-Unie de Tanzanie'),
('¿rTK3½Eo—²‚m¡F\Ã0','RÃ©union'),
('\÷\Ş2m\ÒyB¢ªµ\ÄH 	+','Roumanie'),
('\Ê[f;«\àHË´\É\nn\ætm','Royaume-Uni'),
('xŸ«‹ˆF¤ƒ\ãùù”','Rwanda'),
('|\Î7ÀB›„®™°’^','Sahara Occidental'),
('‰A{Nœ‡i\Û\Â+AZ9','Saint-Kitts-et-Nevis'),
('¤\â.ú\nHQ‘¹Ez•yHu','Saint-Marin'),
('y\ö&HcA—·Á\é^\0£gø','Saint-Pierre-et-Miquelon'),
('2\à\Ãp+\nH°€m¢^\Ë\î(','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('K»†Bª	N´\Êy’]„3\ã','Saint-Vincent-et-les Grenadines'),
(' \Üze\ĞOp·\n¸\Ï\âf','Sainte-HÃ©lÃ¨ne'),
('Õz™\á\ëE}ˆ\Ô\n\×1\Â\Ü','Sainte-Lucie'),
('\ô\ÖF\ÍÇ¸AÙœ¬§]\êKm}','Samoa'),
('~£\ó‘JJIDŒ\ĞOH\æc','Samoa AmÃ©ricaines'),
('Io¦Ÿ»\õA—B\ÏSQF\í','Sao TomÃ©-et-Principe'),
('\ï´%‘úDŒ¡\énD?R™','SÃ©nÃ©gal'),
('%eI\İebGMš¾WıÚµı\Ü','Serbie-et-MontÃ©nÃ©gro'),
('odc®\Z‘Md¬Öbšyc5','Seychelles'),
('®nªH2|LœŠ<K\Ï&9K','Sierra Leone'),
('\ğs«\ó9ŠJ‹`UÙ­\ç™','Singapour'),
('\ã©2CİšE1­2\Ô\È|','Slovaquie'),
('\Å\Ùù]ıC­£t\İ~~\÷.','SlovÃ©nie'),
('\ñL\\C’F`­ª\é\Ş\ã_\'·','Somalie'),
('a_\×\ñ6L\0£NA\×ü€±\\','Soudan'),
('ºÁ\ê\ÄC¹¦ \"pq`<­','Sri Lanka'),
('ø\Å$mc\öE\'»EA<š[','SuÃ¨de'),
('q,,¨\Ø0EX‡\Ã~¤¨k+','Suisse'),
('qNP\ïÔ’CYº\÷.\Â\Zª¯','Suriname'),
('\Ã5û\ÄOWƒ¨×ŠG5h\Ò','Svalbard etÃle Jan Mayen'),
('²ƒ4\ó#I\å¿W}\Å\Ûüj','Swaziland'),
('\ï\ô¢<uI\ô‘\Ú\Ìş©€\ï','Tadjikistan'),
('¶ˆbH\ô\ÖG\0‹¹\ä–V\Ş','TaÃ¯wan'),
('†Kûo\ÉE†µB{·\ì2;y','Tchad'),
('¾\õ\Ãn\ZıNş€:WªH{\òS','Terres Australes FranÃ§aises'),
('l\æ\ÏÔ¨hF”§\ğD\Å{D³','Territoire Britannique de l\'OcÃ©an Indien'),
('“b/\ò]IE¶¯’»\"úÂ™','Territoire Palestinien OccupÃ©'),
('(\É.u*\èEu\É\ô¡q\'L','ThaÃ¯lande'),
('\ßÓOAG¼\ô\ë\Ô~\Ğû','Timor-Leste'),
('â™†K\ÚCÎ³´a\×\Ã³^','Togo'),
('R\Ö~ŒGÄú†YP','Tokelau'),
('¶=%J\ğ\ÖL¬\Z¡\\ûNz\÷','Tonga'),
('™\ìCO>uB0²{D=1_','TrinitÃ©-et-Tobago'),
('•‚_b™L—¤Ğƒno`\Ä','Tunisie'),
('‹ëŒ³\÷4DU·,wx\×¼','TurkmÃ©nistan'),
(')Ö¶\\A{¤=p]•/','Turquie'),
('\\¹\Ç0~HY­	/Æ¹\Ø` ','Tuvalu'),
('™¤\ì\ÃO?—¨ª*\rM','Ukraine'),
('\åÎ•·@œCÏ€ƒ]P¼{','Uruguay'),
('S³D\ä›?\óu3¼¥\ä','Vanuatu'),
('¨}¨\è®LØª$\Ô\"\İç²™','Venezuela'),
(',%\rn[LÃ²‹®\ì\îÉ†¢','Viet Nam'),
('‰¼1¨\çK\ò­Ä‚\ò@¼','Wallis et Futuna'),
('\ì%Pş_K¸¯ş€@\Z\ä\ô`','YÃ©men'),
('\Üş•V\óAk•~\ò\İK\à','Zambie'),
('U\êf\ì©C{²—\Ã!\ç\04','Zimbabwe');
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
('DoctrineMigrations\\Version20240124155119','2024-02-03 14:23:23',8),
('DoctrineMigrations\\Version20240201152951','2024-02-03 14:23:23',3),
('DoctrineMigrations\\Version20240202084749','2024-02-03 14:23:23',3),
('DoctrineMigrations\\Version20240202150901','2024-02-03 14:23:23',3);
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

-- Dump completed on 2024-02-03 14:23:27
