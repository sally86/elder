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
	
	
}
?>