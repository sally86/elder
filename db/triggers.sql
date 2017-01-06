CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`appointment_tb_AFTER_UPDATE` AFTER UPDATE ON `appointment_tb` FOR EACH ROW
BEGIN
	IF (NEW.researcher_id != OLD.researcher_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "appointment_tb", OLD.appointment_id, "researcher_id", OLD.researcher_id, NEW.researcher_id, NOW());
    END IF;
END

CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`employee_tb_AFTER_UPDATE` AFTER UPDATE ON `employee_tb` FOR EACH ROW
BEGIN
	IF (NEW.national_id != OLD.national_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "employee_tb", OLD.employee_id, "national_id", OLD.national_id, NEW.national_id, NOW());
    END IF;
    IF (NEW.emp_id != OLD.emp_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "employee_tb", OLD.employee_id, "emp_id", OLD.emp_id, NEW.emp_id, NOW());
    END IF;
    IF (NEW.name != OLD.name) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "employee_tb", OLD.employee_id, "name", OLD.name, NEW.name, NOW());
    END IF;
    IF (NEW.sex_id != OLD.sex_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "employee_tb", OLD.employee_id, "sex_id", OLD.sex_id, NEW.sex_id, NOW());
    END IF;
    IF (NEW.job_title_id != OLD.job_title_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "employee_tb", OLD.employee_id, "job_title_id", OLD.job_title_id, NEW.job_title_id, NOW());
    END IF;
    IF (NEW.mobile != OLD.mobile) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "employee_tb", OLD.employee_id, "mobile", OLD.mobile, NEW.mobile, NOW());
    END IF;
    IF (NEW.phone != OLD.phone) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "employee_tb", OLD.employee_id, "phone", OLD.phone, NEW.phone, NOW());
    END IF;
    IF (NEW.email != OLD.email) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "employee_tb", OLD.employee_id, "email", OLD.email, NEW.email, NOW());
    END IF;
    IF (NEW.is_active != OLD.is_active) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "employee_tb", OLD.employee_id, "is_active", OLD.is_active, NEW.is_active, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "employee_tb", OLD.employee_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "employee_tb", OLD.employee_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END;


// aids_recomendation_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`aids_recomendation_tb_AFTER_UPDATE` AFTER UPDATE ON `aids_recomendation_tb` FOR EACH ROW
BEGIN
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "aids_recomendation_tb", OLD.aids_recomendation_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.cash_aid_type_id != OLD.cash_aid_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "aids_recomendation_tb", OLD.aids_recomendation_id, "cash_aid_type_id", OLD.cash_aid_type_id, NEW.cash_aid_type_id, NOW());
    END IF;
    IF (NEW.cash_aid_amount != OLD.cash_aid_amount) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "aids_recomendation_tb", OLD.aids_recomendation_id, "cash_aid_amount", OLD.cash_aid_amount, NEW.cash_aid_amount, NOW());
    END IF;
    IF (NEW.psychological_support != OLD.psychological_support) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "aids_recomendation_tb", OLD.aids_recomendation_id, "psychological_support", OLD.psychological_support, NEW.psychological_support, NOW());
    END IF;
    IF (NEW.social_support != OLD.social_support) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "aids_recomendation_tb", OLD.aids_recomendation_id, "social_support", OLD.social_support, NEW.social_support, NOW());
    END IF;
    IF (NEW.entertainment != OLD.entertainment) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "aids_recomendation_tb", OLD.aids_recomendation_id, "entertainment", OLD.entertainment, NEW.entertainment, NOW());
    END IF;
    IF (NEW.nutrition_type_id != OLD.nutrition_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "aids_recomendation_tb", OLD.aids_recomendation_id, "nutrition_type_id", OLD.nutrition_type_id, NEW.nutrition_type_id, NOW());
    END IF;
    IF (NEW.nutrition_details != OLD.nutrition_details) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "aids_recomendation_tb", OLD.aids_recomendation_id, "nutrition_details", OLD.nutrition_details, NEW.nutrition_details, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "aids_recomendation_tb", OLD.aids_recomendation_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "aids_recomendation_tb", OLD.aids_recomendation_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "aids_recomendation_tb", OLD.aids_recomendation_id, "survey_id#cash_aid_type_id#cash_aid_amount#psychological_support#social_support#entertainment#nutrition_type_id#nutrition_details#created_on#created_by", concat(OLD.survey_id,'#',OLD.cash_aid_type_id,'#',OLD.cash_aid_amount,'#',OLD.psychological_support,'#',OLD.social_support,'#',OLD.entertainment,'#',OLD.nutrition_type_id,'#',OLD.nutrition_details,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

// constant_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`constant_tb_AFTER_UPDATE` AFTER UPDATE ON `constant_tb` FOR EACH ROW
BEGIN
	IF (NEW.constant_name != OLD.constant_name) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "constant_tb", OLD.constant_id, "constant_name", OLD.constant_name, NEW.constant_name, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "constant_tb", OLD.constant_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "constant_tb", OLD.constant_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "constant_tb", OLD.constant_id, "constant_name#created_on#created_by", concat(OLD.constant_name,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

// elder_behaviour_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`elder_behaviour_tb_AFTER_UPDATE` AFTER UPDATE ON `elder_behaviour_tb` FOR EACH ROW
BEGIN
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_behaviour_tb", OLD.elder_behaviour_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.behaviour_id != OLD.behaviour_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_behaviour_tb", OLD.elder_behaviour_id, "behaviour_id", OLD.behaviour_id, NEW.behaviour_id, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_behaviour_tb", OLD.elder_behaviour_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_behaviour_tb", OLD.elder_behaviour_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END
INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "elder_behaviour_tb", OLD.elder_behaviour_id, "survey_id#behaviour_id#created_on#created_by", concat(OLD.survey_id,'#',OLD.behaviour_id,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())
    
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`elder_disease_det_tb_AFTER_UPDATE` AFTER UPDATE ON `elder_disease_det_tb` FOR EACH ROW
BEGIN
	IF (NEW.elder_disease_id != OLD.elder_disease_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_disease_det_tb", OLD.elder_disease_det_id, "elder_disease_id", OLD.elder_disease_id, NEW.elder_disease_id, NOW());
    END IF;
    IF (NEW.disease_id != OLD.disease_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_disease_det_tb", OLD.elder_disease_det_id, "disease_id", OLD.disease_id, NEW.disease_id, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_disease_det_tb", OLD.elder_disease_det_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_disease_det_tb", OLD.elder_disease_det_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete",  "elder_disease_det_tb", OLD.elder_disease_det_id, "elder_disease_id#disease_id#created_on#created_by", concat(OLD.elder_disease_id,'#',OLD.disease_id,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`elder_disease_tb_AFTER_UPDATE` AFTER UPDATE ON `elder_disease_tb` FOR EACH ROW
BEGIN
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_disease_tb", OLD.elder_disease_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.disease_id != OLD.disease_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_disease_tb", OLD.elder_disease_id, "elder_disease_details", OLD.elder_disease_details, NEW.elder_disease_details, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_disease_tb", OLD.elder_disease_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_disease_tb", OLD.elder_disease_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END
INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete",  "elder_disease_tb", OLD.elder_disease_id, "survey_id#elder_disease_details#created_on#created_by", concat(OLD.survey_id,'#',OLD.elder_disease_details,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

//Elder Doc
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`elder_doc_tb_AFTER_UPDATE` AFTER UPDATE ON `elder_doc_tb` FOR EACH ROW
BEGIN
	IF (NEW.file_id != OLD.file_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_doc_tb", OLD.elder_doc_id, "file_id", OLD.file_id, NEW.file_id, NOW());
    END IF;
    IF (NEW.doc_type_id != OLD.doc_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_doc_tb", OLD.elder_doc_id, "doc_type_id", OLD.doc_type_id, NEW.doc_type_id, NOW());
    END IF;
    IF (NEW.doc_path != OLD.doc_path) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_doc_tb", OLD.elder_doc_id, "doc_path", OLD.doc_path, NEW.doc_path, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_doc_tb", OLD.elder_doc_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_doc_tb", OLD.elder_doc_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete",  "elder_doc_tb", OLD.elder_doc_id, "file_id#doc_type_id#doc_path#created_on#created_by", concat(OLD.file_id,'#',OLD.doc_type_id,'#',OLD.doc_path,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

 // elder_interesting_tb
 CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`elder_interesting_tb_AFTER_UPDATE` AFTER UPDATE ON `elder_interesting_tb` FOR EACH ROW
BEGIN
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_interesting_tb", OLD.elder_interesting_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.interesting_id != OLD.interesting_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_interesting_tb", OLD.elder_interesting_id, "interesting_id", OLD.interesting_id, NEW.interesting_id, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_interesting_tb", OLD.elder_interesting_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_interesting_tb", OLD.elder_interesting_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END
INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete",  "elder_interesting_tb", OLD.elder_interesting_id, "survey_id#interesting_id#created_on#created_by", concat(OLD.survey_id,'#',OLD.interesting_id,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

// elder_pariah_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`elder_pariah_tb_AFTER_UPDATE` AFTER UPDATE ON `elder_pariah_tb` FOR EACH ROW
BEGIN
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_pariah_tb", OLD.elder_pariah_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.elder_pariah_reason_id != OLD.elder_pariah_reason_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_pariah_tb", OLD.elder_pariah_id, "elder_pariah_reason_id", OLD.elder_pariah_reason_id, NEW.elder_pariah_reason_id, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_pariah_tb", OLD.elder_pariah_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_pariah_tb", OLD.elder_pariah_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete",  "elder_pariah_tb", OLD.elder_pariah_id, "survey_id#elder_pariah_reason_id#created_on#created_by", concat(OLD.survey_id,'#',OLD.elder_pariah_reason_id,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())
    
// elder_pariah_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`elder_room_tb_AFTER_UPDATE` AFTER UPDATE ON `elder_room_tb` FOR EACH ROW
BEGIN
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.home_type_id != OLD.home_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "home_type_id", OLD.home_type_id, NEW.home_type_id, NOW());
    END IF;
    IF (NEW.room_type_id != OLD.room_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "room_type_id", OLD.room_type_id, NEW.room_type_id, NOW());
    END IF;
    IF (NEW.clothes_covers_status_id != OLD.clothes_covers_status_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "clothes_covers_status_id", OLD.clothes_covers_status_id, NEW.clothes_covers_status_id, NOW());
    END IF;
    IF (NEW.room_ventilation_id != OLD.room_ventilation_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "room_ventilation_id", OLD.room_ventilation_id, NEW.room_ventilation_id, NOW());
    END IF;
    IF (NEW.room_lighting_id != OLD.room_lighting_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "room_lighting_id", OLD.room_lighting_id, NEW.room_lighting_id, NOW());
    END IF;
    IF (NEW.has_closet != OLD.has_closet) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "has_closet", OLD.has_closet, NEW.has_closet, NOW());
    END IF;
    IF (NEW.has_good_bed != OLD.has_good_bed) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "has_good_bed", OLD.has_good_bed, NEW.has_good_bed, NOW());
    END IF;
    IF (NEW.has_medicine_cupboard != OLD.has_medicine_cupboard) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "has_medicine_cupboard", OLD.has_medicine_cupboard, NEW.has_medicine_cupboard, NOW());
    END IF;
    IF (NEW.room_need_maintenance != OLD.room_need_maintenance) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "room_need_maintenance", OLD.room_need_maintenance, NEW.room_need_maintenance, NOW());
    END IF;
    IF (NEW.room_maintenance_details != OLD.room_maintenance_details) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "room_maintenance_details", OLD.room_maintenance_details, NEW.room_maintenance_details, NOW());
    END IF;
    IF (NEW.bathroom_status_id != OLD.bathroom_status_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "bathroom_status_id", OLD.bathroom_status_id, NEW.bathroom_status_id, NOW());
    END IF;
    IF (NEW.bathroom_maintenance_details != OLD.bathroom_maintenance_details) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "bathroom_maintenance_details", OLD.bathroom_maintenance_details, NEW.bathroom_maintenance_details, NOW());
    END IF;
    IF (NEW.elder_higiene_id != OLD.elder_higiene_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "elder_higiene_id", OLD.elder_higiene_id, NEW.elder_higiene_id, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_room_tb", OLD.elder_room_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END
    
INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete",  "elder_room_tb", OLD.elder_room_id, "survey_id#home_type_id#room_type_id#clothes_covers_status_id#room_ventilation_id#room_lighting_id#has_closet#has_good_bed#has_medicine_cupboard#room_need_maintenance#room_maintenance_details#bathroom_status_id#bathroom_maintenance_details#elder_higiene_id#created_on#created_by", concat(OLD.survey_id,'#',OLD.home_type_id,,'#',OLD.room_type_id,'#',OLD.clothes_covers_status_id,'#',OLD.room_ventilation_id,'#',OLD.room_lighting_id,'#',OLD.has_closet,'#',OLD.has_good_bed,'#',OLD.has_medicine_cupboard,'#',OLD.room_need_maintenance,'#',OLD.room_maintenance_details,'#',OLD.bathroom_status_id,'#',OLD.bathroom_maintenance_details,'#',OLD.elder_higiene_id,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())
 
 // elder_tb
 CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`elder_tb_AFTER_UPDATE` AFTER UPDATE ON `elder_tb` FOR EACH ROW
BEGIN
	IF (NEW.elder_national_id != OLD.elder_national_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "elder_national_id", OLD.elder_national_id, NEW.elder_national_id, NOW());
    END IF;
    IF (NEW.elder_category_id != OLD.elder_category_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "elder_category_id", OLD.elder_category_id, NEW.elder_category_id, NOW());
    END IF;
    IF (NEW.first_name != OLD.first_name) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "first_name", OLD.first_name, NEW.first_name, NOW());
    END IF;
    IF (NEW.middle_name != OLD.middle_name) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "middle_name", OLD.middle_name, NEW.middle_name, NOW());
    END IF;
    IF (NEW.third_name != OLD.third_name) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "third_name", OLD.third_name, NEW.third_name, NOW());
    END IF;
    IF (NEW.last_name != OLD.last_name) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "last_name", OLD.last_name, NEW.last_name, NOW());
    END IF;
    IF (NEW.dob != OLD.dob) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "dob", OLD.dob, NEW.dob, NOW());
    END IF;
    IF (NEW.sex_id != OLD.sex_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "sex_id", OLD.sex_id, NEW.sex_id, NOW());
    END IF;
    IF (NEW.status_id != OLD.status_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "status_id", OLD.status_id, NEW.status_id, NOW());
    END IF;
    IF (NEW.governorate_id != OLD.governorate_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "governorate_id", OLD.governorate_id, NEW.governorate_id, NOW());
    END IF;
    IF (NEW.region != OLD.region) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "region", OLD.region, NEW.region, NOW());
    END IF;
    IF (NEW.full_address != OLD.full_address) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "full_address", OLD.full_address, NEW.full_address, NOW());
    END IF;
    IF (NEW.address_details != OLD.address_details) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "address_details", OLD.address_details, NEW.address_details, NOW());
    END IF;
    IF (NEW.phone != OLD.phone) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "phone", OLD.phone, NEW.phone, NOW());
    END IF;
    IF (NEW.mobile_first != OLD.mobile_first) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "mobile_first", OLD.mobile_first, NEW.mobile_first, NOW());
    END IF;
    IF (NEW.mobile_second != OLD.mobile_second) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "mobile_second", OLD.mobile_second, NEW.mobile_second, NOW());
    END IF;
    IF (NEW.education_level_id != OLD.education_level_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "education_level_id", OLD.education_level_id, NEW.education_level_id, NOW());
    END IF;
    IF (NEW.specialization_id != OLD.specialization_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "specialization_id", OLD.specialization_id, NEW.specialization_id, NOW());
    END IF;
    IF (NEW.current_job_id != OLD.current_job_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "current_job_id", OLD.current_job_id, NEW.current_job_id, NOW());
    END IF;
    IF (NEW.previous_job_id != OLD.previous_job_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "previous_job_id", OLD.previous_job_id, NEW.previous_job_id, NOW());
    END IF;
    IF (NEW.insurance_type_id != OLD.insurance_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "insurance_type_id", OLD.insurance_type_id, NEW.insurance_type_id, NOW());
    END IF;
    IF (NEW.death_date != OLD.death_date) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "death_date", OLD.death_date, NEW.death_date, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "elder_tb", OLD.elder_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "elder_tb", OLD.elder_id, "elder_national_id#elder_category_id#first_name#middle_name#third_name#last_name#dob#sex_id#status_id#governorate_id#region#full_address#address_details#phone#mobile_first#mobile_second#education_level_id#specialization_id#current_job_id#previous_job_id#insurance_type_id#death_date#created_on#created_by", concat(OLD.elder_national_id,'#',OLD.elder_category_id,'#',OLD.first_name,'#',OLD.middle_name,'#',OLD.third_name,'#',OLD.last_name,'#',OLD.dob,'#',OLD.sex_id,'#',OLD.status_id,'#',OLD.governorate_id,'#',OLD.region,'#',OLD.full_address,'#',OLD.address_details,'#',OLD.phone,'#',OLD.mobile_first,'#',OLD.mobile_second,'#',OLD.education_level_id,'#',OLD.specialization_id,'#',OLD.current_job_id,'#',OLD.previous_job_id,'#',OLD.insurance_type_id,'#',OLD.death_date,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())
 
 //family_cooperation_tb
 CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`family_cooperation_tb_AFTER_UPDATE` AFTER UPDATE ON `family_cooperation_tb` FOR EACH ROW
BEGIN
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_cooperation_tb", OLD.family_cooperation_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.is_cooperative_family != OLD.is_cooperative_family) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_cooperation_tb", OLD.family_cooperation_id, "is_cooperative_family", OLD.is_cooperative_family, NEW.is_cooperative_family, NOW());
    END IF;
    IF (NEW.cooperative_persone_type_id != OLD.cooperative_persone_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_cooperation_tb", OLD.family_cooperation_id, "cooperative_persone_type_id", OLD.cooperative_persone_type_id, NEW.cooperative_persone_type_id, NOW());
    END IF;
    IF (NEW.cooperative_persone_id != OLD.cooperative_persone_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_cooperation_tb", OLD.family_cooperation_id, "cooperative_persone_id", OLD.cooperative_persone_id, NEW.cooperative_persone_id, NOW());
    END IF;
    IF (NEW.cooperative_persone_name != OLD.cooperative_persone_name) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_cooperation_tb", OLD.family_cooperation_id, "cooperative_persone_name", OLD.cooperative_persone_name, NEW.cooperative_persone_name, NOW());
    END IF;
    IF (NEW.cooperative_persone_mobile != OLD.cooperative_persone_mobile) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_cooperation_tb", OLD.family_cooperation_id, "cooperative_persone_mobile", OLD.cooperative_persone_mobile, NEW.cooperative_persone_mobile, NOW());
    END IF;
    IF (NEW.cooperative_persone_address != OLD.cooperative_persone_address) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_cooperation_tb", OLD.family_cooperation_id, "cooperative_persone_address", OLD.cooperative_persone_address, NEW.cooperative_persone_address, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_cooperation_tb", OLD.family_cooperation_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_cooperation_tb", OLD.family_cooperation_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END
INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "family_cooperation_tb", OLD.family_cooperation_id, "survey_id#is_cooperative_family#cooperative_persone_type_id#cooperative_persone_id#cooperative_persone_name#cooperative_persone_mobile#cooperative_persone_address#created_on#created_by", concat(OLD.survey_id,'#',OLD.is_cooperative_family,'#',OLD.cooperative_persone_type_id,'#',OLD.cooperative_persone_id,'#',OLD.cooperative_persone_name,'#',OLD.cooperative_persone_mobile,'#',OLD.cooperative_persone_address,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())
 

//family_elder_relationship_tb
 CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`family_elder_relationship_tb_AFTER_UPDATE` AFTER UPDATE ON `family_cooperation_tb` FOR EACH ROW
BEGIN
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_elder_relationship_tb", OLD.family_elder_relationship_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.respect != OLD.respect) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_elder_relationship_tb", OLD.family_elder_relationship_id, "respect", OLD.respect, NEW.respect, NOW());
    END IF;
    IF (NEW.pariah != OLD.pariah) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_elder_relationship_tb", OLD.family_elder_relationship_id, "pariah", OLD.pariah, NEW.pariah, NOW());
    END IF;
    IF (NEW.care != OLD.care) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_elder_relationship_tb", OLD.family_elder_relationship_id, "care", OLD.care, NEW.care, NOW());
    END IF;
    IF (NEW.provision_needs != OLD.provision_needs) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_elder_relationship_tb", OLD.family_elder_relationship_id, "provision_needs", OLD.provision_needs, NEW.provision_needs, NOW());
    END IF;
	IF (NEW.no_provision_needs_reason != OLD.no_provision_needs_reason) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_elder_relationship_tb", OLD.family_elder_relationship_id, "no_provision_needs_reason", OLD.no_provision_needs_reason, NEW.no_provision_needs_reason, NOW());
    END IF;
    IF (NEW.psychological_support != OLD.psychological_support) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_elder_relationship_tb", OLD.family_elder_relationship_id, "psychological_support", OLD.psychological_support, NEW.psychological_support, NOW());
    END IF;
    IF (NEW.legal_advice != OLD.legal_advice) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_elder_relationship_tb", OLD.family_elder_relationship_id, "legal_advice", OLD.legal_advice, NEW.legal_advice, NOW());
    END IF;
    IF (NEW.legal_advice_reason != OLD.legal_advice_reason) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_elder_relationship_tb", OLD.family_elder_relationship_id, "legal_advice_reason", OLD.legal_advice_reason, NEW.legal_advice_reason, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_elder_relationship_tb", OLD.family_elder_relationship_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_elder_relationship_tb", OLD.family_elder_relationship_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "family_elder_relationship_tb", OLD.family_elder_relationship_id, "survey_id#respect#pariah#care#provision_needs#no_provision_needs_reason#psychological_support#legal_advice#legal_advice_reason#created_on#created_by", concat(OLD.survey_id,'#',OLD.respect,'#',OLD.pariah,'#',OLD.care,'#',OLD.provision_needs,'#',OLD.no_provision_needs_reason,'#',OLD.psychological_support,'#',OLD.legal_advice,'#',OLD.legal_advice_reason,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

// family_member_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`family_member_tb_AFTER_UPDATE` AFTER UPDATE ON `family_member_tb` FOR EACH ROW
BEGIN

	IF (NEW.elder_id != OLD.elder_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "elder_id", OLD.elder_id, NEW.elder_id, NOW());
    END IF;
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.member_id != OLD.member_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "member_id", OLD.member_id, NEW.member_id, NOW());
    END IF;
    IF (NEW.member_name != OLD.member_name) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "member_name", OLD.member_name, NEW.member_name, NOW());
    END IF;
    IF (NEW.member_sex_id != OLD.member_sex_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "member_sex_id", OLD.member_sex_id, NEW.member_sex_id, NOW());
    END IF;
    IF (NEW.relationship_id != OLD.relationship_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "relationship_id", OLD.relationship_id, NEW.relationship_id, NOW());
    END IF;
    IF (NEW.status_id != OLD.status_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "status_id", OLD.status_id, NEW.status_id, NOW());
    END IF;
    IF (NEW.dob != OLD.dob) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "dob", OLD.dob, NEW.dob, NOW());
    END IF;
    IF (NEW.education_level_id != OLD.education_level_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "education_level_id", OLD.education_level_id, NEW.education_level_id, NOW());
    END IF;
    IF (NEW.health_status_id != OLD.health_status_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "health_status_id", OLD.health_status_id, NEW.health_status_id, NOW());
    END IF;
    IF (NEW.income_shekel != OLD.income_shekel) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "income_shekel", OLD.income_shekel, NEW.income_shekel, NOW());
    END IF;
    IF (NEW.job != OLD.job) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "job", OLD.job, NEW.job, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_member_tb", OLD.family_member_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "family_member_tb", OLD.family_member_id, "elder_id#survey_id#member_id#member_name#member_sex_id#relationship_id#status_id#dob#education_level_id#health_status_id#income_shekel#job#created_on#created_by", concat(OLD.elder_id,'#',OLD.survey_id,'#',OLD.member_id,'#',OLD.member_name,'#',OLD.member_sex_id,'#',OLD.relationship_id,'#',OLD.status_id,'#',OLD.dob,'#',OLD.education_level_id,'#',OLD.health_status_id,'#',OLD.income_shekel,'#',OLD.job,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

//family_psychological_status_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`family_psychological_status_tb_AFTER_UPDATE` AFTER UPDATE ON `family_psychological_status_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_psychological_status_tb", OLD.family_psychological_status_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.psychological_status_id != OLD.psychological_status_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_psychological_status_tb", OLD.family_psychological_status_id, "psychological_status_id", OLD.psychological_status_id, NEW.psychological_status_id, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_psychological_status_tb", OLD.family_psychological_status_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "family_psychological_status_tb", OLD.family_psychological_status_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "family_psychological_status_tb", OLD.family_psychological_status_id, "survey_id#psychological_status_id#created_on#created_by", concat(OLD.survey_id,'#',OLD.psychological_status_id,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

// file_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`file_tb_AFTER_UPDATE` AFTER UPDATE ON `file_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.file_doc_id != OLD.file_doc_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "file_tb", OLD.file_id, "file_doc_id", OLD.file_doc_id, NEW.file_doc_id, NOW());
    END IF;
    IF (NEW.elder_id != OLD.elder_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "file_tb", OLD.file_id, "elder_id", OLD.elder_id, NEW.elder_id, NOW());
    END IF;
    IF (NEW.file_status_id != OLD.file_status_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "file_tb", OLD.file_id, "file_status_id", OLD.file_status_id, NEW.file_status_id, NOW());
    END IF;
    IF (NEW.close_date != OLD.close_date) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "file_tb", OLD.file_id, "close_date", OLD.close_date, NEW.close_date, NOW());
    END IF;
    IF (NEW.close_reason_id != OLD.close_reason_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "file_tb", OLD.file_id, "close_reason_id", OLD.close_reason_id, NEW.close_reason_id, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "file_tb", OLD.file_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "file_tb", OLD.file_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "file_tb", OLD.file_id, "file_doc_id#file_doc_id#elder_id#file_status_id#close_date#close_reason_id#created_on#created_by", concat(OLD.file_doc_id,'#',OLD.elder_id,'#',OLD.file_status_id,'#',OLD.close_date,'#',OLD.close_reason_id,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

//follow_up_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`follow_up_tb_AFTER_UPDATE` AFTER UPDATE ON `follow_up_tb` FOR EACH ROW
BEGIN
	IF (NEW.elder_id != OLD.elder_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "follow_up_tb", OLD.follow_up_id, "elder_id", OLD.elder_id, NEW.elder_id, NOW());
    END IF;
    IF (NEW.researcher_id != OLD.researcher_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "follow_up_tb", OLD.follow_up_id, "researcher_id", OLD.researcher_id, NEW.researcher_id, NOW());
    END IF;
    IF (NEW.visit_date != OLD.visit_date) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "follow_up_tb", OLD.follow_up_id, "visit_date", OLD.visit_date, NEW.visit_date, NOW());
    END IF;
    IF (NEW.visit_time != OLD.visit_time) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "follow_up_tb", OLD.follow_up_id, "visit_time", OLD.visit_time, NEW.visit_time, NOW());
    END IF;
    IF (NEW.visit_end_time != OLD.visit_end_time) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "follow_up_tb", OLD.follow_up_id, "visit_end_time", OLD.visit_end_time, NEW.visit_end_time, NOW());
    END IF;
    IF (NEW.visit_reason != OLD.visit_reason) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "follow_up_tb", OLD.follow_up_id, "visit_reason", OLD.visit_reason, NEW.visit_reason, NOW());
    END IF;
    IF (NEW.notes != OLD.notes) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "follow_up_tb", OLD.follow_up_id, "notes", OLD.notes, NEW.notes, NOW());
    END IF;
    IF (NEW.recommendation != OLD.recommendation) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "follow_up_tb", OLD.follow_up_id, "recommendation", OLD.recommendation, NEW.recommendation, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "follow_up_tb", OLD.follow_up_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "follow_up_tb", OLD.follow_up_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "follow_up_tb", OLD.follow_up_id, "elder_id#researcher_id#visit_date#visit_time#visit_end_time#visit_reason#notes#recommendation#created_on#created_by", concat(OLD.elder_id,'#',OLD.researcher_id,'#',OLD.visit_date,'#',OLD.visit_time,'#',OLD.visit_end_time,'#',OLD.visit_reason,'#',OLD.notes,'#',OLD.recommendation,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

//home_improvement_recomendation_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`home_improvement_recomendation_tb_AFTER_UPDATE` AFTER UPDATE ON `home_improvement_recomendation_tb` FOR EACH ROW
BEGIN
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_improvement_recomendation_tb", OLD.home_improvement_recomendation_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.improvement_type_id != OLD.improvement_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_improvement_recomendation_tb", OLD.home_improvement_recomendation_id, "improvement_type_id", OLD.improvement_type_id, NEW.improvement_type_id, NOW());
    END IF;
    IF (NEW.improvement_details != OLD.improvement_details) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_improvement_recomendation_tb", OLD.home_improvement_recomendation_id, "improvement_details", OLD.improvement_details, NEW.improvement_details, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_improvement_recomendation_tb", OLD.home_improvement_recomendation_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_improvement_recomendation_tb", OLD.home_improvement_recomendation_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "home_improvement_recomendation_tb", OLD.home_improvement_recomendation_id, "survey_id#improvement_type_id#improvement_details#created_on#created_by", concat(OLD.survey_id,'#',OLD.improvement_type_id,'#',OLD.improvement_details,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

//home_status_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`home_status_tb_AFTER_UPDATE` AFTER UPDATE ON `home_status_tb` FOR EACH ROW
BEGIN
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_status_tb", OLD.home_status_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.home_situation_id != OLD.home_situation_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_status_tb", OLD.home_status_id, "home_situation_id", OLD.home_situation_id, NEW.home_situation_id, NOW());
    END IF;
    IF (NEW.home_type_id != OLD.home_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_status_tb", OLD.home_status_id, "home_type_id", OLD.home_type_id, NEW.home_type_id, NOW());
    END IF;
    IF (NEW.ceiling_type_id != OLD.ceiling_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_status_tb", OLD.home_status_id, "ceiling_type_id", OLD.ceiling_type_id, NEW.ceiling_type_id, NOW());
    END IF;
    IF (NEW.ceiling_description != OLD.ceiling_description) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_status_tb", OLD.home_status_id, "ceiling_description", OLD.ceiling_description, NEW.ceiling_description, NOW());
    END IF;
    IF (NEW.furniture_level_id != OLD.furniture_level_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_status_tb", OLD.home_status_id, "furniture_level_id", OLD.furniture_level_id, NEW.furniture_level_id, NOW());
    END IF;
    IF (NEW.furniture_needs != OLD.furniture_needs) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_status_tb", OLD.home_status_id, "furniture_needs", OLD.furniture_needs, NEW.furniture_needs, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_status_tb", OLD.home_status_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "home_status_tb", OLD.home_status_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "home_status_tb", OLD.home_status_id, "survey_id#home_situation_id#home_type_id#ceiling_type_id#ceiling_description#furniture_level_id#furniture_needs#created_on#created_by", concat(OLD.survey_id,'#',OLD.home_situation_id,'#',OLD.home_type_id,'#',OLD.ceiling_type_id,'#',OLD.ceiling_description,'#',OLD.furniture_level_id,'#',OLD.furniture_needs,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())
    
//income_resources_details_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`income_resources_details_tb_AFTER_UPDATE` AFTER UPDATE ON `income_resources_details_tb` FOR EACH ROW
BEGIN
	
    IF (NEW.income_resources_id != OLD.income_resources_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_details_tb", OLD.income_resources_details_id, "income_resources_id", OLD.income_resources_id, NEW.income_resources_id, NOW());
    END IF;
    IF (NEW.resource_id != OLD.resource_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_details_tb", OLD.income_resources_details_id, "resource_id", OLD.resource_id, NEW.resource_id, NOW());
    END IF;
    IF (NEW.organization_id != OLD.organization_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_details_tb", OLD.income_resources_details_id, "organization_id", OLD.organization_id, NEW.organization_id, NOW());
    END IF;
    IF (NEW.cash_income != OLD.cash_income) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_details_tb", OLD.income_resources_details_id, "cash_income", OLD.cash_income, NEW.cash_income, NOW());
    END IF;
    IF (NEW.package_income != OLD.package_income) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_details_tb", OLD.income_resources_details_id, "package_income", OLD.package_income, NEW.package_income, NOW());
    END IF;
    IF (NEW.package_cash_value != OLD.package_cash_value) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_details_tb", OLD.income_resources_details_id, "package_cash_value", OLD.package_cash_value, NEW.package_cash_value, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_details_tb", OLD.income_resources_details_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_details_tb", OLD.income_resources_details_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END    

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "income_resources_details_tb", OLD.income_resources_details_id, "income_resources_id#resource_id#organization_id#cash_income#package_income#package_cash_value#created_on#created_by", concat(OLD.income_resources_id,'#',OLD.resource_id,'#',OLD.organization_id,'#',OLD.cash_income,'#',OLD.package_income,'#',OLD.package_cash_value,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

// income_resources_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`income_resources_tb_AFTER_UPDATE` AFTER UPDATE ON `family_psychological_status_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_tb", OLD.income_resources_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.total_income != OLD.total_income) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_tb", OLD.income_resources_id, "total_income", OLD.total_income, NEW.total_income, NOW());
    END IF;
    IF (NEW.elder_portion != OLD.elder_portion) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_tb", OLD.income_resources_id, "elder_portion", OLD.elder_portion, NEW.elder_portion, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_tb", OLD.income_resources_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "income_resources_tb", OLD.income_resources_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "income_resources_tb", OLD.income_resources_id, "survey_id#total_income#elder_portion#created_on#created_by", concat(OLD.survey_id,'#',OLD.total_income,'#',OLD.total_income,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

//life_improvement_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`life_improvement_tb_AFTER_UPDATE` AFTER UPDATE ON `life_improvement_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "life_improvement_tb", OLD.life_improvement_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.elder_work_ability_id != OLD.elder_work_ability_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "life_improvement_tb", OLD.life_improvement_id, "elder_work_ability_id", OLD.elder_work_ability_id, NEW.elder_work_ability_id, NOW());
    END IF;
    IF (NEW.elder_work_type != OLD.elder_work_type) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "life_improvement_tb", OLD.life_improvement_id, "elder_work_type", OLD.elder_work_type, NEW.elder_work_type, NOW());
    END IF;
    IF (NEW.family_member_id != OLD.family_member_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "life_improvement_tb", OLD.life_improvement_id, "family_member_id", OLD.family_member_id, NEW.family_member_id, NOW());
    END IF;
    IF (NEW.family_work_type != OLD.family_work_type) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "life_improvement_tb", OLD.life_improvement_id, "family_work_type", OLD.family_work_type, NEW.family_work_type, NOW());
    END IF;
    IF (NEW.is_elder_need_training != OLD.is_elder_need_training) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "life_improvement_tb", OLD.life_improvement_id, "is_elder_need_training", OLD.is_elder_need_training, NEW.is_elder_need_training, NOW());
    END IF;
    IF (NEW.elder_training_type != OLD.elder_training_type) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "life_improvement_tb", OLD.life_improvement_id, "elder_training_type", OLD.elder_training_type, NEW.elder_training_type, NOW());
    END IF;
    IF (NEW.can_start_project != OLD.can_start_project) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "life_improvement_tb", OLD.life_improvement_id, "can_start_project", OLD.can_start_project, NEW.can_start_project, NOW());
    END IF;
    IF (NEW.project_type != OLD.project_type) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "life_improvement_tb", OLD.life_improvement_id, "project_type", OLD.project_type, NEW.project_type, NOW());
    END IF;
    IF (NEW.project_budget != OLD.project_budget) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "life_improvement_tb", OLD.life_improvement_id, "project_budget", OLD.project_budget, NEW.project_budget, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "life_improvement_tb", OLD.life_improvement_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "life_improvement_tb", OLD.life_improvement_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "life_improvement_tb", OLD.life_improvement_id, "survey_id#elder_work_ability_id#elder_work_type#family_member_id#family_work_type#is_elder_need_training#elder_training_type#can_start_project#project_type#project_budget#created_on#created_by", concat(OLD.survey_id,'#',OLD.elder_work_ability_id,'#',OLD.elder_work_type,'#',OLD.family_member_id,'#',OLD.family_work_type,'#',OLD.is_elder_need_training,'#',OLD.elder_training_type,'#',OLD.can_start_project,'#',OLD.project_type,'#',OLD.project_budget,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

// medical_aid_recomendation_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`medical_aid_recomendation_tb_AFTER_UPDATE` AFTER UPDATE ON `medical_aid_recomendation_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medical_aid_recomendation_tb", OLD.medical_aid_recomendation_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.medical_aid_type_id != OLD.medical_aid_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medical_aid_recomendation_tb", OLD.medical_aid_recomendation_id, "medical_aid_type_id", OLD.medical_aid_type_id, NEW.medical_aid_type_id, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medical_aid_recomendation_tb", OLD.medical_aid_recomendation_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medical_aid_recomendation_tb", OLD.medical_aid_recomendation_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "medical_aid_recomendation_tb", OLD.medical_aid_recomendation_id, "survey_id#medical_aid_type_id#created_on#created_by", concat(OLD.survey_id,'#',OLD.medical_aid_type_id,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

// medication_availability_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`medication_availability_tb_AFTER_UPDATE` AFTER UPDATE ON `medication_availability_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medication_availability_tb", OLD.medication_availability_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.medicine_name != OLD.medicine_name) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medication_availability_tb", OLD.medication_availability_id, "medicine_name", OLD.medicine_name, NEW.medicine_name, NOW());
    END IF;
    IF (NEW.availability_status_id != OLD.availability_status_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medication_availability_tb", OLD.medication_availability_id, "availability_status_id", OLD.availability_status_id, NEW.availability_status_id, NOW());
    END IF;
    IF (NEW.unavailable_reason != OLD.unavailable_reason) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medication_availability_tb", OLD.medication_availability_id, "unavailable_reason", OLD.unavailable_reason, NEW.unavailable_reason, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medication_availability_tb", OLD.medication_availability_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medication_availability_tb", OLD.medication_availability_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "medication_availability_tb", OLD.medication_availability_id, "survey_id#medicine_name#availability_status_id#unavailable_reason#created_on#created_by", concat(OLD.survey_id,'#',OLD.medicine_name,'#',OLD.availability_status_id,'#',OLD.unavailable_reason,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())



// medication_need_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`medication_need_tb_AFTER_UPDATE` AFTER UPDATE ON `medication_need_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.survey_id != OLD.survey_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medication_need_tb", OLD.medication_need_id, "survey_id", OLD.survey_id, NEW.survey_id, NOW());
    END IF;
    IF (NEW.medication_type_id != OLD.medication_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medication_need_tb", OLD.medication_need_id, "medication_type_id", OLD.medication_type_id, NEW.medication_type_id, NOW());
    END IF;
    IF (NEW.medication_details != OLD.medication_details) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medication_need_tb", OLD.medication_need_id, "medication_details", OLD.medication_details, NEW.medication_details, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medication_need_tb", OLD.medication_need_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "medication_need_tb", OLD.medication_need_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "medication_need_tb", OLD.medication_need_id, "survey_id#medication_type_id#medication_details#created_on#created_by", concat(OLD.survey_id,'#',OLD.medication_type_id,'#',OLD.medication_details,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

// menu_page_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`menu_page_tb_AFTER_UPDATE` AFTER UPDATE ON `menu_page_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.menu_id != OLD.menu_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "menu_page_tb", OLD.menu_page_id, "menu_id", OLD.menu_id, NEW.menu_id, NOW());
    END IF;
    
    IF (NEW.page_id != OLD.page_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "menu_page_tb", OLD.menu_page_id, "page_id", OLD.page_id, NEW.page_id, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "menu_page_tb", OLD.menu_page_id, "menu_id#page_id", concat(OLD.menu_id,'#',OLD.page_id), NULL, NOW())

// menu_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`menu_tb_AFTER_UPDATE` AFTER UPDATE ON `menu_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.menu_name != OLD.menu_name) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "menu_tb", OLD.menu_id, "menu_name", OLD.menu_name, NEW.menu_name, NOW());
    END IF;
    IF (NEW.menu_order != OLD.menu_order) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "menu_tb", OLD.menu_id, "menu_order", OLD.menu_order, NEW.menu_order, NOW());
    END IF;
    IF (NEW.menu_icon != OLD.menu_icon) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "menu_tb", OLD.menu_id, "menu_icon", OLD.menu_icon, NEW.menu_icon, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "menu_tb", OLD.menu_id, "menu_name#menu_order#menu_icon", concat(OLD.menu_name,'#',OLD.menu_order,'#',OLD.menu_icon), NULL, NOW())
    
// page_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`page_tb_AFTER_UPDATE` AFTER UPDATE ON `page_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.page_title != OLD.page_title) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "page_tb", OLD.page_id, "page_title", OLD.page_title, NEW.page_title, NOW());
    END IF;
    IF (NEW.page_url != OLD.page_url) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "page_tb", OLD.page_id, "page_url", OLD.page_url, NEW.page_url, NOW());
    END IF;
    IF (NEW.page_order != OLD.page_order) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "page_tb", OLD.page_id, "page_order", OLD.page_order, NEW.page_order, NOW());
    END IF;
    IF (NEW.page_icon != OLD.page_icon) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "page_tb", OLD.page_id, "page_icon", OLD.page_icon, NEW.page_icon, NOW());
    END IF;
    IF (NEW.show_in_menue != OLD.show_in_menue) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "page_tb", OLD.page_id, "show_in_menue", OLD.show_in_menue, NEW., NOW());
    END IF;
END
    
INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "page_tb", OLD.page_id, "page_title#page_url#page_order#page_icon#show_in_menue", concat(OLD.page_title,'#',OLD.page_url,'#',OLD.page_order,'#',OLD.page_icon,'#',OLD.show_in_menue), NULL, NOW())

//sms_receiver_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`sms_receiver_tb_AFTER_UPDATE` AFTER UPDATE ON `sms_receiver_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.sms_id != OLD.sms_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "sms_receiver_tb", OLD.sms_receiver_id, "sms_id", OLD.sms_id, NEW.sms_id, NOW());
    END IF;
    IF (NEW.file_id != OLD.file_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "sms_receiver_tb", OLD.sms_receiver_id, "file_id", OLD.file_id, NEW.file_id, NOW());
    END IF;
    IF (NEW.mobile_num != OLD.mobile_num) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "sms_receiver_tb", OLD.sms_receiver_id, "mobile_num", OLD.mobile_num, NEW., NOW());
    END IF;
    
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "sms_receiver_tb", OLD.sms_receiver_id, "sms_id#file_id#mobile_num", concat(OLD.sms_id,'#',OLD.file_id,'#',OLD.mobile_num), NULL, NOW())


//sms_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`sms_tb_AFTER_UPDATE` AFTER UPDATE ON `sms_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.sms_text != OLD.sms_text) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "sms_tb", OLD.sms_id, "sms_text", OLD.sms_text, NEW.sms_text, NOW());
    END IF;
    IF (NEW.sms_date != OLD.sms_date) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "sms_tb", OLD.sms_id, "sms_date", OLD.sms_date, NEW.sms_date, NOW());
    END IF;
    IF (NEW.send_by != OLD.send_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "sms_tb", OLD.sms_id, "send_by", OLD.send_by, NEW., NOW());
    END IF;
    
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "sms_tb", OLD.sms_id, "sms_text#sms_date#send_by", concat(OLD.sms_text,'#',OLD.sms_date,'#',OLD.send_by), NULL, NOW())


CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`sub_constant_tb_AFTER_UPDATE` AFTER UPDATE ON `sub_constant_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.constant_id != OLD.constant_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "sub_constant_tb", OLD.sub_constant_id, "constant_id", OLD.constant_id, NEW.constant_id, NOW());
    END IF;
    IF (NEW.sub_constant_name != OLD.sub_constant_name) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "sub_constant_tb", OLD.sub_constant_id, "sub_constant_name", OLD.sub_constant_name, NEW.sub_constant_name, NOW());
    END IF;
    IF (NEW.parent_id != OLD.parent_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "sub_constant_tb", OLD.sub_constant_id, "parent_id", OLD.parent_id, NEW.parent_id, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "sub_constant_tb", OLD.sub_constant_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "sub_constant_tb", OLD.sub_constant_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "sub_constant_tb", OLD.sub_constant_id, "constant_id#sub_constant_name#parent_id#created_on#created_by", concat(OLD.constant_id,'#',OLD.sub_constant_name,'#',OLD.parent_id,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

//survey_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`survey_tb_AFTER_UPDATE` AFTER UPDATE ON `sub_constant_tb` FOR EACH ROW
BEGIN
	
	IF (NEW.file_id != OLD.file_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "survey_tb", OLD.survey_id, "file_id", OLD.file_id, NEW.file_id, NOW());
    END IF;
    IF (NEW.visit_date != OLD.visit_date) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "survey_tb", OLD.survey_id, "visit_date", OLD.visit_date, NEW.visit_date, NOW());
    END IF;
    IF (NEW.visit_time != OLD.visit_time) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "survey_tb", OLD.survey_id, "visit_time", OLD.visit_time, NEW.visit_time, NOW());
    END IF;
    IF (NEW.visit_end_time != OLD.visit_end_time) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "survey_tb", OLD.survey_id, "visit_end_time", OLD.visit_end_time, NEW.visit_end_time, NOW());
    END IF;
    IF (NEW.visit_purpose_id != OLD.visit_purpose_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "survey_tb", OLD.survey_id, "visit_purpose_id", OLD.visit_purpose_id, NEW.visit_purpose_id, NOW());
    END IF;
    IF (NEW.researcher_id != OLD.researcher_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "survey_tb", OLD.survey_id, "researcher_id", OLD.researcher_id, NEW.researcher_id, NOW());
    END IF;
    IF (NEW.researcher_assistant_fst_id != OLD.researcher_assistant_fst_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "survey_tb", OLD.survey_id, "researcher_assistant_fst_id", OLD.researcher_assistant_fst_id, NEW.researcher_assistant_fst_id, NOW());
    END IF;
    IF (NEW.researcher_assistant_sec_id != OLD.researcher_assistant_sec_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "survey_tb", OLD.survey_id, "researcher_assistant_sec_id", OLD.researcher_assistant_sec_id, NEW.researcher_assistant_sec_id, NOW());
    END IF;
    IF (NEW.researcher_notes != OLD.researcher_notes) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "survey_tb", OLD.survey_id, "researcher_notes", OLD.researcher_notes, NEW.researcher_notes, NOW());
    END IF;
    IF (NEW.researcher_recommendations != OLD.researcher_recommendations) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "survey_tb", OLD.survey_id, "researcher_recommendations", OLD.researcher_recommendations, NEW.researcher_recommendations, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "survey_tb", OLD.survey_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "survey_tb", OLD.survey_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "survey_tb", OLD.survey_id, "file_id#visit_date#visit_time#visit_end_time#researcher_id#researcher_assistant_fst_id#researcher_assistant_sec_id#researcher_notes#researcher_recommendations#created_on#created_by", 
    concat(OLD.file_id,'#',OLD.visit_date,'#',OLD.visit_time,'#',OLD.visit_end_time,'#',OLD.researcher_id,'#',OLD.researcher_assistant_fst_id,'#',OLD.researcher_assistant_sec_id,'#',OLD.researcher_notes,'#',OLD.researcher_recommendations,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

//user_menu_page_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`user_menu_page_tb_AFTER_UPDATE` AFTER UPDATE ON `user_menu_page_tb` FOR EACH ROW
BEGIN
	IF (NEW.menu_page_id != OLD.menu_page_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "user_menu_page_tb", OLD.user_menu_page_id, "menu_page_id", OLD.menu_page_id, NEW.menu_page_id, NOW());
    END IF;
    IF (NEW.user_type_id != OLD.user_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "user_menu_page_tb", OLD.user_menu_page_id, "user_type_id", OLD.user_type_id, NEW.user_type_id, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "user_menu_page_tb", OLD.user_menu_page_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "user_menu_page_tb", OLD.user_menu_page_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "user_menu_page_tb", OLD.user_menu_page_id, "menu_page_id#user_type_id#created_on#created_by", concat(OLD.menu_page_id,'#',OLD.user_type_id,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

//users_tb
CREATE DEFINER = CURRENT_USER TRIGGER `elders`.`users_tb_AFTER_UPDATE` AFTER UPDATE ON `users_tb` FOR EACH ROW
BEGIN
	IF (NEW.user_name != OLD.user_name) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "users_tb", OLD.user_id, "user_name", OLD.user_name, NEW.user_name, NOW());
    END IF;
    IF (NEW.passward != OLD.passward) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "users_tb", OLD.user_id, "user_type_id", OLD.user_type_id, NEW.user_type_id, NOW());
    END IF;
    IF (NEW.employee_id != OLD.employee_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "users_tb", OLD.user_id, "employee_id", OLD.employee_id, NEW.employee_id, NOW());
    END IF;
    IF (NEW.is_active != OLD.is_active) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "users_tb", OLD.user_id, "is_active", OLD.is_active, NEW.is_active, NOW());
    END IF;
    IF (NEW.user_type_id != OLD.user_type_id) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "users_tb", OLD.user_id, "user_type_id", OLD.user_type_id, NEW.user_type_id, NOW());
    END IF;
    IF (NEW.created_on != OLD.created_on) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "users_tb", OLD.user_id, "created_on", OLD.created_on, NEW.created_on, NOW());
    END IF;
    IF (NEW.created_by != OLD.created_by) THEN
        INSERT INTO data_tracking_tb 
            (`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
        VALUES 
            ("update", "users_tb", OLD.user_id, "created_by", OLD.created_by, NEW.created_by, NOW());
    END IF;
END

INSERT INTO data_tracking_tb 
	(`action`, `table_name` , `table_pk` , `col_name`, `old_value` , `new_value` , `created_on`) 
VALUES 
	("delete", "users_tb", OLD.user_id, "user_name#passward#employee_id#is_active#user_type_id#created_on#created_by", concat(OLD.user_name,'#',OLD.passward,'#',OLD.employee_id,'#',OLD.is_active,'#',OLD.user_type_id,'#',OLD.created_on,'#',OLD.created_by), NULL, NOW())

