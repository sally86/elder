<?php
class Constantmodel extends CI_Model
{
	// Get Constants
	function get_constant()
	{
		$this->db->from('constant_tb');
		$this->db->order_by("constant_name", "ASC");
		
		$query = $this->db->get();
		
		return $query->result();
	}
	
	// Get Sub Constant By Constant
	function get_sub_constant($constant_id)
	{
		$this->db->from('sub_constant_tb');
		$this->db->where('constant_id',$constant_id);
		$this->db->order_by("sub_constant_name", "ASC");
		
		$query = $this->db->get();
		
		return $query->result();
	}
	
	// Insert Constant
	function constant_insart()
	{
		extract($_POST);
		$data['constant_name'] = $txtConstantName;
		
		$this->db->insert('constant_tb',$data);
	}
	
	// Insert Sub Constant
	function sub_constant_insart()
	{
		extract($_POST);
		$data['constant_id'] = $hdnConstantid;
		$data['sub_constant_name'] = $txtSubConstantName;
		
		$this->db->insert('sub_constant_tb',$data);
	}
	
	// Update Constant
	function constant_update()
	{
		extract($_POST);
		$data['constant_id'] = $hdnConstantid;
		$data['constant_name'] = $txtConstantName;
		
		$this->db->where('constant_id',$hdnConstantid);
		$this->db->update('constant_tb',$data);
	}
	
	// Update Sub Constant
	function sub_constant_update()
	{
		extract($_POST);
		$data['sub_constant_id'] = $hdnSubConstid;
		$data['sub_constant_name'] = $txtSubConstantName;
		
		$this->db->where('sub_constant_id',$hdnSubConstid);
		$this->db->update('sub_constant_tb',$data);
	}
}
?>