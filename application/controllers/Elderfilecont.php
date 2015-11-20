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
		
		$this->load->model('elderfilemodel');
		$this->data['elder_docs'] = $this->elderfilemodel->get_elder_doc(1);
		
	}
	
	function uploaddoc()
	{
		
		$this->load->model('elderfilemodel');
		$this->elderfilemodel->elder_doc_insert();
		
		extract($_POST);
		$rec = $this->data['elder_docs'] = $this->elderfilemodel->get_elder_doc($fileid);
		
		foreach ($rec as $elder_docs_row)
		{			
			echo '<tr>';
		    echo '<td>'.$elder_docs_row->doc_type.'</td>';
		    echo '<td><a href="/elder/uploads/'.$elder_docs_row->doc_path.'">'
		   			   .$elder_docs_row->doc_path.'</a></td>';
		   	echo '<td><button id="btnDeletedoc" name="btnDeletedoc" type="button" 
					class="btn btn-circle red-sunglo btn-sm" 
					onclick="deleteDoc('.$elder_docs_row->elder_doc_id.',\''.$elder_docs_row->doc_path.'\')">
					  <i id="iConst" class="fa fa-close"></i>
					 </button></td>';
			echo '</tr>';
		}

	}
	
	function deletedoc()
	{
		
		
		$this->load->model('elderfilemodel');
		$this->elderfilemodel->elder_doc_delete();
		
		extract($_POST);
		$rec = $this->data['elder_docs'] = $this->elderfilemodel->get_elder_doc($fileid);
		
		foreach ($rec as $elder_docs_row)
		{			
			echo '<tr>';
		    echo '<td>'.$elder_docs_row->doc_type.'</td>';
		    echo '<td><a href="/elder/uploads/'.$elder_docs_row->doc_path.'">'
		   			   .$elder_docs_row->doc_path.'</a></td>';
		   	echo '<td><button id="btnDeletedoc" name="btnDeletedoc" type="button" 
					class="btn btn-circle red-sunglo btn-sm" 
					onclick="deleteDoc('.$elder_docs_row->elder_doc_id.',\''.$elder_docs_row->doc_path.'\')">
					  <i id="iConst" class="fa fa-close"></i>
					 </button></td>';
			echo '</tr>';
		}
	}
}
?>