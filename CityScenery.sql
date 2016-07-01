CREATE DATABASE  IF NOT EXISTS `csdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `csdb`;
-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: csdb
-- ------------------------------------------------------
-- Server version	5.6.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `scenery_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_content` text,
  `comment_time` datetime DEFAULT NULL,
  `comment_score` int(11) DEFAULT NULL,
  `comment_media` longtext CHARACTER SET latin1,
  PRIMARY KEY (`comment_id`),
  KEY `FK_comment_user` (`user_id`),
  KEY `FK_scenery_comment` (`scenery_id`),
  CONSTRAINT `FK_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_scenery_comment` FOREIGN KEY (`scenery_id`) REFERENCES `scenery` (`scenery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'用户1对景点1的评论','2016-02-01 20:00:00',3,'test.jpg'),(2,1,2,'用户2对景点1的点评','2016-06-20 19:30:00',5,'test.jpg'),(3,1,2,'呵呵','2016-02-05 20:00:00',2,'test1.mp4'),(4,1,1,'6666666','2016-03-02 13:00:00',5,NULL),(10,2,3,'2333333','2016-06-29 10:37:58',5,'test.jpg'),(18,2,1,'还行','2016-06-29 12:57:21',3,'hehe.png'),(19,1,1,'我觉得还不错吧','2016-06-29 14:48:22',4,''),(20,4,1,'不咋地','2016-06-29 14:49:19',2,''),(21,4,1,'6666','2016-06-29 14:50:42',4,''),(22,2,1,'太厉害了','2016-06-29 14:52:25',5,''),(23,2,1,'实在是太棒了','2016-06-29 14:52:40',4,'1467183159710.jpg'),(24,1,5,'我觉得还行','2016-06-30 14:56:03',3,'1467269763481.mp4'),(25,2,7,'','2016-06-30 15:16:46',1,''),(26,2,5,'','2016-06-30 15:23:03',1,''),(27,2,5,'','2016-06-30 15:30:51',5,'');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `scenery_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`scenery_id`,`user_id`),
  KEY `FK_history2` (`user_id`),
  CONSTRAINT `FK_history` FOREIGN KEY (`scenery_id`) REFERENCES `scenery` (`scenery_id`),
  CONSTRAINT `FK_history2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,1),(2,1),(3,1),(4,1),(1,3),(2,7);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation` (
  `operation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `scenery_id` int(11) NOT NULL,
  `operation_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`operation_id`,`user_id`,`scenery_id`),
  KEY `FK_operation2` (`scenery_id`),
  KEY `FK_operation` (`user_id`),
  CONSTRAINT `FK_operation` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_operation2` FOREIGN KEY (`scenery_id`) REFERENCES `scenery` (`scenery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
INSERT INTO `operation` VALUES (4,2,1,0),(5,2,1,1),(6,3,1,0),(7,4,4,2),(12,5,1,0),(13,5,4,0),(14,4,4,0),(15,3,4,0),(16,2,4,0),(17,1,1,0),(18,7,1,0),(19,7,1,2),(20,7,1,1),(21,1,5,1),(23,2,5,1),(24,3,5,1),(25,1,8,2),(26,5,8,2),(27,7,8,2);
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenery`
--

DROP TABLE IF EXISTS `scenery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenery` (
  `scenery_id` int(11) NOT NULL AUTO_INCREMENT,
  `scenery_name` text CHARACTER SET utf8,
  `scenery_latitude` float DEFAULT NULL,
  `scenery_longitude` float DEFAULT NULL,
  `scenery_brief` text CHARACTER SET utf8,
  `scenery_detail` text CHARACTER SET utf8,
  `scenery_type` int(11) DEFAULT NULL,
  `scenery_border` longtext CHARACTER SET utf8,
  `scenery_icons` longtext CHARACTER SET utf8,
  PRIMARY KEY (`scenery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenery`
--

LOCK TABLES `scenery` WRITE;
/*!40000 ALTER TABLE `scenery` DISABLE KEYS */;
INSERT INTO `scenery` VALUES (1,'复旦大学',121.51,31.302,'复旦大学（Fudan University），简称“复旦”，位于首批沿海开放城市上海市，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”，入选“珠峰计划”、“111计划”、“2011计划”、“卓越医生教育培养计划”，为“九校联盟”成员、东亚研究型大学协会成员、环太平洋大学协会成员、21世纪大学协会成员，是一所综合性研究型的全国重点大学。','复旦大学由原复旦大学、原上海医科大学合并而成。复旦大学创建于1905年，原名复旦公学，是中国人自主创办的第一所高等院校，创始人为中国近代知名教育家马相伯，首任校董为国父孙中山先生。校名“复旦”二字选自《尚书大传·虞夏传》中“日月光华，旦复旦兮”的名句，意在自强不息，寄托当时中国知识分子自主办学、教育强国的希望。1917年复旦公学改名为私立复旦大学；1937年抗战爆发后，学校内迁重庆北碚，并于1941年改为“国立”；1946年迁回上海江湾原址；1952年全国高等学校院系调整后，复旦大学成为以文理科为基础的综合性大学；1959年成为全国重点大学。2000年，与原上海医科大学合并成立新的复旦大学。',0,'121.501879,31.308448|121.506479,31.306875|121.508311,31.305888|121.51618,31.308016|121.517725,31.304499|121.514312,31.303296|121.515965,31.300488|121.508922,31.294718|121.504143,31.304036|121.500586,31.305456|','3,6,121.500586,31.305456,不好玩|1,1,121.506479,31.306875,|1,3,121.513557,31.305579,|2,3,121.508527,31.304036,|'),(2,'同济大学',121.513,31.288,'同济大学（Tongji University），简称同济，是中华人民共和国教育部直属，由教育部和上海市共建的全国重点大学，是历史悠久、享有盛誉的中国著名高等学府，是国家“211工程”、“985工程”重点建设高校，也是收生标准最严格的中国大学之一；是“2011计划”、“珠峰计划”、“卓越工程师计划”、卓越法律人才教育培养计划、卓越医生教育培养计划、“111计划”、中美“10+10”计划入选高校；是环境与可持续发展合作联盟、国际设计艺术院校联盟、21世纪学术联盟、卓越大学联盟、中俄工科大学联盟、中欧工程教育平台、同济—伯克利工程联盟成员，为中管副部级院校。','同济大学的前身是1907年德国医生埃里希·宝隆在上海创办的德文医学堂；翌年改名同济德文医学堂；1912年与创办不久的同济德文工学堂合并，更名为同济德文医工学堂；1923年正式定名为大学；1927年成为国立同济大学，是中国最早的七所国立大学之一。\n同济大学始终把培养拔尖创新人才作为崇高使命和责任，造就了一大批杰出的政治家、科学家、教育家、社会活动家、企业家、医学专家和工程技术专家，校友中当选中国科学院、中国工程院两院院士的有140余人。\n截至2014年12月，同济大学设有36个学院（系）和二级办学机构，7家附属医院，4所附属中学；学校有全日制本科生18005人、硕士研究生13644人、博士研究生4504人，另有攻读学位外国留学生2477人；学校占地面积2567863平方米；图书437.1万册。',1,'121.506712,31.292675|121.514114,31.290206|121.51106,31.284312|121.508329,31.285392|121.507574,31.284034|121.504053,31.285053|121.504772,31.28675|121.502652,31.28783|121.502939,31.289805|121.50452,31.291441|',NULL),(3,'上海交通大学',121.44,31.208,'上海交通大学（Shanghai Jiao Tong University）位于中国的经济、金融中心上海，教育部直属，具有理工特色，涵盖理、工、医、经、管、文、法等9大学科门类的综合性全国重点大学，中国首批七所“211工程”、首批九所“985工程重点建设”院校之一，入选“珠峰计划”、“111计划”、“2011计划”、“卓越医生教育培养计划”、“卓越法律人才教育培养计划”、“卓越工程师教育培养计划”、“卓越农林人才教育培养计划”，是“九校联盟”、Universitas 21、21世纪学术联盟的重要成员。现有徐汇、闵行、黄浦、长宁、七宝、浦东等校区，总占地面积4893亩','办学历史可追溯到1896年（光绪22年）由清政府创立、盛宣怀督办的南洋公学，是中国高等教育的数个发端之一。1921年改组为交通大学（Chiao Tung University）；而后复遭波折，历交通部南洋大学、交通部第一交通大学、国立交通大学（上海本部），至1949年剔去“国立”二字，径称“交通大学”。1959年7月31日，国务院批准交通大学上海部分、西安部分分别独立为两所学校，交通大学上海部分定名为“上海交通大学”。1999年，原上海农学院并入。2005年7月，上海第二医科大学并入上海交通大学。',2,'121.441725,31.208448|121.442479,31.20749|121.443198,31.204587|121.441042,31.203104|121.440503,31.202487|121.439677,31.20261|121.439569,31.203537|121.436658,31.203599|121.436155,31.202672|121.434718,31.202795|121.436191,31.206039|',NULL),(4,'张江大学：我是一个名字很长的景点',121.601,31.197,'我只想做一个安静的美男子','复旦大学是我的一个校区',2,'121.601383,31.197201|121.607527,31.198096|121.607958,31.193092|121.60494,31.192474|121.604185,31.19439|121.601994,31.193957|','1,1,121.603695,31.19527,|'),(5,'东方明珠',121.506,31.2454,'东方明珠广播电视塔是上海的标志性文化景观之一，位于浦东新区陆家嘴，塔高约468米。该建筑于1991年7月兴建，1995年5月投入使用，承担上海6套无线电视发射业务，地区覆盖半径80公里。','东方明珠广播电视塔是国家首批AAAAA级旅游景区。塔内有太空舱、旋转餐厅、上海城市历史发展陈列馆等景观和设施，1995年被列入上海十大新景观之一。',0,'121.505826,31.245957|121.504945,31.246868|121.506931,31.247639|121.508458,31.24703|121.50764,31.246466|121.50782,31.245895|121.506679,31.244876|121.506104,31.244791|121.505547,31.245339|',NULL),(6,'人民广场',121.48,31.2387,'上海人民广场（上海话拼音：shenmhin guangshan。位于上海黄浦区，是上海的政治、经济、文化、旅游中心和交通枢纽，也是上海最为重要的地标之一。成形于上海开埠以后，原来称上海跑马厅，是当时上层社会举行赛马等活动的场所。广义上的人民广场主要是由一个开放式的广场、人民公园以及周边一些文化、旅游、商业建筑等组成。位于上海市中心的人民广场总面积达14万平方米，过去作为全市人民游行集会的场所，可容纳120多万人。它也是318国道的起点。','被誉为“城市绿肺”的人民广场位于市中心，是一个金融行政、文化、交通、商业为一体的园林式广场。 广场北侧是上海市人民政府所在地，西北侧为上海大剧院，东北侧为上海城市规划展示馆，南侧为上海博物馆，人民大道穿越其中。广场两侧各设17米宽的绿化带，绿化总面积达8万平方米。',0,'121.480844,31.240423|121.482182,31.238277|121.477511,31.235776|121.477062,31.236895|121.478338,31.239219|121.479928,31.240307|',NULL),(7,'环球金融中心',121.514,31.2399,'上海环球金融中心是位于中国上海陆家嘴的一栋摩天大楼，2008年8月29日竣工。楼高492米，地上101层，是目前中国第3高楼（截至2014年）世界最高的平顶式大楼。开发商为“上海环球金融中心有限公司”，1995年由日本森大厦株式会社主导兴建。','上海环球金融中心是以日本的森大厦株式会社（Mori Building Corporation）为中心，联合日本、美国等40多家企业投资兴建的项目，总投资额超过1050亿日元（逾10亿美元）。原本设计高460米，工程地块面积为3万平方米，总建筑面积达38.16万平方米，比邻金茂大厦。上海环球金融中心共100层，其中94-100层都为观光层。其中倒梯形底部为97层观光天桥，而倒梯形顶部为100层则设置了长约55米的贵宾观光天阁。\n观光设施位于上海环球金融中心第94至100层。100层诞生了世界最高的观光厅；97层，如同浮在空中的天桥；94层，则以城市全景为背景，提供可举行各种活动的交流空间。\n上海环球金融中心是位于中国上海陆家嘴的一栋摩天大楼，2008年8月29日竣工。是中国目前第3高楼、世界第5高楼、世界最高的平顶式大楼，楼高492 米，地上101层。',0,'121.51325,31.241519|121.513322,31.239681|121.513681,31.238593|121.515514,31.239164|121.515316,31.240893|',NULL),(8,'南京路步行街	',121.491,31.2433,'南京路步行街（Nanjing Road Walkway）位于上海市黄浦区，西起西藏中路，东至河南中路，步行街的东西两端均有一块暗红色大理石屏，上面是江泽民主席亲笔题写的“南京路步行街”6个大字。国庆50周年时落成的这条步行街，使“百年南京路”焕然一新，成为上海又一处靓丽的城市新景观。南京路步行街全长1033m，路幅宽18～28m，总用地约3万平方米。','南京路已有100多年的历史，它的前身是“派克弄”，1865年正式命名为南京路。1908年，南京路开通有轨电车，路面采用铁藜木铺设，其后的20～30年间，南京路迎来了历史上第一个发展高潮，即由原来的小商摊、小商店转向大型百货商厦，相继建成了和平饭店、四大公司、国际饭店等建筑，为南京路日后的发展奠定了基础。90年代，随着我国的改革开放，南京路出现了第二次发展高潮，纷纷建起新型的综合性商业楼，使南京路的面貌有了翻天覆地的变化。',0,'121.491371,31.243411|121.486817,31.241782|121.485002,31.241555|121.481113,31.24074|121.48118,31.24059|121.48348,31.241018|121.485016,31.241381|121.48692,31.241616|121.488245,31.242049|121.491457,31.243179|',NULL),(9,'黄浦公园	',121.498,31.2474,'黄浦公园，位于上海市中山东一路28号，占地31亩，绿化面积10.92亩。东濒黄浦江，南邻外滩绿带，西沿中山东一路，北接吴淞江（苏州河）。建成于1868年8月，经过多次改建，用过多个名称：公花园、外国花园、公家花园、大桥公园、外摆渡公园、黄浦滩公园等。公园把上海市人民英雄纪念塔、外滩历史纪念馆、大型浮雕及纪念塔广场等与公园园林景观融为一体，集观光、休闲、教育之功能，是外滩重要景观之一。黄浦公园广场是外滩改造指挥部推荐的观赏浦江两岸风光的最佳位置。','黄浦公园是上海、也是中国第一座公共园林。黄浦公园浓缩了上海开埠以来的历史，是进行革命传统教育的重要基地之一，1996年被上海市人民政府命名为“青少年爱国主义教育基地”。',1,'121.498352,31.248035|121.498307,31.247761|121.497885,31.247672|121.498096,31.24756|121.497714,31.246395|121.497022,31.246426|121.49695,31.247626|121.496851,31.248463|121.497009,31.248498|121.497723,31.24824|121.497678,31.248047|121.497988,31.248243|121.49823,31.248155|',NULL),(10,'中医药大学',121.604,31.1979,'创立于1956年的上海中医药大学，是新中国诞生后国家首批建立的四所中医药高等院校之一，也是上海市属高校中唯一的一所医科类重点特色院校。1985年上海市中医药研究院成立，目前与上海中医药大学实行两块牌子、一套管理机构，学校校级领导兼任研究院院级领导的管理体制。','截止2015年10月，学生规模为全日制在校生7322人，其中博士生550人、硕士生1840人，本科生3657人，专科生249人，留学生1026人；全日制在校生中港、澳、台地区学生174人。此外，成人教育学生3846人。每年有来自日、韩、俄、法、英、美、德、意等30余个国家和地区的短期留学生1200余人次。',2,'121.607155,31.202214|121.607469,31.198122|121.601262,31.197342|121.600894,31.199241|121.599986,31.199766|121.59757,31.199365|121.597336,31.201095|',NULL);
/*!40000 ALTER TABLE `scenery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` text CHARACTER SET utf8,
  `user_password` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `user_portrait` text CHARACTER SET utf8,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'111','123456','default.jpg'),(2,'222','123456','default.jpg'),(3,'333','123456','default.jpg'),(4,'444','123456','default.jpg'),(5,'555','123456','default.jpg'),(6,'666','123456','default.jpg'),(7,'777','123456','default.jpg');
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

-- Dump completed on 2016-06-30 23:24:37
