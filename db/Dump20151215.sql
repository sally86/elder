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
  PRIMARY KEY (`aids_recomendation_id`),
  KEY `FK_Survey_AidsRecomendation_idx` (`survey_id`),
  KEY `FK_SubConstant_AidsRecomendation_idx` (`cash_aid_type_id`),
  KEY `FK_SubConstant_AidsRecomendation_Nutrition_idx` (`nutrition_type_id`),
  CONSTRAINT `FK_SubConstant_AidsRecomendation` FOREIGN KEY (`cash_aid_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_AidsRecomendation_Nutrition` FOREIGN KEY (`nutrition_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_AidsRecomendation` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على توصيات الادارة بالمساعدات التي يحتادها المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aids_recomendation_tb`
--

LOCK TABLES `aids_recomendation_tb` WRITE;
/*!40000 ALTER TABLE `aids_recomendation_tb` DISABLE KEYS */;
INSERT INTO `aids_recomendation_tb` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,204,147,100,'نفسي','اجتماعي','ترفيه',148,'غذاء');
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
  KEY `FK_Elder_Appointment_idx` (`elder_id`),
  CONSTRAINT `FK_Elder_Appointment` FOREIGN KEY (`elder_id`) REFERENCES `elder_tb` (`elder_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Employee_Appojntment` FOREIGN KEY (`researcher_id`) REFERENCES `employee_tb` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على جدولة مواعيد الزيارات للأعضاء';
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على انواع ثوابت النظام مثلا:الجنس-الحالة الاجتماعية-انواع التأمين ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constant_tb`
--

LOCK TABLES `constant_tb` WRITE;
/*!40000 ALTER TABLE `constant_tb` DISABLE KEYS */;
INSERT INTO `constant_tb` VALUES (1,'الجنس'),(2,'الحالة الاجتماعية'),(3,'المسمى الوظيفي'),(4,'صلة القرابة'),(7,'التأمين الصحي'),(20,'نوع المستخدم'),(21,'مصدر الدخل'),(22,'المحافظات'),(23,'المؤهل العلمي'),(24,'التخصص'),(25,'العمل الحالي'),(26,'العمل السابق'),(27,'نوع المستند'),(28,'الحالة الصحية للفرد'),(29,'مصدر الدخل'),(30,'الوضع العام'),(31,'نوع السكن'),(32,'توع السقف'),(33,'مستوى الأثاث'),(34,'وصف حالة المسن في الأسره'),(35,'وصف ملابس وأغطية المسن'),(36,'تهوية الغرفة'),(37,'إضاءة الغرفة'),(38,'اختيار نعم / لا'),(39,'وصف الحمام / دورة المياه'),(40,'حالة النظافة للمسن نفسه'),(41,'توفير العلاج للمسن'),(42,'نوع العلاج'),(43,'علاقة المسن بالأسرة والمجتمع المحلي'),(44,'حالة أسرة المسن الاجتماعية والنفسية'),(45,'قدرة المسن على العمل'),(46,'إمكانية التشغيل'),(47,'نوع المساعدة المادية'),(48,'نوع التغذية'),(49,'نوع المساعدة الطبية'),(50,'نوع المساعدة لتحسين السكن'),(51,'تـصنيف المـلـف'),(52,'سبب اغلاق الملف'),(53,'تصنيف الحالة'),(54,'الحالة الصحية للمسن'),(55,'وصف سكن المسن'),(56,'سبب نبذ المسن'),(57,'جمعيات خيرية أهلية / دولية');
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
  KEY `FK_SubConstant_ElderBehaviour_idx` (`behaviour_id`),
  CONSTRAINT `FK_SubConstant_ElderBehaviour` FOREIGN KEY (`behaviour_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_ElderBehaviour` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='علاقة المسن بالاسرة والمجتمع المحلي';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_behaviour_tb`
--

LOCK TABLES `elder_behaviour_tb` WRITE;
/*!40000 ALTER TABLE `elder_behaviour_tb` DISABLE KEYS */;
INSERT INTO `elder_behaviour_tb` VALUES (2,170,129),(4,171,129),(5,171,211),(6,172,130),(7,172,211),(8,173,130),(9,174,130),(11,175,130),(12,175,211),(15,176,130),(16,176,211);
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
  KEY `FK_ElderDisease_ElderDiseaseDet_idx` (`elder_disease_id`),
  CONSTRAINT `FK_ElderDisease_ElderDiseaseDet` FOREIGN KEY (`elder_disease_id`) REFERENCES `elder_disease_tb` (`elder_disease_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_ElderDiseaseDet` FOREIGN KEY (`disease_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الامراض التي يعاني منها المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_disease_det_tb`
--

LOCK TABLES `elder_disease_det_tb` WRITE;
/*!40000 ALTER TABLE `elder_disease_det_tb` DISABLE KEYS */;
INSERT INTO `elder_disease_det_tb` VALUES (10,NULL,187),(12,2,185),(13,NULL,186),(14,4,186),(15,4,187),(16,6,186),(17,7,186),(18,8,187),(19,9,187),(20,9,186),(21,10,186),(23,10,194),(24,11,186),(26,11,187),(30,13,188),(31,13,186),(32,14,187),(33,14,194),(34,15,NULL),(35,16,190),(36,17,186),(39,19,185),(40,20,186),(41,22,188),(42,23,188),(43,24,186),(44,25,186),(45,25,188);
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
  KEY `FK_Surv_ElderDisease_idx` (`survey_id`),
  CONSTRAINT `FK_Surv_ElderDisease` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='جدول ماستر يحتوي على تفاصيل مرض المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_disease_tb`
--

LOCK TABLES `elder_disease_tb` WRITE;
/*!40000 ALTER TABLE `elder_disease_tb` DISABLE KEYS */;
INSERT INTO `elder_disease_tb` VALUES (1,107,NULL),(2,108,NULL),(3,109,NULL),(4,110,NULL),(5,111,NULL),(6,111,NULL),(7,112,'\n								   							<i id=\"iConst\" class=\"fa fa-check\"></i>'),(8,112,NULL),(9,113,''),(10,114,'aaaaaa'),(11,115,NULL),(12,116,NULL),(13,117,'jkbkjbk,'),(14,118,'بفبغيبغ'),(15,144,NULL),(16,145,NULL),(17,146,NULL),(18,147,NULL),(19,148,NULL),(20,149,NULL),(21,150,'hkh'),(22,150,NULL),(23,151,'vjvghhvh'),(24,153,'لاسنلايءس'),(25,169,NULL);
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
  KEY `FK_Users_ElderDoc_idx` (`created_by`),
  CONSTRAINT `FK_File_ElderDoc` FOREIGN KEY (`file_id`) REFERENCES `file_tb` (`file_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_ElderDoc` FOREIGN KEY (`doc_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Users_ElderDoc` FOREIGN KEY (`created_by`) REFERENCES `users_tb` (`user_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي صور الأوراق الثبوتية الخاصة بالمسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_doc_tb`
--

LOCK TABLES `elder_doc_tb` WRITE;
/*!40000 ALTER TABLE `elder_doc_tb` DISABLE KEYS */;
INSERT INTO `elder_doc_tb` VALUES (2,1,65,'1933897496.jpg',NULL,NULL);
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
  KEY `FK_SubConstant_Elder_Interesting_idx` (`interesting_id`),
  CONSTRAINT `FK_SubConstant_Elder_Interesting` FOREIGN KEY (`interesting_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_ElderInteresting` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الأنشطة التي يهتم بها المسن';
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
  KEY `FK_Survey_ElderPariah_idx` (`survey_id`),
  CONSTRAINT `FK_SubConstant_ElderPariah` FOREIGN KEY (`elder_pariah_reason_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_ElderPariah` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على أسباب كون المسن منبوذ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_pariah_tb`
--

LOCK TABLES `elder_pariah_tb` WRITE;
/*!40000 ALTER TABLE `elder_pariah_tb` DISABLE KEYS */;
INSERT INTO `elder_pariah_tb` VALUES (3,175,206),(4,175,207),(5,175,210);
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
  KEY `FK_SubConstant_ElderRoom_hometype_idx` (`home_type_id`),
  CONSTRAINT `FK_SubConstant_ElderRoom_Bathroom` FOREIGN KEY (`bathroom_status_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_ElderRoom_Clothes` FOREIGN KEY (`clothes_covers_status_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_ElderRoom_Hygiene` FOREIGN KEY (`elder_higiene_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_ElderRoom_Room` FOREIGN KEY (`room_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_ElderRoom_Ventilation` FOREIGN KEY (`room_ventilation_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_ElderRoom_hometype` FOREIGN KEY (`home_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_ElderRoom_lighting` FOREIGN KEY (`room_lighting_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_ElderRoom` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات حالة غرفة المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_room_tb`
--

LOCK TABLES `elder_room_tb` WRITE;
/*!40000 ALTER TABLE `elder_room_tb` DISABLE KEYS */;
INSERT INTO `elder_room_tb` VALUES (1,132,NULL,98,104,107,109,110,110,110,110,NULL,115,NULL,117),(2,133,203,97,102,106,108,110,110,110,110,NULL,113,NULL,118),(3,134,203,97,104,106,108,111,111,110,110,'صسصصص',116,'يبسشيبسص',118),(4,135,203,97,102,106,108,111,111,110,111,'',116,'تلنلنهل',118),(5,157,204,98,101,107,108,110,110,111,110,'يبسسبيسبيسي',114,'',117),(6,158,204,98,104,107,109,110,111,110,110,'صيانة',115,'يبسيبصسي',118);
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
  KEY `FK_SubConstant_Elder_Category_idx` (`elder_category_id`),
  CONSTRAINT `FK_SubConstant_Elder_Category` FOREIGN KEY (`elder_category_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Elder_CurJob` FOREIGN KEY (`current_job_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Elder_Edu` FOREIGN KEY (`education_level_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Elder_Governorate` FOREIGN KEY (`governorate_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Elder_Insurance` FOREIGN KEY (`insurance_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Elder_PreJob` FOREIGN KEY (`previous_job_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Elder_Sex` FOREIGN KEY (`sex_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Elder_Special` FOREIGN KEY (`specialization_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Elder_Status` FOREIGN KEY (`status_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات المسنين';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_tb`
--

LOCK TABLES `elder_tb` WRITE;
/*!40000 ALTER TABLE `elder_tb` DISABLE KEYS */;
INSERT INTO `elder_tb` VALUES (901111111,176,'عبد الله','محمد','احمد','حسن','1945-01-01',1,5,19,'الشجاعية','الشجاعية                              ','2822222','0599111222','',27,34,48,51,8,'2015-11-30'),(903333333,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(903445663,175,'محمود','موسى','ابراهيم','عثمان','1944-06-06',1,184,21,'خانيونس','خانيونس','','','',28,33,48,51,9,NULL);
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
  KEY `FK_SubConstant_Employee_Sex_idx` (`sex_id`),
  CONSTRAINT `FK_SubConstant_Employee_Sex` FOREIGN KEY (`sex_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Employee_job` FOREIGN KEY (`job_title_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات الموظفين\nمرتبط بجدول الثوابت';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tb`
--

LOCK TABLES `employee_tb` WRITE;
/*!40000 ALTER TABLE `employee_tb` DISABLE KEYS */;
INSERT INTO `employee_tb` VALUES (1,801064239,'1','احمد',1,3,'0599988776','2822222','admin@gmail.com',1),(2,123456789,'4','عمر',1,3,'0599887665','2866655',' omar@gmail.com',1),(3,111111111,'3','hh',1,3,'3333333333','3333333','admin@gmail.com',1);
/*!40000 ALTER TABLE `employee_tb` ENABLE KEYS */;
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
  KEY `FK_Survey_FamilyElderRelationsip_idx` (`survey_id`),
  CONSTRAINT `FK_Survey_FamilyElderRelationsip` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='علاقة الأسرة بالمسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_elder_relationship_tb`
--

LOCK TABLES `family_elder_relationship_tb` WRITE;
/*!40000 ALTER TABLE `family_elder_relationship_tb` DISABLE KEYS */;
INSERT INTO `family_elder_relationship_tb` VALUES (1,166,110,111,110,110,'',110,111,'');
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
  KEY `FK_Survey_FamilyMember_idx` (`survey_id`),
  CONSTRAINT `FK_Elder_FamilyMember` FOREIGN KEY (`elder_id`) REFERENCES `elder_tb` (`elder_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_FamilyMembe_Sexr` FOREIGN KEY (`member_sex_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_FamilyMember_Edu` FOREIGN KEY (`education_level_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_FamilyMember_Health` FOREIGN KEY (`health_status_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_FamilyMember_Relation` FOREIGN KEY (`relationship_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_FamilyMember_Status` FOREIGN KEY (`status_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_FamilyMember` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على افراد اسرة المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_member_tb`
--

LOCK TABLES `family_member_tb` WRITE;
/*!40000 ALTER TABLE `family_member_tb` DISABLE KEYS */;
INSERT INTO `family_member_tb` VALUES (1,903333333,NULL,802222222,'احمد',1,11,5,'2015-11-13',25,66,0,'لا يعمل'),(2,903333333,NULL,804444444,'علي',1,179,5,'1980-01-29',28,66,1000,'معلم'),(3,903333333,NULL,805555555,'حسن',1,179,5,'1970-05-05',28,66,2000,'تاجر'),(4,903333333,NULL,802222222,'احمد',1,11,5,'2015-11-13',25,66,0,'لا يعمل'),(5,903333333,NULL,804445554,'محمد احمد',1,179,5,'1979-01-09',28,66,1000,'محاسب'),(6,903333333,NULL,804443333,'احمد',1,179,184,'1970-02-03',28,66,1000,'مدرس'),(7,903333333,NULL,804445555,'حسن',1,179,184,'1975-07-17',28,66,1000,'مدرس'),(9,903333333,NULL,802234661,'حسن',1,179,184,'1990-07-18',28,66,1000,'موظف'),(10,903333333,NULL,401111111,'علي',1,181,5,'2000-02-02',25,66,0,'طالب'),(11,903333333,NULL,802345678,'علي',1,179,5,'1989-11-30',28,66,100,'محاسب'),(14,903333333,NULL,412223334,'موسى محمد أحمد حسن',1,179,5,'2000-06-22',26,66,0,'طالب'),(15,903333333,NULL,801111111,'ث',1,179,5,'2015-11-19',23,66,100,'عامل'),(16,903445663,NULL,804563456,'موسى محمود',1,179,184,'1979-11-29',28,66,1000,'معلم'),(17,901111111,195,803333333,'محمد',1,179,184,'1985-07-18',28,66,1200,'ممرض'),(18,901111111,195,905556664,'مريم',2,178,184,'1959-11-26',25,66,0,'ربة منزل'),(20,901111111,195,804444444,'علي',1,179,5,'1980-01-29',28,66,1000,'معلم');
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
  KEY `FK_Survey_FamilyPsychoStatus_idx` (`survey_id`),
  CONSTRAINT `FK_SubConstant_FamilyPsychoStatus` FOREIGN KEY (`psychological_status_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_FamilyPsychoStatus` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='حالة الاسرة الجتماعية والنفسية';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_psychological_status_tb`
--

LOCK TABLES `family_psychological_status_tb` WRITE;
/*!40000 ALTER TABLE `family_psychological_status_tb` DISABLE KEYS */;
INSERT INTO `family_psychological_status_tb` VALUES (2,167,139),(3,168,138),(5,168,137),(6,169,138);
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
  KEY `FK_SubConstant_File_CloseReason_idx` (`close_reason_id`),
  CONSTRAINT `FK_Elder_File` FOREIGN KEY (`elder_id`) REFERENCES `elder_tb` (`elder_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_File` FOREIGN KEY (`file_status_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_File_CloseReason` FOREIGN KEY (`close_reason_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Users_File` FOREIGN KEY (`created_by`) REFERENCES `users_tb` (`user_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات ملف المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_tb`
--

LOCK TABLES `file_tb` WRITE;
/*!40000 ALTER TABLE `file_tb` DISABLE KEYS */;
INSERT INTO `file_tb` VALUES (1,901111111,170,NULL,NULL,NULL,NULL),(6,903333333,170,NULL,NULL,NULL,NULL),(7,903445663,170,NULL,NULL,NULL,NULL);
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
  KEY `FK_Elder_Followup_idx` (`elder_id`),
  CONSTRAINT `FK_Elder_Followup` FOREIGN KEY (`elder_id`) REFERENCES `elder_tb` (`elder_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Employee_Folloup_Researcher` FOREIGN KEY (`researcher_id`) REFERENCES `employee_tb` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على زيارات المتابعة للمسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_up_tb`
--

LOCK TABLES `follow_up_tb` WRITE;
/*!40000 ALTER TABLE `follow_up_tb` DISABLE KEYS */;
INSERT INTO `follow_up_tb` VALUES (4,903333333,3,'2015-12-16','19:30:00','19:30:00','متابعة2','تحسن2','تعديل استبانة'),(5,903333333,2,'2015-12-25','19:30:00','19:30:00','تفقد','تحسن','متابعة');
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
  KEY `FK_SubConstant_HomeImprovement_idx` (`improvement_type_id`),
  CONSTRAINT `FK_SubConstant_HomeImprovement` FOREIGN KEY (`improvement_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_HomeImprovement` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على التوصيات الخاصة بتحسين سكن المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_improvement_recomendation_tb`
--

LOCK TABLES `home_improvement_recomendation_tb` WRITE;
/*!40000 ALTER TABLE `home_improvement_recomendation_tb` DISABLE KEYS */;
INSERT INTO `home_improvement_recomendation_tb` VALUES (1,192,169,NULL),(2,192,167,NULL),(3,204,164,NULL);
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
  KEY `FK_SubConstant_HomeStatus_furniture_idx` (`furniture_level_id`),
  CONSTRAINT `FK_SubConstant_HomeStatus_Ceiling` FOREIGN KEY (`ceiling_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_HomeStatus_Situation` FOREIGN KEY (`home_situation_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_HomeStatus_Type` FOREIGN KEY (`home_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_HomeStatus_furniture` FOREIGN KEY (`furniture_level_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_HomeStatus` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='حالة سكن الأسرة المسن الحالي';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_status_tb`
--

LOCK TABLES `home_status_tb` WRITE;
/*!40000 ALTER TABLE `home_status_tb` DISABLE KEYS */;
INSERT INTO `home_status_tb` VALUES (1,125,83,89,91,NULL,94,NULL),(2,126,83,89,92,'جريد',96,'كنب'),(3,127,85,87,92,'سعف نخيل',96,'سرير'),(4,129,83,89,91,'',94,''),(5,155,83,89,92,'سعف نخيل',94,''),(6,155,85,89,91,'',96,'سرير'),(7,156,85,89,91,'',96,'سرير');
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
  KEY `FK_SubConstant_IncomeResourcesDet_Org_idx` (`organization_id`),
  CONSTRAINT `FK_IncomeResources_IncomeResourcesDet` FOREIGN KEY (`income_resources_id`) REFERENCES `income_resources_tb` (`income_resources_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_IncomeResourcesDet` FOREIGN KEY (`resource_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_IncomeResourcesDet_Org` FOREIGN KEY (`organization_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على مصادر دخل المسن وعائلته';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_resources_details_tb`
--

LOCK TABLES `income_resources_details_tb` WRITE;
/*!40000 ALTER TABLE `income_resources_details_tb` DISABLE KEYS */;
INSERT INTO `income_resources_details_tb` VALUES (2,4,76,NULL,100,NULL,NULL),(3,5,75,212,NULL,'طحين',100),(4,6,72,NULL,1000,NULL,NULL),(6,7,81,NULL,100,NULL,NULL),(7,7,72,NULL,1000,NULL,NULL),(9,7,75,214,100,NULL,NULL),(11,9,76,NULL,100,NULL,10),(12,10,76,NULL,1,'ل',1),(18,11,72,NULL,100,NULL,NULL),(20,13,72,NULL,1000,NULL,NULL),(21,14,75,212,NULL,'طحين',100),(24,17,75,213,100,NULL,NULL);
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
  KEY `FK_Survey_IncomeResources_idx` (`survey_id`),
  CONSTRAINT `FK_Survey_IncomeResources` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على مجموع دخل المسن وعائلته';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_resources_tb`
--

LOCK TABLES `income_resources_tb` WRITE;
/*!40000 ALTER TABLE `income_resources_tb` DISABLE KEYS */;
INSERT INTO `income_resources_tb` VALUES (1,181,NULL,NULL),(2,181,NULL,NULL),(3,182,NULL,NULL),(4,182,NULL,NULL),(5,182,NULL,NULL),(6,182,NULL,NULL),(7,183,NULL,NULL),(8,185,100,10),(9,186,2000,100),(10,187,NULL,NULL),(11,188,100,10),(12,189,NULL,NULL),(13,189,NULL,NULL),(14,189,NULL,NULL),(15,189,NULL,NULL),(16,189,NULL,NULL),(17,189,NULL,NULL);
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
  `is_elder_need_training` int(1) DEFAULT NULL COMMENT 'هل يوجد حاجة لتدريب المسن',
  `elder_training_type` varchar(45) DEFAULT NULL COMMENT 'نوع التدريب الذي يحتاجه المسن',
  `can_start_project` int(1) DEFAULT NULL COMMENT 'امكانية عمل مشروع صغير',
  `project_type` varchar(45) DEFAULT NULL COMMENT 'نوع المشروع',
  `project_budget` int(11) DEFAULT NULL COMMENT 'التكلفة المتوقعة لتنفيذ المشروع',
  PRIMARY KEY (`life_improvement_id`),
  KEY `FK_Survey_LifeImprovement_idx` (`survey_id`),
  KEY `FK_SubConstant_LifeImprovement_idx` (`elder_work_ability_id`),
  KEY `FK_SubConstant_LifeImprovement_Family_idx` (`family_member_id`),
  CONSTRAINT `FK_SubConstant_LifeImprovement` FOREIGN KEY (`elder_work_ability_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_LifeImprovement_Family` FOREIGN KEY (`family_member_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_LifeImprovement` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات قدرة المسن وعائلته على العمل لتحسين مستوى المعيشة';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `life_improvement_tb`
--

LOCK TABLES `life_improvement_tb` WRITE;
/*!40000 ALTER TABLE `life_improvement_tb` DISABLE KEYS */;
INSERT INTO `life_improvement_tb` VALUES (2,179,142,'نجار',NULL,111,'',111,'',NULL),(3,180,142,'بائع',NULL,111,'',111,'',NULL);
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
  KEY `FK_LocationTree_LocationTree_idx` (`loction_tree_pairent`),
  CONSTRAINT `FK_LocationTree_LocationTree` FOREIGN KEY (`loction_tree_pairent`) REFERENCES `loction_tree_tb` (`loction_tree_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي شجرة المسؤولية';
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
  KEY `FK_SubConstant_MedicalAid_idx` (`medical_aid_type_id`),
  CONSTRAINT `FK_SubConstant_MedicalAid` FOREIGN KEY (`medical_aid_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_MedicalAid` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT=' جدول يحتوي على توصيات الادارة بالمساعدات الطبية العينية التي يحتاجها المسن';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_aid_recomendation_tb`
--

LOCK TABLES `medical_aid_recomendation_tb` WRITE;
/*!40000 ALTER TABLE `medical_aid_recomendation_tb` DISABLE KEYS */;
INSERT INTO `medical_aid_recomendation_tb` VALUES (2,192,158),(3,204,157);
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
  KEY `FK_SubConstant_MedicationAvailability_idx` (`availability_status_id`),
  CONSTRAINT `FK_SubConstant_MedicationAvailability` FOREIGN KEY (`availability_status_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_MedicationAvailability` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الأدوية وحالة توفرها';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_availability_tb`
--

LOCK TABLES `medication_availability_tb` WRITE;
/*!40000 ALTER TABLE `medication_availability_tb` DISABLE KEYS */;
INSERT INTO `medication_availability_tb` VALUES (4,165,'Glocofag',121,'متقطع');
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
  KEY `FK_Survey_MedicationNeed_idx` (`survey_id`),
  CONSTRAINT `FK_SubConstant_MedicationNeeds` FOREIGN KEY (`medication_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_MedicationNeed` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على احتياجات المسن العلاجية مثل: جراحة-أدوية-علاج طبيعي-متابعة خاصة';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_need_tb`
--

LOCK TABLES `medication_need_tb` WRITE;
/*!40000 ALTER TABLE `medication_need_tb` DISABLE KEYS */;
INSERT INTO `medication_need_tb` VALUES (1,160,123,'أدوية'),(2,160,122,'جراحة'),(3,161,123,'اااا'),(5,162,124,'علاج'),(6,163,123,'jj'),(7,163,122,'jjj'),(8,163,124,'jjj'),(9,163,125,'jjj'),(11,165,122,'جراحة');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='جدول يربط الصفحات بالقوائم';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_page_tb`
--

LOCK TABLES `menu_page_tb` WRITE;
/*!40000 ALTER TABLE `menu_page_tb` DISABLE KEYS */;
INSERT INTO `menu_page_tb` VALUES (1,1,1),(2,2,2),(3,2,3),(4,3,4),(5,3,5),(6,3,6);
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
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على اسماء قوائم البرنامج';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_tb`
--

LOCK TABLES `menu_tb` WRITE;
/*!40000 ALTER TABLE `menu_tb` DISABLE KEYS */;
INSERT INTO `menu_tb` VALUES (1,'الصفحة الرئيسية',1),(2,'الموظفين',2),(3,'المستخدمين',3),(4,'الأعضاء',4),(5,'الاستبانة',5),(6,'مواعيد البحث الميداني',6),(7,'ثوابت النظام',7),(8,'الرسائل',8),(9,'التقارير',9);
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
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي اسماء صفحات البرنامج';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_tb`
--

LOCK TABLES `page_tb` WRITE;
/*!40000 ALTER TABLE `page_tb` DISABLE KEYS */;
INSERT INTO `page_tb` VALUES (1,'الصفحة الرئيسية','home',1),(2,'عرض الموظفين','employee/employees',1),(3,'اضافة موظف','employee/empform',2),(4,'عرض المستخدمين','user/users',1),(5,'اضافة مستخدم','user/userform',2),(6,'صلاحيات أنواع المستخدمين','usertypeperm/usertypepermession',3);
/*!40000 ALTER TABLE `page_tb` ENABLE KEYS */;
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
  PRIMARY KEY (`sub_constant_id`),
  KEY `CONSTANT_ID_idx` (`constant_id`),
  CONSTRAINT `FK_CONSTANT_ID` FOREIGN KEY (`constant_id`) REFERENCES `constant_tb` (`constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COMMENT='جدول حتوي تفاصيل الثوابت مثل: ذكر انثى - اعزب متزوج - تامين كبار سن تامين عمال\ncnstant_tb مرتبط بجدول ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_constant_tb`
--

LOCK TABLES `sub_constant_tb` WRITE;
/*!40000 ALTER TABLE `sub_constant_tb` DISABLE KEYS */;
INSERT INTO `sub_constant_tb` VALUES (1,1,'ذكر'),(2,1,'انثى'),(3,3,'باحث'),(4,3,'كاتب'),(5,2,'أعزب'),(6,3,'مدير'),(7,3,'مساعد باحث'),(8,7,'موظف حكومي'),(9,7,'تأمين كبار السن'),(10,7,'تأمين عمال'),(11,4,'أب'),(12,3,'اداري'),(13,20,'كاتب'),(14,20,'صلاحيات باحث'),(15,21,'جمعيات'),(17,7,'مصاب انتقاضة الاقصى'),(18,22,'الشمال'),(19,22,'غزة'),(20,22,'الوسطى'),(21,22,'خانيونس'),(22,22,'رفح'),(23,23,'أمي'),(24,23,'ابتدائي'),(25,23,'إعدادي'),(26,23,'ثانوي'),(27,23,'دبلوم'),(28,23,'بكالوريوس'),(29,23,'ليسانس'),(30,23,'ماجستير'),(31,23,'دراسات عليا'),(32,24,'إدارة أعمال'),(33,24,'محاسبة'),(34,24,'تعليم'),(35,24,'التجارة'),(36,24,'الصحة'),(37,24,'الدعم النفسي'),(38,24,'العمل المجتمعي'),(39,24,'بحث وتخطيط'),(40,24,'بناء مؤسسات'),(41,24,'زراعة'),(42,24,'حقوق'),(43,24,'هندسة'),(44,24,'تكنولوجيا معلومات'),(45,24,'تعليم مهني'),(46,24,'تعليم حرفي'),(47,25,'بدون'),(48,25,'متقاعد'),(49,25,'قطاع خاص'),(50,26,'مزارع'),(51,26,'حكومي'),(52,26,'وكالة'),(53,26,'خاص'),(54,26,'صناعة'),(55,26,'حرفة'),(56,26,'فني صيانة'),(57,26,'شرطة'),(58,26,'أجهزة أمنية'),(59,7,'شؤون اجتماعية'),(60,7,'عسكري'),(61,7,'بدون تأمين'),(62,7,'بحاجة لتأمين'),(63,27,'هوية'),(64,27,'شهادة ميلاد'),(65,27,'جواز سفر'),(66,28,'سليم'),(67,28,'مريض'),(71,29,'عمل خاص'),(72,29,'راتب تقاعد'),(73,29,'وكالة الشئون الإجتماعية الحكومية'),(74,29,'وكالة الغوث لتشغيل اللاجئين'),(75,29,'جمعيات خيرية أهلية / دولية'),(76,29,'أملاك وعقارات مدرة للدخل'),(77,29,'مساعدات شهرية / أسرى'),(78,29,'مساعدات شهرية / جرحى'),(79,29,'مساعدات شهرية / شهيد'),(80,29,'مساعدات كفالات أيتام'),(81,29,'إعالة من الأبناء/ الأقارب'),(82,30,'ممتاز'),(83,30,'جيد'),(84,30,'متوسط'),(85,30,'غير صالح للسكن'),(86,31,'ملك'),(87,31,'إيحار'),(88,31,'مع الأقرباء'),(89,31,'أرض حكومية'),(90,32,'باطون'),(91,32,'إسبست / صفيح'),(92,32,'غير ذلك'),(93,33,'ممتاز'),(94,33,'جيد'),(95,33,'قديم'),(96,33,'ينقص الكثير من الضروريات'),(97,34,'غرفة مستقلة'),(98,34,'غرفة مع الابناء'),(99,34,'مع العائلة بدون مكان مخص'),(100,34,'مكان منفصل'),(101,35,'ممتازة'),(102,35,'جيدة'),(103,35,'متواضعة'),(104,35,'قديمة'),(105,35,'مهلهلة'),(106,36,'جيدة'),(107,36,'غير جيدة'),(108,37,'مضيئة'),(109,37,'مظلمة'),(110,38,'نعم'),(111,38,'لا'),(112,39,'ممتاز'),(113,39,'جيد'),(114,39,'غير مناسب'),(115,39,'بحاجة للصيانة'),(116,39,'بحاجة للترميم'),(117,40,'ممتازة'),(118,40,'جيدة'),(119,40,'يفتقر للنظافة'),(120,41,'متوفر بانتظام'),(121,41,'متقطع'),(122,42,'جراحة'),(123,42,'أدوية'),(124,42,'علاج'),(125,42,'متابعة خاصة لا يمكن للأسرة توفيرها'),(126,43,'انطوائي'),(127,43,'مبادر'),(128,43,'مشاركة الآخرين'),(129,43,'الإهتمام بمن حوله'),(130,43,'أناني'),(136,44,'منعزلة'),(137,44,'مشاركة'),(138,44,'عدوانية'),(139,44,'متفائلة'),(140,44,'منغلقة'),(141,44,'منفتحة'),(142,45,'قادر'),(143,45,'غير قادر'),(144,46,'الزوج / ة'),(145,46,'أحد أفراد الأسرة'),(146,47,'دورية'),(147,47,'لمرة واحدة'),(148,48,'أغذية'),(149,48,'غذاء خاص'),(150,49,'كرسي متحرك'),(151,49,'سماعة أذن'),(152,49,'نظارة'),(153,49,'جهاز ضغط'),(154,49,'جهاز سكر'),(155,49,'عكاز'),(156,49,'ووكر'),(157,49,'أدوية'),(158,49,'جراحة'),(159,49,'فحوصات وتحاليل منتظمة'),(160,49,'علاج طبيعي'),(161,49,'متابعة صحية ميدانية'),(162,50,'ترميم غرفة المسن'),(163,50,'ترميم حمام / دورة مياه'),(164,50,'أثاث البيت الخشبي'),(165,50,'أجهزة كهربائية'),(166,50,'ملابس'),(167,50,'أغطية'),(168,50,'تسديد إيجار البيت'),(169,50,'أشياء أخرى'),(170,51,'فعال'),(171,51,'ملغي'),(172,51,'مغلق'),(173,52,'وفاة'),(174,52,'الغاء غضوية'),(175,53,'أ'),(176,53,'ب'),(177,53,'ج'),(178,4,'ام'),(179,4,'ابن'),(180,4,'ابنة'),(181,4,'حفيد'),(182,2,'مطلق'),(183,2,'أرمل'),(184,2,'متزوج'),(185,54,'الجهاز الهضمي'),(186,54,'الجهاز التنفسي'),(187,54,'الجهاز العصبي'),(188,54,'الجهاز الدوري'),(189,54,'الجهاز البولي'),(190,54,'أمراض جلدية'),(191,54,'زهايمر'),(192,54,'النفسي'),(193,54,'رعاش'),(194,54,'الجهاز العظمي'),(195,54,'شلل دماغي'),(196,54,'الغدد'),(197,54,'السرطان'),(198,54,'العيون'),(199,54,'إعاقة خلقية'),(200,54,'إعاقة نتيجة إصابة  حرب'),(201,54,'إعاقة نتيجة حادث'),(202,54,'جهاز سمعي'),(203,55,'مستقل'),(204,55,'مع الأبناء'),(205,55,'مع الأقارب'),(206,56,'أناني'),(207,56,'سليط اللسان'),(208,56,'عصبي'),(209,56,'مريض'),(210,56,'صعب الحركة'),(211,43,'منبوذ'),(212,57,'UNDP'),(213,57,'لجنة الزكاة'),(214,57,'سنابل الخير'),(215,4,'زوجة');
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
  KEY `FK_Survey_Survey_Elder_Info_idx` (`survey_id`),
  CONSTRAINT `FK_SubConstant_Survey_Elder_Category` FOREIGN KEY (`elder_category_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Survey_Elder_CurJob` FOREIGN KEY (`current_job_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Survey_Elder_Edu` FOREIGN KEY (`education_level_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Survey_Elder_Governorate` FOREIGN KEY (`governorate_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Survey_Elder_Insurance` FOREIGN KEY (`insurance_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Survey_Elder_PreJob` FOREIGN KEY (`previous_job_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Survey_Elder_Sex` FOREIGN KEY (`sex_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Survey_Elder_Special` FOREIGN KEY (`specialization_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Survey_Elder_Status` FOREIGN KEY (`status_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_Survey_Elder_Info` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات المسنين في استبانة معينة';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_elder_info_tb`
--

LOCK TABLES `survey_elder_info_tb` WRITE;
/*!40000 ALTER TABLE `survey_elder_info_tb` DISABLE KEYS */;
INSERT INTO `survey_elder_info_tb` VALUES (11,11,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(12,12,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(13,13,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(14,14,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(15,15,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(16,16,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(17,17,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(18,18,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(19,19,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(20,20,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(21,21,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(22,22,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(23,23,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(24,24,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(25,25,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(26,26,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(27,27,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(28,28,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(29,29,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(30,30,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(31,31,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(32,32,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(33,33,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(34,34,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(35,35,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(36,36,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(37,37,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(38,38,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(39,39,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(40,40,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(41,41,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(42,42,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(43,43,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(44,44,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(45,45,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(46,46,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(47,47,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(48,48,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(49,49,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(50,50,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(51,51,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(52,52,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(53,53,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(54,54,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(55,55,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(56,56,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(57,57,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(58,58,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(59,59,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(60,60,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(61,61,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(62,62,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(63,63,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(64,64,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(65,65,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(66,66,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(67,67,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(68,68,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(69,69,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(70,70,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(71,71,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(72,72,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(73,73,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(74,74,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(75,75,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(76,76,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(77,77,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(78,78,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(79,79,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(80,80,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(81,81,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(82,82,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(83,83,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(84,84,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(85,85,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(86,86,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(87,87,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(88,88,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(89,89,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(90,90,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(91,91,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(92,92,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(93,93,903445663,175,'محمود','موسى','ابراهيم','عثمان','1944-06-06',1,184,21,'خانيونس','خانيونس','','','',28,33,48,51,9,NULL),(94,94,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(95,95,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(96,96,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(97,97,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(98,98,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(99,99,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(100,100,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(101,101,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(102,102,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(103,103,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(104,104,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(105,105,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(106,106,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(107,107,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(108,108,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(109,109,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(110,110,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(111,111,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(112,112,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(113,113,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(114,114,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(115,115,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(116,116,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(117,117,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(118,118,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(119,119,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(120,120,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(121,121,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(122,122,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(123,123,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(124,124,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(125,125,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(126,126,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(127,127,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(128,128,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(129,129,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(130,130,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(131,131,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(132,132,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(133,133,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(134,134,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(135,135,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(136,136,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(137,137,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(138,138,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(139,139,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(140,140,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(141,141,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(142,142,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(143,143,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(144,144,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(145,145,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(146,146,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(147,147,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(148,148,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(149,149,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(150,150,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(151,151,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(152,152,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(153,153,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(154,154,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(155,155,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(156,156,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(157,157,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(158,158,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(159,159,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(160,160,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(161,161,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(162,162,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(163,163,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(164,164,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(165,165,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(166,166,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(167,167,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(168,168,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(169,169,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(170,170,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(171,171,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(172,172,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(173,173,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(174,174,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(175,175,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(176,176,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(177,177,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(178,178,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(179,179,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(180,180,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(181,181,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(182,182,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(183,183,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(184,184,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(185,185,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(186,186,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(187,187,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(188,188,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(189,189,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(190,190,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(191,191,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(192,192,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(193,193,0,175,'عبد الله','محمد','احمد','حسن','1945-01-01',1,5,19,'الشجاعية','الشجاعية                              ','2822222','0599111222','',27,34,48,51,8,NULL),(194,194,0,175,'عبد الله','محمد','احمد','حسن','1945-01-01',1,5,19,'الشجاعية','الشجاعية                              ','2822222','0599111222','',27,34,48,51,8,NULL),(195,195,0,176,'عبد الله','محمد','احمد','حسن','1945-01-01',1,5,19,'الشجاعية','الشجاعية                              ','2822222','0599111222','',27,34,48,51,8,NULL),(196,196,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(197,197,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(198,198,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(199,199,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(200,200,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(201,201,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(202,202,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(203,203,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL),(204,204,0,176,'محمد','ابراهيم','علي','احمد','1945-07-12',1,5,18,'بيت حانون','الشمال','2477277','','',24,41,49,50,9,NULL);
/*!40000 ALTER TABLE `survey_elder_info_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_family_details_tb`
--

DROP TABLE IF EXISTS `survey_family_details_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_family_details_tb` (
  `survey_family_details_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) DEFAULT NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `family_members_num_in_home` int(11) DEFAULT NULL COMMENT 'عدد افراد الاسرة المقيمين في نفس المنزل',
  `is_cooperative_family` int(1) DEFAULT NULL COMMENT 'هل الأسرة متعاونة مع الباحث الاجتماعي',
  `cooperative_persone_type_id` int(11) DEFAULT NULL COMMENT 'FK sub_constant_tb\nصلة قرابة الشخص الذي استعان به الباحث في حال كانت الاسرة غير متعاونة مثلا: جيران -أقارب-أصدقاء',
  `cooperative_persone_id` int(11) DEFAULT NULL COMMENT 'رقم هوية الشخص الذي استعان به الباحث في حال كانت الاسرة غير متعاونة',
  `cooperative_persone_name` varchar(200) DEFAULT NULL COMMENT 'اسم الشخص الذي استعان به الباحث',
  `cooperative_persone_mobile` varchar(45) DEFAULT NULL COMMENT 'رقم جوال الشخص الذي استعان به الباحث',
  `cooperative_persone_address` varchar(200) DEFAULT NULL COMMENT 'عنوان الشخص الذي استعان به الباحث',
  PRIMARY KEY (`survey_family_details_id`),
  KEY `FK_Survey_SurveyFamilyDetails_idx` (`survey_id`),
  KEY `FK_SubConstant_SurveyFamilyDetails_idx` (`cooperative_persone_type_id`),
  CONSTRAINT `FK_SubConstant_SurveyFamilyDetails` FOREIGN KEY (`cooperative_persone_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_SurveyFamilyDetails` FOREIGN KEY (`survey_id`) REFERENCES `survey_tb` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على تفاصيل متعلقة بعائلة المسن ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_family_details_tb`
--

LOCK TABLES `survey_family_details_tb` WRITE;
/*!40000 ALTER TABLE `survey_family_details_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_family_details_tb` ENABLE KEYS */;
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
  KEY `FK_Users_Survey_idx` (`created_by`),
  CONSTRAINT `FK_Employee_Survey_AssesFst` FOREIGN KEY (`researcher_assistant_fst_id`) REFERENCES `employee_tb` (`national_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Employee_Survey_AssesSec` FOREIGN KEY (`researcher_assistant_sec_id`) REFERENCES `employee_tb` (`national_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Employee_Survey_Researcher` FOREIGN KEY (`researcher_id`) REFERENCES `employee_tb` (`national_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_File_Survey` FOREIGN KEY (`file_id`) REFERENCES `file_tb` (`file_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Survey` FOREIGN KEY (`visit_purpose_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Users_Survey` FOREIGN KEY (`created_by`) REFERENCES `users_tb` (`user_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على البيانات الاساسية للبحث الميداني';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_tb`
--

LOCK TABLES `survey_tb` WRITE;
/*!40000 ALTER TABLE `survey_tb` DISABLE KEYS */;
INSERT INTO `survey_tb` VALUES (11,6,'2015-11-05','22:50:00','22:50:00',NULL,111111111,801064239,123456789,NULL,NULL,NULL,NULL),(12,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,6,'2015-11-05','00:35:00','00:35:00',NULL,111111111,801064239,NULL,NULL,NULL,NULL,NULL),(22,6,'2015-11-11','11:35:00','11:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(23,6,'2015-11-11','11:35:00','11:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(24,6,'2015-11-24','11:55:00','11:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(25,6,'2015-11-18','12:15:00','12:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(26,6,'2015-11-17','12:25:00','12:25:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(27,6,'2015-11-12','12:30:00','12:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(28,6,'2015-11-11','12:30:00','12:30:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(29,6,'2015-11-20','12:35:00','12:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(30,6,'2015-11-11','13:10:00','13:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(31,6,'2015-11-13','13:15:00','13:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(32,6,'2015-11-12','13:20:00','13:20:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(33,6,'2015-11-11','13:25:00','13:25:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(34,6,'2015-11-12','13:35:00','13:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(35,6,'2015-11-11','13:40:00','13:40:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(36,6,'2015-11-18','13:40:00','13:40:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(37,6,'2015-11-19','13:45:00','13:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(38,6,'2015-11-18','13:50:00','13:50:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(39,6,'2015-11-18','14:10:00','14:10:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(40,6,'2015-11-05','16:00:00','16:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(41,6,'2015-11-05','16:05:00','16:05:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(42,6,'2015-11-12','16:10:00','16:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(43,6,'2015-11-04','16:15:00','16:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(44,6,'2015-11-19','16:15:00','16:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(45,6,'2015-11-18','16:20:00','16:20:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(46,6,'2015-11-18','16:20:00','16:20:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(47,6,'2015-11-17','16:25:00','16:25:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(48,6,'2015-11-19','16:30:00','16:30:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(49,6,'2015-11-17','16:30:00','16:30:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(50,6,'2015-11-11','16:35:00','16:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(51,6,'2015-11-05','16:45:00','16:45:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(52,6,'2015-11-12','18:05:00','18:05:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(53,6,'2015-11-05','18:10:00','18:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(54,6,'2015-11-18','19:10:00','19:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(55,6,'2015-11-05','19:55:00','19:55:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(56,6,'2015-11-19','20:15:00','20:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(57,6,'2015-11-05','21:35:00','21:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(58,6,'2015-11-05','21:40:00','21:40:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(59,6,'2015-11-10','17:30:00','17:30:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(60,6,'2015-11-18','17:35:00','17:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(61,6,'2015-11-18','17:40:00','17:40:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(62,6,'2015-11-11','17:55:00','17:55:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(63,6,'2015-11-11','18:00:00','18:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(64,6,'2015-11-19','18:30:00','18:30:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(65,6,'2015-11-11','18:40:00','18:40:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(66,6,'2015-11-19','19:00:00','19:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(67,6,'2015-11-18','19:10:00','19:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(68,6,'2015-11-04','19:10:00','19:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(69,6,'2015-11-11','19:15:00','19:15:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(70,6,'2015-11-18','19:20:00','19:20:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(71,6,'2015-11-04','19:25:00','19:25:00',NULL,801064239,111111111,NULL,NULL,NULL,NULL,NULL),(72,6,'2015-11-19','19:50:00','19:50:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(73,6,'2015-11-26','19:55:00','19:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(74,6,'2015-11-30','20:40:00','20:40:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(75,6,'2015-11-30','21:00:00','21:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(76,6,'2015-11-11','21:05:00','21:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(77,6,'2015-11-12','21:55:00','21:55:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(78,6,'2015-11-13','22:15:00','22:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(79,6,'2015-11-13','22:25:00','22:25:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(80,6,'2015-11-03','22:30:00','22:30:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(81,6,'2015-11-20','22:30:00','22:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(82,6,'2015-11-19','22:30:00','22:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(83,6,'2015-11-19','22:30:00','22:30:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(84,6,'2015-11-25','22:35:00','22:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(85,6,'2015-11-18','22:35:00','22:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(86,6,'2015-11-26','22:35:00','22:35:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(87,6,'2015-11-25','22:35:00','22:35:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(88,6,'2015-11-25','22:45:00','22:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(89,6,'2015-11-18','22:50:00','22:50:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(90,6,'2015-11-20','22:55:00','22:55:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(91,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,6,'2015-11-03','14:45:00','14:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(93,7,'2015-12-01','20:00:00','19:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(94,6,'2015-12-08','20:30:00','20:30:00',NULL,111111111,801064239,NULL,NULL,NULL,NULL,NULL),(95,6,'2015-12-30','21:00:00','21:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(96,6,'2015-12-24','21:05:00','21:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(97,6,'2015-12-16','21:05:00','21:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(98,6,'2015-12-03','21:05:00','21:05:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(99,6,'2015-12-03','21:10:00','21:10:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(100,6,'2015-12-01','21:10:00','21:10:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(101,6,'2015-12-01','21:15:00','21:15:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(102,6,'2015-12-02','21:15:00','21:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(103,6,'2015-12-01','21:15:00','21:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(104,6,'2015-12-01','21:30:00','21:30:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(105,6,'2015-12-09','21:35:00','21:35:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(106,6,'2015-12-14','21:35:00','21:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(107,6,'2015-12-02','23:05:00','23:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(108,6,'2015-12-16','23:35:00','23:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(109,6,'2015-12-01','23:40:00','23:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(110,6,'2015-12-09','23:40:00','23:40:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(111,6,'2015-12-09','00:05:00','00:05:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(112,6,'2015-12-10','00:15:00','00:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(113,6,'2015-12-09','00:15:00','00:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(114,6,'2015-12-15','00:20:00','00:20:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(115,6,'2015-12-03','00:35:00','00:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(116,6,'2015-12-31','00:40:00','00:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(117,6,'2015-12-10','00:45:00','00:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(118,6,'2015-12-09','18:00:00','18:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(119,6,'2015-12-24','19:50:00','19:50:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(120,6,'2015-12-16','19:55:00','19:55:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(121,6,'2015-12-09','20:00:00','20:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(122,6,'2015-12-22','20:00:00','20:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(123,6,'2015-12-23','20:00:00','20:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(124,6,'2015-12-09','20:05:00','20:05:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(125,6,'2015-12-16','20:05:00','20:05:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(126,6,'2015-12-16','20:55:00','20:55:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(127,6,'2015-12-09','21:00:00','21:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(128,6,'2015-12-16','22:05:00','22:05:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(129,6,'2015-12-23','22:15:00','22:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(130,6,'2015-12-01','19:15:00','19:15:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(131,6,'2015-12-23','19:25:00','19:25:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(132,6,'2015-12-02','19:40:00','19:40:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(133,6,'2015-12-23','20:00:00','20:00:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(134,6,'2015-12-17','21:25:00','21:25:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(135,6,'2015-12-11','21:45:00','21:45:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(136,6,'2015-12-17','22:15:00','22:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(137,6,'2015-12-02','22:35:00','22:35:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(138,6,'2015-12-01','22:50:00','22:50:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(139,6,'2015-12-01','22:55:00','22:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(140,6,'2015-12-02','23:10:00','23:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(141,6,'2015-12-01','23:10:00','23:10:00',NULL,111111111,NULL,NULL,NULL,NULL,NULL,NULL),(142,6,'2015-12-01','22:25:00','22:25:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(143,6,'2015-12-02','00:35:00','00:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(144,6,'2015-12-09','00:35:00','00:35:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL),(145,6,'2015-12-09','00:40:00','00:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(146,6,'2015-12-09','00:45:00','00:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(147,6,'2015-12-09','00:55:00','00:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(148,6,'2015-12-09','01:00:00','01:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(149,6,'2015-12-09','01:10:00','01:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(150,6,'2015-12-03','01:10:00','01:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(151,6,'2015-12-16','01:15:00','01:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(152,6,'2015-12-09','18:40:00','18:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(153,6,'2015-12-09','19:20:00','19:20:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(154,6,'2015-12-09','19:25:00','19:25:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(155,6,'2015-12-09','19:30:00','19:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(156,6,'2015-12-10','19:35:00','19:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(157,6,'2015-12-16','20:25:00','20:25:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(158,6,'2015-12-09','20:30:00','20:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(159,6,'2015-12-09','22:30:00','22:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(160,6,'2015-12-09','22:35:00','22:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(161,6,'2015-12-09','22:45:00','22:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(162,6,'2015-12-16','22:45:00','22:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(163,6,'2015-12-15','22:55:00','22:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(164,6,'2015-12-09','23:05:00','23:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(165,6,'2015-12-09','23:05:00','23:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(166,6,'2015-12-09','23:55:00','23:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(167,6,'2015-12-09','00:40:00','00:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(168,6,'2015-12-09','00:40:00','00:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(169,6,'2015-12-16','17:30:00','17:30:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(170,6,'2015-12-09','19:40:00','19:40:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(171,6,'2015-12-10','19:45:00','19:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(172,6,'2015-12-11','19:50:00','19:50:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(173,6,'2015-12-09','20:10:00','20:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(174,6,'2015-12-11','20:15:00','20:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(175,6,'2015-12-07','20:15:00','20:15:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(176,6,'2015-12-08','20:20:00','20:20:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(177,6,'2015-12-10','20:25:00','20:25:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(178,6,'2015-12-10','21:05:00','21:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(179,6,'2015-12-09','21:10:00','21:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(180,6,'2015-12-09','21:35:00','21:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(181,6,'2015-12-31','00:05:00','00:05:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(182,6,'2015-12-24','00:10:00','00:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(183,6,'2015-12-03','01:00:00','01:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(184,6,'2015-12-10','01:45:00','01:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(185,6,'2015-12-09','02:55:00','02:55:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(186,6,'2015-12-10','03:00:00','03:00:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(187,6,'2015-12-31','03:10:00','03:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(188,6,'2015-12-10','03:45:00','03:45:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(189,6,'2015-12-19','04:10:00','04:10:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(190,6,'2015-12-17','04:35:00','04:35:00',NULL,801064239,NULL,NULL,NULL,NULL,NULL,NULL),(191,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(192,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(193,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(194,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(195,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(196,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(197,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(198,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(199,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(200,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(201,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(202,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(203,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(204,6,'2015-12-03','01:45:00','01:45:00',NULL,123456789,NULL,NULL,NULL,NULL,NULL,NULL);
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
  KEY `FK_SubConstant_UserMenu_idx` (`user_type_id`),
  CONSTRAINT `FK_MenuPage_UserMenuPage` FOREIGN KEY (`menu_page_id`) REFERENCES `menu_page_tb` (`menu_page_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_UserMenu` FOREIGN KEY (`user_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='جدول حتوي الصفحات والقوائم الخاصة بكل نوع مستخدم';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu_page_tb`
--

LOCK TABLES `user_menu_page_tb` WRITE;
/*!40000 ALTER TABLE `user_menu_page_tb` DISABLE KEYS */;
INSERT INTO `user_menu_page_tb` VALUES (1,1,13),(17,1,14),(18,2,14),(19,3,14);
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
  KEY `FK_Employee_idx` (`employee_id`),
  CONSTRAINT `FK_Employee` FOREIGN KEY (`employee_id`) REFERENCES `employee_tb` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubConstant_Users` FOREIGN KEY (`user_type_id`) REFERENCES `sub_constant_tb` (`sub_constant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Users_Users` FOREIGN KEY (`created_by`) REFERENCES `users_tb` (`user_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='جدول يجتوي على حسابات المستخدمين للبرنامج';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_tb`
--

LOCK TABLES `users_tb` WRITE;
/*!40000 ALTER TABLE `users_tb` DISABLE KEYS */;
INSERT INTO `users_tb` VALUES ('ah','e10adc3949ba59abbe56e057f20f883e',1,1,13,NULL,NULL),('om','e10adc3949ba59abbe56e057f20f883e',2,1,14,NULL,NULL);
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

-- Dump completed on 2015-12-15  2:00:47
