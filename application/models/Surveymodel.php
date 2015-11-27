<?php

class Surveymodel extends CI_Model
{
	

/*************************** ELDER TAB ********************************/
/*	Insert Elder									  				  */
/*	Update Elder									  				  */
/**********************************************************************/
	// Insert Elder
	function insert_elder()
	{
		extract($_POST);

		$data['elder_id'] 	  		= $txtElderId;
		$data['elder_category_id'] 	= $drpEldercategory;
		$data['first_name'] 		= $txtFname;
		$data['middle_name'] 		= $txtMname;
		$data['third_name'] 		= $txtThname;
		$data['last_name'] 			= $txtLname;
		$data['dob'] 				= $dpDob;
		$data['sex_id'] 			= $rdSex;
		$data['status_id'] 			= $drpElderstatus;
		$data['governorate_id'] 	= $drpGovernorate;
		$data['region'] 			= $txtRegion;
		$data['full_address'] 		= $txtFulladdress;
		$data['phone'] 				= $txtPhone;
		$data['mobile_first'] 		= $txtMobile1;
		$data['mobile_second'] 		= $txtMobile2;
		$data['education_level_id'] = $drpEducationlevel;
		$data['specialization_id'] 	= $drpSpecialization;
		$data['current_job_id'] 	= $drpCurrentjob;
		$data['previous_job_id'] 	= $drpPreviousjob;
		$data['insurance_type_id'] 	= $drpInsurence;
		
		
		$this->db->insert('elder_tb',$data);
		
		// Insert file_tb
		$filedata['elder_id'] = $txtElderId;
		$filedata['file_status_id'] = 170;
		//$filedata['created_by'] = $_SESSION['username'];
		
		$this->db->insert('file_tb',$filedata);
		$file_id = $this->db->insert_id();
		
		
		// Insert survey_tb
		$surveydata['file_id'] = $file_id;
		//$surveydata['created_by'] = $_SESSION['username'];
		
		$this->db->insert('survey_tb',$surveydata);
		$survey_id = $this->db->insert_id();
		
		
		
		// Insert survey_elder_info_tb
		$data['survey_id'] = $survey_id;
		$this->db->insert('survey_elder_info_tb',$data);
		
		
		
		$outdata['file_id']   = $file_id;
		$outdata['survey_id'] = $survey_id;
		return $outdata;
		
	}
	
	// Update Elder
	function update_elder()
	{
		extract($_POST);

		$data['elder_category_id'] 	= $drpEldercategory;
		$data['first_name'] 		= $txtFname;
		$data['middle_name'] 		= $txtMname;
		$data['third_name'] 		= $txtThname;
		$data['last_name'] 			= $txtLname;
		$data['dob'] 				= $dpDob;
		$data['sex_id'] 			= $rdSex;
		$data['status_id'] 			= $drpElderstatus;
		$data['governorate_id'] 	= $drpGovernorate;
		$data['region'] 			= $txtRegion;
		$data['full_address'] 		= $txtFulladdress;
		$data['phone'] 				= $txtPhone;
		$data['mobile_first'] 		= $txtMobile1;
		$data['mobile_second'] 		= $txtMobile2;
		$data['education_level_id'] = $drpEducationlevel;
		$data['specialization_id'] 	= $drpSpecialization;
		$data['current_job_id'] 	= $drpCurrentjob;
		$data['previous_job_id'] 	= $drpPreviousjob;
		$data['insurance_type_id'] = $drpInsurence;
//		$data['death_date'] = $txtMobile;

		$this->db->where('elder_id',$txtElderId);
		$this->db->update('elder_tb',$data);
		
		if($hdnSurveyId != "")
		{
			$this->db->where('survey_id',$hdnSurveyId);
			$this->db->update('survey_elder_info_tb',$data);
			
			$file_id = $hdnFileId;
			$survey_id = $hdnSurveyId; 
		}
		elseif($hdnSurveyId == "")
		{
			// Insert survey_tb
			$surveydata['file_id'] = $hdnFileId;
			//$surveydata['created_by'] = $_SESSION['username'];
			$this->db->insert('survey_tb',$surveydata);
			
			
			// Insert survey_elder_info_tb
			$survey_id = $this->db->insert_id();
			$data['survey_id'] = $this->db->insert_id();
			$this->db->insert('survey_elder_info_tb',$data);
			
			$file_id = $hdnFileId;
		}
		
		$outdata['file_id']   = $file_id;
		$outdata['survey_id'] = $survey_id;
		return $outdata;
	}

//-------------------------- END ELDER TAB ----------------------------/


/*************************** Visit TAB ********************************/
/*	 												  				  */
/*	Update Survey									  				  */
/*													  				  */
/**********************************************************************/
	// Update Survey
	function update_survey()
	{
		extract($_POST);

		$data['visit_date'] = $dpVisitdate;
		$data['visit_time'] = $txtVisittime;
		$data['visit_end_time'] = $txtVisitendtime;
		$data['researcher_id']  = $drpResearcher;
		if($drpResearcherass1 =="")
			$data['researcher_assistant_fst_id'] = NULL;
		else
			$data['researcher_assistant_fst_id'] = $drpResearcherass1;
		if($drpResearcherass2 =="")
			$data['researcher_assistant_sec_id'] = NULL;
		else
			$data['researcher_assistant_sec_id'] = $drpResearcherass2;
		
		$this->db->where('survey_id',$hdnSurveyId);
		$this->db->update('survey_tb',$data);
	}
//-------------------------- END VISIT TAB ----------------------------/


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
function insert_survey()
	{
		extract($_POST);

		$data['file_id'] = $txtFileid;
		$data['visit_date'] = $dpVisitdate;
		$data['visit_time'] = $txtVisittime;
		$data['visit_end_time'] = $txtVisitendtime;
		$data['researcher_id'] = $drpResearcher;
		$data['researcher_assistant_fst_id'] = $drpResearcherass1;
		$data['researcher_assistant_sec_id'] = $drpResearcherass2;
			
		$this->db->insert('survey_tb',$data);
		$Surveyid=$this->db->insert_id();
		return $Surveyid;
	}



function get_survey_info()
	{	extract($_POST);
		$this->db->where('file_id',$file_id);
		$query = $this->db->get('survey_tb');
		return $query->result();
		
	}

//***********************end family_member_tb operations*********************
//**********************Home_status operation********************************
function insert_homeStatus()
	{
		extract($_POST);

		$data['survey_id'] = $SurveyId;
		$data['home_situation_id'] = $drpHomeStatus;
		$data['home_type_id'] = $drpHomeType;
		$data['ceiling_type_id'] = $drpCeilingType;
		$data['furniture_level_id'] = $drpFurnitureLevel;
		
			
		$this->db->insert('home_status_tb ',$data);
		
	}
function update_homeStatus()
	{
		extract($_POST);

		//$data['survey_id'] = $SurveyId;
		$data['home_situation_id'] = $drpHomeStatus;
		$data['home_type_id'] = $drpHomeType;
		$data['ceiling_type_id'] = $drpCeilingType;
		$data['furniture_level_id'] = $drpFurnitureLevel;
		
			
		$this->db->where('survey_id',$SurveyId);
		$this->db->update('home_status_tb ',$data);
		
	}
function get_homeStatus_info()
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('home_status_tb');
		return $query->result();
		
	}

//*********************end home_status operation*****************************

//**********************Home_status operation********************************
function insert_elderRoom()
	{
		extract($_POST);

		$data['survey_id'] = $SurveyId;
		$data['room_type_id'] = $drpRoomtype;
		$data['clothes_covers_status_id'] = $drpClothes;
		$data['room_ventilation_id'] = $drpVentilation;
		$data['room_lighting_id'] = $drpLighting;
		$data['has_closet'] = $drpCloset;
		$data['has_good_bed'] = $drpBed;
		$data['has_medicine_cupboard'] = $drpCupboard;
		$data['room_need_maintenance'] = $drpMaintenance;
		$data['room_need_restoration'] = $drpRestoration;
		$data['bathroom_status_id'] = $drpBathroom;
		$data['elder_higiene_id'] = $drpHigiene;
		
			
		$this->db->insert('elder_room_tb ',$data);
		
	}
function update_elderRoom()
	{
		extract($_POST);

		//$data['survey_id'] = $SurveyId;
		$data['room_type_id'] = $drpRoomtype;
		$data['clothes_covers_status_id'] = $drpClothes;
		$data['room_ventilation_id'] = $drpVentilation;
		$data['room_lighting_id'] = $drpLighting;
		$data['has_closet'] = $drpCloset;
		$data['has_good_bed'] = $drpBed;
		$data['has_medicine_cupboard'] = $drpCupboard;
		$data['room_need_maintenance'] = $drpMaintenance;
		$data['room_need_restoration'] = $drpRestoration;
		$data['bathroom_status_id'] = $drpBathroom;
		$data['elder_higiene_id'] = $drpHigiene;
			
		$this->db->where('survey_id',$SurveyId);
		$this->db->update('elder_room_tb ',$data);
		
	}
//*************** elder family relation*****************//
function insert_elderFamilyRelation()
	{
		extract($_POST);

		$data['survey_id'] = $SurveyId;
		$data['respect'] = $drpRespect;
		$data['pariah'] = $drpPariah;
		$data['care'] = $drpCare;
		$data['provision_needs'] = $drpNeeds;
		$data['psychological_support'] = $drpPsycosupport;
			
		$this->db->insert('family_elder_relationship_tb',$data);
		
	}
function update_elderFamilyRelation()
	{
		extract($_POST);

		//$data['survey_id'] = $SurveyId;
		$data['respect'] = $drpRespect;
		$data['pariah'] = $drpPariah;
		$data['care'] = $drpCare;
		$data['provision_needs'] = $drpNeeds;
		$data['psychological_support'] = $drpPsycosupport;
			
		$this->db->where('survey_id',$SurveyId);
		$this->db->update('family_elder_relationship_tb ',$data);
		
	}
//********************end elder family relation function**************//

//**********************elder life improvement function********************************//
function insert_lifeImprovement()
	{
		extract($_POST);

		$data['survey_id'] = $SurveyId;
		$data['elder_work_ability_id'] = $drpElderWorkAbility;
		$data['elder_work_type'] = $txtelderworktype;
		$data['family_member_id'] = $drpFamilyMember;
		
		$data['is_elder_need_training'] = $drpNeedtraining;
		$data['elder_training_type'] = $txtTrainigType;
		$data['can_start_project'] = $drpStartproject;
		$data['project_type'] = $txtProjectType;
		$data['project_budget'] = $txtProjectBudget;
			
		$this->db->insert('life_improvement_tb',$data);
		
	}
function update_lifeImprovement()
	{
		extract($_POST);

		//$data['survey_id'] = $SurveyId;
		$data['elder_work_ability_id'] = $drpElderWorkAbility;
		$data['elder_work_type'] = $txtelderworktype;
		$data['family_member_id'] = $drpFamilyMember;
		
		$data['is_elder_need_training'] = $drpNeedtraining;
		$data['elder_training_type'] = $txtTrainigType;
		$data['can_start_project'] = $drpStartproject;
		$data['project_type'] = $txtProjectType;
		$data['project_budget'] = $txtProjectBudget;
			
		$this->db->where('survey_id',$SurveyId);
		$this->db->update('life_improvement_tb ',$data);
		
	}
//********************end elder life improvement function**************//
}
?>