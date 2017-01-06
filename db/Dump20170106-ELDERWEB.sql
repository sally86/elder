-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: elders_web
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
  PRIMARY KEY (`aids_recomendation_id`),
  KEY `FK_Survey_AidsRecomendation_idx` (`survey_id`),
  KEY `FK_SubConstant_AidsRecomendation_idx` (`cash_aid_type_id`),
  KEY `FK_SubConstant_AidsRecomendation_Nutrition_idx` (`nutrition_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على توصيات الادارة بالمساعدات التي يحتادها المسن';
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على جدولة مواعيد الزيارات للأعضاء';
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
  PRIMARY KEY (`constant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على انواع ثوابت النظام مثلا:الجنس-الحالة الاجتماع';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constant_tb`
--

LOCK TABLES `constant_tb` WRITE;
/*!40000 ALTER TABLE `constant_tb` DISABLE KEYS */;
INSERT INTO `constant_tb` VALUES (1,'الجنس'),(2,'الحالة الاجتماعية'),(3,'المسمى الوظيفي'),(4,'صلة القرابة'),(7,'التأمين الصحي'),(20,'نوع المستخدم'),(21,'مصدر الدخل'),(22,'المحافظات'),(23,'المؤهل العلمي'),(24,'التخصص'),(25,'العمل الحالي'),(26,'العمل السابق'),(27,'نوع المستند'),(28,'الحالة الصحية للفرد'),(29,'مصدر الدخل'),(30,'الوضع العام'),(31,'نوع السكن'),(32,'توع السقف'),(33,'مستوى الأثاث'),(34,'وصف حالة المسن في الأسره'),(35,'وصف ملابس وأغطية المسن'),(36,'تهوية الغرفة'),(37,'إضاءة الغرفة'),(38,'اختيار نعم / لا'),(39,'وصف الحمام / دورة المياه'),(40,'حالة النظافة للمسن نفسه'),(41,'توفير العلاج للمسن'),(42,'نوع العلاج'),(43,'علاقة المسن بالأسرة والمجتمع المحلي'),(44,'حالة أسرة المسن الاجتماعية والنفسية'),(45,'قدرة المسن على العمل'),(46,'إمكانية التشغيل'),(47,'نوع المساعدة المادية'),(48,'نوع التغذية'),(49,'نوع المساعدة الطبية'),(50,'نوع المساعدة لتحسين السكن'),(51,'تـصنيف المـلـف'),(52,'سبب اغلاق الملف'),(53,'تصنيف الحالة'),(54,'الحالة الصحية للمسن'),(55,'وصف سكن المسن'),(56,'سبب نبذ المسن'),(57,'جمعيات خيرية أهلية / دولية'),(58,'محافظة الشمال'),(59,'محافظة الوسطى'),(60,'محافظة خانيونس'),(61,'محافظة غزة'),(62,'مدينة جباليا'),(63,'مدينة بيت لاهيا'),(64,'مدينة بيت حانون'),(65,'مدينة النصيرات'),(66,'مدينة دير البلح'),(67,'مدينة القرارة'),(68,'محافظة رفح'),(69,'الإستعانة بطرف ثاني'),(70,'القرى الشرقية'),(71,'مدينة غزة'),(72,'مدينة البريج'),(73,'مدينة المغازي'),(74,'مدينة رفح');
/*!40000 ALTER TABLE `constant_tb` ENABLE KEYS */;
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
  PRIMARY KEY (`elder_behaviour_id`),
  KEY `FK_Survey_ElderBehaviour_idx` (`survey_id`),
  KEY `FK_SubConstant_ElderBehaviour_idx` (`behaviour_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='علاقة المسن بالاسرة والمجتمع المحلي';
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
  PRIMARY KEY (`elder_disease_det_id`),
  KEY `FK_SubConstant_ElderDisease_idx` (`disease_id`),
  KEY `FK_ElderDisease_ElderDiseaseDet_idx` (`elder_disease_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الامراض التي يعاني منها المسن';
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
  PRIMARY KEY (`elder_disease_id`),
  KEY `FK_Survey_ElderDisease_idx` (`survey_id`),
  KEY `FK_Surv_ElderDisease_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='جدول ماستر يحتوي على تفاصيل مرض المسن';
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
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي صور الأوراق الثبوتية الخاصة بالمسن';
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
  PRIMARY KEY (`elder_pariah_id`),
  KEY `FK_SubConstant_ElderPariah_idx` (`elder_pariah_reason_id`),
  KEY `FK_Survey_ElderPariah_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على أسباب كون المسن منبوذ';
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
  PRIMARY KEY (`elder_room_id`),
  KEY `FK_Survey_ElderRoom_idx` (`survey_id`),
  KEY `FK_SubConstant_ElderRoom_Room_idx` (`room_type_id`),
  KEY `FK_SubConstant_ElderRoom_Clothes_idx` (`clothes_covers_status_id`),
  KEY `FK_SubConstant_ElderRoom_Ventilation_idx` (`room_ventilation_id`),
  KEY `FK_SubConstant_ElderRoom_lighting_idx` (`room_lighting_id`),
  KEY `FK_SubConstant_ElderRoom_Bathroom_idx` (`bathroom_status_id`),
  KEY `FK_SubConstant_ElderRoom_Hygiene_idx` (`elder_higiene_id`),
  KEY `FK_SubConstant_ElderRoom_hometype_idx` (`home_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات حالة غرفة المسن';
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
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `national_id_UNIQUE` (`national_id`),
  KEY `FK_SubConstant_Employee_idx` (`job_title_id`),
  KEY `FK_SubConstant_Employee_Sex_idx` (`sex_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات الموظفين\nمرتبط بجدول الثوابت';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tb`
--

LOCK TABLES `employee_tb` WRITE;
/*!40000 ALTER TABLE `employee_tb` DISABLE KEYS */;
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
  PRIMARY KEY (`family_cooperation_id`),
  KEY `FK_Survey_SurveyFamilyDetails_idx` (`survey_id`),
  KEY `FK_SubConstant_SurveyFamilyDetails_idx` (`cooperative_persone_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على تفاصيل متعلقة بتعاون الأسرة مع الباحث ';
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
  PRIMARY KEY (`family_elder_relationship_id`),
  KEY `FK_Survey_FamilyElderRelationsip_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='علاقة الأسرة بالمسن';
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
  PRIMARY KEY (`family_member_id`),
  KEY `FK_Elder_FamilyMember_idx` (`elder_id`),
  KEY `FK_SubConstant_FamilyMember_idx` (`member_sex_id`),
  KEY `FK_SubConstant_FamilyMember_Relation_idx` (`relationship_id`),
  KEY `FK_SubConstant_FamilyMember_Status_idx` (`status_id`),
  KEY `FK_SubConstant_FamilyMember_Edu_idx` (`education_level_id`),
  KEY `FK_SubConstant_FamilyMember_Health_idx` (`health_status_id`),
  KEY `FK_Survey_FamilyMember_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على افراد اسرة المسن';
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
  PRIMARY KEY (`family_psychological_status_id`),
  KEY `FK_SubConstant_FamilyPsychoStatus_idx` (`psychological_status_id`),
  KEY `FK_Survey_FamilyPsychoStatus_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='حالة الاسرة الجتماعية والنفسية';
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات ملف المسن';
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
  PRIMARY KEY (`follow_up_id`),
  KEY `FK_Employee_Folloup_Researcher_idx` (`researcher_id`),
  KEY `FK_Elder_Followup_idx` (`elder_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على زيارات المتابعة للمسن';
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
  PRIMARY KEY (`home_improvement_recomendation_id`),
  KEY `FK_Survey_HomeImprovement_idx` (`survey_id`),
  KEY `FK_SubConstant_HomeImprovement_idx` (`improvement_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على التوصيات الخاصة بتحسين سكن المسن';
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
  PRIMARY KEY (`home_status_id`),
  KEY `FK_Survey_HomeStatus_idx` (`survey_id`),
  KEY `FK_SubConstant_HomeStatus_Situation_idx` (`home_situation_id`),
  KEY `FK_SubConstant_HomeStatus_Type_idx` (`home_type_id`),
  KEY `FK_SubConstant_HomeStatus_Ceiling_idx` (`ceiling_type_id`),
  KEY `FK_SubConstant_HomeStatus_furniture_idx` (`furniture_level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='حالة سكن الأسرة المسن الحالي';
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
  PRIMARY KEY (`income_resources_details_id`),
  KEY `FK_SubConstant_IncomeResources_idx` (`resource_id`),
  KEY `FK_IncomeResources_IncomeResourcesDet_idx` (`income_resources_id`),
  KEY `FK_SubConstant_IncomeResourcesDet_Org_idx` (`organization_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على مصادر دخل المسن وعائلته';
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
  PRIMARY KEY (`income_resources_id`),
  KEY `FK_Survey_IncomeResources_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على مجموع دخل المسن وعائلته';
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
  PRIMARY KEY (`life_improvement_id`),
  KEY `FK_Survey_LifeImprovement_idx` (`survey_id`),
  KEY `FK_SubConstant_LifeImprovement_idx` (`elder_work_ability_id`),
  KEY `FK_SubConstant_LifeImprovement_Family_idx` (`family_member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات قدرة المسن وعائلته على العمل لتحسين مس';
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
  PRIMARY KEY (`medical_aid_recomendation_id`),
  KEY `FK_Survey_MedicalAid_idx` (`survey_id`),
  KEY `FK_SubConstant_MedicalAid_idx` (`medical_aid_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT=' جدول يحتوي على توصيات الادارة بالمساعدات الطبية العينية الت';
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
  PRIMARY KEY (`medication_availability_id`),
  KEY `FK_Survey_MedicationAvailability_idx` (`survey_id`),
  KEY `FK_SubConstant_MedicationAvailability_idx` (`availability_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الأدوية وحالة توفرها';
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
  PRIMARY KEY (`medication_need_id`),
  KEY `FK_SubConstant_MedicationNeeds_idx` (`medication_type_id`),
  KEY `FK_Survey_MedicationNeed_idx` (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على احتياجات المسن العلاجية مثل: جراحة-أدوية-علاج';
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
  `sms_date` date DEFAULT NULL COMMENT 'تاريخ ارسال الرسالة',
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
  PRIMARY KEY (`sub_constant_id`),
  KEY `CONSTANT_ID_idx` (`constant_id`),
  KEY `FK_CONSTANT_SUBCONSTANTCHILD_idx` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=327 DEFAULT CHARSET=utf8 COMMENT='جدول حتوي تفاصيل الثوابت مثل: ذكر انثى - اعزب متزوج - تامين ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_constant_tb`
--

LOCK TABLES `sub_constant_tb` WRITE;
/*!40000 ALTER TABLE `sub_constant_tb` DISABLE KEYS */;
INSERT INTO `sub_constant_tb` VALUES (1,1,'ذكر',NULL),(2,1,'انثى',NULL),(3,3,'باحث',NULL),(4,3,'كاتب',NULL),(5,2,'أعزب',NULL),(6,3,'مدير',NULL),(7,3,'مساعد باحث',NULL),(8,7,'موظف حكومي',NULL),(9,7,'تأمين كبار السن',NULL),(10,7,'تأمين عمال',NULL),(11,4,'أب',NULL),(12,3,'اداري',NULL),(15,21,'جمعيات',NULL),(17,7,'مصاب انتقاضة الاقصى',NULL),(18,22,'الشمال',NULL),(19,22,'غزة',NULL),(20,22,'الوسطى',NULL),(21,22,'خانيونس',NULL),(22,22,'رفح',NULL),(23,23,'أمي',NULL),(24,23,'ابتدائي',NULL),(25,23,'إعدادي',NULL),(26,23,'ثانوي',NULL),(27,23,'دبلوم',NULL),(28,23,'بكالوريوس',NULL),(29,23,'ليسانس',NULL),(30,23,'ماجستير',NULL),(31,23,'دراسات عليا',NULL),(32,24,'إدارة أعمال',NULL),(33,24,'محاسبة',NULL),(34,24,'تعليم',NULL),(35,24,'التجارة',NULL),(36,24,'الصحة',NULL),(37,24,'الدعم النفسي',NULL),(38,24,'العمل المجتمعي',NULL),(39,24,'بحث وتخطيط',NULL),(40,24,'بناء مؤسسات',NULL),(41,24,'زراعة',NULL),(42,24,'حقوق',NULL),(43,24,'هندسة',NULL),(44,24,'تكنولوجيا معلومات',NULL),(45,24,'تعليم مهني',NULL),(46,24,'تعليم حرفي',NULL),(47,25,'بدون',NULL),(48,25,'متقاعد',NULL),(49,25,'قطاع خاص',NULL),(50,26,'مزارع',NULL),(51,26,'حكومي',NULL),(52,26,'وكالة',NULL),(53,26,'خاص',NULL),(54,26,'صناعة',NULL),(55,26,'حرفة',NULL),(56,26,'فني صيانة',NULL),(57,26,'شرطة',NULL),(58,26,'أجهزة أمنية',NULL),(59,7,'شؤون اجتماعية',NULL),(60,7,'عسكري',NULL),(61,7,'بدون تأمين',NULL),(62,7,'بحاجة لتأمين',NULL),(63,27,'هوية',NULL),(64,27,'شهادة ميلاد',NULL),(65,27,'جواز سفر',NULL),(66,28,'سليم',NULL),(67,28,'مريض',NULL),(71,29,'عمل خاص',NULL),(72,29,'راتب تقاعد',NULL),(73,29,'وكالة الشئون الإجتماعية الحكومية',NULL),(74,29,'وكالة الغوث لتشغيل اللاجئين',NULL),(75,29,'جمعيات خيرية أهلية / دولية',NULL),(76,29,'أملاك وعقارات مدرة للدخل',NULL),(77,29,'مساعدات شهرية / أسرى',NULL),(78,29,'مساعدات شهرية / جرحى',NULL),(79,29,'مساعدات شهرية / شهيد',NULL),(80,29,'مساعدات كفالات أيتام',NULL),(81,29,'إعالة من الأبناء/ الأقارب',NULL),(82,30,'ممتاز',NULL),(83,30,'جيد',NULL),(84,30,'متوسط',NULL),(85,30,'غير صالح للسكن',NULL),(86,31,'ملك',NULL),(87,31,'إيحار',NULL),(88,31,'مع الأقرباء',NULL),(89,31,'أرض حكومية',NULL),(90,32,'باطون',NULL),(91,32,'إسبست / صفيح',NULL),(92,32,'غير ذلك',NULL),(93,33,'ممتاز',NULL),(94,33,'جيد',NULL),(95,33,'قديم',NULL),(96,33,'ينقص الكثير من الضروريات',NULL),(97,34,'غرفة مستقلة',NULL),(98,34,'غرفة مع الابناء',NULL),(99,34,'مع العائلة بدون مكان مخص',NULL),(100,34,'مكان منفصل',NULL),(101,35,'ممتازة',NULL),(102,35,'جيدة',NULL),(103,35,'متواضعة',NULL),(104,35,'قديمة',NULL),(105,35,'مهلهلة',NULL),(106,36,'جيدة',NULL),(107,36,'غير جيدة',NULL),(108,37,'مضيئة',NULL),(109,37,'مظلمة',NULL),(110,38,'نعم',NULL),(111,38,'لا',NULL),(112,39,'ممتاز',NULL),(113,39,'جيد',NULL),(114,39,'غير مناسب',NULL),(115,39,'بحاجة للصيانة',NULL),(116,39,'بحاجة للترميم',NULL),(117,40,'ممتازة',NULL),(118,40,'جيدة',NULL),(119,40,'يفتقر للنظافة',NULL),(120,41,'متوفر بانتظام',NULL),(121,41,'متقطع',NULL),(122,42,'جراحة',NULL),(123,42,'أدوية',NULL),(124,42,'علاج',NULL),(125,42,'متابعة خاصة لا يمكن للأسرة توفيرها',NULL),(126,43,'انطوائي',NULL),(127,43,'مبادر',NULL),(128,43,'مشاركة الآخرين',NULL),(129,43,'الإهتمام بمن حوله',NULL),(130,43,'أناني',NULL),(136,44,'منعزلة',NULL),(137,44,'مشاركة',NULL),(138,44,'عدوانية',NULL),(139,44,'متفائلة',NULL),(140,44,'منغلقة',NULL),(141,44,'منفتحة',NULL),(142,45,'قادر',NULL),(143,45,'غير قادر',NULL),(144,46,'الزوج / ة',NULL),(145,46,'أحد أفراد الأسرة',NULL),(146,47,'دورية',NULL),(147,47,'لمرة واحدة',NULL),(148,48,'أغذية',NULL),(149,48,'غذاء خاص',NULL),(150,49,'كرسي متحرك',NULL),(151,49,'سماعة أذن',NULL),(152,49,'نظارة',NULL),(153,49,'جهاز ضغط',NULL),(154,49,'جهاز سكر',NULL),(155,49,'عكاز',NULL),(156,49,'ووكر',NULL),(157,49,'أدوية',NULL),(158,49,'جراحة',NULL),(159,49,'فحوصات وتحاليل منتظمة',NULL),(160,49,'علاج طبيعي',NULL),(161,49,'متابعة صحية ميدانية',NULL),(162,50,'ترميم غرفة المسن',NULL),(163,50,'ترميم حمام / دورة مياه',NULL),(164,50,'أثاث البيت الخشبي',NULL),(165,50,'أجهزة كهربائية',NULL),(166,50,'ملابس',NULL),(167,50,'أغطية',NULL),(168,50,'تسديد إيجار البيت',NULL),(169,50,'أشياء أخرى',NULL),(170,51,'فعال',NULL),(171,51,'ملغي',NULL),(172,51,'مغلق',NULL),(173,52,'وفاة',NULL),(174,52,'الغاء غضوية',NULL),(175,53,'أ',NULL),(176,53,'ب',NULL),(177,53,'ج',NULL),(178,4,'ام',NULL),(179,4,'ابن',NULL),(180,4,'ابنة',NULL),(181,4,'حفيد',NULL),(182,2,'مطلق',NULL),(183,2,'أرمل',NULL),(184,2,'متزوج',NULL),(185,54,'الجهاز الهضمي',NULL),(186,54,'الجهاز التنفسي',NULL),(187,54,'الجهاز العصبي',NULL),(188,54,'الجهاز الدوري',NULL),(189,54,'الجهاز البولي',NULL),(190,54,'أمراض جلدية',NULL),(191,54,'زهايمر',NULL),(192,54,'النفسي',NULL),(193,54,'رعاش',NULL),(194,54,'الجهاز العظمي',NULL),(195,54,'شلل دماغي',NULL),(196,54,'الغدد',NULL),(197,54,'السرطان',NULL),(198,54,'العيون',NULL),(199,54,'إعاقة خلقية',NULL),(200,54,'إعاقة نتيجة إصابة  حرب',NULL),(201,54,'إعاقة نتيجة حادث',NULL),(202,54,'جهاز سمعي',NULL),(203,55,'مستقل',NULL),(204,55,'مع الأبناء',NULL),(205,55,'مع الأقارب',NULL),(206,56,'أناني',NULL),(207,56,'سليط اللسان',NULL),(208,56,'عصبي',NULL),(209,56,'مريض',NULL),(210,56,'صعب الحركة',NULL),(211,43,'منبوذ',NULL),(212,57,'UNDP',NULL),(213,57,'لجنة الزكاة',NULL),(214,57,'سنابل الخير',NULL),(215,4,'زوجة',NULL),(216,20,'مدير النظام',NULL),(217,58,'بيت حانون',18),(218,58,'بيت لاهيا',18),(219,58,'جباليا',18),(220,59,'النصيرات',20),(221,59,'البريج',20),(222,59,'المغازي',20),(223,59,'دير البلح',20),(224,60,'القرارة',21),(225,60,'القرى الشرقية',21),(226,71,'الرمال',322),(227,71,'النصر',322),(228,71,'الشيخ رضوان',322),(229,71,'الشاطئ',322),(230,71,'الرمال الجنوبي',322),(231,71,'الشيخ عجلين',322),(232,71,'تل الهوا',322),(233,71,'الصبرة',322),(234,71,'الدرج',322),(235,71,'الزيتون',322),(236,71,'التفاح',322),(237,71,'الشجاعية',322),(238,62,'عباد الرحمن - الصفطاوي',219),(239,62,'الكرامة والتوام',219),(240,62,'جباليا البلد',219),(241,62,'جباليا النزلة',219),(242,62,'جباليا المعسكر',219),(243,62,'الفالوجا',219),(244,62,'بير النعجة',219),(245,62,'تل الزعتر',219),(246,63,'بيت لاهيا البلد',218),(247,63,'مشروع بيت لاهيا',218),(248,63,'مدينة الشيخ زايد',218),(249,63,'السلاطين',218),(250,63,'السيفة',218),(251,63,'العطاطرة',218),(252,63,'القرية البدوية',218),(253,63,'تل الدهب',218),(254,64,'عزبة بيت حانون',217),(255,64,'بيت حانون البلد',217),(256,64,'منطقة السكة',217),(257,64,'المصريين',217),(258,64,'الكفارنة',217),(259,64,'أبراج الندى',217),(260,65,'المخيم الجديد',220),(261,65,'أرض المفتي - مخيم 5',220),(262,65,'الحساينة',220),(263,65,'منطقة مسجد القسام',220),(264,65,'بلوك C',220),(265,65,'منطقة صيدلية الزهور',220),(266,65,'منطقة الوكالة - التموين',220),(267,65,'منطقة المدارس - الجنوبية - طريق الزوايدة ',220),(268,65,'السوارحة',220),(269,65,'قرية الزوايدة',220),(270,66,'دير البلح البلد',223),(271,66,'دير البلح المعسكر',223),(272,66,'دير البلح - المنطقة الشرقية',223),(273,66,'وادي السلقا',223),(274,66,'حكر الجامع',223),(275,66,'البروك',223),(276,66,'منطقة النخيل - غرباً',223),(277,67,'القرارة - شرقاً',224),(278,67,'تبة 86 - منطقة آل النجار - الخط الشرقي',224),(279,67,'القرارة غرباً',224),(280,67,'خانيونس - البلد',224),(281,67,'البلد - الزعاربة',224),(282,67,'البلد - المصريين',224),(283,67,'السطر الشرقي',224),(284,67,'السطر الغربي',224),(285,67,'حي الامل',224),(286,67,'المعسكر الغربي',224),(287,67,'منطقة السد العالي',224),(288,67,'منطقة الحاووز',224),(289,67,'مواصي خانيونس',224),(290,67,'معن',224),(291,67,'قيزان النجار',224),(292,67,'جورة اللوت',224),(293,67,'قاع القرين',224),(294,68,'رفح',22),(295,74,'رفح البلد',294),(296,74,'حي الجنينة',294),(297,74,'البرازيل',294),(298,74,'سوق الشعرة - ديوان آل قشطة',294),(299,74,'منطقة العبور',294),(300,74,'الفخاري',294),(301,74,'الشوكة',294),(302,74,'الصوفة',294),(303,74,'منطقة أم النصر - موراج',294),(304,74,'خربة العدس',294),(305,74,'منطقة المطار',294),(306,74,'الشابورة',294),(307,74,'مخيم يبنة - عيادة الوكالة',294),(308,74,'منطقة الزعاربة',294),(309,74,'عريبة والملالحة',294),(310,74,'المعسكر الغربي',294),(311,74,'تل السلطان',294),(312,74,'الإسكان  الغربي - كندا',294),(313,74,'مواصي رفح',294),(314,69,'أقارب',NULL),(315,69,'جيران',NULL),(316,69,'أصدقاء',NULL),(317,70,'بني سهيلا',225),(318,70,'عبسان الصغيرة',225),(319,70,'عبسان الكبيرة',225),(320,70,'خزاعة',225),(321,70,'منطقة الشيخ ناصر',225),(322,61,'غزة',19),(326,73,'المغازي',222),(325,72,'البريج',221);
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
) ENGINE=MyISAM AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على البيانات الاساسية للبحث الميداني';
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
  PRIMARY KEY (`user_menu_page_id`),
  KEY `FK_MenuPage_UserMenuPage_idx` (`menu_page_id`),
  KEY `FK_SubConstant_UserMenu_idx` (`user_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='جدول حتوي الصفحات والقوائم الخاصة بكل نوع مستخدم';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu_page_tb`
--

LOCK TABLES `user_menu_page_tb` WRITE;
/*!40000 ALTER TABLE `user_menu_page_tb` DISABLE KEYS */;
INSERT INTO `user_menu_page_tb` VALUES (1,1,13),(17,1,14),(18,2,14),(19,3,14),(20,1,216),(21,2,216),(22,3,216),(24,4,216),(25,5,216),(26,6,216),(27,7,216),(28,8,216),(29,9,216),(30,10,216),(31,11,216),(32,12,216),(33,13,216),(34,14,216),(35,15,216),(36,16,216),(37,17,216),(38,18,216),(39,19,216),(40,20,216),(41,21,216),(42,22,216),(48,24,216),(49,26,216),(45,25,216),(47,23,216),(50,27,216);
/*!40000 ALTER TABLE `user_menu_page_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_tb`
--

DROP TABLE IF EXISTS `users_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_tb` (
  `user_name` varchar(200) NOT NULL DEFAULT '' COMMENT 'اسم المستخدم',
  `passward` varchar(45) DEFAULT NULL COMMENT 'كلمة المرور',
  `employee_id` int(11) DEFAULT NULL COMMENT 'FK employee_tb\nالرقم الوظيفي',
  `is_active` int(1) DEFAULT '1' COMMENT 'حساب فعال',
  `user_type_id` int(11) DEFAULT NULL COMMENT 'FK Sub Constant\nنوع المستخدم',
  `created_on` datetime DEFAULT NULL COMMENT 'تاريخ الانشاء',
  `created_by` varchar(200) DEFAULT NULL COMMENT 'FK users_tb\nانشأ بواسطة',
  PRIMARY KEY (`user_name`),
  KEY `FK_SubConstant_Users_idx` (`user_type_id`),
  KEY `FK_Users_Users_idx` (`created_by`),
  KEY `FK_Employee_idx` (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='جدول يجتوي على حسابات المستخدمين للبرنامج';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_tb`
--

LOCK TABLES `users_tb` WRITE;
/*!40000 ALTER TABLE `users_tb` DISABLE KEYS */;
INSERT INTO `users_tb` VALUES ('admin','d418a6ccd2439e522fb1995508591975',4,1,216,NULL,NULL);
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

-- Dump completed on 2017-01-06 15:06:18
