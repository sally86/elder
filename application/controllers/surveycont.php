<?php
class Surveycont extends CI_Controller 
{
	public $data;
	
	function view ( $page = 'home')
	{
		if( ! file_exists('application/views/pages/'.$page.'.php'))
		{
			show_404();
		}
		
		if ($page == 'login')
		{
			$data['title'] = $page;
			$this->load->view('templates/header',$data);
			$this->load->view('pages/'.$page,$data);
		}
		else
		{
			$this->data['title'] = $page;
			$this->$page();
			
			$this->load->view('templates/header',$this->data);
			$this->load->view('templates/nav');
			$this->load->view('templates/sidebar');
			$this->load->view('templates/stylecustomizer');
			$this->load->view('templates/pageheader');
			$this->load->view('pages/'.$page,$this->data);
			$this->load->view('templates/quicksidebar.php');
			$this->load->view('templates/footer');
		}
	}
	function survey()
	{
		$this->load->model('constantmodel');
		$this->data['survey_Filestatus'] = $this->constantmodel->get_sub_constant(51);
		$this->data['survey_Eldercategory'] = $this->constantmodel->get_sub_constant(53);
		$this->data['survey_Maritalstatus'] = $this->constantmodel->get_sub_constant(2);
		$this->data['survey_Governorate'] = $this->constantmodel->get_sub_constant(22);
		$this->data['survey_Specialization'] = $this->constantmodel->get_sub_constant(24);
		$this->data['survey_Educationlevel'] = $this->constantmodel->get_sub_constant(23);
		$this->data['survey_CurrentJob'] = $this->constantmodel->get_sub_constant(25);
		$this->data['survey_PreviousJob'] = $this->constantmodel->get_sub_constant(26);
		$this->data['survey_InsuranceType'] = $this->constantmodel->get_sub_constant(7);
		$this->data['survey_Relationship'] = $this->constantmodel->get_sub_constant(4);
		$this->data['survey_Health'] = $this->constantmodel->get_sub_constant(28);
		$this->data['survey_IncomeSource'] = $this->constantmodel->get_sub_constant(29);
		$this->data['survey_HomeStatus'] = $this->constantmodel->get_sub_constant(30);
		$this->data['survey_HomeType'] = $this->constantmodel->get_sub_constant(31);
		$this->data['survey_CeilingType'] = $this->constantmodel->get_sub_constant(32);
		$this->data['survey_FurnitureLevel'] = $this->constantmodel->get_sub_constant(33);
		$this->data['survey_Roomtype'] = $this->constantmodel->get_sub_constant(34);
		$this->data['survey_Clothes'] = $this->constantmodel->get_sub_constant(35);
		$this->data['survey_Ventilation'] = $this->constantmodel->get_sub_constant(36);
		$this->data['survey_Lighting'] = $this->constantmodel->get_sub_constant(37);
		$this->data['survey_Choice'] = $this->constantmodel->get_sub_constant(38);
		$this->data['survey_Bathroom'] = $this->constantmodel->get_sub_constant(39);
		$this->data['survey_Higiene'] = $this->constantmodel->get_sub_constant(40);
		$this->data['survey_MedicationNeed'] = $this->constantmodel->get_sub_constant(41);
		$this->data['survey_MedicationType'] = $this->constantmodel->get_sub_constant(42);
		$this->data['survey_PsychologicalStatus'] = $this->constantmodel->get_sub_constant(44);
		$this->data['survey_ElderWorkAbility'] = $this->constantmodel->get_sub_constant(45);
		$this->data['survey_FamilyMember'] = $this->constantmodel->get_sub_constant(46);
		$this->data['survey_CashAidType'] = $this->constantmodel->get_sub_constant(47);
		$this->data['survey_NutritionType'] = $this->constantmodel->get_sub_constant(48);
		$this->data['survey_PsychologicalSupport'] = $this->constantmodel->get_sub_constant(49);
		$this->data['survey_HomeImprovRecomend'] = $this->constantmodel->get_sub_constant(50);

		$this->load->model('Employeemodel');
		$this->data['survey_employee_info'] = $this->Employeemodel->get_all_employee();
		
	}
	
/************************* ELDER TAB ************************/
	
	function addelder()
	{
		$this->load->model('Surveymodel');
		$output = $this->Surveymodel->insert_elder();
		
		header('Access-Control-Allow-Origin: *');
		header("Content-Type: application/json");
		echo json_encode($output);
	}
	
	function updateelder()
	{
		$this->load->model('Surveymodel');
		$output = $this->Surveymodel->update_elder();
		
		header('Access-Control-Allow-Origin: *');
		header("Content-Type: application/json");
		echo json_encode($output);
	}
	
	// check elder id 
	function check_elder_id()
	{
		$this->load->model('Eldermodel');
		$rec=$this->Eldermodel->get_elder_by_id();
		
		if (count($rec) == 0)
		{
			echo 0;
			return;
		}
		$output = array();
		foreach($rec as $row)
		{
			unset($temp); // Release the contained value of the variable from the last loop
			$temp = array();

			// It guess your client side will need the id to extract, and distinguish the ScoreCH data
			$temp['hdnFileId']   		= $row->file_id;
			$temp['FileStatus']  		= $row->file_status_id;
			$temp['drpEldercategory']  	= $row->elder_category_id;
			$temp['txtFname'] 	 		= $row->first_name;
			$temp['txtMname'] 	 		= $row->middle_name;
			$temp['txtThname'] 	 		= $row->third_name;
			$temp['txtLname'] 	 		= $row->last_name;
			$temp['dpDob'] 		 		= $row->dob;
			$temp['rdSex'] 		 		= $row->sex_id;
			$temp['drpElderstatus'] 	= $row->status_id;
			$temp['drpGovernorate'] 	= $row->governorate_id;
			$temp['txtRegion'] 			= $row->region;
			$temp['txtFulladdress'] 	= $row->full_address;
			$temp['txtPhone'] 			= $row->phone;
			$temp['txtMobile1'] 		= $row->mobile_first;
			$temp['txtMobile2'] 		= $row->mobile_second;
			$temp['drpEducationlevel'] 	= $row->education_level_id;
			$temp['drpSpecialization'] 	= $row->specialization_id;
			$temp['drpCurrentjob'] 		= $row->current_job_id;
			$temp['drpPreviousjob'] 	= $row->previous_job_id;
			$temp['drpInsurence'] 		= $row->insurance_type_id;
			$temp['DeathDate'] 			= $row->death_date;
			array_push($output,$temp);
			
			
			header('Access-Control-Allow-Origin: *');
			header("Content-Type: application/json");
			echo json_encode($output);
		}
	
	
		
		
	}
/*********************** END ELDER TAB ************************/
/************************* VISIT TAB **************************/

	function updatesurvey()
	{
		$this->load->model('Surveymodel');
		$this->Surveymodel->update_survey();
	}
	
//**************************family_member_id*************************

	function addfamilymember()
	{
		$this->load->model('Surveymodel');
		$this->Surveymodel->insert_familyMember();
	}
	function updatefamilymember()
	{
		$this->load->model('Surveymodel');
		$this->Surveymodel->update_familyMember();
	}

//*************************check family member id ****************************
function check_familymember_id()
	{
		$this->load->model('Surveymodel');
		$rec=$this->Surveymodel->check_familyMember_id();
		
		if (count($rec) == 0)
		{
			echo 0;
			return;
		}
		$output = array();
		foreach($rec as $row)
		{
			unset($temp); // Release the contained value of the variable from the last loop
			$temp = array();

			// It guess your client side will need the id to extract, and distinguish the ScoreCH data
		
		$temp['member_name'] = $row->member_name;
		$temp['member_sex_id'] = $row->member_sex_id;
		$temp['relationship_id'] = $row->relationship_id;
		$temp['status_id'] = $row->status_id;
		$temp['dob'] = $row->dob;
		$temp['education_level'] = $row->education_level;
		$temp['health_status_id'] = $row->health_status_id;
		$temp['income_shekel'] = $row->income_shekel;
		$temp['job'] = $row->job;
		
			array_push($output,$temp);
			
			
			header('Access-Control-Allow-Origin: *');
			header("Content-Type: application/json");
			echo json_encode($output);
		}
}	
//**************************family_member_id*************************
//************************** survey procedure*************************

	/*function addsurvey()
	{
		$this->load->model('Surveymodel');
		$result->Surveymodel->insert_survey();
		echo $result;
	}*/
	

function get_survey_data()
	{
		$this->load->model('Surveymodel');
		$rec=$this->Surveymodel->get_survey_info();
		$SurveyId=0;
		if (count($rec) == 0)
		{
			echo 0;
			return;
		}
		$output = array();
		foreach($rec as $row)
		{
			unset($temp); // Release the contained value of the variable from the last loop
			$temp = array();

			// It guess your client side will need the id to extract, and distinguish the ScoreCH data
		
		$temp['SurveyId'] = $row->survey_id;
		$SurveyId=$row->survey_id;
		$temp['dpVisitdate'] = $row->visit_date;
		$temp['txtVisittime'] = $row->visit_time;
		$temp['txtVisitendtime'] = $row->visit_end_time;
		$temp['drpResearcher'] = $row->researcher_id;
		$temp['drpResearcherass1'] = $row->researcher_assistant_fst_id;
		$temp['drpResearcherass2'] = $row->researcher_assistant_sec_id;
			array_push($output,$temp);
			
			
			header('Access-Control-Allow-Origin: *');
			header("Content-Type: application/json");
			echo json_encode($output);
		}
		

}	

//*************************end survey fuction****************************
//************************** home status function*************************

function addhomeStatus()
	{
		$this->load->model('Surveymodel');
		$this->Surveymodel->insert_homeStatus();
		
	}
function updatehomeStatus()
	{
		$this->load->model('Surveymodel');
		$this->Surveymodel->update_homeStatus();
	}
/*
function get_homeStatus_data()
	{
		$this->load->model('Surveymodel');
		$rec=$this->Surveymodel->get_homeStatus_info($SurveyId);
		
		if (count($rec) == 0)
		{
			echo 0;
			return;
		}
		$output = array();
		foreach($rec as $row)
		{
			unset($temp); // Release the contained value of the variable from the last loop
			$temp = array();

			// It guess your client side will need the id to extract, and distinguish the ScoreCH data
		
		$temp['drpHomeStatus'] = $row->home_situation_id;
		$temp['drpHomeType'] = $row->home_type_id;
		$temp['drpCeilingType'] = $row->ceiling_type_id;
		$temp['drpFurnitureLevel'] = $row->furniture_level_id;
		
			array_push($output,$temp);
			
			
			header('Access-Control-Allow-Origin: *');
			header("Content-Type: application/json");
			echo json_encode($output);
		}
}	
*/
//*********************** Elder room status function****************	//

function addelderRoom()
	{
		$this->load->model('Surveymodel');
		$this->Surveymodel->insert_elderRoom();
		
	}
function updateelderRoom()
	{
		$this->load->model('Surveymodel');
		$this->Surveymodel->update_elderRoom();
	}
//****************end elder room status function******//

//*********************** Elder family relation function****************	//

function addelderFamRel()
	{
		$this->load->model('Surveymodel');
		$this->Surveymodel->insert_elderFamilyRelation();
		
	}
function updateelderFamRel()
	{
		$this->load->model('Surveymodel');
		$this->Surveymodel->update_elderFamilyRelation();
	}

//*********************** Elder family relation function****************	//

function addelifeImprov()
	{
		$this->load->model('Surveymodel');
		$this->Surveymodel->insert_lifeImprovement();
		
	}
function updatelifeImprov()
	{
		$this->load->model('Surveymodel');
		$this->Surveymodel->update_lifeImprovement();
	}
	
	
}

?>