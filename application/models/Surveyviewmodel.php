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
		
$myquery = "SELECT 		survey_tb.survey_id,survey_tb.file_id,visit_date,survey_tb.researcher_id,
						CONCAT(elder_tb.first_name,' ',elder_tb.middle_name,' ',elder_tb.third_name,' ',elder_tb.last_name) as Elder_name,employee_tb.name as Researcher_name 
			FROM 		survey_tb,employee_tb,elder_tb,file_tb
			WHERE 		survey_tb.researcher_id=employee_tb.national_id
			AND 		survey_tb.file_id=file_tb.file_id
			AND 		file_tb.elder_id=elder_tb.elder_id";
		
		
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
	function count_get_search_survey($requestData)
	{
		
				date_default_timezone_set('Asia/Gaza');   
		$today_date = date('Y-m-d');

$myquery = "SELECT 		survey_tb.survey_id,survey_tb.file_id,visit_date,survey_tb.researcher_id,
						CONCAT(elder_tb.first_name,' ',elder_tb.middle_name,' ',elder_tb.third_name,' ',elder_tb.last_name) as Elder_name,employee_tb.name as Researcher_name 
			FROM 		survey_tb,employee_tb,elder_tb,file_tb
			WHERE 		survey_tb.researcher_id=employee_tb.national_id
			AND 		survey_tb.file_id=file_tb.file_id
			AND 		file_tb.elder_id=elder_tb.elder_id";
		
		
		if(isset($requestData['txtResearchername']) && $requestData['txtResearchername'] !='')
		{
			$myquery = $myquery." AND employee_tb.name LIKE '%".$requestData['txtResearchername']."%' ";
		}
		
		if(isset($requestData['txtElderName']) && $requestData['txtElderName'] !='')
		{
			$myquery = $myquery." AND CONCAT(elder_tb.first_name,' ',elder_tb.middle_name,' ',elder_tb.third_name,' ',elder_tb.last_name)  LIKE '%".$requestData['txtElderName']."%' ";
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

		
		
		$res = $this->db->query($myquery);
		return count($res->result());
		
	}

//******************end survey search function************************//
//*****************get survey info to update************************//
function get_survey_info()
	{	extract($_POST);
		$this->db->where('file_id',$file_id);
		$query = $this->db->get('survey_tb');
		return $query->result();
		
	}
function get_homeStatus_info()
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('home_status_tb');
		return $query->result();
		
	}
function get_elderRoom_info()
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('elder_room_tb');
		return $query->result();
		
	}
function get_elderFamilyRelation_info()
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('family_elder_relationship_tb');
		return $query->result();
		
	}
function get_lifeImprovement_info()
	{	extract($_POST);
		$this->db->where('survey_id',$SurveyId);
		$query = $this->db->get('life_improvement_tb');
		return $query->result();
		
	}

//*****************end get survey data to update********************//

}
?>