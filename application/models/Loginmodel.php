<?php
class Loginmodel extends CI_Model
{
	
	// Get All Users
	function verifyuser()
	{
		extract($_POST);
		
		$this->db->from('users_tb');
		$this->db->where("user_name", $username);
		$this->db->where('passward', MD5($password));
		
		$query = $this->db->get();
		
		
		if ($query->num_rows() > 0)
		{
			
			$result = $query->result();
			$sess_array = array();
			 foreach($result as $row)
			 {
				 if ($row->is_active == 1)
				 {
					 $sess_array = array(
					   //'id' => $row->id,
					   'username' => $row->user_name
					 );
					 /*$menu_array = array(
										 
					 );*/
					 
					 $this->session->set_userdata('logged_in', $sess_array);
					 return 1;
				 }
				 else
					return 2;
			   
			 }
			 
		}
		else
			return 0;
		
	}
}
?>