/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.10-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dadv_test
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
-- Current Database: `dadv_test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dadv_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `dadv_test`;

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
('pÜ7\rC¶Uò•cTî','Afghanistan'),
('Ön\«	Nªú∫P¯\r\»','Afrique du Sud'),
('\ÂU6n\–YG2≤]\Ò_§\\Ã','Albanie'),
('T\›†jK∂©Lú\\Ê<¸˘','Alg√©rie'),
('†æ¶\ÚtFåö`(m\⁄k%','Allemagne'),
('ˇ\"ì\ÁöI{°ª €ë®o','Andorre'),
('∑\Ô\ZyX,GÖ¨πñ\ˆÇ|\»','Angola'),
('\ˆ“∂©Eﬁá€•\Œ“É˝','Anguilla'),
('f\”\ÏéF	∞ü˚¨∑\Ï\Œ','Antarctique'),
('U5–¥\—\ﬁAYäz˝˘˝\Ó','Antigua-et-Barbuda'),
('pò3ä5C<ß+µÅ1à\Û','Antilles N√©erlandaises'),
('\–2ø)&ÑL\Îózx\ƒ8®îç','Arabie Saoudite'),
('\"≠4ÉLØµsg[–¨','Argentine'),
('äØ#Nø§\ÿuãµ|ó','Arm√©nie'),
('~\rÄ;XJy°ä@\÷96','Aruba'),
('\ \’jIpíæ>˘ZpC','Australie'),
('™¥W\Ê|ãK´è*±¥\ƒ¯','Autriche'),
('D\œ\Â@†§I3∑\‰FÑxï\·\Ë','Azerba√Ødjan'),
('“©ö\ÍPB\‰≠FN,\ÕÕâ\»','Bahamas'),
('(º[¸ZCAâ]ó\ËD˚','Bahre√Øn'),
('û\Õ\'zïÄH\ÙÖçjcä0:','Bangladesh'),
(' Ω‘Ü^\ÃGXª\0\»ÎÖ∑\Ô.','Barbade'),
('G3X\Á\'I÷ó¥\À\¥L¿','B√©larus'),
('Cø\'ômNÿª•\’¡ Œí','Belgique'),
('ä50\”|ESπ<Ç	º9\÷9','Belize'),
('8}æ•Ja∑\Ì\—7!Äõ\Ã','B√©nin'),
('\≈{|\”mB]†{7iDA∏Q','Bermudes'),
('\Â®˝NN§HîµŸûÀ´\r%','Bhoutan'),
('¢z“¢NéHπ∑∂då\ƒ[\Í¨','Bolivie'),
('BîX\ÊûJΩΩ\Ë%á|z~','Bosnie-Herz√©govine'),
('\‡\"∏∂zO\Û•\ÿ‚≥º&','Botswana'),
('4^É°Ü∑EËñÅ.%<í¿','Br√©sil'),
('>\Ÿ\ÀG\Ê®HØãR\⁄_;+','Brun√©i Darussalam'),
('P?r˝YKéÅ\‘\\Ñ(Rî\È','Bulgarie'),
('>\ÈkfÕâM∂¢{Ωvù¨','Burkina Faso'),
('8K¨Ä\ÀhLîé\‹V\“[v\‹˛','Burundi'),
(')±€≠R:F∂\›l\€=U','Cambodge'),
('z+	ºbO’°Rπê[wì\ÿ','Cameroun'),
('§\»<\r‹§@Xé_§m\n,Ez','Canada'),
('OM	éo~O∞∞Hú3≥\“\ƒ\Õ','Cap-vert'),
('ø,.UrΩOéègp¿R\ÊJy','Chili'),
('Xy3ä\Ï¸CﬁßöL\ˆ\"ÄV','Chine'),
('\Ùo\Õ`¢mO,òØ¡%\nl','Chypre'),
('k©w9PHÖû\”\Êª9ÖVm','Colombie'),
('\Œt]º—úO\‰õ{U\Á\–ﬁë','Comores'),
('yãWàKò∫X+\r\∆\','Costa Rica'),
('ª ûãEáDm¢Ä\Ë68\€/O','C√¥te d\'Ivoire'),
('\Òå3\Ò\·FEπ¶R®\∆\Î','Croatie'),
('Z\„\”ZûAúû\Á\Ãgm5¢','Cuba'),
('\Ï\—7¯§°N\r•e\‘y£`','Danemark'),
('à\Ô¥n%GA1û\"ô\ƒ]\˜˙\◊','Djibouti'),
('hxÇV`ëB6∞X?\ŸQ\Zø∑','Dominique'),
('\◊C»®\ÓMw¥j®\»m}','√âgypte'),
('\Ã\÷Kxª\ÎDSõ∞¯R¸m','El Salvador'),
('\n\n\Î\⁄:D}ú/>\√\‡\ıü','√âmirats Arabes Unis'),
('G˚\"ö!\@°;\‚l<ÅC','√âquateur'),
('àFô\¬=¨G5óÜ\–+åYj¢','√ârythr√©e'),
('UD\“\ˆq¿KëÑí˝°©7\œ','Espagne'),
('WTà$\Ÿ\’D∏ú\√˙\ \‹\Ãm','Estonie'),
('L ò\Ù,D≤´M3\‹C5','√âtats F√©d√©r√©s de Micron√©sie'),
('àÆ	\À.H\'¶xˇBºù\—','√âtats-Unis'),
('˙\Ô\ıg*Gˇ™\ƒS[˝\ˆ?*','√âthiopie'),
('~µ\Ë;\È\nO£|π\ﬁà','F√©d√©ration de Russie'),
('\Ì`\ﬂ_ìIû∏zî\·?m1','Fidji'),
('#\ı£Ne≠@Ü¨.\˜ Ω¡','Finlande'),
('\Z\Ô\Ò`*J÷º\¬Dßò2ÕΩ','France'),
('1\–#\ZOzÄ\‰©óé\Zµ','Gabon'),
('D@r¶hJΩó_ãù›ªQ?','Gambie'),
('_¸ª\ƒ	Jï∞‹ü\Ïj','G√©orgie'),
('^Tﬁø@\¬O€ÄtŒèôokw','G√©orgie du Sud et les √éles Sandwich du Sud'),
('\√=x0ˇAFaßX\À\»9\Ë','Ghana'),
('\‘aé®\Ê|N\±%|Jdú:\Z','Gibraltar'),
('\’⁄éKF\ﬂJM¨m\»,û™/a','Gr√®ce'),
('\Ï\ÎMD\·∫\“gY€ï','Grenade'),
('FiØß\ÒIm§îE|;','Groenland'),
('™u¶ì?QNÿöqõÊï§f≤','Guadeloupe'),
('§\«B\€\ŸL{£øµo£','Guam'),
('ˇù\‡Pu\ÚIv≠zÆ\Ôy\ıB\Õ','Guatemala'),
('\Ër\ÍHJù:U\»iL','Guin√©e'),
('\Ù\à≠	.O\Â¥\Û¿™/∂','Guin√©e √âquatoriale'),
('™\˜\Ò[˚:BóïÄ\Ù\ƒ\’\Ë','Guin√©e-Bissau'),
('\‚Fîì°öH+Ç@\Â?CΩO','Guyana'),
('k\Ûf\”\ﬁ\ÍDnª≠/J\“#Öz','Guyane Fran√ßaise'),
('ôT∫lNªã∂¯vä\◊:R','Ha√Øti'),
('S\ÓSö\8C\0ç\n¢+˚c\‘','Honduras'),
('VS-óæFî¸	Æu\Úi','Hong-Kong'),
('Ö\»[\Ê\Z#Hú\Ùzo\Õ˛','Hongrie'),
('πåC±Z\…N√üò\ˆäÆx¢Ñ','√éle Bouvet'),
('2\ZöC|âp\ˆow+•','√éle Christmas'),
('ã¸±L5ByôÕÜ?\Ô^V\ÿ','√éle de Man'),
('¨\\\ˆP•øC[∑\Œ–®g˘\Ù','√éle Norfolk'),
('˛æ\œkΩ\”M_æQ{Z%\0ÄI','√éles (malvinas) Falkland'),
('wñM7}ìM\\ØL[W#','√éles √Öland'),
('∫s©Å\r\»A´(˝|®Jà','√éles Ca√Ømanes'),
('$O¡#\ÌILÀò^Ü\Û(Jx','√éles Cocos (Keeling)'),
('\'q¯\ÙN\0µûôDi;','√éles Cook'),
('≥m\\\Ôq\˜@;Ç/\œ{Ωú@\ﬂ','√éles F√©ro√©'),
('+Zd•IÓÉçn¥â.ö','√éles Heard et Mcdonald'),
('ô˚\«e)M¡±\0©\À\ˆ\Ì¿®','√éles Mariannes du Nord'),
('≤ß›çí\”ArôØ∑ù\ıÌè¶','√éles Marshall'),
('Øj7\‚:•D¨Y]5õ\ﬁ','√éles Mineures √âloign√©es des √âtats-Unis'),
('Jw\÷UîEâÄl¶\⁄\‰\"¥','√éles Salomon'),
('ùûûôI%∫\ÁX™\ırTî','√éles Turks et Ca√Øques'),
('F∑!˙ï˘H!ûxM†&èπ\≈','√éles Vierges Britanniques'),
('∑\ı?\«\ÔL6±}ßXh\˜\Ï','√éles Vierges des √âtats-Unis'),
('ö˛Dù\nGqÄ(C˙\‰g','Inde'),
('_B;wBñª•ˇs˚\ÿ','Indon√©sie'),
('\·Ñ\Í\ƒ\ÛMOô¶˚y¥\√Q','Iraq'),
('É™5%àCá`\Û\€\ˆ%','Irlande'),
('î\ÏsO\"Léá\‚\Óe\ÚYå','Islande'),
('=§X38L §8\Í\Èæ9\È\Ù','Isra√´l'),
('\Î˛æ†\r&Aò}Éë•\ﬂ5ã','Italie'),
('\Ëm´ë\ËJ¢LE+∞†\Ùi','Jamahiriya Arabe Libyenne'),
('¸#\Á§jImØ\‡≥\Ì\'U¥A','Jama√Øque'),
('îŒΩ\Í∂N’øP+MÆ+ø','Japon'),
(',ë\◊kNñ!B.u¸â ','Jordanie'),
('ÖC∂\tÆA∑\Â\nõùë','Kazakhstan'),
('\"7!ÄD®î˙•±x\·î\’','Kenya'),
('\È&§§¿AHå§«äQ)8M≤','Kirghizistan'),
('å}2\Ë\ÔGÕÖ\ÿ\·l5r¡˝','Kiribati'),
('∑Àúq\∆HΩúã≥◊π(\Óá','Kowe√Øt'),
('ÌøÜ\⁄R\€@œßPµ\⁄&î√ó','L\'ex-R√©publique Yougoslave de Mac√©doine'),
('0˛\‰V≤Ci®î?ø\\(Ø\Â','Lesotho'),
('x¡KrmJÖä\nØGç8\‰8','Lettonie'),
('æ©ùg˚\÷Aπ±\'√≤\\\È?j','Liban'),
('w∞õ\ÕH\„AÆ¨Z\˜C\'\ÍN9','Lib√©ria'),
('©)\”‚ÄΩL‹§µe\‹\’\„A','Liechtenstein'),
('Ø∞ÁÄêRI>≠a\«8Ñ6í','Lituanie'),
('j{l›ä\˜H≤≥F\\ÀYb','Luxembourg'),
(')˘±\ŸRΩO˝ç)∑\‰\€aZí','Macao'),
('5\∆\r\ÃDû∑∏\÷¡\·','Madagascar'),
('P\Ò{[qH÷±:\Í+’∞á','Malaisie'),
('•\¬H\‰E£0_ùë','Malawi'),
('£_áOyHƒÜ\‹Œ≠\0â\Î','Maldives'),
('œ¶\’\'\ﬁI&§õ^\Á\Î¯Ø','Mali'),
('—¥FU\ÁE⁄èIéÖG(ô§','Malte'),
('UXM.RPH∞°áqü\ˆl\Ã','Maroc'),
('9™ù-\€GÃ°âP¨\√E\ı∏','Martinique'),
('?V)6\ÀA›±°K%í(','Maurice'),
('HM©ï{G∏é<mùc∫\«','Mauritanie'),
('D+JëU1Fûà¨èµ∏¸\ˆ','Mayotte'),
(' )^å*\ÃI´s\Ò\ZÉ','Mexique'),
('\«R˛¯u9CﬁÜ#|\'\–DS\Ù','Monaco'),
('*yt˙N-à±.«πUgÅ','Mongolie'),
('\Õ\›\˜´\ÊDU¥1?èMQm¸','Montserrat'),
('£\ˆ≠˘ä¨Lçk{tõ¸\Ù¸','Mozambique'),
('A\≈mC’∫\¬rπ\”D ≠','Myanmar'),
('œö\‚ñ\ÒMñ@XEº∞Ü','Namibie'),
('I\È\0zõûCÆZ*≈°¸¨n','Nauru'),
('%ùæ*ë\«MQê#\·rñ,\Õ','N√©pal'),
('¿¨yNN[πZ§©ñ&\≈','Nicaragua'),
('\»¯(Q\˜CŒπ\⁄\¬\Ï','Niger'),
('\\\‡q\…Eò©øL¯%îôµ','Nig√©ria'),
('\Ï\≈\ÔO@‚Éö∫≥•\ﬂt','Niu√©'),
('èÜw\Î\ƒ.J\ÁãJûA±b\ÍV','Norv√®ge'),
('{ï_ˇNCOg≥\‡v\Z\\ã','Nouvelle-Cal√©donie'),
('íB7≥\√HhÄìo\"\Ã\Z|\‘','Nouvelle-Z√©lande'),
('zí\Õ;?ÜESÉµ“í0\ˆrØ','Oman'),
('|\ \ŒH\ÔTM(¨≠¥iff<l','Ouganda'),
('dâ/7tHB™ß\ÎzÀ¢m/f','Ouzb√©kistan'),
('˛ß≈ÑQ/He∞eA\ÍtR\∆','Pakistan'),
('\›*$/{\ˆN2âS∏7£\”\ÏØ','Palaos'),
('ÖøsJ\·óE˝´˙\®\0A\…','Panama'),
('O0¯≈â\÷D≠ö¥Y\∞b!V','Papouasie-Nouvelle-Guin√©e'),
('~7\ b4áC¡ó’µbµJ \·','Paraguay'),
('\–\“x\◊=\›G>ÆU\Í\‚ñ\‰','Pays-Bas'),
('\\ÛT\—\◊BóØ.\–1bGçÜ','P√©rou'),
('o>&˘IÉΩ!ûAeéJ','Philippines'),
('OfW¶KF*ªé[\‚M2tZ','Pitcairn'),
('\Â¿πrª¸H\'±âwSN	','Pologne'),
('L°3¥|Bq≥ùá\n*˘¨â','Polyn√©sie Fran√ßaise'),
('zü]\\\'LÉ\Ú(˝πf','Porto Rico'),
('.mOt´Fvô\À\Í\Ù`£','Portugal'),
('aä\Û\Ô\Í/Cœ¥±\‰B$\◊/U','Qatar'),
('\Û\œh\ƒoUEºâZI\Âø&A£','R√©publique Arabe Syrienne'),
('Jo\—¯ØL+®\ƒ\Ùµ\⁄\»¸2','R√©publique Centrafricaine'),
('Q%\‚\"h+LØ\Í\ﬁÀø†\À0','R√©publique de Cor√©e'),
('FÉ¢#õ D”Åò\«3Nh¸','R√©publique de Moldova'),
('ªx)\Ù\ÂDWøHe!\Ù\Ôp','R√©publique D√©mocratique du Congo'),
('d\ÈaŒõ∏A≠ï\"\Z|õˇrü','R√©publique D√©mocratique Populaire Lao'),
('\ÒCwjO≥Fu±\0í˙v\ıè','R√©publique Dominicaine'),
('f\ÎO\œM:L∏∫¿$\‘s\"b°','R√©publique du Congo'),
('$\0 \‰û\‹Kìí\Áé\È2\‡à','R√©publique Islamique d\'Iran'),
('¸£\“nªEé®7W˘ƒ≠\ƒ\Î','R√©publique Populaire D√©mocratique de Cor√©e'),
('7á\È¡GÜ£fã\◊N\Í\ﬂc','R√©publique Tch√®que'),
('°\˜aä\—F°ÜvA;•','R√©publique-Unie de Tanzanie'),
('ez®CíÑ$¡\ÿ\„ •0','R√©union'),
('\r\‹\€U\ @‹¢…úπ@\“','Roumanie'),
('Êó≠©\\æE˙´\ÎàN\ŒC','Royaume-Uni'),
('\Êhä7Hcª\ÈV\Â\‘\“','Rwanda'),
('Ïãí‘øæD\„Ç\ÌÖ¡“πìç','Sahara Occidental'),
('\\ˆ\‹Ü\–Ní£óz&åÄ','Saint-Kitts-et-Nevis'),
('õ∂¥\‰4@7®w\·6\Àk°','Saint-Marin'),
('\„MnLxIá≠k$p2\ı','Saint-Pierre-et-Miquelon'),
('H\Êõ\Í.GãèD•?ÖP','Saint-Si√®ge (√©tat de la Cit√© du Vatican)'),
('≠ã\n£L˝Å9P aâ','Saint-Vincent-et-les Grenadines'),
('th\“/GÆøÖñØx∏l','Sainte-H√©l√®ne'),
('£¡\‡∫©J*§2¿\œ\"Æ+X','Sainte-Lucie'),
('¥\Õ\ÍZäÇJ\ÛåU(6Ö\– ç','Samoa'),
('C\Úx˙2`N¥K!\€˝Of\Í','Samoa Am√©ricaines'),
('ﬁù’û˙BÅ(\06\Õ\Â\Œ','Sao Tom√©-et-Principe'),
('Móí%≤´M>∞≤Y˙\‰NE','S√©n√©gal'),
('•\‰±\0ˇG;∑V˛D\ÍAøa','Serbie-et-Mont√©n√©gro'),
('íqq+q≤@π\Áµ2$_','Seychelles'),
('@\…\Ò¡oE7Å\÷!\’;π\◊','Sierra Leone'),
('N\ÔB$pGH´∞z-[Yw\‡~','Singapour'),
('\Ë¡–ûV∫DêÅ<˚Gs¯d,','Slovaquie'),
('åå,\Ï\0XJ£π••\ı\‡.\n','Slov√©nie'),
(' îúJ:F9≠G\Ÿ\‘\“\Ò<\÷','Somalie'),
('äŸüÄEµòçáv\÷\\','Soudan'),
('\ÌHó7MLHñ∏\„º\»\Úì','Sri Lanka'),
('ÇHÆú§Z@‹ÇwÆöéÉd','Su√®de'),
('ƒäDã™\◊AÉΩo±\’Fµ\∆','Suisse'),
('úcà\ÁAES∑d*v≠*Å','Suriname'),
('ôBF\“U4J2•¥bJ˛Éa','Svalbard et√éle Jan Mayen'),
('3\Íô*H]†Ä\Ñ©z\'','Swaziland'),
('ΩÑ\Ú\rç\¬M®©å!\‚/¨àM','Tadjikistan'),
('<ñG£y\ÈJNè≠|Vx=£','Ta√Øwan'),
('$_ãfSA\˜∑d\ˆù#êI','Tchad'),
('¥±\Ó5j†Bîú¿\€`t1B_','Terres Australes Fran√ßaises'),
('c\˜\rªB\·£D\Œc\€6$°','Territoire Britannique de l\'Oc√©an Indien'),
('&\—@G∫∂MØ°qE±\Ã\r¨Y','Territoire Palestinien Occup√©'),
('y¥\ƒPtJ8ù,vT&ªS\œ','Tha√Ølande'),
('&\»\„û\‚Eß<Ã∫ÆÜ\Ì','Timor-Leste'),
('\ÏÆ¿N\·¡H∏\√T£U\nü','Togo'),
('/ñ\Z,4@\˜∂,\„+:ûX2','Tokelau'),
('i>êSt/G§.wM\√\ÙMZ','Tonga'),
('[ªáU†™@\ËÉ∑Ω∞¥\ƒ','Trinit√©-et-Tobago'),
('\ÀyS)⁄üAH¥µ\ıÖ∫ù\…','Tunisie'),
('Dê\≈v\∆Noë\‹aç†\˜7','Turkm√©nistan'),
('~Vz:d\’@\Óó\˜\È©bÜ','Turquie'),
('m\ÂYúπIæ≠\¬\‡\Ë\∆\Ë¶','Tuvalu'),
('°¥„úØ\F••5k\Ë\◊\»\À','Ukraine'),
('px\Â\‹\ÎßIJ™éã!\∆\˜r','Uruguay'),
('?ô\‡\‹+GCn´⁄ïH\Í\Ò\œ','Vanuatu'),
('JE\“\ŸOE⁄ò∏;\Â$¿i','Venezuela'),
('\n\Ï\"§•I$≤¯%d∑\Ÿ\ˆ','Viet Nam'),
('c∫¥˙\ÙIÖ§ø\Ë\…˝{π','Wallis et Futuna'),
('^åó.èzL^Ñ\∆p\„\Íx#','Y√©men'),
('Rß\—S£#BûÜú&Ä+ê','Zambie'),
('\◊\"\Œ*%dEîô—òã™Ñ_L','Zimbabwe');
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
('DoctrineMigrations\\Version20241217142038','2024-12-17 14:21:05',7);
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
('´\Ì/iöÆMí©\Ì˙|òVt','root@gmail.com','https://apps.apple.com/app/6468406309','pending','2024-12-17 14:21:06',NULL,NULL,'.•l5ãπLnöIΩy\≈\Ò7');
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
('.•l5ãπLnöIΩy\≈\Ò7','Domaine Leflaive Montrachet Grand Cru 2016','[\"hugues.gobet@gmail.com\"]','hugues.gobet@gmail.com'),
('ñJ<∏_ΩFx•\Õ\„q¿ûß\"','Ch√¢teau Latour 2010','[\"hugues.gobet@gmail.com\"]','hugues.gobet@gmail.com');
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

-- Dump completed on 2024-12-17 14:21:07
