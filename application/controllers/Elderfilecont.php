<?php
class Elderfilecont extends CI_Controller 
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
	function elderfile()
	{
		$this->load->model('constantmodel');
		$this->data['doc_type'] = $this->constantmodel->get_sub_constant(27);
		
	}
	
	function uploaddoc()
	{
		$this->load->model('elderfilemodel');
		$this->elderfilemodel->elder_doc_insert();		
	}
	
	function deletedoc()
	{
		$this->load->model('elderfilemodel');
		$this->elderfilemodel->elder_doc_delete();		
	}
}
?>