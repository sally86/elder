<?php
class Reportsmodel extends CI_Model
{
	function get_eldr_info_rpt($requestData)
	{
		$columns = array( 
			1 => 'file_id',
			2 => 'elder_id',
			3 => 'name',
			4 => 'dob',
			5 => 'status', 
			6 => 'full_address', 
			7 => 'phone', 
			8 => 'mobile_first',
			9 => 'mobile_second',
			10 => 'gov.sub_constant_name');
		
		$myquery = "SELECT 	e.elder_id, CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) as name,
							TIMESTAMPDIFF(YEAR,e.dob,CURDATE()) as age,
							e.full_address, e.phone, e.mobile_first, e.mobile_second,
							e.status_id, sts.sub_constant_name as status,
							e.governorate_id, gov.sub_constant_name as governorate,
							f.file_id, f.file_status_id
 					FROM 	elder_tb e, file_tb f, sub_constant_tb sts, sub_constant_tb gov
					WHERE 	e.elder_id = f.elder_id
					  AND	e.governorate_id = gov.sub_constant_id
					  AND	e.status_id = sts.sub_constant_id
                      AND 	f.file_status_id = 170";
		
		if(isset($requestData['txtFileid']) && $requestData['txtFileid'] !='')
		{
			$myquery = $myquery." AND f.file_id = ".$requestData['txtFileid'];
		}
		
		if(isset($requestData['txtElderid']) && $requestData['txtElderid'] !='')
		{
			$myquery = $myquery." AND e.elder_id = ".$requestData['txtElderid'];
		}
		
		if(isset($requestData['txtElderName']) && $requestData['txtElderName'] !='')
		{
			$myquery = $myquery." AND CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) 
			LIKE '%".$requestData['txtElderName']."%' ";
		}
		if(isset($requestData['txtFromAge']) && $requestData['txtFromAge'] !='')
		{
			$myquery = $myquery." AND TIMESTAMPDIFF(YEAR,e.dob,CURDATE()) >= ".$requestData['txtFromAge'];
		}
		if(isset($requestData['txtToAge']) && $requestData['txtToAge'] !='')
		{
			$myquery = $myquery." AND TIMESTAMPDIFF(YEAR,e.dob,CURDATE()) <= ".$requestData['txtToAge'];
		}
		if(isset($requestData['drpStatus']) && $requestData['drpStatus'] !='')
		{
			$myquery = $myquery." AND status_id = ".$requestData['drpStatus'];
		}
		if(isset($requestData['txtAddress']) && $requestData['txtAddress'] !='')
		{
			$myquery = $myquery." AND full_address LIKE '%".$requestData['txtAddress']."%' ";
		}
		if(isset($requestData['txtPhone']) && $requestData['txtPhone'] !='')
		{
			$myquery = $myquery." AND phone = ".$requestData['txtPhone'];
		}
		if(isset($requestData['txtMobile1']) && $requestData['txtMobile1'] !='')
		{
			$myquery = $myquery." AND mobile_first = ".$requestData['txtMobile1'];
		}
		if(isset($requestData['txtMobile2']) && $requestData['txtMobile2'] !='')
		{
			$myquery = $myquery." AND mobile_second = LIKE '%".$requestData['txtMobile2']."%' ";
		}
		if(isset($requestData['drpGovernorate']) && $requestData['drpGovernorate'] !='')
		{
			$myquery = $myquery." AND e.governorate_id = ".$requestData['drpGovernorate'];
		}
		
		
		$myquery = $myquery." ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir'];
		
		if ($requestData['length'] > 0)
			$myquery = $myquery." LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		
		$res = $this->db->query($myquery);
		return $res->result();
	}
	
	// Gender Report
	function get_eldr_gender_rpt($requestData)
	{
		$columns = array( 
			1 => 'file_id',
			2 => 'elder_id',
			3 => 'name',
			4 => 'sex',
			5 => 'gov.sub_constant_name');
		
		$myquery = "SELECT 	e.elder_id, CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) as name,
							e.sex_id, sx.sub_constant_name as sex,
							e.governorate_id, gov.sub_constant_name as governorate,
							f.file_id, f.file_status_id
 					 FROM	elder_tb e, file_tb f, sub_constant_tb sx, sub_constant_tb gov
					WHERE 	e.elder_id = f.elder_id
					  AND	e.sex_id = sx.sub_constant_id
					  AND	e.governorate_id = gov.sub_constant_id
					  AND 	f.file_status_id = 170";
		
		if(isset($requestData['txtFileid']) && $requestData['txtFileid'] !='')
		{
			$myquery = $myquery." AND f.file_id = ".$requestData['txtFileid'];
		}
		
		if(isset($requestData['txtElderid']) && $requestData['txtElderid'] !='')
		{
			$myquery = $myquery." AND e.elder_id = ".$requestData['txtElderid'];
		}
		
		if(isset($requestData['txtElderName']) && $requestData['txtElderName'] !='')
		{
			$myquery = $myquery." AND CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) 
			LIKE '%".$requestData['txtElderName']."%' ";
		}
		if(isset($requestData['drpSex']) && $requestData['drpSex'] !='')
		{
			$myquery = $myquery." AND sex_id = ".$requestData['drpSex'];
		}
		
		if(isset($requestData['drpGovernorate']) && $requestData['drpGovernorate'] !='')
		{
			$myquery = $myquery." AND e.governorate_id = ".$requestData['drpGovernorate'];
		}
		
		
		$myquery = $myquery." ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir'];
		
		if ($requestData['length'] > 0)
			$myquery = $myquery." LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		
		$res = $this->db->query($myquery);
		return $res->result();
	}
	
	// Education Report
	function get_eldr_edu_rpt($requestData)
	{
		$columns = array( 
			1 => 'file_id',
			2 => 'elder_id',
			3 => 'name', 
			4 => 'phone', 
			5 => 'mobile_first',
			6 => 'mobile_second',
			7 => 'spc.sub_constant_name',
			8 => 'cjb.sub_constant_name', 
			9 => 'pjb.sub_constant_name',
			10 => 'gov.sub_constant_name');
		
		$myquery = "SELECT 	e.elder_id, CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) as name,
							e.phone, mobile_first, e.mobile_second,
							e.specialization_id, spc.sub_constant_name as specialization,
                            e.current_job_id, cjb.sub_constant_name as current_job,
                            e.previous_job_id, pjb.sub_constant_name as previous_job,
							e.governorate_id, gov.sub_constant_name as governorate,
							f.file_id, f.file_status_id
 					FROM 	elder_tb e, file_tb f, sub_constant_tb spc, sub_constant_tb cjb,
							sub_constant_tb pjb, sub_constant_tb gov
					WHERE 	e.elder_id = f.elder_id
					  AND	e.specialization_id = spc.sub_constant_id
					  AND	e.current_job_id = cjb.sub_constant_id
					  AND	e.previous_job_id = pjb.sub_constant_id
					  AND	e.governorate_id = gov.sub_constant_id
					  AND 	f.file_status_id = 170";
		
		if(isset($requestData['txtFileid']) && $requestData['txtFileid'] !='')
		{
			$myquery = $myquery." AND f.file_id = ".$requestData['txtFileid'];
		}
		
		if(isset($requestData['txtElderid']) && $requestData['txtElderid'] !='')
		{
			$myquery = $myquery." AND e.elder_id = ".$requestData['txtElderid'];
		}
		
		if(isset($requestData['txtElderName']) && $requestData['txtElderName'] !='')
		{
			$myquery = $myquery." AND CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) 
			LIKE '%".$requestData['txtElderName']."%' ";
		}
		if(isset($requestData['txtPhone']) && $requestData['txtPhone'] !='')
		{
			$myquery = $myquery." AND phone = ".$requestData['txtPhone'];
		}
		if(isset($requestData['txtMobile1']) && $requestData['txtMobile1'] !='')
		{
			$myquery = $myquery." AND mobile_first = ".$requestData['txtMobile1'];
		}
		if(isset($requestData['txtMobile2']) && $requestData['txtMobile2'] !='')
		{
			$myquery = $myquery." AND mobile_second = LIKE '%".$requestData['txtMobile2']."%' ";
		}
		if(isset($requestData['drpSpecialization']) && $requestData['drpSpecialization'] !='')
		{
			$myquery = $myquery." AND specialization_id = ".$requestData['drpSpecialization'];
		}
		if(isset($requestData['drpCurrentJob']) && $requestData['drpCurrentJob'] !='')
		{
			$myquery = $myquery." AND current_job_id = ".$requestData['drpCurrentJob'];
		}
		if(isset($requestData['drpPreviousjob']) && $requestData['drpPreviousjob'] !='')
		{
			$myquery = $myquery." AND previous_job_id = ".$requestData['drpPreviousjob'];
		}
		if(isset($requestData['drpGovernorate']) && $requestData['drpGovernorate'] !='')
		{
			$myquery = $myquery." AND e.governorate_id = ".$requestData['drpGovernorate'];
		}
		
		
		$myquery = $myquery." ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir'];
		
		if ($requestData['length'] > 0)
			$myquery = $myquery." LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		
		$res = $this->db->query($myquery);
		return $res->result();
	}
	
	
	// Income Report
	function get_income_rpt($requestData)
	{
		
		
		$resource_query = "SELECT GROUP_CONCAT(res.sub_constant_name SEPARATOR ' - ')
							   FROM income_resources_details_tb irdet,	sub_constant_tb res
							  WHERE irdet.resource_id = res.sub_constant_id
								AND irdet.income_resources_id = ir.income_resources_id";
		
		$family_query = "SELECT COUNT(fm.family_member_id) a
							   FROM family_member_tb fm
							  WHERE fm.survey_id = s.survey_id";
		
		$select = "SELECT 	ir.income_resources_id, s.survey_id, e.elder_id, 
							CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) as name,
							e.phone, mobile_first, e.mobile_second,
                            e.governorate_id, gov.sub_constant_name as governorate,
							f.file_id, f.file_status_id,
                            ir.total_income, ir.elder_portion, ";
							
		$from = " FROM 	elder_tb e, file_tb f, survey_tb s, income_resources_tb ir, sub_constant_tb gov";
		
		$where = " WHERE 	e.elder_id = f.elder_id
					 AND	s.file_id = f.file_id
					 AND	s.survey_id = ir.survey_id
                     AND	e.governorate_id = gov.sub_constant_id
                     AND 	f.file_status_id = 170";
					  
		$columns = array( 
			1 => 'file_id',
			2 => 'name', 
			3 => 'phone', 
			4 => 'mobile_first',
			5 => 'mobile_second',
			6 => 'count_family_member',
			7 => 'resource',
			8 => 'ir.total_income', 
			9 => 'ir.elder_portion',
			10 => 'gov.sub_constant_name');
		
		if(isset($requestData['txtFileid']) && $requestData['txtFileid'] !='')
		{
			$where = $where." AND f.file_id = ".$requestData['txtFileid'];
		}
		if(isset($requestData['txtElderName']) && $requestData['txtElderName'] !='')
		{
			$where = $where." AND CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) 
			LIKE '%".$requestData['txtElderName']."%' ";
		}
		if(isset($requestData['txtPhone']) && $requestData['txtPhone'] !='')
		{
			$where = $where." AND phone = ".$requestData['txtPhone'];
		}
		if(isset($requestData['txtMobile1']) && $requestData['txtMobile1'] !='')
		{
			$where = $where." AND mobile_first = ".$requestData['txtMobile1'];
		}
		if(isset($requestData['txtMobile2']) && $requestData['txtMobile2'] !='')
		{
			$where = $where." AND mobile_second = LIKE '%".$requestData['txtMobile2']."%' ";
		}
		if(isset($requestData['txtFamilynum']) && $requestData['txtFamilynum'] !='')
		{
			$where = $where." AND ($family_query) = ".$requestData['txtFamilynum'];
		}
		if(isset($requestData['drpIncomeres']) && $requestData['drpIncomeres'] !='')
		{
			/*$resource_query = $resource_query." AND irdet.resource_id = ".$requestData['drpIncomeres'];
			$where = $where." AND ($resource_query) != ''";*/
			$from = $from . ", income_resources_details_tb oirdet";
			$where = $where." AND oirdet.income_resources_id = ir.income_resources_id";
			$where = $where." AND oirdet.resource_id = ".$requestData['drpIncomeres'];
			
		}
		if(isset($requestData['txtTotalincome']) && $requestData['txtTotalincome'] !='')
		{
			$where = $where." AND ir.total_income = ".$requestData['txtTotalincome'];
		}
		if(isset($requestData['txtElderportion']) && $requestData['txtElderportion'] !='')
		{
			$where = $where." AND ir.elder_portion = ".$requestData['txtElderportion'];
		}
		if(isset($requestData['drpGovernorate']) && $requestData['drpGovernorate'] !='')
		{
			$where = $where." AND e.governorate_id = ".$requestData['drpGovernorate'];
		}
		
		$myquery = "$select
					($resource_query) as resource,
					($family_query) as count_family_member
 					$from
					$where";
		$myquery = $myquery." ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir'];
		
		if ($requestData['length'] > 0)
			$myquery = $myquery." LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		
		$res = $this->db->query($myquery);
		return $res->result();
	}
	
	
	// Home Report
	function get_home_status_rpt($requestData)
	{
		$columns = array( 
			1 => 'file_id',
			2 => 'name', 
			3 => 'phone', 
			4 => 'mobile_first',
			5 => 'mobile_second',
			6 => 'sts.sub_constant_name',
			7 => 'tp.sub_constant_name', 
			8 => 'cl.sub_constant_name',
			9 => 'ceiling_description',
			10 => 'fr.sub_constant_name',
			11 => 'furniture_needs',
			12 => 'gov.sub_constant_name');
		
		$myquery = "  SELECT 	e.elder_id, CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) as name,
							e.phone, mobile_first, e.mobile_second,
                            h.home_situation_id, sts.sub_constant_name as home_situation,
                            h.home_type_id, tp.sub_constant_name as home_type,
                            h.ceiling_type_id, cl.sub_constant_name as ceiling_type,
                            h.ceiling_description,
                            h.furniture_level_id, fr.sub_constant_name as furniture_level,
                            h.furniture_needs,
                            e.governorate_id, gov.sub_constant_name as governorate,
							f.file_id, f.file_status_id
 					FROM 	elder_tb e, file_tb f,  survey_tb s, home_status_tb h, sub_constant_tb sts, sub_constant_tb tp,
							sub_constant_tb cl, sub_constant_tb fr, sub_constant_tb gov
					WHERE 	e.elder_id = f.elder_id
					  AND	s.file_id = f.file_id
                      AND	s.survey_id = h.survey_id
					  AND	h.home_situation_id = sts.sub_constant_id
					  AND	h.home_type_id = tp.sub_constant_id
					  AND	h.ceiling_type_id = cl.sub_constant_id
					  AND	h.furniture_level_id = fr.sub_constant_id
                      AND	e.governorate_id = gov.sub_constant_id
                      AND 	f.file_status_id = 170";
		
		if(isset($requestData['txtFileid']) && $requestData['txtFileid'] !='')
		{
			$myquery = $myquery." AND f.file_id = ".$requestData['txtFileid'];
		}
		if(isset($requestData['txtElderName']) && $requestData['txtElderName'] !='')
		{
			$myquery = $myquery." AND CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) 
			LIKE '%".$requestData['txtElderName']."%' ";
		}
		if(isset($requestData['txtPhone']) && $requestData['txtPhone'] !='')
		{
			$myquery = $myquery." AND phone = ".$requestData['txtPhone'];
		}
		if(isset($requestData['txtMobile1']) && $requestData['txtMobile1'] !='')
		{
			$myquery = $myquery." AND mobile_first = ".$requestData['txtMobile1'];
		}
		if(isset($requestData['txtMobile2']) && $requestData['txtMobile2'] !='')
		{
			$myquery = $myquery." AND e.mobile_second = ".$requestData['txtMobile2'];
		}
		if(isset($requestData['drpSituation']) && $requestData['drpSituation'] !='')
		{
			$myquery = $myquery." AND h.home_situation_id = ".$requestData['drpSituation'];
		}
		if(isset($requestData['drpHometype']) && $requestData['drpHometype'] !='')
		{
			$myquery = $myquery." AND h.home_type_id = ".$requestData['drpHometype'];
		}
		if(isset($requestData['drpCeilingtype']) && $requestData['drpCeilingtype'] !='')
		{
			$myquery = $myquery." AND h.ceiling_type_id = ".$requestData['drpCeilingtype'];
		}
		if(isset($requestData['txtCellingdesc']) && $requestData['txtCellingdesc'] !='')
		{
			$myquery = $myquery." AND h.ceiling_description LIKE '%".$requestData['txtCellingdesc']."%' ";
		}
		if(isset($requestData['drpFurniturelevel']) && $requestData['drpFurniturelevel'] !='')
		{
			$myquery = $myquery." AND h.furniture_level_id = ".$requestData['drpFurniturelevel'];
		}
		if(isset($requestData['txtFurnitureneed']) && $requestData['txtFurnitureneed'] !='')
		{
			$myquery = $myquery." AND h.furniture_needs LIKE '%".$requestData['txtFurnitureneed']."%' ";
		}
		if(isset($requestData['drpGovernorate']) && $requestData['drpGovernorate'] !='')
		{
			$myquery = $myquery." AND e.governorate_id = ".$requestData['drpGovernorate'];
		}
		
		
		$myquery = $myquery." ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir'];
		
		if ($requestData['length'] > 0)
			$myquery = $myquery." LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		
		$res = $this->db->query($myquery);
		return $res->result();
	}
	
	//  Maintenance Report
	function get_maintenance_rpt($requestData)
	{
		$columns = array( 
			1 => 'file_id',
			2 => 'name', 
			3 => 'phone', 
			4 => 'mobile_first',
			5 => 'mobile_second',
			6 => 'rm.sub_constant_name',
			7 => 'room_maintenance_details', 
			8 => 'bth.sub_constant_name',
			9 => 'bathroom_maintenance_details',
			10 => 'gov.sub_constant_name');
		
		$myquery = "SELECT e.elder_id, CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) as name,
					    e.phone, mobile_first, e.mobile_second,
					    er.room_need_maintenance, rm.sub_constant_name as rm_need_maintenance,
					    er.room_maintenance_details,
					    er.bathroom_status_id, bth.sub_constant_name as bathroom_status,
					    er.bathroom_maintenance_details,
                        e.governorate_id, gov.sub_constant_name as governorate,
						f.file_id, f.file_status_id
				FROM    elder_tb e, file_tb f,  survey_tb s, elder_room_tb er, sub_constant_tb rm,
						sub_constant_tb bth, sub_constant_tb gov
                WHERE 	e.elder_id = f.elder_id
				  AND	s.file_id = f.file_id
				  AND	s.survey_id = er.survey_id
				  AND	er.room_need_maintenance = rm.sub_constant_id
				  AND	er.bathroom_status_id = bth.sub_constant_id
				  AND	e.governorate_id = gov.sub_constant_id
				  AND 	f.file_status_id = 170";
		
		if(isset($requestData['txtFileid']) && $requestData['txtFileid'] !='')
		{
			$myquery = $myquery." AND f.file_id = ".$requestData['txtFileid'];
		}
		if(isset($requestData['txtElderName']) && $requestData['txtElderName'] !='')
		{
			$myquery = $myquery." AND CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) 
			LIKE '%".$requestData['txtElderName']."%' ";
		}
		if(isset($requestData['txtPhone']) && $requestData['txtPhone'] !='')
		{
			$myquery = $myquery." AND phone = ".$requestData['txtPhone'];
		}
		if(isset($requestData['txtMobile1']) && $requestData['txtMobile1'] !='')
		{
			$myquery = $myquery." AND mobile_first = ".$requestData['txtMobile1'];
		}
		if(isset($requestData['txtMobile2']) && $requestData['txtMobile2'] !='')
		{
			$myquery = $myquery." AND e.mobile_second = ".$requestData['txtMobile2'];
		}
		if(isset($requestData['drpRoommaintenance']) && $requestData['drpRoommaintenance'] !='')
		{
			$myquery = $myquery." AND er.room_need_maintenance = ".$requestData['drpRoommaintenance'];
		}
		if(isset($requestData['txtRoommaintenancedet']) && $requestData['txtRoommaintenancedet'] !='')
		{
			$myquery = $myquery." AND er.room_maintenance_details LIKE '%".$requestData['txtRoommaintenancedet']."%' ";
		}
		if(isset($requestData['drpBathroomstatus']) && $requestData['drpBathroomstatus'] !='')
		{
			$myquery = $myquery." AND er.bathroom_status_id = ".$requestData['drpBathroomstatus'];
		}
		if(isset($requestData['txtBathroommaintenancedet']) && $requestData['txtBathroommaintenancedet'] !='')
		{
			$myquery = $myquery." AND er.bathroom_maintenance_details LIKE '%".$requestData['txtBathroommaintenancedet']."%' ";
		}
		if(isset($requestData['drpGovernorate']) && $requestData['drpGovernorate'] !='')
		{
			$myquery = $myquery." AND e.governorate_id = ".$requestData['drpGovernorate'];
		}
		
		
		$myquery = $myquery." ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir'];
		
		if ($requestData['length'] > 0)
			$myquery = $myquery." LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		
		$res = $this->db->query($myquery);
		return $res->result();
	}
	
	//  Life Improvement Report
	function get_life_improvement_rpt($requestData)
	{
		$columns = array( 
			1 => 'file_id',
			2 => 'name', 
			3 => 'phone', 
			4 => 'mobile_first',
			5 => 'mobile_second',
			6 => 'wrk.sub_constant_name',
			7 => 'elder_work_type',
			8 => 'fm.sub_constant_name',
			9 => 'tr.sub_constant_name',
			10 => 'elder_training_type', 
			11 => 'prj.sub_constant_name',
			12 => 'project_type',
			13 => 'project_budget');
		
		$myquery = "SELECT e.elder_id, CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) as name,
					    e.phone, mobile_first, e.mobile_second,
					    lf.elder_work_ability_id, wrk.sub_constant_name as elder_work_ability,
					    lf.elder_work_type,
					    lf.family_member_id, fm.sub_constant_name as family_member,
					    lf.is_elder_need_training, tr.sub_constant_name as elder_need_training,
                        lf.elder_training_type,
                        lf.can_start_project, prj.sub_constant_name as can_start_proj,
                        lf.project_type, lf.project_budget,
                        f.file_id, f.file_status_id
				FROM    elder_tb e, file_tb f,  survey_tb s, life_improvement_tb lf
							LEFT OUTER JOIN sub_constant_tb wrk ON lf.elder_work_ability_id = wrk.sub_constant_id
                            LEFT OUTER JOIN sub_constant_tb fm  ON lf.family_member_id = fm.sub_constant_id
                            LEFT OUTER JOIN sub_constant_tb tr  ON lf.is_elder_need_training = tr.sub_constant_id
                            LEFT OUTER JOIN sub_constant_tb prj ON lf.can_start_project = prj.sub_constant_id
                WHERE 	e.elder_id = f.elder_id
				  AND	s.file_id = f.file_id
				  AND	s.survey_id = lf.survey_id
				  AND 	f.file_status_id = 170";
		
		if(isset($requestData['txtFileid']) && $requestData['txtFileid'] !='')
		{
			$myquery = $myquery." AND f.file_id = ".$requestData['txtFileid'];
		}
		if(isset($requestData['txtElderName']) && $requestData['txtElderName'] !='')
		{
			$myquery = $myquery." AND CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) 
			LIKE '%".$requestData['txtElderName']."%' ";
		}
		if(isset($requestData['txtPhone']) && $requestData['txtPhone'] !='')
		{
			$myquery = $myquery." AND phone = ".$requestData['txtPhone'];
		}
		if(isset($requestData['txtMobile1']) && $requestData['txtMobile1'] !='')
		{
			$myquery = $myquery." AND mobile_first = ".$requestData['txtMobile1'];
		}
		if(isset($requestData['txtMobile2']) && $requestData['txtMobile2'] !='')
		{
			$myquery = $myquery." AND e.mobile_second = ".$requestData['txtMobile2'];
		}
		if(isset($requestData['drpWorkability']) && $requestData['drpWorkability'] !='')
		{
			$myquery = $myquery." AND lf.elder_work_ability_id = ".$requestData['drpWorkability'];
		}
		if(isset($requestData['txtWorktype']) && $requestData['txtWorktype'] !='')
		{
			$myquery = $myquery." AND lf.elder_work_type LIKE '%".$requestData['txtWorktype']."%'";
		}
		if(isset($requestData['drpFamilymember']) && $requestData['drpFamilymember'] !='')
		{
			$myquery = $myquery." AND lf.family_member_id = ".$requestData['drpFamilymember'];
		}
		if(isset($requestData['drpNeedtraining']) && $requestData['drpNeedtraining'] !='')
		{
			$myquery = $myquery." AND lf.is_elder_need_training = ".$requestData['drpNeedtraining'];
		}
		if(isset($requestData['drpGovernorate']) && $requestData['drpGovernorate'] !='')
		{
			$myquery = $myquery." AND lf.elder_training_type LIKE '%".$requestData['txtProjecttype']."%'";
		}
		if(isset($requestData['drpStartproject']) && $requestData['drpStartproject'] !='')
		{
			$myquery = $myquery." AND lf.can_start_project = ".$requestData['drpStartproject'];
		}
		if(isset($requestData['txtProjecttype']) && $requestData['txtProjecttype'] !='')
		{
			$myquery = $myquery." AND lf.project_type LIKE '%".$requestData['txtProjecttype']."%'";
		}
		if(isset($requestData['txtProjebudget']) && $requestData['txtProjebudget'] !='')
		{
			$myquery = $myquery." AND lf.project_budget = ".$requestData['txtProjebudget'];
		}
		
		
		$myquery = $myquery." ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir'];
		
		if ($requestData['length'] > 0)
			$myquery = $myquery." LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		
		$res = $this->db->query($myquery);
		return $res->result();
	}
	
	// Aid Recomendation Report
	function get_aid_recomendation_rpt($requestData)
	{
		$columns = array( 
			1 => 'file_id',
			2 => 'name', 
			3 => 'phone', 
			4 => 'mobile_first',
			5 => 'mobile_second',
			6 => 'cash_aid_type_id',
			7 => 'cash_aid_amount',
			8 => 'medical_aid',
			9 => 'home_improvment',
			10 => 'home_rent',
			11 => 'other_home_aids',
			12 => 'nutrition_type_id',
			13 => 'nutrition_details',
			14 => 'psychological_support',
			15 => 'social_support',
			16 => 'entertainment');
		
		$home_aid_search = '0';	
		$home_aid_where = "";
		
		$select = "SELECT DISTINCT(s.survey_id), e.elder_id, CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) as name,
							e.phone, mobile_first, e.mobile_second,
							ad.cash_aid_type_id, csh.sub_constant_name as cash_aid_type,
							ad.cash_aid_amount, ad.psychological_support, ad.social_support, ad.entertainment,
							ad.nutrition_type_id, ntr.sub_constant_name as nutrition_type,
							ad.nutrition_details,
							(SELECT improvement_details 
							 	   FROM home_improvement_recomendation_tb 
							 	  WHERE survey_id = s.survey_id
								    AND improvement_type_id = 168) as home_rent,
							(SELECT improvement_details 
							 	   FROM home_improvement_recomendation_tb 
							 	  WHERE survey_id = s.survey_id
								    AND improvement_type_id = 169) as other_home_aids,
							(SELECT GROUP_CONCAT(imptp.sub_constant_name SEPARATOR ' - ')
								   FROM home_improvement_recomendation_tb hmimp, sub_constant_tb imptp
								  WHERE hmimp.improvement_type_id = imptp.sub_constant_id
									AND hmimp.survey_id = s.survey_id)  as home_improvment,
							(SELECT GROUP_CONCAT(medtp.sub_constant_name SEPARATOR ' - ')
								   FROM medical_aid_recomendation_tb medc, sub_constant_tb medtp
								  WHERE medc.medical_aid_type_id = medtp.sub_constant_id
									AND medc.survey_id = s.survey_id)  as medical_aid,
							f.file_id, f.file_status_id ";
							
		$from = "FROM    elder_tb e, file_tb f,  survey_tb s 
								LEFT OUTER JOIN aids_recomendation_tb ad ON  s.survey_id = ad.survey_id 
								LEFT OUTER JOIN sub_constant_tb csh ON ad.cash_aid_type_id = csh.sub_constant_id
								LEFT OUTER JOIN sub_constant_tb ntr ON ad.nutrition_type_id = ntr.sub_constant_id ";
								
		$where = "WHERE 	e.elder_id = f.elder_id
					  AND	s.file_id = f.file_id
					  AND	s.survey_id IN (
								SELECT survey_id FROM aids_recomendation_tb 
								UNION SELECT survey_id FROM home_improvement_recomendation_tb
								UNION SELECT survey_id FROM medical_aid_recomendation_tb)
					  AND 	f.file_status_id = 170";
		
		if(isset($requestData['txtFileid']) && $requestData['txtFileid'] !='')
		{
			$where = $where." AND f.file_id = ".$requestData['txtFileid'];
		}
		if(isset($requestData['txtElderName']) && $requestData['txtElderName'] !='')
		{
			$where = $where." AND CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) 
			LIKE '%".$requestData['txtElderName']."%' ";
		}
		if(isset($requestData['txtPhone']) && $requestData['txtPhone'] !='')
		{
			$where = $where." AND phone = ".$requestData['txtPhone'];
		}
		if(isset($requestData['txtMobile1']) && $requestData['txtMobile1'] !='')
		{
			$where = $where." AND mobile_first = ".$requestData['txtMobile1'];
		}
		if(isset($requestData['txtMobile2']) && $requestData['txtMobile2'] !='')
		{
			$where = $where." AND e.mobile_second = ".$requestData['txtMobile2'];
		}
		if(isset($requestData['drpCashType']) && $requestData['drpCashType'] !='')
		{
			$where = $where." AND ad.cash_aid_type_id = ".$requestData['drpCashType'];
		}
		if(isset($requestData['txtCash']) && $requestData['txtCash'] !='')
		{
			$where = $where." AND ad.cash_aid_amount = ".$requestData['txtCash'];
		}
		if(isset($requestData['txtPsychosupport']) && $requestData['txtPsychosupport'] !='')
		{
			$where = $where." AND ad.psychological_support LIKE '%".$requestData['txtPsychosupport']."%'";
		}
		if(isset($requestData['txtSocialsupport']) && $requestData['txtSocialsupport'] !='')
		{
			$where = $where." AND ad.social_support LIKE '%".$requestData['txtSocialsupport']."%'";
		}
		if(isset($requestData['txtEntertainment']) && $requestData['txtEntertainment'] !='')
		{
			$where = $where." AND ad.entertainment LIKE '%".$requestData['txtEntertainment']."%'";
		}
		if(isset($requestData['drpNutritiontype']) && $requestData['drpNutritiontype'] !='')
		{
			$where = $where." AND ad.nutrition_type_id = ".$requestData['drpNutritiontype'];
		}
		if(isset($requestData['txtNutritiondet']) && $requestData['txtNutritiondet'] !='')
		{
			$where = $where." AND ad.nutrition_details LIKE '%".$requestData['txtNutritiondet']."%'";
		}
		if(isset($requestData['drpHomeimprovment']) && $requestData['drpHomeimprovment'] !='')
		{
			$home_aid_search = " 1";
			
			$from = $from . ", home_improvement_recomendation_tb ohmimp";
			$where = $where." AND ohmimp.survey_id = s.survey_id";
			$home_aid_where = " AND ohmimp.improvement_type_id = ".$requestData['drpHomeimprovment'];
		}
		if(isset($requestData['txtRent']) && $requestData['txtRent'] !='')
		{
			$home_aid_search = "01";
			$from  = $from . ", home_improvement_recomendation_tb ohmrnt";
			$where = $where. "  AND ohmrnt.survey_id = s.survey_id";
			$home_aid_where = " AND ohmrnt.improvement_type_id = 168
						  	    AND ohmrnt.improvement_details = ".$requestData['txtRent'];
			
		}
		if(isset($requestData['txtOtheraids']) && $requestData['txtOtheraids'] !='')
		{
			$from = $from . ", home_improvement_recomendation_tb ohmoth";
			$where = $where." AND ohmoth.survey_id = s.survey_id";
			$where = $where." AND ohmoth.improvement_type_id = 169
							  AND ohmoth.improvement_details LIKE '%".$requestData['txtOtheraids']."%'";
		}
		if(isset($requestData['drpMedicalaid']) && $requestData['drpMedicalaid'] !='')
		{
			$from = $from . ", medical_aid_recomendation_tb omedc";
			$where = $where." AND omedc.survey_id = s.survey_id";
			$where = $where." AND omedc.medical_aid_type_id = ".$requestData['drpMedicalaid'];
			
		}
		
		$myquery = "$select
 					$from
					$where $home_aid_where";
		
		
		$myquery = $myquery." ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir'];
		
		if ($requestData['length'] > 0)
			$myquery = $myquery." LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		
		$res = $this->db->query($myquery);
		return $res->result();
	}
}
?>