<?php

class Elderfilemodel extends CI_Model
{
	// Get Elder Docs
	function get_elder_doc($fileid)
	{
		$myquery = "SELECT doc.elder_doc_id, doc.file_id, doc.doc_type_id, doctype.sub_constant_name doc_type , doc.doc_path,
							doc.created_on, doc.created_by
					  FROM elder_doc_tb doc, sub_constant_tb doctype
					 WHERE doc.doc_type_id = doctype.sub_constant_id
					   AND doc.file_id = ".$fileid;
		
		$res = $this->db->query($myquery);
		return $res->result();
	}
	
	function elder_doc_insert()
	{
		extract($_POST);
		
		$newfilename = $fileid . mt_rand() . '.' .pathinfo($filename,PATHINFO_EXTENSION);
		
		$data['file_id']     = $fileid;
		$data['doc_type_id'] = $doctype;
		$data['doc_path']    = $newfilename;
		//$data['created_by'] = $_SESSION['username'];
		
		$this->db->insert('elder_doc_tb',$data);
		
		
		// Upload File
		$target_dir = $_SERVER["DOCUMENT_ROOT"]."/elder/uploads/";
		$target_file = $target_dir . $newfilename;
		
		move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file);
		
	}
	
	// Delete Doc
	function elder_doc_delete()
	{
		extract($_POST);
		
		$this->db->where('elder_doc_id', $elderdocid);
		$this->db->delete('elder_doc_tb');
		
		// Delete File
		unlink($_SERVER["DOCUMENT_ROOT"]."/elder/uploads/".$filename);
	}
	
}
?>