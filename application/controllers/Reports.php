<?php
class Reports extends CI_Controller 
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
		else if($this->session->userdata('logged_in'))
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
		else
   		{
     		//If no session, redirect to login page
     		redirect('login', 'refresh');
   		}
	}
	
	// Elder Person Info Report
	function elderinforpt()
	{
		$this->load->model('constantmodel');

		$this->data['elder_governorate'] = $this->constantmodel->get_sub_constant(22);
		$this->data['elder_status'] 	 = $this->constantmodel->get_sub_constant(2);
	}
	function elderinfogriddata()
	{
		$this->load->model('reportsmodel');
		$rec = $this->reportsmodel->get_eldr_info_rpt($_REQUEST);
		
		$i = 1;
		$data = array();
		foreach($rec as $row)
		{
			$nestedData=array();
						
			$nestedData[] = $i++;
			$nestedData[] = $row->file_id;
			$nestedData[] = $row->elder_id;
			$nestedData[] = $row->name;
			$nestedData[] = $row->age;
			$nestedData[] = $row->status;
			$nestedData[] = $row->full_address;
			$nestedData[] = $row->phone;
			$nestedData[] = $row->mobile_first;
			$nestedData[] = $row->mobile_second;
			$nestedData[] = $row->governorate;
			$nestedData[] = '';
			
			$data[] = $nestedData;
		} // End Foreach
		
		$totalFiltered = count($rec);
		$totalData = count($rec);
		//$records["draw"] = $sEcho;
		$json_data = array(
					"draw"            => intval( $_REQUEST['draw'] ),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw. 
					"recordsTotal"    => intval( $totalData ),  		// total number of records
					"recordsFiltered" => intval( $totalFiltered ),		// total number of records after searching, if there is no searching then totalFiltered = totalData
					"data"            => $data   						// total data array
					);
		
		echo json_encode($json_data);  // send data as json format
	}
	
	
	
	//******************************* Genger Report ****************************//
	function genderrpt()
	{
		$this->load->model('constantmodel');

		$this->data['elder_governorate'] = $this->constantmodel->get_sub_constant(22);
		$this->data['elder_sex'] 	 = $this->constantmodel->get_sub_constant(1);
	}
	function gendergriddata()
	{
		$this->load->model('reportsmodel');
		$rec = $this->reportsmodel->get_eldr_gender_rpt($_REQUEST);
		
		$i = 1;
		$data = array();
		foreach($rec as $row)
		{
			$nestedData=array();
						
			$nestedData[] = $i++;
			$nestedData[] = $row->file_id;
			$nestedData[] = $row->elder_id;
			$nestedData[] = $row->name;
			$nestedData[] = $row->sex;
			$nestedData[] = $row->governorate;
			$nestedData[] = '';
			
			$data[] = $nestedData;
		} // End Foreach
		
		$totalFiltered = count($rec);
		$totalData = count($rec);
		//$records["draw"] = $sEcho;
		$json_data = array(
					"draw"            => intval( $_REQUEST['draw'] ),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw. 
					"recordsTotal"    => intval( $totalData ),  		// total number of records
					"recordsFiltered" => intval( $totalFiltered ),		// total number of records after searching, if there is no searching then totalFiltered = totalData
					"data"            => $data   						// total data array
					);
		
		echo json_encode($json_data);  // send data as json format
	}
	
	
	//******************************* Education Report ****************************//
	
	function edurpt()
	{
		$this->load->model('constantmodel');

		$this->data['elder_specialization'] = $this->constantmodel->get_sub_constant(24);
		$this->data['elder_currentjob'] = $this->constantmodel->get_sub_constant(25);
		$this->data['elder_previousjob'] = $this->constantmodel->get_sub_constant(26);
		$this->data['elder_governorate'] = $this->constantmodel->get_sub_constant(22);
		
	}
	function edugriddata()
	{
		$this->load->model('reportsmodel');
		$rec = $this->reportsmodel->get_eldr_edu_rpt($_REQUEST);
		
		$i = 1;
		$data = array();
		foreach($rec as $row)
		{
			$nestedData=array();
						
			$nestedData[] = $i++;
			$nestedData[] = $row->file_id;
			$nestedData[] = $row->elder_id;
			$nestedData[] = $row->name;
			$nestedData[] = $row->phone;
			$nestedData[] = $row->mobile_first;
			$nestedData[] = $row->mobile_second;
			$nestedData[] = $row->specialization;
			$nestedData[] = $row->current_job;
			$nestedData[] = $row->previous_job;
			$nestedData[] = $row->governorate;
			$nestedData[] = '';
			
			$data[] = $nestedData;
		} // End Foreach
		
		$totalFiltered = count($rec);
		$totalData = count($rec);
		//$records["draw"] = $sEcho;
		$json_data = array(
					"draw"            => intval( $_REQUEST['draw'] ),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw. 
					"recordsTotal"    => intval( $totalData ),  		// total number of records
					"recordsFiltered" => intval( $totalFiltered ),		// total number of records after searching, if there is no searching then totalFiltered = totalData
					"data"            => $data   						// total data array
					);
		
		echo json_encode($json_data);  // send data as json format
	}
	
	//******************************* Income Report ****************************//
	function incomerpt()
	{
		$this->load->model('constantmodel');
		
		$this->data['elder_incomesource'] = $this->constantmodel->get_sub_constant(29);
		$this->data['elder_governorate'] = $this->constantmodel->get_sub_constant(22);
	}
	function incomegriddata()
	{
		$this->load->model('reportsmodel');
		$rec = $this->reportsmodel->get_income_rpt($_REQUEST);
		
		$i = 1;
		$data = array();
		foreach($rec as $row)
		{
			$nestedData=array();
						
			$nestedData[] = $i++;
			$nestedData[] = $row->file_id;
			$nestedData[] = $row->name;
			$nestedData[] = $row->phone;
			$nestedData[] = $row->mobile_first;
			$nestedData[] = $row->mobile_second;
			$nestedData[] = $row->count_family_member;
			$nestedData[] = $row->resource;
			$nestedData[] = $row->total_income;
			$nestedData[] = $row->elder_portion;
			$nestedData[] = $row->governorate;
			$nestedData[] = '';
			
			$data[] = $nestedData;
		} // End Foreach
		
		$totalFiltered = count($rec);
		$totalData = count($rec);
		//$records["draw"] = $sEcho;
		$json_data = array(
					"draw"            => intval( $_REQUEST['draw'] ),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw. 
					"recordsTotal"    => intval( $totalData ),  		// total number of records
					"recordsFiltered" => intval( $totalFiltered ),		// total number of records after searching, if there is no searching then totalFiltered = totalData
					"data"            => $data   						// total data array
					);
		
		echo json_encode($json_data);  // send data as json format
	}
}
?>