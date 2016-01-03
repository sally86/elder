<?php

class Surveyviewmodel extends CI_Model
{

//***************** survey search function*****************************//

	function get_search_survey($requestData)
	{
		date_default_timezone_set('Asia/Gaza');   
		$today_date = date('Y-m-d');
		$columns = array( 
			1 => 'Researcher_name',
			2 => 'Elder_name',
			3 => 'visit_date'
						);
		
		$myquery = "SELECT survey_tb.survey_id,elder_tb.elder_id,survey_tb.file_id,visit_date,survey_tb.researcher_id,
						   CONCAT(elder_tb.first_name,' ',elder_tb.middle_name,' ',elder_tb.third_name,' ',elder_tb.last_name) 
						   as Elder_name, employee_tb.name as Researcher_name 
					  FROM survey_tb,employee_tb,elder_tb,file_tb
					 WHERE survey_tb.researcher_id=employee_tb.national_id
					   AND survey_tb.file_id=file_tb.file_id
					   AND file_tb.elder_id=elder_tb.elder_id";
		
		
		if(isset($requestData['txtResearchername']) && $requestData['txtResearchername'] !='')
		{
			$myquery = $myquery." AND employee_tb.name LIKE '%".$requestData['txtResearchername']."%' ";
		}
		
		if(isset($requestData['txtElderName']) && $requestData['txtElderName'] !='')
		{
			$myquery = $myquery." AND CONCAT(elder_tb.first_name,' ',elder_tb.middle_name,' ',elder_tb.third_name,' ',elder_tb.last_name) LIKE '%".$requestData['txtElderName']."%' ";
		}
		if(!isset($requestData['dpAppfrom']) && !isset($requestData['dpAppto']))
		{
			$myquery = $myquery." AND DATE_FORMAT(visit_date,'%Y-%m-%d')>= '$today_date'";
		}
		if(isset($requestData['dpAppfrom']) && $requestData['dpAppfrom'] != ''
		   && isset($requestData['dpAppto']) && $requestData['dpAppto'] != '')
		{
			$myquery = $myquery." AND visit_date between '".$requestData['dpAppfrom']."' and '".$requestData['dpAppto']."'";
		}
		if(isset($requestData['dpAppfrom']) && $requestData['dpAppfrom'] != ''
		   && (isset($requestData['dpAppto']) && $requestData['dpAppto'] == ''))
		{
			$myquery = $myquery." AND visit_date >= '".$requestData['dpAppfrom']."'";
		}

		
		
		
		$myquery = $myquery." ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir'].
					" LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		
		$res = $this->db->query($myquery);
		return $res->result();
		
	}
	function count_get_search_survey()
	{
		return $this->db->count_all('survey_tb');
	}

//******************end survey search function************************//
//*****************get survey info to update************************//
function get_elder_info($elderId)
	{	extract($_POST);
		$this->db->where('elder_id',$elderId);
		$query = $this->db->get('elder_tb');
		return $query->result();
		
	}
function get_survey_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('survey_tb');
		return $query->result();
		
	}
function get_homeStatus_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('home_status_tb');
		return $query->result();
		
	}
function get_elderRoom_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('elder_room_tb');
		return $query->result();
		
	}
function get_lifeImprovement_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('life_improvement_tb');
		return $query->result();
		
	}
function get_aidsRecomendation_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('aids_recomendation_tb');
		return $query->result();
		
	}
function get_elderBehaviour_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('elder_behaviour_tb');
		return $query->result();
		
	}
function get_elderDiseaseDet_info($elderDiseaseId)
	{	extract($_POST);
		$this->db->where('elder_disease_id',$elderDiseaseId);
		$query = $this->db->get('elder_disease_det_tb ');
		return $query->result();
		
	}
function get_elderDisease_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('elder_disease_tb ');
		return $query->result();
		
	}
/*function get_elderDoc_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('elder_doc_tb');
		return $query->result();
		;
	}*/
function get_elderInteresting_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('elder_interesting_tb');
		return $query->result();
		
	}
function get_elderPariah_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('elder_pariah_tb');
		return $query->result();
		
	}
function get_familyCooperation_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('family_cooperation_tb');
		return $query->result();
		
	}
function get_familyRelationship_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('family_elder_relationship_tb');
		return $query->result();
		
	}
function get_familyMember_info($elder_id)

	{
		
		
		$myquery = "SELECT fm.family_member_id, fm.survey_id, fm.elder_id, fm.member_id, fm.member_name, fm.dob, fm.income_shekel, 		
						fm.job, fm.member_sex_id, sex.sub_constant_name sex,
        				fm.relationship_id, rel.sub_constant_name relationship,
        				fm.status_id, stat.sub_constant_name fmstatus,
        				fm.education_level_id, edu.sub_constant_name education_level,
        				fm.health_status_id, hlt.sub_constant_name health_status
					 FROM family_member_tb fm
					  LEFT OUTER JOIN sub_constant_tb sex  ON fm.member_sex_id      = sex.sub_constant_id
					  LEFT OUTER JOIN sub_constant_tb rel  ON fm.relationship_id    = rel.sub_constant_id
					  LEFT OUTER JOIN sub_constant_tb stat ON fm.status_id          = stat.sub_constant_id
					  LEFT OUTER JOIN sub_constant_tb edu  ON fm.education_level_id = edu.sub_constant_id
					  LEFT OUTER JOIN sub_constant_tb hlt  ON fm.health_status_id 	= hlt.sub_constant_id
				  WHERE fm.elder_id = ".$elder_id;
		
		$res = $this->db->query($myquery);
		return $res->result();
	}

function get_followUp_info($elderId)
	{	extract($_POST);
		$this->db->where('elder_id',$elderId);
		$query = $this->db->get('follow_up_tb');
		return $query->result();
		
	}

function get_familyPsyStatus_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('family_psychological_status_tb');
		return $query->result();
		
	}
function get_homeImprovRecomend_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('home_improvement_recomendation_tb');
		return $query->result();
		
	}
function get_incomeResources_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('income_resources_tb');
		return $query->result();
		
	}

function get_incomeResourcesDetails_info($incomeResourcesId)
	{	extract($_POST);
		$this->db->where('income_resources_id',$incomeResourcesId);
		$query = $this->db->get('income_resources_details_tb');
		return $query->result();
		
	}
function get_medicalAidRecomend_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('medical_aid_recomendation_tb');
		return $query->result();
		
	}

function get_medicationAvailability_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('medication_availability_tb');
		return $query->result();
		
	}
function get_medicationNeed_info($SurveyId)
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('medication_need_tb');
		return $query->result();
		
	}
	
//*****************end get survey data to update********************//

}
?>