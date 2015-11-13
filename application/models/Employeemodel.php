<?php

class Employeemodel extends CI_Model
{
	// Get All Employee
	function get_all_employee()
	{
		$this->db->from('employee_tb');
		$this->db->order_by("is_active", "DESC");
		$this->db->order_by("name", "ASC");
		
		$query = $this->db->get();
		
		return $query->result();
	}
	
	// Search Employee 
	function search_employee($empname)
	{
		$myquery = "SELECT employee_id, national_id, emp_id, name, sex_id, job_title_id, mobile, phone, email, is_active
				  FROM employee_tb
				  WHERE name LIKE '".$empname."%'
				  ORDER BY is_active DESC, name";
		
		$res = $this->db->query($myquery);
		return $res->result();
	}
	
	// Insert New Employee
	function insert_employee()
	{
		extract($_POST);

		$data['national_id'] = $hdnBookingcode;
		$data['emp_id'] = $sev_code;
		$data['sex_id'] = $sev_price;
		$data['job_title_id'] = $hdnBookingcode;
		$data['mobile'] = $sev_code;
		$data['phone'] = $sev_price;
		$data['email'] = $sev_price;
		$data['is_active'] = $sev_price;
		
		$this->db->insert('employee_tb',$data);
	}
}
?>