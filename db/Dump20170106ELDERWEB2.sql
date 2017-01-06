-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: elders_web2
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على كافة العمليات التي يتم اجراءها على الداتابيز';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_tracking_tb`
--

LOCK TABLES `data_tracking_tb` WRITE;
/*!40000 ALTER TABLE `data_tracking_tb` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات المسنين';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_tb`
--

LOCK TABLES `elder_tb` WRITE;
/*!40000 ALTER TABLE `elder_tb` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات الموظفين\nمرتبط بجدول الثوابت';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tb`
--

LOCK TABLES `employee_tb` WRITE;
/*!40000 ALTER TABLE `employee_tb` DISABLE KEYS */;
INSERT INTO `employee_tb` VALUES (4,901111111,'1','م. أسامة قاسم',1,6,'0599000000','','admin@gmail.com',1,NULL,NULL),(5,801154998,'111','غسان محمد الغزالي',1,3,'0599218966','2853249','ghasan_1990@hotmail.com',1,NULL,NULL),(6,801154997,'111','محمد أحمد',1,3,'0599218966','2853249','ghasan_1990@hotmail.com',1,NULL,NULL),(7,111111111,'2','محمد أحمد عيسى',1,7,'0599218966','2853249','ghasan_1990@hotmail.com',1,NULL,NULL);
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
  `file_doc_id` int(11) DEFAULT NULL COMMENT 'رقم الملف الورقي',
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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات ملف المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_tb`
--

LOCK TABLES `file_tb` WRITE;
/*!40000 ALTER TABLE `file_tb` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على احتياجات المسن العلاجية مثل: جراحة-أدوية-علاج';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_need_tb`
--

LOCK TABLES `medication_need_tb` WRITE;
/*!40000 ALTER TABLE `medication_need_tb` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الأعضاء الذين تم ارسال رسائل لهم';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_receiver_tb`
--

LOCK TABLES `sms_receiver_tb` WRITE;
/*!40000 ALTER TABLE `sms_receiver_tb` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الرسائل المرسلة الى الأعضاء';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_tb`
--

LOCK TABLES `sms_tb` WRITE;
/*!40000 ALTER TABLE `sms_tb` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=328 DEFAULT CHARSET=utf8 COMMENT='جدول حتوي تفاصيل الثوابت مثل: ذكر انثى - اعزب متزوج - تامين ';
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
) ENGINE=MyISAM AUTO_INCREMENT=238 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على البيانات الاساسية للبحث الميداني';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_tb`
--

LOCK TABLES `survey_tb` WRITE;
/*!40000 ALTER TABLE `survey_tb` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='جدول حتوي الصفحات والقوائم الخاصة بكل نوع مستخدم';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu_page_tb`
--

LOCK TABLES `user_menu_page_tb` WRITE;
/*!40000 ALTER TABLE `user_menu_page_tb` DISABLE KEYS */;
INSERT INTO `user_menu_page_tb` VALUES (1,1,13,NULL,NULL),(17,1,14,NULL,NULL),(18,2,14,NULL,NULL),(19,3,14,NULL,NULL),(20,1,216,NULL,NULL),(21,2,216,NULL,NULL),(22,3,216,NULL,NULL),(24,4,216,NULL,NULL),(25,5,216,NULL,NULL),(26,6,216,NULL,NULL),(27,7,216,NULL,NULL),(28,8,216,NULL,NULL),(29,9,216,NULL,NULL),(30,10,216,NULL,NULL),(31,11,216,NULL,NULL),(32,12,216,NULL,NULL),(33,13,216,NULL,NULL),(34,14,216,NULL,NULL),(35,15,216,NULL,NULL),(36,16,216,NULL,NULL),(37,17,216,NULL,NULL),(38,18,216,NULL,NULL),(39,19,216,NULL,NULL),(40,20,216,NULL,NULL),(41,21,216,NULL,NULL),(42,22,216,NULL,NULL),(48,24,216,NULL,NULL),(49,26,216,NULL,NULL),(45,25,216,NULL,NULL),(47,23,216,NULL,NULL),(50,27,216,NULL,NULL),(65,1,328,NULL,NULL),(66,7,328,NULL,NULL),(67,8,328,NULL,NULL),(68,1,327,NULL,NULL),(69,7,327,NULL,NULL),(70,27,327,NULL,NULL),(71,12,327,NULL,NULL),(72,13,327,NULL,NULL),(73,14,327,NULL,NULL),(74,15,327,NULL,NULL),(75,16,327,NULL,NULL),(76,17,327,NULL,NULL),(77,18,327,NULL,NULL),(78,19,327,NULL,NULL),(79,20,327,NULL,NULL),(80,21,327,NULL,NULL),(81,22,327,NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='جدول يجتوي على حسابات المستخدمين للبرنامج';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_tb`
--

LOCK TABLES `users_tb` WRITE;
/*!40000 ALTER TABLE `users_tb` DISABLE KEYS */;
INSERT INTO `users_tb` VALUES (4,'admin','d418a6ccd2439e522fb1995508591975',4,1,216,NULL,NULL),(5,'adminm','e10adc3949ba59abbe56e057f20f883e',0,1,216,NULL,NULL),(6,'admmin','6cda0dbadd1aff46ed9b89a0882dc211',0,1,328,NULL,NULL),(7,'ghasan','6cda0dbadd1aff46ed9b89a0882dc211',0,1,327,NULL,NULL),(8,'111','96e79218965eb72c92a549dd5a330112',0,1,327,NULL,NULL),(9,'ghassan','e10adc3949ba59abbe56e057f20f883e',5,1,216,NULL,NULL),(10,'mohammed','6cda0dbadd1aff46ed9b89a0882dc211',0,1,327,NULL,NULL),(11,'mohammad','6cda0dbadd1aff46ed9b89a0882dc211',6,1,327,NULL,NULL),(12,'ahmed','e10adc3949ba59abbe56e057f20f883e',7,1,327,NULL,NULL);
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

-- Dump completed on 2017-01-06 15:07:12
