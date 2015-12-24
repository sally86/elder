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
	
	//  Elder Room Report
	function get_elder_room_rpt($requestData)
	{
		$columns = array( 
			1 => 'file_id',
			2 => 'name', 
			3 => 'phone', 
			4 => 'mobile_first',
			5 => 'mobile_second',
			6 => 'ht.sub_constant_name',
			7 => 'rt.sub_constant_name', 
			8 => 'cst.sub_constant_name',
			9 => 'rv.sub_constant_name',
			10 => 'rl.sub_constant_name',
			11 => 'hc.sub_constant_name',
			12 => 'hb.sub_constant_name',
			13 => 'hmc.sub_constant_name',
			14 => 'hig.sub_constant_name',
			15 => 'gov.sub_constant_name');
		
		$myquery = "SELECT e.elder_id, CONCAT(e.first_name,' ',e.middle_name,' ',e.third_name,' ',e.last_name) as name,
					    e.phone, mobile_first, e.mobile_second,
					    er.home_type_id, ht.sub_constant_name as home_type,
					    er.room_type_id, rt.sub_constant_name as room_type,
					    er.clothes_covers_status_id, cst.sub_constant_name as clothes_covers_status,
					    er.room_ventilation_id, rv.sub_constant_name as room_ventilation,
					    er.room_lighting_id, rl.sub_constant_name as room_lighting,
					    er.has_closet, hc.sub_constant_name as has_closet,
					    er.has_good_bed, hb.sub_constant_name as has_good_bed,
					    er.has_medicine_cupboard, hmc.sub_constant_name as has_medicine_cupboard,
					    er.elder_higiene_id, hig.sub_constant_name as elder_higiene,
                        e.governorate_id, gov.sub_constant_name as governorate,
						f.file_id, f.file_status_id
				FROM    elder_tb e, file_tb f,  survey_tb s, elder_room_tb er, sub_constant_tb ht, sub_constant_tb rt,
						sub_constant_tb cst, sub_constant_tb rv, sub_constant_tb rl, sub_constant_tb hc, 
                        sub_constant_tb hb, sub_constant_tb hmc, sub_constant_tb hig, sub_constant_tb gov
                WHERE 	e.elder_id = f.elder_id
				  AND	s.file_id = f.file_id
				  AND	s.survey_id = er.survey_id
				  AND	er.home_type_id = ht.sub_constant_id
				  AND	er.room_type_id = rt.sub_constant_id
				  AND	er.clothes_covers_status_id = cst.sub_constant_id
				  AND	er.room_ventilation_id = rv.sub_constant_id
                  AND	er.room_lighting_id = rl.sub_constant_id
                  AND	er.has_closet = hc.sub_constant_id
                  AND	er.has_good_bed = hb.sub_constant_id
                  AND	er.has_medicine_cupboard = hmc.sub_constant_id
                  AND	er.elder_higiene_id = hig.sub_constant_id
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
		if(isset($requestData['drpHometype']) && $requestData['drpHometype'] !='')
		{
			$myquery = $myquery." AND er.home_type_id = ".$requestData['drpHometype'];
		}
		if(isset($requestData['drpRoomtype']) && $requestData['drpRoomtype'] !='')
		{
			$myquery = $myquery." AND er.room_type_id = ".$requestData['drpRoomtype'];
		}
		if(isset($requestData['drpClothes']) && $requestData['drpClothes'] !='')
		{
			$myquery = $myquery." AND er.clothes_covers_status_id = ".$requestData['drpClothes'];
		}
		if(isset($requestData['drpVentilation']) && $requestData['drpVentilation'] !='')
		{
			$myquery = $myquery." AND er.room_ventilation_id = ".$requestData['drpVentilation'];
		}
		if(isset($requestData['drpLighting']) && $requestData['drpLighting'] !='')
		{
			$myquery = $myquery." AND er.room_lighting_id = ".$requestData['drpLighting'];
		}
		if(isset($requestData['drpCloset']) && $requestData['drpCloset'] !='')
		{
			$myquery = $myquery." AND er.has_closet = ".$requestData['drpCloset'];
		}
		if(isset($requestData['drpBed']) && $requestData['drpBed'] !='')
		{
			$myquery = $myquery." AND er.has_good_bed = ".$requestData['drpBed'];
		}
		if(isset($requestData['drpCupboard']) && $requestData['drpCupboard'] !='')
		{
			$myquery = $myquery." AND er.has_medicine_cupboard = ".$requestData['drpCupboard'];
		}
		if(isset($requestData['drpHigiene']) && $requestData['drpHigiene'] !='')
		{
			$myquery = $myquery." AND er.elder_higiene_id = ".$requestData['drpHigiene'];
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
}
?>