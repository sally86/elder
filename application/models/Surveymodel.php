<?php

class Surveymodel extends CI_Model
{
	// Get All Employee
		
	function get_search_elder($requestData)
	{
		$columns = array( 
			1 => 'elder_id',
			2 => 'name',
			3 => 'phone', 
			4 => 'mobile_first',
			5 => 'mobile_second',
			6 => 'Eder_governorate',
			7 => 'isDeadElder');
		
		$myquery = "SELECT 	elder_id,CONCAT(first_name,' ',middle_name,' ',third_name,' ',last_name) as name,
							phone,mobile_first, mobile_second,
							CASE WHEN death_date IS null then 1 ELSE  0 END AS  isDeadElder,
							governconst.sub_constant_name as Eder_governorate 
 					FROM 	elder_tb ,sub_constant_tb governconst
					WHERE 	elder_tb.governorate_id=governconst.sub_constant_id";
		
		if(isset($requestData['txtElderid']) && $requestData['txtElderid'] !='')
		{
			$myquery = $myquery." AND elder_id = ".$requestData['txtElderid'];
		}
		
		if(isset($requestData['txtName']) && $requestData['txtName'] !='')
		{
			$myquery = $myquery." AND name LIKE '%".$requestData['txtName']."%' ";
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
			$myquery = $myquery." AND governconst.sub_constant_id = ".$requestData['drpGovernorate'];
		}
		if(isset($requestData['drpisDead']) && $requestData['drpisDead'] !='')
		{ 
			if(isset($requestData['drpisDead'])==1)
				{
					$myquery = $myquery." AND death_date is null ";
				}
			else if(isset($requestData['drpisDead'])==0)
				{
					$myquery = $myquery." AND death_date is not null  ";
				}
		}
		$myquery = $myquery." ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir'].
					" LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		
		$res = $this->db->query($myquery);
		return $res->result();
		
	}
	function count_get_search_elder($requestData)
	{

		$myquery = "SELECT 	elder_id,CONCAT(first_name,' ',middle_name,' ',third_name,' ',last_name) as name,
							phone,mobile_first, mobile_second,
							CASE WHEN death_date IS null then 1 ELSE  0 END AS  isDeadElder,
							governconst.sub_constant_name as governorate 
 					FROM 	elder_tb ,sub_constant_tb governconst
					WHERE 	elder_tb.governorate_id=governconst.sub_constant_id";
		
		if(isset($requestData['txtElderid']) && $requestData['txtElderid'] !='')
		{
			$myquery = $myquery." AND elder_id = ".$requestData['txtElderid'];
		}
		
		if(isset($requestData['txtName']) && $requestData['txtName'] !='')
		{
			$myquery = $myquery." AND name LIKE '%".$requestData['txtName']."%' ";
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
			$myquery = $myquery." AND governconst.sub_constant_id = ".$requestData['drpGovernorate'];
		}
		if(isset($requestData['drpisDead']) && $requestData['drpisDead'] !='')
		{ 
		if(isset($requestData['drpisDead'])==1)
			{
				$myquery = $myquery." AND death_date is null ";
			}
		else if(isset($requestData['drpisDead'])==0)
			{
				$myquery = $myquery." AND death_date is not null  ";
			}
		}
		
		$res = $this->db->query($myquery);
		return count($res->result());
		
	}

function insert_elder()
	{
		extract($_POST);

		$data['elder_id'] = $txtElderId;
		$data['first_name'] = $txtFname;
		$data['middle_name'] = $txtMname;
		$data['third_name'] = $txtThname;
		$data['last_name'] = $txtLname;
		$data['dob'] = $dpDob;
		$data['sex_id'] = $rdSex;
		$data['status_id'] = $drpElderstatus;
		$data['governorate_id'] = $drpGovernorate;
		$data['region'] = $txtRegion;
		$data['full_address'] = $txtFulladdress;
		$data['phone'] = $txtPhone;
		$data['mobile_first'] = $txtMobile1;
		$data['mobile_second'] = $txtMobile2;
		$data['education_level_id'] = $drpEducationlevel;
		$data['specialization_id'] = $drpSpecialization;
		$data['current_job_id'] = $drpCurrentjob;
		$data['previous_job_id'] = $drpPreviousjob;
		$data['insurance_type_id'] = $drpInsurence;
//		$data['death_date'] = $txtMobile;
		
		$this->db->insert('elder_tb',$data);
	}
function check_elder_id()
	{
		extract($_POST);
		$national_id=$national_id;
		$myquery = "SELECT 	count(1) as cn
				  	FROM 	elder_tb
				  	WHERE 	elder_id=$elder_id";
		 return $this->db->query($myquery);
	}
}
?>