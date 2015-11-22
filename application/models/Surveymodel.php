<?php

class Surveymodel extends CI_Model
{
	// Get All Employee

//*******************elder_tb***********************
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
function update_elder()
	{
		extract($_POST);


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
		$this->db->where('elder_id',$txtElderId);
		$this->db->update('elder_tb',$data);
	}
/*
function check_elder_id()
	{
		extract($_POST);
		$elder_id=$elder_id;
		$myquery = "SELECT 	count(1) as cn
				  	FROM 	elder_tb
				  	WHERE 	elder_id=$elder_id";
		 return $this->db->query($myquery);
	}
	*/
function check_elder_id()
	{	extract($_POST);
		$this->db->where('elder_id',$elder_id);
		$query = $this->db->get('elder_tb');
		return $query->result();
		
	}
//***********************end eder_tb operation***************

//***********************end family_member_tb operations*********************

function insert_familyMember()
	{
		extract($_POST);
	//	$data['family_member_id'] = $txtMemberId;
		$data['elder_id'] = $hdnelder_id;
		$data['member_id'] = $txtMemberId;
		$data['member_name'] = $txtMembername;
		$data['member_sex_id'] = $rdMemSex;
		$data['relationship_id'] = $drpMemRelationship;
		$data['status_id'] = $drpMemStatus;
		$data['dob'] = $dpMemDob;
		$data['education_level'] = $drpMemEdulevel;
		$data['health_status_id'] = $drpMemHealth;
		$data['income_shekel'] = $txtMemincome;
		$data['job'] = $txtMemjob;
		
		
		$this->db->insert('family_member_tb',$data);
	}
function update_familyMember()
	{
		extract($_POST);
		//$data['family_member_id'] = $txtFname;
		//$data['elder_id'] = $txtElderId;
		//$data['member_id'] = $txtMemberId;
		$data['member_name'] = $txtMembername;
		$data['member_sex_id'] = $rdMemSex;
		$data['relationship_id'] = $drpMemRelationship;
		$data['status_id'] = $drpMemStatus;
		$data['dob'] = $dpMemDob;
		$data['education_level'] = $drpMemEdulevel;
		$data['health_status_id'] = $drpMemHealth;
		$data['income_shekel'] = $txtMemincome;
		$data['job'] = $txtMemjob;
		
		$this->db->where('member_id',$txtMemberId);
		$this->db->update('family_member_tb',$data);
	}
function check_familyMember_id()
	{	extract($_POST);
		$this->db->where('member_id',$member_id);
		$query = $this->db->get('family_member_tb');
		return $query->result();
		
	}

//***********************end family_member_tb operations*********************

}
?>