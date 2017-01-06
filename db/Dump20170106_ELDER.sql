-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: elders
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `aids_recomendation_tb`
--

DROP TABLE IF EXISTS `aids_recomendation_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aids_recomendation_tb` (
  `aids_recomendation_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `cash_aid_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nنوع المساعدات المادية مثلا:دورية-لمرة واحدة',
  `cash_aid_amount` int(11) DEFAULT NULL COMMENT 'قيمة المساعدة',
  `psychological_support` varchar(200) DEFAULT NULL COMMENT 'دعم نفسي',
  `social_support` varchar(200) DEFAULT NULL COMMENT 'دعم اجتماعي',
  `entertainment` varchar(200) DEFAULT NULL COMMENT 'الترفيه',
  `nutrition_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nنوع التغذية',
  `nutrition_details` varchar(200) DEFAULT NULL COMMENT 'تفاصيل الغذاء الذي يحتاجه المسن',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`aids_recomendation_id`),
  KEY `FK_Survey_AidsRecomendation_idx` (`survey_id`),
  KEY `FK_SubConstant_AidsRecomendation_idx` (`cash_aid_type_id`),
  KEY `FK_SubConstant_AidsRecomendation_Nutrition_idx` (`nutrition_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على توصيات الادارة بالمساعدات التي يحتادها المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aids_recomendation_tb`
--

LOCK TABLES `aids_recomendation_tb` WRITE;
/*!40000 ALTER TABLE `aids_recomendation_tb` DISABLE KEYS */;
INSERT INTO `aids_recomendation_tb` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,204,147,100,'نفسي','اجتماعي','ترفيه',148,'غذاء',NULL,NULL),(8,212,146,100,'','','',148,'غذاء',NULL,NULL),(9,213,146,1000,'دعم نفسي','','',NULL,'',NULL,NULL),(10,215,146,100,'','','',148,'غذاء',NULL,NULL),(11,223,147,1000,'دعم زهايمر - دعم نفسي',' دعم مالي - دعم اجتماعي','رياضة',149,'فلافل وفول ',NULL,NULL),(12,221,146,1000,'','  ','رياضة',148,'غذاء',NULL,NULL),(13,225,146,1000,'دعم نفسي',' زيارات','رياضية',149,'غذاء خاص',NULL,NULL),(14,230,146,100,'','','',NULL,'',NULL,NULL),(15,233,146,100,'','','',NULL,'',NULL,NULL),(16,235,146,100,'','','',NULL,'','2016-01-29 15:43:13',1);
/*!40000 ALTER TABLE `aids_recomendation_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_tb`
--

DROP TABLE IF EXISTS `appointment_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_tb` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `researcher_id` int(11) DEFAULT NULL COMMENT 'FK employee_tb\nرقم الباحث',
  `elder_id` int(11) DEFAULT NULL COMMENT 'FK elder_tb\nرقم المسن',
  `appointment_date` date DEFAULT NULL COMMENT 'تاريخ الموعد',
  PRIMARY KEY (`appointment_id`),
  KEY `FK_Employee_Appojntment_idx` (`researcher_id`),
  KEY `FK_Elder_Appointment_idx` (`elder_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على جدولة مواعيد الزيارات للأعضاء';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_tb`
--

LOCK TABLES `appointment_tb` WRITE;
/*!40000 ALTER TABLE `appointment_tb` DISABLE KEYS */;
INSERT INTO `appointment_tb` VALUES (1,2,1,'2016-01-01');
/*!40000 ALTER TABLE `appointment_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constant_tb`
--

DROP TABLE IF EXISTS `constant_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constant_tb` (
  `constant_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `constant_name` varchar(45) NOT NULL COMMENT 'وصف الثابت',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`constant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على انواع ثوابت النظام مثلا:الجنس-الحالة الاجتماع';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constant_tb`
--

LOCK TABLES `constant_tb` WRITE;
/*!40000 ALTER TABLE `constant_tb` DISABLE KEYS */;
INSERT INTO `constant_tb` VALUES (1,'الجنس',NULL,NULL),(2,'الحالة الاجتماعية',NULL,NULL),(3,'المسمى الوظيفي',NULL,NULL),(4,'صلة القرابة',NULL,NULL),(7,'التأمين الصحي',NULL,NULL),(20,'نوع المستخدم',NULL,NULL),(21,'مصدر الدخل',NULL,NULL),(22,'المحافظات',NULL,NULL),(23,'المؤهل العلمي',NULL,NULL),(24,'التخصص',NULL,NULL),(25,'العمل الحالي',NULL,NULL),(26,'العمل السابق',NULL,NULL),(27,'نوع المستند',NULL,NULL),(28,'الحالة الصحية للفرد',NULL,NULL),(29,'مصدر الدخل',NULL,NULL),(30,'الوضع العام',NULL,NULL),(31,'نوع السكن',NULL,NULL),(32,'توع السقف',NULL,NULL),(33,'مستوى الأثاث',NULL,NULL),(34,'وصف حالة المسن في الأسره',NULL,NULL),(35,'وصف ملابس وأغطية المسن',NULL,NULL),(36,'تهوية الغرفة',NULL,NULL),(37,'إضاءة الغرفة',NULL,NULL),(38,'اختيار نعم / لا',NULL,NULL),(39,'وصف الحمام / دورة المياه',NULL,NULL),(40,'حالة النظافة للمسن نفسه',NULL,NULL),(41,'توفير العلاج للمسن',NULL,NULL),(42,'نوع العلاج',NULL,NULL),(43,'علاقة المسن بالأسرة والمجتمع المحلي',NULL,NULL),(44,'حالة أسرة المسن الاجتماعية والنفسية',NULL,NULL),(45,'قدرة المسن على العمل',NULL,NULL),(46,'إمكانية التشغيل',NULL,NULL),(47,'نوع المساعدة المادية',NULL,NULL),(48,'نوع التغذية',NULL,NULL),(49,'نوع المساعدة الطبية',NULL,NULL),(50,'نوع المساعدة لتحسين السكن',NULL,NULL),(51,'تـصنيف المـلـف',NULL,NULL),(52,'سبب اغلاق الملف',NULL,NULL),(53,'تصنيف الحالة',NULL,NULL),(54,'الحالة الصحية للمسن',NULL,NULL),(55,'وصف سكن المسن',NULL,NULL),(56,'سبب نبذ المسن',NULL,NULL),(57,'جمعيات خيرية أهلية / دولية',NULL,NULL),(58,'محافظة الشمال',NULL,NULL),(59,'محافظة الوسطى',NULL,NULL),(60,'محافظة خانيونس',NULL,NULL),(61,'محافظة غزة',NULL,NULL),(62,'مدينة جباليا',NULL,NULL),(63,'مدينة بيت لاهيا',NULL,NULL),(64,'مدينة بيت حانون',NULL,NULL),(65,'مدينة النصيرات',NULL,NULL),(66,'مدينة دير البلح',NULL,NULL),(67,'مدينة القرارة',NULL,NULL),(68,'محافظة رفح',NULL,NULL),(69,'الإستعانة بطرف ثاني',NULL,NULL),(70,'القرى الشرقية',NULL,NULL),(71,'مدينة غزة',NULL,NULL),(72,'مدينة البريج',NULL,NULL),(73,'مدينة المغازي',NULL,NULL),(74,'مدينة رفح',NULL,NULL);
/*!40000 ALTER TABLE `constant_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_tracking_tb`
--

DROP TABLE IF EXISTS `data_tracking_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_tracking_tb` (
  `data_tracking_id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(45) DEFAULT NULL,
  `table_name` varchar(45) DEFAULT NULL,
  `table_pk` int(11) DEFAULT NULL,
  `col_name` varchar(45) DEFAULT NULL,
  `old_value` varchar(45) DEFAULT NULL,
  `new_value` varchar(45) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`data_tracking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على كافة العمليات التي يتم اجراءها على الداتابيز';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_tracking_tb`
--

LOCK TABLES `data_tracking_tb` WRITE;
/*!40000 ALTER TABLE `data_tracking_tb` DISABLE KEYS */;
INSERT INTO `data_tracking_tb` VALUES (1,'update','appointment_tb',1,'researcher_id','1','2','2016-01-30 12:06:42',NULL),(2,'update','appointment_tb',1,'researcher_id','1','2','2016-01-30 12:21:53','root@localhost'),(3,'update','constant_tb',76,'constant_name','test2','test3','2016-01-30 13:25:59','1');
/*!40000 ALTER TABLE `data_tracking_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elder_behaviour_tb`
--

DROP TABLE IF EXISTS `elder_behaviour_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elder_behaviour_tb` (
  `elder_behaviour_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL,
  `behaviour_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nسلوك المسن مثلا:انطوائي -مبادر-منبوذ لانه سليط اللسان',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`elder_behaviour_id`),
  KEY `FK_Survey_ElderBehaviour_idx` (`survey_id`),
  KEY `FK_SubConstant_ElderBehaviour_idx` (`behaviour_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='علاقة المسن بالاسرة والمجتمع المحلي';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_behaviour_tb`
--

LOCK TABLES `elder_behaviour_tb` WRITE;
/*!40000 ALTER TABLE `elder_behaviour_tb` DISABLE KEYS */;
INSERT INTO `elder_behaviour_tb` VALUES (2,170,129,NULL,NULL),(4,171,129,NULL,NULL),(5,171,211,NULL,NULL),(6,172,130,NULL,NULL),(7,172,211,NULL,NULL),(8,173,130,NULL,NULL),(9,174,130,NULL,NULL),(11,175,130,NULL,NULL),(12,175,211,NULL,NULL),(15,176,130,NULL,NULL),(16,176,211,NULL,NULL),(17,223,130,NULL,NULL),(18,223,129,NULL,NULL),(19,223,128,NULL,NULL),(21,223,211,NULL,NULL),(24,221,129,NULL,NULL),(25,225,130,NULL,NULL),(26,225,211,NULL,NULL),(27,230,130,NULL,NULL),(28,230,126,NULL,NULL),(29,233,129,NULL,NULL),(30,235,129,'2016-01-29 15:40:17',1),(31,235,130,'2016-01-29 15:40:23',1),(32,235,211,'2016-01-29 15:40:32',1);
/*!40000 ALTER TABLE `elder_behaviour_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elder_disease_det_tb`
--

DROP TABLE IF EXISTS `elder_disease_det_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elder_disease_det_tb` (
  `elder_disease_det_id` int(11) NOT NULL AUTO_INCREMENT,
  `elder_disease_id` int(11) DEFAULT NULL COMMENT 'FK elder_disease_tb\nرقم الماستر',
  `disease_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nرقم المرض',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`elder_disease_det_id`),
  KEY `FK_SubConstant_ElderDisease_idx` (`disease_id`),
  KEY `FK_ElderDisease_ElderDiseaseDet_idx` (`elder_disease_id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الامراض التي يعاني منها المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_disease_det_tb`
--

LOCK TABLES `elder_disease_det_tb` WRITE;
/*!40000 ALTER TABLE `elder_disease_det_tb` DISABLE KEYS */;
INSERT INTO `elder_disease_det_tb` VALUES (10,NULL,187,NULL,NULL),(12,2,185,NULL,NULL),(13,NULL,186,NULL,NULL),(14,4,186,NULL,NULL),(15,4,187,NULL,NULL),(16,6,186,NULL,NULL),(17,7,186,NULL,NULL),(18,8,187,NULL,NULL),(19,9,187,NULL,NULL),(20,9,186,NULL,NULL),(21,10,186,NULL,NULL),(23,10,194,NULL,NULL),(24,11,186,NULL,NULL),(26,11,187,NULL,NULL),(30,13,188,NULL,NULL),(31,13,186,NULL,NULL),(32,14,187,NULL,NULL),(33,14,194,NULL,NULL),(35,16,190,NULL,NULL),(36,17,186,NULL,NULL),(39,19,185,NULL,NULL),(40,20,186,NULL,NULL),(41,22,188,NULL,NULL),(42,23,188,NULL,NULL),(43,24,186,NULL,NULL),(44,25,186,NULL,NULL),(45,25,188,NULL,NULL),(46,26,190,NULL,NULL),(48,26,191,NULL,NULL),(49,26,187,NULL,NULL),(51,27,190,NULL,NULL),(52,29,186,NULL,NULL),(53,30,188,NULL,NULL),(54,31,189,NULL,NULL),(55,32,186,NULL,NULL),(56,32,188,NULL,NULL),(57,33,188,NULL,NULL),(58,34,188,NULL,NULL),(59,35,186,'2016-01-29 15:34:05',1);
/*!40000 ALTER TABLE `elder_disease_det_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elder_disease_tb`
--

DROP TABLE IF EXISTS `elder_disease_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elder_disease_tb` (
  `elder_disease_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL,
  `elder_disease_details` varchar(200) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`elder_disease_id`),
  KEY `FK_Survey_ElderDisease_idx` (`survey_id`),
  KEY `FK_Surv_ElderDisease_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='جدول ماستر يحتوي على تفاصيل مرض المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_disease_tb`
--

LOCK TABLES `elder_disease_tb` WRITE;
/*!40000 ALTER TABLE `elder_disease_tb` DISABLE KEYS */;
INSERT INTO `elder_disease_tb` VALUES (1,107,NULL,NULL,NULL),(2,108,NULL,NULL,NULL),(3,109,NULL,NULL,NULL),(4,110,NULL,NULL,NULL),(5,111,NULL,NULL,NULL),(6,111,NULL,NULL,NULL),(7,112,'\n								   							<i id=\"iConst\" class=\"fa fa-check\"></i>',NULL,NULL),(8,112,NULL,NULL,NULL),(9,113,'',NULL,NULL),(10,114,'aaaaaa',NULL,NULL),(11,115,NULL,NULL,NULL),(12,116,NULL,NULL,NULL),(13,117,'jkbkjbk,',NULL,NULL),(14,118,'بفبغيبغ',NULL,NULL),(15,144,NULL,NULL,NULL),(16,145,NULL,NULL,NULL),(17,146,NULL,NULL,NULL),(18,147,NULL,NULL,NULL),(19,148,NULL,NULL,NULL),(20,149,NULL,NULL,NULL),(21,150,'hkh',NULL,NULL),(22,150,NULL,NULL,NULL),(23,151,'vjvghhvh',NULL,NULL),(24,153,'لاسنلايءس',NULL,NULL),(25,169,NULL,NULL,NULL),(26,223,'مريض مزمن ويحتاج لمساعدة',NULL,NULL),(27,221,'kjk',NULL,NULL),(28,224,'تتتتت',NULL,NULL),(29,225,'مريض',NULL,NULL),(30,226,'مريض',NULL,NULL),(31,227,'مريض',NULL,NULL),(32,230,'مريض',NULL,NULL),(33,232,'ضغط',NULL,NULL),(34,233,'ضغط',NULL,NULL),(35,235,'jhkb','2016-01-29 15:34:05',1);
/*!40000 ALTER TABLE `elder_disease_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elder_doc_tb`
--

DROP TABLE IF EXISTS `elder_doc_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elder_doc_tb` (
  `elder_doc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `file_id` int(11) DEFAULT NULL COMMENT 'FK file_tb\nرقم الملف المسلسل',
  `doc_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nنوع المصنف',
  `doc_path` varchar(200) DEFAULT NULL COMMENT 'مسار وجود المصنف',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الادخال',
  `created_by` varchar(200) DEFAULT NULL COMMENT 'FK user_tb\nاسم المستخدم مدخل البيانات',
  PRIMARY KEY (`elder_doc_id`),
  KEY `FK_SubConstant_ElderDoc_idx` (`doc_type_id`),
  KEY `FK_Elder_ElderDoc_idx` (`file_id`),
  KEY `FK_Users_ElderDoc_idx` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي صور الأوراق الثبوتية الخاصة بالمسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_doc_tb`
--

LOCK TABLES `elder_doc_tb` WRITE;
/*!40000 ALTER TABLE `elder_doc_tb` DISABLE KEYS */;
INSERT INTO `elder_doc_tb` VALUES (20,1,64,'12015185032.jpg',NULL,NULL),(21,1,65,'1590460312.jpg',NULL,NULL),(22,1,64,'11590427496.jpg',NULL,NULL),(23,11,65,'111929382911.jpg','2016-01-29 10:59:23','1');
/*!40000 ALTER TABLE `elder_doc_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elder_interesting_tb`
--

DROP TABLE IF EXISTS `elder_interesting_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elder_interesting_tb` (
  `elder_interesting_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `interesting_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nنوع النشاط المهتم به المسن',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`elder_interesting_id`),
  KEY `FK_Survey_ElderInteresting_idx` (`survey_id`),
  KEY `FK_SubConstant_Elder_Interesting_idx` (`interesting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الأنشطة التي يهتم بها المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_interesting_tb`
--

LOCK TABLES `elder_interesting_tb` WRITE;
/*!40000 ALTER TABLE `elder_interesting_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `elder_interesting_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elder_pariah_tb`
--

DROP TABLE IF EXISTS `elder_pariah_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elder_pariah_tb` (
  `elder_pariah_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nمسلسل',
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبانة',
  `elder_pariah_reason_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nسبب كون المسن منبوذ مثلا: اناني - سليط اللسان - عصبي',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`elder_pariah_id`),
  KEY `FK_SubConstant_ElderPariah_idx` (`elder_pariah_reason_id`),
  KEY `FK_Survey_ElderPariah_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على أسباب كون المسن منبوذ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_pariah_tb`
--

LOCK TABLES `elder_pariah_tb` WRITE;
/*!40000 ALTER TABLE `elder_pariah_tb` DISABLE KEYS */;
INSERT INTO `elder_pariah_tb` VALUES (3,175,206,NULL,NULL),(4,175,207,NULL,NULL),(5,175,210,NULL,NULL),(6,223,207,NULL,NULL),(9,225,206,NULL,NULL),(10,235,206,'2016-01-29 15:40:36',1);
/*!40000 ALTER TABLE `elder_pariah_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elder_room_tb`
--

DROP TABLE IF EXISTS `elder_room_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elder_room_tb` (
  `elder_room_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `home_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nوصف السكن بالتفصيل للمسن',
  `room_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nطبيعة غرفة المسن مثلا:مستقله- مع الأبناء',
  `clothes_covers_status_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nوصف ملابس واغطية المسن',
  `room_ventilation_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nحالة التهوية في غرفة المسن',
  `room_lighting_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nحالة اضاءة الغرفة',
  `has_closet` int(1) DEFAULT NULL COMMENT 'هل يوجد خزانة ملابس',
  `has_good_bed` int(1) DEFAULT NULL COMMENT 'هل يوجد سرير وفرشة مناسبة',
  `has_medicine_cupboard` int(1) DEFAULT NULL COMMENT 'هل يوجد مكان مخصص للأدوية',
  `room_need_maintenance` int(1) DEFAULT NULL COMMENT 'هل الغرفة بحاجة الى صيانة',
  `room_maintenance_details` varchar(45) DEFAULT NULL COMMENT 'توضيح نوع الصيانة التي تحتاجها الغرفة',
  `bathroom_status_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nوصف حالة دورة المياه',
  `bathroom_maintenance_details` varchar(45) DEFAULT NULL COMMENT 'توضيح الصيانة التي تحتاجها دورة المياه',
  `elder_higiene_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالنظافة الشخصية للمسن',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`elder_room_id`),
  KEY `FK_Survey_ElderRoom_idx` (`survey_id`),
  KEY `FK_SubConstant_ElderRoom_Room_idx` (`room_type_id`),
  KEY `FK_SubConstant_ElderRoom_Clothes_idx` (`clothes_covers_status_id`),
  KEY `FK_SubConstant_ElderRoom_Ventilation_idx` (`room_ventilation_id`),
  KEY `FK_SubConstant_ElderRoom_lighting_idx` (`room_lighting_id`),
  KEY `FK_SubConstant_ElderRoom_Bathroom_idx` (`bathroom_status_id`),
  KEY `FK_SubConstant_ElderRoom_Hygiene_idx` (`elder_higiene_id`),
  KEY `FK_SubConstant_ElderRoom_hometype_idx` (`home_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات حالة غرفة المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_room_tb`
--

LOCK TABLES `elder_room_tb` WRITE;
/*!40000 ALTER TABLE `elder_room_tb` DISABLE KEYS */;
INSERT INTO `elder_room_tb` VALUES (1,132,NULL,98,104,107,109,110,110,110,110,NULL,115,NULL,117,NULL,NULL),(2,133,203,97,102,106,108,110,110,110,110,NULL,113,NULL,118,NULL,NULL),(3,134,203,97,104,106,108,111,111,110,110,'صسصصص',116,'يبسشيبسص',118,NULL,NULL),(4,135,203,97,102,106,108,111,111,110,111,'',116,'تلنلنهل',118,NULL,NULL),(5,157,204,98,101,107,108,110,110,111,110,'يبسسبيسبيسي',114,'',117,NULL,NULL),(6,158,204,98,104,107,109,110,111,110,110,'صيانة',115,'يبسيبصسي',118,NULL,NULL),(7,223,203,97,102,106,108,110,110,110,110,'ترميم',113,'',118,NULL,NULL),(8,221,203,97,102,106,108,110,110,110,111,'',113,'',118,NULL,NULL),(9,225,203,97,104,106,108,111,111,111,110,'ترميم وصيانة',115,'صيانة',118,NULL,NULL),(10,230,203,97,104,107,109,111,111,111,110,'ترميم',115,'صيانة',118,NULL,NULL),(11,233,203,97,102,106,108,110,110,110,111,'',114,'',118,NULL,NULL),(12,235,203,97,102,106,108,111,111,111,111,'',113,'',118,'2016-01-29 15:38:10',1);
/*!40000 ALTER TABLE `elder_room_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elder_tb`
--

DROP TABLE IF EXISTS `elder_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elder_tb` (
  `elder_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'رقم هوية المسن',
  `elder_national_id` int(9) DEFAULT NULL COMMENT 'رقم هوية المسن',
  `elder_category_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nتصنيف العضو',
  `first_name` varchar(45) DEFAULT NULL COMMENT 'الاسم الأول',
  `middle_name` varchar(45) DEFAULT NULL COMMENT 'اسم الاب',
  `third_name` varchar(45) DEFAULT NULL COMMENT 'اسم الجد',
  `last_name` varchar(45) DEFAULT NULL COMMENT 'اسم العائلة',
  `dob` date DEFAULT NULL COMMENT 'تاريخ الميلاد',
  `sex_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالجنس',
  `status_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالحالة الاجتماعية',
  `governorate_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالمحافظة',
  `region` int(11) DEFAULT NULL COMMENT 'المنطقة',
  `full_address` int(11) DEFAULT NULL COMMENT 'وصف العنوان بالكامل',
  `address_details` varchar(100) DEFAULT NULL COMMENT 'تفاصيل العنوان',
  `phone` varchar(45) DEFAULT NULL COMMENT 'رقم الهاتف',
  `mobile_first` varchar(45) DEFAULT NULL COMMENT 'رقم الجوال 1',
  `mobile_second` varchar(45) DEFAULT NULL COMMENT 'رقم الجوال 2',
  `education_level_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالمؤهل العلمي',
  `specialization_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالتخصص',
  `current_job_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالعمل الحالي',
  `previous_job_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالعمل السابق',
  `insurance_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nنوع التأمين',
  `death_date` date DEFAULT NULL COMMENT 'تاريخ الوفاة',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`elder_id`),
  KEY `FK_SubConstant_Elder_idx` (`sex_id`),
  KEY `FK_SubConstant_Elser_Status_idx` (`status_id`),
  KEY `FK_SubConstant_Elser_Governorate_idx` (`governorate_id`),
  KEY `FK_SubConstant_Elder_Edu_idx` (`education_level_id`),
  KEY `FK_SubConstant_Elder_Special_idx` (`specialization_id`),
  KEY `FK_SubConstant_Elder_CurJob_idx` (`current_job_id`),
  KEY `FK_SubConstant_Elder_PreJob_idx` (`previous_job_id`),
  KEY `FK_SubConstant_Elder_Insurance_idx` (`insurance_type_id`),
  KEY `FK_SubConstant_Elder_Category_idx` (`elder_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات المسنين';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_tb`
--

LOCK TABLES `elder_tb` WRITE;
/*!40000 ALTER TABLE `elder_tb` DISABLE KEYS */;
INSERT INTO `elder_tb` VALUES (1,905521440,175,'حامد','حامد','حماد','حماد','1890-02-04',1,183,18,217,256,'السكة','028745411','0599486568','0598900000',23,32,49,55,61,'0000-00-00',NULL,NULL),(2,98745632,175,'اكرم ','اكرم','اركم','اكرم','1920-02-03',1,5,20,0,0,NULL,'025857455','0597118444','0587444444',23,0,47,58,62,NULL,NULL,NULL),(3,900333444,175,'محمد','محمد','محمد','محمد','1920-02-03',1,184,18,218,246,'بيت لاهيا','','0599444333','',28,NULL,48,51,9,NULL,NULL,NULL),(4,901111111,176,'عبد الله','محمد','احمد','حسن','1945-01-01',1,5,19,322,237,'المنطار','2822222','0599111222','',27,34,48,51,8,'2015-11-30',NULL,NULL),(5,901232323,175,'عبد الرحمن','محمد','محمود','احمد','1953-01-28',1,184,21,0,0,NULL,'2422344','0599277652','',28,34,48,52,9,NULL,NULL,NULL),(6,901521823,175,'dssfds','ddasd','sdsda','dsasd','1910-02-01',1,183,18,0,0,NULL,'0825874514','0598999148','0598999048',24,0,47,58,62,NULL,NULL,NULL),(7,903333333,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,217,254,'العزبة','2477277','','',24,41,49,50,9,NULL,NULL,NULL),(8,903334445,176,'حسن','حسن','حسن','حسن','1930-01-29',1,5,22,294,295,'رفح','','','',25,NULL,47,55,62,NULL,NULL,NULL),(9,903445663,175,'محمود','موسى','ابراهيم','عثمان','1944-06-06',1,184,21,0,0,NULL,'','','',28,33,48,51,9,NULL,NULL,NULL),(10,903457891,175,'امنة','محمد','عبد الرحمن','حمد','1950-06-21',2,184,18,217,254,'العزبة','','0599111222','',23,NULL,47,NULL,62,NULL,NULL,NULL),(11,903635001,176,'وسيم','محمد','محمد','عابد','1929-02-27',1,184,18,217,254,NULL,'0598999048','0598999148','0258745444',28,32,47,58,62,NULL,NULL,NULL),(12,904555555,175,'عبد الرحمن','محمد','علي','حمد','1940-01-30',1,184,20,221,325,'البريج','','0599111111','',24,NULL,47,50,62,NULL,NULL,NULL),(13,905554443,175,'عامر','ابراهيم','علي','موسى','1945-07-12',1,184,22,294,296,'رفح','','0599444555','',25,NULL,47,55,59,NULL,NULL,NULL),(14,907776665,175,'عبد الرحيم','محمود','عيسى','رجب','1948-10-27',1,184,19,322,232,'تل الهوا','','0599333222','',28,NULL,48,52,9,NULL,NULL,NULL),(15,908123654,175,'g','h','j','j','1941-02-26',1,184,18,217,255,'jhgff','','','',23,NULL,47,56,62,NULL,NULL,NULL),(16,908765432,175,'اسعد','ايمن','اسعد','حمد','1954-02-02',1,184,18,217,254,'بجوار المسجد','','','',23,NULL,47,50,62,NULL,NULL,NULL),(17,908884463,175,'a','b','c','d','1940-01-31',2,184,21,224,293,'kjkj','','','',23,NULL,47,53,62,NULL,NULL,NULL),(18,908887776,175,'ايمن','احمد','حسن','حميد','1930-02-05',1,184,18,219,239,'التوام','','0599876786','',24,NULL,47,58,60,NULL,NULL,NULL),(19,908888887,177,'كمال','جميل','حسن','عيسى','1930-02-04',1,184,20,220,268,'السوارحة','','0599843456','',28,NULL,48,51,8,NULL,NULL,NULL),(20,999999999,175,'اكرم','ابراهيم','سعيد','اسعد','1930-06-19',1,184,21,224,279,'القراره','','0599111111','',25,NULL,47,55,62,NULL,NULL,NULL),(21,222222222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,907654328,175,'عامر','جميل','بكر','بكر','1945-07-12',1,184,19,322,229,'الشاطئ','','0599876789','',25,NULL,47,55,9,NULL,NULL,NULL),(23,989898989,175,'مجاهد','مجاهد','مجاهد','مجاهد','1940-02-06',1,184,21,224,292,'خانيونس','','','',23,NULL,47,55,62,NULL,NULL,NULL),(24,123123123,175,'ا','ا','ا','ا','1950-01-31',1,184,18,217,256,'يؤبسشبيؤ','','','',31,33,49,NULL,9,NULL,NULL,NULL),(25,909090909,175,'حرف1','حرف1','حرف','حرف','1939-11-30',1,5,19,322,228,'الشيخ رضوان','2811111','0599345678','',28,41,48,51,9,NULL,NULL,NULL),(26,907777777,175,'ا','ت','ن','ت','1940-01-30',1,184,20,220,262,'ؤبتىريبسمنت','','','',23,NULL,47,55,59,NULL,NULL,NULL),(27,908888888,176,'ا','ل','خه','ا','1924-06-10',1,184,20,221,325,'لايسنشسلا','','','',23,NULL,47,58,10,NULL,NULL,NULL);
/*!40000 ALTER TABLE `elder_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_tb`
--

DROP TABLE IF EXISTS `employee_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_tb` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'مسلسل',
  `national_id` int(9) DEFAULT '0' COMMENT 'رقم الهوية',
  `emp_id` varchar(45) DEFAULT NULL COMMENT 'الرقم الوظيفي',
  `name` varchar(200) DEFAULT NULL COMMENT 'الاسم',
  `sex_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالجنس',
  `job_title_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالمسمى الوظيفي',
  `mobile` varchar(45) DEFAULT NULL COMMENT 'رقم الجوال',
  `phone` varchar(45) DEFAULT NULL COMMENT 'رقم الهاتف',
  `email` varchar(45) DEFAULT NULL COMMENT 'الايميل',
  `is_active` int(1) DEFAULT NULL COMMENT 'هل الموظف على رأس عمله',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `national_id_UNIQUE` (`national_id`),
  KEY `FK_SubConstant_Employee_idx` (`job_title_id`),
  KEY `FK_SubConstant_Employee_Sex_idx` (`sex_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات الموظفين\nمرتبط بجدول الثوابت';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tb`
--

LOCK TABLES `employee_tb` WRITE;
/*!40000 ALTER TABLE `employee_tb` DISABLE KEYS */;
INSERT INTO `employee_tb` VALUES (1,801064239,'1','احمد',1,3,'0599988776','2822222','admin@gmail.com',1,NULL,NULL),(2,123456789,'4','عمر',1,3,'0599887665','2866655',' omar@gmail.com',1,NULL,NULL),(3,111111112,'333','hh1',2,3,'3333333332','3333332','admin1@gmail.com',1,NULL,NULL),(4,908887779,'2222','test',1,12,'0599765457','','admin@gmail.com',1,'2016-01-29 15:23:27',1);
/*!40000 ALTER TABLE `employee_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_cooperation_tb`
--

DROP TABLE IF EXISTS `family_cooperation_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_cooperation_tb` (
  `family_cooperation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `is_cooperative_family` int(1) DEFAULT NULL COMMENT 'هل الأسرة متعاونة مع الباحث الاجتماعي',
  `cooperative_persone_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nصلة قرابة الشخص الذي استعان به الباحث في حال كانت الاسرة غير متعاونة مثلا: جيران -أقارب-أصدقاء',
  `cooperative_persone_id` int(11) DEFAULT NULL COMMENT 'رقم هوية الشخص الذي استعان به الباحث في حال كانت الاسرة غير متعاونة',
  `cooperative_persone_name` varchar(200) DEFAULT NULL COMMENT 'اسم الشخص الذي استعان به الباحث',
  `cooperative_persone_mobile` varchar(45) DEFAULT NULL COMMENT 'رقم جوال الشخص الذي استعان به الباحث',
  `cooperative_persone_address` varchar(200) DEFAULT NULL COMMENT 'عنوان الشخص الذي استعان به الباحث',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`family_cooperation_id`),
  KEY `FK_Survey_SurveyFamilyDetails_idx` (`survey_id`),
  KEY `FK_SubConstant_SurveyFamilyDetails_idx` (`cooperative_persone_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على تفاصيل متعلقة بتعاون الأسرة مع الباحث ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_cooperation_tb`
--

LOCK TABLES `family_cooperation_tb` WRITE;
/*!40000 ALTER TABLE `family_cooperation_tb` DISABLE KEYS */;
INSERT INTO `family_cooperation_tb` VALUES (1,222,110,316,2147483647,'محمد محمد عابد','undefined','النصر',NULL,NULL),(2,223,111,314,567483456,'جميل محمد صقر','0598999048','النصر-شارع النصر',NULL,NULL),(3,221,110,314,0,'تتتتت','999','اتىنن',NULL,NULL),(4,225,111,314,901234565,'على محمد احمد حمد','0599736483','البريج',NULL,NULL),(5,230,110,NULL,NULL,'','','',NULL,NULL),(6,233,110,NULL,NULL,'','','',NULL,NULL),(7,199,110,NULL,NULL,'','','',NULL,NULL),(8,235,110,NULL,NULL,'','','','2016-01-29 15:41:17',1);
/*!40000 ALTER TABLE `family_cooperation_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_elder_relationship_tb`
--

DROP TABLE IF EXISTS `family_elder_relationship_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_elder_relationship_tb` (
  `family_elder_relationship_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb',
  `respect` int(1) DEFAULT NULL COMMENT 'احترام',
  `pariah` int(1) DEFAULT NULL COMMENT 'متبوذ',
  `care` int(1) DEFAULT NULL COMMENT 'الاهتمام',
  `provision_needs` int(1) DEFAULT NULL,
  `no_provision_needs_reason` varchar(200) DEFAULT NULL COMMENT 'سبب عدم توقير الأسرة لاحتياجات المسن',
  `psychological_support` int(1) DEFAULT NULL COMMENT 'دعم نفسي',
  `legal_advice` int(11) DEFAULT NULL COMMENT 'الحاجة الى عيادة قانونية',
  `legal_advice_reason` varchar(200) DEFAULT NULL COMMENT 'سبب الحاجة الى عيادة قانونية',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`family_elder_relationship_id`),
  KEY `FK_Survey_FamilyElderRelationsip_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='علاقة الأسرة بالمسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_elder_relationship_tb`
--

LOCK TABLES `family_elder_relationship_tb` WRITE;
/*!40000 ALTER TABLE `family_elder_relationship_tb` DISABLE KEYS */;
INSERT INTO `family_elder_relationship_tb` VALUES (1,166,110,111,110,110,'',110,111,'',NULL,NULL),(2,223,110,111,110,111,'عدم توفرها',110,110,'خلافات',NULL,NULL),(3,221,110,110,110,111,'قلة موارد',110,110,'خلافات',NULL,NULL),(4,225,110,110,110,111,'عدم القدرة',111,110,'خلافات اسرية',NULL,NULL),(5,230,110,111,110,111,'قلة امكانيات',110,111,'',NULL,NULL),(6,233,110,111,110,110,'',110,111,'',NULL,NULL),(7,235,111,111,111,110,'',111,111,'','2016-01-29 15:39:44',1);
/*!40000 ALTER TABLE `family_elder_relationship_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_member_tb`
--

DROP TABLE IF EXISTS `family_member_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_member_tb` (
  `family_member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `elder_id` int(11) DEFAULT NULL COMMENT 'FK elder_tb\nرقم هوية المسن',
  `survey_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'رقم هوية الفرد',
  `member_name` varchar(200) DEFAULT NULL COMMENT 'اسم الفرد',
  `member_sex_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nجنس الفرد',
  `relationship_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant\nصلة القرابة',
  `status_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالحالة الاجتماعية',
  `dob` date DEFAULT NULL COMMENT 'تاريخ الميلاد',
  `education_level_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant\nالمستوى التعليمي',
  `health_status_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالحالة الصحية',
  `income_shekel` int(11) DEFAULT NULL COMMENT 'دخل الفرد بالشيكل',
  `job` varchar(45) DEFAULT NULL COMMENT 'مهنة الفرد',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`family_member_id`),
  KEY `FK_Elder_FamilyMember_idx` (`elder_id`),
  KEY `FK_SubConstant_FamilyMember_idx` (`member_sex_id`),
  KEY `FK_SubConstant_FamilyMember_Relation_idx` (`relationship_id`),
  KEY `FK_SubConstant_FamilyMember_Status_idx` (`status_id`),
  KEY `FK_SubConstant_FamilyMember_Edu_idx` (`education_level_id`),
  KEY `FK_SubConstant_FamilyMember_Health_idx` (`health_status_id`),
  KEY `FK_Survey_FamilyMember_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على افراد اسرة المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_member_tb`
--

LOCK TABLES `family_member_tb` WRITE;
/*!40000 ALTER TABLE `family_member_tb` DISABLE KEYS */;
INSERT INTO `family_member_tb` VALUES (1,7,NULL,802222222,'احمد',1,11,5,'2015-11-13',25,66,0,'لا يعمل',NULL,NULL),(2,7,NULL,804444444,'علي',1,179,5,'1980-01-29',28,66,1000,'معلم',NULL,NULL),(3,7,NULL,805555555,'حسن',1,179,5,'1970-05-05',28,66,2000,'تاجر',NULL,NULL),(4,7,NULL,802222222,'احمد',1,11,5,'2015-11-13',25,66,0,'لا يعمل',NULL,NULL),(5,7,NULL,804445554,'محمد احمد',1,179,5,'1979-01-09',28,66,1000,'محاسب',NULL,NULL),(6,7,NULL,804443333,'احمد',1,179,184,'1970-02-03',28,66,1000,'مدرس',NULL,NULL),(7,7,NULL,804445555,'حسن',1,179,184,'1975-07-17',28,66,1000,'مدرس',NULL,NULL),(9,7,NULL,802234661,'حسن',1,179,184,'1990-07-18',28,66,1000,'موظف',NULL,NULL),(10,7,NULL,401111111,'علي',1,181,5,'2000-02-02',25,66,0,'طالب',NULL,NULL),(11,7,NULL,802345678,'علي',1,179,5,'1989-11-30',28,66,100,'محاسب',NULL,NULL),(14,7,NULL,412223334,'موسى محمد أحمد حسن',1,179,5,'2000-06-22',26,66,0,'طالب',NULL,NULL),(15,7,NULL,801111111,'ث',1,179,5,'2015-11-19',23,66,100,'عامل',NULL,NULL),(16,9,NULL,804563456,'موسى محمود',1,179,184,'1979-11-29',28,66,1000,'معلم',NULL,NULL),(17,4,195,803333333,'محمد',1,179,184,'1985-07-18',28,66,1200,'ممرض',NULL,NULL),(18,4,195,905556664,'مريم',2,178,184,'1959-11-26',25,66,0,'ربة منزل',NULL,NULL),(20,4,195,804444444,'علي',1,179,5,'1980-01-29',28,66,1000,'معلم',NULL,NULL),(21,11,223,2147483647,'محمد عبد العاطي عايد',1,179,5,'1974-06-11',23,66,1500,'تاجر',NULL,NULL),(22,11,223,908070605,'محمود عبد العاطي عايد',1,179,184,'1971-07-08',28,66,1000,'محاسب',NULL,NULL),(24,11,223,901125432,'كريمه احمد عايد',2,215,184,'1960-06-21',26,67,0,'ربة  منزل',NULL,NULL),(26,1,221,908765434,'محمد',1,179,5,'1990-06-07',28,66,NULL,'',NULL,NULL),(27,12,225,802222222,'محمد عبد الرحمن محمد حمد',1,179,184,'1980-01-29',28,66,NULL,'ممرض',NULL,NULL),(28,12,225,902345436,'امنة على احمد حمد',2,215,184,'1950-01-31',24,67,NULL,'',NULL,NULL),(29,3,226,801111111,'محمود',1,179,5,'1970-06-24',28,66,NULL,'',NULL,NULL),(30,8,227,908045678,'ايمن',1,11,184,'2016-01-26',23,66,NULL,'',NULL,NULL),(31,18,229,123456543,'محمد',1,179,184,'1985-02-27',26,66,NULL,'ممرض',NULL,NULL),(32,18,229,432345654,'احمد',1,179,184,'1980-06-10',25,66,NULL,'ممرض',NULL,NULL),(33,18,229,432333444,'لما',2,180,5,'1980-06-12',28,66,1000,'ممرض',NULL,NULL),(34,13,230,805554447,'انس عامر ابراهيم موسى',1,179,184,'1970-06-23',28,66,1200,'مدرس',NULL,NULL),(35,13,230,904567654,'امنة على محمد موسى',2,215,184,'1949-01-03',23,67,NULL,'',NULL,NULL),(36,17,235,999999999,'hh',1,179,184,'2015-12-30',28,66,NULL,'','2016-01-29 15:33:31',1),(37,NULL,235,888888888,'محمد',1,179,5,'2016-01-21',24,66,NULL,'','2016-01-30 01:16:42',1),(38,17,235,767676767,'محمد',1,179,5,'2016-01-27',23,66,NULL,'','2016-01-30 01:44:24',1),(39,17,235,564654565,'لييي',1,179,5,'2016-01-21',23,66,1000,'حرفه','2016-01-30 01:45:46',1),(41,23,237,807678987,'نضال',1,179,5,'1970-01-27',28,66,1000,'بائع','2016-01-30 02:48:38',1);
/*!40000 ALTER TABLE `family_member_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_psychological_status_tb`
--

DROP TABLE IF EXISTS `family_psychological_status_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_psychological_status_tb` (
  `family_psychological_status_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `psychological_status_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالحالة النفسية',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`family_psychological_status_id`),
  KEY `FK_SubConstant_FamilyPsychoStatus_idx` (`psychological_status_id`),
  KEY `FK_Survey_FamilyPsychoStatus_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='حالة الاسرة الجتماعية والنفسية';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_psychological_status_tb`
--

LOCK TABLES `family_psychological_status_tb` WRITE;
/*!40000 ALTER TABLE `family_psychological_status_tb` DISABLE KEYS */;
INSERT INTO `family_psychological_status_tb` VALUES (2,167,139,NULL,NULL),(3,168,138,NULL,NULL),(5,168,137,NULL,NULL),(6,169,138,NULL,NULL),(7,223,137,NULL,NULL),(8,223,139,NULL,NULL),(9,223,138,NULL,NULL),(12,221,138,NULL,NULL),(13,225,137,NULL,NULL),(14,230,139,NULL,NULL),(15,230,141,NULL,NULL),(16,233,141,NULL,NULL),(17,235,137,'2016-01-29 15:41:42',1);
/*!40000 ALTER TABLE `family_psychological_status_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_tb`
--

DROP TABLE IF EXISTS `file_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_tb` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم الملف مسلسل',
  `file_doc_id` varchar(100) DEFAULT NULL COMMENT 'رقم الملف الورقي',
  `elder_id` int(11) DEFAULT NULL COMMENT 'FK elder_tb\nرقم هوية المسن',
  `file_status_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nحالة الملف',
  `close_date` date DEFAULT NULL COMMENT 'تاريخ اغلاق الملف',
  `close_reason_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nسبب الاغلاق',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الادخال',
  `created_by` varchar(200) DEFAULT NULL COMMENT 'FK users_tb\nاسم المستخدم الذي ادخل الملف',
  PRIMARY KEY (`file_id`),
  KEY `FK_Elder_File_idx` (`elder_id`),
  KEY `FK_SubConstant_File_idx` (`file_status_id`),
  KEY `FK_Users_File_idx` (`created_by`),
  KEY `FK_SubConstant_File_CloseReason_idx` (`close_reason_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات ملف المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_tb`
--

LOCK TABLES `file_tb` WRITE;
/*!40000 ALTER TABLE `file_tb` DISABLE KEYS */;
INSERT INTO `file_tb` VALUES (1,'A1',4,170,NULL,NULL,NULL,NULL),(6,'A2',7,170,NULL,NULL,NULL,NULL),(7,NULL,9,170,NULL,NULL,NULL,NULL),(8,NULL,5,170,NULL,NULL,NULL,NULL),(9,NULL,6,170,NULL,NULL,NULL,NULL),(10,NULL,1,170,NULL,NULL,NULL,NULL),(11,'A3',2,170,NULL,NULL,NULL,NULL),(12,NULL,11,170,NULL,NULL,NULL,NULL),(13,'12',16,170,NULL,NULL,NULL,NULL),(14,'111',12,170,NULL,NULL,NULL,NULL),(15,'12',3,170,NULL,NULL,NULL,NULL),(16,'14',8,170,NULL,NULL,NULL,NULL),(17,'13',20,170,NULL,NULL,NULL,NULL),(18,'44',18,170,NULL,NULL,NULL,NULL),(19,'15',13,170,NULL,NULL,NULL,NULL),(20,'17',19,170,NULL,NULL,NULL,NULL),(21,'18',14,170,NULL,NULL,NULL,NULL),(22,'118',10,170,NULL,NULL,NULL,NULL),(23,'24',15,170,NULL,NULL,'2016-01-29 11:04:27','1'),(24,'1111',17,170,NULL,NULL,'2016-01-29 15:31:42','1'),(25,'1234',22,170,NULL,NULL,'2016-01-30 02:17:02','1'),(26,'1234',23,170,NULL,NULL,'2016-01-30 02:28:58','1'),(27,'123',24,170,NULL,NULL,'2016-02-08 00:08:47','1'),(28,'أ-12',25,170,NULL,NULL,'2016-03-08 19:39:33','1'),(29,'ا-4',26,170,NULL,NULL,'2016-03-11 19:40:51','1'),(30,'ب2',27,170,NULL,NULL,'2016-03-11 19:45:29','1');
/*!40000 ALTER TABLE `file_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_up_tb`
--

DROP TABLE IF EXISTS `follow_up_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow_up_tb` (
  `follow_up_id` int(11) NOT NULL AUTO_INCREMENT,
  `elder_id` int(11) DEFAULT NULL,
  `researcher_id` int(11) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `visit_time` time DEFAULT NULL,
  `visit_end_time` time DEFAULT NULL,
  `visit_reason` varchar(200) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `recommendation` varchar(200) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`follow_up_id`),
  KEY `FK_Employee_Folloup_Researcher_idx` (`researcher_id`),
  KEY `FK_Elder_Followup_idx` (`elder_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على زيارات المتابعة للمسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_up_tb`
--

LOCK TABLES `follow_up_tb` WRITE;
/*!40000 ALTER TABLE `follow_up_tb` DISABLE KEYS */;
INSERT INTO `follow_up_tb` VALUES (4,7,3,'2015-12-16','19:30:00','19:30:00','متابعة2','تحسن2','تعديل استبانة',NULL,NULL),(5,7,2,'2015-12-25','19:30:00','19:30:00','تفقد','تحسن','متابعة',NULL,NULL),(6,23,1,'2016-01-07','03:35:00','04:35:00','نتىلامنت','تامهالا','خهاتحخهعاه','2016-01-30 03:33:27',1),(8,23,2,'2016-01-15','04:35:00','05:35:00','تالرهعتتت','هعاخهننن','مىكخمننن','2016-01-30 03:36:08',1);
/*!40000 ALTER TABLE `follow_up_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_improvement_recomendation_tb`
--

DROP TABLE IF EXISTS `home_improvement_recomendation_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_improvement_recomendation_tb` (
  `home_improvement_recomendation_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `improvement_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nنوع التحسين',
  `improvement_details` varchar(200) DEFAULT NULL COMMENT 'تفاصيل المساعدة\nفي حال كانت المساعدة تسديد ايجار بيت يكون التفصيل عبارة عن قيمة المساعدة\nفي حال كانت المساعدة اشياء اخرى يكون التفصيل هو تحديد الأشياء الأخرى',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`home_improvement_recomendation_id`),
  KEY `FK_Survey_HomeImprovement_idx` (`survey_id`),
  KEY `FK_SubConstant_HomeImprovement_idx` (`improvement_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على التوصيات الخاصة بتحسين سكن المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_improvement_recomendation_tb`
--

LOCK TABLES `home_improvement_recomendation_tb` WRITE;
/*!40000 ALTER TABLE `home_improvement_recomendation_tb` DISABLE KEYS */;
INSERT INTO `home_improvement_recomendation_tb` VALUES (1,192,169,NULL,NULL,NULL),(2,192,167,NULL,NULL,NULL),(3,204,164,NULL,NULL,NULL),(7,208,164,'',NULL,NULL),(8,208,167,'',NULL,NULL),(9,208,162,'',NULL,NULL),(10,216,164,'',NULL,NULL),(13,216,168,'100',NULL,NULL),(15,216,169,'سرير',NULL,NULL),(16,223,164,'',NULL,NULL),(17,223,162,'',NULL,NULL),(18,223,165,'',NULL,NULL),(19,221,168,'100',NULL,NULL),(20,225,164,'',NULL,NULL),(21,230,164,'',NULL,NULL),(22,230,163,'',NULL,NULL),(23,230,162,'',NULL,NULL),(24,233,164,'',NULL,NULL),(25,235,164,'','2016-01-29 15:44:59',1);
/*!40000 ALTER TABLE `home_improvement_recomendation_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_status_tb`
--

DROP TABLE IF EXISTS `home_status_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_status_tb` (
  `home_status_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `home_situation_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالوضع العام:ممتاز-جيد-متوسط-غير صالح للسكن',
  `home_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nنوع السكن مثل: ملك-اجار',
  `ceiling_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_id\nنوع السقف',
  `ceiling_description` varchar(45) DEFAULT NULL COMMENT 'تحديد نوع السقف في حال لم يكن من ضمن الخيارات: باطون - اسبست',
  `furniture_level_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nمستوى الأثاث',
  `furniture_needs` varchar(45) DEFAULT NULL COMMENT 'اثاث بحاجه له المنزل',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`home_status_id`),
  KEY `FK_Survey_HomeStatus_idx` (`survey_id`),
  KEY `FK_SubConstant_HomeStatus_Situation_idx` (`home_situation_id`),
  KEY `FK_SubConstant_HomeStatus_Type_idx` (`home_type_id`),
  KEY `FK_SubConstant_HomeStatus_Ceiling_idx` (`ceiling_type_id`),
  KEY `FK_SubConstant_HomeStatus_furniture_idx` (`furniture_level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='حالة سكن الأسرة المسن الحالي';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_status_tb`
--

LOCK TABLES `home_status_tb` WRITE;
/*!40000 ALTER TABLE `home_status_tb` DISABLE KEYS */;
INSERT INTO `home_status_tb` VALUES (1,125,83,89,91,NULL,94,NULL,NULL,NULL),(2,126,83,89,92,'جريد',96,'كنب',NULL,NULL),(3,127,85,87,92,'سعف نخيل',96,'سرير',NULL,NULL),(4,129,83,89,91,'',94,'',NULL,NULL),(5,155,83,89,92,'سعف نخيل',94,'',NULL,NULL),(6,155,85,89,91,'',96,'سرير',NULL,NULL),(7,156,85,89,91,'',96,'سرير',NULL,NULL),(8,223,84,87,92,'زنجو',94,'',NULL,NULL),(9,221,83,89,92,'زنجو',96,'فرش',NULL,NULL),(10,230,83,89,91,'',95,'',NULL,NULL),(11,233,83,88,90,'',94,'',NULL,NULL),(12,235,83,89,91,'',94,'','2016-01-29 15:37:01',1);
/*!40000 ALTER TABLE `home_status_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_resources_details_tb`
--

DROP TABLE IF EXISTS `income_resources_details_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_resources_details_tb` (
  `income_resources_details_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `income_resources_id` int(11) DEFAULT NULL COMMENT 'FK income_resources_id\nرقم مجموع الدخل التابع له',
  `resource_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nمصدر الدخل',
  `organization_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nجمعيات خيرية أو مؤسسات دولية',
  `cash_income` int(11) DEFAULT NULL COMMENT 'القيمة المالية للدخل',
  `package_income` varchar(200) DEFAULT NULL COMMENT 'المساعدات العينية',
  `package_cash_value` int(11) DEFAULT NULL COMMENT 'التقييم المالي للمساعدات العينية',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`income_resources_details_id`),
  KEY `FK_SubConstant_IncomeResources_idx` (`resource_id`),
  KEY `FK_IncomeResources_IncomeResourcesDet_idx` (`income_resources_id`),
  KEY `FK_SubConstant_IncomeResourcesDet_Org_idx` (`organization_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على مصادر دخل المسن وعائلته';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_resources_details_tb`
--

LOCK TABLES `income_resources_details_tb` WRITE;
/*!40000 ALTER TABLE `income_resources_details_tb` DISABLE KEYS */;
INSERT INTO `income_resources_details_tb` VALUES (2,4,76,NULL,100,NULL,NULL,NULL,NULL),(3,5,75,212,NULL,'طحين',100,NULL,NULL),(4,6,72,NULL,1000,NULL,NULL,NULL,NULL),(6,7,81,NULL,100,NULL,NULL,NULL,NULL),(7,7,72,NULL,1000,NULL,NULL,NULL,NULL),(9,7,75,214,100,NULL,NULL,NULL,NULL),(11,9,76,NULL,100,NULL,10,NULL,NULL),(12,10,76,NULL,1,'ل',1,NULL,NULL),(18,11,72,NULL,100,NULL,NULL,NULL,NULL),(20,13,72,NULL,1000,NULL,NULL,NULL,NULL),(21,14,75,212,NULL,'طحين',100,NULL,NULL),(24,17,75,213,100,NULL,NULL,NULL,NULL),(25,18,76,NULL,1500,'1000',1000,NULL,NULL),(26,19,75,212,1544,'1000',1874,NULL,NULL),(28,18,72,NULL,1000,NULL,NULL,NULL,NULL),(29,23,76,NULL,100,NULL,NULL,NULL,NULL),(30,25,73,NULL,1000,NULL,NULL,NULL,NULL),(31,26,75,212,1000,'كبون غذائي',100,NULL,NULL),(33,29,72,NULL,1000,NULL,NULL,NULL,NULL),(34,31,74,NULL,100,NULL,NULL,NULL,NULL),(35,33,73,NULL,500,NULL,NULL,NULL,NULL),(36,34,75,212,100,'كبون غذائي',200,NULL,NULL),(37,36,72,NULL,1000,NULL,NULL,NULL,NULL),(38,38,72,NULL,1000,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `income_resources_details_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_resources_tb`
--

DROP TABLE IF EXISTS `income_resources_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_resources_tb` (
  `income_resources_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `total_income` int(11) DEFAULT NULL COMMENT 'المجموع الكلي للدخل',
  `elder_portion` int(11) DEFAULT NULL COMMENT 'حصة المسن من دخل الأسرة',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`income_resources_id`),
  KEY `FK_Survey_IncomeResources_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على مجموع دخل المسن وعائلته';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_resources_tb`
--

LOCK TABLES `income_resources_tb` WRITE;
/*!40000 ALTER TABLE `income_resources_tb` DISABLE KEYS */;
INSERT INTO `income_resources_tb` VALUES (1,181,NULL,NULL,NULL,NULL),(2,181,NULL,NULL,NULL,NULL),(3,182,NULL,NULL,NULL,NULL),(4,182,NULL,NULL,NULL,NULL),(5,182,NULL,NULL,NULL,NULL),(6,182,NULL,NULL,NULL,NULL),(7,183,NULL,NULL,NULL,NULL),(8,185,100,10,NULL,NULL),(9,186,2000,100,NULL,NULL),(10,187,NULL,NULL,NULL,NULL),(11,188,100,10,NULL,NULL),(12,189,NULL,NULL,NULL,NULL),(13,189,NULL,NULL,NULL,NULL),(14,189,NULL,NULL,NULL,NULL),(15,189,NULL,NULL,NULL,NULL),(16,189,NULL,NULL,NULL,NULL),(17,189,NULL,NULL,NULL,NULL),(18,223,NULL,NULL,NULL,NULL),(19,223,NULL,NULL,NULL,NULL),(20,223,14555,1000,NULL,NULL),(21,223,3044,1000,NULL,NULL),(22,223,6918,1000,NULL,NULL),(23,221,100,100,NULL,NULL),(24,221,100,100,NULL,NULL),(25,225,NULL,NULL,NULL,NULL),(26,225,NULL,NULL,NULL,NULL),(27,225,NULL,NULL,NULL,NULL),(28,225,2000,1000,NULL,NULL),(29,226,NULL,NULL,NULL,NULL),(30,226,1000,1000,NULL,NULL),(31,227,NULL,NULL,NULL,NULL),(32,227,100,100,NULL,NULL),(33,230,600,100,NULL,NULL),(34,230,600,100,NULL,NULL),(35,230,600,100,NULL,NULL),(36,232,NULL,NULL,NULL,NULL),(37,232,1000,1000,NULL,NULL),(38,233,NULL,NULL,NULL,NULL),(39,233,1000,500,NULL,NULL);
/*!40000 ALTER TABLE `income_resources_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `life_improvement_tb`
--

DROP TABLE IF EXISTS `life_improvement_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `life_improvement_tb` (
  `life_improvement_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `elder_work_ability_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nقدرة المسن على العمل',
  `elder_work_type` varchar(45) DEFAULT NULL COMMENT 'طبيعة العمل التي يمكن للمسن القيام بها',
  `family_member_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nامكانية تشغيل احد افراد الأسرة أو زوجة',
  `family_work_type` varchar(45) DEFAULT NULL COMMENT 'طبيعة العمل التي يمكن لفرد العائلة القيام به',
  `is_elder_need_training` int(1) DEFAULT NULL COMMENT 'هل يوجد حاجة لتدريب المسن',
  `elder_training_type` varchar(45) DEFAULT NULL COMMENT 'نوع التدريب الذي يحتاجه المسن',
  `can_start_project` int(1) DEFAULT NULL COMMENT 'امكانية عمل مشروع صغير',
  `project_type` varchar(45) DEFAULT NULL COMMENT 'نوع المشروع',
  `project_budget` int(11) DEFAULT NULL COMMENT 'التكلفة المتوقعة لتنفيذ المشروع',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`life_improvement_id`),
  KEY `FK_Survey_LifeImprovement_idx` (`survey_id`),
  KEY `FK_SubConstant_LifeImprovement_idx` (`elder_work_ability_id`),
  KEY `FK_SubConstant_LifeImprovement_Family_idx` (`family_member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات قدرة المسن وعائلته على العمل لتحسين مس';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `life_improvement_tb`
--

LOCK TABLES `life_improvement_tb` WRITE;
/*!40000 ALTER TABLE `life_improvement_tb` DISABLE KEYS */;
INSERT INTO `life_improvement_tb` VALUES (2,179,142,'نجار',NULL,NULL,111,'',111,'',NULL,NULL,NULL),(3,180,142,'بائع',NULL,NULL,111,'',111,'',NULL,NULL,NULL),(4,223,143,'',145,'نجار',110,'مهني',110,'دكان',15000,NULL,NULL),(5,221,143,'',145,'بائع',111,'',110,'صغير',1000,NULL,NULL),(6,225,143,'',145,'نجار',111,'',110,'منجرة',1000,NULL,NULL),(7,230,142,'بائع',NULL,'',111,'',110,'بسطة',1000,NULL,NULL),(8,233,142,'بائع',NULL,'',111,'',111,'',NULL,NULL,NULL),(9,235,142,'jj',NULL,'',111,'',111,'',NULL,'2016-01-29 15:42:33',1),(10,237,142,'نتلان',NULL,'',NULL,'',111,'',NULL,'2016-01-31 22:14:14',1);
/*!40000 ALTER TABLE `life_improvement_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loction_tree_tb`
--

DROP TABLE IF EXISTS `loction_tree_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loction_tree_tb` (
  `loction_tree_id` varchar(45) NOT NULL COMMENT 'رقم شجرة المسؤولية',
  `loction_tree_desc` varchar(45) DEFAULT NULL COMMENT 'وصف شجرة المسؤولية',
  `loction_tree_pairent` varchar(45) DEFAULT NULL COMMENT 'FK location_tree_tb\nالأب',
  PRIMARY KEY (`loction_tree_id`),
  KEY `FK_LocationTree_LocationTree_idx` (`loction_tree_pairent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي شجرة المسؤولية';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loction_tree_tb`
--

LOCK TABLES `loction_tree_tb` WRITE;
/*!40000 ALTER TABLE `loction_tree_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `loction_tree_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_aid_recomendation_tb`
--

DROP TABLE IF EXISTS `medical_aid_recomendation_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medical_aid_recomendation_tb` (
  `medical_aid_recomendation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `medical_aid_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nنوع المساعدة الطبية العينية',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`medical_aid_recomendation_id`),
  KEY `FK_Survey_MedicalAid_idx` (`survey_id`),
  KEY `FK_SubConstant_MedicalAid_idx` (`medical_aid_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT=' جدول يحتوي على توصيات الادارة بالمساعدات الطبية العينية الت';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_aid_recomendation_tb`
--

LOCK TABLES `medical_aid_recomendation_tb` WRITE;
/*!40000 ALTER TABLE `medical_aid_recomendation_tb` DISABLE KEYS */;
INSERT INTO `medical_aid_recomendation_tb` VALUES (2,192,158,NULL,NULL),(3,204,157,NULL,NULL),(4,208,157,NULL,NULL),(5,215,157,NULL,NULL),(6,223,157,NULL,NULL),(7,223,154,NULL,NULL),(8,223,151,NULL,NULL),(10,223,153,NULL,NULL),(11,221,157,NULL,NULL),(12,221,158,NULL,NULL),(13,225,157,NULL,NULL),(14,230,157,NULL,NULL),(15,230,158,NULL,NULL),(16,233,157,NULL,NULL),(17,235,157,'2016-01-29 15:44:34',1);
/*!40000 ALTER TABLE `medical_aid_recomendation_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication_availability_tb`
--

DROP TABLE IF EXISTS `medication_availability_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication_availability_tb` (
  `medication_availability_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nرقم الاستبيان',
  `medicine_name` varchar(45) DEFAULT NULL COMMENT 'اسم الدواء',
  `availability_status_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nحالة توفر الدواء مثلا: متوفر بشكل دائم- متقطع',
  `unavailable_reason` varchar(45) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`medication_availability_id`),
  KEY `FK_Survey_MedicationAvailability_idx` (`survey_id`),
  KEY `FK_SubConstant_MedicationAvailability_idx` (`availability_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الأدوية وحالة توفرها';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_availability_tb`
--

LOCK TABLES `medication_availability_tb` WRITE;
/*!40000 ALTER TABLE `medication_availability_tb` DISABLE KEYS */;
INSERT INTO `medication_availability_tb` VALUES (4,165,'Glocofag',121,'المعبر',NULL,NULL),(5,165,'Amyral',121,'من الخارج',NULL,NULL),(6,223,'بيبيسي كولا',121,'غير متوفر',NULL,NULL),(7,223,'جلاكسي',120,'',NULL,NULL),(9,221,'دواء',120,'',NULL,NULL),(10,225,'دواء',121,'غير متوفر',NULL,NULL),(11,230,'دواء',121,'المعبر',NULL,NULL),(12,233,'دواء',120,'',NULL,NULL),(13,199,'',121,'معبر',NULL,NULL),(14,235,'',120,'','2016-01-29 15:38:42',1);
/*!40000 ALTER TABLE `medication_availability_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication_need_tb`
--

DROP TABLE IF EXISTS `medication_need_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication_need_tb` (
  `medication_need_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `medication_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nنوع العلاج الذي يحتاجه الطبيب مثل:جراحة-أدوية-علاج طبيعي',
  `medication_details` varchar(45) DEFAULT NULL COMMENT 'وصف العلاج المطلوب',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`medication_need_id`),
  KEY `FK_SubConstant_MedicationNeeds_idx` (`medication_type_id`),
  KEY `FK_Survey_MedicationNeed_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على احتياجات المسن العلاجية مثل: جراحة-أدوية-علاج';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_need_tb`
--

LOCK TABLES `medication_need_tb` WRITE;
/*!40000 ALTER TABLE `medication_need_tb` DISABLE KEYS */;
INSERT INTO `medication_need_tb` VALUES (1,160,123,'أدوية',NULL,NULL),(2,160,122,'جراحة',NULL,NULL),(3,161,123,'اااا',NULL,NULL),(5,162,124,'علاج',NULL,NULL),(6,163,123,'jj',NULL,NULL),(7,163,122,'jjj',NULL,NULL),(8,163,124,'jjj',NULL,NULL),(9,163,125,'jjj',NULL,NULL),(11,165,122,'جراحة',NULL,NULL),(12,223,123,'مخدة طبية',NULL,NULL),(14,221,123,'دواء',NULL,NULL),(15,225,123,'دواء',NULL,NULL),(16,230,123,'دواء',NULL,NULL),(17,233,123,'دواء',NULL,NULL),(18,235,123,'kkk','2016-01-29 15:38:49',1),(19,241,123,'','2016-03-11 19:45:58',1);
/*!40000 ALTER TABLE `medication_need_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_page_tb`
--

DROP TABLE IF EXISTS `menu_page_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_page_tb` (
  `menu_page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلس',
  `menu_id` int(11) NOT NULL COMMENT 'FK menu_tb\nرقم القائمة',
  `page_id` int(11) NOT NULL COMMENT 'FK page_tb\nرقم الصفحة',
  PRIMARY KEY (`menu_page_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='جدول يربط الصفحات بالقوائم';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_page_tb`
--

LOCK TABLES `menu_page_tb` WRITE;
/*!40000 ALTER TABLE `menu_page_tb` DISABLE KEYS */;
INSERT INTO `menu_page_tb` VALUES (1,1,1),(2,2,2),(3,2,3),(4,3,4),(5,3,5),(6,3,6),(7,4,7),(8,5,8),(9,5,9),(10,7,10),(11,8,11),(12,9,13),(13,9,14),(14,9,15),(15,9,16),(16,9,17),(17,9,18),(18,9,19),(19,9,20),(20,9,21),(21,9,22),(22,9,23),(23,4,24),(24,4,25),(25,5,26),(26,5,27),(27,9,12);
/*!40000 ALTER TABLE `menu_page_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_tb`
--

DROP TABLE IF EXISTS `menu_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_tb` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `menu_name` varchar(45) DEFAULT NULL COMMENT 'اسم القائمة',
  `menu_order` int(11) DEFAULT NULL,
  `menu_icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على اسماء قوائم البرنامج';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_tb`
--

LOCK TABLES `menu_tb` WRITE;
/*!40000 ALTER TABLE `menu_tb` DISABLE KEYS */;
INSERT INTO `menu_tb` VALUES (1,'الصفحة الرئيسية',1,NULL),(2,'الموظفين',2,'icon-briefcase'),(3,'المستخدمين',3,'icon-user'),(4,'الأعضاء',4,'icon-folder'),(5,'الاستبانة',5,'icon-docs'),(6,'مواعيد البحث الميداني',6,NULL),(7,'ثوابت النظام',7,'icon-settings'),(8,'الرسائل',8,'icon-envelope'),(9,'التقارير',9,'icon-bar-chart');
/*!40000 ALTER TABLE `menu_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_tb`
--

DROP TABLE IF EXISTS `page_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_tb` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `page_title` varchar(45) DEFAULT NULL COMMENT 'اسم الصفحة',
  `page_url` varchar(45) DEFAULT NULL COMMENT 'مسار الصفحة',
  `page_order` int(11) DEFAULT NULL COMMENT 'ترتيب الصفحة',
  `page_icon` varchar(45) DEFAULT NULL,
  `show_in_menue` int(1) DEFAULT NULL COMMENT 'هل يظهر اسم الصفحة في المنيو؟\n1= Yes\n0= No',
  PRIMARY KEY (`page_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي اسماء صفحات البرنامج';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_tb`
--

LOCK TABLES `page_tb` WRITE;
/*!40000 ALTER TABLE `page_tb` DISABLE KEYS */;
INSERT INTO `page_tb` VALUES (1,'الصفحة الرئيسية','pages/home',1,NULL,0),(2,'عرض الموظفين','employee/employees',1,'',1),(3,'اضافة موظف','employee/empform',2,'',1),(4,'عرض المستخدمين','user/users',1,NULL,1),(5,'اضافة مستخدم','user/userform',2,NULL,1),(6,'صلاحيات أنواع المستخدمين','usertypeperm/usertypepermession',3,NULL,1),(7,'عرض الأعضاء','elder/elders',1,NULL,1),(8,'تعبــئة استــبانة','surveycont/survey',1,NULL,1),(9,'عــرض الابحــاث الميـدانية','surveyviewcont/viewsurvey',2,NULL,1),(10,'اضــافة ثـوابت النـظـام','constant/constants',1,NULL,1),(11,'ارسال رسالة','sms/sendsms',1,NULL,1),(12,'تقـرير أعضاء الجمعية','reports/elderinforpt',1,'icon-folder',1),(13,'تقـرير ديموغرافي بأعضاء الجمعية','reports/genderrpt',2,'icon-pie-chart',1),(14,'تقـرير المستوى التعليمي','reports/edurpt',3,'icon-graduation',1),(15,'تقرير الحالة الصحية','reports/elderhealthrpt',4,'icon-heart',1),(16,'تقرير مصــادر الدخل','reports/incomerpt',5,'icon-wallet',1),(17,'تقرير وضع السكن','reports/elderhomerpt',6,'icon-home',1),(18,'تقرير وصف السكن','reports/elderroomrpt',7,'icon-home',1),(19,'تقرير صيانة سكن كبير السن','reports/maintenancerpt',8,'icon-settings',1),(20,'تقرير حالة الأسرة مع المسن','reports/familyelderrelationrpt',9,'icon-users',1),(21,'تقرير التشغيل وتحسين مستوى الأسرة','reports/lifeimprovementrpt',10,'icon-docs',1),(22,'قـرارات وتـوصيات الادارة','reports/aidrecomendationrpt',11,'icon-pencil',1),(23,'تقرير احصائي','reports/statisticalrpt',12,'icon-graph',1),(24,'تعديل ملف العضو','elderfilecont/elderfile',0,NULL,0),(25,'تعديل بيانات العائلة','familycont/familyform',0,NULL,0),(26,'تعديل الاستبانة','surveyupdatecont/surveyupdate',0,NULL,0),(27,'زيارات المتابعة','followupcont/followupform',0,NULL,0);
/*!40000 ALTER TABLE `page_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_receiver_tb`
--

DROP TABLE IF EXISTS `sms_receiver_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_receiver_tb` (
  `sms_receiver_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'رقم مسلسل',
  `sms_id` int(11) DEFAULT NULL COMMENT 'FK sms_tb\nرقم الرسالة',
  `file_id` int(11) DEFAULT NULL COMMENT 'رقم ملف العضو',
  `mobile_num` varchar(45) DEFAULT NULL COMMENT 'رقم الجوال',
  PRIMARY KEY (`sms_receiver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الأعضاء الذين تم ارسال رسائل لهم';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_receiver_tb`
--

LOCK TABLES `sms_receiver_tb` WRITE;
/*!40000 ALTER TABLE `sms_receiver_tb` DISABLE KEYS */;
INSERT INTO `sms_receiver_tb` VALUES (1,1,11,NULL),(2,2,11,NULL),(3,3,10,NULL),(4,3,11,NULL),(6,4,10,NULL),(7,6,10,NULL),(8,7,10,'0599486568'),(9,7,NULL,'0598999048'),(10,8,10,'0599486568'),(11,9,10,'0599486568'),(12,10,10,'0599486568');
/*!40000 ALTER TABLE `sms_receiver_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_tb`
--

DROP TABLE IF EXISTS `sms_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_tb` (
  `sms_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'رقم مسلسل',
  `sms_text` varchar(200) DEFAULT NULL COMMENT 'نص الرسالة',
  `sms_date` datetime DEFAULT NULL COMMENT 'تاريخ ارسال الرسالة',
  `send_by` varchar(45) DEFAULT NULL COMMENT 'اسم المستخدم الذي ارسل الرسالة',
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الرسائل المرسلة الى الأعضاء';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_tb`
--

LOCK TABLES `sms_tb` WRITE;
/*!40000 ALTER TABLE `sms_tb` DISABLE KEYS */;
INSERT INTO `sms_tb` VALUES (1,'لهنلم',NULL,'ah'),(2,'لهنلم','2016-01-17 00:00:00','ah'),(3,'لهنلم','2016-01-17 00:00:00','ah'),(4,'ttt','2016-01-17 00:00:00','ah'),(5,'first','2016-01-18 00:00:00','ah'),(6,'first','2016-01-18 00:00:00','ah'),(7,'رسالة','2016-01-18 00:00:00','ah'),(8,'رساله','2016-01-21 00:00:00','ah'),(9,'jj','2016-01-21 00:00:00','ah'),(10,'uid','2016-01-29 11:01:30','1');
/*!40000 ALTER TABLE `sms_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_constant_tb`
--

DROP TABLE IF EXISTS `sub_constant_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_constant_tb` (
  `sub_constant_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `constant_id` int(11) DEFAULT NULL COMMENT 'FK Constant_TB\nرقم الثابت',
  `sub_constant_name` varchar(45) DEFAULT NULL COMMENT 'وصف تفصيل الثابت',
  `parent_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`sub_constant_id`),
  KEY `CONSTANT_ID_idx` (`constant_id`),
  KEY `FK_CONSTANT_SUBCONSTANTCHILD_idx` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=330 DEFAULT CHARSET=utf8 COMMENT='جدول حتوي تفاصيل الثوابت مثل: ذكر انثى - اعزب متزوج - تامين ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_constant_tb`
--

LOCK TABLES `sub_constant_tb` WRITE;
/*!40000 ALTER TABLE `sub_constant_tb` DISABLE KEYS */;
INSERT INTO `sub_constant_tb` VALUES (1,1,'ذكر',NULL,NULL,NULL),(2,1,'انثى',NULL,NULL,NULL),(3,3,'باحث',NULL,NULL,NULL),(4,3,'كاتب',NULL,NULL,NULL),(5,2,'أعزب',NULL,NULL,NULL),(6,3,'مدير',NULL,NULL,NULL),(7,3,'مساعد باحث',NULL,NULL,NULL),(8,7,'موظف حكومي',NULL,NULL,NULL),(9,7,'تأمين كبار السن',NULL,NULL,NULL),(10,7,'تأمين عمال',NULL,NULL,NULL),(11,4,'أب',NULL,NULL,NULL),(12,3,'اداري',NULL,NULL,NULL),(13,20,'كاتب',NULL,NULL,NULL),(14,20,'صلاحيات باحث',NULL,NULL,NULL),(15,21,'جمعيات',NULL,NULL,NULL),(17,7,'مصاب انتقاضة الاقصى',NULL,NULL,NULL),(18,22,'الشمال',NULL,NULL,NULL),(19,22,'غزة',NULL,NULL,NULL),(20,22,'الوسطى',NULL,NULL,NULL),(21,22,'خانيونس',NULL,NULL,NULL),(22,22,'رفح',NULL,NULL,NULL),(23,23,'أمي',NULL,NULL,NULL),(24,23,'ابتدائي',NULL,NULL,NULL),(25,23,'إعدادي',NULL,NULL,NULL),(26,23,'ثانوي',NULL,NULL,NULL),(27,23,'دبلوم',NULL,NULL,NULL),(28,23,'بكالوريوس',NULL,NULL,NULL),(29,23,'ليسانس',NULL,NULL,NULL),(30,23,'ماجستير',NULL,NULL,NULL),(31,23,'دراسات عليا',NULL,NULL,NULL),(32,24,'إدارة أعمال',NULL,NULL,NULL),(33,24,'محاسبة',NULL,NULL,NULL),(34,24,'تعليم',NULL,NULL,NULL),(35,24,'التجارة',NULL,NULL,NULL),(36,24,'الصحة',NULL,NULL,NULL),(37,24,'الدعم النفسي',NULL,NULL,NULL),(38,24,'العمل المجتمعي',NULL,NULL,NULL),(39,24,'بحث وتخطيط',NULL,NULL,NULL),(40,24,'بناء مؤسسات',NULL,NULL,NULL),(41,24,'زراعة',NULL,NULL,NULL),(42,24,'حقوق',NULL,NULL,NULL),(43,24,'هندسة',NULL,NULL,NULL),(44,24,'تكنولوجيا معلومات',NULL,NULL,NULL),(45,24,'تعليم مهني',NULL,NULL,NULL),(46,24,'تعليم حرفي',NULL,NULL,NULL),(47,25,'بدون',NULL,NULL,NULL),(48,25,'متقاعد',NULL,NULL,NULL),(49,25,'قطاع خاص',NULL,NULL,NULL),(50,26,'مزارع',NULL,NULL,NULL),(51,26,'حكومي',NULL,NULL,NULL),(52,26,'وكالة',NULL,NULL,NULL),(53,26,'خاص',NULL,NULL,NULL),(54,26,'صناعة',NULL,NULL,NULL),(55,26,'حرفة',NULL,NULL,NULL),(56,26,'فني صيانة',NULL,NULL,NULL),(57,26,'شرطة',NULL,NULL,NULL),(58,26,'أجهزة أمنية',NULL,NULL,NULL),(59,7,'شؤون اجتماعية',NULL,NULL,NULL),(60,7,'عسكري',NULL,NULL,NULL),(61,7,'بدون تأمين',NULL,NULL,NULL),(62,7,'بحاجة لتأمين',NULL,NULL,NULL),(63,27,'هوية',NULL,NULL,NULL),(64,27,'شهادة ميلاد',NULL,NULL,NULL),(65,27,'جواز سفر',NULL,NULL,NULL),(66,28,'سليم',NULL,NULL,NULL),(67,28,'مريض',NULL,NULL,NULL),(71,29,'عمل خاص',NULL,NULL,NULL),(72,29,'راتب تقاعد',NULL,NULL,NULL),(73,29,'وكالة الشئون الإجتماعية الحكومية',NULL,NULL,NULL),(74,29,'وكالة الغوث لتشغيل اللاجئين',NULL,NULL,NULL),(75,29,'جمعيات خيرية أهلية / دولية',NULL,NULL,NULL),(76,29,'أملاك وعقارات مدرة للدخل',NULL,NULL,NULL),(77,29,'مساعدات شهرية / أسرى',NULL,NULL,NULL),(78,29,'مساعدات شهرية / جرحى',NULL,NULL,NULL),(79,29,'مساعدات شهرية / شهيد',NULL,NULL,NULL),(80,29,'مساعدات كفالات أيتام',NULL,NULL,NULL),(81,29,'إعالة من الأبناء/ الأقارب',NULL,NULL,NULL),(82,30,'ممتاز',NULL,NULL,NULL),(83,30,'جيد',NULL,NULL,NULL),(84,30,'متوسط',NULL,NULL,NULL),(85,30,'غير صالح للسكن',NULL,NULL,NULL),(86,31,'ملك',NULL,NULL,NULL),(87,31,'إيحار',NULL,NULL,NULL),(88,31,'مع الأقرباء',NULL,NULL,NULL),(89,31,'أرض حكومية',NULL,NULL,NULL),(90,32,'باطون',NULL,NULL,NULL),(91,32,'إسبست / صفيح',NULL,NULL,NULL),(92,32,'غير ذلك',NULL,NULL,NULL),(93,33,'ممتاز',NULL,NULL,NULL),(94,33,'جيد',NULL,NULL,NULL),(95,33,'قديم',NULL,NULL,NULL),(96,33,'ينقص الكثير من الضروريات',NULL,NULL,NULL),(97,34,'غرفة مستقلة',NULL,NULL,NULL),(98,34,'غرفة مع الابناء',NULL,NULL,NULL),(99,34,'مع العائلة بدون مكان مخص',NULL,NULL,NULL),(100,34,'مكان منفصل',NULL,NULL,NULL),(101,35,'ممتازة',NULL,NULL,NULL),(102,35,'جيدة',NULL,NULL,NULL),(103,35,'متواضعة',NULL,NULL,NULL),(104,35,'قديمة',NULL,NULL,NULL),(105,35,'مهلهلة',NULL,NULL,NULL),(106,36,'جيدة',NULL,NULL,NULL),(107,36,'غير جيدة',NULL,NULL,NULL),(108,37,'مضيئة',NULL,NULL,NULL),(109,37,'مظلمة',NULL,NULL,NULL),(110,38,'نعم',NULL,NULL,NULL),(111,38,'لا',NULL,NULL,NULL),(112,39,'ممتاز',NULL,NULL,NULL),(113,39,'جيد',NULL,NULL,NULL),(114,39,'غير مناسب',NULL,NULL,NULL),(115,39,'بحاجة للصيانة',NULL,NULL,NULL),(116,39,'بحاجة للترميم',NULL,NULL,NULL),(117,40,'ممتازة',NULL,NULL,NULL),(118,40,'جيدة',NULL,NULL,NULL),(119,40,'يفتقر للنظافة',NULL,NULL,NULL),(120,41,'متوفر بانتظام',NULL,NULL,NULL),(121,41,'متقطع',NULL,NULL,NULL),(122,42,'جراحة',NULL,NULL,NULL),(123,42,'أدوية',NULL,NULL,NULL),(124,42,'علاج',NULL,NULL,NULL),(125,42,'متابعة خاصة لا يمكن للأسرة توفيرها',NULL,NULL,NULL),(126,43,'انطوائي',NULL,NULL,NULL),(127,43,'مبادر',NULL,NULL,NULL),(128,43,'مشاركة الآخرين',NULL,NULL,NULL),(129,43,'الإهتمام بمن حوله',NULL,NULL,NULL),(130,43,'أناني',NULL,NULL,NULL),(136,44,'منعزلة',NULL,NULL,NULL),(137,44,'مشاركة',NULL,NULL,NULL),(138,44,'عدوانية',NULL,NULL,NULL),(139,44,'متفائلة',NULL,NULL,NULL),(140,44,'منغلقة',NULL,NULL,NULL),(141,44,'منفتحة',NULL,NULL,NULL),(142,45,'قادر',NULL,NULL,NULL),(143,45,'غير قادر',NULL,NULL,NULL),(144,46,'الزوج / ة',NULL,NULL,NULL),(145,46,'أحد أفراد الأسرة',NULL,NULL,NULL),(146,47,'دورية',NULL,NULL,NULL),(147,47,'لمرة واحدة',NULL,NULL,NULL),(148,48,'أغذية',NULL,NULL,NULL),(149,48,'غذاء خاص',NULL,NULL,NULL),(150,49,'كرسي متحرك',NULL,NULL,NULL),(151,49,'سماعة أذن',NULL,NULL,NULL),(152,49,'نظارة',NULL,NULL,NULL),(153,49,'جهاز ضغط',NULL,NULL,NULL),(154,49,'جهاز سكر',NULL,NULL,NULL),(155,49,'عكاز',NULL,NULL,NULL),(156,49,'ووكر',NULL,NULL,NULL),(157,49,'أدوية',NULL,NULL,NULL),(158,49,'جراحة',NULL,NULL,NULL),(159,49,'فحوصات وتحاليل منتظمة',NULL,NULL,NULL),(160,49,'علاج طبيعي',NULL,NULL,NULL),(161,49,'متابعة صحية ميدانية',NULL,NULL,NULL),(162,50,'ترميم غرفة المسن',NULL,NULL,NULL),(163,50,'ترميم حمام / دورة مياه',NULL,NULL,NULL),(164,50,'أثاث البيت الخشبي',NULL,NULL,NULL),(165,50,'أجهزة كهربائية',NULL,NULL,NULL),(166,50,'ملابس',NULL,NULL,NULL),(167,50,'أغطية',NULL,NULL,NULL),(168,50,'تسديد إيجار البيت',NULL,NULL,NULL),(169,50,'أشياء أخرى',NULL,NULL,NULL),(170,51,'فعال',NULL,NULL,NULL),(171,51,'ملغي',NULL,NULL,NULL),(172,51,'مغلق',NULL,NULL,NULL),(173,52,'وفاة',NULL,NULL,NULL),(174,52,'الغاء غضوية',NULL,NULL,NULL),(175,53,'أ',NULL,NULL,NULL),(176,53,'ب',NULL,NULL,NULL),(177,53,'ج',NULL,NULL,NULL),(178,4,'ام',NULL,NULL,NULL),(179,4,'ابن',NULL,NULL,NULL),(180,4,'ابنة',NULL,NULL,NULL),(181,4,'حفيد',NULL,NULL,NULL),(182,2,'مطلق',NULL,NULL,NULL),(183,2,'أرمل',NULL,NULL,NULL),(184,2,'متزوج',NULL,NULL,NULL),(185,54,'الجهاز الهضمي',NULL,NULL,NULL),(186,54,'الجهاز التنفسي',NULL,NULL,NULL),(187,54,'الجهاز العصبي',NULL,NULL,NULL),(188,54,'الجهاز الدوري',NULL,NULL,NULL),(189,54,'الجهاز البولي',NULL,NULL,NULL),(190,54,'أمراض جلدية',NULL,NULL,NULL),(191,54,'زهايمر',NULL,NULL,NULL),(192,54,'النفسي',NULL,NULL,NULL),(193,54,'رعاش',NULL,NULL,NULL),(194,54,'الجهاز العظمي',NULL,NULL,NULL),(195,54,'شلل دماغي',NULL,NULL,NULL),(196,54,'الغدد',NULL,NULL,NULL),(197,54,'السرطان',NULL,NULL,NULL),(198,54,'العيون',NULL,NULL,NULL),(199,54,'إعاقة خلقية',NULL,NULL,NULL),(200,54,'إعاقة نتيجة إصابة  حرب',NULL,NULL,NULL),(201,54,'إعاقة نتيجة حادث',NULL,NULL,NULL),(202,54,'جهاز سمعي',NULL,NULL,NULL),(203,55,'مستقل',NULL,NULL,NULL),(204,55,'مع الأبناء',NULL,NULL,NULL),(205,55,'مع الأقارب',NULL,NULL,NULL),(206,56,'أناني',NULL,NULL,NULL),(207,56,'سليط اللسان',NULL,NULL,NULL),(208,56,'عصبي',NULL,NULL,NULL),(209,56,'مريض',NULL,NULL,NULL),(210,56,'صعب الحركة',NULL,NULL,NULL),(211,43,'منبوذ',NULL,NULL,NULL),(212,57,'UNDP',NULL,NULL,NULL),(213,57,'لجنة الزكاة',NULL,NULL,NULL),(214,57,'سنابل الخير',NULL,NULL,NULL),(215,4,'زوجة',NULL,NULL,NULL),(216,20,'مدير النظام',NULL,NULL,NULL),(217,58,'بيت حانون',18,NULL,NULL),(218,58,'بيت لاهيا',18,NULL,NULL),(219,58,'جباليا',18,NULL,NULL),(220,59,'النصيرات',20,NULL,NULL),(221,59,'البريج',20,NULL,NULL),(222,59,'المغازي',20,NULL,NULL),(223,59,'دير البلح',20,NULL,NULL),(224,60,'القرارة',21,NULL,NULL),(225,60,'القرى الشرقية',21,NULL,NULL),(226,71,'الرمال',322,NULL,NULL),(227,71,'النصر',322,NULL,NULL),(228,71,'الشيخ رضوان',322,NULL,NULL),(229,71,'الشاطئ',322,NULL,NULL),(230,71,'الرمال الجنوبي',322,NULL,NULL),(231,71,'الشيخ عجلين',322,NULL,NULL),(232,71,'تل الهوا',322,NULL,NULL),(233,71,'الصبرة',322,NULL,NULL),(234,71,'الدرج',322,NULL,NULL),(235,71,'الزيتون',322,NULL,NULL),(236,71,'التفاح',322,NULL,NULL),(237,71,'الشجاعية',322,NULL,NULL),(238,62,'عباد الرحمن - الصفطاوي',219,NULL,NULL),(239,62,'الكرامة والتوام',219,NULL,NULL),(240,62,'جباليا البلد',219,NULL,NULL),(241,62,'جباليا النزلة',219,NULL,NULL),(242,62,'جباليا المعسكر',219,NULL,NULL),(243,62,'الفالوجا',219,NULL,NULL),(244,62,'بير النعجة',219,NULL,NULL),(245,62,'تل الزعتر',219,NULL,NULL),(246,63,'بيت لاهيا البلد',218,NULL,NULL),(247,63,'مشروع بيت لاهيا',218,NULL,NULL),(248,63,'مدينة الشيخ زايد',218,NULL,NULL),(249,63,'السلاطين',218,NULL,NULL),(250,63,'السيفة',218,NULL,NULL),(251,63,'العطاطرة',218,NULL,NULL),(252,63,'القرية البدوية',218,NULL,NULL),(253,63,'تل الدهب',218,NULL,NULL),(254,64,'عزبة بيت حانون',217,NULL,NULL),(255,64,'بيت حانون البلد',217,NULL,NULL),(256,64,'منطقة السكة',217,NULL,NULL),(257,64,'المصريين',217,NULL,NULL),(258,64,'الكفارنة',217,NULL,NULL),(259,64,'أبراج الندى',217,NULL,NULL),(260,65,'المخيم الجديد',220,NULL,NULL),(261,65,'أرض المفتي - مخيم 5',220,NULL,NULL),(262,65,'الحساينة',220,NULL,NULL),(263,65,'منطقة مسجد القسام',220,NULL,NULL),(264,65,'بلوك C',220,NULL,NULL),(265,65,'منطقة صيدلية الزهور',220,NULL,NULL),(266,65,'منطقة الوكالة - التموين',220,NULL,NULL),(267,65,'منطقة المدارس - الجنوبية - طريق الزوايدة ',220,NULL,NULL),(268,65,'السوارحة',220,NULL,NULL),(269,65,'قرية الزوايدة',220,NULL,NULL),(270,66,'دير البلح البلد',223,NULL,NULL),(271,66,'دير البلح المعسكر',223,NULL,NULL),(272,66,'دير البلح - المنطقة الشرقية',223,NULL,NULL),(273,66,'وادي السلقا',223,NULL,NULL),(274,66,'حكر الجامع',223,NULL,NULL),(275,66,'البروك',223,NULL,NULL),(276,66,'منطقة النخيل - غرباً',223,NULL,NULL),(277,67,'القرارة - شرقاً',224,NULL,NULL),(278,67,'تبة 86 - منطقة آل النجار - الخط الشرقي',224,NULL,NULL),(279,67,'القرارة غرباً',224,NULL,NULL),(280,67,'خانيونس - البلد',224,NULL,NULL),(281,67,'البلد - الزعاربة',224,NULL,NULL),(282,67,'البلد - المصريين',224,NULL,NULL),(283,67,'السطر الشرقي',224,NULL,NULL),(284,67,'السطر الغربي',224,NULL,NULL),(285,67,'حي الامل',224,NULL,NULL),(286,67,'المعسكر الغربي',224,NULL,NULL),(287,67,'منطقة السد العالي',224,NULL,NULL),(288,67,'منطقة الحاووز',224,NULL,NULL),(289,67,'مواصي خانيونس',224,NULL,NULL),(290,67,'معن',224,NULL,NULL),(291,67,'قيزان النجار',224,NULL,NULL),(292,67,'جورة اللوت',224,NULL,NULL),(293,67,'قاع القرين',224,NULL,NULL),(294,68,'رفح',22,NULL,NULL),(295,74,'رفح البلد',294,NULL,NULL),(296,74,'حي الجنينة',294,NULL,NULL),(297,74,'البرازيل',294,NULL,NULL),(298,74,'سوق الشعرة - ديوان آل قشطة',294,NULL,NULL),(299,74,'منطقة العبور',294,NULL,NULL),(300,74,'الفخاري',294,NULL,NULL),(301,74,'الشوكة',294,NULL,NULL),(302,74,'الصوفة',294,NULL,NULL),(303,74,'منطقة أم النصر - موراج',294,NULL,NULL),(304,74,'خربة العدس',294,NULL,NULL),(305,74,'منطقة المطار',294,NULL,NULL),(306,74,'الشابورة',294,NULL,NULL),(307,74,'مخيم يبنة - عيادة الوكالة',294,NULL,NULL),(308,74,'منطقة الزعاربة',294,NULL,NULL),(309,74,'عريبة والملالحة',294,NULL,NULL),(310,74,'المعسكر الغربي',294,NULL,NULL),(311,74,'تل السلطان',294,NULL,NULL),(312,74,'الإسكان  الغربي - كندا',294,NULL,NULL),(313,74,'مواصي رفح',294,NULL,NULL),(314,69,'أقارب',NULL,NULL,NULL),(315,69,'جيران',NULL,NULL,NULL),(316,69,'أصدقاء',NULL,NULL,NULL),(317,70,'بني سهيلا',225,NULL,NULL),(318,70,'عبسان الصغيرة',225,NULL,NULL),(319,70,'عبسان الكبيرة',225,NULL,NULL),(320,70,'خزاعة',225,NULL,NULL),(321,70,'منطقة الشيخ ناصر',225,NULL,NULL),(322,61,'غزة',19,NULL,NULL),(326,73,'المغازي',222,NULL,NULL),(325,72,'البريج',221,NULL,NULL);
/*!40000 ALTER TABLE `sub_constant_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_elder_info_tb`
--

DROP TABLE IF EXISTS `survey_elder_info_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_elder_info_tb` (
  `survey_elder_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'مسلسل',
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبانة',
  `elder_id` int(9) NOT NULL DEFAULT '0' COMMENT 'رقم هوية المسن',
  `elder_category_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nتصنيف العضو',
  `first_name` varchar(45) DEFAULT NULL COMMENT 'الاسم الأول',
  `middle_name` varchar(45) DEFAULT NULL COMMENT 'اسم الاب',
  `third_name` varchar(45) DEFAULT NULL COMMENT 'اسم الجد',
  `last_name` varchar(45) DEFAULT NULL COMMENT 'اسم العائلة',
  `dob` date DEFAULT NULL COMMENT 'تاريخ الميلاد',
  `sex_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالجنس',
  `status_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالحالة الاجتماعية',
  `governorate_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالمحافظة',
  `region` varchar(45) DEFAULT NULL COMMENT 'المنطقة',
  `full_address` varchar(200) DEFAULT NULL COMMENT 'وصف العنوان بالكامل',
  `phone` varchar(45) DEFAULT NULL COMMENT 'رقم الهاتف',
  `mobile_first` varchar(45) DEFAULT NULL COMMENT 'رقم الجوال 1',
  `mobile_second` varchar(45) DEFAULT NULL COMMENT 'رقم الجوال 2',
  `education_level_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالمؤهل العلمي',
  `specialization_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالتخصص',
  `current_job_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالعمل الحالي',
  `previous_job_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nالعمل السابق',
  `insurance_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nنوع التأمين',
  `death_date` datetime DEFAULT NULL COMMENT 'تاريخ الوفاة',
  PRIMARY KEY (`survey_elder_info_id`),
  KEY `FK_SubConstant_Survey_Elder_idx` (`sex_id`),
  KEY `FK_SubConstant_Survey_Elder_Status_idx` (`status_id`),
  KEY `FK_SubConstant_Survey_Elder_Governorate_idx` (`governorate_id`),
  KEY `FK_SubConstant_Survey_Elder_Edu_idx` (`education_level_id`),
  KEY `FK_SubConstant_Survey_Elder_Special_idx` (`specialization_id`),
  KEY `FK_SubConstant_Survey_Elder_CurJob_idx` (`current_job_id`),
  KEY `FK_SubConstant_Survey_Elder_PreJob_idx` (`previous_job_id`),
  KEY `FK_SubConstant_Survey_Elder_Insurance_idx` (`insurance_type_id`),
  KEY `FK_SubConstant_Survey_Elder_Category_idx` (`elder_category_id`),
  KEY `FK_Survey_Survey_Elder_Info_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات المسنين في استبانة معينة';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_elder_info_tb`
--

LOCK TABLES `survey_elder_info_tb` WRITE;
/*!40000 ALTER TABLE `survey_elder_info_tb` DISABLE KEYS */;
INSERT INTO `survey_elder_info_tb` VALUES (11,11,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(12,12,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(13,13,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(14,14,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(15,15,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(16,16,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(17,17,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(18,18,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(19,19,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(20,20,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(21,21,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(22,22,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(23,23,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(24,24,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(25,25,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(26,26,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(27,27,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(28,28,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(29,29,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(30,30,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(31,31,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(32,32,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(33,33,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(34,34,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(35,35,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(36,36,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(37,37,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(38,38,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(39,39,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(40,40,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(41,41,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(42,42,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(43,43,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(44,44,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(45,45,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(46,46,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(47,47,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(48,48,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(49,49,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(50,50,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(51,51,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(52,52,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(53,53,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(54,54,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(55,55,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(56,56,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(57,57,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(58,58,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(59,59,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(60,60,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(61,61,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(62,62,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(63,63,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(64,64,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(65,65,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(66,66,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(67,67,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(68,68,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(69,69,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(70,70,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(71,71,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(72,72,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(73,73,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(74,74,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(75,75,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(76,76,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(77,77,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(78,78,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(79,79,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(80,80,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(81,81,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(82,82,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(83,83,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(84,84,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(85,85,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(86,86,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(87,87,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(88,88,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(89,89,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(90,90,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(91,91,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(92,92,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(93,93,903445663,175,'محمود','موسى','ابراهيم','عثمان','1944-06-06',1,184,21,'خانيونس','خانيونس','','','',28,33,48,51,9,NULL),(94,94,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(95,95,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(96,96,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(97,97,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(98,98,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(99,99,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(100,100,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(101,101,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(102,102,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(103,103,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(104,104,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(105,105,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(106,106,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(107,107,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(108,108,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(109,109,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(110,110,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(111,111,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(112,112,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(113,113,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(114,114,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(115,115,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(116,116,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(117,117,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(118,118,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(119,119,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(120,120,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(121,121,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(122,122,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(123,123,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(124,124,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(125,125,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(126,126,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(127,127,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(128,128,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(129,129,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(130,130,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(131,131,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(132,132,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(133,133,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(134,134,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(135,135,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(136,136,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(137,137,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(138,138,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(139,139,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(140,140,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(141,141,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(142,142,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(143,143,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(144,144,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(145,145,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(146,146,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(147,147,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(148,148,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(149,149,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(150,150,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(151,151,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(152,152,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(153,153,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(154,154,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(155,155,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(156,156,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(157,157,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(158,158,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(159,159,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(160,160,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(161,161,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(162,162,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(163,163,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(164,164,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(165,165,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(166,166,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(167,167,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(168,168,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(169,169,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(170,170,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(171,171,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(172,172,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(173,173,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(174,174,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(175,175,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(176,176,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(177,177,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(178,178,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(179,179,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(180,180,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(181,181,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(182,182,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(183,183,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(184,184,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(185,185,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(186,186,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(187,187,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(188,188,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(189,189,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(190,190,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(191,191,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(192,192,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(193,193,0,175,'عبد الله','محمد','احمد','حسن','1945-01-01',1,5,19,'الشجاعية','الشجاعية                              ','2822222','0599111222','',27,34,48,51,8,NULL),(194,194,0,175,'عبد الله','محمد','احمد','حسن','1945-01-01',1,5,19,'الشجاعية','الشجاعية                              ','2822222','0599111222','',27,34,48,51,8,NULL),(195,195,0,176,'عبد الله','محمد','احمد','حسن','1945-01-01',1,5,19,'الشجاعية','الشجاعية                              ','2822222','0599111222','',27,34,48,51,8,NULL),(196,196,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(197,197,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(198,198,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(199,199,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(200,200,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(201,201,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(202,202,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(203,203,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(204,204,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(205,205,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(206,206,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(207,207,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(208,208,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(209,209,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(210,210,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(211,211,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(212,212,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(213,213,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(214,214,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(215,215,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(216,216,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(217,217,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(218,218,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(219,219,901232323,175,'عبد الرحمن','محمد','محمود','احمد','1953-01-28',1,184,21,'المواصي','المواصي','2422344','0599277652','',28,34,48,52,9,NULL),(220,220,901521823,175,'dssfds','ddasd','sdsda','dsasd','1910-02-01',1,183,18,'ddsa','asasasasd','0825874514','0598999048','0598999048',24,0,47,58,62,NULL),(221,221,90552144,175,'حامد','حامد','حماد','حماد','1890-02-04',1,183,20,'نننن','مممم','028745411','0598999048','0598900000',23,0,49,55,61,NULL),(222,222,98745632,175,'اكرم ','اكرم','اركم','اكرم','1920-02-03',1,5,20,'نبنبننب','شبيسب','025857455','0598999048','0587444444',23,0,47,58,62,NULL),(223,223,903635001,175,'وسيم','محمد','محمد','عابد','1929-12-17',1,184,18,'217','254','0598999048','0598999048','0258745444',28,32,47,58,62,NULL),(224,224,908765432,175,'اسعد','ايمن','اسعد','حمد','1954-02-02',1,184,18,'217','254','','','',23,NULL,47,50,62,NULL);
/*!40000 ALTER TABLE `survey_elder_info_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_tb`
--

DROP TABLE IF EXISTS `survey_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_tb` (
  `survey_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `file_id` int(11) DEFAULT NULL COMMENT 'FK file_tb\nرقم الملف',
  `visit_date` date DEFAULT NULL,
  `visit_time` time DEFAULT NULL COMMENT 'وقت الزيارة',
  `visit_end_time` time DEFAULT NULL COMMENT 'وقت انتهاء الزيارة',
  `visit_purpose_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nهدف الزيارة',
  `researcher_id` int(11) DEFAULT NULL COMMENT 'FK employee_tb\nرقم هوية الباحث',
  `researcher_assistant_fst_id` int(11) DEFAULT NULL COMMENT 'FK employee_tb\nرقم هوية مساعد الباحث الأول',
  `researcher_assistant_sec_id` int(11) DEFAULT NULL COMMENT 'FK employee_tb\nرقم هوية مساعد الباحث الثاني',
  `researcher_notes` varchar(200) DEFAULT NULL COMMENT 'ملاحظات الباحث',
  `researcher_recommendations` varchar(200) DEFAULT NULL COMMENT 'توصيات الباحث',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الادخال',
  `created_by` varchar(200) DEFAULT NULL COMMENT 'FK users_tb\nاسم المستخدم مدخل البيانات',
  PRIMARY KEY (`survey_id`),
  KEY `FK_File_Survey_idx` (`file_id`),
  KEY `FK_SubConstant_Survey_idx` (`visit_purpose_id`),
  KEY `FK_Employee_Survey_idx` (`researcher_id`),
  KEY `FK_Employee_Survey_AssesFst_idx` (`researcher_assistant_fst_id`),
  KEY `FK_Employee_Survey_AssesSec_idx` (`researcher_assistant_sec_id`),
  KEY `FK_Users_Survey_idx` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على البيانات الاساسية للبحث الميداني';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_tb`
--

LOCK TABLES `survey_tb` WRITE;
/*!40000 ALTER TABLE `survey_tb` DISABLE KEYS */;
INSERT INTO `survey_tb` VALUES (11,6,'2015-11-05','22:50:00','22:50:00',NULL,111111111,801064239,123456789,NULL,NULL,NULL,NULL),(12,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,6,'2015-11-05','00:35:00','00:35:00',NULL,111111111,801064239,NULL,NULL,NULL,NULL,NULL),(22,6,'2015-11-11','11:35:00','11:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(23,6,'2015-11-11','11:35:00','11:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(24,6,'2015-11-24','11:55:00','11:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(25,6,'2015-11-18','12:15:00','12:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(26,6,'2015-11-17','12:25:00','12:25:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(27,6,'2015-11-12','12:30:00','12:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(28,6,'2015-11-11','12:30:00','12:30:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(29,6,'2015-11-20','12:35:00','12:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(30,6,'2015-11-11','13:10:00','13:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(31,6,'2015-11-13','13:15:00','13:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(32,6,'2015-11-12','13:20:00','13:20:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(33,6,'2015-11-11','13:25:00','13:25:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(34,6,'2015-11-12','13:35:00','13:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(35,6,'2015-11-11','13:40:00','13:40:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(36,6,'2015-11-18','13:40:00','13:40:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(37,6,'2015-11-19','13:45:00','13:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(38,6,'2015-11-18','13:50:00','13:50:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(39,6,'2015-11-18','14:10:00','14:10:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(40,6,'2015-11-05','16:00:00','16:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(41,6,'2015-11-05','16:05:00','16:05:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(42,6,'2015-11-12','16:10:00','16:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(43,6,'2015-11-04','16:15:00','16:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(44,6,'2015-11-19','16:15:00','16:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(45,6,'2015-11-18','16:20:00','16:20:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(46,6,'2015-11-18','16:20:00','16:20:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(47,6,'2015-11-17','16:25:00','16:25:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(48,6,'2015-11-19','16:30:00','16:30:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(49,6,'2015-11-17','16:30:00','16:30:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(50,6,'2015-11-11','16:35:00','16:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(51,6,'2015-11-05','16:45:00','16:45:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(52,6,'2015-11-12','18:05:00','18:05:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(53,6,'2015-11-05','18:10:00','18:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(54,6,'2015-11-18','19:10:00','19:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(55,6,'2015-11-05','19:55:00','19:55:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(56,6,'2015-11-19','20:15:00','20:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(57,6,'2015-11-05','21:35:00','21:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(58,6,'2015-11-05','21:40:00','21:40:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(59,6,'2015-11-10','17:30:00','17:30:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(60,6,'2015-11-18','17:35:00','17:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(61,6,'2015-11-18','17:40:00','17:40:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(62,6,'2015-11-11','17:55:00','17:55:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(63,6,'2015-11-11','18:00:00','18:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(64,6,'2015-11-19','18:30:00','18:30:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(65,6,'2015-11-11','18:40:00','18:40:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(66,6,'2015-11-19','19:00:00','19:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(67,6,'2015-11-18','19:10:00','19:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(68,6,'2015-11-04','19:10:00','19:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(69,6,'2015-11-11','19:15:00','19:15:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(70,6,'2015-11-18','19:20:00','19:20:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(71,6,'2015-11-04','19:25:00','19:25:00',NULL,801064239,111111111,NULL,NULL,NULL,NULL,NULL),(72,6,'2015-11-19','19:50:00','19:50:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(73,6,'2015-11-26','19:55:00','19:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(74,6,'2015-11-30','20:40:00','20:40:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(75,6,'2015-11-30','21:00:00','21:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(76,6,'2015-11-11','21:05:00','21:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(77,6,'2015-11-12','21:55:00','21:55:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(78,6,'2015-11-13','22:15:00','22:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(79,6,'2015-11-13','22:25:00','22:25:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(80,6,'2015-11-03','22:30:00','22:30:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(81,6,'2015-11-20','22:30:00','22:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(82,6,'2015-11-19','22:30:00','22:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(83,6,'2015-11-19','22:30:00','22:30:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(84,6,'2015-11-25','22:35:00','22:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(85,6,'2015-11-18','22:35:00','22:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(86,6,'2015-11-26','22:35:00','22:35:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(87,6,'2015-11-25','22:35:00','22:35:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(88,6,'2015-11-25','22:45:00','22:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(89,6,'2015-11-18','22:50:00','22:50:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(90,6,'2015-11-20','22:55:00','22:55:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(91,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,6,'2015-11-03','14:45:00','14:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(93,7,'2015-12-01','20:00:00','19:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(94,6,'2015-12-08','20:30:00','20:30:00',NULL,111111111,801064239,NULL,NULL,NULL,NULL,NULL),(95,6,'2015-12-30','21:00:00','21:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(96,6,'2015-12-24','21:05:00','21:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(97,6,'2015-12-16','21:05:00','21:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(98,6,'2015-12-03','21:05:00','21:05:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(99,6,'2015-12-03','21:10:00','21:10:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(100,6,'2015-12-01','21:10:00','21:10:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(101,6,'2015-12-01','21:15:00','21:15:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(102,6,'2015-12-02','21:15:00','21:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(103,6,'2015-12-01','21:15:00','21:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(104,6,'2015-12-01','21:30:00','21:30:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(105,6,'2015-12-09','21:35:00','21:35:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(106,6,'2015-12-14','21:35:00','21:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(107,6,'2015-12-02','23:05:00','23:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(108,6,'2015-12-16','23:35:00','23:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(109,6,'2015-12-01','23:40:00','23:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(110,6,'2015-12-09','23:40:00','23:40:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(111,6,'2015-12-09','00:05:00','00:05:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(112,6,'2015-12-10','00:15:00','00:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(113,6,'2015-12-09','00:15:00','00:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(114,6,'2015-12-15','00:20:00','00:20:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(115,6,'2015-12-03','00:35:00','00:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(116,6,'2015-12-31','00:40:00','00:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(117,6,'2015-12-10','00:45:00','00:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(118,6,'2015-12-09','18:00:00','18:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(119,6,'2015-12-24','19:50:00','19:50:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(120,6,'2015-12-16','19:55:00','19:55:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(121,6,'2015-12-09','20:00:00','20:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(122,6,'2015-12-22','20:00:00','20:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(123,6,'2015-12-23','20:00:00','20:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(124,6,'2015-12-09','20:05:00','20:05:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(125,6,'2015-12-16','20:05:00','20:05:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(126,6,'2015-12-16','20:55:00','20:55:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(127,6,'2015-12-09','21:00:00','21:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(128,6,'2015-12-16','22:05:00','22:05:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(129,6,'2015-12-23','22:15:00','22:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(130,6,'2015-12-01','19:15:00','19:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(131,6,'2015-12-23','19:25:00','19:25:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(132,6,'2015-12-02','19:40:00','19:40:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(133,6,'2015-12-23','20:00:00','20:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(134,6,'2015-12-17','21:25:00','21:25:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(135,6,'2015-12-11','21:45:00','21:45:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(136,6,'2015-12-17','22:15:00','22:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(137,6,'2015-12-02','22:35:00','22:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(138,6,'2015-12-01','22:50:00','22:50:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(139,6,'2015-12-01','22:55:00','22:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(140,6,'2015-12-02','23:10:00','23:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(141,6,'2015-12-01','23:10:00','23:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(142,6,'2015-12-01','22:25:00','22:25:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(143,6,'2015-12-02','00:35:00','00:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(144,6,'2015-12-09','00:35:00','00:35:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(145,6,'2015-12-09','00:40:00','00:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(146,6,'2015-12-09','00:45:00','00:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(147,6,'2015-12-09','00:55:00','00:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(148,6,'2015-12-09','01:00:00','01:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(149,6,'2015-12-09','01:10:00','01:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(150,6,'2015-12-03','01:10:00','01:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(151,6,'2015-12-16','01:15:00','01:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(152,6,'2015-12-09','18:40:00','18:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(153,6,'2015-12-09','19:20:00','19:20:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(154,6,'2015-12-09','19:25:00','19:25:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(155,6,'2015-12-09','19:30:00','19:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(156,6,'2015-12-10','19:35:00','19:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(157,6,'2015-12-16','20:25:00','20:25:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(158,6,'2015-12-09','20:30:00','20:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(159,6,'2015-12-09','22:30:00','22:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(160,6,'2015-12-09','22:35:00','22:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(161,6,'2015-12-09','22:45:00','22:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(162,6,'2015-12-16','22:45:00','22:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(163,6,'2015-12-15','22:55:00','22:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(164,6,'2015-12-09','23:05:00','23:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(165,6,'2015-12-09','23:05:00','23:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(166,6,'2015-12-09','23:55:00','23:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(167,6,'2015-12-09','00:40:00','00:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(168,6,'2015-12-09','00:40:00','00:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(169,6,'2015-12-16','17:30:00','17:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(170,6,'2015-12-09','19:40:00','19:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(171,6,'2015-12-10','19:45:00','19:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(172,6,'2015-12-11','19:50:00','19:50:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(173,6,'2015-12-09','20:10:00','20:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(174,6,'2015-12-11','20:15:00','20:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(175,6,'2015-12-07','20:15:00','20:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(176,6,'2015-12-08','20:20:00','20:20:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(177,6,'2015-12-10','20:25:00','20:25:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(178,6,'2015-12-10','21:05:00','21:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(179,6,'2015-12-09','21:10:00','21:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(180,6,'2015-12-09','21:35:00','21:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(181,6,'2015-12-31','00:05:00','00:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(182,6,'2015-12-24','00:10:00','00:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(183,6,'2015-12-03','01:00:00','01:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(184,6,'2015-12-10','01:45:00','01:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(185,6,'2015-12-09','02:55:00','02:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(186,6,'2015-12-10','03:00:00','03:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(187,6,'2015-12-31','03:10:00','03:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(188,6,'2015-12-10','03:45:00','03:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(189,6,'2015-12-19','04:10:00','04:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(190,6,'2015-12-17','04:35:00','04:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(191,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(192,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(193,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(194,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(195,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(196,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(197,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(198,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(199,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(200,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(201,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(202,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(203,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(204,6,'2015-12-03','01:45:00','01:45:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(205,6,'2015-12-24','18:10:00','18:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(206,6,'2015-12-15','19:25:00','19:25:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(207,6,'2015-12-08','19:30:00','19:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(208,6,'2015-12-16','19:50:00','19:50:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(209,6,'2015-11-29','20:50:00','20:50:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(210,6,'2015-12-16','21:05:00','21:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(211,6,'2015-11-30','21:10:00','21:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(212,6,'2015-11-30','21:15:00','21:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(213,6,'2015-11-29','21:20:00','21:20:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(214,6,'2015-11-29','21:50:00','21:50:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(215,6,'2015-12-09','22:00:00','22:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(216,6,'2015-12-23','22:05:00','22:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(217,6,'2015-11-29','22:35:00','22:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(218,6,'2015-11-29','22:40:00','22:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(219,8,'2015-12-16','18:00:00','18:00:00',NULL,801064239,123456789,NULL,NULL,NULL,NULL,NULL),(220,9,'2015-12-28','22:45:00','22:45:00',NULL,111111111,801064239,123456789,NULL,NULL,NULL,NULL),(221,10,'2016-01-24','00:30:00','01:30:00',NULL,801064239,111111111,123456789,NULL,NULL,NULL,NULL),(222,11,'2016-01-18','00:40:00','00:40:00',NULL,111111111,801064239,123456789,NULL,NULL,NULL,NULL),(223,12,'2016-01-18','20:00:00','21:00:00',NULL,111111111,801064239,123456789,NULL,NULL,NULL,NULL),(224,13,'2016-01-27','19:15:00','19:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(225,14,'2016-01-13','19:15:00','20:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(226,15,'2016-01-20','20:45:00','21:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(227,16,'2016-01-26','21:40:00','22:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(228,17,'2016-01-21','21:50:00','22:50:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(229,18,'2016-01-05','23:25:00','00:25:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(230,19,'2016-01-23','10:55:00','11:55:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(231,20,'2016-01-27','13:20:00','14:20:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(232,21,'2016-01-28','13:45:00','14:45:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(233,22,'2016-01-06','14:35:00','15:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(234,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-29 11:04:27','1'),(235,24,'2016-01-06','15:30:00','15:30:00',NULL,111111111,NULL,NULL,NULL,NULL,'2016-01-29 15:31:42','1'),(236,25,'2016-01-28','02:15:00','02:15:00',NULL,123456789,NULL,NULL,NULL,NULL,'2016-01-30 02:17:02','1'),(237,26,'2016-01-07','02:30:00','02:30:00',NULL,123456789,NULL,NULL,NULL,NULL,'2016-01-30 02:28:58','1'),(238,27,'2016-02-10','00:10:00','01:10:00',NULL,1,3,2,NULL,NULL,'2016-02-08 00:08:47','1'),(239,28,'2016-03-08','18:40:00','19:40:00',NULL,1,NULL,NULL,NULL,NULL,'2016-03-08 19:39:33','1'),(240,29,'2016-03-09','18:40:00','19:40:00',NULL,1,NULL,NULL,NULL,NULL,'2016-03-11 19:40:51','1'),(241,30,'2016-03-03','18:45:00','19:45:00',NULL,1,NULL,NULL,NULL,NULL,'2016-03-11 19:45:29','1');
/*!40000 ALTER TABLE `survey_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_menu_page_tb`
--

DROP TABLE IF EXISTS `user_menu_page_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_menu_page_tb` (
  `user_menu_page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `menu_page_id` int(11) DEFAULT NULL COMMENT 'FK menu_page_tb\nرقم القائمة والصفحة',
  `user_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nنوع المستخدم مثلا: مدخل بيانات - مدير',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الدخال',
  `created_by` int(11) DEFAULT NULL COMMENT 'FK user_tb\nرقم المستخدم مدخل البيانات',
  PRIMARY KEY (`user_menu_page_id`),
  KEY `FK_MenuPage_UserMenuPage_idx` (`menu_page_id`),
  KEY `FK_SubConstant_UserMenu_idx` (`user_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='جدول حتوي الصفحات والقوائم الخاصة بكل نوع مستخدم';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu_page_tb`
--

LOCK TABLES `user_menu_page_tb` WRITE;
/*!40000 ALTER TABLE `user_menu_page_tb` DISABLE KEYS */;
INSERT INTO `user_menu_page_tb` VALUES (1,1,13,NULL,NULL),(17,1,14,NULL,NULL),(18,2,14,NULL,NULL),(19,3,14,NULL,NULL),(20,1,216,NULL,NULL),(21,2,216,NULL,NULL),(22,3,216,NULL,NULL),(24,4,216,NULL,NULL),(25,5,216,NULL,NULL),(26,6,216,NULL,NULL),(27,7,216,NULL,NULL),(28,8,216,NULL,NULL),(29,9,216,NULL,NULL),(30,10,216,NULL,NULL),(31,11,216,NULL,NULL),(32,12,216,NULL,NULL),(33,13,216,NULL,NULL),(34,14,216,NULL,NULL),(35,15,216,NULL,NULL),(36,16,216,NULL,NULL),(37,17,216,NULL,NULL),(38,18,216,NULL,NULL),(39,19,216,NULL,NULL),(40,20,216,NULL,NULL),(41,21,216,NULL,NULL),(42,22,216,NULL,NULL),(48,24,216,NULL,NULL),(49,26,216,NULL,NULL),(45,25,216,NULL,NULL),(47,23,216,NULL,NULL),(50,27,216,NULL,NULL);
/*!40000 ALTER TABLE `user_menu_page_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_tb`
--

DROP TABLE IF EXISTS `users_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_tb` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK رقم مسلسل',
  `user_name` varchar(200) NOT NULL DEFAULT '' COMMENT 'اسم المستخدم',
  `passward` varchar(45) DEFAULT NULL COMMENT 'كلمة المرور',
  `employee_id` int(11) DEFAULT NULL COMMENT 'FK employee_tb\nالرقم الوظيفي',
  `is_active` int(1) DEFAULT '1' COMMENT 'حساب فعال',
  `user_type_id` int(11) DEFAULT NULL COMMENT 'FK Sub Constant\nنوع المستخدم',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الانشاء',
  `created_by` varchar(200) DEFAULT NULL COMMENT 'FK users_tb\nانشأ بواسطة',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  KEY `FK_SubConstant_Users_idx` (`user_type_id`),
  KEY `FK_Users_Users_idx` (`created_by`),
  KEY `FK_Employee_idx` (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='جدول يجتوي على حسابات المستخدمين للبرنامج';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_tb`
--

LOCK TABLES `users_tb` WRITE;
/*!40000 ALTER TABLE `users_tb` DISABLE KEYS */;
INSERT INTO `users_tb` VALUES (1,'ah','e10adc3949ba59abbe56e057f20f883e',1,1,216,'2016-01-01 23:50:50',NULL),(2,'om','e10adc3949ba59abbe56e057f20f883e',2,1,14,NULL,NULL),(3,'aa','96e79218965eb72c92a549dd5a330112',4,1,13,'2016-01-29 15:24:33','1');
/*!40000 ALTER TABLE `users_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-06 15:05:08
