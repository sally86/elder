<?php

class Eldermodel extends CI_Model
{
	// Get All Employee
		
	function get_search_elder($requestData)
	{
		$columns = array( 
			1 => 'elder_id',
			2 => 'name',
			3 => 'phone', 
			4 => 'mobile_first',
			5 => 'mobile_second',
			6 => 'governorate',
			7 => 'isDead');
		
		$myquery = "SELECT 	elder_id, first_name||' '||middle_name||' '||third_name||' '||last_name as name,
							governorate_id , phone,mobile_first, mobile_second,
							CASE WHEN death_date=null then 0 ELSE  1 END AS  isDead,
							governconst.sub_constant_name as governorate 
 					FROM 	elder_tb ,sub_constant_tb governconst
					WHERE 	elder_tb.governorate_id=governconst.sub_constant_id";
		
		if(isset($requestData['txtElderid']) && $requestData['txtElderid'] !='')
		{
			$myquery = $myquery." AND elder_id = ".$requestData['txtElderid'];
		}
		
		if(isset($requestData['txtName']) && $requestData['txtName'] !='')
		{
			$myquery = $myquery." AND name LIKE '%".$requestData['txtName']."%' ";
		}
		if(isset($requestData['txtPhone']) && $requestData['txtPhone'] !='')
		{
			$myquery = $myquery." AND phone = ".$requestData['txtPhone'];
		}
		if(isset($requestData['txtMobile1']) && $requestData['txtMobile1'] !='')
		{
			$myquery = $myquery." AND mobile_first = ".$requestData['txtMobile1'];
		}
		if(isset($requestData['txtMobile2']) && $requestData['txtMobile2'] !='')
		{
			$myquery = $myquery." AND mobile_second = LIKE '%".$requestData['txtMobile2']."%' ";
		}
		
		if(isset($requestData['drpGovernorate']) && $requestData['drpGovernorate'] !='')
		{
			$myquery = $myquery." AND governorate_id = ".$requestData['drpGovernorate'];
		}
		if(isset($requestData['isDead']) && $requestData['isDead'] !='')
		{ if(isset($requestData['isDead'])=="pending")
			{
			$myquery = $myquery." AND death_date is null ";
			}
			else if(isset($requestData['isDead'])=="closed")
			{
			$myquery = $myquery." AND death_date is not null  ";
			}
		}
		$myquery = $myquery." ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir'].
					" LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		
		$res = $this->db->query($myquery);
		return $res->result();
		
	}
	function count_get_search_elder($requestData)
	{

		$myquery = "SELECT 	elder_id, first_name||' '||middle_name||' '||third_name||' '||last_name as name,
							governorate_id , phone,mobile_first, mobile_second,
							CASE WHEN death_date=null then 0 ELSE  1 END AS  isDead,
							governconst.sub_constant_name as governorate 
 					FROM 	elder_tb ,sub_constant_tb governconst
					WHERE 	elder_tb.governorate_id=governconst.sub_constant_id";
		
		if(isset($requestData['txtElderid']) && $requestData['txtElderid'] !='')
		{
			$myquery = $myquery." AND elder_id = ".$requestData['txtElderid'];
		}
		
		if(isset($requestData['txtName']) && $requestData['txtName'] !='')
		{
			$myquery = $myquery." AND name LIKE '%".$requestData['txtName']."%' ";
		}
		if(isset($requestData['txtPhone']) && $requestData['txtPhone'] !='')
		{
			$myquery = $myquery." AND phone = ".$requestData['txtPhone'];
		}
		if(isset($requestData['txtMobile1']) && $requestData['txtMobile1'] !='')
		{
			$myquery = $myquery." AND mobile_first = ".$requestData['txtMobile1'];
		}
		if(isset($requestData['txtMobile2']) && $requestData['txtMobile2'] !='')
		{
			$myquery = $myquery." AND mobile_second = LIKE '%".$requestData['txtMobile2']."%' ";
		}
		
		if(isset($requestData['drpGovernorate']) && $requestData['drpGovernorate'] !='')
		{
			$myquery = $myquery." AND governorate_id = ".$requestData['drpGovernorate'];
		}
		if(isset($requestData['isDead']) && $requestData['isDead'] !='')
		{ if(isset($requestData['isDead'])=="pending")
		{
			$myquery = $myquery." AND death_date is null ";
		}
		else if(isset($requestData['isDead'])=="closed")
		{
			$myquery = $myquery." AND death_date is not null  ";
		}
		}
		
		$res = $this->db->query($myquery);
		return count($res->result());
		
	}

}
?>