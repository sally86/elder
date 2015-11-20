<?php

class Elderfilemodel extends CI_Model
{
	function elder_doc_insert()
	{
		extract($_POST);
		
		$data['file_id'] = 1;
		$data['doc_type_id'] = $drpDoctype;
		$data['doc_path'] = $flFilename;
		//$data['created_by'] = $_SESSION['username'];
		
		$this->db->insert('elder_doc_tb',$data);
	}
	
	function elder_doc_delete()
	{
		extract($_POST);
		
		$this->db->where('elder_doc_id', $elderdocid);
		$this->db->delete('elder_doc_tb');
	}
}
?>