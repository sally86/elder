<?php
class Loginmodel extends CI_Model
{
	
	// Get All Users
	function verifyuser()
	{
		extract($_POST);
		
		/*$this->db->from('users_tb');
		$this->db->where("user_name", $username);
		$this->db->where('passward', MD5($password));*/
		
		
	$myquery = "SELECT  u.user_name, u.passward, u.employee_id, u.is_active, u.user_type_id, e.name
				  FROM  users_tb u, employee_tb e
				 WHERE  u.employee_id = e.employee_id
				   AND  u.user_name = '".$username."'
				  AND 	u.passward = '".MD5($password)."'";
		
		$res = $this->db->query($myquery);
		
		//$query = $res->result();
		//$query = $this->db->get();
		
		
		if ($res->num_rows() > 0)
		{
			
			$result = $res->result();
			$sess_array = array();
			 foreach($result as $row)
			 {
				 if ($row->is_active == 1)
				 {
					 $sess_array = array(
					   //'id' => $row->id,
					   'username' => $row->user_name,
					   'name' => $row->name
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