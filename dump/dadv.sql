/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.10-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv
-- ------------------------------------------------------
-- Server version	10.11.10-MariaDB-ubu2204

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES
('\îMRe ^A¹•”c{^\ğ','Afghanistan'),
('u6\ó–\ÓGH´r\Ô\â£','Afrique du Sud'),
('q½\ä\ÃÁAªÀ\Ú\ŞI\Óÿ','Albanie'),
('\É6]eK¹NZ˜\Û\ñ\È\Î<','AlgÃ©rie'),
('\ç\Ø¾\ÈB ‡\âŠ|j§','Allemagne'),
('£\ô–\àIx¸Ğ‹k\\r¿½','Andorre'),
('t\ÏıîœGã‘…|ø€ \r','Angola'),
('\ÓX‰5ÆœF–¡*fú’—\ÇG','Anguilla'),
('™s8¤\íMŸ\ßAp+aR','Antarctique'),
('«¹R¸g#@y«w‹`ÿY\Ë\Ï','Antigua-et-Barbuda'),
('©Ü®\ÊÂ…F5£]\ì\n©=','Antilles NÃ©erlandaises'),
('\×\ÚlşRDªçµ²&rµO','Arabie Saoudite'),
('\æ=\è\äxL£‚xn¸>\Ì','Argentine'),
('Á\ê\Ù\öªGz»iWg„Ã»¯','ArmÃ©nie'),
('AzgùEMi…\ò¾\ìWppn','Aruba'),
('Œd@ú\ÖF §\Í\â¢\ßR[','Australie'),
('¯ƒ\ã\äXk@h±%\Í\òúŒ“\É','Autriche'),
(')ı\Ñf\rJH\áŸ\Ú+bv','AzerbaÃ¯djan'),
('9;GşCK²¡¹Š\È\Ó\ß(û','Bahamas'),
('\Zše˜\ç\éH0¹)V«œ	¨','BahreÃ¯n'),
('\'	š\ô\ãK¢™0%V2Sj','Bangladesh'),
('\Æ¦g“N•˜\ï\îT\İ\Ş\÷','Barbade'),
(')Ct˜5bNW‚u!\ô³\çb','BÃ©larus'),
('1M\Ïu\ë\èDÚ«x>\Ì ²','Belgique'),
('\0‘®®[DW‰\ôaÜ‡\èLm','Belize'),
('T†n\ËEHª\ÙÕ•\Ø\ó¦Y','BÃ©nin'),
('\ö€F;…I‹„1@\Í~…e','Bermudes'),
('Ö¡\à›KB±‹u]lu\ï','Bhoutan'),
('\Úš\ç‘I“§@\'c\÷¬¥','Bolivie'),
('­Ik•\áNÕ³Õ·^9C>\ñ','Bosnie-HerzÃ©govine'),
('¢›\Ü\"¹FÏ£;„š?`\Ä','Botswana'),
('\Î\á92N-B¤”V\ö 0£]','BrÃ©sil'),
('xj¿¯1yL\ö²¹¯º¼\Î','BrunÃ©i Darussalam'),
('\ã\ë\ÜÀ\÷\ÚDù¡V\ÏÌ—','Bulgarie'),
('\Ñ4Õš>Aİ 52?ª(c','Burkina Faso'),
('D.P¼M×”V\r\\³Î·/','Burundi'),
('.`ZAHZ‰š­*-9Ê¬','Cambodge'),
(' j\ïh3­D©\è=À;—¸','Cameroun'),
('¢\İ_\ÉN©Àgú\Ô\0„/','Canada'),
('\"X‘\ÈmB¼¬1t\ØE°4(','Cap-vert'),
('}:\ô\ãMŒ©#]¢»Í³','Chili'),
('’glN&KİªK¸Ë¯`>¢','Chine'),
('\ä¦\Ò\×øG2…\Ô\ô™:”E','Chypre'),
('É£†@ŒF<’¬¸\öWg\Åd','Colombie'),
('BU²ÀM\ò²,ˆu\Î<&','Comores'),
(')½\\F¨½vú;«Kj','Costa Rica'),
('bW\Î\â\ìAx—\ñg\ĞÀ&\ë\á','CÃ´te d\'Ivoire'),
('P\r°\ğk\ôJH¼C#/Œkxø','Croatie'),
('¤¦ÿH;yDM©0','Cuba'),
('(\Ø\ÛDK@¼³\éRm»\ä','Danemark'),
('.úRj}³O¶—kn$¹t\Ì\ö','Djibouti'),
('K/\0qG-–\è¯;qlJ','Dominique'),
('\n¿ªi\Ğ`J\ğ¤\í\Éy*Ä…','Ã‰gypte'),
(',\Ìò‘‹˜KO $d\õ\èiU','El Salvador'),
(',1TP\rG\0•0[‹.!W','Ã‰mirats Arabes Unis'),
('6+\ïB7±ş¢\Å\ÄT','Ã‰quateur'),
('\å\Ñl\ÔK\\²™úy\ë‚\Ç\à','Ã‰rythrÃ©e'),
('\Å\ä><6\Ö@G‡I„şÓˆ*','Espagne'),
('Ü•´²jN_DD\Õ;Çª\Ş','Estonie'),
('A`C\ò€@D7´Sq¦j\áA\í','Ã‰tats FÃ©dÃ©rÃ©s de MicronÃ©sie'),
('~\åÉ¼\ë¾F¢¬²1Ç¬\'^','Ã‰tats-Unis'),
('-(°;­I?–9û…\'h¿ˆ','Ã‰thiopie'),
('a!w’DÓ…\ğc“\ê.Z','FÃ©dÃ©ration de Russie'),
('•\óI4cNÊ¬—7„¼Hƒq','Fidji'),
('ubZ“&¶H•±ş#d_ûD','Finlande'),
('Œ\ÔyooL*‹\ßÿ>D\'','France'),
('\ô\ÌÀ	B8F( [¯ú\Üj&','Gabon'),
('\Å\ë-ıy\ÊJ$°+o^9P\ä','Gambie'),
('£ü\ÊE™·‹\Ür\Ôû.','GÃ©orgie'),
('47&xŒIŸ\Æ	š\å~','GÃ©orgie du Sud et les Ãles Sandwich du Sud'),
('!U\ŞFW‹I†\æ›\Óû','Ghana'),
('i¹`‡3Bš•´q”9\0\Í','Gibraltar'),
('·\ÎE‘Oç…\Æ\Öo\íÃ¤','GrÃ¨ce'),
('µ\öC²E@£©2WUº\ä<','Grenade'),
('½8Ÿr›\ßFGŒ¹‚—\ét|¡','Groenland'),
('R\ÎÁNE€Š\Ä$;9?t','Guadeloupe'),
('»°>\ğ\÷\ÅLÔ±¹–P=\\','Guam'),
('t;ŠG@J–\ÎN\Óµ','Guatemala'),
('\ÈKz2{‚M„\ç\ä–\Å~7','GuinÃ©e'),
('\n\î]Ó¬X@ÿ‹Ò†%š\ó\Ì','GuinÃ©e Ã‰quatoriale'),
('ÿºO\éF[¡*…\0\çM\â\Ï','GuinÃ©e-Bissau'),
('İ”\é;\0ºD?±\nH„\ì,','Guyana'),
(',!$Kˆo†Iv´\Ê','Guyane FranÃ§aise'),
('\õ¢Š€\ß{G/a.ØŠ9','HaÃ¯ti'),
('=k\ÎUBĞ¹=Gºtl\Ë','Honduras'),
('ML‹\êIC¡™Ñ·a\Ì	a','Hong-Kong'),
('\è?\ZÀMEæˆ³§\×\ô$¶\Ù','Hongrie'),
('\ZJ2*+D&—iK^°\èù','Ãle Bouvet'),
('\çi\ô\'O\àA°«r–³®\åD','Ãle Christmas'),
('X9\\Å‡O›ŠQ}\Û–C','Ãle de Man'),
('#@n(\à|E°¤\Ë´·\n\Ï','Ãle Norfolk'),
('…0\áÀ\ãJŒ{b\òCŒy\é','Ãles (malvinas) Falkland'),
('†\\|\ç¸şI‚¨\Z>\ØEy\ê','Ãles Ã…land'),
('\\	«\í·@:§\é\Ø\Ö$\Ò\İ','Ãles CaÃ¯manes'),
('\Ë\Ót¸“Kg€ÁaŒt\Ùf','Ãles Cocos (Keeling)'),
('¬Ig\òºšEt´\\J1%µ†Œ','Ãles Cook'),
('vZcÔŒJ‡§\â*Ñ²Æ','Ãles FÃ©roÃ©'),
('°\×\ôL\Ô	DO€\ïl','Ãles Heard et Mcdonald'),
('wøË©\Ğ\ĞDl…q3é€‡\Ú','Ãles Mariannes du Nord'),
('ºW\Zß•@~Šßƒ\İ\"\Ñ]','Ãles Marshall'),
('.\æ\Ù\í&B\õ”6.…¯Kÿ«','Ãles Mineures Ã‰loignÃ©es des Ã‰tats-Unis'),
('\Öb\Î=¤\ÕJ¼‰JjG ¶•','Ãles Salomon'),
('\áwL\ã–IR˜KU|9‡','Ãles Turks et CaÃ¯ques'),
('xÁˆX¥`O‡­jÁ—Œ¿w','Ãles Vierges Britanniques'),
('«\ëX\Âo>Gî—–\Õ;¾\Ä\Ò','Ãles Vierges des Ã‰tats-Unis'),
('(R\÷@œ¤\Z\0\Å1—\ã','Inde'),
('œµıx\ÚGJ¶²\î\öG”¾\÷','IndonÃ©sie'),
('…`‰ù{}Bv¼…¤LŸû\æ\Û','Iraq'),
('›¯iªüOÒ¤	üG\î-B','Irlande'),
('H1—\ËNO¡—\È)\ìÿp\ô','Islande'),
('\á“\ÄÆ‡L=·9>…T„OÁ','IsraÃ«l'),
('€fXQ€I€”E\ô\ä~³m\Ì','Italie'),
('~P\ÑúxLJ°Á\n\írº ','Jamahiriya Arabe Libyenne'),
('\Ù\ì¾+Ì¿F}™B\â‚K\Æ>\\','JamaÃ¯que'),
('O9ˆ\àK¼\êBıÈ´\âH','Japon'),
('Z2\ÓCp/A½‘\ğ\ê£Y; ','Jordanie'),
('”úlY\0\ÑGŸ˜\İÑ¤†\ë','Kazakhstan'),
('‹O\Ús\r—DÄ‡Io7±\Íø','Kenya'),
('\Ì¨Š\ÏDÿ\îQ\'–¥[','Kirghizistan'),
('u ¦\ÇO®º\ä\ô¬8','Kiribati'),
('\ñ]\Ê\ñ/L{§\Ä ¦y\Í\Ü','KoweÃ¯t'),
('w\Ì^Z\àDª³“¤R1\í6B','L\'ex-RÃ©publique Yougoslave de MacÃ©doine'),
('…ª\Ü\ÄL×ˆ0\óY¼\ä´\Ù','Lesotho'),
('\ïs7µË»BŠ·ƒÏº','Lettonie'),
('‰\Ûb\0\ÏH¸ˆOB*ø0','Liban'),
('\"º†Q¿\ØKv«£~€\Óg¾R','LibÃ©ria'),
('À\Ê\\¿œOEØHW\ê)\â','Liechtenstein'),
('‡*8\ğZ–NiªIB›•m€','Lituanie'),
('f\ó‘§eXGˆ¡ª·U¢','Luxembourg'),
('´Q%R\ÓlM‰…IPZ=S~','Macao'),
('%<C›’b`e*6','Madagascar'),
('Ò¶q\Ù\0CŸ’Lk¡\Ìz','Malaisie'),
('\õ\Ñ\Íg®\îMŒ‡½\×cù','Malawi'),
('‰\äa¥—Mù·\ç9®¶¥\Ó','Maldives'),
('!P~B\'²¸W»\ö\ó»—','Mali'),
('Ì°.\nH4»«À\íj¥\ä\è','Malte'),
('¥\r\ôIzI‹»©¯\Òe\ÌX','Maroc'),
('&\ó‰\r`J’«Ø™+\Üg\Ş','Martinique'),
('S\Ìk³NO,wË™\áˆ','Maurice'),
('f–ukhWI¦ƒTDq$ˆ,x','Mauritanie'),
('C­\Üc\ÊıJû‹µp¸2\â¬\í','Mayotte'),
('ûA4\é1O±†\ŞA”©u\Ê','Mexique'),
('Ú›\0”‰DÔ‘r\Â\Ó\îd­ˆ','Monaco'),
('\ß×„y \ÔJZ»+*R*{D','Mongolie'),
('Eò’†\ÅE•¦_.Ş¸\Ã3\Æ','Montserrat'),
('‚<Z!@¹„\Èãš£\è[','Mozambique'),
('^\ñşcQ:@¯\õ\öw°u^C','Myanmar'),
('K<°\Õ_\çAœ»w¬_1\÷U','Namibie'),
('¹d@‘}Ad\àN\Ü','Nauru'),
('Š\Ñ\Î\ïuMN²Ú§;\ë«Z','NÃ©pal'),
('Ï\'}CHL½io-\Õ','Nicaragua'),
('¦‚\Ò\Z|:K\n¹u„B\Î\Ã\×','Niger'),
('…:˜\à~aO\è’V}G¶¾)','NigÃ©ria'),
('=.c\r©¾C^¾\år—e\Î2-','NiuÃ©'),
('\'M%\Å4\êBz¸\Ùwbƒe¡U','NorvÃ¨ge'),
(' { tC&¦€\ì?:†sz','Nouvelle-CalÃ©donie'),
('Iº\×|NQ­B”¡œ6m’','Nouvelle-ZÃ©lande'),
(')Q(\÷­\ÒH4†‰©c–Z','Oman'),
('(e\É\Ò2@4¥ …Í¹S','Ouganda'),
('Ÿ\êú\ç\ÇO½–£\Âs‰b','OuzbÃ©kistan'),
('n[5†\êI\ñ¥\Ê\"S\ä¬l','Pakistan'),
('\\\ÓÇ¦(¶Oa¯ÿ\é‘Á3Ÿc','Palaos'),
('Q\îaoH\ÓCt¥Œ18›\×E','Panama'),
('w2©¹\éµLS ~¸\ì—o','Papouasie-Nouvelle-GuinÃ©e'),
('\ÅOÁ\ò\ğD:‹zªÇ‹\Æ\Ä','Paraguay'),
('£\Í!ı½)M™†k¢\Z¢X','Pays-Bas'),
('¦n\Å0AÃ»ssùH\ç','PÃ©rou'),
('ş~\'¼\îE­,s\Õ\ìrN','Philippines'),
('´\àOqR»DÉ‡²–W%\Ş+d','Pitcairn'),
(' \\d$,DG¿Â·‰\÷\ì±','Pologne'),
('Ú€ÿ\ñH]Šh$	b¥0','PolynÃ©sie FranÃ§aise'),
('^…)5\ÎLĞ¤‹¢\åQ;¯\ó','Porto Rico'),
('‰\á,\Ñ\àCNŸ§\Ì­Û±\0','Portugal'),
('n	\ô\ötgJ|±zb¡\Õ\Ûü­','Qatar'),
('>=€0m\İF³…\÷\Zˆ','RÃ©publique Arabe Syrienne'),
('\ÖÓƒ•NJO‡¸st`]','RÃ©publique Centrafricaine'),
('\r ³=\äªG	Ši\ì\Úl z','RÃ©publique de CorÃ©e'),
('¬$|b?„JB\Æh?yU¨','RÃ©publique de Moldova'),
('\ÓRT¸^DQ¿i\Â \å\Ñ\é','RÃ©publique DÃ©mocratique du Congo'),
('\çÕ£ü\Ô\ìCn‰TEBw Ú','RÃ©publique DÃ©mocratique Populaire Lao'),
('N%Nü\ÈL\â™\ô=ÀH>¸¡','RÃ©publique Dominicaine'),
('CO\í&0¢K)¯¦\îy\Å*\\','RÃ©publique du Congo'),
('³\0\ê•K@\÷¸ø¸s3\Ò]\à','RÃ©publique Islamique d\'Iran'),
('½…è–º\õC°\ïŸcı6=','RÃ©publique Populaire DÃ©mocratique de CorÃ©e'),
('‚`wJ\ö¦„=-k¶nw','RÃ©publique TchÃ¨que'),
('„`Ş¯‰@w¬\â\ğŸ[_R','RÃ©publique-Unie de Tanzanie'),
('˜Nü( 7Oš¸eT\nO¯7ü','RÃ©union'),
('º\ñ\Î?=\ÌD¨\nt³E1~','Roumanie'),
('§ŠŞ¿\ì¯@O”‹V\Î\ä@¶\Ş','Royaume-Uni'),
('m8¹‚HX”µu–!\"ø','Rwanda'),
(';[™¾••HJ†¬Q\ê\Ò','Sahara Occidental'),
('\Î\r¹²\ÌF^¦Æº\Û5°Ú','Saint-Kitts-et-Nevis'),
('\ñ\à…\í\ßN=¸GR…?\å¥i','Saint-Marin'),
('G\ÊØ¸¶¹Hštr\Ü3','Saint-Pierre-et-Miquelon'),
('…@œy7N\í¼	»d³M†','Saint-SiÃ¨ge (Ã©tat de la CitÃ© du Vatican)'),
('%y°­g*J›”/6R û$','Saint-Vincent-et-les Grenadines'),
('\n\\û°\ÄG\ï›\nb’LúE','Sainte-HÃ©lÃ¨ne'),
('Ü¥|ûJA¯z\ìOš.%À','Sainte-Lucie'),
('l¦¹\\USNŒ›:£¥`8Œ','Samoa'),
('½\ó09“úF—ªt‚j\r','Samoa AmÃ©ricaines'),
('\021\Í\ğABÃ­¯#\ïı«=','Sao TomÃ©-et-Principe'),
('\÷r£nKP“¿TÁ³\á³','SÃ©nÃ©gal'),
('\ål0\rB\ï\\³»z“','Serbie-et-MontÃ©nÃ©gro'),
('A¼#’@œ”`Ch','Seychelles'),
('dB\'\Å2Fû¤:³E>ø','Sierra Leone'),
('©eMPQDq«’5w³¼\Zi','Singapour'),
('mX]µ\ğ@`¶\ÚOÇ“uÅ‚','Slovaquie'),
('p\å\ÍiD­aµ\İfL','SlovÃ©nie'),
('oSº]H‚¢ ’o\ÊÍ½;','Somalie'),
('\Ä\'\ó½—Aş¤üØ¶°\Ü','Soudan'),
('”\ëTâˆ°AÆ¥a«MºI','Sri Lanka'),
('„XZ<?Ly³yf§|','SuÃ¨de'),
('X\ğ	\õ¤oEØ†Ó“K\ã','Suisse'),
('b|5Áø\áK¦µ\æGp|#>','Suriname'),
('\ÚE°…ˆGp€„ˆÁ0\ÆJ%','Svalbard etÃle Jan Mayen'),
('O¥\Ş‹Cı„/p?\ê\â(«','Swaziland'),
('§”g¨\ÖI\÷†cQ¨K,','Tadjikistan'),
('¥v\õ\çZ\âG»‹\Â#²U\0','TaÃ¯wan'),
('K¡…³p\İAÚœ7·.Ì¾/','Tchad'),
('0_²±rB\ïµ@\\\Å\Í`-‡','Terres Australes FranÃ§aises'),
('M\îÜ±•K\÷ª	¹û¹±¤§','Territoire Britannique de l\'OcÃ©an Indien'),
('†µÛ£´˜H;\Â$¤#\ëŒW','Territoire Palestinien OccupÃ©'),
('\ç¾|j \çBš«İŒ¥D\ÛW1','ThaÃ¯lande'),
(':O§‹ıJ½ºp“ü\ì:','Timor-Leste'),
('®\ÄK¾\ôL…ª{Í¸„n}^','Togo'),
('_¡m,[F˜¥{À\ä‚ü¨','Tokelau'),
('~‰>G¿O½ÎŸ\Ò]¢#\Ä','Tonga'),
('N\î8ş¡\ìO‰E°\Şú—','TrinitÃ©-et-Tobago'),
('hÔŸ¸V@”|T&sû\'','Tunisie'),
('3Z\Ô-	¢HÇ€2\ã\÷j\ñ\ìƒ','TurkmÃ©nistan'),
('\ï\óc\ó½M@Å»ªºÖ¨n','Turquie'),
('(V]şuDl’Û™\Ühc','Tuvalu'),
('8!¬ù4\èL_¡<\ß\õuJƒ','Ukraine'),
('¿\\£m—\áEN´ú›\Ñp`@','Uruguay'),
('–µ¬‹J…#\Ê`:','Vanuatu'),
('h°È¤~N¦—&[Qz;\ó*','Venezuela'),
('»\ç[#OkE¯½1\ó\n\Îü}','Viet Nam'),
('\"™8‡yGp\ëv\Ì=#\Í','Wallis et Futuna'),
('µ\÷UBBï‹•‹¼ş\Å@h','YÃ©men'),
('^ \ÂC\ëCZœ~\Ï2Ä›F','Zambie'),
('\îCib\ï¡L¼€ÈƒT±.Í†','Zimbabwe');
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
('DoctrineMigrations\\Version20241217142038','2024-12-17 14:21:00',7);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitation` (
  `id` binary(16) NOT NULL,
  `target` varchar(255) NOT NULL,
  `link` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tasting_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F11D61A25BC0FE1E` (`tasting_id`),
  CONSTRAINT `FK_F11D61A25BC0FE1E` FOREIGN KEY (`tasting_id`) REFERENCES `tasting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
INSERT INTO `invitation` VALUES
('«\í/iš®M’©\íú|˜Vt','root@gmail.com','https://apps.apple.com/app/6468406309','pending','2024-12-17 14:21:00',NULL,NULL,'.¥l5‹¹LnšI½y\Å\ñ7');
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasting`
--

DROP TABLE IF EXISTS `tasting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasting` (
  `id` binary(16) NOT NULL,
  `bottle_name` varchar(255) NOT NULL,
  `participants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`participants`)),
  `owner_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasting`
--

LOCK TABLES `tasting` WRITE;
/*!40000 ALTER TABLE `tasting` DISABLE KEYS */;
INSERT INTO `tasting` VALUES
('.¥l5‹¹LnšI½y\Å\ñ7','Domaine Leflaive Montrachet Grand Cru 2016','[\"hugues.gobet@gmail.com\"]','hugues.gobet@gmail.com'),
('–J<¸_½Fx¥\Í\ãqÀ§\"','ChÃ¢teau Latour 2010','[\"hugues.gobet@gmail.com\"]','hugues.gobet@gmail.com');
/*!40000 ALTER TABLE `tasting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-17 14:21:01
