<?php
class Followupcont extends CI_Controller 
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
	function Followupform()
	{
		
		$this->load->model('Employeemodel');
		$this->data['followup_research_info'] = $this->Employeemodel->get_all_employee();
		
		if(isset($_SESSION['update']))
		{
			$this->load->model('Followupmodel');
			$this->data['followup_info'] =$this->Followupmodel->get_followup_by_elderid($_SESSION['update']);
			$this->data['elder_info'] =$this->Followupmodel->get_elder_byid($_SESSION['update']);
			
		}
		
	}
	
/************************* ELDER TAB ************************/
	
	function addfollowup()
	{
		$this->load->model('Followupmodel');
		$this->Followupmodel->insert_followup();
		
		
	}
	
	function updatefollowup()
	{
		$this->load->model('Followupmodel');
		$this->Followupmodel->update_followup();
		
		
	}
	function deletefollowup()
	{
		$this->load->model('Followupmodel');
		$this->Followupmodel->delete_followup();
		
		
	}
	function senddata()
{
		extract($_POST);
		$_SESSION['update'] = $elder_id;
}

	//************************check elder id 
		function get_elder_info()
	{
		$this->load->model('Followupmodel');
		$rec=$this->Followupmodel->get_elder_by_id();
		
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
			$temp['txtName'] 	 		= $row->name;
			
			array_push($output,$temp);
			
			
			header('Access-Control-Allow-Origin: *');
			header("Content-Type: application/json");
			echo json_encode($output);
		}
			
	}
//end 	check elder id 
}

?>