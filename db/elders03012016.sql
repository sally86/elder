-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jan 03, 2016 at 10:54 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `elders`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `aids_recomendation_tb`
-- 

CREATE TABLE `aids_recomendation_tb` (
  `aids_recomendation_id` int(11) NOT NULL auto_increment,
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `cash_aid_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nنوع المساعدات المادية مثلا:دورية-لمرة واحدة',
  `cash_aid_amount` int(11) default NULL COMMENT 'قيمة المساعدة',
  `psychological_support` varchar(200) default NULL COMMENT 'دعم نفسي',
  `social_support` varchar(200) default NULL COMMENT 'دعم اجتماعي',
  `entertainment` varchar(200) default NULL COMMENT 'الترفيه',
  `nutrition_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nنوع التغذية',
  `nutrition_details` varchar(200) default NULL COMMENT 'تفاصيل الغذاء الذي يحتاجه المسن',
  PRIMARY KEY  (`aids_recomendation_id`),
  KEY `FK_Survey_AidsRecomendation_idx` (`survey_id`),
  KEY `FK_SubConstant_AidsRecomendation_idx` (`cash_aid_type_id`),
  KEY `FK_SubConstant_AidsRecomendation_Nutrition_idx` (`nutrition_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على توصيات الادارة بالمساعدات التي يحتادها المسن' AUTO_INCREMENT=12 ;

-- 
-- Dumping data for table `aids_recomendation_tb`
-- 

INSERT INTO `aids_recomendation_tb` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `aids_recomendation_tb` VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `aids_recomendation_tb` VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `aids_recomendation_tb` VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `aids_recomendation_tb` VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `aids_recomendation_tb` VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `aids_recomendation_tb` VALUES (7, 204, 147, 100, 'نفسي', 'اجتماعي', 'ترفيه', 148, 'غذاء');
INSERT INTO `aids_recomendation_tb` VALUES (8, 212, 146, 100, '', '', '', 148, 'غذاء');
INSERT INTO `aids_recomendation_tb` VALUES (9, 213, 146, 1000, 'دعم نفسي', '', '', NULL, '');
INSERT INTO `aids_recomendation_tb` VALUES (10, 215, 146, 100, '', '', '', 148, 'غذاء');
INSERT INTO `aids_recomendation_tb` VALUES (11, 223, 146, 15000, 'دعم زهايمر', 'دعم مالي', 'لا', 148, 'فلافل وفول ');

-- --------------------------------------------------------

-- 
-- Table structure for table `appointment_tb`
-- 

CREATE TABLE `appointment_tb` (
  `appointment_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `researcher_id` int(11) default NULL COMMENT 'FK employee_tb\nرقم الباحث',
  `elder_id` int(11) default NULL COMMENT 'FK elder_tb\nرقم المسن',
  `appointment_date` date default NULL COMMENT 'تاريخ الموعد',
  PRIMARY KEY  (`appointment_id`),
  KEY `FK_Employee_Appojntment_idx` (`researcher_id`),
  KEY `FK_Elder_Appointment_idx` (`elder_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على جدولة مواعيد الزيارات للأعضاء' AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `appointment_tb`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `constant_tb`
-- 

CREATE TABLE `constant_tb` (
  `constant_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `constant_name` varchar(45) NOT NULL COMMENT 'وصف الثابت',
  PRIMARY KEY  (`constant_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على انواع ثوابت النظام مثلا:الجنس-الحالة الاجتماع' AUTO_INCREMENT=71 ;

-- 
-- Dumping data for table `constant_tb`
-- 

INSERT INTO `constant_tb` VALUES (1, 'الجنس');
INSERT INTO `constant_tb` VALUES (2, 'الحالة الاجتماعية');
INSERT INTO `constant_tb` VALUES (3, 'المسمى الوظيفي');
INSERT INTO `constant_tb` VALUES (4, 'صلة القرابة');
INSERT INTO `constant_tb` VALUES (7, 'التأمين الصحي');
INSERT INTO `constant_tb` VALUES (20, 'نوع المستخدم');
INSERT INTO `constant_tb` VALUES (21, 'مصدر الدخل');
INSERT INTO `constant_tb` VALUES (22, 'المحافظات');
INSERT INTO `constant_tb` VALUES (23, 'المؤهل العلمي');
INSERT INTO `constant_tb` VALUES (24, 'التخصص');
INSERT INTO `constant_tb` VALUES (25, 'العمل الحالي');
INSERT INTO `constant_tb` VALUES (26, 'العمل السابق');
INSERT INTO `constant_tb` VALUES (27, 'نوع المستند');
INSERT INTO `constant_tb` VALUES (28, 'الحالة الصحية للفرد');
INSERT INTO `constant_tb` VALUES (29, 'مصدر الدخل');
INSERT INTO `constant_tb` VALUES (30, 'الوضع العام');
INSERT INTO `constant_tb` VALUES (31, 'نوع السكن');
INSERT INTO `constant_tb` VALUES (32, 'توع السقف');
INSERT INTO `constant_tb` VALUES (33, 'مستوى الأثاث');
INSERT INTO `constant_tb` VALUES (34, 'وصف حالة المسن في الأسره');
INSERT INTO `constant_tb` VALUES (35, 'وصف ملابس وأغطية المسن');
INSERT INTO `constant_tb` VALUES (36, 'تهوية الغرفة');
INSERT INTO `constant_tb` VALUES (37, 'إضاءة الغرفة');
INSERT INTO `constant_tb` VALUES (38, 'اختيار نعم / لا');
INSERT INTO `constant_tb` VALUES (39, 'وصف الحمام / دورة المياه');
INSERT INTO `constant_tb` VALUES (40, 'حالة النظافة للمسن نفسه');
INSERT INTO `constant_tb` VALUES (41, 'توفير العلاج للمسن');
INSERT INTO `constant_tb` VALUES (42, 'نوع العلاج');
INSERT INTO `constant_tb` VALUES (43, 'علاقة المسن بالأسرة والمجتمع المحلي');
INSERT INTO `constant_tb` VALUES (44, 'حالة أسرة المسن الاجتماعية والنفسية');
INSERT INTO `constant_tb` VALUES (45, 'قدرة المسن على العمل');
INSERT INTO `constant_tb` VALUES (46, 'إمكانية التشغيل');
INSERT INTO `constant_tb` VALUES (47, 'نوع المساعدة المادية');
INSERT INTO `constant_tb` VALUES (48, 'نوع التغذية');
INSERT INTO `constant_tb` VALUES (49, 'نوع المساعدة الطبية');
INSERT INTO `constant_tb` VALUES (50, 'نوع المساعدة لتحسين السكن');
INSERT INTO `constant_tb` VALUES (51, 'تـصنيف المـلـف');
INSERT INTO `constant_tb` VALUES (52, 'سبب اغلاق الملف');
INSERT INTO `constant_tb` VALUES (53, 'تصنيف الحالة');
INSERT INTO `constant_tb` VALUES (54, 'الحالة الصحية للمسن');
INSERT INTO `constant_tb` VALUES (55, 'وصف سكن المسن');
INSERT INTO `constant_tb` VALUES (56, 'سبب نبذ المسن');
INSERT INTO `constant_tb` VALUES (57, 'جمعيات خيرية أهلية / دولية');
INSERT INTO `constant_tb` VALUES (58, 'الشمال');
INSERT INTO `constant_tb` VALUES (59, 'الوسطى');
INSERT INTO `constant_tb` VALUES (60, 'خانيونس');
INSERT INTO `constant_tb` VALUES (61, 'غزة');
INSERT INTO `constant_tb` VALUES (62, 'جباليا');
INSERT INTO `constant_tb` VALUES (63, 'بيت لاهيا');
INSERT INTO `constant_tb` VALUES (64, 'بيت حانون');
INSERT INTO `constant_tb` VALUES (65, 'النصيرات');
INSERT INTO `constant_tb` VALUES (66, 'دير البلح');
INSERT INTO `constant_tb` VALUES (67, 'القرارة');
INSERT INTO `constant_tb` VALUES (68, 'رفح');
INSERT INTO `constant_tb` VALUES (69, 'الإستعانة بطرف ثاني');
INSERT INTO `constant_tb` VALUES (70, 'القرى الشرقية');

-- --------------------------------------------------------

-- 
-- Table structure for table `elder_behaviour_tb`
-- 

CREATE TABLE `elder_behaviour_tb` (
  `elder_behaviour_id` int(11) NOT NULL auto_increment,
  `survey_id` int(11) default NULL,
  `behaviour_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nسلوك المسن مثلا:انطوائي -مبادر-منبوذ لانه سليط اللسان',
  PRIMARY KEY  (`elder_behaviour_id`),
  KEY `FK_Survey_ElderBehaviour_idx` (`survey_id`),
  KEY `FK_SubConstant_ElderBehaviour_idx` (`behaviour_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='علاقة المسن بالاسرة والمجتمع المحلي' AUTO_INCREMENT=20 ;

-- 
-- Dumping data for table `elder_behaviour_tb`
-- 

INSERT INTO `elder_behaviour_tb` VALUES (2, 170, 129);
INSERT INTO `elder_behaviour_tb` VALUES (4, 171, 129);
INSERT INTO `elder_behaviour_tb` VALUES (5, 171, 211);
INSERT INTO `elder_behaviour_tb` VALUES (6, 172, 130);
INSERT INTO `elder_behaviour_tb` VALUES (7, 172, 211);
INSERT INTO `elder_behaviour_tb` VALUES (8, 173, 130);
INSERT INTO `elder_behaviour_tb` VALUES (9, 174, 130);
INSERT INTO `elder_behaviour_tb` VALUES (11, 175, 130);
INSERT INTO `elder_behaviour_tb` VALUES (12, 175, 211);
INSERT INTO `elder_behaviour_tb` VALUES (15, 176, 130);
INSERT INTO `elder_behaviour_tb` VALUES (16, 176, 211);
INSERT INTO `elder_behaviour_tb` VALUES (17, 223, 130);
INSERT INTO `elder_behaviour_tb` VALUES (18, 223, 129);
INSERT INTO `elder_behaviour_tb` VALUES (19, 223, 128);

-- --------------------------------------------------------

-- 
-- Table structure for table `elder_disease_det_tb`
-- 

CREATE TABLE `elder_disease_det_tb` (
  `elder_disease_det_id` int(11) NOT NULL auto_increment,
  `elder_disease_id` int(11) default NULL COMMENT 'FK elder_disease_tb\nرقم الماستر',
  `disease_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nرقم المرض',
  PRIMARY KEY  (`elder_disease_det_id`),
  KEY `FK_SubConstant_ElderDisease_idx` (`disease_id`),
  KEY `FK_ElderDisease_ElderDiseaseDet_idx` (`elder_disease_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الامراض التي يعاني منها المسن' AUTO_INCREMENT=50 ;

-- 
-- Dumping data for table `elder_disease_det_tb`
-- 

INSERT INTO `elder_disease_det_tb` VALUES (10, NULL, 187);
INSERT INTO `elder_disease_det_tb` VALUES (12, 2, 185);
INSERT INTO `elder_disease_det_tb` VALUES (13, NULL, 186);
INSERT INTO `elder_disease_det_tb` VALUES (14, 4, 186);
INSERT INTO `elder_disease_det_tb` VALUES (15, 4, 187);
INSERT INTO `elder_disease_det_tb` VALUES (16, 6, 186);
INSERT INTO `elder_disease_det_tb` VALUES (17, 7, 186);
INSERT INTO `elder_disease_det_tb` VALUES (18, 8, 187);
INSERT INTO `elder_disease_det_tb` VALUES (19, 9, 187);
INSERT INTO `elder_disease_det_tb` VALUES (20, 9, 186);
INSERT INTO `elder_disease_det_tb` VALUES (21, 10, 186);
INSERT INTO `elder_disease_det_tb` VALUES (23, 10, 194);
INSERT INTO `elder_disease_det_tb` VALUES (24, 11, 186);
INSERT INTO `elder_disease_det_tb` VALUES (26, 11, 187);
INSERT INTO `elder_disease_det_tb` VALUES (30, 13, 188);
INSERT INTO `elder_disease_det_tb` VALUES (31, 13, 186);
INSERT INTO `elder_disease_det_tb` VALUES (32, 14, 187);
INSERT INTO `elder_disease_det_tb` VALUES (33, 14, 194);
INSERT INTO `elder_disease_det_tb` VALUES (35, 16, 190);
INSERT INTO `elder_disease_det_tb` VALUES (36, 17, 186);
INSERT INTO `elder_disease_det_tb` VALUES (39, 19, 185);
INSERT INTO `elder_disease_det_tb` VALUES (40, 20, 186);
INSERT INTO `elder_disease_det_tb` VALUES (41, 22, 188);
INSERT INTO `elder_disease_det_tb` VALUES (42, 23, 188);
INSERT INTO `elder_disease_det_tb` VALUES (43, 24, 186);
INSERT INTO `elder_disease_det_tb` VALUES (44, 25, 186);
INSERT INTO `elder_disease_det_tb` VALUES (45, 25, 188);
INSERT INTO `elder_disease_det_tb` VALUES (46, 26, 190);
INSERT INTO `elder_disease_det_tb` VALUES (48, 26, 191);
INSERT INTO `elder_disease_det_tb` VALUES (49, 26, 187);

-- --------------------------------------------------------

-- 
-- Table structure for table `elder_disease_tb`
-- 

CREATE TABLE `elder_disease_tb` (
  `elder_disease_id` int(11) NOT NULL auto_increment,
  `survey_id` int(11) default NULL,
  `elder_disease_details` varchar(200) default NULL,
  PRIMARY KEY  (`elder_disease_id`),
  KEY `FK_Survey_ElderDisease_idx` (`survey_id`),
  KEY `FK_Surv_ElderDisease_idx` (`survey_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول ماستر يحتوي على تفاصيل مرض المسن' AUTO_INCREMENT=27 ;

-- 
-- Dumping data for table `elder_disease_tb`
-- 

INSERT INTO `elder_disease_tb` VALUES (1, 107, NULL);
INSERT INTO `elder_disease_tb` VALUES (2, 108, NULL);
INSERT INTO `elder_disease_tb` VALUES (3, 109, NULL);
INSERT INTO `elder_disease_tb` VALUES (4, 110, NULL);
INSERT INTO `elder_disease_tb` VALUES (5, 111, NULL);
INSERT INTO `elder_disease_tb` VALUES (6, 111, NULL);
INSERT INTO `elder_disease_tb` VALUES (7, 112, '\n								   							<i id="iConst" class="fa fa-check"></i>');
INSERT INTO `elder_disease_tb` VALUES (8, 112, NULL);
INSERT INTO `elder_disease_tb` VALUES (9, 113, '');
INSERT INTO `elder_disease_tb` VALUES (10, 114, 'aaaaaa');
INSERT INTO `elder_disease_tb` VALUES (11, 115, NULL);
INSERT INTO `elder_disease_tb` VALUES (12, 116, NULL);
INSERT INTO `elder_disease_tb` VALUES (13, 117, 'jkbkjbk,');
INSERT INTO `elder_disease_tb` VALUES (14, 118, 'بفبغيبغ');
INSERT INTO `elder_disease_tb` VALUES (15, 144, NULL);
INSERT INTO `elder_disease_tb` VALUES (16, 145, NULL);
INSERT INTO `elder_disease_tb` VALUES (17, 146, NULL);
INSERT INTO `elder_disease_tb` VALUES (18, 147, NULL);
INSERT INTO `elder_disease_tb` VALUES (19, 148, NULL);
INSERT INTO `elder_disease_tb` VALUES (20, 149, NULL);
INSERT INTO `elder_disease_tb` VALUES (21, 150, 'hkh');
INSERT INTO `elder_disease_tb` VALUES (22, 150, NULL);
INSERT INTO `elder_disease_tb` VALUES (23, 151, 'vjvghhvh');
INSERT INTO `elder_disease_tb` VALUES (24, 153, 'لاسنلايءس');
INSERT INTO `elder_disease_tb` VALUES (25, 169, NULL);
INSERT INTO `elder_disease_tb` VALUES (26, 223, 'مريض ويحتاج لمساعدة');

-- --------------------------------------------------------

-- 
-- Table structure for table `elder_doc_tb`
-- 

CREATE TABLE `elder_doc_tb` (
  `elder_doc_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `file_id` int(11) default NULL COMMENT 'FK file_tb\nرقم الملف المسلسل',
  `doc_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nنوع المصنف',
  `doc_path` varchar(200) default NULL COMMENT 'مسار وجود المصنف',
  `created_on` datetime default NULL COMMENT 'تاريخ الادخال',
  `created_by` varchar(200) default NULL COMMENT 'FK user_tb\nاسم المستخدم مدخل البيانات',
  PRIMARY KEY  (`elder_doc_id`),
  KEY `FK_SubConstant_ElderDoc_idx` (`doc_type_id`),
  KEY `FK_Elder_ElderDoc_idx` (`file_id`),
  KEY `FK_Users_ElderDoc_idx` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي صور الأوراق الثبوتية الخاصة بالمسن' AUTO_INCREMENT=23 ;

-- 
-- Dumping data for table `elder_doc_tb`
-- 

INSERT INTO `elder_doc_tb` VALUES (20, 1, 64, '12015185032.jpg', NULL, NULL);
INSERT INTO `elder_doc_tb` VALUES (21, 1, 65, '1590460312.jpg', NULL, NULL);
INSERT INTO `elder_doc_tb` VALUES (22, 1, 64, '11590427496.jpg', NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `elder_interesting_tb`
-- 

CREATE TABLE `elder_interesting_tb` (
  `elder_interesting_id` int(11) NOT NULL auto_increment,
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `interesting_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nنوع النشاط المهتم به المسن',
  PRIMARY KEY  (`elder_interesting_id`),
  KEY `FK_Survey_ElderInteresting_idx` (`survey_id`),
  KEY `FK_SubConstant_Elder_Interesting_idx` (`interesting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الأنشطة التي يهتم بها المسن' AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `elder_interesting_tb`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `elder_pariah_tb`
-- 

CREATE TABLE `elder_pariah_tb` (
  `elder_pariah_id` int(11) NOT NULL auto_increment COMMENT 'PK\nمسلسل',
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبانة',
  `elder_pariah_reason_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nسبب كون المسن منبوذ مثلا: اناني - سليط اللسان - عصبي',
  PRIMARY KEY  (`elder_pariah_id`),
  KEY `FK_SubConstant_ElderPariah_idx` (`elder_pariah_reason_id`),
  KEY `FK_Survey_ElderPariah_idx` (`survey_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على أسباب كون المسن منبوذ' AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `elder_pariah_tb`
-- 

INSERT INTO `elder_pariah_tb` VALUES (3, 175, 206);
INSERT INTO `elder_pariah_tb` VALUES (4, 175, 207);
INSERT INTO `elder_pariah_tb` VALUES (5, 175, 210);

-- --------------------------------------------------------

-- 
-- Table structure for table `elder_room_tb`
-- 

CREATE TABLE `elder_room_tb` (
  `elder_room_id` int(11) NOT NULL auto_increment,
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `home_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nوصف السكن بالتفصيل للمسن',
  `room_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nطبيعة غرفة المسن مثلا:مستقله- مع الأبناء',
  `clothes_covers_status_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nوصف ملابس واغطية المسن',
  `room_ventilation_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nحالة التهوية في غرفة المسن',
  `room_lighting_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nحالة اضاءة الغرفة',
  `has_closet` int(1) default NULL COMMENT 'هل يوجد خزانة ملابس',
  `has_good_bed` int(1) default NULL COMMENT 'هل يوجد سرير وفرشة مناسبة',
  `has_medicine_cupboard` int(1) default NULL COMMENT 'هل يوجد مكان مخصص للأدوية',
  `room_need_maintenance` int(1) default NULL COMMENT 'هل الغرفة بحاجة الى صيانة',
  `room_maintenance_details` varchar(45) default NULL COMMENT 'توضيح نوع الصيانة التي تحتاجها الغرفة',
  `bathroom_status_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nوصف حالة دورة المياه',
  `bathroom_maintenance_details` varchar(45) default NULL COMMENT 'توضيح الصيانة التي تحتاجها دورة المياه',
  `elder_higiene_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالنظافة الشخصية للمسن',
  PRIMARY KEY  (`elder_room_id`),
  KEY `FK_Survey_ElderRoom_idx` (`survey_id`),
  KEY `FK_SubConstant_ElderRoom_Room_idx` (`room_type_id`),
  KEY `FK_SubConstant_ElderRoom_Clothes_idx` (`clothes_covers_status_id`),
  KEY `FK_SubConstant_ElderRoom_Ventilation_idx` (`room_ventilation_id`),
  KEY `FK_SubConstant_ElderRoom_lighting_idx` (`room_lighting_id`),
  KEY `FK_SubConstant_ElderRoom_Bathroom_idx` (`bathroom_status_id`),
  KEY `FK_SubConstant_ElderRoom_Hygiene_idx` (`elder_higiene_id`),
  KEY `FK_SubConstant_ElderRoom_hometype_idx` (`home_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات حالة غرفة المسن' AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `elder_room_tb`
-- 

INSERT INTO `elder_room_tb` VALUES (1, 132, NULL, 98, 104, 107, 109, 110, 110, 110, 110, NULL, 115, NULL, 117);
INSERT INTO `elder_room_tb` VALUES (2, 133, 203, 97, 102, 106, 108, 110, 110, 110, 110, NULL, 113, NULL, 118);
INSERT INTO `elder_room_tb` VALUES (3, 134, 203, 97, 104, 106, 108, 111, 111, 110, 110, 'صسصصص', 116, 'يبسشيبسص', 118);
INSERT INTO `elder_room_tb` VALUES (4, 135, 203, 97, 102, 106, 108, 111, 111, 110, 111, '', 116, 'تلنلنهل', 118);
INSERT INTO `elder_room_tb` VALUES (5, 157, 204, 98, 101, 107, 108, 110, 110, 111, 110, 'يبسسبيسبيسي', 114, '', 117);
INSERT INTO `elder_room_tb` VALUES (6, 158, 204, 98, 104, 107, 109, 110, 111, 110, 110, 'صيانة', 115, 'يبسيبصسي', 118);
INSERT INTO `elder_room_tb` VALUES (7, 223, 203, 97, 102, 106, 108, 111, 111, 111, 110, 'يبلبيبلبثفثقغففقغق', 116, 'وكمبكميكمبلةبكمبةمكةيمل يليبلةيبكملبيكمل', 118);

-- --------------------------------------------------------

-- 
-- Table structure for table `elder_tb`
-- 

CREATE TABLE `elder_tb` (
  `elder_id` int(9) NOT NULL default '0' COMMENT 'رقم هوية المسن',
  `elder_category_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nتصنيف العضو',
  `first_name` varchar(45) default NULL COMMENT 'الاسم الأول',
  `middle_name` varchar(45) default NULL COMMENT 'اسم الاب',
  `third_name` varchar(45) default NULL COMMENT 'اسم الجد',
  `last_name` varchar(45) default NULL COMMENT 'اسم العائلة',
  `dob` date default NULL COMMENT 'تاريخ الميلاد',
  `sex_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالجنس',
  `status_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالحالة الاجتماعية',
  `governorate_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالمحافظة',
  `region` int(11) default NULL COMMENT 'المنطقة',
  `full_address` int(11) default NULL COMMENT 'وصف العنوان بالكامل',
  `phone` varchar(45) default NULL COMMENT 'رقم الهاتف',
  `mobile_first` varchar(45) default NULL COMMENT 'رقم الجوال 1',
  `mobile_second` varchar(45) default NULL COMMENT 'رقم الجوال 2',
  `education_level_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالمؤهل العلمي',
  `specialization_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالتخصص',
  `current_job_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالعمل الحالي',
  `previous_job_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالعمل السابق',
  `insurance_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nنوع التأمين',
  `death_date` date default NULL COMMENT 'تاريخ الوفاة',
  PRIMARY KEY  (`elder_id`),
  KEY `FK_SubConstant_Elder_idx` (`sex_id`),
  KEY `FK_SubConstant_Elser_Status_idx` (`status_id`),
  KEY `FK_SubConstant_Elser_Governorate_idx` (`governorate_id`),
  KEY `FK_SubConstant_Elder_Edu_idx` (`education_level_id`),
  KEY `FK_SubConstant_Elder_Special_idx` (`specialization_id`),
  KEY `FK_SubConstant_Elder_CurJob_idx` (`current_job_id`),
  KEY `FK_SubConstant_Elder_PreJob_idx` (`previous_job_id`),
  KEY `FK_SubConstant_Elder_Insurance_idx` (`insurance_type_id`),
  KEY `FK_SubConstant_Elder_Category_idx` (`elder_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات المسنين';

-- 
-- Dumping data for table `elder_tb`
-- 

INSERT INTO `elder_tb` VALUES (901111111, 176, 'عبد الله', 'محمد', 'احمد', 'حسن', '1945-01-01', 1, 5, 19, 322, 237, '2822222', '0599111222', '', 27, 34, 48, 51, 8, '2015-11-30');
INSERT INTO `elder_tb` VALUES (901232323, 175, 'عبد الرحمن', 'محمد', 'محمود', 'احمد', '1953-01-28', 1, 184, 21, 0, 0, '2422344', '0599277652', '', 28, 34, 48, 52, 9, NULL);
INSERT INTO `elder_tb` VALUES (903333333, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 0, 0, '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `elder_tb` VALUES (903445663, 175, 'محمود', 'موسى', 'ابراهيم', 'عثمان', '1944-06-06', 1, 184, 21, 0, 0, '', '', '', 28, 33, 48, 51, 9, NULL);
INSERT INTO `elder_tb` VALUES (901521823, 175, 'dssfds', 'ddasd', 'sdsda', 'dsasd', '1910-02-01', 1, 183, 18, 0, 0, '0825874514', '0598999048', '0598999048', 24, 0, 47, 58, 62, NULL);
INSERT INTO `elder_tb` VALUES (90552144, 175, 'حامد', 'حامد', 'حماد', 'حماد', '1890-02-04', 1, 183, 18, 217, 256, '028745411', '0598999048', '0598900000', 23, 32, 49, 55, 61, '0000-00-00');
INSERT INTO `elder_tb` VALUES (98745632, 175, 'اكرم ', 'اكرم', 'اركم', 'اكرم', '1920-02-03', 1, 5, 20, 0, 0, '025857455', '0598999048', '0587444444', 23, 0, 47, 58, 62, NULL);
INSERT INTO `elder_tb` VALUES (903635001, 175, 'وسيم', 'محمد', 'محمد', 'عابد', '1929-12-17', 1, 184, 18, 217, 254, '0598999048', '0598999048', '0258745444', 28, 32, 47, 58, 62, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `employee_tb`
-- 

CREATE TABLE `employee_tb` (
  `employee_id` int(11) NOT NULL auto_increment COMMENT 'مسلسل',
  `national_id` int(9) default '0' COMMENT 'رقم الهوية',
  `emp_id` varchar(45) default NULL COMMENT 'الرقم الوظيفي',
  `name` varchar(200) default NULL COMMENT 'الاسم',
  `sex_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالجنس',
  `job_title_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالمسمى الوظيفي',
  `mobile` varchar(45) default NULL COMMENT 'رقم الجوال',
  `phone` varchar(45) default NULL COMMENT 'رقم الهاتف',
  `email` varchar(45) default NULL COMMENT 'الايميل',
  `is_active` int(1) default NULL COMMENT 'هل الموظف على رأس عمله',
  PRIMARY KEY  (`employee_id`),
  UNIQUE KEY `national_id_UNIQUE` (`national_id`),
  KEY `FK_SubConstant_Employee_idx` (`job_title_id`),
  KEY `FK_SubConstant_Employee_Sex_idx` (`sex_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات الموظفين\nمرتبط بجدول الثوابت' AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `employee_tb`
-- 

INSERT INTO `employee_tb` VALUES (1, 801064239, '1', 'احمد', 1, 3, '0599988776', '2822222', 'admin@gmail.com', 1);
INSERT INTO `employee_tb` VALUES (2, 123456789, '4', 'عمر', 1, 3, '0599887665', '2866655', ' omar@gmail.com', 1);
INSERT INTO `employee_tb` VALUES (3, 111111111, '3', 'hh', 1, 3, '3333333333', '3333333', 'admin@gmail.com', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `family_cooperation_tb`
-- 

CREATE TABLE `family_cooperation_tb` (
  `family_cooperation_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `is_cooperative_family` int(1) default NULL COMMENT 'هل الأسرة متعاونة مع الباحث الاجتماعي',
  `cooperative_persone_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nصلة قرابة الشخص الذي استعان به الباحث في حال كانت الاسرة غير متعاونة مثلا: جيران -أقارب-أصدقاء',
  `cooperative_persone_id` int(11) default NULL COMMENT 'رقم هوية الشخص الذي استعان به الباحث في حال كانت الاسرة غير متعاونة',
  `cooperative_persone_name` varchar(200) default NULL COMMENT 'اسم الشخص الذي استعان به الباحث',
  `cooperative_persone_mobile` varchar(45) default NULL COMMENT 'رقم جوال الشخص الذي استعان به الباحث',
  `cooperative_persone_address` varchar(200) default NULL COMMENT 'عنوان الشخص الذي استعان به الباحث',
  PRIMARY KEY  (`family_cooperation_id`),
  KEY `FK_Survey_SurveyFamilyDetails_idx` (`survey_id`),
  KEY `FK_SubConstant_SurveyFamilyDetails_idx` (`cooperative_persone_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على تفاصيل متعلقة بتعاون الأسرة مع الباحث ' AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `family_cooperation_tb`
-- 

INSERT INTO `family_cooperation_tb` VALUES (1, 222, 110, 316, 2147483647, 'محمد محمد عابد', 'undefined', 'النصر');
INSERT INTO `family_cooperation_tb` VALUES (2, 223, 110, 316, 548745478, 'جميل محمد صقر', '0598999048', 'النصر-شارع النصر');

-- --------------------------------------------------------

-- 
-- Table structure for table `family_elder_relationship_tb`
-- 

CREATE TABLE `family_elder_relationship_tb` (
  `family_elder_relationship_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb',
  `respect` int(1) default NULL COMMENT 'احترام',
  `pariah` int(1) default NULL COMMENT 'متبوذ',
  `care` int(1) default NULL COMMENT 'الاهتمام',
  `provision_needs` int(1) default NULL,
  `no_provision_needs_reason` varchar(200) default NULL COMMENT 'سبب عدم توقير الأسرة لاحتياجات المسن',
  `psychological_support` int(1) default NULL COMMENT 'دعم نفسي',
  `legal_advice` int(11) default NULL COMMENT 'الحاجة الى عيادة قانونية',
  `legal_advice_reason` varchar(200) default NULL COMMENT 'سبب الحاجة الى عيادة قانونية',
  PRIMARY KEY  (`family_elder_relationship_id`),
  KEY `FK_Survey_FamilyElderRelationsip_idx` (`survey_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='علاقة الأسرة بالمسن' AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `family_elder_relationship_tb`
-- 

INSERT INTO `family_elder_relationship_tb` VALUES (1, 166, 110, 111, 110, 110, '', 110, 111, '');
INSERT INTO `family_elder_relationship_tb` VALUES (2, 223, 110, 111, 110, 110, '', 110, 111, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `family_member_tb`
-- 

CREATE TABLE `family_member_tb` (
  `family_member_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `elder_id` int(11) default NULL COMMENT 'FK elder_tb\nرقم هوية المسن',
  `survey_id` int(11) default NULL,
  `member_id` int(11) default NULL COMMENT 'رقم هوية الفرد',
  `member_name` varchar(200) default NULL COMMENT 'اسم الفرد',
  `member_sex_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nجنس الفرد',
  `relationship_id` int(11) default NULL COMMENT 'FK sub_constant\nصلة القرابة',
  `status_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالحالة الاجتماعية',
  `dob` date default NULL COMMENT 'تاريخ الميلاد',
  `education_level_id` int(11) default NULL COMMENT 'FK sub_constant\nالمستوى التعليمي',
  `health_status_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالحالة الصحية',
  `income_shekel` int(11) default NULL COMMENT 'دخل الفرد بالشيكل',
  `job` varchar(45) default NULL COMMENT 'مهنة الفرد',
  PRIMARY KEY  (`family_member_id`),
  KEY `FK_Elder_FamilyMember_idx` (`elder_id`),
  KEY `FK_SubConstant_FamilyMember_idx` (`member_sex_id`),
  KEY `FK_SubConstant_FamilyMember_Relation_idx` (`relationship_id`),
  KEY `FK_SubConstant_FamilyMember_Status_idx` (`status_id`),
  KEY `FK_SubConstant_FamilyMember_Edu_idx` (`education_level_id`),
  KEY `FK_SubConstant_FamilyMember_Health_idx` (`health_status_id`),
  KEY `FK_Survey_FamilyMember_idx` (`survey_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على افراد اسرة المسن' AUTO_INCREMENT=22 ;

-- 
-- Dumping data for table `family_member_tb`
-- 

INSERT INTO `family_member_tb` VALUES (1, 903333333, NULL, 802222222, 'احمد', 1, 11, 5, '2015-11-13', 25, 66, 0, 'لا يعمل');
INSERT INTO `family_member_tb` VALUES (2, 903333333, NULL, 804444444, 'علي', 1, 179, 5, '1980-01-29', 28, 66, 1000, 'معلم');
INSERT INTO `family_member_tb` VALUES (3, 903333333, NULL, 805555555, 'حسن', 1, 179, 5, '1970-05-05', 28, 66, 2000, 'تاجر');
INSERT INTO `family_member_tb` VALUES (4, 903333333, NULL, 802222222, 'احمد', 1, 11, 5, '2015-11-13', 25, 66, 0, 'لا يعمل');
INSERT INTO `family_member_tb` VALUES (5, 903333333, NULL, 804445554, 'محمد احمد', 1, 179, 5, '1979-01-09', 28, 66, 1000, 'محاسب');
INSERT INTO `family_member_tb` VALUES (6, 903333333, NULL, 804443333, 'احمد', 1, 179, 184, '1970-02-03', 28, 66, 1000, 'مدرس');
INSERT INTO `family_member_tb` VALUES (7, 903333333, NULL, 804445555, 'حسن', 1, 179, 184, '1975-07-17', 28, 66, 1000, 'مدرس');
INSERT INTO `family_member_tb` VALUES (9, 903333333, NULL, 802234661, 'حسن', 1, 179, 184, '1990-07-18', 28, 66, 1000, 'موظف');
INSERT INTO `family_member_tb` VALUES (10, 903333333, NULL, 401111111, 'علي', 1, 181, 5, '2000-02-02', 25, 66, 0, 'طالب');
INSERT INTO `family_member_tb` VALUES (11, 903333333, NULL, 802345678, 'علي', 1, 179, 5, '1989-11-30', 28, 66, 100, 'محاسب');
INSERT INTO `family_member_tb` VALUES (14, 903333333, NULL, 412223334, 'موسى محمد أحمد حسن', 1, 179, 5, '2000-06-22', 26, 66, 0, 'طالب');
INSERT INTO `family_member_tb` VALUES (15, 903333333, NULL, 801111111, 'ث', 1, 179, 5, '2015-11-19', 23, 66, 100, 'عامل');
INSERT INTO `family_member_tb` VALUES (16, 903445663, NULL, 804563456, 'موسى محمود', 1, 179, 184, '1979-11-29', 28, 66, 1000, 'معلم');
INSERT INTO `family_member_tb` VALUES (17, 901111111, 195, 803333333, 'محمد', 1, 179, 184, '1985-07-18', 28, 66, 1200, 'ممرض');
INSERT INTO `family_member_tb` VALUES (18, 901111111, 195, 905556664, 'مريم', 2, 178, 184, '1959-11-26', 25, 66, 0, 'ربة منزل');
INSERT INTO `family_member_tb` VALUES (20, 901111111, 195, 804444444, 'علي', 1, 179, 5, '1980-01-29', 28, 66, 1000, 'معلم');
INSERT INTO `family_member_tb` VALUES (21, 903635001, 223, 2147483647, 'محمد عبد العاطي عايد', 1, 179, 5, '1974-06-11', 23, 66, 1500, 'تاجر');

-- --------------------------------------------------------

-- 
-- Table structure for table `family_psychological_status_tb`
-- 

CREATE TABLE `family_psychological_status_tb` (
  `family_psychological_status_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `psychological_status_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالحالة النفسية',
  PRIMARY KEY  (`family_psychological_status_id`),
  KEY `FK_SubConstant_FamilyPsychoStatus_idx` (`psychological_status_id`),
  KEY `FK_Survey_FamilyPsychoStatus_idx` (`survey_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='حالة الاسرة الجتماعية والنفسية' AUTO_INCREMENT=9 ;

-- 
-- Dumping data for table `family_psychological_status_tb`
-- 

INSERT INTO `family_psychological_status_tb` VALUES (2, 167, 139);
INSERT INTO `family_psychological_status_tb` VALUES (3, 168, 138);
INSERT INTO `family_psychological_status_tb` VALUES (5, 168, 137);
INSERT INTO `family_psychological_status_tb` VALUES (6, 169, 138);
INSERT INTO `family_psychological_status_tb` VALUES (7, 223, 137);
INSERT INTO `family_psychological_status_tb` VALUES (8, 223, 139);

-- --------------------------------------------------------

-- 
-- Table structure for table `file_tb`
-- 

CREATE TABLE `file_tb` (
  `file_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم الملف مسلسل',
  `file_doc_id` int(11) default NULL COMMENT 'رقم الملف الورقي',
  `elder_id` int(11) default NULL COMMENT 'FK elder_tb\nرقم هوية المسن',
  `file_status_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nحالة الملف',
  `close_date` date default NULL COMMENT 'تاريخ اغلاق الملف',
  `close_reason_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nسبب الاغلاق',
  `created_on` datetime default NULL COMMENT 'تاريخ الادخال',
  `created_by` varchar(200) default NULL COMMENT 'FK users_tb\nاسم المستخدم الذي ادخل الملف',
  PRIMARY KEY  (`file_id`),
  KEY `FK_Elder_File_idx` (`elder_id`),
  KEY `FK_SubConstant_File_idx` (`file_status_id`),
  KEY `FK_Users_File_idx` (`created_by`),
  KEY `FK_SubConstant_File_CloseReason_idx` (`close_reason_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات ملف المسن' AUTO_INCREMENT=13 ;

-- 
-- Dumping data for table `file_tb`
-- 

INSERT INTO `file_tb` VALUES (1, NULL, 901111111, 170, NULL, NULL, NULL, NULL);
INSERT INTO `file_tb` VALUES (6, NULL, 903333333, 170, NULL, NULL, NULL, NULL);
INSERT INTO `file_tb` VALUES (7, NULL, 903445663, 170, NULL, NULL, NULL, NULL);
INSERT INTO `file_tb` VALUES (8, NULL, 901232323, 170, NULL, NULL, NULL, NULL);
INSERT INTO `file_tb` VALUES (9, NULL, 901521823, 170, NULL, NULL, NULL, NULL);
INSERT INTO `file_tb` VALUES (10, NULL, 90552144, 170, NULL, NULL, NULL, NULL);
INSERT INTO `file_tb` VALUES (11, NULL, 98745632, 170, NULL, NULL, NULL, NULL);
INSERT INTO `file_tb` VALUES (12, NULL, 903635001, 170, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `follow_up_tb`
-- 

CREATE TABLE `follow_up_tb` (
  `follow_up_id` int(11) NOT NULL auto_increment,
  `elder_id` int(11) default NULL,
  `researcher_id` int(11) default NULL,
  `visit_date` date default NULL,
  `visit_time` time default NULL,
  `visit_end_time` time default NULL,
  `visit_reason` varchar(200) default NULL,
  `notes` varchar(200) default NULL,
  `recommendation` varchar(200) default NULL,
  PRIMARY KEY  (`follow_up_id`),
  KEY `FK_Employee_Folloup_Researcher_idx` (`researcher_id`),
  KEY `FK_Elder_Followup_idx` (`elder_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على زيارات المتابعة للمسن' AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `follow_up_tb`
-- 

INSERT INTO `follow_up_tb` VALUES (4, 903333333, 3, '2015-12-16', '19:30:00', '19:30:00', 'متابعة2', 'تحسن2', 'تعديل استبانة');
INSERT INTO `follow_up_tb` VALUES (5, 903333333, 2, '2015-12-25', '19:30:00', '19:30:00', 'تفقد', 'تحسن', 'متابعة');

-- --------------------------------------------------------

-- 
-- Table structure for table `home_improvement_recomendation_tb`
-- 

CREATE TABLE `home_improvement_recomendation_tb` (
  `home_improvement_recomendation_id` int(11) NOT NULL auto_increment,
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `improvement_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nنوع التحسين',
  `improvement_details` varchar(200) default NULL COMMENT 'تفاصيل المساعدة\nفي حال كانت المساعدة تسديد ايجار بيت يكون التفصيل عبارة عن قيمة المساعدة\nفي حال كانت المساعدة اشياء اخرى يكون التفصيل هو تحديد الأشياء الأخرى',
  PRIMARY KEY  (`home_improvement_recomendation_id`),
  KEY `FK_Survey_HomeImprovement_idx` (`survey_id`),
  KEY `FK_SubConstant_HomeImprovement_idx` (`improvement_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على التوصيات الخاصة بتحسين سكن المسن' AUTO_INCREMENT=18 ;

-- 
-- Dumping data for table `home_improvement_recomendation_tb`
-- 

INSERT INTO `home_improvement_recomendation_tb` VALUES (1, 192, 169, NULL);
INSERT INTO `home_improvement_recomendation_tb` VALUES (2, 192, 167, NULL);
INSERT INTO `home_improvement_recomendation_tb` VALUES (3, 204, 164, NULL);
INSERT INTO `home_improvement_recomendation_tb` VALUES (7, 208, 164, '');
INSERT INTO `home_improvement_recomendation_tb` VALUES (8, 208, 167, '');
INSERT INTO `home_improvement_recomendation_tb` VALUES (9, 208, 162, '');
INSERT INTO `home_improvement_recomendation_tb` VALUES (10, 216, 164, '');
INSERT INTO `home_improvement_recomendation_tb` VALUES (13, 216, 168, '100');
INSERT INTO `home_improvement_recomendation_tb` VALUES (15, 216, 169, 'سرير');
INSERT INTO `home_improvement_recomendation_tb` VALUES (16, 223, 164, '');
INSERT INTO `home_improvement_recomendation_tb` VALUES (17, 223, 162, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `home_status_tb`
-- 

CREATE TABLE `home_status_tb` (
  `home_status_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `home_situation_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالوضع العام:ممتاز-جيد-متوسط-غير صالح للسكن',
  `home_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nنوع السكن مثل: ملك-اجار',
  `ceiling_type_id` int(11) default NULL COMMENT 'FK sub_constant_id\nنوع السقف',
  `ceiling_description` varchar(45) default NULL COMMENT 'تحديد نوع السقف في حال لم يكن من ضمن الخيارات: باطون - اسبست',
  `furniture_level_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nمستوى الأثاث',
  `furniture_needs` varchar(45) default NULL COMMENT 'اثاث بحاجه له المنزل',
  PRIMARY KEY  (`home_status_id`),
  KEY `FK_Survey_HomeStatus_idx` (`survey_id`),
  KEY `FK_SubConstant_HomeStatus_Situation_idx` (`home_situation_id`),
  KEY `FK_SubConstant_HomeStatus_Type_idx` (`home_type_id`),
  KEY `FK_SubConstant_HomeStatus_Ceiling_idx` (`ceiling_type_id`),
  KEY `FK_SubConstant_HomeStatus_furniture_idx` (`furniture_level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='حالة سكن الأسرة المسن الحالي' AUTO_INCREMENT=9 ;

-- 
-- Dumping data for table `home_status_tb`
-- 

INSERT INTO `home_status_tb` VALUES (1, 125, 83, 89, 91, NULL, 94, NULL);
INSERT INTO `home_status_tb` VALUES (2, 126, 83, 89, 92, 'جريد', 96, 'كنب');
INSERT INTO `home_status_tb` VALUES (3, 127, 85, 87, 92, 'سعف نخيل', 96, 'سرير');
INSERT INTO `home_status_tb` VALUES (4, 129, 83, 89, 91, '', 94, '');
INSERT INTO `home_status_tb` VALUES (5, 155, 83, 89, 92, 'سعف نخيل', 94, '');
INSERT INTO `home_status_tb` VALUES (6, 155, 85, 89, 91, '', 96, 'سرير');
INSERT INTO `home_status_tb` VALUES (7, 156, 85, 89, 91, '', 96, 'سرير');
INSERT INTO `home_status_tb` VALUES (8, 223, 83, 89, 91, '', 95, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `income_resources_details_tb`
-- 

CREATE TABLE `income_resources_details_tb` (
  `income_resources_details_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `income_resources_id` int(11) default NULL COMMENT 'FK income_resources_id\nرقم مجموع الدخل التابع له',
  `resource_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nمصدر الدخل',
  `organization_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nجمعيات خيرية أو مؤسسات دولية',
  `cash_income` int(11) default NULL COMMENT 'القيمة المالية للدخل',
  `package_income` varchar(200) default NULL COMMENT 'المساعدات العينية',
  `package_cash_value` int(11) default NULL COMMENT 'التقييم المالي للمساعدات العينية',
  PRIMARY KEY  (`income_resources_details_id`),
  KEY `FK_SubConstant_IncomeResources_idx` (`resource_id`),
  KEY `FK_IncomeResources_IncomeResourcesDet_idx` (`income_resources_id`),
  KEY `FK_SubConstant_IncomeResourcesDet_Org_idx` (`organization_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على مصادر دخل المسن وعائلته' AUTO_INCREMENT=27 ;

-- 
-- Dumping data for table `income_resources_details_tb`
-- 

INSERT INTO `income_resources_details_tb` VALUES (2, 4, 76, NULL, 100, NULL, NULL);
INSERT INTO `income_resources_details_tb` VALUES (3, 5, 75, 212, NULL, 'طحين', 100);
INSERT INTO `income_resources_details_tb` VALUES (4, 6, 72, NULL, 1000, NULL, NULL);
INSERT INTO `income_resources_details_tb` VALUES (6, 7, 81, NULL, 100, NULL, NULL);
INSERT INTO `income_resources_details_tb` VALUES (7, 7, 72, NULL, 1000, NULL, NULL);
INSERT INTO `income_resources_details_tb` VALUES (9, 7, 75, 214, 100, NULL, NULL);
INSERT INTO `income_resources_details_tb` VALUES (11, 9, 76, NULL, 100, NULL, 10);
INSERT INTO `income_resources_details_tb` VALUES (12, 10, 76, NULL, 1, 'ل', 1);
INSERT INTO `income_resources_details_tb` VALUES (18, 11, 72, NULL, 100, NULL, NULL);
INSERT INTO `income_resources_details_tb` VALUES (20, 13, 72, NULL, 1000, NULL, NULL);
INSERT INTO `income_resources_details_tb` VALUES (21, 14, 75, 212, NULL, 'طحين', 100);
INSERT INTO `income_resources_details_tb` VALUES (24, 17, 75, 213, 100, NULL, NULL);
INSERT INTO `income_resources_details_tb` VALUES (25, 18, 76, NULL, 1500, '1000', 1000);
INSERT INTO `income_resources_details_tb` VALUES (26, 19, 75, 212, 1544, '1000', 1874);

-- --------------------------------------------------------

-- 
-- Table structure for table `income_resources_tb`
-- 

CREATE TABLE `income_resources_tb` (
  `income_resources_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `total_income` int(11) default NULL COMMENT 'المجموع الكلي للدخل',
  `elder_portion` int(11) default NULL COMMENT 'حصة المسن من دخل الأسرة',
  PRIMARY KEY  (`income_resources_id`),
  KEY `FK_Survey_IncomeResources_idx` (`survey_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على مجموع دخل المسن وعائلته' AUTO_INCREMENT=21 ;

-- 
-- Dumping data for table `income_resources_tb`
-- 

INSERT INTO `income_resources_tb` VALUES (1, 181, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (2, 181, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (3, 182, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (4, 182, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (5, 182, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (6, 182, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (7, 183, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (8, 185, 100, 10);
INSERT INTO `income_resources_tb` VALUES (9, 186, 2000, 100);
INSERT INTO `income_resources_tb` VALUES (10, 187, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (11, 188, 100, 10);
INSERT INTO `income_resources_tb` VALUES (12, 189, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (13, 189, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (14, 189, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (15, 189, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (16, 189, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (17, 189, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (18, 223, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (19, 223, NULL, NULL);
INSERT INTO `income_resources_tb` VALUES (20, 223, 14555, 1000);

-- --------------------------------------------------------

-- 
-- Table structure for table `life_improvement_tb`
-- 

CREATE TABLE `life_improvement_tb` (
  `life_improvement_id` int(11) NOT NULL auto_increment,
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `elder_work_ability_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nقدرة المسن على العمل',
  `elder_work_type` varchar(45) default NULL COMMENT 'طبيعة العمل التي يمكن للمسن القيام بها',
  `family_member_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nامكانية تشغيل احد افراد الأسرة أو زوجة',
  `is_elder_need_training` int(1) default NULL COMMENT 'هل يوجد حاجة لتدريب المسن',
  `elder_training_type` varchar(45) default NULL COMMENT 'نوع التدريب الذي يحتاجه المسن',
  `can_start_project` int(1) default NULL COMMENT 'امكانية عمل مشروع صغير',
  `project_type` varchar(45) default NULL COMMENT 'نوع المشروع',
  `project_budget` int(11) default NULL COMMENT 'التكلفة المتوقعة لتنفيذ المشروع',
  PRIMARY KEY  (`life_improvement_id`),
  KEY `FK_Survey_LifeImprovement_idx` (`survey_id`),
  KEY `FK_SubConstant_LifeImprovement_idx` (`elder_work_ability_id`),
  KEY `FK_SubConstant_LifeImprovement_Family_idx` (`family_member_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات قدرة المسن وعائلته على العمل لتحسين مس' AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `life_improvement_tb`
-- 

INSERT INTO `life_improvement_tb` VALUES (2, 179, 142, 'نجار', NULL, 111, '', 111, '', NULL);
INSERT INTO `life_improvement_tb` VALUES (3, 180, 142, 'بائع', NULL, 111, '', 111, '', NULL);
INSERT INTO `life_improvement_tb` VALUES (4, 223, 143, 'حارس', 144, 111, '', 110, 'دكان', 15000);

-- --------------------------------------------------------

-- 
-- Table structure for table `loction_tree_tb`
-- 

CREATE TABLE `loction_tree_tb` (
  `loction_tree_id` varchar(45) NOT NULL COMMENT 'رقم شجرة المسؤولية',
  `loction_tree_desc` varchar(45) default NULL COMMENT 'وصف شجرة المسؤولية',
  `loction_tree_pairent` varchar(45) default NULL COMMENT 'FK location_tree_tb\nالأب',
  PRIMARY KEY  (`loction_tree_id`),
  KEY `FK_LocationTree_LocationTree_idx` (`loction_tree_pairent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي شجرة المسؤولية';

-- 
-- Dumping data for table `loction_tree_tb`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `medical_aid_recomendation_tb`
-- 

CREATE TABLE `medical_aid_recomendation_tb` (
  `medical_aid_recomendation_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `medical_aid_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nنوع المساعدة الطبية العينية',
  PRIMARY KEY  (`medical_aid_recomendation_id`),
  KEY `FK_Survey_MedicalAid_idx` (`survey_id`),
  KEY `FK_SubConstant_MedicalAid_idx` (`medical_aid_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT=' جدول يحتوي على توصيات الادارة بالمساعدات الطبية العينية الت' AUTO_INCREMENT=9 ;

-- 
-- Dumping data for table `medical_aid_recomendation_tb`
-- 

INSERT INTO `medical_aid_recomendation_tb` VALUES (2, 192, 158);
INSERT INTO `medical_aid_recomendation_tb` VALUES (3, 204, 157);
INSERT INTO `medical_aid_recomendation_tb` VALUES (4, 208, 157);
INSERT INTO `medical_aid_recomendation_tb` VALUES (5, 215, 157);
INSERT INTO `medical_aid_recomendation_tb` VALUES (6, 223, 157);
INSERT INTO `medical_aid_recomendation_tb` VALUES (7, 223, 154);
INSERT INTO `medical_aid_recomendation_tb` VALUES (8, 223, 151);

-- --------------------------------------------------------

-- 
-- Table structure for table `medication_availability_tb`
-- 

CREATE TABLE `medication_availability_tb` (
  `medication_availability_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `survey_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nرقم الاستبيان',
  `medicine_name` varchar(45) default NULL COMMENT 'اسم الدواء',
  `availability_status_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nحالة توفر الدواء مثلا: متوفر بشكل دائم- متقطع',
  `unavailable_reason` varchar(45) default NULL,
  PRIMARY KEY  (`medication_availability_id`),
  KEY `FK_Survey_MedicationAvailability_idx` (`survey_id`),
  KEY `FK_SubConstant_MedicationAvailability_idx` (`availability_status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على الأدوية وحالة توفرها' AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `medication_availability_tb`
-- 

INSERT INTO `medication_availability_tb` VALUES (4, 165, 'Glocofag', 121, 'المعبر');
INSERT INTO `medication_availability_tb` VALUES (5, 165, 'Amyral', 121, 'من الخارج');
INSERT INTO `medication_availability_tb` VALUES (6, 223, 'بيبيسي كولا', 121, 'غير متوفر');
INSERT INTO `medication_availability_tb` VALUES (7, 223, 'جلاكسي', 120, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `medication_need_tb`
-- 

CREATE TABLE `medication_need_tb` (
  `medication_need_id` int(11) NOT NULL auto_increment,
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبيان',
  `medication_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nنوع العلاج الذي يحتاجه الطبيب مثل:جراحة-أدوية-علاج طبيعي',
  `medication_details` varchar(45) default NULL COMMENT 'وصف العلاج المطلوب',
  PRIMARY KEY  (`medication_need_id`),
  KEY `FK_SubConstant_MedicationNeeds_idx` (`medication_type_id`),
  KEY `FK_Survey_MedicationNeed_idx` (`survey_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على احتياجات المسن العلاجية مثل: جراحة-أدوية-علاج' AUTO_INCREMENT=13 ;

-- 
-- Dumping data for table `medication_need_tb`
-- 

INSERT INTO `medication_need_tb` VALUES (1, 160, 123, 'أدوية');
INSERT INTO `medication_need_tb` VALUES (2, 160, 122, 'جراحة');
INSERT INTO `medication_need_tb` VALUES (3, 161, 123, 'اااا');
INSERT INTO `medication_need_tb` VALUES (5, 162, 124, 'علاج');
INSERT INTO `medication_need_tb` VALUES (6, 163, 123, 'jj');
INSERT INTO `medication_need_tb` VALUES (7, 163, 122, 'jjj');
INSERT INTO `medication_need_tb` VALUES (8, 163, 124, 'jjj');
INSERT INTO `medication_need_tb` VALUES (9, 163, 125, 'jjj');
INSERT INTO `medication_need_tb` VALUES (11, 165, 122, 'جراحة');
INSERT INTO `medication_need_tb` VALUES (12, 223, 123, 'مخدة طبية');

-- --------------------------------------------------------

-- 
-- Table structure for table `menu_page_tb`
-- 

CREATE TABLE `menu_page_tb` (
  `menu_page_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلس',
  `menu_id` int(11) NOT NULL COMMENT 'FK menu_tb\nرقم القائمة',
  `page_id` int(11) NOT NULL COMMENT 'FK page_tb\nرقم الصفحة',
  PRIMARY KEY  (`menu_page_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يربط الصفحات بالقوائم' AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `menu_page_tb`
-- 

INSERT INTO `menu_page_tb` VALUES (1, 1, 1);
INSERT INTO `menu_page_tb` VALUES (2, 2, 2);
INSERT INTO `menu_page_tb` VALUES (3, 2, 3);
INSERT INTO `menu_page_tb` VALUES (4, 3, 4);
INSERT INTO `menu_page_tb` VALUES (5, 3, 5);
INSERT INTO `menu_page_tb` VALUES (6, 3, 6);

-- --------------------------------------------------------

-- 
-- Table structure for table `menu_tb`
-- 

CREATE TABLE `menu_tb` (
  `menu_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `menu_name` varchar(45) default NULL COMMENT 'اسم القائمة',
  `menu_order` int(11) default NULL,
  PRIMARY KEY  (`menu_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على اسماء قوائم البرنامج' AUTO_INCREMENT=10 ;

-- 
-- Dumping data for table `menu_tb`
-- 

INSERT INTO `menu_tb` VALUES (1, 'الصفحة الرئيسية', 1);
INSERT INTO `menu_tb` VALUES (2, 'الموظفين', 2);
INSERT INTO `menu_tb` VALUES (3, 'المستخدمين', 3);
INSERT INTO `menu_tb` VALUES (4, 'الأعضاء', 4);
INSERT INTO `menu_tb` VALUES (5, 'الاستبانة', 5);
INSERT INTO `menu_tb` VALUES (6, 'مواعيد البحث الميداني', 6);
INSERT INTO `menu_tb` VALUES (7, 'ثوابت النظام', 7);
INSERT INTO `menu_tb` VALUES (8, 'الرسائل', 8);
INSERT INTO `menu_tb` VALUES (9, 'التقارير', 9);

-- --------------------------------------------------------

-- 
-- Table structure for table `page_tb`
-- 

CREATE TABLE `page_tb` (
  `page_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `page_title` varchar(45) default NULL COMMENT 'اسم الصفحة',
  `page_url` varchar(45) default NULL COMMENT 'مسار الصفحة',
  `page_order` int(11) default NULL COMMENT 'ترتيب الصفحة',
  PRIMARY KEY  (`page_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي اسماء صفحات البرنامج' AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `page_tb`
-- 

INSERT INTO `page_tb` VALUES (1, 'الصفحة الرئيسية', 'home', 1);
INSERT INTO `page_tb` VALUES (2, 'عرض الموظفين', 'employee/employees', 1);
INSERT INTO `page_tb` VALUES (3, 'اضافة موظف', 'employee/empform', 2);
INSERT INTO `page_tb` VALUES (4, 'عرض المستخدمين', 'user/users', 1);
INSERT INTO `page_tb` VALUES (5, 'اضافة مستخدم', 'user/userform', 2);
INSERT INTO `page_tb` VALUES (6, 'صلاحيات أنواع المستخدمين', 'usertypeperm/usertypepermession', 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `sub_constant_tb`
-- 

CREATE TABLE `sub_constant_tb` (
  `sub_constant_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `constant_id` int(11) default NULL COMMENT 'FK Constant_TB\nرقم الثابت',
  `sub_constant_name` varchar(45) default NULL COMMENT 'وصف تفصيل الثابت',
  `parent_id` int(11) default NULL,
  PRIMARY KEY  (`sub_constant_id`),
  KEY `CONSTANT_ID_idx` (`constant_id`),
  KEY `FK_CONSTANT_SUBCONSTANTCHILD_idx` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول حتوي تفاصيل الثوابت مثل: ذكر انثى - اعزب متزوج - تامين ' AUTO_INCREMENT=325 ;

-- 
-- Dumping data for table `sub_constant_tb`
-- 

INSERT INTO `sub_constant_tb` VALUES (1, 1, 'ذكر', NULL);
INSERT INTO `sub_constant_tb` VALUES (2, 1, 'انثى', NULL);
INSERT INTO `sub_constant_tb` VALUES (3, 3, 'باحث', NULL);
INSERT INTO `sub_constant_tb` VALUES (4, 3, 'كاتب', NULL);
INSERT INTO `sub_constant_tb` VALUES (5, 2, 'أعزب', NULL);
INSERT INTO `sub_constant_tb` VALUES (6, 3, 'مدير', NULL);
INSERT INTO `sub_constant_tb` VALUES (7, 3, 'مساعد باحث', NULL);
INSERT INTO `sub_constant_tb` VALUES (8, 7, 'موظف حكومي', NULL);
INSERT INTO `sub_constant_tb` VALUES (9, 7, 'تأمين كبار السن', NULL);
INSERT INTO `sub_constant_tb` VALUES (10, 7, 'تأمين عمال', NULL);
INSERT INTO `sub_constant_tb` VALUES (11, 4, 'أب', NULL);
INSERT INTO `sub_constant_tb` VALUES (12, 3, 'اداري', NULL);
INSERT INTO `sub_constant_tb` VALUES (13, 20, 'كاتب', NULL);
INSERT INTO `sub_constant_tb` VALUES (14, 20, 'صلاحيات باحث', NULL);
INSERT INTO `sub_constant_tb` VALUES (15, 21, 'جمعيات', NULL);
INSERT INTO `sub_constant_tb` VALUES (17, 7, 'مصاب انتقاضة الاقصى', NULL);
INSERT INTO `sub_constant_tb` VALUES (18, 22, 'الشمال', NULL);
INSERT INTO `sub_constant_tb` VALUES (19, 22, 'غزة', NULL);
INSERT INTO `sub_constant_tb` VALUES (20, 22, 'الوسطى', NULL);
INSERT INTO `sub_constant_tb` VALUES (21, 22, 'خانيونس', NULL);
INSERT INTO `sub_constant_tb` VALUES (22, 22, 'رفح', NULL);
INSERT INTO `sub_constant_tb` VALUES (23, 23, 'أمي', NULL);
INSERT INTO `sub_constant_tb` VALUES (24, 23, 'ابتدائي', NULL);
INSERT INTO `sub_constant_tb` VALUES (25, 23, 'إعدادي', NULL);
INSERT INTO `sub_constant_tb` VALUES (26, 23, 'ثانوي', NULL);
INSERT INTO `sub_constant_tb` VALUES (27, 23, 'دبلوم', NULL);
INSERT INTO `sub_constant_tb` VALUES (28, 23, 'بكالوريوس', NULL);
INSERT INTO `sub_constant_tb` VALUES (29, 23, 'ليسانس', NULL);
INSERT INTO `sub_constant_tb` VALUES (30, 23, 'ماجستير', NULL);
INSERT INTO `sub_constant_tb` VALUES (31, 23, 'دراسات عليا', NULL);
INSERT INTO `sub_constant_tb` VALUES (32, 24, 'إدارة أعمال', NULL);
INSERT INTO `sub_constant_tb` VALUES (33, 24, 'محاسبة', NULL);
INSERT INTO `sub_constant_tb` VALUES (34, 24, 'تعليم', NULL);
INSERT INTO `sub_constant_tb` VALUES (35, 24, 'التجارة', NULL);
INSERT INTO `sub_constant_tb` VALUES (36, 24, 'الصحة', NULL);
INSERT INTO `sub_constant_tb` VALUES (37, 24, 'الدعم النفسي', NULL);
INSERT INTO `sub_constant_tb` VALUES (38, 24, 'العمل المجتمعي', NULL);
INSERT INTO `sub_constant_tb` VALUES (39, 24, 'بحث وتخطيط', NULL);
INSERT INTO `sub_constant_tb` VALUES (40, 24, 'بناء مؤسسات', NULL);
INSERT INTO `sub_constant_tb` VALUES (41, 24, 'زراعة', NULL);
INSERT INTO `sub_constant_tb` VALUES (42, 24, 'حقوق', NULL);
INSERT INTO `sub_constant_tb` VALUES (43, 24, 'هندسة', NULL);
INSERT INTO `sub_constant_tb` VALUES (44, 24, 'تكنولوجيا معلومات', NULL);
INSERT INTO `sub_constant_tb` VALUES (45, 24, 'تعليم مهني', NULL);
INSERT INTO `sub_constant_tb` VALUES (46, 24, 'تعليم حرفي', NULL);
INSERT INTO `sub_constant_tb` VALUES (47, 25, 'بدون', NULL);
INSERT INTO `sub_constant_tb` VALUES (48, 25, 'متقاعد', NULL);
INSERT INTO `sub_constant_tb` VALUES (49, 25, 'قطاع خاص', NULL);
INSERT INTO `sub_constant_tb` VALUES (50, 26, 'مزارع', NULL);
INSERT INTO `sub_constant_tb` VALUES (51, 26, 'حكومي', NULL);
INSERT INTO `sub_constant_tb` VALUES (52, 26, 'وكالة', NULL);
INSERT INTO `sub_constant_tb` VALUES (53, 26, 'خاص', NULL);
INSERT INTO `sub_constant_tb` VALUES (54, 26, 'صناعة', NULL);
INSERT INTO `sub_constant_tb` VALUES (55, 26, 'حرفة', NULL);
INSERT INTO `sub_constant_tb` VALUES (56, 26, 'فني صيانة', NULL);
INSERT INTO `sub_constant_tb` VALUES (57, 26, 'شرطة', NULL);
INSERT INTO `sub_constant_tb` VALUES (58, 26, 'أجهزة أمنية', NULL);
INSERT INTO `sub_constant_tb` VALUES (59, 7, 'شؤون اجتماعية', NULL);
INSERT INTO `sub_constant_tb` VALUES (60, 7, 'عسكري', NULL);
INSERT INTO `sub_constant_tb` VALUES (61, 7, 'بدون تأمين', NULL);
INSERT INTO `sub_constant_tb` VALUES (62, 7, 'بحاجة لتأمين', NULL);
INSERT INTO `sub_constant_tb` VALUES (63, 27, 'هوية', NULL);
INSERT INTO `sub_constant_tb` VALUES (64, 27, 'شهادة ميلاد', NULL);
INSERT INTO `sub_constant_tb` VALUES (65, 27, 'جواز سفر', NULL);
INSERT INTO `sub_constant_tb` VALUES (66, 28, 'سليم', NULL);
INSERT INTO `sub_constant_tb` VALUES (67, 28, 'مريض', NULL);
INSERT INTO `sub_constant_tb` VALUES (71, 29, 'عمل خاص', NULL);
INSERT INTO `sub_constant_tb` VALUES (72, 29, 'راتب تقاعد', NULL);
INSERT INTO `sub_constant_tb` VALUES (73, 29, 'وكالة الشئون الإجتماعية الحكومية', NULL);
INSERT INTO `sub_constant_tb` VALUES (74, 29, 'وكالة الغوث لتشغيل اللاجئين', NULL);
INSERT INTO `sub_constant_tb` VALUES (75, 29, 'جمعيات خيرية أهلية / دولية', NULL);
INSERT INTO `sub_constant_tb` VALUES (76, 29, 'أملاك وعقارات مدرة للدخل', NULL);
INSERT INTO `sub_constant_tb` VALUES (77, 29, 'مساعدات شهرية / أسرى', NULL);
INSERT INTO `sub_constant_tb` VALUES (78, 29, 'مساعدات شهرية / جرحى', NULL);
INSERT INTO `sub_constant_tb` VALUES (79, 29, 'مساعدات شهرية / شهيد', NULL);
INSERT INTO `sub_constant_tb` VALUES (80, 29, 'مساعدات كفالات أيتام', NULL);
INSERT INTO `sub_constant_tb` VALUES (81, 29, 'إعالة من الأبناء/ الأقارب', NULL);
INSERT INTO `sub_constant_tb` VALUES (82, 30, 'ممتاز', NULL);
INSERT INTO `sub_constant_tb` VALUES (83, 30, 'جيد', NULL);
INSERT INTO `sub_constant_tb` VALUES (84, 30, 'متوسط', NULL);
INSERT INTO `sub_constant_tb` VALUES (85, 30, 'غير صالح للسكن', NULL);
INSERT INTO `sub_constant_tb` VALUES (86, 31, 'ملك', NULL);
INSERT INTO `sub_constant_tb` VALUES (87, 31, 'إيحار', NULL);
INSERT INTO `sub_constant_tb` VALUES (88, 31, 'مع الأقرباء', NULL);
INSERT INTO `sub_constant_tb` VALUES (89, 31, 'أرض حكومية', NULL);
INSERT INTO `sub_constant_tb` VALUES (90, 32, 'باطون', NULL);
INSERT INTO `sub_constant_tb` VALUES (91, 32, 'إسبست / صفيح', NULL);
INSERT INTO `sub_constant_tb` VALUES (92, 32, 'غير ذلك', NULL);
INSERT INTO `sub_constant_tb` VALUES (93, 33, 'ممتاز', NULL);
INSERT INTO `sub_constant_tb` VALUES (94, 33, 'جيد', NULL);
INSERT INTO `sub_constant_tb` VALUES (95, 33, 'قديم', NULL);
INSERT INTO `sub_constant_tb` VALUES (96, 33, 'ينقص الكثير من الضروريات', NULL);
INSERT INTO `sub_constant_tb` VALUES (97, 34, 'غرفة مستقلة', NULL);
INSERT INTO `sub_constant_tb` VALUES (98, 34, 'غرفة مع الابناء', NULL);
INSERT INTO `sub_constant_tb` VALUES (99, 34, 'مع العائلة بدون مكان مخص', NULL);
INSERT INTO `sub_constant_tb` VALUES (100, 34, 'مكان منفصل', NULL);
INSERT INTO `sub_constant_tb` VALUES (101, 35, 'ممتازة', NULL);
INSERT INTO `sub_constant_tb` VALUES (102, 35, 'جيدة', NULL);
INSERT INTO `sub_constant_tb` VALUES (103, 35, 'متواضعة', NULL);
INSERT INTO `sub_constant_tb` VALUES (104, 35, 'قديمة', NULL);
INSERT INTO `sub_constant_tb` VALUES (105, 35, 'مهلهلة', NULL);
INSERT INTO `sub_constant_tb` VALUES (106, 36, 'جيدة', NULL);
INSERT INTO `sub_constant_tb` VALUES (107, 36, 'غير جيدة', NULL);
INSERT INTO `sub_constant_tb` VALUES (108, 37, 'مضيئة', NULL);
INSERT INTO `sub_constant_tb` VALUES (109, 37, 'مظلمة', NULL);
INSERT INTO `sub_constant_tb` VALUES (110, 38, 'نعم', NULL);
INSERT INTO `sub_constant_tb` VALUES (111, 38, 'لا', NULL);
INSERT INTO `sub_constant_tb` VALUES (112, 39, 'ممتاز', NULL);
INSERT INTO `sub_constant_tb` VALUES (113, 39, 'جيد', NULL);
INSERT INTO `sub_constant_tb` VALUES (114, 39, 'غير مناسب', NULL);
INSERT INTO `sub_constant_tb` VALUES (115, 39, 'بحاجة للصيانة', NULL);
INSERT INTO `sub_constant_tb` VALUES (116, 39, 'بحاجة للترميم', NULL);
INSERT INTO `sub_constant_tb` VALUES (117, 40, 'ممتازة', NULL);
INSERT INTO `sub_constant_tb` VALUES (118, 40, 'جيدة', NULL);
INSERT INTO `sub_constant_tb` VALUES (119, 40, 'يفتقر للنظافة', NULL);
INSERT INTO `sub_constant_tb` VALUES (120, 41, 'متوفر بانتظام', NULL);
INSERT INTO `sub_constant_tb` VALUES (121, 41, 'متقطع', NULL);
INSERT INTO `sub_constant_tb` VALUES (122, 42, 'جراحة', NULL);
INSERT INTO `sub_constant_tb` VALUES (123, 42, 'أدوية', NULL);
INSERT INTO `sub_constant_tb` VALUES (124, 42, 'علاج', NULL);
INSERT INTO `sub_constant_tb` VALUES (125, 42, 'متابعة خاصة لا يمكن للأسرة توفيرها', NULL);
INSERT INTO `sub_constant_tb` VALUES (126, 43, 'انطوائي', NULL);
INSERT INTO `sub_constant_tb` VALUES (127, 43, 'مبادر', NULL);
INSERT INTO `sub_constant_tb` VALUES (128, 43, 'مشاركة الآخرين', NULL);
INSERT INTO `sub_constant_tb` VALUES (129, 43, 'الإهتمام بمن حوله', NULL);
INSERT INTO `sub_constant_tb` VALUES (130, 43, 'أناني', NULL);
INSERT INTO `sub_constant_tb` VALUES (136, 44, 'منعزلة', NULL);
INSERT INTO `sub_constant_tb` VALUES (137, 44, 'مشاركة', NULL);
INSERT INTO `sub_constant_tb` VALUES (138, 44, 'عدوانية', NULL);
INSERT INTO `sub_constant_tb` VALUES (139, 44, 'متفائلة', NULL);
INSERT INTO `sub_constant_tb` VALUES (140, 44, 'منغلقة', NULL);
INSERT INTO `sub_constant_tb` VALUES (141, 44, 'منفتحة', NULL);
INSERT INTO `sub_constant_tb` VALUES (142, 45, 'قادر', NULL);
INSERT INTO `sub_constant_tb` VALUES (143, 45, 'غير قادر', NULL);
INSERT INTO `sub_constant_tb` VALUES (144, 46, 'الزوج / ة', NULL);
INSERT INTO `sub_constant_tb` VALUES (145, 46, 'أحد أفراد الأسرة', NULL);
INSERT INTO `sub_constant_tb` VALUES (146, 47, 'دورية', NULL);
INSERT INTO `sub_constant_tb` VALUES (147, 47, 'لمرة واحدة', NULL);
INSERT INTO `sub_constant_tb` VALUES (148, 48, 'أغذية', NULL);
INSERT INTO `sub_constant_tb` VALUES (149, 48, 'غذاء خاص', NULL);
INSERT INTO `sub_constant_tb` VALUES (150, 49, 'كرسي متحرك', NULL);
INSERT INTO `sub_constant_tb` VALUES (151, 49, 'سماعة أذن', NULL);
INSERT INTO `sub_constant_tb` VALUES (152, 49, 'نظارة', NULL);
INSERT INTO `sub_constant_tb` VALUES (153, 49, 'جهاز ضغط', NULL);
INSERT INTO `sub_constant_tb` VALUES (154, 49, 'جهاز سكر', NULL);
INSERT INTO `sub_constant_tb` VALUES (155, 49, 'عكاز', NULL);
INSERT INTO `sub_constant_tb` VALUES (156, 49, 'ووكر', NULL);
INSERT INTO `sub_constant_tb` VALUES (157, 49, 'أدوية', NULL);
INSERT INTO `sub_constant_tb` VALUES (158, 49, 'جراحة', NULL);
INSERT INTO `sub_constant_tb` VALUES (159, 49, 'فحوصات وتحاليل منتظمة', NULL);
INSERT INTO `sub_constant_tb` VALUES (160, 49, 'علاج طبيعي', NULL);
INSERT INTO `sub_constant_tb` VALUES (161, 49, 'متابعة صحية ميدانية', NULL);
INSERT INTO `sub_constant_tb` VALUES (162, 50, 'ترميم غرفة المسن', NULL);
INSERT INTO `sub_constant_tb` VALUES (163, 50, 'ترميم حمام / دورة مياه', NULL);
INSERT INTO `sub_constant_tb` VALUES (164, 50, 'أثاث البيت الخشبي', NULL);
INSERT INTO `sub_constant_tb` VALUES (165, 50, 'أجهزة كهربائية', NULL);
INSERT INTO `sub_constant_tb` VALUES (166, 50, 'ملابس', NULL);
INSERT INTO `sub_constant_tb` VALUES (167, 50, 'أغطية', NULL);
INSERT INTO `sub_constant_tb` VALUES (168, 50, 'تسديد إيجار البيت', NULL);
INSERT INTO `sub_constant_tb` VALUES (169, 50, 'أشياء أخرى', NULL);
INSERT INTO `sub_constant_tb` VALUES (170, 51, 'فعال', NULL);
INSERT INTO `sub_constant_tb` VALUES (171, 51, 'ملغي', NULL);
INSERT INTO `sub_constant_tb` VALUES (172, 51, 'مغلق', NULL);
INSERT INTO `sub_constant_tb` VALUES (173, 52, 'وفاة', NULL);
INSERT INTO `sub_constant_tb` VALUES (174, 52, 'الغاء غضوية', NULL);
INSERT INTO `sub_constant_tb` VALUES (175, 53, 'أ', NULL);
INSERT INTO `sub_constant_tb` VALUES (176, 53, 'ب', NULL);
INSERT INTO `sub_constant_tb` VALUES (177, 53, 'ج', NULL);
INSERT INTO `sub_constant_tb` VALUES (178, 4, 'ام', NULL);
INSERT INTO `sub_constant_tb` VALUES (179, 4, 'ابن', NULL);
INSERT INTO `sub_constant_tb` VALUES (180, 4, 'ابنة', NULL);
INSERT INTO `sub_constant_tb` VALUES (181, 4, 'حفيد', NULL);
INSERT INTO `sub_constant_tb` VALUES (182, 2, 'مطلق', NULL);
INSERT INTO `sub_constant_tb` VALUES (183, 2, 'أرمل', NULL);
INSERT INTO `sub_constant_tb` VALUES (184, 2, 'متزوج', NULL);
INSERT INTO `sub_constant_tb` VALUES (185, 54, 'الجهاز الهضمي', NULL);
INSERT INTO `sub_constant_tb` VALUES (186, 54, 'الجهاز التنفسي', NULL);
INSERT INTO `sub_constant_tb` VALUES (187, 54, 'الجهاز العصبي', NULL);
INSERT INTO `sub_constant_tb` VALUES (188, 54, 'الجهاز الدوري', NULL);
INSERT INTO `sub_constant_tb` VALUES (189, 54, 'الجهاز البولي', NULL);
INSERT INTO `sub_constant_tb` VALUES (190, 54, 'أمراض جلدية', NULL);
INSERT INTO `sub_constant_tb` VALUES (191, 54, 'زهايمر', NULL);
INSERT INTO `sub_constant_tb` VALUES (192, 54, 'النفسي', NULL);
INSERT INTO `sub_constant_tb` VALUES (193, 54, 'رعاش', NULL);
INSERT INTO `sub_constant_tb` VALUES (194, 54, 'الجهاز العظمي', NULL);
INSERT INTO `sub_constant_tb` VALUES (195, 54, 'شلل دماغي', NULL);
INSERT INTO `sub_constant_tb` VALUES (196, 54, 'الغدد', NULL);
INSERT INTO `sub_constant_tb` VALUES (197, 54, 'السرطان', NULL);
INSERT INTO `sub_constant_tb` VALUES (198, 54, 'العيون', NULL);
INSERT INTO `sub_constant_tb` VALUES (199, 54, 'إعاقة خلقية', NULL);
INSERT INTO `sub_constant_tb` VALUES (200, 54, 'إعاقة نتيجة إصابة  حرب', NULL);
INSERT INTO `sub_constant_tb` VALUES (201, 54, 'إعاقة نتيجة حادث', NULL);
INSERT INTO `sub_constant_tb` VALUES (202, 54, 'جهاز سمعي', NULL);
INSERT INTO `sub_constant_tb` VALUES (203, 55, 'مستقل', NULL);
INSERT INTO `sub_constant_tb` VALUES (204, 55, 'مع الأبناء', NULL);
INSERT INTO `sub_constant_tb` VALUES (205, 55, 'مع الأقارب', NULL);
INSERT INTO `sub_constant_tb` VALUES (206, 56, 'أناني', NULL);
INSERT INTO `sub_constant_tb` VALUES (207, 56, 'سليط اللسان', NULL);
INSERT INTO `sub_constant_tb` VALUES (208, 56, 'عصبي', NULL);
INSERT INTO `sub_constant_tb` VALUES (209, 56, 'مريض', NULL);
INSERT INTO `sub_constant_tb` VALUES (210, 56, 'صعب الحركة', NULL);
INSERT INTO `sub_constant_tb` VALUES (211, 43, 'منبوذ', NULL);
INSERT INTO `sub_constant_tb` VALUES (212, 57, 'UNDP', NULL);
INSERT INTO `sub_constant_tb` VALUES (213, 57, 'لجنة الزكاة', NULL);
INSERT INTO `sub_constant_tb` VALUES (214, 57, 'سنابل الخير', NULL);
INSERT INTO `sub_constant_tb` VALUES (215, 4, 'زوجة', NULL);
INSERT INTO `sub_constant_tb` VALUES (216, 20, 'مدير النظام', NULL);
INSERT INTO `sub_constant_tb` VALUES (217, 58, 'بيت حانون', 18);
INSERT INTO `sub_constant_tb` VALUES (218, 58, 'بيت لاهيا', 18);
INSERT INTO `sub_constant_tb` VALUES (219, 58, 'جباليا', 18);
INSERT INTO `sub_constant_tb` VALUES (220, 59, 'النصيرات', 20);
INSERT INTO `sub_constant_tb` VALUES (221, 59, 'البريج', 20);
INSERT INTO `sub_constant_tb` VALUES (222, 59, 'المغازي', 20);
INSERT INTO `sub_constant_tb` VALUES (223, 59, 'دير البلح', 20);
INSERT INTO `sub_constant_tb` VALUES (224, 60, 'القرارة', 21);
INSERT INTO `sub_constant_tb` VALUES (225, 60, 'القرى الشرقية', 21);
INSERT INTO `sub_constant_tb` VALUES (226, 61, 'الرمال', 322);
INSERT INTO `sub_constant_tb` VALUES (227, 61, 'النصر', 322);
INSERT INTO `sub_constant_tb` VALUES (228, 61, 'الشيخ رضوان', 322);
INSERT INTO `sub_constant_tb` VALUES (229, 61, 'الشاطئ', 322);
INSERT INTO `sub_constant_tb` VALUES (230, 61, 'الرمال الجنوبي', 322);
INSERT INTO `sub_constant_tb` VALUES (231, 61, 'الشيخ عجلين', 322);
INSERT INTO `sub_constant_tb` VALUES (232, 61, 'تل الهوا', 322);
INSERT INTO `sub_constant_tb` VALUES (233, 61, 'الصبرة', 322);
INSERT INTO `sub_constant_tb` VALUES (234, 61, 'الدرج', 322);
INSERT INTO `sub_constant_tb` VALUES (235, 61, 'الزيتون', 322);
INSERT INTO `sub_constant_tb` VALUES (236, 61, 'التفاح', 322);
INSERT INTO `sub_constant_tb` VALUES (237, 61, 'الشجاعية', 322);
INSERT INTO `sub_constant_tb` VALUES (238, 62, 'عباد الرحمن - الصفطاوي', 219);
INSERT INTO `sub_constant_tb` VALUES (239, 62, 'الكرامة والتوام', 219);
INSERT INTO `sub_constant_tb` VALUES (240, 62, 'جباليا البلد', 219);
INSERT INTO `sub_constant_tb` VALUES (241, 62, 'جباليا النزلة', 219);
INSERT INTO `sub_constant_tb` VALUES (242, 62, 'جباليا المعسكر', 219);
INSERT INTO `sub_constant_tb` VALUES (243, 62, 'الفالوجا', 219);
INSERT INTO `sub_constant_tb` VALUES (244, 62, 'بير النعجة', 219);
INSERT INTO `sub_constant_tb` VALUES (245, 62, 'تل الزعتر', 219);
INSERT INTO `sub_constant_tb` VALUES (246, 63, 'بيت لاهيا البلد', 218);
INSERT INTO `sub_constant_tb` VALUES (247, 63, 'مشروع بيت لاهيا', 218);
INSERT INTO `sub_constant_tb` VALUES (248, 63, 'مدينة الشيخ زايد', 218);
INSERT INTO `sub_constant_tb` VALUES (249, 63, 'السلاطين', 218);
INSERT INTO `sub_constant_tb` VALUES (250, 63, 'السيفة', 218);
INSERT INTO `sub_constant_tb` VALUES (251, 63, 'العطاطرة', 218);
INSERT INTO `sub_constant_tb` VALUES (252, 63, 'القرية البدوية', 218);
INSERT INTO `sub_constant_tb` VALUES (253, 63, 'تل الدهب', 218);
INSERT INTO `sub_constant_tb` VALUES (254, 64, 'عزبة بيت حانون', 217);
INSERT INTO `sub_constant_tb` VALUES (255, 64, 'بيت حانون البلد', 217);
INSERT INTO `sub_constant_tb` VALUES (256, 64, 'منطقة السكة', 217);
INSERT INTO `sub_constant_tb` VALUES (257, 64, 'المصريين', 217);
INSERT INTO `sub_constant_tb` VALUES (258, 64, 'الكفارنة', 217);
INSERT INTO `sub_constant_tb` VALUES (259, 64, 'أبراج الندى', 217);
INSERT INTO `sub_constant_tb` VALUES (260, 65, 'المخيم الجديد', 220);
INSERT INTO `sub_constant_tb` VALUES (261, 65, 'أرض المفتي - مخيم 5', 220);
INSERT INTO `sub_constant_tb` VALUES (262, 65, 'الحساينة', 220);
INSERT INTO `sub_constant_tb` VALUES (263, 65, 'منطقة مسجد القسام', 220);
INSERT INTO `sub_constant_tb` VALUES (264, 65, 'بلوك C', 220);
INSERT INTO `sub_constant_tb` VALUES (265, 65, 'منطقة صيدلية الزهور', 220);
INSERT INTO `sub_constant_tb` VALUES (266, 65, 'منطقة الوكالة - التموين', 220);
INSERT INTO `sub_constant_tb` VALUES (267, 65, 'منطقة المدارس - الجنوبية - طريق الزوايدة ', 220);
INSERT INTO `sub_constant_tb` VALUES (268, 65, 'السوارحة', 220);
INSERT INTO `sub_constant_tb` VALUES (269, 65, 'قرية الزوايدة', 220);
INSERT INTO `sub_constant_tb` VALUES (270, 66, 'دير البلح البلد', 223);
INSERT INTO `sub_constant_tb` VALUES (271, 66, 'دير البلح المعسكر', 223);
INSERT INTO `sub_constant_tb` VALUES (272, 66, 'دير البلح - المنطقة الشرقية', 223);
INSERT INTO `sub_constant_tb` VALUES (273, 66, 'وادي السلقا', 223);
INSERT INTO `sub_constant_tb` VALUES (274, 66, 'حكر الجامع', 223);
INSERT INTO `sub_constant_tb` VALUES (275, 66, 'البروك', 223);
INSERT INTO `sub_constant_tb` VALUES (276, 66, 'منطقة النخيل - غرباً', 223);
INSERT INTO `sub_constant_tb` VALUES (277, 67, 'القرارة - شرقاً', 224);
INSERT INTO `sub_constant_tb` VALUES (278, 67, 'تبة 86 - منطقة آل النجار - الخط الشرقي', 224);
INSERT INTO `sub_constant_tb` VALUES (279, 67, 'القرارة غرباً', 224);
INSERT INTO `sub_constant_tb` VALUES (280, 67, 'خانيونس - البلد', 224);
INSERT INTO `sub_constant_tb` VALUES (281, 67, 'البلد - الزعاربة', 224);
INSERT INTO `sub_constant_tb` VALUES (282, 67, 'البلد - المصريين', 224);
INSERT INTO `sub_constant_tb` VALUES (283, 67, 'السطر الشرقي', 224);
INSERT INTO `sub_constant_tb` VALUES (284, 67, 'السطر الغربي', 224);
INSERT INTO `sub_constant_tb` VALUES (285, 67, 'حي الامل', 224);
INSERT INTO `sub_constant_tb` VALUES (286, 67, 'المعسكر الغربي', 224);
INSERT INTO `sub_constant_tb` VALUES (287, 224, 'منطقة السد العالي', 224);
INSERT INTO `sub_constant_tb` VALUES (288, 67, 'منطقة الحاووز', 224);
INSERT INTO `sub_constant_tb` VALUES (289, 67, 'مواصي خانيونس', 224);
INSERT INTO `sub_constant_tb` VALUES (290, 67, 'معن', 224);
INSERT INTO `sub_constant_tb` VALUES (291, 67, 'قيزان النجار', 224);
INSERT INTO `sub_constant_tb` VALUES (292, 67, 'جورة اللوت', 224);
INSERT INTO `sub_constant_tb` VALUES (293, 67, 'قاع القرين', 224);
INSERT INTO `sub_constant_tb` VALUES (294, 68, 'رفح', 22);
INSERT INTO `sub_constant_tb` VALUES (295, 68, 'رفح البلد', 294);
INSERT INTO `sub_constant_tb` VALUES (296, 68, 'حي الجنينة', 294);
INSERT INTO `sub_constant_tb` VALUES (297, 68, 'البرازيل', 294);
INSERT INTO `sub_constant_tb` VALUES (298, 68, 'سوق الشعرة - ديوان آل قشطة', 294);
INSERT INTO `sub_constant_tb` VALUES (299, 68, 'منطقة العبور', 294);
INSERT INTO `sub_constant_tb` VALUES (300, 68, 'الفخاري', 294);
INSERT INTO `sub_constant_tb` VALUES (301, 68, 'الشوكة', 294);
INSERT INTO `sub_constant_tb` VALUES (302, 68, 'الصوفة', 294);
INSERT INTO `sub_constant_tb` VALUES (303, 68, 'منطقة أم النصر - موراج', 294);
INSERT INTO `sub_constant_tb` VALUES (304, 68, 'خربة العدس', 294);
INSERT INTO `sub_constant_tb` VALUES (305, 68, 'منطقة المطار', 294);
INSERT INTO `sub_constant_tb` VALUES (306, 68, 'الشابورة', 294);
INSERT INTO `sub_constant_tb` VALUES (307, 68, 'مخيم يبنة - عيادة الوكالة', 294);
INSERT INTO `sub_constant_tb` VALUES (308, 68, 'منطقة الزعاربة', 294);
INSERT INTO `sub_constant_tb` VALUES (309, 68, 'عريبة والملالحة', 294);
INSERT INTO `sub_constant_tb` VALUES (310, 68, 'المعسكر الغربي', 294);
INSERT INTO `sub_constant_tb` VALUES (311, 68, 'تل السلطان', 294);
INSERT INTO `sub_constant_tb` VALUES (312, 68, 'الإسكان  الغربي - كندا', 294);
INSERT INTO `sub_constant_tb` VALUES (313, 68, 'مواصي رفح', 294);
INSERT INTO `sub_constant_tb` VALUES (314, 69, 'أقارب', NULL);
INSERT INTO `sub_constant_tb` VALUES (315, 69, 'جيران', NULL);
INSERT INTO `sub_constant_tb` VALUES (316, 69, 'أصدقاء', NULL);
INSERT INTO `sub_constant_tb` VALUES (317, 70, 'بني سهيلا', 225);
INSERT INTO `sub_constant_tb` VALUES (318, 70, 'عبسان الصغيرة', 225);
INSERT INTO `sub_constant_tb` VALUES (319, 70, 'عبسان الكبيرة', 225);
INSERT INTO `sub_constant_tb` VALUES (320, 70, 'خزاعة', 225);
INSERT INTO `sub_constant_tb` VALUES (321, 70, 'منطقة الشيخ ناصر', 225);
INSERT INTO `sub_constant_tb` VALUES (322, 61, 'غزة', 19);
INSERT INTO `sub_constant_tb` VALUES (323, 20, 'البريج', 221);
INSERT INTO `sub_constant_tb` VALUES (324, 20, 'المغازي', 222);

-- --------------------------------------------------------

-- 
-- Table structure for table `survey_elder_info_tb`
-- 

CREATE TABLE `survey_elder_info_tb` (
  `survey_elder_info_id` int(11) NOT NULL auto_increment COMMENT 'مسلسل',
  `survey_id` int(11) default NULL COMMENT 'FK survey_tb\nرقم الاستبانة',
  `elder_id` int(9) NOT NULL default '0' COMMENT 'رقم هوية المسن',
  `elder_category_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nتصنيف العضو',
  `first_name` varchar(45) default NULL COMMENT 'الاسم الأول',
  `middle_name` varchar(45) default NULL COMMENT 'اسم الاب',
  `third_name` varchar(45) default NULL COMMENT 'اسم الجد',
  `last_name` varchar(45) default NULL COMMENT 'اسم العائلة',
  `dob` date default NULL COMMENT 'تاريخ الميلاد',
  `sex_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالجنس',
  `status_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالحالة الاجتماعية',
  `governorate_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالمحافظة',
  `region` varchar(45) default NULL COMMENT 'المنطقة',
  `full_address` varchar(200) default NULL COMMENT 'وصف العنوان بالكامل',
  `phone` varchar(45) default NULL COMMENT 'رقم الهاتف',
  `mobile_first` varchar(45) default NULL COMMENT 'رقم الجوال 1',
  `mobile_second` varchar(45) default NULL COMMENT 'رقم الجوال 2',
  `education_level_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالمؤهل العلمي',
  `specialization_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالتخصص',
  `current_job_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالعمل الحالي',
  `previous_job_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nالعمل السابق',
  `insurance_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nنوع التأمين',
  `death_date` datetime default NULL COMMENT 'تاريخ الوفاة',
  PRIMARY KEY  (`survey_elder_info_id`),
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على بيانات المسنين في استبانة معينة' AUTO_INCREMENT=224 ;

-- 
-- Dumping data for table `survey_elder_info_tb`
-- 

INSERT INTO `survey_elder_info_tb` VALUES (11, 11, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (12, 12, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (13, 13, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (14, 14, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (15, 15, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (16, 16, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (17, 17, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (18, 18, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (19, 19, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (20, 20, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (21, 21, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (22, 22, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (23, 23, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (24, 24, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (25, 25, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (26, 26, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (27, 27, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (28, 28, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (29, 29, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (30, 30, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (31, 31, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (32, 32, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (33, 33, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (34, 34, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (35, 35, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (36, 36, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (37, 37, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (38, 38, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (39, 39, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (40, 40, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (41, 41, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (42, 42, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (43, 43, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (44, 44, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (45, 45, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (46, 46, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (47, 47, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (48, 48, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (49, 49, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (50, 50, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (51, 51, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (52, 52, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (53, 53, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (54, 54, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (55, 55, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (56, 56, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (57, 57, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (58, 58, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (59, 59, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (60, 60, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (61, 61, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (62, 62, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (63, 63, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (64, 64, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (65, 65, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (66, 66, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (67, 67, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (68, 68, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (69, 69, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (70, 70, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (71, 71, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (72, 72, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (73, 73, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (74, 74, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (75, 75, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (76, 76, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (77, 77, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (78, 78, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (79, 79, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (80, 80, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (81, 81, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (82, 82, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (83, 83, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (84, 84, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (85, 85, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (86, 86, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (87, 87, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (88, 88, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (89, 89, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (90, 90, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (91, 91, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (92, 92, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (93, 93, 903445663, 175, 'محمود', 'موسى', 'ابراهيم', 'عثمان', '1944-06-06', 1, 184, 21, 'خانيونس', 'خانيونس', '', '', '', 28, 33, 48, 51, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (94, 94, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (95, 95, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (96, 96, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (97, 97, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (98, 98, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (99, 99, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (100, 100, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (101, 101, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (102, 102, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (103, 103, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (104, 104, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (105, 105, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (106, 106, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (107, 107, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (108, 108, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (109, 109, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (110, 110, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (111, 111, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (112, 112, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (113, 113, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (114, 114, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (115, 115, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (116, 116, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (117, 117, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (118, 118, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (119, 119, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (120, 120, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (121, 121, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (122, 122, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (123, 123, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (124, 124, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (125, 125, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (126, 126, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (127, 127, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (128, 128, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (129, 129, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (130, 130, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (131, 131, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (132, 132, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (133, 133, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (134, 134, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (135, 135, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (136, 136, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (137, 137, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (138, 138, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (139, 139, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (140, 140, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (141, 141, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (142, 142, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (143, 143, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (144, 144, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (145, 145, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (146, 146, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (147, 147, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (148, 148, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (149, 149, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (150, 150, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (151, 151, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (152, 152, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (153, 153, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (154, 154, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (155, 155, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (156, 156, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (157, 157, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (158, 158, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (159, 159, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (160, 160, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (161, 161, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (162, 162, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (163, 163, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (164, 164, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (165, 165, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (166, 166, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (167, 167, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (168, 168, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (169, 169, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (170, 170, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (171, 171, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (172, 172, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (173, 173, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (174, 174, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (175, 175, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (176, 176, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (177, 177, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (178, 178, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (179, 179, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (180, 180, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (181, 181, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (182, 182, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (183, 183, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (184, 184, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (185, 185, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (186, 186, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (187, 187, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (188, 188, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (189, 189, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (190, 190, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (191, 191, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (192, 192, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (193, 193, 0, 175, 'عبد الله', 'محمد', 'احمد', 'حسن', '1945-01-01', 1, 5, 19, 'الشجاعية', 'الشجاعية                              ', '2822222', '0599111222', '', 27, 34, 48, 51, 8, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (194, 194, 0, 175, 'عبد الله', 'محمد', 'احمد', 'حسن', '1945-01-01', 1, 5, 19, 'الشجاعية', 'الشجاعية                              ', '2822222', '0599111222', '', 27, 34, 48, 51, 8, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (195, 195, 0, 176, 'عبد الله', 'محمد', 'احمد', 'حسن', '1945-01-01', 1, 5, 19, 'الشجاعية', 'الشجاعية                              ', '2822222', '0599111222', '', 27, 34, 48, 51, 8, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (196, 196, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (197, 197, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (198, 198, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (199, 199, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (200, 200, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (201, 201, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (202, 202, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (203, 203, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (204, 204, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (205, 205, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (206, 206, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (207, 207, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (208, 208, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (209, 209, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (210, 210, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (211, 211, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (212, 212, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (213, 213, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (214, 214, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (215, 215, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (216, 216, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (217, 217, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (218, 218, 0, 176, 'محمد', 'ابراهيم', 'علي', 'احمد', '1945-07-12', 1, 5, 18, 'بيت حانون', 'الشمال', '2477277', '', '', 24, 41, 49, 50, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (219, 219, 901232323, 175, 'عبد الرحمن', 'محمد', 'محمود', 'احمد', '1953-01-28', 1, 184, 21, 'المواصي', 'المواصي', '2422344', '0599277652', '', 28, 34, 48, 52, 9, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (220, 220, 901521823, 175, 'dssfds', 'ddasd', 'sdsda', 'dsasd', '1910-02-01', 1, 183, 18, 'ddsa', 'asasasasd', '0825874514', '0598999048', '0598999048', 24, 0, 47, 58, 62, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (221, 221, 90552144, 175, 'حامد', 'حامد', 'حماد', 'حماد', '1890-02-04', 1, 183, 20, 'نننن', 'مممم', '028745411', '0598999048', '0598900000', 23, 0, 49, 55, 61, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (222, 222, 98745632, 175, 'اكرم ', 'اكرم', 'اركم', 'اكرم', '1920-02-03', 1, 5, 20, 'نبنبننب', 'شبيسب', '025857455', '0598999048', '0587444444', 23, 0, 47, 58, 62, NULL);
INSERT INTO `survey_elder_info_tb` VALUES (223, 223, 903635001, 175, 'وسيم', 'محمد', 'محمد', 'عابد', '1929-12-17', 1, 184, 18, '217', '254', '0598999048', '0598999048', '0258745444', 28, 32, 47, 58, 62, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `survey_tb`
-- 

CREATE TABLE `survey_tb` (
  `survey_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `file_id` int(11) default NULL COMMENT 'FK file_tb\nرقم الملف',
  `visit_date` date default NULL,
  `visit_time` time default NULL COMMENT 'وقت الزيارة',
  `visit_end_time` time default NULL COMMENT 'وقت انتهاء الزيارة',
  `visit_purpose_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nهدف الزيارة',
  `researcher_id` int(11) default NULL COMMENT 'FK employee_tb\nرقم هوية الباحث',
  `researcher_assistant_fst_id` int(11) default NULL COMMENT 'FK employee_tb\nرقم هوية مساعد الباحث الأول',
  `researcher_assistant_sec_id` int(11) default NULL COMMENT 'FK employee_tb\nرقم هوية مساعد الباحث الثاني',
  `researcher_notes` varchar(200) default NULL COMMENT 'ملاحظات الباحث',
  `researcher_recommendations` varchar(200) default NULL COMMENT 'توصيات الباحث',
  `created_on` datetime default NULL COMMENT 'تاريخ الادخال',
  `created_by` varchar(200) default NULL COMMENT 'FK users_tb\nاسم المستخدم مدخل البيانات',
  PRIMARY KEY  (`survey_id`),
  KEY `FK_File_Survey_idx` (`file_id`),
  KEY `FK_SubConstant_Survey_idx` (`visit_purpose_id`),
  KEY `FK_Employee_Survey_idx` (`researcher_id`),
  KEY `FK_Employee_Survey_AssesFst_idx` (`researcher_assistant_fst_id`),
  KEY `FK_Employee_Survey_AssesSec_idx` (`researcher_assistant_sec_id`),
  KEY `FK_Users_Survey_idx` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول يحتوي على البيانات الاساسية للبحث الميداني' AUTO_INCREMENT=224 ;

-- 
-- Dumping data for table `survey_tb`
-- 

INSERT INTO `survey_tb` VALUES (11, 6, '2015-11-05', '22:50:00', '22:50:00', NULL, 111111111, 801064239, 123456789, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (13, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (14, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (15, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (16, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (17, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (18, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (19, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (20, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (21, 6, '2015-11-05', '00:35:00', '00:35:00', NULL, 111111111, 801064239, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (22, 6, '2015-11-11', '11:35:00', '11:35:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (23, 6, '2015-11-11', '11:35:00', '11:35:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (24, 6, '2015-11-24', '11:55:00', '11:55:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (25, 6, '2015-11-18', '12:15:00', '12:15:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (26, 6, '2015-11-17', '12:25:00', '12:25:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (27, 6, '2015-11-12', '12:30:00', '12:30:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (28, 6, '2015-11-11', '12:30:00', '12:30:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (29, 6, '2015-11-20', '12:35:00', '12:35:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (30, 6, '2015-11-11', '13:10:00', '13:10:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (31, 6, '2015-11-13', '13:15:00', '13:15:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (32, 6, '2015-11-12', '13:20:00', '13:20:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (33, 6, '2015-11-11', '13:25:00', '13:25:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (34, 6, '2015-11-12', '13:35:00', '13:35:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (35, 6, '2015-11-11', '13:40:00', '13:40:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (36, 6, '2015-11-18', '13:40:00', '13:40:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (37, 6, '2015-11-19', '13:45:00', '13:45:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (38, 6, '2015-11-18', '13:50:00', '13:50:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (39, 6, '2015-11-18', '14:10:00', '14:10:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (40, 6, '2015-11-05', '16:00:00', '16:00:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (41, 6, '2015-11-05', '16:05:00', '16:05:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (42, 6, '2015-11-12', '16:10:00', '16:10:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (43, 6, '2015-11-04', '16:15:00', '16:15:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (44, 6, '2015-11-19', '16:15:00', '16:15:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (45, 6, '2015-11-18', '16:20:00', '16:20:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (46, 6, '2015-11-18', '16:20:00', '16:20:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (47, 6, '2015-11-17', '16:25:00', '16:25:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (48, 6, '2015-11-19', '16:30:00', '16:30:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (49, 6, '2015-11-17', '16:30:00', '16:30:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (50, 6, '2015-11-11', '16:35:00', '16:35:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (51, 6, '2015-11-05', '16:45:00', '16:45:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (52, 6, '2015-11-12', '18:05:00', '18:05:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (53, 6, '2015-11-05', '18:10:00', '18:10:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (54, 6, '2015-11-18', '19:10:00', '19:10:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (55, 6, '2015-11-05', '19:55:00', '19:55:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (56, 6, '2015-11-19', '20:15:00', '20:15:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (57, 6, '2015-11-05', '21:35:00', '21:35:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (58, 6, '2015-11-05', '21:40:00', '21:40:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (59, 6, '2015-11-10', '17:30:00', '17:30:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (60, 6, '2015-11-18', '17:35:00', '17:35:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (61, 6, '2015-11-18', '17:40:00', '17:40:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (62, 6, '2015-11-11', '17:55:00', '17:55:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (63, 6, '2015-11-11', '18:00:00', '18:00:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (64, 6, '2015-11-19', '18:30:00', '18:30:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (65, 6, '2015-11-11', '18:40:00', '18:40:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (66, 6, '2015-11-19', '19:00:00', '19:00:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (67, 6, '2015-11-18', '19:10:00', '19:10:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (68, 6, '2015-11-04', '19:10:00', '19:10:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (69, 6, '2015-11-11', '19:15:00', '19:15:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (70, 6, '2015-11-18', '19:20:00', '19:20:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (71, 6, '2015-11-04', '19:25:00', '19:25:00', NULL, 801064239, 111111111, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (72, 6, '2015-11-19', '19:50:00', '19:50:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (73, 6, '2015-11-26', '19:55:00', '19:55:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (74, 6, '2015-11-30', '20:40:00', '20:40:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (75, 6, '2015-11-30', '21:00:00', '21:00:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (76, 6, '2015-11-11', '21:05:00', '21:05:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (77, 6, '2015-11-12', '21:55:00', '21:55:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (78, 6, '2015-11-13', '22:15:00', '22:15:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (79, 6, '2015-11-13', '22:25:00', '22:25:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (80, 6, '2015-11-03', '22:30:00', '22:30:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (81, 6, '2015-11-20', '22:30:00', '22:30:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (82, 6, '2015-11-19', '22:30:00', '22:30:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (83, 6, '2015-11-19', '22:30:00', '22:30:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (84, 6, '2015-11-25', '22:35:00', '22:35:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (85, 6, '2015-11-18', '22:35:00', '22:35:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (86, 6, '2015-11-26', '22:35:00', '22:35:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (87, 6, '2015-11-25', '22:35:00', '22:35:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (88, 6, '2015-11-25', '22:45:00', '22:45:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (89, 6, '2015-11-18', '22:50:00', '22:50:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (90, 6, '2015-11-20', '22:55:00', '22:55:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (91, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (92, 6, '2015-11-03', '14:45:00', '14:45:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (93, 7, '2015-12-01', '20:00:00', '19:00:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (94, 6, '2015-12-08', '20:30:00', '20:30:00', NULL, 111111111, 801064239, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (95, 6, '2015-12-30', '21:00:00', '21:00:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (96, 6, '2015-12-24', '21:05:00', '21:05:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (97, 6, '2015-12-16', '21:05:00', '21:05:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (98, 6, '2015-12-03', '21:05:00', '21:05:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (99, 6, '2015-12-03', '21:10:00', '21:10:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (100, 6, '2015-12-01', '21:10:00', '21:10:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (101, 6, '2015-12-01', '21:15:00', '21:15:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (102, 6, '2015-12-02', '21:15:00', '21:15:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (103, 6, '2015-12-01', '21:15:00', '21:15:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (104, 6, '2015-12-01', '21:30:00', '21:30:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (105, 6, '2015-12-09', '21:35:00', '21:35:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (106, 6, '2015-12-14', '21:35:00', '21:35:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (107, 6, '2015-12-02', '23:05:00', '23:05:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (108, 6, '2015-12-16', '23:35:00', '23:35:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (109, 6, '2015-12-01', '23:40:00', '23:40:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (110, 6, '2015-12-09', '23:40:00', '23:40:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (111, 6, '2015-12-09', '00:05:00', '00:05:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (112, 6, '2015-12-10', '00:15:00', '00:15:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (113, 6, '2015-12-09', '00:15:00', '00:15:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (114, 6, '2015-12-15', '00:20:00', '00:20:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (115, 6, '2015-12-03', '00:35:00', '00:35:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (116, 6, '2015-12-31', '00:40:00', '00:40:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (117, 6, '2015-12-10', '00:45:00', '00:45:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (118, 6, '2015-12-09', '18:00:00', '18:00:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (119, 6, '2015-12-24', '19:50:00', '19:50:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (120, 6, '2015-12-16', '19:55:00', '19:55:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (121, 6, '2015-12-09', '20:00:00', '20:00:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (122, 6, '2015-12-22', '20:00:00', '20:00:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (123, 6, '2015-12-23', '20:00:00', '20:00:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (124, 6, '2015-12-09', '20:05:00', '20:05:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (125, 6, '2015-12-16', '20:05:00', '20:05:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (126, 6, '2015-12-16', '20:55:00', '20:55:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (127, 6, '2015-12-09', '21:00:00', '21:00:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (128, 6, '2015-12-16', '22:05:00', '22:05:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (129, 6, '2015-12-23', '22:15:00', '22:15:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (130, 6, '2015-12-01', '19:15:00', '19:15:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (131, 6, '2015-12-23', '19:25:00', '19:25:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (132, 6, '2015-12-02', '19:40:00', '19:40:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (133, 6, '2015-12-23', '20:00:00', '20:00:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (134, 6, '2015-12-17', '21:25:00', '21:25:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (135, 6, '2015-12-11', '21:45:00', '21:45:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (136, 6, '2015-12-17', '22:15:00', '22:15:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (137, 6, '2015-12-02', '22:35:00', '22:35:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (138, 6, '2015-12-01', '22:50:00', '22:50:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (139, 6, '2015-12-01', '22:55:00', '22:55:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (140, 6, '2015-12-02', '23:10:00', '23:10:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (141, 6, '2015-12-01', '23:10:00', '23:10:00', NULL, 111111111, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (142, 6, '2015-12-01', '22:25:00', '22:25:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (143, 6, '2015-12-02', '00:35:00', '00:35:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (144, 6, '2015-12-09', '00:35:00', '00:35:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (145, 6, '2015-12-09', '00:40:00', '00:40:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (146, 6, '2015-12-09', '00:45:00', '00:45:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (147, 6, '2015-12-09', '00:55:00', '00:55:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (148, 6, '2015-12-09', '01:00:00', '01:00:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (149, 6, '2015-12-09', '01:10:00', '01:10:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (150, 6, '2015-12-03', '01:10:00', '01:10:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (151, 6, '2015-12-16', '01:15:00', '01:15:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (152, 6, '2015-12-09', '18:40:00', '18:40:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (153, 6, '2015-12-09', '19:20:00', '19:20:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (154, 6, '2015-12-09', '19:25:00', '19:25:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (155, 6, '2015-12-09', '19:30:00', '19:30:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (156, 6, '2015-12-10', '19:35:00', '19:35:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (157, 6, '2015-12-16', '20:25:00', '20:25:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (158, 6, '2015-12-09', '20:30:00', '20:30:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (159, 6, '2015-12-09', '22:30:00', '22:30:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (160, 6, '2015-12-09', '22:35:00', '22:35:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (161, 6, '2015-12-09', '22:45:00', '22:45:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (162, 6, '2015-12-16', '22:45:00', '22:45:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (163, 6, '2015-12-15', '22:55:00', '22:55:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (164, 6, '2015-12-09', '23:05:00', '23:05:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (165, 6, '2015-12-09', '23:05:00', '23:05:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (166, 6, '2015-12-09', '23:55:00', '23:55:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (167, 6, '2015-12-09', '00:40:00', '00:40:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (168, 6, '2015-12-09', '00:40:00', '00:40:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (169, 6, '2015-12-16', '17:30:00', '17:30:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (170, 6, '2015-12-09', '19:40:00', '19:40:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (171, 6, '2015-12-10', '19:45:00', '19:45:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (172, 6, '2015-12-11', '19:50:00', '19:50:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (173, 6, '2015-12-09', '20:10:00', '20:10:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (174, 6, '2015-12-11', '20:15:00', '20:15:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (175, 6, '2015-12-07', '20:15:00', '20:15:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (176, 6, '2015-12-08', '20:20:00', '20:20:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (177, 6, '2015-12-10', '20:25:00', '20:25:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (178, 6, '2015-12-10', '21:05:00', '21:05:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (179, 6, '2015-12-09', '21:10:00', '21:10:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (180, 6, '2015-12-09', '21:35:00', '21:35:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (181, 6, '2015-12-31', '00:05:00', '00:05:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (182, 6, '2015-12-24', '00:10:00', '00:10:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (183, 6, '2015-12-03', '01:00:00', '01:00:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (184, 6, '2015-12-10', '01:45:00', '01:45:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (185, 6, '2015-12-09', '02:55:00', '02:55:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (186, 6, '2015-12-10', '03:00:00', '03:00:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (187, 6, '2015-12-31', '03:10:00', '03:10:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (188, 6, '2015-12-10', '03:45:00', '03:45:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (189, 6, '2015-12-19', '04:10:00', '04:10:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (190, 6, '2015-12-17', '04:35:00', '04:35:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (191, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (192, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (193, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (194, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (195, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (196, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (197, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (198, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (199, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (200, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (201, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (202, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (203, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (204, 6, '2015-12-03', '01:45:00', '01:45:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (205, 6, '2015-12-24', '18:10:00', '18:10:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (206, 6, '2015-12-15', '19:25:00', '19:25:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (207, 6, '2015-12-08', '19:30:00', '19:30:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (208, 6, '2015-12-16', '19:50:00', '19:50:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (209, 6, '2015-11-29', '20:50:00', '20:50:00', NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (210, 6, '2015-12-16', '21:05:00', '21:05:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (211, 6, '2015-11-30', '21:10:00', '21:10:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (212, 6, '2015-11-30', '21:15:00', '21:15:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (213, 6, '2015-11-29', '21:20:00', '21:20:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (214, 6, '2015-11-29', '21:50:00', '21:50:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (215, 6, '2015-12-09', '22:00:00', '22:00:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (216, 6, '2015-12-23', '22:05:00', '22:05:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (217, 6, '2015-11-29', '22:35:00', '22:35:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (218, 6, '2015-11-29', '22:40:00', '22:40:00', NULL, 801064239, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (219, 8, '2015-12-16', '18:00:00', '18:00:00', NULL, 801064239, 123456789, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (220, 9, '2015-12-28', '22:45:00', '22:45:00', NULL, 111111111, 801064239, 123456789, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (221, 10, '2016-01-24', '00:30:00', '00:30:00', NULL, 111111111, 801064239, 123456789, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (222, 11, '2016-01-18', '00:40:00', '00:40:00', NULL, 111111111, 801064239, 123456789, NULL, NULL, NULL, NULL);
INSERT INTO `survey_tb` VALUES (223, 12, '2016-01-18', '20:00:00', '20:00:00', NULL, 111111111, 801064239, 123456789, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `users_tb`
-- 

CREATE TABLE `users_tb` (
  `user_name` varchar(200) NOT NULL default '' COMMENT 'اسم المستخدم',
  `passward` varchar(45) default NULL COMMENT 'كلمة المرور',
  `employee_id` int(11) default NULL COMMENT 'FK employee_tb\nالرقم الوظيفي',
  `is_active` int(1) default '1' COMMENT 'حساب فعال',
  `user_type_id` int(11) default NULL COMMENT 'FK Sub Constant\nنوع المستخدم',
  `created_on` datetime default NULL COMMENT 'تاريخ الانشاء',
  `created_by` varchar(200) default NULL COMMENT 'FK users_tb\nانشأ بواسطة',
  PRIMARY KEY  (`user_name`),
  KEY `FK_SubConstant_Users_idx` (`user_type_id`),
  KEY `FK_Users_Users_idx` (`created_by`),
  KEY `FK_Employee_idx` (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='جدول يجتوي على حسابات المستخدمين للبرنامج';

-- 
-- Dumping data for table `users_tb`
-- 

INSERT INTO `users_tb` VALUES ('ah', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 13, NULL, NULL);
INSERT INTO `users_tb` VALUES ('om', 'e10adc3949ba59abbe56e057f20f883e', 2, 1, 14, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `user_menu_page_tb`
-- 

CREATE TABLE `user_menu_page_tb` (
  `user_menu_page_id` int(11) NOT NULL auto_increment COMMENT 'PK\nرقم مسلسل',
  `menu_page_id` int(11) default NULL COMMENT 'FK menu_page_tb\nرقم القائمة والصفحة',
  `user_type_id` int(11) default NULL COMMENT 'FK sub_constant_tb\nنوع المستخدم مثلا: مدخل بيانات - مدير',
  PRIMARY KEY  (`user_menu_page_id`),
  KEY `FK_MenuPage_UserMenuPage_idx` (`menu_page_id`),
  KEY `FK_SubConstant_UserMenu_idx` (`user_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='جدول حتوي الصفحات والقوائم الخاصة بكل نوع مستخدم' AUTO_INCREMENT=27 ;

-- 
-- Dumping data for table `user_menu_page_tb`
-- 

INSERT INTO `user_menu_page_tb` VALUES (1, 1, 13);
INSERT INTO `user_menu_page_tb` VALUES (17, 1, 14);
INSERT INTO `user_menu_page_tb` VALUES (18, 2, 14);
INSERT INTO `user_menu_page_tb` VALUES (19, 3, 14);
INSERT INTO `user_menu_page_tb` VALUES (20, 1, 216);
INSERT INTO `user_menu_page_tb` VALUES (21, 2, 216);
INSERT INTO `user_menu_page_tb` VALUES (22, 3, 216);
INSERT INTO `user_menu_page_tb` VALUES (24, 4, 216);
INSERT INTO `user_menu_page_tb` VALUES (25, 5, 216);
INSERT INTO `user_menu_page_tb` VALUES (26, 6, 216);
